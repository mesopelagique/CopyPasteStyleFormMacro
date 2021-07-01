Class extends FormMacro

Class constructor($config : Object)
	This:C1470.toCopy:=New collection:C1472("class"; "stroke"; "style"; "textPlacement"; "borderStyle"; \
		"fontFamily"; "fontSize"; "fontStyle"; "textDecoration"; "fontWeight")
	
Function styleFile()->$file : Object
	$file:=Folder:C1567(fk user preferences folder:K87:10).file("styleMacro.json")
	
	
Function styleFromObject($object : Object)->$style : Object
	$style:=New object:C1471()
	
	var $key : Text
	For each ($key; This:C1470.toCopy)
		If ($object.object[$key]=Null:C1517)
			$style[$key]:=This:C1470.defaultValue($key)
		Else 
			$style[$key]:=$object.object[$key]
		End if 
	End for each 
	
Function defaultValue($key : Text)->$var : Variant
/*
Case of 
: ($key="style")
$var:="regular"
: ($key="borderStyle")
$var:="none"
: ($key="textPlacement")
$var:="left"
: ($key="fontStyle")
$var:="normal"
: ($key="fontWeight")
$var:="normal"
: ($key="fontSize")
$var:=0
: ($key="textDecoration")
$var:="none"
: ($key="class")
$var:=""
: ($key="stroke")
$var:=""
: ($key="fontFamily")
$var:="normal"
Else */
	$var:=Null:C1517
/*End case */
	
Function applyStyle($style : Object; $object : Object)
	var $key : Text
	For each ($key; $style)
		If ($style[$key]=Null:C1517)
			OB REMOVE:C1226($object.object; $key)
		Else 
			$object.object[$key]:=$style[$key]
		End if 
	End for each 