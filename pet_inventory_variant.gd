extends Control

signal slotClicked(slot)

@onready var slots = [$"1",$"2",$"3",$"4",$"5",$"6",$"7",$"8"]

func _ready() -> void:
	self.updateInventory()
	
func updateInventory():
	if GlobaData.petInventory.size() <= 8:
		for i in GlobaData.petInventory.size():
			slots[i].update(GlobaData.petInventory[i])
	else:
		print("nuh huh")	

func _on_button_pressed() -> void:
	var i = 0		
	get_tree().call_group("Inventory","updateProfile(GlobaData.petInventory[i])")
	slotClicked.emit(i)
	self.visible = false	
	
	
func _on_button_2_pressed() -> void:
	var i = 1
	get_tree().call_group("Inventory","updateProfile(GlobaData.petInventory[i])")
	$"../petProfileSCN".updateProfile(GlobaData.petInventory[i])
	slotClicked.emit(i)
	self.visible = false	
func _on_button_3_pressed() -> void:
	var i = 2
	get_tree().call_group("Inventory","updateProfile(GlobaData.petInventory[i])")
	$"../petProfileSCN".updateProfile(GlobaData.petInventory[i])
	$"../petProfileSCN".visible = true
	%petInventoryVariant.visible = false
	
func _on_button_4_pressed() -> void:
	var i = 3
	get_tree().call_group("Inventory","updateProfile(GlobaData.petInventory[i])")
	$"../petProfileSCN".updateProfile(GlobaData.petInventory[i])

	
func _on_button_5_pressed() -> void:
	var i = 4
	get_tree().call_group("Inventory","updateProfile(GlobaData.petInventory[i])")
	$"../../petProfileSCN".updateProfile(GlobaData.petInventory[i])
	$"../../petProfileSCN".visible = true
	%petInventoryVariant.visible = false
	
func _on_button_6_pressed() -> void:
	var i = 5
	get_tree().call_group("Inventory","updateProfile(GlobaData.petInventory[i])")
	$"../../petProfileSCN".updateProfile(GlobaData.petInventory[i])
	$"../../petProfileSCN".visible = true
	%petInventoryVariant.visible = false
	
func _on_button_7_pressed() -> void:
	var i = 6
	get_tree().call_group("Inventory","updateProfile(GlobaData.petInventory[i])")
	$"../../petProfileSCN".updateProfile(GlobaData.petInventory[i])
	$"../../petProfileSCN".visible = true
	%petInventoryVariant.visible = false
	
func _on_button_8_pressed() -> void:
	var i = 7
	get_tree().call_group("Inventory","updateProfile(GlobaData.petInventory[i])")
	$"../../petProfileSCN".updateProfile(GlobaData.petInventory[i])
	$"../../petProfileSCN".visible = true
	%petInventoryVariant.visible = false


func _on_pet_creator_create_pet_pressed() -> void:
	self.visible = true
	updateInventory()


func _on_pet_profile_scn_back_to_inv() -> void:
	self.visible = true
	updateInventory()
