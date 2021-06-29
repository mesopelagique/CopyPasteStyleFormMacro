Class extends StyleMacro

Class constructor($config : Object)
	Super:C1705($config)
	This:C1470.label:="Style 🎨"
	
Function onInvoke($editor : Object)->$result : Object
	
	$result:=Null:C1517
	If (This:C1470.hasSelectedOneObject($editor))
		
		var $object; $content; $style; $file : Object
		$object:=This:C1470.getSelectedObject($editor)
		
		$file:=This:C1470.styleFile()
		If ($file.exists)
			$content:=JSON Parse:C1218($file.getText())
			If (Not:C34(OB Is empty:C1297($content)))
				$menu:=cs:C1710.menu.new()
				For each ($name; $content)
					$menu.append($name; $name)
				End for each 
				$menu.popup()
				If ($menu.selected)
					$style:=$content[$menu.choice]
					
					This:C1470.applyStyle($style; $object)
					
					$result:=This:C1470.notifyCurrentPage($editor)
				End if 
			Else 
				ALERT:C41("No style saved yet")
			End if 
		Else 
			ALERT:C41("No style saved yet")
		End if 
		
	Else 
		$result:=Null:C1517
		
		ALERT:C41("You must select one object to apply a style")
		
	End if 
	