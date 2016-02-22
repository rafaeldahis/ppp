var ready;
ready = function() {

	$('#team_name').keyup(function(e) {
    $("#team_name_header").html($(this).val());
}).keypress(function(e) {
    return /[a-z0-9.- ]/i.test(String.fromCharCode(e.which));
});

	setTimeout(function(){
  		$('.flash').fadeOut();
  	}, 1000);

};

$(document).ready(ready);
$(document).on('page:load', ready);


