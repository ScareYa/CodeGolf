using System;
using System.Drawing;
using Console = Colorful.Console;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace LearningWeek1
{
    class Program
    {
        private const int waitDots = 3;
        private static string[] appHeaderArr      = { "MediaDB v1.0", "It is " + DateTime.Now.ToShortTimeString() + " on the " + DateTime.Now.ToShortDateString(), "\n", "Please enter your username:" };
        private static string[] mainMenuHeaderArr = { "Main Menu:", "=========", "\n", "Options:", "=======" };
        private static string[] mainMenuUserArr   = { "(1) List", "(2) Add", "(0) Quit", "\n", "Please enter a number..." };
        private static string[] mainMenuAdminArr  = { "(1) List", "(2) Add", "(3) Settings", "(4) User Admin", "(0) Quit", "\n", "Please enter a number..." };

        private static List<Film> FilmLibrary = new List<Film>();
        private static void DefaultFilms()
        {
            FilmLibrary.Add(new Film("The One", 7));
            FilmLibrary.Add(new Film("City of Ember", 9));
            FilmLibrary.Add(new Film("Ghost in the Shell", 5));
            FilmLibrary.Add(new Film("Zatoichi", 8));
        }

        static void Main(string[] args)
        {
            DefaultFilms();
            //Console.BackgroundColor = ConsoleColor.Cyan;
            appHeaderArr.ToList().ForEach(Console.WriteLine);
            string userName = Console.ReadLine();
            Console.Clear();

            int i = 1;
            Console.WriteAscii("Welcome");
            Console.WriteAscii(userName);
            while (i <= waitDots)
            {
                Console.Write(".");
                Thread.Sleep(500);
                i++;
            }
            Console.Clear();

            //Console.WriteWithGradient(mainMenuHeaderArr.ToList(), Color.Yellow, Color.IndianRed, 14);
            mainMenuHeaderArr.ToList().ForEach(Console.WriteLine);
            //mainMenuHeaderArr.ToList().ForEach(Console.WriteLine);
            Console.ReplaceAllColorsWithDefaults();
            if (userName.ToLower() == "admin") { mainMenuAdminArr.ToList().ForEach(Console.WriteLine); }
            else                               {  mainMenuUserArr.ToList().ForEach(Console.WriteLine); }

            int optionChoice = int.Parse(Console.ReadLine());
            Console.Clear();

            switch (optionChoice)
            {
                case 1:
                    Console.WriteLine("List of all films:");
                    foreach (Film f in FilmLibrary) { Console.WriteLine("{0,-40}{1,2}", f.GetTitle(), f.GetRating()); };
                    //foreach (Film f in FilmLibrary) { Console.WriteLine(f.GetTitle()); };
                    break;
                case 2: Console.WriteLine("Add");        break;
                case 3: Console.WriteLine("Settings");   break;
                case 4: Console.WriteLine("User Admin"); break;
                case 0: Console.WriteLine("Quit");       break;
            }
            Console.ReadLine();
        }
    }
}
