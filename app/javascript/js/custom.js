$(document).on("input", ("input[name^=calculation]"), function(event) {
    event.preventDefault();
    let current_value = $(this).val();
    if ( current_value > 100 ) {
        showToast('Value must be less than 100!');
    } else if ( current_value <= 0 ) {
        showToast('Value must be greater than 0!');
    } else if ( isNaN(current_value) ) {
        showToast('Value must be a number!');
    } else {
        $("input[type=submit]").attr('disabled', false);
    }
});

function showToast(msg) {
    $("input[type=submit]").attr('disabled', true);
    $('.toast-body').html(msg);
    $('.toast').toast('show');
}
