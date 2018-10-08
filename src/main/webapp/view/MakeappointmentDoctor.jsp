<%--
    Document   : MakeappointmentDoctor
    Created on : Oct 1, 2018, 11:22:20 PM
    Author     : Jesse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="HospitalReservationSystem.Makeappointment"%>

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

<jsp:useBean id="makeappointment" scope="session" class="HospitalReservationSystem.Makeappointment">
   <jsp:setProperty name="makeappointment" property="*"/>
  
</jsp:useBean>
  
    <script>
   firebase.auth().onAuthStateChanged(function(user){
    if(user) {
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
     <div class="right" >
         <div class="boxleft">Booking Now
             <div class="text"><br><br><div class="h3"><a id="depart" onclick="selectDepart()" href="MakeappointmentDepart.jsp">Select Department</a></div>
           <br>
                 
           <br>
           <div class="h3"><a href="MakeappointmentTime.jsp">Select Time</a></div>
                     <form><input type="text" name="selecteddoctor" id="selectedDoctor"value="dd" style="visibility:hidden"></form>

         </div></div>
         <div class="boxright"><div class="sbox"><div class="txt1">
             <div class="card"><div class="column3"><img src="qp.jpeg" alt="qp" style="width:100%"></div><div class="container" >
             <div class="column4">
                 <div class="h4" ><br><p onclick="selectDoctor()">Shan Wilson</p></div></div>
                 </div></div><div class="txt2"><div class="h5"><div class="popup" onclick="myFunction()">Show Doctor Information<span class="popuptext" id="myPopup">SADshagd ashjh LS  fhieu dsf sdadasdada
              Excellent</span></div>

                 </div></div></div></div>
             <br>
             <div  class="sbox1"><div class="txt1">
             <div class="card"><div class="column3"><img src="as.jpeg" alt="qp" style="width:100%"></div><div class="container" >
             <div class="column4">
                 <div class="h4" ><br><p onclick="selectDoctor()">Petter pianapple</p></div></div>
                 </div></div><div class="txt2"><div class="h5"><div class="popup" onclick="myFunctiona()">Show Doctor Information<span class="popuptext" id="myPopups">asas Li Bei Lei 大坏蛋大笨猪 猪猪猪猪 猪猪猪 猪猪猪</span></div>

                 </div></div></div></div>
             <br>
             <div class="sbox2"><div class="txt1">
             <div class="card"><div class="column3"><img src="ss.jpeg" alt="qp" style="width:100%"></div><div class="container" >
             <div class="column4">
                 <div class="h4" ><br><p onclick="selectDoctor()">Ko Lisdwa</p></div></div>
                 </div></div><div class="txt2"><div class="h5"><div class="popup" onclick="myFunctions()">Show Doctor Information<span class="popuptext" id="myPopupx">adadada as ada   ada dad   dffffaa a asdadadadada
              sadasdada</span></div>

                 </div></div></div></div>

         </div>

     </div>

    </div>
  </h1>
  <script>

             function myFunction(){
                 var popup = document.getElementById("myPopup");
                 popup.classList.toggle("show");
             }

             function myFunctiona(){
                 var popup = document.getElementById("myPopups");
                 popup.classList.toggle("show");
             }

             function myFunctions(){
                 var popup = document.getElementById("myPopupx");
                 popup.classList.toggle("show");
             }
             
   function selectDoctor(){
       var department = $("#depart").text();
 var doctor=event.target.innerText;
 $("#selectedDoctor").val(doctor);
 console.log(doctor);
var url="MakeappointmentTime.jsp"+"?"+department+"&"+doctor;
    window.location.assign(encodeURI(url)); 
    }
    
    function selectDepart(){
 var department = $("#depart").text();
 var Doctor = $("#doctor").text();
 
 console.log(department);
 console.log(Doctor);

var url="MakeappointDepart.jsp"+"?"+department+"&"+Doctor;
    window.location.assign(encodeURI(url)); 
}


    
window.onload = load();
function load(){
    firebase.auth().onAuthStateChanged(function(user){
    if(user) {
        var url=location.href; 

 console.log(url);
  var previous = document.referrer;
 
  
      console.log(url);
var txt=url.split("?")[1];
var depart=txt.split("&")[0];

var doctor=txt.split("&")[1];
console.log(txt);
       console.log(depart);
       console.log(doctor);
       $("#depart").text(depart);
         $("#doctor").text(doctor);
     
    }
});

}
</script>
</body>
</html>
