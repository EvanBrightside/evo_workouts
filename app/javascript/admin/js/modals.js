$(function () {
  var modal_holder_selector, modal_selector;

  modal_holder_selector = '#modal-holder';
  modal_selector = '.modal';

  var select_id = '';

  $(document).on('click', 'a[data-modal]', function (e) {
    var location;
    data = $(this).data('modal-params');
    location = $(this).attr('href');
    select_id = $(e.target).data('modalParams').select_id
    $.get(location, data, function (data) {
      $(modal_holder_selector).html(data).find(modal_selector).modal();
      return true;
    });
    return false;
  });

  $(document).on('ajax:success', modalSuccess);

  $(document).on('show.bs.modal', function () {
    var modal = $('.modal'),
    title = modal.find('.page-header h1').text();
    modal.find('.page-header').remove();
    $('.modal-title').text(title);
  });

  function modalSuccess(event) {
    const form = event.target;
    const div = form.querySelector('.f_field-img');
    const img = form.querySelector('img');
    const current_url = event.currentTarget.location.origin;
    let option_name;

    if (form.querySelector('#storage_name') != null) {
      option_name = form.querySelector('#storage_name').value;
      $.ajax({
        url: 'storage_icon_image_path',
        dataType: 'json',
        data: {
          option_name: option_name,
          current_url: current_url
        },
        success: function(response) {
          res = response['imgpath'];

          if (res != null) {
            img.src = res;
            img.style.display = 'block';
          }
        }
      });
    } else {
      option_name = form.querySelector('#composition_name').value;
      $.ajax({
        url: 'composition_icon_image_path',
        dataType: 'json',
        data: {
          option_name: option_name,
          current_url: current_url
        },
        success: function(response) {
          res = response['imgpath'];

          if (res != null) {
            img.src = res;
            img.style.display = 'block';
          }
        }
      });
    }
  }
});
