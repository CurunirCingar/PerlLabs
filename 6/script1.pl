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
	print("<H2 ALIGN=center><a href=index.html>�� �������</a></H2>");
	
	sub ReadFile
	{
		open(F1,'<', $filename) || die("Файл $filename не открылс¤");
		open(F2,'>', $outFilename);
		
		while(<F1>) 
		{
			chomp;
			$str.=$_;
		}
		
		$str =~ s/&nbsp;//g;
		@a = split(/<tr>/, $str);
		$word1 = "\d{1,2}\.\d{1,2}\.\d{2,4}";
		$word2 = "\d{1,2}\.\d{1,2}\.\d{2,4}";
		$word3 = "\d{1,3}";
		
		foreach(@a) 
		{
			$_ =~m/>(\d{1,2}\.\d{1,2}\.\d{2,4})\s*-\s*(\d{1,2}\.\d{1,2}\.\d{2,4}).*?>(\d{1,3})</i;
			if($1 && $2 && $3) { print F2 "$1-$2\t$3\n"; }
		}
		
		print("<H3 align=center>�������������� ���� \"Data.dat\" ��������� � ������� ��������.</H2>");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	