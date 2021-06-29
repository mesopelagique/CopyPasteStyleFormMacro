Class extends StyleMacro

Class constructor($config : Object)
	Super:C1705($config)
	This:C1470.label:="Style ✂️"
	
Function onInvoke($editor : Object)->$result : Object
	
	If (This:C1470.hasSelectedOneObject($editor))
		
		var $object : Object
		$object:=This:C1470.getSelectedObject($editor)
		var $style : Object
		$style:=This:C1470.styleFromObject($object)
		
		SET TEXT TO PASTEBOARD:C523("objstyle"+JSON Stringify:C1217($style; *))
		
	Else 
		
		ALERT:C41("You must select one object to copy its style")
		
	End if 
	$result:=Null:C1517