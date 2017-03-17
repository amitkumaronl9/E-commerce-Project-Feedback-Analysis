<%--
    Document   : ProductList
    Created on : Feb 27, 2017, 4:57:54 PM
    Author     : Amit Kumar
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%><!--sql connection-->
<%@page import="java.sql.ResultSet"%><!--sql resultset-->
<%@page contentType="text/html" pageEncoding="UTF-8"%> <!--jsp code Encoding-->

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/menu.css" type="text/css"/><!--Linked with stylesheet-->
        <link rel="stylesheet" href="css/stylesheet.css" type="text/css"/><!--Linked with stylesheet-->
        <title>Product</title>
    </head>
    <%
                String msg = null;
                msg = (String) session.getAttribute("MSG");
    %>//session
    <body>
        <table  width="80%" align="center"  bgcolor="white">
            <tr height="40px">
                <td>
                    <table width="100%">
                        <tr>
                            <td>
                                <%@include file="header_menu.html" %><!--linked with header_menu file.-->
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <img src="Image/head.jpg" width="250px" height="200px" alt=""/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr><!--Design of the image,height,width under table.-->
            <%
                        if (msg != null) {
            %><!--condition if message is not equal to null.-->
            <tr>
                <td style="font-family: verdana;color: red;font-size: 10px" align="center"><%=msg%></td>
            </tr>
            <%
                            session.removeAttribute("MSG");
                        } else {
                            session.setAttribute("MSG", "");
                        }
            %><!--Then session remove otherwise session will set the attribute-->
            <tr>
                <td colspan="4" valign="top">
                    <form method="post" action="">
                        <table cellpadding="3" cellspacing="3" align="center" width="83%" class="formTable">
                            <tr>
                                <td colspan="4">
                                    <table width="83%">
                                        <tr>
                                            <td align="center" class="heading" width="25%">Name</td>
                                            <td align="center" class="heading" width="20%">Mobile No</td>
                                            <td align="center" class="heading" width="55%">Feed back/Suggestion</td>
 <!--textfields-->
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div style="height: 350px;width: 100%;overflow: auto;border-style: none" class="grid">
                                        <table width="100%">

                                            <%
                                                        PreparedStatement pst = null;
                                                        Connection con = null;
                                                        ResultSet rst = null;
                                                        String name = null;
                                                        String mobileNo = null;
                                                        String feedback = null;


                                                        try {
                                                            con = connection.connect.makeConnection();
                                                            String query = "select Name,ContNo,Remarks from feed_back";
                                                            pst = con.prepareStatement(query);//pst is prepare statement where query parameter will be assign into it.
                                                            rst = pst.executeQuery();//here rst is a variable where the execute query which is store into it will be further store into rst.
                                                            while (rst.next()) {
                                                                name = rst.getString(1);
                                                                mobileNo = rst.getString(2);
                                                                feedback = rst.getString(3);

                                            %><!--Exceptional handling for error.-->
                                            <tr bgcolor="wheat">

                                                <td align="center" width="25%"><%=name%></td>
                                                <td align="center" width="20%"><%=mobileNo%></td>
                                                <td align="center" width="55%"><%=feedback%></td>

                                            </tr><!--background colour,centre width will be fixed by using these.-->
                                            <%                                                  }
                                                        } catch (Exception e) {
                                                            e.printStackTrace();
                                                        }
                                            %><!--After Try the catch will be handle the exception.-->
                                        </table>
                                    </div>
                                </td>
                            </tr>

                        </table>
                    </form>
                </td>
            </tr>
            <tr>
                <td height="50" colspan="2" align="center">
                    <span class="whitefont">Online Mall Shopping</span>
                </td>
            </tr>
        </table>
    </body><!--closing all the tags.-->
</html>
