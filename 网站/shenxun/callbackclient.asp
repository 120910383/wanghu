<!--#include file="vnetchar.asp"-->
<!--#include file="vnetsettings.asp"-->
<!--#include file="../inc/config.asp"-->
<%
dim result1,result2,result3,result4,result5,result6,payAmount,youxibi,payAmount1,UserID,SpreaderID,username
result1=request.QueryString("tt")  'ӯ��Ѷ���������� �硰T100353166��
result2=request.QueryString("cc")  '�ɹ�״̬��  ��0����ʾ�ɹ�,�������ݱ�ʾʧ��
result3=request.QueryString("mm")  '���س�ֵ��� ��01,02,05,10,20 ���ַ��� ����պ�MD5�ȽϺ��ٸ�λ����(int) 
result4=request.QueryString("pp")  '������֤���� 32λ ����ÿ�ζ���һ����
result5=request.QueryString("af")  '�����Լ������ֶ����� custom �����Ƕ��㷽���ź��� 18�ַ���
result6=request.QueryString("ka")'  ����15λ�ĳ�ֵ����
   
            payAmount=clng(result3)
			youxibi=payAmount*5000
			payAmount1=youxibi/10
 
 if result2 ="0"  then 
'response.Write("��ֵ�ɹ�!"&"<br>")
   
   'ִ��״̬��ĸ���Ϊ"1"
' conn.Execute("update order2 set otype='1' where orderid='"&orderId&"'")
  
response.Write("�����ǣ�"&result6&"<br>")

response.Write("�����ǣ�"&result1&"<br>")
  
response.Write("����ǣ�"&result3&"<br>")

'response.Write("�����ǣ�"&result4&"<br>")
 
response.Write("�Լ��Ķ����ǣ�"&result5&"<br>")

yyyy=Ucase(trim(md6(agentID&agentPWD&result2&result3&result1&result5))) 'MD5����

'response.Write("�̻��������ǣ�"&yyyy&"<br>")

			if yyyy=result4  then
			
			CxGame.DbConn("CxGameTreasureDb")
			    set rs=conn.execute("select username from yinghua where agentself='"& result5 &"'")
				if not rs.eof then				
				  
				  username=rs(0)
				
			      CxGame.DbConn("QPGameUserDB")
				  set rs=conn.execute("select top 1 UserID,SpreaderID from AccountsInfo where Accounts='"& username &"'")
			      if not rs.eof then
					 UserID=rs(0)
					 SpreaderID=clng(rs(1))
			      end if
				  
				  CxGame.DbConn("CxGameTreasureDb")
				  set rs=conn.execute("select * from PostLog where PostCode='"& result1 &"'")
				  if rs.eof then
					  set rs=conn.execute("insert into PostLog (UserID,PostCode,Price,PostDate) values ("& UserID &","& result1 &","& payAmount &","& date() &")")
					  CxGame.DbConn("QPTreasureDB")
					  set rs=conn.execute("update GameScoreInfo set score=score+"& youxibi &" where userid="&UserID)
					  
					  if SpreaderID > 0 then
						 set rs=conn.execute("update set GameScoreInfo score=score+"& payAmount1 &" where userid="&SpreaderID)
					  end if					  
				  end if
			      response.Write("<script language='javascript'>alert('��ֵ�ɹ���');location.href='../index.asp';</script>")
			  
			     end if
			'response.Write("�ɹ�") '��ʾ�ɹ��ˡ�
			'response.Write("<a href="+agentclient+">"  +"������ֵ"+"</a>")
			'''''''''''''''''''''''
			
			
			else
			response.Write("0")  '��ʾʧ�ܵĴ����
			response.Write("<a href="+agentclient+">"  +"������ֵ"+"</a>")
            end if

else

response.Write("ʧ��")  '��ʾʧ�ܵĴ����

end if 

 response.End
 Response.Expires=0

%>