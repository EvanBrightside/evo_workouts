$(document).ready(function() {
  $('.drop-area__previews').sortable({
    update: function(e, ui) {
      $.ajax({
        url: $(this).data('url'),
        type: 'PATCH',
        data: $(this).sortable('serialize'),
      });
    }
  });
});
