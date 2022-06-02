<p># tracker_demo A flutter application for activity tracking.</p>
<p>## Getting Started this application is made with bloc design pattern and state management the structure is as follows:</p>
<ul>
   <li>
      data layer contains the data_sources, models, and repositories
      <ul>
         <li>
            the data_sources contains: <br />
            <ul>
               <li>dto_models: the raw models coming from one or more data_sources then will be mapped to the actual models that will be used in the application</li>
               <li>local (currently empty): will contain local data_sources like SQLite</li>
               <li>remote: contains the base API classes which are the blueprints for the API classes implementation to ensure maintainability if we wanted to change the data source</li>
               <li>end_points: constants with the endpoints values</li>
            </ul>
         </li>
         <li>models: <br />the actual models for the application.</li>
         <li>repository: a separation layer to communicate with the data sources and combine them in one place</li>
         <li>exceptions: custom exceptions for error handling</li>
      </ul>
   </li>
   <li>
      logic layer: contains the blocs, states, and events for the application here we have two states: NoDataState which indicates that there is no data available. <br />DataLoadedState indicates that the data is loaded DataLoadedState contains:
      <ul>
         <li>
            <ul>
               <li>flags: isDaily, isWeekly, isMonthly to indicate which type of activities the user selected, and activityList contains the list of all available activities,</li>
               <li>getCurrent that returns the current activity time after providing the activity index</li>
               <li>getPrevious that returns the current activity time after providing the activity index</li>
               <li>getColors that return the current activity color after providing the activity index</li>
               <li>getImage that returns the current activity image after providing the activity index</li>
               <li>getLatPeriod that returns the currently selected type</li>
            </ul>
         </li>
         <li>Events are: LoadDataEvent that will be triggered to load the data DailyEvent to change the selected activity type to daily MonthlyEvent to change selected activity type to monthly WeeklyEvent to change selected activity type to weekly ActivityBloc glues it all together</li>
      </ul>
   </li>
   <li>
      presentation layer contains:
      <ul>
         <li>pages: the main pages (here only one page) that are responsive for the screen size and will render the proper screen for that size dynamically and smoothly</li>
         <li>screens: here we have size-specific screens for desktop screens and mobile screens (in booth orientations).</li>
         <li>widgets: the shared widgets among the screens.</li>
      </ul>
   </li>
</ul>
<p>## the application workflow:</p>
<p>when the user first opens the application a transparent loader above the actual layout will show till the data is loaded the loader will pop the user can select the activities type and the data will change without reloading if the user changed the device orientation a different UI will be rendered the application is responsive to all screen sizes and this behavior can be shown using the web application and changing the browser screen size.</p>
<p>## please note the application was made with a Mac laptop and supports android, ios, web, and macOS.</p>