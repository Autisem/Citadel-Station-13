#define DWARF_SMELT_AMOUNT 50


/obj/machinery/dwarf/anvil
	name = "Dwarven Anvil"
	desc = "Only a dwarf could manage such a anvil"
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "console"

///obj/machinery/dwarf/anvil/proc/MakeItem(/obj/item/stack/sheet)

/obj/machinery/mineral/processing_unit/dwarf
	name = "Dwarven forge"
	desc = "This hot forge is used by the universes finest craftsmen to make many matarials"
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "console"

/obj/machinery/mineral/processing_unit/dwarf/smelt_ore()
	var/datum/component/material_container/materials = GetComponent(/datum/component/material_container)
	var/datum/material/mat = materials.materials[selected_material]
	if(mat)
		var/sheets_to_remove = (mat.amount >= (MINERAL_MATERIAL_AMOUNT * DWARF_SMELT_AMOUNT) ) ? DWARF_SMELT_AMOUNT : round(mat.amount /  MINERAL_MATERIAL_AMOUNT)
		if(!sheets_to_remove)
			on = FALSE
		else
			var/out = get_step(src, output_dir)
			materials.retrieve_sheets(sheets_to_remove, selected_material, out)
/obj/item/dwarf/hammer
	name = "Dwarven hammer"
	desc = "A strong hammer, made by expert craftsman"
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "toyhammer"
	force = 30
/datum/outfit/dwarf/migrant
	uniform = /obj/item/clothing/under/color/random
	l_pocket = /obj/item/flashlight/flare/torch
	r_pocket = /obj/item/flashlight/lantern
