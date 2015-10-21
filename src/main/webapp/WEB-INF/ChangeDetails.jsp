<%-- 
    Document   : changePassword
    Created on : 08-Oct-2015, 23:10:04
    Author     : Connor131
--%>

<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
        <title>JSP Page</title>
    </head>
    <body>
            <% LoggedIn lg = (LoggedIn)session.getAttribute("LoggedIn"); 
               userDetails ud = (userDetails)session.getAttribute("userDetails");%>
        
             <div id ="navBar">
            <ul>
                    <li><a href="/Instagrim/home">Home</a></li>
                    <li><a href="/Instagrim/UserProfileDetails?id=profile">Profile</a></li>
                    <li><a href="/Instagrim/uploadPage">Upload</a></li>
                    <li><a href="/Instagrim/Images/<%=lg.getUsername()%>?id=Images">Your Images</a></li>
                    <li><a href="/Instagrim/SampleImages">Samples</a></li>
                    <li><a href="/Instagrim/ChangeDetails">Account</a></li>
                    <li><a href="/Instagrim/Logout">Log Out</a></li>

                   <form method="POST"  action="SearchUser" style = "margin-top: 6px; display:in-line; float:right; margin-right:50px">
                
                   <input type="text" name="user" placeholder = "Search for user">
 
                   <input type="submit" value="Search"> 
                   </form>
            </ul> 
                   
                
           </div>
                   
                <h1 style = "text-align: center">Change password</h1>
                <h2 style = "text-align: center">Confirm current password before changing details</h2>
                </br>
                <form method="POST"  action="ChangeDetails">
                <div style ="text-align: center">
                <div style ="padding-right: 5%">
                Current Password <input type="password" name="currPass" placeholder = "Current Password" style = "margin-top: 0%;"></li>
                </div>
                <br/>
                <br/>
                <div style ="padding-right: 1.3%">
                Password <input type="password" name="newPass" placeholder = "New Password" style = "margin-top: 5px;"></li>
                </div>
                <div style ="padding-right: 1.5%">
                Forename <input type="text" name="firstName" value = "<%=ud.getFname()%>" style = "margin-top: 5px;"></li>
                </div>
                <div style = "padding-right: 0.9%">
                Surname <input type="text" name="surName" value ="<%=ud.getSname()%>" style = "margin-top: 5px;"></li>
                </div>
                
                <%
                    Set<String> emails = new HashSet();
                    int emailNo=0;
                    emails = ud.getEmail();
                    Iterator iterator = emails.iterator();
                    while (iterator.hasNext()) {
                    emailNo++;
                %>
                <div style = "padding-right: 0.5%">
                Email <%=emailNo%> <input type="text" value = "<%=iterator.next()%>" name="email" style = "margin-top: 5px;"></li>
                </div>
                <%
                    }
                %>
                <div style = "padding-right: 5.76%">
                Add Email Address <input type="text" name="email" placeholder = "Add an email address" style = "margin-top: 5px;"></li>
                </div>
                <div style = "padding-right: 0.7%">
                Address <input type="text" name="address" placeholder = "" style = "margin-top: 5px;"></li>
                </div>
                <div style = "padding-left: 0.36%">
                Street <input type="text" name="street" placeholder = "" style = "margin-top: 5px;"></li>
                </div>
                <div style = "padding-left: 1.1%">
                City <input type="text" name="city" placeholder = "" style = "margin-top: 5px;"></li>
                </div>
                <div style = "padding-left: 0.4%">
                Town <input type="text" name="zip" placeholder = "" style = "margin-top: 5px;"></li>
                </div>
               <input type="submit" value="Change" style = "margin-top: 10px; margin-left: 3%"><!-- Moving log in button: http://stackoverflow.com/questions/3126090/css-position-a-submit-button-after-the-last-control-on-a-form -->
              <br/>
              
            </div>
            </form>
    </body>
</html>