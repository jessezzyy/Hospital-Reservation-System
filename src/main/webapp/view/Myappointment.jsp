<%--
    Document   : Myappointment
    Created on : Oct 1, 2018, 11:30:56 PM
    Author     : Jesse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hospital Reservation System</title>
        <link rel="stylesheet" type="text/css" href="web.css">

         <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase.js"></script>
<!-- Firebase App is always required and must be first -->
<script src="https://www.gstatic.com/firebasejs/5.4.1/firebase-app.js"></script>

<!-- Add additional services that you want to use -->
<script src="https://www.gstatic.com/firebasejs/5.4.1/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.4.1/firebase-database.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.4.1/firebase-firestore.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.4.1/firebase-messaging.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.4.1/firebase-functions.js"></script>

<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyB3tgflnOWGhR0EVvjW6ldubM6vSdNqBFE",
    authDomain: "premium-origin-217008.firebaseapp.com",
    databaseURL: "https://premium-origin-217008.firebaseio.com",
    projectId: "premium-origin-217008",
    storageBucket: "premium-origin-217008.appspot.com",
    messagingSenderId: "1538681596"
  };
  firebase.initializeApp(config);
</script>



    </head>
    <body>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <script>
        var uuid;
   firebase.auth().onAuthStateChanged(function(user){
    if(user) {
        uuid = user.uid;
        $("#logout").click(function(){firebase.auth().signOut().then(function() {
 window.alert("Log out successfully");
 window.location.href="../index.jsp";
}).catch(function(error) {
});});
    }else{
        window.location.herf="../index.jsp";
   }});

</script>

<h1><div class="box"><div class="leftbox"><div class="h1"><strong>HRS</strong>
    </div>
   <div class="table">
    <table>
      <tr>
          <td><a href="Homepage.jsp">Homepage</a></td>
      </tr>
         <tr>
             <td><a href="Profile.jsp">My Profile</a></td>
         </tr>
         <tr>
             <td><a href="MakeappointmentHome.jsp">Make appointment</a>
         </tr>
         <tr>
             <td><a href="Myappointment.jsp">My appointment</a></td>
         </tr>
    </table></div>
            <br>
   <div class="h2"><button id="logout" class="LogOutBt">Log out</button></div>

    </div>
   <div class="right" >My appointment
      <div id="add" class="text">
         
   </div>
         </div>
    </div>

  
 </h1>
       
       <script>
           window.onload = onload();
           function onload(){
           firebase.auth().onAuthStateChanged(function(user){
    if(user) {
  var uid = user.uid;

     var addDepart = "";
var dn=new Array();
var da=new Array();
var tm=new Array();
var dp=new Array();
var co=new Array();
var leadsRef = firebase.database().ref('/Users/'+uid+'/Appointments');


leadsRef.on('value', function(snapshot) {
    snapshot.forEach(function(childSnapshot) {
      var doctorname = childSnapshot.val().DoctorName;
       var date = childSnapshot.val().Date;
        var time = childSnapshot.val().Time;
         var depart = childSnapshot.val().Department;
         var comments=childSnapshot.val().Comments;
          var comments=childSnapshot.val().Comments;
     
     dn.push(doctorname);
     da.push(date);
     tm.push(time);
     dp.push(depart);
     co.push(comments);
     
     
    });
    
     var len = dn.length;
for(var i=0;i<len; i++){
   addDepart = addDepart + '<button class="accordion" id="accordion" style="width: 550px;">Appointment '+(i+1)+'<span style="white-space:pre;">'+'       '+da[i]+'         '+tm[i]+'</span></button><div class="panel" style="text-align: left;"><p>Appointment<br>Date:  '
   +da[i]+"<br>Time: "+tm[i]+"<br>Doctor: "+dn[i]+"<br>Department: "+dp[i]+"<br>Comments: "+co[i]+'<br><input type="button" onclick="dele('+"'"+co[i]+"',"+"'"+dn[i]+"'"+')" value="Delect" style="width: 100px; font-size: 50px;"></p></div><br>';
   }
   $("#add").html(addDepart);
   console.log("run");
          var acc =document.getElementsByClassName("accordion");
          var i;
           for(i = 0; i< acc.length;i++){
               acc[i].addEventListener("click",function(){
               this.classList.toggle("active");
               var panel = this.nextElementSibling;
               if(panel.style.display==="block"){
                panel.style.display="none";
               }else{
                   panel.style.display = "block";
               }
               });
           }
});

 }
 });
 
    }
    
    
    var userappID;
      var appID;
      var dcID;
       var dcappID;
      
      function dele(com,dcname){
         console.log("delete");
         var userap = firebase.database().ref("Users/"+uuid+"/Appointments").orderByChild("Comments").equalTo(
               com);
      userap.on("child_added", snap => { 
          userappID = snap.key;
          console.log(userappID);
      });
      
      var ap = firebase.database().ref("Appointments").orderByChild("Comments").equalTo(
               com);
      ap.on("child_added", snap => { 
          appID = snap.key;
          console.log(appID);
      });
      
       var docap = firebase.database().ref("Doctors").orderByChild("WholeName").equalTo(
               dcname);
      docap.on("child_added", snap => { 
          dcID = snap.key;
          console.log(dcID);
      });
       var docapp = firebase.database().ref("Doctors/"+dcID+"/Appointments").orderByChild("Comments").equalTo(
               com);
      docapp.on("child_added", snap => { 
          dcappID = snap.key;
          console.log(dcappID);
      });
     firebase.database().ref('Users/'+uuid+'/Appointments/'+userappID).remove();
      firebase.database().ref('Appointments/'+appID).remove();
      firebase.database().ref('Doctors/'+dcID+'/Appointments/'+dcappID).remove();
      window.alert("Delete Successfully");
     location.reload();
          
      };


    
          </script>

        
    </body>
</html>
