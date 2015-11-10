var clickable = function(){
  $.ajax({
    url: '/products/search',
    data: {
        term: $("#searchTextBox").val()
    },
    success: function(result) {
        $("#index").html(result);       
        },
        error: function(result) {
            alert("An Error has Occured");
        }
  }); 
};

$(document).ready(function() {
  $("#searchbutton").click(function(){
    clickable();
  });
});

$(document).ready(function() {
  $("#searchTextBox").on("keypress", function (e) {
    if (e.keyCode == 13) {
    clickable();
    }
  });
});
