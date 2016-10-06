#!/usr/bin/perl
use CGI qw(param);
use CGI::Carp qw(fatalsToBrowser);
print("Content-type: text/html\n\n");

$name = param("name");
$age = param("age");

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
