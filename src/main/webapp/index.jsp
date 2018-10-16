<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  
 <link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://www.gstatic.com/firebasejs/5.5.4/firebase.js"></script>
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




        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hospital Reservation System</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
       
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body background="./images/1.jpeg">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
<script> firebase.auth().onAuthStateChanged(function(user){
    if(user) {
       var uid = user.uid;
       console.log(uid);
        
        $("#lgbtn").html("My account");
        $("#lgbtn").click(function(){
            if (uid.indexOf("7oRThGdNZ71QVmORJ")>0){
                 window.location.href="./view/Admin.jsp";
             }
            firebase.database().ref('/Users/' + uid).once('value').then(function(snapshot) {
        var isStaff = snapshot.val();
        
        if (isStaff!=null){
             window.location.href="./view/Homepage.jsp";
        }
     else{
   window.location.href="./view/DoctorHomepage.jsp";}
 
        });
    });
   
         $("#smbtn").html("Log out");
         $("#smbtn").click(function(){firebase.auth().signOut().then(function() {window.location.herf="index.jsp";
}).catch(function(error) {
});});
         
    }else{
         $("#lgbtn").html("Log in");
         $("#lgbtn").click(function(){window.location.href="./view/login.jsp";});
         $("#smbtn").html("Sign up");
         $("#smbtn").click(function(){window.location.href="./view/signup.jsp";});
    }
        });
        
        
          </script>
 
  
          <a href="index.jsp">
       <img src="./images/logo.png" width="10%" height="92px">
       </a>
      
          <div style="position:relative;
    transition: .5s ease;
    top: -60px;
    left: 1000px;
    right: 50px;
    bottom: 300px;">
       <button id="lgbtn" style=" margin: 20px;" class="btn btn-lg btn-warning">Log in</button>
    
       <button id="smbtn" class="btn btn-primary">Sign up</button>
          </div>
       
 
           <div style=" margin-top: 2%; text-align:center">
             <h1>Hospital Reservation System</h1>
             <br/>
             <p style=" color: white; font-family: Helvetica;">
                  More efficient appointment system for patients to make an reservation in their available time. 
                 <br/>
                 Specific doctors can
                 be selected by patients. .
           
           </p>
           </div>
       
    </body>
</html>
