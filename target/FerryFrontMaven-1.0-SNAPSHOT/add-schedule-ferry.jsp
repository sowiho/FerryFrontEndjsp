<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="site.css">
       <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
       <script>
    var ferry;
    var sche;
    $(function(){
        
        $.post( "/FerryFrontMaven/Ferry/getFerry", function( data ) {
          ferry =jQuery.parseJSON(data);  
            $.each(ferry, function(index, ferry) {
          //  alert(ferry.name);
            $('#ferry').append("<option value="+ferry.ID+">"+ferry.name+"</option>");
            });
    
            //alert(obj[0].name);
              //  
                
            
        });
        
        $( '#ferry' ).change(function() {
            showferryinfo($('#ferry').val());
        });
        
        //----------------------------------------------------------------------------------
        
        $.post( "/FerryFrontMaven/Ferry/getSchedule", function( data ) {
            sche = jQuery.parseJSON(data);
            
             $.each(sche, function(index, schedule) {
                
                 $('#schedule').append("<option value="+schedule.ID+">"+schedule.startDate+" - "+ schedule.endDate+"</option>");
                 
             });
            
        });
           
        $( '#schedule' ).change(function() {
            showScheduleinfo($('#schedule').val());
        });
    
});



function showferryinfo(val){
   
       
      $.each(ferry, function(index, ferry) {
          
           var valint = parseInt(val,10);
           if(ferry.ID === valint){
           $('#sferry').remove();                   
          $('#ferryinfo').append('<div id="sferry"><div>ID</div><div>'+ferry.ID+'</div><div>Ferry name</div><div>'+ferry.name+'</div></div>');   
               
           }
            });
  
    
         }  
         function showScheduleinfo(val){
   
       
      $.each(sche, function(index, schedule) {
          
           var valint = parseInt(val,10);
           if(schedule.ID === valint){
           $('#schedules').remove();                   
          $('#scheduleinfo').append('<div id="schedules"><div>ID</div><div>'+schedule.ID+'</div><div>Start date</div><div>'+schedule.startDate+'</div><div>End date</div><div>'+schedule.endDate+'</div></div>');   
               
           }
            });
  
    
         } 
           
           


         
       </script>
        <title>ADD STUFF!</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="top" >
            <div class="logo">
                <img src="image/boat-157680_1280.png" height="100%" alt="" />
               
            </div>
             <div class="name"> <h2>SUPER FERRY 2000</h2></div>
             <div style="clear:both"></div>
            <div class="navbar">
                <ul>
                    <li>
                        <a href="add-schedule-ferry.jsp">Add Schedule to ferry</a>
                    </li>
                    <li>
                        <a href="CreateSchedule.jsp"> Create schedule</a>
                    </li>
            </div>
            
            
        </div>
        <div class="container">
            <h2>Add ferry to schedule</h2>
            
            <form method="post" action="Ferry/addFerry">
                <select name="ferry" id="ferry">             
                    <option value="" disabled selected>Select ferry</option>
                </select>
                <div id="ferryinfo">
                    <div>Ferry info</div>
                </div>
                <select name="schedule" id="schedule">
                  <option value="" disabled selected>Select Schedule</option>
                    
                </select>
                <div id="scheduleinfo">
                    <div>schedule info</div>
                </div>
                
                
              <button id="button">OK</button>   
            </form>
            
           
        </div>
    </body>
</html>
