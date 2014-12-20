<%-- 
    Document   : CreateSchedule
    Created on : 16-12-2014, 11:01:00
    Author     : Soren
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <link rel="stylesheet" type="text/css" href="site.css">
       <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
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
        <title>JSP Page</title>
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
            <h2>Create schedule</h2>
            
            <form method="post" action="Ferry/createSchedule">
                
                <label for="startddate">Start date</label>
                <input type="date" name="startdate"/><br/>
                <label for="hour">Hour</label>
                <select name ="hour">
                    <option>00</option>
                    <option>01</option>
                    <option>02</option>
                    <option>03</option>
                    <option>04</option>
                    <option>05</option>
                    <option>06</option>
                    <option>07</option>
                    <option>08</option>
                    <option>09</option>
                    <option>10</option>
                    <option>11</option>
                    <option>12</option>
                    <option>13</option>
                    <option>14</option>
                    <option>15</option>
                    <option>16</option>
                    <option>17</option>
                    <option>18</option>
                    <option>19</option>
                    <option>20</option>
                    <option>21</option>
                    <option>22</option>
                </select>
                  <label for="minutes">Minutes</label>
                 <select name ="minutes">
                    <option>00</option>
                    <option>15</option>
                    <option>30</option>
                    <option>45</option>             
                   
                </select><br/>
                    <label for="enddate">End Date</label>
                <input type="date" name="enddate"/><br/>
                <label for="ferry">Ferry</label>
                <select name="ferry" id="ferry">             
                    <option value="" disabled selected>Select ferry</option>
                </select>
                <div id="ferryinfo">
                    <div>Ferry info</div>
                </div>
              
                
                
              <button id="button">OK</button>   
            </form>
            
           
        </div>
    </body>
