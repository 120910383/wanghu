<%
uppath=request("uppath")&"/"			'�ļ��ϴ�·��
filelx=request("filelx")				'�ļ��ϴ�����
formName=request("formName")			'�ش�����ҳ��༭������Form��Name
EditName=request("EditName")			'�ش�����ҳ��༭���Name
userid=request("userid")
%>
<html><head><title>ͼƬ�ϴ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/css.css" rel="stylesheet" type="text/css">
<script language="javascript">
<!--
function mysub()
{
		esave.style.visibility="visible";
}
-->
</script>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style></head>
<body>
<form name="form1" method="post" action="situjiaduotu2.asp?userid=<%=userid%>" enctype="multipart/form-data" >
<div id="esave" style="position:absolute; top:18px; left:40px; z-index:10; visibility:hidden"> 
<TABLE WIDTH=340 BORDER=0 CELLSPACING=0 CELLPADDING=0>
<TR><td width=20%></td>
<TD bgcolor=#ff0000 width="60%"> 
<TABLE WIDTH=100% height=120 BORDER=0 CELLSPACING=1 CELLPADDING=0>
<TR> 
<td bgcolor=#ffffff align=center><font color=red>�����ϴ��ļ������Ժ�...</font></td>
</tr>
</table>
</td><td width=20%></td>
</tr></table></div>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
<tr> 
<td align="center" background="images/admin_bg_1.gif"><b><font color="#ffffff">ͼƬ��</font></b>�ϴ����� 116*97</td>
</tr>
<tr > 
<td align="center" id="upid" height="80" ><b><font color="#ffffff">��
  <input type="hidden" name="userid" value="<%=userid%>">
      <input type="hidden" name="filepath" value="<%=uppath%>">
      <input type="hidden" name="filelx" value="<%=filelx%>">
      <input type="hidden" name="EditName" value="<%=EditName%>">
      <input type="hidden" name="FormName" value="<%=formName%>">
      <input type="hidden" name="act" value="uploadfile">
</font></b> ѡ���ļ�: 
<input type="file" class="hui_12" name="file1" size="20" value="">
<br>
<br>
<input type="submit" name="Submit" value="��ʼ�ϴ�" class="hui_12" onClick="javascript:mysub()"></td>
</tr>
</table>
</form>
</body>
</html>