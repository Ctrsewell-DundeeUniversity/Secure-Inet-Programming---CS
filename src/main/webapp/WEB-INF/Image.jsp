<%-- 
    Document   : imageView
    Created on : 09-Oct-2015, 17:32:25
    Author     : Connor131
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
        <title>Picture</title>
    </head>
    <body>




        <%
            Pic p = (Pic) session.getAttribute("Pic");
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
            java.util.List<String> comments = p.getComment();
        %>

        <div id ="navBar">
            <ul>
                <li><a href="/Instagrim/Home">Home</a></li>
                <li><a href="/Instagrim/Profile">Profile</a></li>
                <li><a href="/Instagrim/Upload/Gallery">Upload</a></li>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                <li><a href="/Instagrim/SampleImages">Samples</a></li>
                <li><a href="/Instagrim/Account">Account</a></li>
                <li><a href="/Instagrim/Logout">Log Out</a></li>

                <form method="GET"  action="/Instagrim/Searchbox" style = "margin-top: 6px; display:in-line; float:right; margin-right:50px">
                    <input type="text" name="user" placeholder = "Search for user">
                    <input type="submit" value="Search"> 
                </form>
            </ul> 

        </div>

        <h1> Comments </h1>
        </br>
        <div>


            <div style = "height: 400px; width: 400px; margin-left: 36%">

                <img src="/Instagrim/Thumb/<%=p.getSUUID()%>"  style = "width: 75%; height: 75%; float:left">


                <div style = "width: 25%; height: 68%; margin-left: 80%">
                    <p> Likes </p>
                    <div style =" overflow: scroll; height: 87% ">
                        <%
                            java.util.LinkedList<String> likes = p.getLikes();

                            if (likes != null) {

                                for (int i = 0; i < likes.size(); i++) {

                        %>
                        <a href = "/Instagrim/Profiles/<%=likes.get(i)%>"><%=likes.get(i)%></a> </br>
                        <%
                                }

                            }
                        %>

                    </div>
                </div>

                <form method="POST" action="Likes" style = "margin-top:5px; margin-left: 86%">
                    <input type="submit" value="Like">
                </form>



                <div style = "width: 105%; overflow: scroll; height: 32%">
                    <%
                        java.util.LinkedList<PicDetails> pc = p.getPicComment();
                        String commenter;
                        String comment;
                        Date commentDate;
                        if (pc == null) {
                    %>

                    <%
                    } else {
                        Iterator<PicDetails> iterator;
                        iterator = pc.iterator();
                        while (iterator.hasNext()) {
                            PicDetails pcc = (PicDetails) iterator.next();
                            comment = pcc.getComment();
                            commenter = pcc.getCommenter();
                            commentDate = pcc.getCommentDate();

                    %>

                    <p>User: <a href = "/Instagrim/Profiles/<%=commenter%>"><%=commenter%></a> on <%=commentDate%> </br> <%=comment%></p> 

                    <%
                            }
                        }
                    %>
                </div>


                <form method="POST" action="Addcomment">
                    <textarea name="comment" rows="5" columns="20" placeholder = "Comment on the picture..." style = "width: 105%; overflow: scroll" ></textarea>
                    <br/>
                    <input type="submit" value="Add comment" style = "margin-left: 37%">
                </form>

            </div>
        </div>
    </body>

    <style>
        h1{
            text-align: center;
            margin-top: 30px;
        }
    </style>

</html>