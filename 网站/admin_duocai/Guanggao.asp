<%
    if request.Cookies("admin99aw")="" then
	response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.top.location.href='admin_login.asp';</script>"
	response.End
	else
	if request.Cookies("flag")<>"��������Ա" then
	response.Write "<p align=center><font color=red>��û�д���Ŀ����Ȩ�ޣ�</font></p>"
	response.End
	end if
	end if
%>
<!--#include file="../inc/conn.asp"-->
<%
  set rs=server.CreateObject("adodb.recordset")
  dim action,G_http,G_pic,G_id
  action=replace(trim(request.QueryString("action")),"'","")
  G_http=replace(trim(request.form("G_http")),"'","")
  G_pic=replace(trim(request.form("bookpic")),"'","")
  G_id=replace(trim(request.QueryString("G_id")),"'","")
  select case action
  
  case "add"   
      sql="insert into Guanggao (G_http,G_pic,G_time,G_type) values ('"& G_http &"','"& G_pic &"','"& date() &"','��վ')"
      conn.execute(sql)
	  response.Write("<script language='javascript'>alert('��ӳɹ�');location.href='Guanggao.asp';</script>")
  case "del"
      sql="delete from Guanggao where G_id="&G_id
	  conn.execute(sql)
	  response.Write("<script language='javascript'>alert('ɾ���ɹ�');location.href='Guanggao.asp';</script>")
  end select
  
%>
<HTML><HEAD><TITLE></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
.STYLE4 {
	color: red;
	font-weight: bold;
}
.STYLE5 {color: red}
-->
</style></HEAD>
<BODY>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
<tr> 
<td align="center" background="../images/admin_bg_1.gif" class="forumRowHighlight STYLE4">��վ������</td>
</tr>
<tr> 
<td class="forumRowHighlight" align="center" >ͼƬ��С��520*190<br>
  <table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" colspan="5" align="center"><span class="STYLE5">������</span></td>
    </tr>
	<form action="?action=add" name="myform" method="post" onSubmit="return place()">
  <tr>
    <td width="75" height="24" align="center">���ͼƬ��</td>
    <td width="293" height="24"><input name="bookpic" type="text" class="text_t" id="bookpic" size="30" readonly>
      <input name="Submit2" type="button" class="Button" onClick="window.open('../situjiaduotu.asp?formname=myform&editname=bookpic&uppath=bookpic&filelx=jpg','','status=no,scrollbars=no,top=100,left=200,width=420,height=165')" value="�ϴ�ͼƬ"></td>
    <td width="74">������ӣ�</td>
    <td width="202"><input name="G_http" type="text" class="text_t" id="G_http" value="http://"></td>
    <td width="73" height="24"><input type="submit" name="button1" class="Button" value="ȷ�����"></td>
  </tr>
    </form>
</table>
  <br>
  <br>
  <table width="717" border="0" cellpadding="0" cellspacing="1" bgcolor="#BACAEF">
    <tr>
      <td height="24" colspan="5" align="center" bgcolor="#FFFFFF"><span class="STYLE5">�༭���</span></td>
      </tr>
	  
	 <%
	   sql="select G_http,G_pic,G_id from Guanggao where G_type='��վ'"
	   rs.open sql,conn,1,1
	   if not rs.eof then
	 %> 
	 <%do while not rs.eof%>
    <tr>
      <td width="75" height="24" align="center" bgcolor="#FFFFFF">���ͼƬ��</td>
      <td width="293" height="24" bgcolor="#FFFFFF">&nbsp;<a href="../<%=rs(1)%>" target="_blank"><%=rs(1)%></a></td>
      <td bgcolor="#FFFFFF">������ӣ�</td>
      <td width="202" bgcolor="#FFFFFF">&nbsp;<a href="<%=rs(0)%>" target="_blank"><%=rs(0)%></a></td>
      <td height="24" align="center" bgcolor="#FFFFFF"><input onClick="return del(<%=rs(2)%>)" type="button" name="button13" class="Button" value="ɾ    ��"></td>
      </tr>
	 <%
	   rs.movenext
	   loop
	   end if
	   rs.close
	 %>
  </table>
  <br></td>
  </tr>
</table>
<script language="javascript">
function place(){
	if(myform.bookpic.value==""){
	alert("���ϴ����ͼƬ��");
	myform.bookpic.focus();
	return (false);
	}
	if((myform.G_http.value=="")||(myform.G_http.value=="http://")){
	alert("�����������ӣ�");
	myform.G_http.focus();
	return (false);
	}
}


function del(G_id){
if(confirm("�����Ҫɾ����"))
location.replace("Guanggao.asp?G_id="+G_id+"&action="+"del")
else
alert("��С�Ĳ�����");
}
</script>
</BODY>
</HTML>