<!--#include file="../Inc/Config.asp" -->
<link href="images/css.css" rel="stylesheet" type="text/css">
<script language="javascript" src="images/popcalendar.js"></script>
<table width="770" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><!--#include file="Top.asp" --></td>
  </tr>
</table>
<table width="889" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="204" height="292" align="center" valign="top"><table width="180" height="4" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td></td>
      </tr>
    </table><!--#include file="left.asp"--></td>
    <td width="583" align="center" valign="top"><table width="100%" height="24" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td class="14_px">&nbsp;&nbsp;��ֵ��ѯ
</td>
      </tr>
    </table>
      <table width="580" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="530" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="12_pxcu">�û���ֵ��¼</td>
        </tr>
      </table>
    <hr width="580" size="1">
    <br>
    <table width="550" height="60" border="0" cellpadding="0" cellspacing="1" bgcolor="#70CC13">
      <tr>
        <td bgcolor="#FFFFFF" class="hang"><div class="condition" >
          <div > &nbsp; ��ǰ�û���:<span class="red_12px"><%=Session("UserName")%></span>&nbsp;</div>
        </div></td>
      </tr>
      <tr>
        <td bgcolor="#FFFFFF" class="hang"><table width="560" border="0" align="center" cellpadding="5" cellspacing="0" class="box">
          <tr>
            <td height="28"  background="img/q03.jpg"><strong class="hang">�ҵĿ���ֵ��¼ 
              ��ʾ:ֻ��ʾ�����50����ֵ��¼!</strong></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td><table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
                <tr>
                  <td width="22%" bgcolor="#FFFFFF"><div align="center" class="hang">����</div></td>
                  <td width="27%" bgcolor="#FFFFFF"><div align="center" class="hang">����</div></td>
                  <td width="18%" bgcolor="#FFFFFF"><div align="center" class="hang">ʱ��</div></td>
                </tr>
                <%
				dim kk,pages,sql
				CxGame.DbConn("CxGameTreasureDb")
				Set Rs=server.CreateObject("adodb.recordset")
				sql="Select Top 50 PostCode,Price,PostDate From PostLog Where UserID="&Session("UserID")&" Order By id  Desc"
				response.Write sql
				rs.open sql,conn,1,1
				if not rs.eof then
				page=request("page")
				if page ="" or isnumeric(page)=false then page = 1
				page=clng(page)
				rs.pagesize=10
				if page < 1 then page = 1
				pages=rs.pagecount
				if page > pages then page=pages
				rs.absolutepage=page
				%>
				<%for kk=1 to rs.pagesize%>
                <tr>
                  <td bgcolor="#FFFFFF" class="hang"><div align="center" class="hang"><%=Rs(1)%></div></td>
                  <td bgcolor="#FFFFFF" class="hang"><div align="center" class="hang"><%=Rs(0)%></div></td>
                  <td bgcolor="#FFFFFF" class="hang"><div align="center" class="hang"><%=Rs(2)%></div></td>
                </tr>
                <%
				    rs.movenext
					if rs.eof or rs.bof then exit for
					next
					end if
				%>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table>
    <br>
    <table>
      <tr>
        <td class="hangxi"><%
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
		%>
        </td>
      </tr>
    </table>
    <br>
    <table width="550" height="60" border="0" cellpadding="0" cellspacing="1" bgcolor="#70CC13">
      <tr>
        <td bgcolor="#FFFFFF" class="hang"><DIV>&nbsp; �û�ע������: <BR>
         &nbsp;&nbsp;������ѳ�ֵ,���ڴ˲�ѯ�޼�¼������ͷ���ϵ(�ͷ��绰��028-88280856&nbsp;&nbsp; �ͷ�QQ��<br>
        &nbsp; 228800173)�����ǽ���ʱ���� </DIV></td>
      </tr>
    </table></td>
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
