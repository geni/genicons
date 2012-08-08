

$('document').ready(function(){
  $('ul#icons li').hover(function(){
    var entity = $(this).attr('data-entity');
    var decoded = htmlDecode("&#x"+ entity +";");
    console.log(decoded);

    $('#entity-show').attr('data-icon', decoded).text( " &#x"+ entity +";" );
    $('#posts').attr('data-icon', decoded);
  });
});


function htmlEncode(value){
    if (value) {
        return jQuery('<div />').text(value).html();
    } else {
        return '';
    }
}

function htmlDecode(value) {
    if (value) {
        return $('<div />').html(value).text();
    } else {
        return '';
    }
}