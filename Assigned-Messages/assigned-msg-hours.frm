; (function ()
{
  // In all the calculations here, the least unit counted is minutes
  // The calculations use JavaScript Date object conventions. For reference, view the MDN article about the
  // issue https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date
  // The Date object is constructed by calling the constructor with the following parameters
  // new Date(year, month, day, hour, minute)
  // year: Is a number like 1990, 2015, etc.
  // month: Is a number from 0 (January) to 11 (December)
  // day: Is a number from 1 to 31
  // hour: Is a number from 0 (12 AM) to 23 (11 PM)
  // minute: Is a number from 0 to 59
  // Week days are represented by numbers running from 0 (Sunday) to 6 (Saturday)

  // holidays is an array of Date objects with each one representing an off day that whose work hours won't be
  // counted. Notice that we set the year to 0 because holidays are recurring for every year, so, we don't care
  // about the year value. We just care about the month and day
  var holidays = [new Date(0, 0, 1)], // new Date(0, 0, 1) is the 1st of Jan

      // weeklyHolidays is an array of numbers with each one representing a weekly off day
      weeklyHolidays = [0, 6], // Sundays and Saturdays are off

      // workShifts is an array of JavaScript objects with each one representing a work shift time. A company
      // may have one or more shifts as appropriate. The start and end times are represented as decimal numbers
      // running from 0 to 24. For example:
      // 0 is 12 AM, 0.5 is 12:30 AM, 20 is 8 PM, 23:33 is 11:20 PM
      workShifts = [/*{
            start: 0,
            end: 4
        },*/ {
          start: 9,
          end: 17
        }/*, {
            start: 20,
            end: 24 // There's no such thing as a 24 hour value, but just to make the shift continuous from 20 (8 PM) to 4 AM, so, we used 24 instead of something like 23.99999
        }*/],
      today = new Date('$value -isoutc -now$'); // today is the server time now

  // As the page fetches the data from the server every fixed amount of time, we need to keep the today date
  // object synchronized with the server time, so, we use setInterval to create a timer that updates it every second 
  setInterval(function ()
  {
    today.setMilliseconds(today.getMilliseconds() + 1000);
  }, 1000);

  // Function that determines if the given date is a weekly or annual holiday
  function isHoliday(date)
  {
    /// <param name="date" type="Date"></param>
    // Search for the date in the weekly and annual holidays arrays, and return true if it matches, otherwise
    // return false
    return weeklyHolidays.indexOf(date.getDay()) >= 0 || // Weekly holidays are matched by week day
           holidays.some(function (h)
           {
             // Annual holidays are matched by day and month only
             return h.getMonth() == date.getMonth() &&
                    h.getDate() == date.getDate();
           });
  }

  // Attach calculateWorkHours to the global iservice object. The function is provided a Date object and returns
  // the number of business hours between the provided date and the today date object
  iservice.calculateWorkHours = function calculateWorkHours(startDate)
  {
    /// <param name="startDate" type="Date"></param>
    // If the provided date is in the future throw an exception as this is an invalid usage
    if(today - startDate <= 0)
      throw new Error('The provided date (' + startDate + ') is past the server date (' + today + ')');

    // For startDate and today, get the hours and minutes as a decimal number. For example 3:30 becomes 3.5,
    // and keep the values in startDateTotalHours and endDateTotalHours respectively
    var startDateTotalHours = startDate.getHours() + startDate.getMinutes() / 60,
        endDateTotalHours = today.getHours() + today.getMinutes() / 60;

    if(startDate.getFullYear() == today.getFullYear() &&
       startDate.getMonth() == today.getMonth() &&
       startDate.getDate() == today.getDate())
    {
      // If both startDate and today are the same day and it's not a holiday, just calculate the business
      // hours for it. If it's a holiday return 0
      return isHoliday(startDate) ? 0 : workShifts.reduce(function (previous, current)
      {
        // For each shift, determine if it intersects with the interval [startDateTotalHours-endDateTotalHours]
        // and if so, accumulate the intersection hours amount in the "previous" variable
        if(current.end >= startDateTotalHours &&
           current.start <= endDateTotalHours)
        {
          previous += (current.end > endDateTotalHours ? endDateTotalHours : current.end) -
                      (current.start > startDateTotalHours ? current.start : startDateTotalHours);
        }

        return previous;
      }, 0);
    }

    // Clone the startDate object (because JS Date functions modifies the object they're called on, and we don't
    // want to mess with the object the caller provided)
    startDate = new Date(startDate.getTime());

    // totalBusinessHours is the variable in which we will accumulate the business hours
    var totalBusinessHours = 0,

        // dayTotalWorkHours is the total amount of work hours in a work day
        dayTotalWorkHours = workShifts.reduce(function (previous, current)
        {
          return previous + current.end - current.start;
        }, 0);

    // If startDate is not a holiday, accumulate its work hours into totalBusinessHours
    if(!isHoliday(startDate))
    {
      totalBusinessHours += workShifts.reduce(function (previous, current)
      {
        // We add only hours of shifts whose end time is past startDateTotalHours
        if(current.end >= startDateTotalHours)
        {
          previous += current.end -
                      (current.start > startDateTotalHours ? current.start : startDateTotalHours);
        }

        return previous;
      }, 0);
    }

    // Move to the next day
    startDate.setDate(startDate.getDate() + 1);

    // We will repeat until startDate reaches the day in the "today" variable
    while(startDate.getFullYear() != today.getFullYear() ||
          startDate.getMonth() != today.getMonth() ||
          startDate.getDate() != today.getDate())
    {
      // Add full day hours if the day is not a holiday
      if(!isHoliday(startDate))
        totalBusinessHours += dayTotalWorkHours;

      // Move to the next day
      startDate.setDate(startDate.getDate() + 1);
    }

    // After we leave the loop, we need to calculate the work hours in today, if it's not a holiday
    if(!isHoliday(startDate))
    {
      totalBusinessHours = workShifts.reduce(function (previous, current)
      {
        if(current.start <= endDateTotalHours)
        {
          previous += (current.end > endDateTotalHours ? endDateTotalHours : current.end) -
                      current.start;
        }

        return previous;
      }, totalBusinessHours); // Notice that totalBusinessHours is the seed value here
    }

    // Return the calculated amount
    return totalBusinessHours;
  };
})();