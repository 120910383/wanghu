<%
    if request.Cookies("admin99aw")="" then
	response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='admin_login.asp';</script>"
	response.End
	else
	if request.Cookies("flag")<>"��������Ա" then
	response.Write "<p align=center><font color=red>��û�д���Ŀ����Ȩ�ޣ�</font></p>"
	response.End
	end if
	end if
%>
<!--#include file="../inc/conn.asp"-->
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
.STYLE7 {color: #FFFFFF; font-weight: bold; }
-->
</style></HEAD>
<BODY>
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
<tr> 
<td align="center" background="../images/admin_bg_1.gif" class="forumRowHighlight STYLE4">�ҽ���Ա����</td>
</tr>
<tr> 
<td class="forumRowHighlight" align="center" ><table width="865" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="102" height="24" align="center" bgcolor="#BACAEF"><span class="STYLE7">��Ա����</span></td>
    <td width="171" height="24" align="center" bgcolor="#BACAEF"><span class="STYLE7">��ϵ��ʽ</span></td>
    <td width="139" height="24" align="center" bgcolor="#BACAEF"><span class="STYLE7">EMAIL</span></td>
    <td width="185" height="24" align="center" bgcolor="#BACAEF"><span class="STYLE7">˵��</span></td>
    <td width="131" height="24" align="center" bgcolor="#BACAEF"><span class="STYLE7">�ҽ�����</span></td>
    <td width="137" height="24" align="center" bgcolor="#BACAEF"><span class="STYLE7">�༭</span></td>
    </tr>
	
	<%
	    set rs=server.CreateObject("adodb.recordset")
		sql="select * from Duihuan order by C_id desc"
		rs.open sql,conn,1,1
		if not rs.eof then
		dim page
	    page=clng(request("page"))
	    rs.pagesize=18
	    if page < 1 then page = 1
	    pages=rs.pagecount
	    if page > pages then page=pages
	    rs.absolutepage=page
	  %>
      <%
	    for i = 1 to rs.pagesize
	  %>
  <tr>
    <td height="24" align="center"><%=rs("username")%></td>
    <td height="24" align="center"><%=rs("lianxi")%></td>
    <td height="24" align="center"><%=rs("email")%></td>
    <td height="24" align="center"><%=rs("D_content")%></td>
    <td height="24" align="center">
	    <%
		  set rs1=conn.execute("select * from Jiangpin where c_id="&rs("c_id"))
		  if not rs1.eof then
		  response.Write(""& rs1("C_name") &"")
		  C_id=rs1("C_id")
		  end if
		%>	
	</td>
    <td height="24" align="center"><%if C_id="" then%>û�д˽�Ʒ��<%else%><%if clng(rs("Y_huan"))=1 then%>�ѷ���<%else%><input name="button1" type="button" class="Button" value="��ϵ" onClick="javascript:location.href='lianxi.asp?id='+<%=rs("id")%>+'&userid='+<%=rs("userid")%>+'&C_money='+<%=rs1("C_money")%>+'&C_vip='+<%=rs1("C_vip")%>+'&C_id='+<%=rs("C_id")%>;"><%end if%><%end if%>
      &nbsp;
        <input name="button12" type="button" class="Button" value="ɾ��" onClick="return place(<%=rs("id")%>)"></td>
    </tr>
	<%
	  rs.movenext
	  if rs.eof or rs.bof then exit for
	  next
	  end if
	%>
</table>
  <br>
  <table>
    <tr>
      <td><%
		  if page < 2 then
		  response.Write "&nbsp;��ҳ&nbsp;��һҳ"
		  else
		  response.Write "&nbsp;<a class=hui_link href='?page=1'>��ҳ</a>"
		  response.Write "&nbsp;<a class=hui_link href='?page="& (page - 1) &"'>��һҳ</a>"
		  end if
		  if pages - page < 1 then
		  response.Write "&nbsp;��һҳ&nbsp;βҳ"
		  else
		  response.Write "&nbsp;<a class=hui_link href='?page="& (page + 1) &"'>��һҳ</a>"
		  response.Write "&nbsp;<a class=hui_link href='?page="& pages &"'>βҳ</a>"
		  end if
		  response.write "&nbsp;ҳ�Σ�<strong><font color=red>"&Page&"</font>/"& pages &"</strong>ҳ "
          response.write "&nbsp;��<b><font color='#FF0000'>"& rs.recordcount &"</font></b>����¼ <b>"& rs.pagesize &"</b>����¼/ҳ"
		%>
      </td>
    </tr>
  </table></td>
  </tr>
</table>
<script>
function place(id){
if(confirm("���Ҫɾ����"))
location.replace("del_P.asp?id="+id)
else
alert("��С�Ĳ�����!");
}
</script>
</BODY>
</HTML>