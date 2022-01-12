cls
Set-PSDebug -off

##CONFIG##
$APIKey = ""

##PROCESS##
$OctopusURL = "http://octopus"
$header = @{ "X-Octopus-ApiKey" = $APIKey }



#get environments
$environments = (Invoke-WebRequest "$OctopusURL/api/environments/all" -Headers $header).content | ConvertFrom-Json

$EnvironmentDetails = @()
foreach ($environment in $environments) {
    
    $EnvironmentDetails += @{
        EnvironmentId   = $environment.Id
        EnvironmentName = $environment.Name}
}

$EnvironmentDetails | select `
     @{Name='EnvironmentId'  ;Expression={$_.EnvironmentId}  ;} `
    ,@{Name='EnvironmentName';Expression={$_.EnvironmentName};} `
| export-csv -Path "C:\temp\OctopusScrape\EnvironmentDetails.csv"



#get lifecycles
$lifecycles = (Invoke-WebRequest "$OctopusURL/api/lifecycles/all" -Headers $header).content | ConvertFrom-Json

$LifecyclePhaseEnvironments = @()
foreach ($lifecycle in $lifecycles) {
    
    $phases = $lifecycle.Phases

    foreach ($phase in $phases) {
        
        $envs = $phase.OptionalDeploymentTargets
        if (!$envs) { $envs = "N/A" }

        foreach ($env in $envs.split(',')) {

            $LifecyclePhaseEnvironments += @{
                LifecycleId   = $lifecycle.Id
                LifecycleName = $lifecycle.Name
                PhaseName     = $phase.Name
                EnvironmentId = $env}
        }
    }
}

$LifecyclePhaseEnvironments | select `
     @{Name='LifecycleId'  ;Expression={$_.LifecycleId}  ;} `
    ,@{Name='LifecycleName';Expression={$_.LifecycleName};} `
    ,@{Name='PhaseName'    ;Expression={$_.PhaseName}    ;} `
    ,@{Name='EnvironmentId';Expression={$_.EnvironmentId};} `
| export-csv -Path "C:\temp\OctopusScrape\LifecyclePhaseEnvironments.csv"



#get machine roles and environments
$MachineRoles        = @()
$MachineEnvironments = @()

foreach ($environment in $environments) {
    
    $machinelink = $environment.Links.Machines
    $machines = (Invoke-WebRequest ("$OctopusURL$machinelink") -Headers $header).content|ConvertFrom-Json

    foreach ($Machine in $machines) {

        $roles = $Machine.Items.'Roles'
        if (!$roles) {$roles = "N/A"}

        foreach ($role in $roles.split(',') ) {

            $MachineRoles += @{
                MachineId   = $Machine.Id
                MachineName = $Machine.Name
                RoleName    = $role}
        }

        $envs = $Machine.Items.'EnvironmentIds'
        if (!$envs) { $envs = "N/A" }

        foreach ($env in $envs.split(',') ) {

            $MachineEnvironments += @{
                MachineId     = $Machine.Id
                MachineName   = $Machine.Name
                EnvironmentId = $env}
        }
    }
}

$MachineRoles | select `
     @{Name='MachineId'  ;Expression={$_.MachineId}  ;} `
    ,@{Name='MachineName';Expression={$_.MachineName};} `
    ,@{Name='RoleName'   ;Expression={$_.RoleName}   ;} `
| export-csv -Path "C:\temp\OctopusScrape\MachineRoles.csv"


$MachineEnvironments | select `
     @{Name='MachineId'    ;Expression={$_.MachineId}    ;} `
    ,@{Name='MachineName'  ;Expression={$_.MachineName}  ;} `
    ,@{Name='EnvironmentId';Expression={$_.EnvironmentId};} `
| export-csv -Path "C:\temp\OctopusScrape\MachineEnvironments.csv"



#get project information, project deployment process step roles, and project deployment process step environments
$projects = (Invoke-WebRequest "$OctopusURL/api/Projects/all" -Headers $header).content | ConvertFrom-Json

$ProjectDetails          = @()
$ProjectStepRoles        = @()
$ProjectStepEnvironments = @()

foreach ($project in $projects) {
    
    $ProjectDetails += @{
        ProjectId   = $project.Id
        ProjectName = $project.Name
        LifecycleId = $project.LifecycleId}

    $deploymentprocess = (Invoke-WebRequest "$OctopusURL$($project.Links.DeploymentProcess)" -Headers $header).content | ConvertFrom-Json 
    #$project.Links.DeploymentProcess = (Invoke-WebRequest "$OctopusURL$($project.Links.DeploymentProcess)" -Headers $header).content | ConvertFrom-Json 

    foreach ($step in $deploymentprocess.Steps) {

        $targetroles = $step.Properties.'Octopus.Action.TargetRoles'
        if (!$targetroles) { $targetroles = "N/A" }

        foreach ($role in $targetroles.split(',') ) {

            $ProjectStepRoles += @{
                ProjectId   = $project.Id
                ProjectName = $project.Name
                StepId      = $step.Id
                StepName    = $step.Name
                StepRole    = $role}

        }
        
        $envs = $step.Actions.'Environments'
        if (!$envs) { $envs = "All" }

        foreach ($env in $envs.split(',') ) {

            $ProjectStepEnvironments += @{
                ProjectId       = $project.Id
                ProjectName     = $project.Name
                StepId          = $step.Id
                StepName        = $step.Name
                StepEnvironment = $env}

        }
    }
}

$ProjectDetails | select `
     @{Name='ProjectId'  ;Expression={$_.ProjectId}  ;} `
    ,@{Name='ProjectName';Expression={$_.ProjectName};} `
    ,@{Name='LifecycleId';Expression={$_.LifecycleId};} `
| export-csv -Path "C:\temp\OctopusScrape\ProjectDetails.csv"

$ProjectStepRoles | select `
     @{Name='ProjectId'  ;Expression={$_.ProjectId}  ;} `
    ,@{Name='ProjectName';Expression={$_.ProjectName};} `
    ,@{Name='StepId'     ;Expression={$_.StepId}     ;} `
    ,@{Name='StepName'   ;Expression={$_.StepName}   ;} `
    ,@{Name='StepRole'   ;Expression={$_.StepRole}   ;} `
| export-csv -Path "C:\temp\OctopusScrape\ProjectStepRoles.csv"

$ProjectStepEnvironments | select `
     @{Name='ProjectId'      ;Expression={$_.ProjectId}      ;} `
    ,@{Name='ProjectName'    ;Expression={$_.ProjectName}    ;} `
    ,@{Name='StepId'         ;Expression={$_.StepId}         ;} `
    ,@{Name='StepName'       ;Expression={$_.StepName}       ;} `
    ,@{Name='StepEnvironment';Expression={$_.StepEnvironment};} `
| export-csv -Path "C:\temp\OctopusScrape\ProjectStepEnvironments.csv"
