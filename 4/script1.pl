#!/usr/bin/perl
use CGI qw(param);
use CGI::Carp qw(fatalsToBrowser);
print("Content-type: text/html\n\n");

	$filename = "Students.txt";
	
	$residentStudents = "";
	$nonresidentStudents = "";
							
	$temp;
							
	$localCityName = "�-���������";
	
	chdir '..\www\Perl\4';
	if( -e $filename )
	{
		ReadFile();
	}
	else
	{
		print("���� $filename �� ������!");
		exit;
	}
	
	sub ReadFile
	{
		open(F1,"< $filename") || die("���� $filename �� ��������");
		
		print("
		<HTML>
		<HEAD><TITLE>�����</title></head>
			<BODY>
		");
		
		@fileStr = <F1>;
		
		@headerArr = split(/\t/, @fileStr[0]);
		
		@residentStudents;
		@nonresidentStudents;
		
		$i = 0;
		$j = 0;
		
		for($i = 1; $i < @fileStr; $i++)
		{
			@tempStr = split(/\t/, @fileStr[$i]);
			
			if(@tempStr[3] =~ /�-���������/)
			{
				@residentStudents[$i++] = @tempStr;
			}
			else
			{
				@nonresidentStudents[$j++] = @tempStr;
			}
		}
			
		close F1;

		PrintTable();
		
		print("				
				<H2 ALIGN=center><a href=index.html>��������� �� �������</a></H2>
			</body>
		</html>
		");
	}
	
	sub PrintTable()
	{
		foreach(@strArr)
		{
			print("$_<br>");
		}
		
		print("
			<P align=center>
			<TABLE border=1>
		");
		
		print("<TR>");
		foreach(@headerArr)
		{
			print("<TH>$_");
		}
		
		foreach(@residentStudents)
		{
			print("<TR>");
			for($j = 0; $j < @_; $j++)
			{
				print("<TD>$_[$j]");
			}
		}
		
		print("
			</table>
			</p>
		");
	}

	
	
	
	
	
	
	
	
	
	
	
	
	