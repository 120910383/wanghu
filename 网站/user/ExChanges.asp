<!--#include file="../Inc/Config.asp" -->
<%
  dim C_id,C_name,C_money,C_pic,C_vip,C_cun,C_content,MemberOrder,bnak
  C_id=replace(trim(request.QueryString("C_id")),"'","")
  if C_id="" or isnumeric(C_id)=false then
     response.Write("<script langage='javascript'>alert('�Ƿ�������');history.go(-1);</script>")
	 response.End()
  end if
%>
<%CxGame.DbConn("News")%>
<%
  set rs=conn.execute("select C_name,C_money,C_pic,C_vip,C_cun,C_content,C_id from Jiangpin where C_id="&C_id)
  if not rs.eof then
     C_name=rs(0)
	 C_money=rs(1)
	 C_pic=rs(2)
	 C_vip=rs(3)
	 C_cun=rs(4)
	 C_content=rs(5)
	 C_id=rs(6)
  end if
  rs.close
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��Ʒ�һ�--������ξ�����ף����Ŀ��ģ�</title>
<style type="text/css">
<!--
body {
	background-color: #1d84d4;
	background-image: url();
	background-repeat: repeat-x;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="images/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style></head>

<body>
<table width="770" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="770" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="396" height="199" align="center"><table width="338" border="0" cellpadding="0" cellspacing="1" bgcolor="c0c0c0">
      <tr>
        <td width="336" height="230" align="center" bgcolor="#FFFFFF"><img src="../<%=C_pic%>" width="320" height="210"></td>
      </tr>
    </table></td>
    <td width="374" valign="top"><table width="350" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" align="center" class="14blue"><%=C_name%></td>
      </tr>
    </table>
	<hr size="1" color="0f87ff" width="350" align="left">
	<table width="350" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" class="xu">��&nbsp; �ţ�<%=C_id%></td>
      </tr>
      <tr>
        <td height="24" class="xu">��&nbsp; �棺<%=C_cun%>��</td>
      </tr>
      <tr>
        <td class="xu">&nbsp;</td>
      </tr>
    </table>	</td>
  </tr>
  <tr>
    <td height="24" align="center" class="orenge">(ͼƬ�����ο���������ʵ��Ϊ׼)</td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="770" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="18" height="81">&nbsp;</td>
    <td width="733" valign="top" class="hang"><%=C_content%></td>
    <td width="19">&nbsp;</td>
  </tr>
</table>
<script>
function check(){
	if(theform.username.value==""){
	alert("����д����ʵ������");
	theform.username.focus();
	return (false);
	}
	if(theform.password.value==""){
	alert("����д���������룡");
	theform.password.focus();
	return (false);
	}
	if(theform.C_idno.value==""){
	alert("����д�����֤���룡");
	theform.C_idno.focus();
	return (false);
	}
	if(theform.lianxi.value==""){
	alert("����д����ϵ��ʽ��");
	theform.lianxi.focus();
	return (false);
	}
	if(theform.email.value==""){
	alert("����д�õ������䣡");
	theform.email.focus();
	return (false);
	}
}
function place(){
if(confirm("���Ҫ������"))
location.replace("ExChange.asp")
}
</script>
</body>
</html>
 