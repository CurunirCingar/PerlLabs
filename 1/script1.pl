#!/usr/local/bin/perl -w 
use CGI qw(param);
use CGI::Carp qw(fatalsToBrowser);
print("Content-type: text/html\n\n");

$a = param("base");
$b = param("power");

$c = $a ** $b;

print("

	<HTML>
	<HEAD><TITLE>���������� �����</title></head>
		<BODY>
			<H2 align=center>
				$a<SUP>$b</sup> = $c
			</h2>
			
			<H2 ALIGN=center><a href=index.html>��������� �� �������</a></H2>
		</body>
	</html>

");
