$(document).on('turbolinks:load', function() {
  console.log('loaded')
  $('#search').submit(function(event){
    event.preventDefault();
    console.log($('input[type=text]').val())
    $.ajax({
      url: "/events/" + $('#search').data('event-id') + "/reserves/new",
      dataType: "json",
      method: 'GET',
      data: {search: $('input[type=text]').val()}
    }).success(function(data){
      console.log(data);
      console.log('yes!');
      if(data.length == 0){
        $('#userResult').append("<span>No Matches</span>");
      }
      for(var i = 0; i < data.length; i++){
        console.log(data[i]);
        $('#userResult').append("<a class='userResult' data-id='" + data[i].id + "' href='/events'>" + data[i].name + "</a>" + " - " + data[i].email + " - " + data[i].number  )
        $(".userResult").on("click", function(event){
          event.preventDefault();
          console.log($(this).data('id'));
          $.ajax({
            url: "/events/" + $('#search').data('event-id') + "/reserves",
            method: 'POST',
            dataType: "html",
            data: { reserve: { person_id: $(this).data('id') }}
          }).done(function(){
            location.reload();
          })
        })
      }
    })
  })

})
