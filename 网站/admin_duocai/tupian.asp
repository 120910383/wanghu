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
  dim action
  action=request("action")
  if action="save" then  
  dim tupian1,tupian2,tupian3,tupian4,tupian5,tupian6
  tupian1=trim(request("tupian1"))
  tupian2=trim(request("tupian2"))
  tupian3=trim(request("tupian3"))
  tupian4=trim(request("tupian4"))
  tupian5=trim(request("tupian5"))
  tupian6=trim(request("tupian6"))
  sql="update wm_gg set tupian1='"& tupian1 &"',tupian2='"& tupian2 &"',tupian3='"& tupian3 &"',tupian4='"& tupian4 &"',tupian5='"& tupian5 &"',tupian6='"& tupian6 &"'"
  conn.execute(sql)
  end if
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet" type="text/css">
<link href="images/Style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%set rs=server.CreateObject("adodb.recordset")
rs.open "select * from wm_gg",conn,1,1%>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF" class="tableBorder">
  <tr> 
<td height="25"align="center" bgcolor="#B5B6D6" class="forumRowHighlight"><b><font color="#ffffff">�̳ǹ������</font></b></td>
</tr>
<tr> 
<td class="forumRowHighlight"valign="top"> 
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
        <form name="form1" method="post" action="tupian.asp?action=save">
          <tr > 
            <td width="31%" align="center" bgcolor="#EAEAF3" class="forumRowHighlight">ͼƬ˵��</td>
            <td width="47%" align="center" bgcolor="#EAEAF3" class="forumRowHighlight">ͼƬ��ַ</td>
            <td width="22%" align="center" bgcolor="#EAEAF3" class="forumRowHighlight">�ϴ�ͼƬ</td>
          </tr>
          <tr > 
            <td align="center" bgcolor="#EAEAF3" class="forumRowHighlight"> ������ 510��367</td>
            <td align="center" bgcolor="#EAEAF3" class="forumRowHighlight"> <input name="tupian1" type="text" id="tupian1" size="28" value=<%=trim(rs("tupian1"))%>>            </td>
            <td align="center" bgcolor="#EAEAF3" class="forumRowHighlight"><input name="Submit22" type="button" class="Button" onClick="window.open('../situjiaduotu.asp?formname=form1&editname=tupian1&uppath=bookpic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="�ϴ�ͼƬ"></td>
          </tr>
          <tr > 
            <td align="center" bgcolor="#EAEAF3" class="forumRowHighlight">ɱ����Ϸ 510��367</td>
            <td align="center" bgcolor="#EAEAF3" class="forumRowHighlight"> <input name="tupian2" type="text" id="tupian2" size="28" value=<%=trim(rs("tupian2"))%>>            </td>
            <td align="center" bgcolor="#EAEAF3" class="forumRowHighlight"><input name="Submit22" type="button" class="Button" onClick="window.open('../situjiaduotu.asp?formname=form1&editname=tupian2&uppath=bookpic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="�ϴ�ͼƬ"></td>
          </tr>
          <tr > 
            <td align="center" bgcolor="#EAEAF3" class="forumRowHighlight">�Զ��� 510��367</td>
            <td align="center" bgcolor="#EAEAF3" class="forumRowHighlight"> <input name="tupian3" type="text" id="tupian3" size="28" value=<%=trim(rs("tupian3"))%>>            </td>
            <td align="center" bgcolor="#EAEAF3" class="forumRowHighlight"><input name="Submit22" type="button" class="Button" onClick="window.open('../situjiaduotu.asp?formname=form1&editname=tupian3&uppath=bookpic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="�ϴ�ͼƬ"></td>
          </tr>
          <tr > 
            <td align="center" bgcolor="#EAEAF3" class="forumRowHighlight">����齫 510��367</td>
            <td align="center" bgcolor="#EAEAF3" class="forumRowHighlight"> <input name="tupian4" type="text" id="tupian4" size="28" value=<%=trim(rs("tupian4"))%>>            </td>
            <td align="center" bgcolor="#EAEAF3" class="forumRowHighlight"><input name="Submit22" type="button" class="Button" onClick="window.open('../situjiaduotu.asp?formname=form1&editname=tupian4&uppath=bookpic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="�ϴ�ͼƬ"></td>
          </tr>
          <tr > 
            <td align="center" bgcolor="#EAEAF3" class="forumRowHighlight">�ٱ�˫�� 510��367</td>
            <td align="center" bgcolor="#EAEAF3" class="forumRowHighlight"> <input name="tupian5" type="text" id="tupian5" size="28" value=<%=trim(rs("tupian5"))%>>            </td>
            <td align="center" bgcolor="#EAEAF3" class="forumRowHighlight"><input name="Submit22" type="button" class="Button" onClick="window.open('../situjiaduotu.asp?formname=form1&editname=tupian5&uppath=bookpic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="�ϴ�ͼƬ"></td>
          </tr>
          <tr > 
            <td align="center" bgcolor="#EAEAF3" class="forumRowHighlight">��ʽ���� 510��367</td>
            <td align="center" bgcolor="#EAEAF3" class="forumRowHighlight"> <input name="tupian6" type="text" id="tupian6" size="28" value=<%=trim(rs("tupian6"))%>>            </td>
            <td align="center" bgcolor="#EAEAF3" class="forumRowHighlight"><input name="Submit22" type="button" class="Button" onClick="window.open('../situjiaduotu.asp?formname=form1&editname=tupian6&uppath=bookpic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="�ϴ�ͼƬ"></td>
          </tr>
          <tr> 
            <td colspan="3"  align="center" bgcolor="#EAEAF3" class="forumRowHighlight"> <input name="Submit" type="submit" class="Button" value="�ύ����">            </td>
          </tr>
        </form>
      </table>
</td>
</tr>
</table>


</body>
</html>