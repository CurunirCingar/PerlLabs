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
		print("���� $filename �� ������!");
		exit;
	}
	
	sub ReadFile
	{
		open(F1,'<', $filename) || die("���� $filename �� ��������");
		open(F2,'>', $outFilename);
		@file = <F1>;
		for(@file)
		{
			$_=~s/<.*?>//gi;
			print F2 $_;
		}
	}