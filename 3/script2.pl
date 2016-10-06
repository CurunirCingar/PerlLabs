#!/usr/bin/perl
use CGI qw(param);
use CGI::Carp qw(fatalsToBrowser);
print("Content-type: text/html\n\n");

$methodIndex = param("method");
if($methodIndex > 3)
{
	$methodIndex = 3;
}
elsif($methodIndex < 0)
{
	$methodIndex = 0;
}
goto(("M1", "M2", "M3", "M4")[$methodIndex]);

# First method
M1:
$QString =new CGI;
$name=$QString->param("name");
$age=$QString->param("age");

# Second method
M2:
$QString =new CGI;
@names=$QString->param;
foreach $elem (@names)
{ 
	$_=$QString->param($elem);
	eval("\$$elem='$_'");
} 

# Third method
M3:
$FIO=param("FIO");
$Gor=param("Gor");
$t=param("Tel"); 

# Fourth method
M4:
@names=param;
foreach $elem (@names)
{ 
	$_=param($elem);
	eval("\$$elem='$_'");
} 

$resultStr = "";

if($age <= 30)
{
	$resultStr = "Привет $name!";
}
elsif($age < 50)
{
	$resultStr = "Привет $name! У Вас прекрасный возраст! Так держать!";
}
else
{
	$resultStr = "Привет $name! Моё почтение, старейшина.";
}

print("
	<HTML>
	<HEAD><TITLE>компактный вывод</title></head>
		<BODY>
			<H2 align=center>
				$resultStr
			</h2>
			
			<H2 ALIGN=center><a href=index.html>Вернуться на главную</a></H2>
		</body>
	</html>

");
