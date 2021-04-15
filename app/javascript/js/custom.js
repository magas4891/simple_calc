$(document).on("click", ("button[data-operation]"), function(event) {
    event.preventDefault();
    let value_a = $('input#calculation_field_a').val();
    let value_b = $('input#calculation_field_b').val();
    let operation = $(this).data("operation");
    sendAjax(value_a, value_b, operation);
});

function sendAjax(value_a, value_b, operation) {
    $.ajax({
        url: "/calculations/",
        type: "POST",
        data: {
            calculation: { field_a: value_a, field_b: value_b, operation: operation }
        }
    });
}
