Class extends FormMacro
Class constructor
	This:C1470.toCopy:=New collection:C1472("class"; "stroke"; "strole"; "style"; "textPlacement"; "borderStyle"; \
		"fontFamily"; "fontSize"; "fontStyle"; "textDecoration"; "fontWeight")
	
Function onInvoke($editor : Object)->$result : Object
	
	If (This:C1470.hasSelectedOneObject($editor))
		
		var $object : Object
		$object:=This:C1470.getSelectedObject($editor)
		var $style : Object
		$style:=New object:C1471()
		
		var $key : Text
		For each ($key; This:C1470.toCopy)
			If ($object.object[$key]=Null:C1517)
				$style[$key]:=This:C1470.defaultValue($key)
			Else 
				$style[$key]:=$object.object[$key]
			End if 
		End for each 
		
		SET TEXT TO PASTEBOARD:C523("objstyle"+JSON Stringify:C1217($style; *))
		
	Else 
		
		ALERT:C41("You must select one object to copy its style")
		
	End if 
	$result:=Null:C1517
	
Function defaultValue($key : Text)->$var : Variant
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
		Else 
			$var:=Null:C1517
	End case 