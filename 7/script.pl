#!/usr/bin/perl
use DBI;
use CGI;
use CGI::Carp qw(fatalsToBrowser);
print "Content-type: text/html\n\n";
$form = new CGI;
@formParams = $form->param;

if(($DBName 	= $form->param("db_name")) == 0)	{$DBName  = "employees_db";				}
if(($DBTable 	= $form->param("db_table")) == 0)	{$DBTable = "employee";					}
if(($DBQuery 	= $form->param("db_query")) == 0)	{$DBQuery = "Select * From employee";	}
if(($DBUser 	= $form->param("db_user")) == 0)	{$DBUser = "root";						}
if(($DBPassword = $form->param("db_password")) == 0){$DBPassword = "";						}

# Connect to DB.
$DBSource="dbi:mysql:$DBName";
$DBHandler = DBI->connect($DBSource, $DBUser, $$DBPassword) || die $DBI::errstr;
SetupSearchQuery();

print("<TABLE BORDER=1 ALIGN=center>\n");
OutputColumnNames();
OutputTableData();
print("</TABLE>\n");

print("<H2 ALIGN=center><a href=index.html>На главную</a></H2>");
print "</html>\n";

sub SetupSearchQuery()
{
	%paramNames = (
	#	param	   row name
		"name" 	=> "name", 
		"city" 	=> "city",
		"phone" => "phone"
	);
	@searchQueryBlocks;
	foreach $paramName(keys(%paramNames)){
		if($paramValue = $form->param($paramName)){
			push(@searchQueryBlocks, "$paramNames{$paramName} LIKE \"%$paramValue%\"")
		}
	}
	$searchQuery = "";
	$i = 0;
	for(; $i < @searchQueryBlocks-1; $i++){
		$searchQuery .= "$searchQueryBlocks[$i] AND ";
	}
	$searchQuery .= "$searchQueryBlocks[$i]";
	# For searchQuery debug.
	# foreach $buf(@searchQueryBlocks){print("$buf\t");}print("\n");
	# print("$searchQuery\n");

	# Attach search query to main query if it exists.
	if($searchQuery){ $DBQuery .= " WHERE $searchQuery" }
}

sub OutputColumnNames()
{
	$ColumnsQuery = "SHOW COLUMNS FROM employee";
	$queryHandler = $DBHandler->prepare($ColumnsQuery);
	$rowsCount = $queryHandler->execute;
	print("<TR>\n");
	while(@rowArr = $queryHandler->fetchrow_array){
		print "<TH>$rowArr[0]\t";
	}
}

sub OutputTableData()
{
	$queryHandler = $DBHandler->prepare($DBQuery);
	$rowsCount = $queryHandler->execute;
	while(@rowArr = $queryHandler->fetchrow_array)
	{   
		print("<TR>\n");
		foreach $row(@rowArr){
			print "<TD>$row\t";
		}		
	}
}



















