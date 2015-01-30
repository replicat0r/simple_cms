// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function() {
    /* Activating Best In Place */
    jQuery(".best_in_place").best_in_place();
    jQuery('.highlight_on_success').bind("ajax:success", function() {
    	jQuery(this).closest('tr').removeClass('flash')
      jQuery(this).closest('tr').addClass('flash');
    });

});
