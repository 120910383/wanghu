<!--#include file="../Inc/Config.asp" -->
<!--#include file="../Inc/md5VB.asp" -->
<%
CxGame.IsCheckLogin()
%>
<%CxGame.DbConn("QPGameUserDB")%>
<%
  dim C_PROTECTANSW,C_PROTECTQUES
  C_PROTECTANSW=replace(trim(request.form("C_PROTECTANSW")),"'","")
  C_PROTECTQUES=replace(trim(request.form("C_PROTECTQUES")),"'","")
  
  set rs=conn.execute("select * from AccountsInfo where C_PROTECTANSW='"& C_PROTECTANSW &"' and C_PROTECTQUES='"& C_PROTECTQUES &"' and UserID="&Session("UserID")&"")
  if rs.eof then
	  response.Write("<script language='javascript'>alert('��ʾ����𰸲���ȷ��');history.go(-1);</script>")
	  response.End()
  end if
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
    </table><!--#include file="left.asp"--></td>
    <td align="center" valign="top"><table width="585" height="24" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td class="14_px">&nbsp;&nbsp;�޸ı�������</td>
      </tr>
    </table>
      <table width="580" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="585" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td>&nbsp;&nbsp;&nbsp;<STRONG class="12_pxcu">&nbsp;���뱣�����</STRONG></td>
        </tr>
      </table>
      <hr width="580" size="1">
	  
	  
	  
      <table width="530" border="0" cellspacing="0" cellpadding="0">
	  <form action="answer.asp?action=up" method="post" name="myform" onSubmit="return place()">
        <tr>
          <td width="91" height="40" align="right" class="hui_12">���⣺</td>
          <td width="439" height="30" class="hui_12"><span class="red_12px">
            <input name="C_PROTECTQUES" type="text" class="box" id="C_PROTECTQUES">
          </span></td>
        </tr>
        <tr>
          <td height="40" align="right" class="hui_12">�𰸣�</td>
          <td height="30" class="hui_12"><span class="red_12px">
            <input name="C_PROTECTANSW" type="text" class="box" id="C_PROTECTANSW">
          </span></td>
        </tr>
        <tr>
          <td height="40" align="right" class="hui_12">ȷ�ϴ𰸣�</td>
          <td height="30" class="hui_12"><span class="red_12px">
            <input name="C_PROTECTANSW1" type="text" class="box" id="C_PROTECTANSW1">
          </span></td>
        </tr>
        <tr>
          <td height="40" colspan="2" class="red_12px">&nbsp;&nbsp;&nbsp;&nbsp; ���μ�������ı���������ʹ𰸡� </td>
          </tr>
        <tr>
          <td height="40" class="hui_12">&nbsp;</td>
          <td height="30" class="hui_12"><input type="submit" name="button1" value="ȷ   ��"></td>
        </tr>
		</form>
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
	function place(){
	if(myform.C_PROTECTQUES.value==""){
	alert("������������ʾ����!");
	myform.C_PROTECTQUES.focus();
	return (false);
	}
	if(myform.C_PROTECTANSW.value==""){
	alert("������������ʾ�𰸣�");
	myform.C_PROTECTANSW.focus();
	return (false);
	}
	if(myform.C_PROTECTANSW1.value==""){
	alert("��ȷ��������ʾ�𰸣�");
	myform.C_PROTECTANSW1.focus();
	return (false);
	}
	if(myform.C_PROTECTANSW.value!=myform.C_PROTECTANSW1.value){
	alert("��������Ĵ𰸲�һ�£�");
	myform.C_PROTECTANSW1.focus();
	return (false);
	}
	}
</script>