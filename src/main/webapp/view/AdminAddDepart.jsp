

<%-- 
    Document   : AdminAddUser
    Created on : Oct 8, 2018, 10:06:07 PM
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
             <td><a href="Management.jsp">Management</a></td>
         </tr>
         
         
         </table></div>
                 <br>
        <div class="h2"><button id="logout" class="LogOutBt">Log out</button></div>
         
         </div>
         
         <div class="right" >Add User
            <br>
             <div class="text"><div class="h3">Department</div><input type="text" id="depart" placeholder="department" style="height: 30px;">
                
                 </div>
                 <br>
                 
               
            </div>
             <button class="SaveBt" onclick="addDepartment()">Add</button>
         </div>
        </div>
      </h1>
       
<script type="text/javascript">
     
    
    
   
    
    
    

   function addDepartment(){
  firebase.auth().onAuthStateChanged(function(user){
    if(user) {
        var department = $("#depart").val();
        var appointmentRef = firebase.database().ref('/Departments');
    appointmentRef.push().set({
    
     Name: department
  }).then(function(){
    console.log("success");
  }).catch(function(err){
    console.error("error：",err);
  });
        
   window.alert("Add Department successfully");
   window.location.href="ManageDepartment.jsp";
  }}); 
   }
   
</script>
  </body>
</html>

