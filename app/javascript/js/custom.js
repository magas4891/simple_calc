$(document).on("input", ("input[name^=calculation]"), function(event) {
    event.preventDefault();
    let current_value = $(this).val();
    if ( current_value > 100 ) {
        showToast('Value must be less than 100!');
    } else if ( current_value < 0 ) {
        showToast('Value must be greater than 0!');
    } else if ( isNaN(current_value) ) {
        showToast('Value must be a number!');
    } else {
        $('button[data-operation]').attr('disabled', false);
    }
});

$(document).on("click", ("button[data-operation]"), function(event) {
    event.preventDefault();
    $('button[data-operation]').attr('disabled', true);
    let value_a = $('input#calculation_field_a').val();
    let value_b = $('input#calculation_field_b').val();
    let operation = $(this).data("operation");
    sendAjax(value_a, value_b, operation);
});

function showToast(msg) {
    $('button[data-operation]').attr('disabled', true);
    $('.toast-body').html(msg);
    $('.toast').toast('show');
}

function sendAjax(value_a, value_b, operation) {
    $.ajax({
        url: "/calculations/",
        type: "POST",
        data: {
            calculation: { field_a: value_a, field_b: value_b, operation: operation }
        }
    });
}
