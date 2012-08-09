jQuery(function() {
    $('#note_category_name').autocomplete({
        source: $('#note_category_name').data('source')
    });
});
