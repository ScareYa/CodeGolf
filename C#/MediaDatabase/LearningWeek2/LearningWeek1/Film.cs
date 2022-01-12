using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LearningWeek1
{
    class Film
    {
        private string _title = "";
        private Int16 _rating = 0;

        public Film(string Title, Int16 Rating)
        {
            //Films = new List<string>();
            _title  = Title;
            _rating = Rating;
        }

        public string GetTitle()                 { return _title;       }
        public Int16  GetRating()                { return _rating;      }
        public void   SetTitle(string NewTitle)  { _title = NewTitle;   }
        public void   SetRating(Int16 NewRating) { _rating = NewRating; }

        //private List<string> Films;
    }
}
