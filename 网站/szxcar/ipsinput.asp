<%
  dim money,car,content,money1
  money=replace(trim(request.Form("money")),"'","")
  car=replace(trim(request.Form("car")),"'","")
  content=replace(trim(request.Form("content")),"'","")
  money1=clng(money)/100
  'response.Write money1
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����Ƶ��Ϸ|��ֵ|ȫ�������г�ֵ����ֵ</title>
<style type="text/css">
<!--
body {
	background-image: url(../images/body_bg.jpg);
	background-repeat: repeat-x;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #7bdd14;
}
-->
</style>
<link href="images/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
a {
	font-size: 14px;
	color: #FFFFFF;
}
a:visited {
	color: #FFFFFF;
	text-decoration: none;
}
a:hover {
	color: b9b9b9;
	text-decoration: underline;
}
a:link {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
body,td,th {
	font-size: 12px;
}
-->
</style></head>

<body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<table width="770" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="252" height="182" align="center" valign="top"><table width="252" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
      <table width="150" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
        <tr>
          <td height="65" align="center" bgcolor="#FFFFFF"><img src="images/szx.jpg" width="114" height="80"></td>
        </tr>
      </table>
      <table width="252" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="200" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="24">���ƣ�<%=car%></td>
        </tr>
        <tr>
          <td height="24">�۸�<%=money1%>Ԫ</td>
        </tr>
        <tr>
          <td height="24">˵����<%=content%></td>
        </tr>
      </table></td>
    <td width="518" align="center">
	
	
	
	<table width="400" border="0" cellspacing="0" cellpadding="0">
	<form action="send.asp" method="post" name="theform" onSubmit="return check()">
      <tr>
        <td height="62" align="center"><table width="400" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
          <tr>
            <td width="95" height="30" align="right" bgcolor="#FFFFFF">�������û�����</td>
            <td width="302" height="30" bgcolor="#FFFFFF"> &nbsp;
              <input type="text" name="username"></td>
          </tr>
          <tr>
            <td height="30" align="right" bgcolor="#FFFFFF">ȷ���û�����</td>
            <td height="30" bgcolor="#FFFFFF"> &nbsp;
              <input type="text" name="username1"></td>
          </tr>
        </table></td>
        </tr>
      
      <tr>
        <td height="40" align="center"><input type="hidden" value="<%=money%>" name="money" /><input type="hidden" value="<%=car%>" name="car" /><input type="button" value="��һ��" name="button1" onClick="javascript:history.go(-1);">&nbsp;&nbsp;
          <input type="submit" value="��һ��" name="button2"></td>
        </tr>
		</form>
    </table>
	
	
	
	</td>
  </tr>
</table>
<script language="javascript">
function check(){
  if(theform.username.value==""){
  alert("����д���û�����");
  theform.username.focus();
  return (false);
  }
  if(theform.username1.value==""){
  alert("��ȷ���û�����");
  theform.username1.focus();
  return (false);
  }
  if(theform.username.value != theform.username1.value){
  alert("����������û�����һ��Ŷ��");
  theform.username1.focus();
  return (false);
  }
}
</script>
</body>
</html>
