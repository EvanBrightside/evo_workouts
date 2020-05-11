$(function() {
  const modal_holder_selector = '#modal-holder';
  const modal_selector = '.modal';
  let course = '';

  $(document).on('click', 'a[data-modal]', function(e) {
    const location = $(this).attr('href');
    data = $(this).data('modal-params');
    course = $(e.target).data('modalParams').course;

    // Load modal dialog from server
    $.get(location, data, function (data) {
      $(modal_holder_selector).html(data).find(modal_selector).modal();
      return true;
    });
    return false;
  });

  $(document).on('ajax:success', 'form[data-modal]', function(event){
    const [data, _status, xhr] = event.detail;
    const url = xhr.getResponseHeader('Location');

    if (url) {
      // Redirect to url
      window.location = url;
    } else {
      // Remove old modal backdrop
      $('.modal-backdrop').remove();
      // Update modal content
      const modal = $(data).find('body').html();
      $(modal_holder_selector).html(modal).find(modal_selector).modal();
    }

    return false;
  });
});
