<%
dim color,colorx
if session("Flag")=1 then
	color="#000000"
elseif session("Flag")=2 then
	color="#000000"
else
	 color="#CCCCCC"
end if

if session("Flag")=1 then
	colorx="#000000"
else
	 colorx="#CCCCCC"
end if

REM ������Ŀ����
dim menu(3,10)
menu(0,0)="&nbsp;&nbsp;��ҹ���"
menu(0,1)="<a href=intobank.asp class=green_link>��������</a> "
menu(0,2)="<a href=outbank.asp class=green_link>������ȡ��</a>"
menu(0,3)="<a href=TransferJb.asp class=green_link>���ת��</a>"
menu(0,4)="<a href=TransfersLog.Asp class=green_link>ת�ʼ�¼</a>"
menu(0,5)="<a href=ExChange.asp class=green_link>��Ҷһ�</a>"


menu(1,0)="&nbsp;&nbsp;��ֵ��ѯ"
menu(1,1)="<a href=../Paybuy.asp class=green_link>���߳�ֵ</a>"
menu(1,2)="<a href=mypay.asp class=green_link>�û���ֵ��¼</a></a>"

menu(2,0)="&nbsp;&nbsp;����Ӫ������"
menu(2,1)="<a href=commend.asp class=green_link>Ӫ������</a>"

menu(3,0)="&nbsp;&nbsp;�ʻ�����"
menu(3,1)="<a href=default.asp class=green_link>���˹���</a>"
menu(3,2)="<a href=my.asp class=green_link>�޸ĸ�����Ϣ</a>"
menu(3,3)="<a href=my-pwd.asp class=green_link>�޸�����</a>"
menu(3,4)="<a href=bank-pwd.asp class=green_link>�޸���������</a>"
menu(3,5)="<a href=EditProtect.asp class=green_link>�޸���������</a>"
%>
<title>����ҳ��</title>
<META content="MSHTML 5.00.3315.2870" name=GENERATOR>
<SCRIPT language=javascript1.2>
function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
}
}
</SCRIPT>

<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
	color: #FFFFFF;
	font-weight: bold;
}
body {
	background-image: url(../images/body_bg.jpg);
}
-->
</style><BODY leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<table width=160 cellpadding=0 cellspacing=0 border=0 align="center" height="129" bgcolor="#FFFFFF"> 
<tr><td height="22" class="green" align="center">�����ʻ�</td></tr>
<tr>
  <td height="107" valign=top>
 
  <table width="160" border="0" align="left" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"> <%
	dim j
	dim tmpmenu
	dim menuname
	dim menurl
for i=0 to ubound(menu,1)
%>
    <tr>
      <td><table cellpadding=0 cellspacing=0 width=160 align=center>
  <tr>
    <td height=22 background="images/bg.gif" id=menuTitle1 onClick="showsubmenu(<%=i%>)" onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title';> 
      <span><%=menu(i,0)%></span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu<%=i%>'>
<div class=sec_menu style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=158>
	<%
	for j=1 to ubound(menu,2)
	if isempty(menu(i,j)) then exit for
	%>
<tr><td height=20>&nbsp;&nbsp;&nbsp;&nbsp;<%=menu(i,j)%></td></tr>
<%
	next
%>
</table>
    </div>
<div  style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=158>
<tr><td height=10></td></tr>
</table>
    </div>
  </td>
  </tr>
  

	 </table></td>
    </tr>
	<%next%>
	<tr>
    <td height="22" background="images/bg.gif">&nbsp;&nbsp;<a href="exit.asp" class="write_link">�˳�</a> </td>
	</tr>
	<tr><td height="22"></td></tr>
</table>


</td></tr></table>
  