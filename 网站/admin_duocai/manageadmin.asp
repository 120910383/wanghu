<!--#include file="../inc/conn.asp"-->
<%if request.Cookies("admin99aw")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.top.location.href='admin_login.asp';</script>"
response.End
else
if request.Cookies("flag")<>"��������Ա" then
response.Write "<p align=center><font color=red>��û�д���Ŀ����Ȩ�ޣ�</font></p>"
response.End
end if
end if
%>
<html><head><title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {
	color: #000000;
	font-weight: bold;
}
-->
</style>
<link href="images/style.css" rel="stylesheet" type="text/css">
<link href="images/css.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="96%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#480789">
  <tr>
    <td align="center" bgcolor="#FFFFFF"><br>
      <table width="584" height="222"  border="0" cellpadding="0" cellspacing="0" bgcolor="#CCFFFF">
      <tr>
        <td height="222" align="center" valign="top"><br>
            <table class="tableBorder" width="560" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
              <tr>
                <td class="forumRowHighlight" colspan="4" align="center" background="../images/admin_bg_1.gif"><span class="style1">����Ա����</span></td>
              </tr>
              <tr align="center" >
                <td class="forumRowHighlight" width="102">����Ա</td>
                <td class="forumRowHighlight" width="102">�� ��</td>
                <td class="forumRowHighlight" width="105">Ȩ ��</td>
                <td class="forumRowHighlight" width="203">�� ��</td>
              </tr>
              <%set rs=server.CreateObject("adodb.recordset")
		rs.Open "select * from admin",conn,1,1
		do while not rs.EOF%>
              <form name="myform" method="post" action="saveadmin.asp?action=edit&id=<%=int(rs("id"))%>">
                <tr align="center" >
                  <td class="forumRowHighlight" ><input name="admin" type="text" class="form" value="<%=trim(rs("admin"))%>" size="16"></td>
                  <td class="forumRowHighlight" ><input name="password" type="text" class="form" size="16"></td>
                  <td class="forumRowHighlight" ><%=rs("classname")%>
                  </td>
                  <td class="forumRowHighlight" ><input name="Submit" type="submit" class="Button" value="��  ��">
                    &nbsp;<a href="saveadmin.asp?id=<%=int(rs("id"))%>&action=del" onClick="return confirm('��ȷ��Ҫɾ�����û���')"><font color=red>ɾ��</font></a> </td>
                </tr>
              </form>
              <%rs.movenext
		loop
		rs.close
		set rs=nothing
		%>
            </table>
          <br>
            <table class="tableBorder" width="560" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
              <tr>
                <td class="forumRowHighlight" colspan="4" align="center" background="../images/admin_bg_1.gif"><span class="style1">��ӹ���Ա</span></td>
              </tr>
              <tr align="center" >
                <td class="forumRowHighlight" width="106">����Ա</td>
                <td class="forumRowHighlight" width="106">�� ��</td>
                <td class="forumRowHighlight" width="192">Ȩ ��</td>
                <td width="126" class="forumRowHighlight">�� ��</td>
              </tr>
              <form name="theform" method="post" action="saveadmin.asp?action=add" onSubmit="return checkk();">
                <tr align="center" >
                  <td class="forumRowHighlight" ><input name="admin2" type="text" class="form" size="16"></td>
                  <td class="forumRowHighlight" ><input name="password2" type="text" class="form" size="16">
                  </td>
                  <td align="center" class="forumRowHighlight" ><input type="radio" name="flag2" value="��������Ա">
                  ��������Ա
                    <input name="flag2" type="radio" value="һ��" checked>һ��</td>
                  <td class="forumRowHighlight" ><input name="Submit2" type="submit" class="Button" value="�� �� �� �� Ա">
                  </td>
                </tr>
              </form>
          </table><br></td>
      </tr>
    </table>
    <br></td>
  </tr>
</table>
<script language="javascript">
function checkk(){
if(theform.admin2.value==""){
alert("����д���û�����");
theform.admin2.focus();
return (false);
}
if(theform.password2.value==""){
alert("����д�����룡");
theform.password2.focus();
return (false);
}
}
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</body>
</html>