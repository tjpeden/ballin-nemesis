jQuery(function() {
  $('#note_category_name').autocomplete({
    source: $('#note_category_name').data('source')
  });

  $('#clear').click(function(event) {
    var target = $(this).data('target');
    $(target).html('');
  });

  $('#copy').click(function(event) {
    var target = $(this).data('target');
    var node = $(target).get(0);
    var range = rangy.createRange();
    var selection = rangy.getSelection();

    range.selectNodeContents(node);
    selection.setSingleRange(range);
    
    node.contentEditable = true;
    document.execCommand('copy', false, null);
    node.contentEditable = false;

    selection.detach();
  });

  $('#notes .show')
  .live('ajax:success', function(event, data, status, xhr) {
    var target = $(this).data('target');
    $(target).html(data.content);
  });

  $('#notes .star, #notes .delete')
  .live('ajax:success', function(event, data, status, xhr) {
    var target = $(this).data('target');
    $(target).html(data);
  });
});
