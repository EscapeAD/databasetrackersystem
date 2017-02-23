$(document).ready(function(){
  $('#search').submit(function(event){
    event.preventDefault();
    $.ajax({
      url: "/",
      dataType: JSON,
      method: 'GET',
      data: {}
    }).success(function(data){
      console.log(data);
    })
  })

})
