<!--#include file="../inc/config.asp"-->
<!--#include file="vnetchar.asp"-->
<!--#include file="vnetsettings.asp"-->

<%
dim result1,result2,result3,result4,result5,result6,payAmount,youxibi,payAmount1,UserID,SpreaderID,username,errorcallback,agentclient,callbackplug,varchar,code,yyyy,sql
result1=request.QueryString("tt")  'ӯ��Ѷ���������� �硰T100353166��
result2=request.QueryString("cc")  '�ɹ�״̬��  ��0����ʾ�ɹ�,�������ݱ�ʾʧ��
result3=request.QueryString("mm")  '���س�ֵ��� ��01,02,05,10,20 ���ַ��� ����պ�MD5�ȽϺ��ٸ�λ����(int) 
result4=request.QueryString("pp")  '������֤���� 32λ ������ÿ�ζ���һ����
result5=request.QueryString("af")  '�����Լ������ֶ����� custom �����Ƕ��㷽���ź��� 18�ַ��ڡ�
result6=request.QueryString("ka")'  ����15λ�ĳ�ֵ���š�   
   
            payAmount=clng(result3)
			youxibi=payAmount*5000
			payAmount1=youxibi/10
			
 if result2 ="0"  then 

  '��ע��MD5 �ļ���˳��
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
				  'sql="select * from PostLog where PostCode='"& result1 &"'"
				  'response.Write sql
				  'response.End()
				  set rs=conn.execute("select * from PostLog where PostCode='"& result1 &"'")
				 
				  if rs.eof then
					  set rs=conn.execute("insert into PostLog (UserID,PostCode,Price,PostDate) values ("& UserID &",'"& result1 &"',"& payAmount &","& date() &")")
					  CxGame.DbConn("QPTreasureDB")
					  set rs=conn.execute("update GameScoreInfo set score=score+"& youxibi &" where userid="&UserID)
					  
					  if SpreaderID > 0 then
						 set rs=conn.execute("update set GameScoreInfo score=score+"& payAmount1 &" where userid="&SpreaderID)
					  end if					  
				  end if
			      response.Write("��ֵ�ɹ�") '��ʾ�ɹ��ˡ�
                  response.Write("<a href="+agentclient+">"  +"������ֵ"+"</a>")
			  
			     end if

'response.Write("1")      '��ʾ�ɹ��򲹵��ɹ�


            else
response.Write("0")  '��ʾʧ�ܵĴ����

            end if

else

response.Write("0")  '��ʾʧ�ܵĴ����

end if 

 response.End
 Response.Expires=0
 
 
 
%>