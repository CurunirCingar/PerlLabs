#!/usr/bin/perl
use CGI qw(param);
use CGI::Carp qw(fatalsToBrowser);
print("Content-type: text/html\n\n");

	$hexColor = param("hexColor");
	$stringColor = param("stringColor");
	
	%DNI = (
		"�������"		=>	"red",
		"������"		=>	"green",
		"Ƹ����"		=>	"yellow",
		"׸����"		=>	"black",
		"��������"	=>	"aqua",
	);
	
	print("<H2 align=center>��������� ������</H2>");
	
	print("<H2 align=center> <font color=$hexColor> $hexColor				</font> </H2>");
	
	print("<H2 align=center> <font color=$DNI{$stringColor}> $stringColor </font> </H2>");
	
	