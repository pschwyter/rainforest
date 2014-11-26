// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('ready page:load', function() {

	$('#search-form').submit(function(event) {
	    event.preventDefault();
	    var searchValue = $('#search').val();

		$.getScript('/products?search=' + searchValue);
		
	});

	if ($('.pagination').length) {
		$(window).scroll(function(){
			var url = $('.pagination span.next').children().attr('href');
			if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
				$('.pagination').text("Fetching more results...");
				$.getScript(url);
				console.log("we be paginating");
			}
		});
	}

 });

// $(window).scrollTop(); to get position in pixels of top edge of window in pixels relative to top of document
// $(window).height(); to get height in pixels of window (changed based on window size)
// $(document).height(); to get height in pixels of document(this never changes)

// a good formula for determining when to trigger AJAX request on scroll

// var url = $('.pagination span.next').children().attr('href');
// $(wondow).scroll(function(){
// 		if ( url && $(window).scrollTop() > ($(document).height() - $(window).height() - 50) {
//			//var nextPage = $('.pagination span.next').children().attr('href'); gets us next page -> '/?page=2'
//			$('.pagination').text("Fetching more results...");
//			$.getScript(url);
//		}
// });
// 
// SOMETIMES WE MIGHT NEED TO MAKE SOMETHING A DIV instead of a <p>
// 
// 
// 
