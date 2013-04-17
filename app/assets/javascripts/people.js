$(function() {
  console.log('On DOM ready');
});

$(window).bind('page:change', function() {
  console.log('On page change');
});
