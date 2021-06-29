Class extends StyleMacro

Class constructor($config : Object)
	Super:C1705($config)
	This:C1470.label:="Style 💾"
	
Function onInvoke($editor : Object)->$result : Object
	
	If (This:C1470.hasSelectedOneObject($editor))
		
		var $object; $content; $style; $file : Object
		$object:=This:C1470.getSelectedObject($editor)
		$style:=This:C1470.styleFromObject($object)
		
		var $name : Text
		$name:=Request:C163("style name")
		If (OK=1)
			$file:=This:C1470.styleFile()
			If ($file.exists)
				$content:=JSON Parse:C1218($file.getText())
			Else 
				$content:=New object:C1471
			End if 
			$content[$name]:=$style
			$file.setText(JSON Stringify:C1217($content; *))
		End if 
		
	Else 
		
		ALERT:C41("You must select one object to copy its style")
		
	End if 
	$result:=Null:C1517
	