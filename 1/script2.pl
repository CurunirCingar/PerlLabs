#!/usr/bin/perl
use CGI qw(param);
use CGI::Carp qw(fatalsToBrowser);
print("Content-type: text/html\n\n");

$name = param("name");
$age = param("age");

$resultStr = "";

if($age <= 30)
{
	$resultStr = "������ $name!";
}
elsif($age < 50)
{
	$resultStr = "������ $name! � ��� ���������� �������! ��� �������!";
}
else
{
	$resultStr = "������ $name! �� ��������, ����������.";
}

print("
	<HTML>
	<HEAD><TITLE>���������� �����</title></head>
		<BODY>
			<H2 align=center>
				$resultStr
			</h2>
			
			<H2 ALIGN=center><a href=index.html>��������� �� �������</a></H2>
		</body>
	</html>

");
