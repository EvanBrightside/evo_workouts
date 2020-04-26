import 'jquery-timepicker/jquery.timepicker.js'

$(document).on('turbolinks:load', function () {
  $('body').on('click', '.timepicker', function() {
    $('.timepicker').timepicker({
      timeFormat: 'HH:mm',
      interval: 30,
      minTime: '0:01',
      maxTime: '23:59',
      startTime: '0:00',
      dynamic: false,
      dropdown: true,
      scrollbar: true
    });
  });
});
