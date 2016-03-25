; (function ()
{
  var holidays = [
    new Date(0, 0, 1)],
    weeklyHolidays = [0, 6],
    workShifts = [{
      start: 9,
      end: 17
    }],
      today = new Date('$value -isoutc -now$');

  setInterval(function ()
  {
    today.setMilliseconds(today.getMilliseconds() + 1000);
  }, 1000);

  function isHoliday(date)
  {
    return weeklyHolidays.indexOf(date.getDay()) >= 0 ||
           holidays.some(function (h)
           {
             return h.getMonth() == date.getMonth() &&
                    h.getDate() == date.getDate();
           });
  }

  iservice.calculateWorkHours = function calculateWorkHours(startDate)
  {
    if(today - startDate <= 0)
      throw new Error('The provided date (' + startDate + ') is past the server date (' + today + ')');

    var startDateTotalHours = startDate.getHours() + startDate.getMinutes() / 60,
        endDateTotalHours = today.getHours() + today.getMinutes() / 60;

    if(startDate.getFullYear() == today.getFullYear() &&
       startDate.getMonth() == today.getMonth() &&
       startDate.getDate() == today.getDate())
    {
      return isHoliday(startDate) ? 0 : workShifts.reduce(function (previous, current)
      {
        if(current.end >= startDateTotalHours &&
           current.start <= endDateTotalHours)
        {
          previous += (current.end > endDateTotalHours ? endDateTotalHours : current.end) -
                      (current.start > startDateTotalHours ? current.start : startDateTotalHours);
        }

        return previous;
      }, 0);
    }

    startDate = new Date(startDate.getTime());

    var totalBusinessHours = 0,
        dayTotalWorkHours = workShifts.reduce(function (previous, current)
        {
          return previous + current.end - current.start;
        }, 0);

    if(!isHoliday(startDate))
    {
      totalBusinessHours += workShifts.reduce(function (previous, current)
      {
        if(current.end >= startDateTotalHours)
        {
          previous += current.end -
                      (current.start > startDateTotalHours ? current.start : startDateTotalHours);
        }

        return previous;
      }, 0);
    }

    startDate.setDate(startDate.getDate() + 1);

    while(startDate.getFullYear() != today.getFullYear() ||
          startDate.getMonth() != today.getMonth() ||
          startDate.getDate() != today.getDate())
    {
      if(!isHoliday(startDate))
        totalBusinessHours += dayTotalWorkHours;

      startDate.setDate(startDate.getDate() + 1);
    }

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
      }, totalBusinessHours);
    }

    return totalBusinessHours;
  };
})();
