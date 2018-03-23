
$.ajax({ url: "/home/fetch_data" }).done(function(data){
  $(".pipes").inner(data);
});
