package com.mycompany.ferryfrontmaven;


import backend.DummyBackEnd;
import com.google.gson.Gson;
import ferry.contract.AdminContract;
import ferry.dto.DepartureDetail;

import ferry.dto.FerryIdentifier;
import ferry.dto.ScheduleDetail;
import ferry.dto.ScheduleIdentifier;
import ferry.eto.DataAccessException;
import ferry.eto.NoSuchScheduleException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.HashSet;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.ApplicationPath;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.Response;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Soren
 */

@ApplicationPath("Ferry")
@Path("")
public class ScheduleFerryResource extends Application{
    AdminContract manager = new DummyBackEnd();
   
    
    
    @POST
    @Path("addFerry")
    public Response getStuff(@FormParam("schedule") String schedule, @FormParam("ferry") String ferry) throws Exception {
        
        
        
        manager.assignFerryToSchedule(new FerryIdentifier(Integer.parseInt(ferry)), new ScheduleIdentifier(Integer.parseInt(schedule)));
        
        
        return Response.ok(new String(""+ferry)).build();
    }

    @POST
    @Path("getFerry")
    public String getFerry(){
    Gson json = new Gson();
    String reply = "did not work";
        System.out.println("Called");
        try {
             reply = json.toJson(manager.showFerries());
             System.out.println(reply);
        } catch (DataAccessException ex) {
            System.out.println("Fucked");
            Logger.getLogger(ScheduleFerryResource.class.getName()).log(Level.SEVERE, null, ex);
        }
    return reply;
    }
   @POST
   @Path("getSchedule")
   public String getSchedules(){
       String reply= "Error in Json";
        Gson json = new Gson();
        try {
            reply = json.toJson(manager.showSchedules());
        } catch (NoSuchScheduleException ex) {
            Logger.getLogger(ScheduleFerryResource.class.getName()).log(Level.SEVERE, null, ex);
        }
       System.out.println(reply);
       
       
       
       
       return reply;
   }

   @POST
   @Path("createSchedule")
    public void createSchedule(@FormParam("startdate") String startdate, @FormParam("hour") String hour, @FormParam("minutes") String mintues,
                @FormParam("enddate") String enddate, @FormParam("ferry") String ferryid) throws NoSuchScheduleException, DataAccessException{
        
        int size = manager.showSchedules().size();
        DateFormat format = new SimpleDateFormat("dd,MM, yyyy", Locale.ENGLISH);
       Date startDate;
       Date endDate;       
       try {
            startDate = format.parse(startdate);
             endDate = format.parse(enddate);
             manager.addSchedule(new ScheduleDetail(size, startDate, endDate, new HashSet<DepartureDetail>()) );
        } catch (ParseException ex) {
            Logger.getLogger(ScheduleFerryResource.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }
  
    
}
