<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="css/in_pay.css" />
<title>��վ</title>
<style type="text/css">
<!--
.STYLE1 {font-weight: bold}
-->
</style>

<script type="text/javascript">
function check()
{

if(document.form1.userid.value=="") 
{ 
alert("�������û���!");
return false;
} 

if(document.form1.money.value=="") 
{ 
alert("��ѡ��V����ֵ");
return false;
} 

}
</script> 

</head>

<body>

<div id="wrap">

  <div id="content">
<table width="690" border="0" cellspacing="0" style="margin:5px auto 0 auto;">
		  <tr>
			<td height="50" colspan="2" class="f60" style="font-size:14px;font-weight:bold; text-align:left;">�̻���վ�� ȫ���绰/С��ͨ/�ֻ���Ѷ֧��</td>
		  </tr>
		  <tr >
			<td width="188" height="74" style=" background:url(images/in_bg1.gif) no-repeat left 0;">&nbsp;</td>
			<td width="498" style=" background:url(images/in_bg1.gif) no-repeat right 0; padding-left:10px;font-size:14px;font-weight:bold; text-align:left">��վ֧�� 5V�ң�10V�ң�20V�� ��ֵ��V�ң���ѡ��վ֧�ֵ�V��</td>
		  </tr>
		  <tr>

			<td colspan="2" align="left"> 
<img src="images/vpaylc.gif" />
<div id="dh">��ֵ˵����10V�ң�<span class="hui_hang">5</span>0000���&nbsp; ��ֵʱ���˳���Ϸ���������Ը����� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="../index.asp" target="_self">������ҳ</a></div></td>
		  </tr>
		  <tr>
			<td height="83" colspan="2" style="border:1px solid #ccc; background:url(images/logo_1.gif) no-repeat right center;">
			
			
<form name=form1 action="req.asp" method=post  > <!--���Լ��ύ��ҳ��POST�ύ-->
     <table width="394" height="62" border="0" align="left" style="font-size:12px;">
              <tr>
                <td width="88" align="right"><label><strong>�û���:</strong></label></td>
                <td width="158" align="left"><label>
                  <input name="userid" type="text" style="border:1px solid #ccc;height:16px;" size="20" maxlength="20"/>
                </label></td>
                <td width="134" rowspan="2"><label>
                  <!--input type="image" src="images/myin.gif" name="Submit" value="�ύ"  onclick="return check()" / -->
                   <INPUT   TYPE="submit"   VALUE="��  ��"   onclick="return check()" style="cursor:hand; " />
                </label></td>
              </tr>
              <tr>
                <td align="right"><span class="STYLE1">
                  <label>��ֵ���:</label> 
</span></td>
<td align="left"><label>
<select name="money" id="money">
<option value="">��ѡ��V����ֵ</option>
<option value="100">100V��</option>
<option value="50">50V��</option>
<option value="30">30V��</option>
<option value="20">20V��</option>
<option value="15">15V��</option>
<option value="10">10V��</option>
<option value="5">5V��</option>
<option value="2">2V��</option>
</select>
                </label></td>
              </tr>
<tr>
                <td height="24" colspan="3" align="center">��ֵʱ���˳���Ϸ���������Ը�����</td>
              </tr>
            </table>
			</form>			</td>
		  </tr>
	  </table>
<br/><br/>
	    <table width="690" border="0" align="center" style="margin-top:20px;margin:0 auto">
          <tr>
            <td><iframe width="690" name="iframe" height="430"  frameborder="0" src="http://map.vnetone.com/default.aspx"  scroll="auto"></iframe></td>
          </tr>
        </table>
  </div>
	
</div>

</body>
</html>
