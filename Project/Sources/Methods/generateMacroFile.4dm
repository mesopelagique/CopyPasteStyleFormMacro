//%attributes = {"invisible":true,"preemptive":"capable"}
var $className; $method : Text
var $content; $instance; $macros : Object

If (Method called on error:C704#Current method name:C684)
	
	$macros:=New object:C1471
	
	For each ($className; cs:C1710)
		
		$method:=Method called on error:C704
		ON ERR CALL:C155(Current method name:C684)
		
		$instance:=cs:C1710[$className].new()  // could failed
		
		If (Value type:C1509($instance.label)=Is text:K8:3)
			If (Value type:C1509($instance.onInvoke)=Is object:K8:27)
				If (OB Instance of:C1731($instance.onInvoke; 4D:C1709.Function))
					$macros[$instance.label]:=New object:C1471("class"; $className)
				End if 
			End if 
		End if 
		ON ERR CALL:C155($method)
		
	End for each 
	
	$content:=New object:C1471("macros"; $macros)
	
	Folder:C1567(fk database folder:K87:14).file("Project/Sources/FormMacros.json").setText(JSON Stringify:C1217($content; *))
	
End if 