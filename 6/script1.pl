#!/usr/bin/perl
use CGI qw(param);
use CGI::Carp qw(fatalsToBrowser);
print("Content-type: text/html\n\n");

	$filename = "Data.htm";
	$outFilename = "Data.dat";
	
	chdir '..\www\Perl\6';
	if( -e $filename )
	{
		ReadFile();
	}
	else
	{
		print("”айл $filename не найден!");
		exit;
	}
	
	sub ReadFile
	{
		open(F1,'<', $filename) || die("”айл $filename не открылся");
		open(F2,'>', $outFilename);
		
		@file = <F1>;
		$fileStr;
		for (@file)
		{
			chomp;
			$fileStr .=  $_;
		}
		
		$fileStr=~s%&nbsp;%%g;
		@fileStrArr=split(%<tr>%, $fileStr);
		
		while(@fileStrArr)
		{
			~m%<td>(.*?)</td>(.*?)<td>(.*?)</td>%i;
			print F2 "$1\t$2\n";
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	