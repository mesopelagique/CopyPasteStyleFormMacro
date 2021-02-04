Class extends FormMacro

Function onInvoke($editor : Object)->$result : Object
	
	$result:=Null:C1517
	
	var $pasteboard : Text
	$pasteboard:=Get text from pasteboard:C524
	
	Case of 
		: (Position:C15("objstyle{"; $pasteboard)#1)
			ALERT:C41("No style in pasteboard")
		: (Not:C34(This:C1470.hasSelectedOneObject($editor)))  // TODO  apply to many using hasSelection
			
			ALERT:C41("You must select one object to copy its style")
			
		Else 
			var $style : Object
			$style:=JSON Parse:C1218(Substring:C12($pasteboard; Length:C16("objstyle")+1))  // TODO manage parsing error
			
			var $object : Object
			$object:=This:C1470.getSelectedObject($editor)
			var $key : Text
			For each ($key; $style)
				$object.object[$key]:=$style[$key]
			End for each 
			
			$result:=This:C1470.notifyCurrentPage($editor)
	End case 
	