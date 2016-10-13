#!/usr/bin/perl
use CGI qw(param);
use CGI::Carp qw(fatalsToBrowser);
print("Content-type: text/html\n\n");

	$filename = "Students.txt";
	$outFilename = "ResidentStudents.txt";
	
	$residentStudents = "";
	$nonresidentStudents = "";
							
	$temp;
							
	$localCityName = "С-Петербург";
	
	chdir '..\www\Perl\4';
	if( -e $filename )
	{
		ReadFile();
	}
	else
	{
		print("Файл $filename не найден!");
		exit;
	}
	
	sub ReadFile
	{
		open(F1,'<', $filename) || die("Файл $filename не открылся");
		open(F2,'>', $outFilename);
		
		print("
		<HTML>
		<HEAD><TITLE>Вывод</title></head>
			<BODY>
		");
		
		@fileStr = <F1>;
		
		@headerArr = split(/\t/, @fileStr[0]);
		
		print("<H2 ALIGN=center>Местные студенты</H2>");
		
		print("
			<P align=center>
			<TABLE border=1>
		");
		
		
		
		print("<TR>");
		foreach(@headerArr)
		{
			print("<TH>$_");
		}
		
		@residentStudents;
		$nonresidentStudents = "";
		
		$i = 0;
		$j = 0;
		
		for($i = 1; $i < @fileStr; $i++)
		{
			print F2 "$i. @fileStr[$i]\n";
			
			@tempStr = split(/\t/, @fileStr[$i]);
			
			if(@tempStr[3] =~ /С-Петербург/)
			{
				print("<TR>");
				foreach(@tempStr)
				{
					print("<TD>$_");
					
				}
				
			}
			else
			{
				$nonresidentStudents = "$nonresidentStudents<TR>";
				foreach(@tempStr)
				{
					$nonresidentStudents = "$nonresidentStudents<TD>$_";
				}
			}
		}
			
		close F1;
		
		print("
			</table>
			</p>
		");
		
		print("<H2 ALIGN=center>Иногородние студенты</H2>");
		PrintTable($nonresidentStudents);
		
		print("				
				<H2 ALIGN=center><a href=index.html>Вернуться на главную</a></H2>
			</body>
		</html>
		");
	}
	
	sub PrintTable($)
	{
		my $str = shift;
		
		print("
			<P align=center>
			<TABLE border=1>
		");
		
		print("<TR>");
		foreach(@headerArr)
		{
			print("<TH>$_");
		}
		
		print($str);
		
		print("
			</table>
			</p>
		");
	}
	
	#sub ReadFile
	#{
	#	open(F1,"< $filename") || die("Файл $filename не открылся");
	#	
	#	print("
	#	<HTML>
	#	<HEAD><TITLE>Вывод</title></head>
	#		<BODY>
	#	");
	#	
	#	@fileStr = <F1>;
	#	
	#	@headerArr = split(/\t/, @fileStr[0]);
	#	
	#	@residentStudents;
	#	@nonresidentStudents;
	#	
	#	$i = 0;
	#	$j = 0;
	#	
	#	for($i = 1; $i < @fileStr; $i++)
	#	{
	#		@tempStr = split(/\t/, @fileStr[$i]);
	#		
	#		if(@tempStr[3] =~ /С-Петербург/)
	#		{
	#			$residentStudents[$i++] = @tempStr;
	#		}
	#		else
	#		{
	#			$nonresidentStudents[$j++] = @tempStr;
	#		}
	#	}
	#		
	#	close F1;
    #
	#	PrintTable();
	#	
	#	print("				
	#			<H2 ALIGN=center><a href=index.html>Вернуться на главную</a></H2>
	#		</body>
	#	</html>
	#	");
	#}
	#
	#sub PrintTable()
	#{
	#	foreach(@residentStudents)
	#	{
	#		print("<br>@_[1]");
	#	}
	#	
	#	for($i = 0; $i < 5; $i++)
	#	{
	#		for($j = 0; $j < 5; $j++)
	#			{
	#				print("<br>@residentStudents[$i, $j]");
	#			}
	#	}
	#	
	#	print("
	#		<P align=center>
	#		<TABLE border=1>
	#	");
	#	
	#	print("<TR>");
	#	foreach(@headerArr)
	#	{
	#		print("<TH>$_");
	#	}
	#	
	#	foreach(@residentStudents)
	#	{
	#		print("<TR>");
	#		for($j = 0; $j < @_; $j++)
	#		{
	#			print("<TD>$_[$j]");
	#		}
	#	}
	#	
	#	print("
	#		</table>
	#		</p>
	#	");
	#}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	