<%
  dim money,car,content,pd_FrpId
  car=replace(trim(request.Form("car")),"'","")
  money=replace(trim(request.Form("money")),"'","")
  content=replace(trim(request.Form("content")),"'","")
  pd_FrpId=replace(trim(request.Form("pd_FrpId")),"'","")
  if money="" then
  response.Write("<script language='javascript'>alert('��ѡ����Ҫ��ֵ�Ľ�ҿ�');history.go(-1);</script>")
  response.End()
  end if
%>
<%
  Randomize
  Codeabc= mid(cStr(1e+6+Int(999999 * Rnd)),2)
  dim dddd
  dddd=cStr(now())
  dddd=replace(dddd,"-","")
  dddd=replace(dddd,":","")
  dddd=replace(dddd," ","")
  dddd=dddd&codeabc
  orderId=codeabc
  'response.Write orderId
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ױ�֧�� - ���Ͽ��� | ����������ѡ�����̣�֧�����ױ��������ֿɿ���</title>
<meta name="description" content="�ױ�֧����Ϊ���������ڷ����ṩ�̣��빤�����С��������С��������С�ũҵ���С��������еȶ�ҹ� �����м�VISA��MasterCard�⿨��֯���ܺ�����Ϊ���˿ͻ��ṩ����֧�����绰֧���������˻���Ʒ��� Ϊ��ҵ�̻��ṩ��������֧�������մ�����ί�н����Լ�B2Bת��ȶ�����ֵҵ��">
		<link href="css/yeepaytest.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:solid 1px #107929">
		 <tr>
		    <td height="30" align="left"><a href="http://www.yeepay.com/"><img src="http://www.yeepay.com/new-indeximages/yeepay-indexlogo.gif" alt="YeePay�ױ�֧�� ���µĶ�Ԫ��֧��ƽ̨ ��ȫ �ɿ� ��� ��������" width="141" height="47" border="0" /></a></td>
		  </tr>
		  <tr>
		  	<td height="30" colspan="2" bgcolor="#6BBE18"><span style="color: #FFFFFF">��л��ʹ���ױ�֧��ƽ̨</span></td>
		  </tr>
		  <tr>
		  	<td height="24" colspan="2" bgcolor="#CEE7BD">�ױ�֧����Ʒͨ��֧���ӿڣ���ֵʱ�����˳���Ϸ���䣬�������Ը���</td>
		  </tr>
			<form method="get" action="req.asp" targe="_blank" name="theform" onsubmit="return check();">
		  <tr>
		  	<td width="30%" height="24" align="left">&nbsp;&nbsp;�̻�������</td>
		  	<td height="24" align="left">&nbsp;&nbsp;
	  	    <input name="p2_Order" type="text" id="p2_Order" value="<%=orderId%>" size="50" readonly="readonly" /></td>
      </tr>
		  <tr>
		  	<td height="24" align="left">&nbsp;&nbsp;֧�����</td>
		  	<td height="24" align="left">&nbsp;&nbsp;
	  	    <input size="50" type="text" name="p3_Amt" id="p3_Amt" value="<%=money%>" readonly="readonly" />		  	  &nbsp;<span style="color:#FF0000;font-weight:100;">*</span></td>
      </tr>
		  <tr>
		  	<td height="24" align="left">&nbsp;&nbsp;�û���</td>
		  	<td height="12" align="left">&nbsp;&nbsp;
	  	    <input size="50" type="text" name="p5_Pid" id="p5_Pid" /></td>
      </tr>
		  <tr>
		    <td height="24" align="left">&nbsp; ȷ���û���</td>
		    <td height="12" align="left">&nbsp;&nbsp;
			<input size="50" type="text" name="p5_Pid2" id="p5_Pid2" /></td>
		    </tr>
		  <tr>
		  	<td height="24" align="left">&nbsp;&nbsp;��Ʒ����</td>
		  	<td height="24" align="left">&nbsp;&nbsp;
	  	    <input name="p6_Pcat" type="text" id="p6_Pcat" value="<%=car%>" size="50" /></td>
      </tr>
		  <tr>
		  	<td height="24" align="left">&nbsp;&nbsp;��Ʒ����</td>
		  	<td height="24" align="left">&nbsp;&nbsp;
	  	    <input name="p7_Pdesc" type="text" id="p7_Pdesc" value="<%=content%>" size="50" /><input size="50" type="hidden" name="p8_Url" id="p8_Url" value="http://www.dc173.com/yibao/callback.asp" readonly /></td>
      </tr>
		  <tr>
		  	<td height="24" align="left">&nbsp;&nbsp;�̻���չ��Ϣ</td>
		  	<td height="24" align="left">&nbsp;&nbsp;
	  	    <input size="50" type="text" name="pa_MP" id="pa_MP" /></td>
      </tr>
		  <tr>
		  	<td height="24" align="left">&nbsp;&nbsp;Ӧ�����</td>
		  	<td height="24" align="left">&nbsp;&nbsp;
		  	  <select name="pr_NeedResponse" id="pr_NeedResponse">
                <option value="0">����Ҫ</option>
              </select></td>
      </tr>
		  <tr>
		  	<td height="24" align="left">&nbsp;&nbsp;ѡ���������ְ�ť</td>
		  	<td height="24" align="left"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="50%" height="24" align="left"><input class="radio" type="radio" name="pd_FrpId"	id="pd_FrpId" value="ICBC-NET" />
                  �й���������</td>
                <td width="50%" height="24" align="left"><input class="radio" type="radio" name="pd_FrpId"	id="pd_FrpId" value="ABC-NET" />
                  �й�ũҵ����</td>
              </tr>
              <tr>
                <td height="24" align="left"><input class="radio" type="radio" name="pd_FrpId"	id="pd_FrpId" value="CMBCHINA-NET" />
                  ��������</td>
                <td height="24" align="left"><input class="radio" type="radio" name="pd_FrpId"	id="pd_FrpId" value="CCB-NET" />
                  ��������</td>
              </tr>
              <tr>
                <td height="24" align="left"><input class="radio" type="radio" <%if pd_FrpId="jw" then%> checked="checked" <%end if%> name="pd_FrpId"	id="pd_FrpId" value="JUNNET-NET" />
                  ����һ��ͨ</td>
                <td height="24" align="left"><input class="radio" type="radio" name="pd_FrpId" <%if pd_FrpId="szx" then%> checked="checked" <%end if%>	id="pd_FrpId" value="SZX-NET" />
                  �����п���ֵ</td>
              </tr>
              <tr>
                <td height="24" align="left"><input class="radio" type="radio" name="pd_FrpId" <%if pd_FrpId="sd" then%> checked="checked" <%end if%>	id="pd_FrpId" value="SNDACARD-NET" />
                  ʢ�󿨳�ֵ</td>
                <td height="24" align="left"><input class="radio" type="radio" name="pd_FrpId" <%if pd_FrpId="zt" then%> checked="checked" <%end if%>	id="pd_FrpId" value="ZHENGTU-NET" />
                  ��;����ֵ</td>
              </tr>
            </table></td>
      </tr>
		  <tr>
		  	<td height="24" align="left">&nbsp;</td>
		  	<td height="24" align="left">&nbsp;&nbsp;
	  	    <input type="submit" value="����֧��" /></td>
      </tr>
    </form>
      <tr>
      	<td height="5" bgcolor="#6BBE18" colspan="2"></td>
      </tr>
    </table>
		</td>
        </tr>
      </table>
	  <script language="javascript">
	  function check(){
	  if(theform.p5_Pid.value==""){
	  alert("��������Ҫ��ֵ���ʺ�!");
	  theform.p5_Pid.focus();
	  return (false);	  
	  }
	  if(theform.p5_Pid2.value==""){
	  alert("��ȷ����Ҫ��ֵ���ʺ�!");
	  theform.p5_Pid2.focus();
	  return (false);	  
	  }
	  if((theform.p5_Pid.value)!=(theform.p5_Pid2.value)){
	  alert("����������ʺŲ�һ��!")
	  theform.p5_Pid2.focus();
	  return (false);
	  }
	  }
	  </script>
	</body>
</html>