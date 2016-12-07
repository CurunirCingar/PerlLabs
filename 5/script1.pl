#!/usr/bin/perl
use CGI qw(param);
use CGI::Carp qw(fatalsToBrowser);
print("Content-type: text/html\n\n");

	$hexColor = param("hexColor");
	$stringColor = param("stringColor");
	
	%Col = (
		"Красный"		=>	"red",
		"Зелёный"		=>	"green",
		"Жёлтый"		=>	"yellow",
		"Чёрный"		=>	"black",
		"Лазурный"		=>	"aqua",
	);
	
	print("<H2 align=center>Сравнение цветов</H2>");
	
	print("<H2 align=center> <font color=$hexColor> $hexColor				</font> </H2>");
	
	print("<H2 align=center> <font color=$Col{$stringColor}> $stringColor </font> </H2>");
	
	