<%
 if request.Cookies("admin99aw")="" or request.Cookies("flag")="" then
  response.write "<script language='javascript'>"
  response.write"parent.location.href='admin_login.asp';</SCRIPT>" 
  response.end
 end if
%>
<HTML><HEAD><TITLE></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
.head {	display: none;
}
.style4 {color: red}
-->
</style></HEAD>
<BODY>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
<form action="Add_c.asp" method="post" name=add id="add" onSubmit="return checkForm()">
<tr> 
<td class="forumRowHighlight" align="center" background="../images/admin_bg_1.gif"><b><font color="red">������Ϣ����</font></b></td>
</tr>
<tr> 
<td class="forumRowHighlight" align="center" ><table width="800" border="0" cellpadding="0" cellspacing="1" bgcolor="#575757">
  <tr bgcolor="#FFFFFF">
    <td width="148" height="30" align="center">��Ϣ���⣺</td>
    <td colspan="3" align="left"> &nbsp;
      <input name="C_title" type="text" class="text_t" id="pic43" size="60"></td>
    </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30" align="center">����ʱ�䣺</td>
    <td width="252" align="left">
	   &nbsp;
	   <select name="C_date">
	  <option value="1">---1��---</option>
	  <option value="2">---2��---</option>
	  <option value="3">---3��---</option>
	  <option value="7">--һ��---</option>
	  <option value="15">--�����--</option>
	  <option value="30">--һ����--</option>
	</select>	</td>
    <td width="148" align="center">����ʱ�䣺</td>
    <td width="252" align="left"> &nbsp;
      <select name="C_over">
      <option value="1">---1��---</option>
      <option value="2">---2��---</option>
      <option value="3">---3��---</option>
      <option value="7">--һ��---</option>
      <option value="15">--�����--</option>
      <option value="30">--һ����--</option>
    </select>
      <span class="style4">�ӱ���������</span></td>
  </tr>
  <tr align="left" bgcolor="#BACAEF">
    <td height="30" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ��Ϣ���� <font color="#FF0000">*</font></td>
    </tr>
  <tr bgcolor="#FFFFFF">
    <td height="200" colspan="4"><IFRAME ID="eWebEditor1" src="../htmledit/ewebeditor.asp?id=newsinfo&style=s_light&savefilename=myText2" frameborder="0" scrolling="no" width="800" height="300"></IFRAME>
          <input name="newsinfo" type="hidden" id="newsinfo"></td>
    </tr>
  <tr align="center" bgcolor="#FFFFFF">
    <td height="30" colspan="4"><input type="submit" value="ȷ ��" name="B1"  class=button>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" value="�� д" name="B2"  class=button></td>
  </tr>
</table></td>
  </tr>
  </form>
</table>
</BODY>
</HTML>
<script language="JavaScript">
<!--
function checkForm()
{
	if (document.add.C_title.value=="") {
		alert("���������±���.");
		document.add.C_title.focus();
		return false;
	}	
	return true
}
//-->
</script>
