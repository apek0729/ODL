<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="HealthProfHeader.jsp"%>
<%
String error=request.getParameter("error");
if(error==null || error=="null"){
 error="";
}
%>
<%
String message=request.getParameter("message");
if(message==null || message=="null"){
 message="";
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create a new observation type !</title>

<script type="text/javascript" src="gen_validatorv4.js">
	
</script>
</head>
<body>
<% // JDBC CONNECTION
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl","semani2","001106797");  %>
<center>
<div style="color:#FF0000" id='nt_form_nt_type_errorloc'></div>
<div style="color:#FF0000" id='nt_form_nt_amt_errorloc' ></div>


<h2>Add a new observation type:</h2>

<form id="f1" name="nt_form" action="hpnewobstypeadd.jsp" method="post">
<div style="color:#FF0000"><%=error%></div><div style="color:#00FF00"><%=message%></div>
New type: <input type="text" name="nt_type"/><br/><br/>

Category:<select name="nt_cat">

<option value="4">General</option>
<option value="1">Behavioral</option>

<option value="2">Physiological</option>
<option value="3">Psychological</option>

</select><br/>
<br/>
Attribute: <input type="text" name="nt_amt"/><br/><br/>

<br/>
Illness :<select name="illness">
		<option value="5">N/A</option>
		<% 
			Statement st2= con.createStatement();
	   		ResultSet rs2 = st2.executeQuery("select pc_id,pc_name from patientclass where pc_id=1 OR pc_id=2 OR pc_id=3 OR pc_id=4");
	   		while(rs2.next())
	   		{ %>
	   		
	   			<option value="<%= rs2.getInt(1) %>"><%= rs2.getString(2) %></option>
	   		
		<% }
			rs2.close();
		
		%>
	</select>
<br/><br/>

<input type="submit" value="Create Type"/><br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/><br/><br/>

<a href="newobservation.jsp">Back to observation types</a>

</form>

<script type="text/javascript">
 var frmvalidator  = new Validator("nt_form");
 
 frmvalidator.addValidation("nt_type","req","Type cannot be left blank");
 frmvalidator.addValidation("nt_amt","req","Value cannot be left blank");
 
 
 frmvalidator.EnableOnPageErrorDisplay();
 frmvalidator.EnableMsgsTogether();
 
 
 </script>
</center>
</body>
</html>