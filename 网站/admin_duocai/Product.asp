<%if request.Cookies("admin99aw")="" then
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
.STYLE5 {
	color: #FFFFFF;
	font-weight: bold;
}
-->
</style></HEAD>
<BODY>
<table width="90%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="tableBorder">
<tr> 
<td align="center" background="../images/admin_bg_1.gif" class="forumRowHighlight"><span class="STYLE4">�һ���Ʒ</span></td>
</tr>
<tr> 
  <td align="center" valign="baseline" ><table width="100%" border="0" cellspacing="0" cellpadding="3">
      <tr bgcolor="#BACAEF">
        <td width="18%" align="center"><font color="#FFFFFF"><strong>����</strong></font></td>
        <td align="center" bgcolor="#BACAEF"><strong><font color="#FFFFFF">���</font></strong></td>
        <td align="center"><strong><font color="#FFFFFF">ͼƬ</font></strong></td>
        <td align="center"><span class="STYLE5">��Ա��</span></td>
        <td align="center"><span class="STYLE5">VIP��</span></td>
        <td align="center"><span class="STYLE5">���</span></td>
        <td align="center"><span class="STYLE5">���ʱ��</span></td>
        <td width="13%" align="center"><font color="#FFFFFF"><strong>����</strong></font></td>
      </tr>
      <%
	    set rs=server.CreateObject("adodb.recordset")
		sql="select * from Jiangpin order by C_id desc"
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
        <td align="center"><%=rs("c_name")%></td>
        <td width="10%" align="center"><%=rs("c_type")%></td>
        <td width="20%" align="center"><a href="../<%=rs("c_PIC")%>" target="_blank"><%=rs("c_PIC")%></a></td>
        <td width="10%" align="center"><%=rs("c_money")%></td>
        <td width="9%" align="center"><%=rs("c_vip")%></td>
        <td width="8%" align="center"><%=rs("c_cun")%></td>
        <td width="12%" align="center"><%=rs("c_time")%></td>
        <td align="center">[<a href="S_del.asp?S_id=<%=rs("c_id")%>" onClick="return confirm('��ȷ��Ҫɾ����');">ɾ��</a>]&nbsp; [<a href="javascript:" onClick="window.open('Edit_S.asp?c_id=<%=rs("c_id")%>','','toolbar=yes,resizable=yes')">�޸�</a>]</td>
      </tr>
      <%
	    rs.movenext
		if rs.eof or rs.bof then exit for
		next
		end if
	  %>
      <tr>
        <td colspan="8">��
          <input name="Submit22" type="button" class="Button" onClick="window.open('Add_Pro.asp','','scrollbars=yes,toolbar=yes,resizable=yes')" value=" ��  �� "></td>
      </tr>
      <tr>
        <td colspan="8" align="center"><hr width="95%" style="color:#BACAEF"></td>
      </tr>
      <tr>
        <td colspan="8" align="center"><table>
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
		%>            </td>
          </tr>
        </table></td>
      </tr>
  </table></td>
</tr>
</table>
<script>
	function regInput(obj, reg, inputStr)
	{
		var docSel	= document.selection.createRange()
		if (docSel.parentElement().tagName != "INPUT")	return false
		oSel = docSel.duplicate()
		oSel.text = ""
		var srcRange	= obj.createTextRange()
		oSel.setEndPoint("StartToStart", srcRange)
		var str = oSel.text + inputStr + srcRange.text.substr(oSel.text.length)
		return reg.test(str)
	}
</script>
<%
  rs.close
  set rs=nothing
  conn.close
  set conn=nothing
%>
</BODY>
</HTML>