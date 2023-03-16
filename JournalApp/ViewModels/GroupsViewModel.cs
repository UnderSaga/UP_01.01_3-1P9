using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace JournalApp.ViewModels
{
    class GroupsViewModel : DependencyObject
    {

        public string FilterTextProperty
        {
            get { return (string)GetValue(FilterTextPropertyProperty); }
            set { SetValue(FilterTextPropertyProperty, value); }
        }

        // Using a DependencyProperty as the backing store for FilterTextProperty.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty FilterTextPropertyProperty =
            DependencyProperty.Register("FilterTextProperty", typeof(string), typeof(GroupsViewModel), new PropertyMetadata(""));


    }
}
