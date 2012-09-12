// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
  
  // Focus on the first text field of every form
  // ------------------------------------------------------------------
  $(".first").focus();

  // Mask these inputs
  // ------------------------------------------------------------------
  $('input.phone_number').inputmask("mask", {"mask": "(999) 999-9999"});
  
  // Typeahead for entrant_previous_year
  // ------------------------------------------------------------------
  $('#entrant_previous_year').typeahead({
    source: function(typeahead, query) {
      $.getJSON('/entrants/search?query=' + query, function(data) {
        typeahead.process(data);
      });
    },
    property: "full_name",
    onselect: function(obj) {
      // populate the text fields with this contact
      populateFields(obj);
    },
    items: 15
  });

  // Auto-fill from selection on entrant_previous_year
  // ------------------------------------------------------------------
  function populateFields(entrant) {
    
    $('#entrant_name_first').val(entrant.name_first);
    $('#entrant_name_middle').val(entrant.name_middle);
    $('#entrant_name_last').val(entrant.name_last);
  }
});