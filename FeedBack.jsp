<%--
    Document   : FeedBack
    Created on : Feb 22, 2017, 3:15:07 PM
    Author     : Amit Kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%><!--jsp code encoding-->

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/menu.css"/> <!--link to css stylesheet-->
        <link type="text/css" rel="stylesheet" href="css/stylesheet.css"/> <!--link to css stylesheet-->
        <link type="text/css" rel="stylesheet" href="css/style-sheet.css"/><!--link to css stylesheet-->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>//<!--link to css stylesheet-->
        <title>Feedback</title>//title of code//
        <script type="text/javascript">//Javascript code is using in html.
            function valid() {
                //alert('calling');
                var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                // var address = document.forms[form_id].elements[txtemail_id].value;
                var address = document.getElementById('txtemail').value;
                if(reg.test(address) == false) {
                    alert('Invalid Email Address');//alert message invalid Email Address
                    return false;//checking validation
                }
            }

        </script>
        <script type="text/javascript">
            function contact(i)//Contact Textfield
            {
                if(i.value.length>0)//if condition checking (here i is that where value of user entered mobile will be store and match the lenght)
             {
                    i.value = i.value.replace(/[^\d]+/g, '');//accept only digit

                }
            }
            function mob(rl)
            {
                //var rl=document.getElementById("txtcontactno").value;
                if(rl.toString().length<10||rl.toString().length>10)
                {
                    alert("Mobile No. must be of ten digits");//alert message
                    return false;
                }
            }
        </script>
        <!--page design-->
    </head>
    <body>
        <table width="83%" align="center"  bgcolor="white">
            <tr height="20px">
                <td>
                    <table width="100%">                        
                        <tr>
                            <td>
                                <%@include file="header_menu.html" %>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" width="83%" style="height:15px;" class="toplinls"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td bgcolor="white"  align="center">
                    <form action="enquiry" method="post">
                        <table align="center" cellpadding="3" cellspacing="3">
                            <tr>
                                <td colspan="2" height="40px" valign="top" align="center">
                                    <strong style="font-size: 18px;font-weight: bold;">Customer Service</strong>                            </td>
                            </tr><!--Form table cellpadding spacing as well as align is to be set in the code-->
                            <%
                                        String msg = null;
                                        msg = (String) session.getAttribute("MSG");//session
                                        if (msg != null) {
                            %>
                            <tr>
                                <td style="font-family: verdana;color: red;font-size: 10px" align="center" colspan="2"><%=msg%></td>
                            </tr>
                            <%
                                            session.removeAttribute("MSG");
                                        } else {
                                            session.setAttribute("MSG", "");
                                        }
                            %>
                            <tr><td colspan="2" class="t01">* Mandatory Fields</td></tr>
                            <tr>
                                <td class="form-field1" align="left">Name*</td><!--textfield name-->
                                <td class="form-field1" align="left"><input type="text" name="txtname" size="35"></td>
                            </tr>
                            <tr>
                                <td class="form-field1" align="left">Email*</td><!--textfield email-->
                                <td class="form-field1" align="left"><input type="text" name="txtemail" size="35" onblur="valid()"></td>
                            </tr>
                            <tr>
                                <td class="form-field1" align="left">Contact No.*</td><!--textfield contactno-->
                                <td class="form-field1" align="left"><input type="text" name="txtcontactno" size="35" onkeyup=" return contact(this)" "></td>
                            </tr>

                            <tr>
                                <td class="form-field1" align="left" >
                                    Feedback / Suggestion*&nbsp;&nbsp;

                                </td><!--tag define-->
                                <td>
                                    <select name="cmbfeedback" style="width:240px;">
                                        <option value="Feedback">Feedback</option><!--option show feedback-->
                                        <option value="Suggestion">Suggestion</option><!--option show suggestion-->
                                    </select><!--option selection-->
                                </td>
                            </tr>
                            <tr>
                                <td class="form-field1" align="left">Remarks*</td><!--Remark can be entered by user in the tectarea-->
                                <td class="form-field1" align="left">
                                    <textarea style="width:240px;height: 50px;" name="txtarearemarks" id="txtarearemarks">

                                    </textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="form-field1" align="center" width="40%">&nbsp;</td>
                                <td class="form-field1" align="left">
                                    <input type="submit" name="btnsubmit" class="button" value="Submit">
                                    <input type="reset" name="btnreset" class="button" value="Reset">
                                </td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
            <tr>
                <td height="50" colspan="2" align="center" class="toplinls" width="100%">
                    <span class="whitefont">Online Shopping</span><!--online shopping shows in bottom of the page-->
               </td>
            </tr>
        </table>
    </body>
</html>
