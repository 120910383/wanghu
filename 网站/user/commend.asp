<!--#include file="../Inc/Config.asp" -->
<!--#include file="../Inc/md5VB.asp" -->
<%
CxGame.IsCheckLogin()
%>

<link href="images/css.css" rel="stylesheet" type="text/css">
<table width="770" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><!--#include file="Top.asp" --></td>
  </tr>
</table>
<table width="889" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="204" height="312" align="center" valign="top"><table width="180" height="4" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td></td>
      </tr>
    </table> <!--#include file="left.asp"--> </td>
    <td align="center" valign="top"><table width="580" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
    <table width="585" height="24" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td class="hui_12">&nbsp;&nbsp;����Ӫ��ϵͳ,��ý�ҵ����;��(<a href="../tui.asp?xxx=<%=session("UserName")%>">��������</a>)</td>
      </tr>
    </table>
      <table width="580" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td height="122" align="center" valign="top"><table width="570" border="0" cellpadding="0" cellspacing="1" bgcolor="#56AA0A">
            <tr>
              <td width="47" height="24" align="center" bgcolor="#FFFFFF" class="hang">���</td>
              <td width="93" align="center" bgcolor="#FFFFFF" class="hang">���Ƽ��û�</td>
              <td width="141" align="center" bgcolor="#FFFFFF" class="hang">�û�ע��ʱ��</td>
              <td width="141" align="center" bgcolor="#FFFFFF" class="hang">��ֵ���׽��</td>
              <td width="142" align="center" bgcolor="#FFFFFF" class="hang">����ʱ����ɶ�</td>
            </tr>
			  <%CxGame.DbConn("QPGameUserDB")%>

			 <%		
			 dim userrid,commid	,rs1,price0,pricet,rs2,PlayTimeCount,sql,PlayTimeCount1,rs3,rs4,kk,pages,summoney

			   set rs=server.CreateObject("adodb.recordset")
			   sql="select userid,Accounts,RegisterDate from AccountsInfo where SpreaderID='"& session("userid") &"'"
			   rs.open sql,conn,1,1
			        if not rs.eof then
					page=request("page")
					if page ="" or isnumeric(page)=false then page = 1
					page=clng(page)
					rs.pagesize=20
					if page < 1 then page = 1
					pages=rs.pagecount
					if page > pages then page=pages
					rs.absolutepage=page
					for kk=1 to rs.pagesize
			   
			   CxGame.DbConn("CxGameTreasuredb")

			   set rs1=conn.execute("select price,postdate,UserID from PostLog where userid ='"& rs(0) &"'")
			   if not rs1.eof then
			      price0=rs1(0)*100
			   else
			      price0=0
			   end if
			   pricet=clng(price0)/10
			   
			   CxGame.DbConn("QPTreasureDB")
			   set rs2=conn.execute("select * from GameScoreInfo where userid='"& rs(0) &"'")
			   if not rs2.eof then
			      PlayTimeCount=left(rs2("PlayTimeCount")/3600*10,2)&"%"
				  PlayTimeCount1=left(rs2("PlayTimeCount")/3600*10,2)
			   end if
			   if PlayTimeCount="" then PlayTimeCount="0%"
			   
			   if clng(PlayTimeCount1) >=100 then 
			      PlayTimeCount="100%"
				  
				  set rs3=conn.execute("select * from GameScoreInfo where ok<>1 and userid='"& rs(0) &"'")
				  if rs.eof then
					  set rs4=conn.execute("update GameScoreInfo set Score=Score+10000 where userid='"& session("userid") &"'")
					  set rs4=conn.execute("update GameScoreInfo set Score=Score+10000 where userid='"& rs(0) &"'")
					  set rs4=conn.execute("update GameScoreInfo set ok=1 where userid='"& rs(0) &"'")
				  end if
				  pricet=pricet+10000
			   end if
			   summoney=0
			   summoney=clng(pricet)+clng(summoney)
			   if summoney="" then summoney=0
			 %>
            <tr>
              <td width="47" height="24" align="center" bgcolor="#FFFFFF" class="hangxi"><%=rs(0)%></td>
              <td width="93" align="center" bgcolor="#FFFFFF" class="hangxi"><%=rs(1)%></td>
              <td width="141" align="center" bgcolor="#FFFFFF" class="hangxi"><%=formatdatetime(rs(2),2)%></td>
              <td width="141" align="center" bgcolor="#FFFFFF" class="hangxi"><%=pricet%></td>
              <td width="142" align="center" bgcolor="#FFFFFF" class="hangxi"><%=PlayTimeCount%></td>
            </tr>
		
			  <%
			   rs.movenext
			   if rs.eof or rs.bof then exit for
			   next
			   end if			   
			 %> 
			  
          </table>
            <table>
              <tr>
                <td class="hang"><%
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
		  response.write "&nbsp;ҳ�Σ�<strong><font color=red>"& Page &"</font>/"& pages &"</strong>ҳ "
          response.write "&nbsp;��<b><font color='#FF0000'>"& rs.recordcount &"</font></b>����¼ <b>"& rs.pagesize &"</b>����¼/ҳ"
		%>                </td>
              </tr>
            </table>
            <table width="500" height="24" border="0" cellpadding="0" cellspacing="0">
              <tr class="hang">
                <td width="145" align="right" class="hang">�Ƽ��û�������</td>
                <td width="57" class="red_12px"><%=rs.recordcount%></td>
                <td width="75" class="hang">��ʷ���룺</td>
                <td width="223" align="left" class="red_12px"><%=summoney%></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <hr width="580" size="1">
      <br>
      <table width="565" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td height="13" class="hang">ע��
            <br>
           &nbsp;&nbsp; 1����ֵ���׽�Ҳ��ü�ʱ���㷽ʽ��ֻҪ���Ƽ��˳�ֵ����ô�����ʺ����̾ͻ���10%�Ľ�<br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �ҽ�����<br>
          &nbsp;&nbsp;
2�������Ƽ��û�ʹ�õĵ�ַ��http://www.dc173.com/reg.asp?introducer=<%=Session("UserName")%> </td>
        </tr>
        <tr>
          <td height="13" align="center" class="hang"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="images/copy.gif" style="cursor:hand;" onClick="copy('http://www.dc173.com/reg.asp?introducer=<%=Session("UserName")%>')" alt="����" /></td>
        </tr>
      </table>
    <br></td>
  </tr>
</table>

<table width="913" height="85" border="0" align="center" cellpadding="0" cellspacing="0" class="bj">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><!--#include file="../copy.asp"--></td>
  </tr>
</table>
<script>
    function copy(cc)
    {
        var text=cc;
        if (clipboardData.setData("text",cc))
        {
            alert("�Ѹ��Ƶ����а�!");
        }else
        {
            alert("����ʧ��");
        }
    }
</script>