
Function onInvoke($editor : Object)->$result : Object
	
	ALERT:C41("Your macro "+OB Class:C1730(This:C1470).name+" do not implement onInvoke")
	
/**
 MARK: Selection
*/
	
	// Get the selected object
Function getSelection($editor : Object)->$selection : Collection
	$selection:=New collection:C1472()
	
	var $id : Text
	For each ($id; $editor.editor.currentSelection)
		$selection.push(New object:C1471("id"; $id; "object"; $editor.editor.currentPage.objects[$id]))
	End for each 
	
	// Get the first selected object
	// ASSERT if no selected object
Function getSelectedObject($editor : Object)->$selected : Object
	ASSERT:C1129($editor.editor.currentSelection.length=1)
	$selected:=New object:C1471("id"; $editor.editor.currentSelection[0])
	$selected.object:=$editor.editor.currentPage.objects[$selected.id]
	
	// Has selected one objet only
Function hasSelectedOneObject($editor : Object)->$has : Boolean
	$has:=$editor.editor.currentSelection.length=1
	
	// Has selected one or more objects
Function hasSelection($editor : Object)->$has : Boolean
	$has:=$editor.editor.currentSelection.length>0
	
/**
 MARK: Result
*/
	
	// Notify to 4D the modification
Function notifyCurrentPage($editor : Object)->$result : Object
	$result:=New object:C1471("currentPage"; $editor.editor.currentPage)