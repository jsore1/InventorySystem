function Inventory()
    local GAMEUI = BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0)

    function MySplit(inputstr, sep)
        if sep == nil then
            sep = "%%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, FourCC(str))
        end
        return t
    end

    function PlayLocalSound(player, s)
        if GetLocalPlayer() ~= player then
            s = ""
        end
        local sound = CreateSound(s, false, false, false, 10, 10, "")
        SetSoundChannel(sound, 5)
        SetSoundVolume(sound, 127)
        SetSoundPitch(sound, 1)
        StartSound(sound)
        KillSoundWhenDone(sound)
        sound = nil
    end

    Item = {
        id = nil,
        name = "Пусто",
        descr = "Пусто",
        class = nil,
        iconPath = nil,
        abilitys = nil,
        max_stacks = nil,
        num_of_charges = nil,
    }

    function Item:new (o)
        o = o or {}
        setmetatable(o, self)
        self.__index = self
        return o
    end

    itemsDB = {}
    local temp_item
    local n = 1
    local d = 0
    local temp
    local m = 0
    local temp_d
    for i = 1, udg_countItems do
        if i == (1 + m) then temp = 0 end
        if i == (2 + m) then temp = 1 end
        if i == (3 + m) then temp = 2 end
        if i == (4 + m) then temp = 3 end
        if i == (5 + m) then temp = 4 end
        if i == (6 + m) then temp = 5 end
        if i == (7 + m) then temp = 6 end
        if i == (8 + m) then temp = 7 end
        if i == (9 + m) then temp = 8 end
        if i == (10 + m) then temp = 9 end
        if i == (11 + m) then temp = "A" end
        if i == (12 + m) then temp = "B" end
        if i == (13 + m) then temp = "C" end
        if i == (14 + m) then temp = "D" end
        if i == (15 + m) then temp = "E" end
        if i == (16 + m) then temp = "F" end
        if i == (17 + m) then temp = "G" end
        if i == (18 + m) then temp = "H" end
        if i == (19 + m) then temp = "I" end
        if i == (20 + m) then temp = "J" end
        if i == (21 + m) then temp = "K" end
        if i == (22 + m) then temp = "L" end
        if i == (23 + m) then temp = "M" end
        if i == (24 + m) then temp = "N" end
        if i == (25 + m) then temp = "O" end
        if i == (26 + m) then temp = "P" end
        if i == (27 + m) then temp = "Q" end
        if i == (28 + m) then temp = "R" end
        if i == (29 + m) then temp = "S" end
        if i == (30 + m) then temp = "T" end
        if i == (31 + m) then temp = "U" end
        if i == (32 + m) then temp = "V" end
        if i == (33 + m) then temp = "W" end
        if i == (34 + m) then temp = "X" end
        if i == (35 + m) then temp = "Y" end
        if i == (36 + m) then temp = "Z" end

        if i > (36 * n) and d < 10 then
            n = n + 1
            d = d + 1
            m = m + 36
        end

        if i > (36 * n) and d >= 10 then
            n = n + 1
            d = d + 1
            m = m + 36
            if d == 10 then temp_d = "A" end
            if d == 11 then temp_d = "B" end
            if d == 12 then temp_d = "C" end
            if d == 13 then temp_d = "D" end
            if d == 14 then temp_d = "E" end
            if d == 15 then temp_d = "F" end
            if d == 16 then temp_d = "G" end
            if d == 17 then temp_d = "H" end
            if d == 18 then temp_d = "I" end
            if d == 19 then temp_d = "J" end
            if d == 20 then temp_d = "K" end
            if d == 21 then temp_d = "L" end
            if d == 22 then temp_d = "M" end
            if d == 23 then temp_d = "N" end
            if d == 24 then temp_d = "O" end
            if d == 25 then temp_d = "P" end
            if d == 26 then temp_d = "Q" end
            if d == 27 then temp_d = "R" end
            if d == 28 then temp_d = "S" end
            if d == 29 then temp_d = "T" end
            if d == 30 then temp_d = "U" end
            if d == 31 then temp_d = "V" end
            if d == 32 then temp_d = "W" end
            if d == 33 then temp_d = "X" end
            if d == 34 then temp_d = "Y" end
            if d == 35 then temp_d = "Z" end
        end
        if d < 10 then
            temp_item = CreateItem(FourCC("I0".. d .. temp), 0, 0)
            itemsDB[i] = Item:new(
                    {
                        id = FourCC("I0".. d .. temp),
                        name = GetItemName(temp_item),
                        iconPath = BlzGetItemIconPath(temp_item),
                        descr = BlzGetItemDescription(temp_item),
                        class = udg_itemClass[i - 1],
                        max_stacks = 0,
                        num_of_charges = 0,
                    })
        elseif d >= 10 then
            temp_item = CreateItem(FourCC("I0".. temp_d .. temp), 0, 0)
            itemsDB[i] = Item:new(
                    {
                        id = FourCC("I0".. temp_d .. temp),
                        name = GetItemName(temp_item),
                        iconPath = BlzGetItemIconPath(temp_item),
                        descr = BlzGetItemDescription(temp_item),
                        class = udg_itemClass[i - 1],
                        max_stacks = 0,
                        num_of_charges = 0,
                    })
        end
        itemsDB[i]["abilitys"] = MySplit(udg_itemAbilitys[i - 1], " ")
        if udg_itemClass[i - 1] == "Potion" then
            itemsDB[i]["max_stacks"] = 25
            itemsDB[i]["num_of_charges"] = 1
        elseif  udg_itemClass[i - 1] == "Charged" then

        end
        RemoveItem(temp_item)
    end
    temp_item = nil
    udg_countItems = nil
    n = nil
    d = nil
    temp = nil
    m = nil
    temp_d = nil

    local ICON_ONE = udg_icon_one or "war3mapImported\\main_hand_slot.blp"
    local ICON_TWO = udg_icon_two or "war3mapImported\\head_slot.blp"
    local ICON_THREE = udg_icon_three or "war3mapImported\\off_hand_slot.blp"
    local ICON_FOUR = udg_icon_four or "war3mapImported\\hands_slot.blp"
    local ICON_FIVE = udg_icon_five or "war3mapImported\\chest_slot.blp"
    local ICON_SIX = udg_icon_six or "war3mapImported\\shoulders_slot.blp"
    local ICON_SEVEN = udg_icon_seven or "war3mapImported\\neck_slot.blp"
    local ICON_EIGHT = udg_icon_eight or "war3mapImported\\feet_slot.blp"
    local ICON_NINE = udg_icon_nine or "war3mapImported\\waist_slot.blp"
    local EQUIPMENT_CLASS_ONE = udg_eq_class_one or "MainHand"
    local EQUIPMENT_CLASS_TWO = udg_eq_class_two or "Head"
    local EQUIPMENT_CLASS_THREE = udg_eq_class_three or "OffHand"
    local EQUIPMENT_CLASS_FOUR = udg_eq_class_four or "Hands"
    local EQUIPMENT_CLASS_FIVE = udg_eq_class_five or "Chest"
    local EQUIPMENT_CLASS_SIX = udg_eq_class_six or "Shoulders"
    local EQUIPMENT_CLASS_SEVEN = udg_eq_class_seven or "Neck"
    local EQUIPMENT_CLASS_EIGHT = udg_eq_class_eight or "Feet"
    local EQUIPMENT_CLASS_NINE = udg_eq_class_nine or "Waist"

    Inventory = {}

    -- Функция конструктор Персонажа
    function Inventory:new (o)
        o = o or {}
        setmetatable(o, self)
        self.__index = self

        local function CreateTextFrame(frameName, Owner, Inherits, point, relative, relativePoint, x, y, text)
            text = text or ""
            local f = BlzCreateFrameByType("TEXT", frameName, Owner, Inherits, 0)
            BlzFrameSetPoint(f, point, relative, relativePoint, x, y)
            BlzFrameSetTextColor(f, BlzConvertColor(1, 255, 255, 255))
            BlzFrameSetText(f, text)
            return f
        end

        local function CreateInventoryButton(buttonName, iconPath, x, y, width, height)
            local ButtonFrame = BlzCreateFrameByType("GLUEBUTTON", buttonName, GAMEUI, "ScoreScreenTabButtonTemplate", 0)
            local ButtonIconFrame = BlzCreateFrameByType("BACKDROP", (buttonName.."Icon"), ButtonFrame, "", 0)
            BlzFrameSetAllPoints(ButtonIconFrame, ButtonFrame)
            BlzFrameSetTexture(ButtonIconFrame, iconPath, 0, true)
            BlzFrameSetAbsPoint(ButtonFrame, FRAMEPOINT_BOTTOM, x, y)
            BlzFrameSetSize(ButtonFrame, width, height)
            local buttonEventTrigger = CreateTrigger()
            TriggerAddAction(buttonEventTrigger, function()
                if GetLocalPlayer() == o.player then
                    local visible = BlzFrameIsVisible(o.inventory.backdrop)
                    BlzFrameSetVisible(o.inventory.backdrop, not visible)
                    BlzFrameSetVisible(o.inventory.frame, not visible)
                    BlzFrameSetEnable(BlzGetTriggerFrame(), false)
                    BlzFrameSetEnable(BlzGetTriggerFrame(), true)
                end
            end)
            BlzTriggerRegisterFrameEvent(buttonEventTrigger, ButtonFrame, FRAMEEVENT_CONTROL_CLICK)
            return ButtonFrame
        end

        local function CreateFrameByTypeSAP(frameType, frameName, Owner, Inherits, createContext, relative)
            local f = BlzCreateFrameByType(frameType, frameName, Owner, Inherits, createContext)
            BlzFrameSetAllPoints(f, relative)
            return f
        end

        local function CreateFrameByTypeSP(frameType, frameName, Owner, Inherits, createContext, texFile, width, height, point, relative, relativePoint, x, y)
            local f = BlzCreateFrameByType(frameType, frameName, Owner, Inherits, createContext)
            BlzFrameSetTexture(f, texFile, 0, true)
            BlzFrameSetSize(f, width, height)
            BlzFrameSetPoint(f, point, relative, relativePoint, x, y)
            return f
        end

        local function CreateFrameByTypeSAbsP(frameType, frameName, Owner, Inherits, createContext, texFile, width, height, point, x, y)
            local f = BlzCreateFrameByType(frameType, frameName, Owner, Inherits, createContext)
            BlzFrameSetTexture(f, texFile, 0, true)
            BlzFrameSetSize(f, width, height)
            BlzFrameSetAbsPoint(f, point, x, y)
            return f
        end

        local function FramesSetAlpha(lines, columns, inventorySlots, alpha)
            for n = 1, lines do
                for p = 1, columns do
                    BlzFrameSetAlpha(inventorySlots[n][p]["slotTransparent"], alpha)
                end
            end
        end

        local function CreateRFEAAA(trigger, frame, event, func)
            BlzTriggerRegisterFrameEvent(trigger, frame, event)
            TriggerAddAction(trigger, func)
        end

        local function CreateRPMEAAA(trigger, player, event, func)
            TriggerRegisterPlayerMouseEventBJ(trigger, player, bj_MOUSEEVENTTYPE_DOWN)
            TriggerAddAction(trigger, func)
        end

        local function CreateRUEAAA(trigger, hero, event, func)
            TriggerRegisterUnitEvent(trigger, hero, event)
            TriggerAddAction(trigger, func)
        end

        local function CreateInventoryBacklight()
            o.inventory.backlight = {}
            o.inventory.backlight.right = {}
            o.inventory.backlight.left = {}
            o.inventory.backlight.top = {}
            o.inventory.backlight.bottom = {}
            for i = 1, 20 do
                o.inventory.backlight.right[i] = CreateFrameByTypeSP("BACKDROP", "", o.inventory.backdrop, "", 0, "war3mapImported\\emty_transparent.blp", 0.0012, 0.4308, FRAMEPOINT_LEFT, o.inventory.backdrop, FRAMEPOINT_RIGHT, 0 + (0.0012 * (i - 1)), 0)
                o.inventory.backlight.left[i] = CreateFrameByTypeSP("BACKDROP", "", o.inventory.backdrop, "", 0, "war3mapImported\\emty_transparent.blp", 0.0012, 0.4308, FRAMEPOINT_RIGHT, o.inventory.backdrop, FRAMEPOINT_LEFT, 0 - (0.0012 * (i - 1)), 0)
                o.inventory.backlight.top[i] = CreateFrameByTypeSP("BACKDROP", "", o.inventory.backdrop, "", 0, "war3mapImported\\emty_transparent.blp", 0.252, 0.0012, FRAMEPOINT_BOTTOM, o.inventory.backdrop, FRAMEPOINT_TOP, 0, 0 + (0.0012 * (i - 1)))
                o.inventory.backlight.bottom[i] = CreateFrameByTypeSP("BACKDROP", "", o.inventory.backdrop, "", 0, "war3mapImported\\emty_transparent.blp", 0.252, 0.0012, FRAMEPOINT_TOP, o.inventory.backdrop, FRAMEPOINT_BOTTOM, 0, 0 - (0.0012 * (i - 1)))
                BlzFrameSetAlpha(o.inventory.backlight.right[i], math.floor((50 - (i * 2.5))))
                BlzFrameSetAlpha(o.inventory.backlight.left[i], math.floor((50 - (i * 2.5))))
                BlzFrameSetAlpha(o.inventory.backlight.top[i], math.floor((50 - (i * 2.5))))
                BlzFrameSetAlpha(o.inventory.backlight.bottom[i], math.floor((50 - (i * 2.5))))
            end
        end

        local function InventoryBacklightSetVisible(enable)
            for i = 1, 20 do
                BlzFrameSetVisible(o.inventory.backlight.right[i], enable)
                BlzFrameSetVisible(o.inventory.backlight.left[i], enable)
                BlzFrameSetVisible(o.inventory.backlight.top[i], enable)
                BlzFrameSetVisible(o.inventory.backlight.bottom[i], enable)
            end
        end

        o.inventory = {
            lines = 4,
            columns = 5,
            backdrop = BlzCreateFrame("EscMenuBackdrop", GAMEUI, 0, 0),
            leave_trigger = CreateTrigger(),
            click_trigger = CreateTrigger(),
            pick_up_item_trigger = CreateTrigger(),
            slots = {},
            position_x = udg_inv_pos_x or 0.16,
            position_y = udg_inv_pos_y or 0.37,
        }
        BlzFrameSetSize(o.inventory.backdrop, 0.252, 0.39)
        BlzFrameSetAbsPoint(o.inventory.backdrop, FRAMEPOINT_CENTER, o.inventory.position_x, o.inventory.position_y)
        o.inventory.frame = CreateFrameByTypeSAP("BUTTON", "IP", GAMEUI, "", 0, o.inventory.backdrop)
        o.inventory.title = CreateTextFrame("IPTT", o.inventory.frame, "EscMenuTitleTextTemplate", FRAMEPOINT_TOP, o.inventory.frame, FRAMEPOINT_TOP, 0, -0.022, "Инвентарь")
        CreateInventoryBacklight()
        InventoryBacklightSetVisible(false)
        -- Отлавливаем момент получения предмета
        CreateRUEAAA(o.inventory.pick_up_item_trigger, o.unit, EVENT_UNIT_PICKUP_ITEM, function()
            --print(BlzGetItemTooltip(GetManipulatedItem()))
            if not o.triggerValues.use_potion then
                o:addItem(GetManipulatedItem())
            end
        end)
        -- Отлавливаем момент, когда мышь покидает окно инвентаря
        CreateRFEAAA(o.inventory.leave_trigger, o.inventory.frame, FRAMEEVENT_MOUSE_LEAVE, function()
            o.triggerValues.inventory_leave = true
        end)

        o.equipment = {
            lines = 3,
            columns = 3,
            slots = {},
        }
        o.other = {
            lines = 3,
            columns = 2,
            backdrop = CreateFrameByTypeSAbsP("BACKDROP", "OF", GAMEUI, "", 0, "war3mapImported\\transparent_slot.blp", 0.128, 0.175, FRAMEPOINT_CENTER, 0.51, 0.18),
            slots = {},
        }

        o.button = CreateInventoryButton("IB", "ReplaceableTextures\\CommandButtons\\BTNDust.blp", 0.215, 0.14, 0.024, 0.024)

        o.triggerValues = {
            inventory_leave = false,
            inventory_item_clicked = false,
            equipment_item = false,
            temp_i = false,
            temp_j = false,
            menu_frame = false,
        }

        -- Выкидываем предмет, если игрок кликнул за пределами окна инвентаря
        CreateRPMEAAA(o.inventory.click_trigger, o.player, bj_MOUSEEVENTTYPE_DOWN, function()
            if BlzGetTriggerPlayerMouseButton() == MOUSE_BUTTON_TYPE_LEFT and o.triggerValues.inventory_leave and (o.triggerValues.inventory_item_clicked or o.triggerValues.equipment_item) then
                PlayLocalSound(o.player, "sound\\interface\\HeroDropItem1.flac")
                CreateItem(o.triggerValues.inventory_item_clicked.id, GetUnitX(o.unit), GetUnitY(o.unit))
                if o.triggerValues.equipment_item then
                    for m = 1, #o.equipment.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"]["abilitys"] do
                        UnitRemoveAbility(o.unit, o.equipment.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"]["abilitys"][m])
                    end
                    o.equipment.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"] = Item:new()
                    BlzFrameSetTexture(o.equipment.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["itemBackdrop"], "war3mapImported\\transparent_slot.blp", 0, true)
                elseif o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"]["num_of_charges"] == 1 then
                    o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"] = Item:new()
                    BlzFrameSetTexture(o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["slotItemBackdrop"], "war3mapImported\\transparent_slot.blp", 0, true)
                    BlzFrameSetText(o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["nocText"], "")
                elseif o.triggerValues.inventory_item_clicked.class == "Potion" then
                    o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"]["num_of_charges"] = o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"]["num_of_charges"] - 1
                    BlzFrameSetText(o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["nocText"], o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"]["num_of_charges"])
                else
                    o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"] = Item:new()
                    BlzFrameSetTexture(o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["slotItemBackdrop"], "war3mapImported\\transparent_slot.blp", 0, true)
                end
                InventoryBacklightSetVisible(false)
                FramesSetAlpha(o.inventory.lines, o.inventory.columns, o.inventory.slots, 0)
                FramesSetAlpha(o.equipment.lines, o.equipment.columns, o.equipment.slots, 0)
                o.triggerValues.inventory_leave = false
                o.triggerValues.inventory_item_clicked = false
                o.triggerValues.equipment_item = false
                o.triggerValues.temp_i = false
                o.triggerValues.temp_j = false
            end
            if BlzGetTriggerPlayerMouseButton() == MOUSE_BUTTON_TYPE_RIGHT and o.triggerValues.inventory_item_clicked and o.triggerValues.inventory_leave then
                FramesSetAlpha(o.inventory.lines, o.inventory.columns, o.inventory.slots, 0)
                FramesSetAlpha(o.equipment.lines, o.equipment.columns, o.equipment.slots, 0)
                o.triggerValues.inventory_leave = false
                o.triggerValues.inventory_item_clicked = false
                o.triggerValues.equipment_item = false
                o.triggerValues.temp_i = false
                o.triggerValues.temp_j = false
            end
        end)

        -- Добавляем в свойство tooltip ссылку на фрейм тултипа
        o.tooltip = {
            backdrop = BlzCreateFrameByType("BACKDROP", "Tooltip", o.inventory.frame, "EscMenuControlBackdropTemplate", 0)
        }
        o.tooltip.title = CreateTextFrame("TooltipTitle", o.tooltip.backdrop, "", FRAMEPOINT_TOPLEFT, o.tooltip.backdrop, FRAMEPOINT_TOPLEFT, 0.01, -0.01)
        o.tooltip.text = CreateTextFrame("TooltipText", o.tooltip.backdrop, "", FRAMEPOINT_TOPLEFT, o.tooltip.backdrop, FRAMEPOINT_TOPLEFT, 0.01, -0.02)
        BlzFrameSetSize(o.tooltip.text, 0.125, 0.08)
        BlzFrameSetSize(o.tooltip.backdrop, 0.14, 0.1)
        BlzFrameSetLevel(o.tooltip.backdrop, 2)
        BlzFrameSetVisible(o.tooltip.backdrop, false)

        for i = 1, o.inventory.lines do
            o.inventory.slots[i] = {}
            for j = 1, o.inventory.columns do
                o.inventory.slots[i][j] = {}
                o.inventory.slots[i][j]["slotBackdrop"] = CreateFrameByTypeSP("BACKDROP", "SB", o.inventory.frame, "", 0, "UI\\Widgets\\Console\\Human\\human-transport-slot.blp", 0.038, 0.038, FRAMEPOINT_TOPLEFT, o.inventory.backdrop, FRAMEPOINT_TOPLEFT, 0.028 + ((j - 1) * 0.0395), (-0.205 + ((i - 1) * -0.0395)))
                o.inventory.slots[i][j]["slotItemBackdrop"] = CreateFrameByTypeSP("BACKDROP", "SIB", o.inventory.frame, "", 0, "war3mapImported\\transparent_slot.blp", 0.034, 0.034, FRAMEPOINT_CENTER, o.inventory.slots[i][j]["slotBackdrop"], FRAMEPOINT_CENTER, 0, 0)
                o.inventory.slots[i][j]["slotTransparent"] = CreateFrameByTypeSP("BACKDROP", "ST", o.inventory.frame, "", 0, "war3mapImported\\transparent_slot.blp", 0.034, 0.034, FRAMEPOINT_CENTER, o.inventory.slots[i][j]["slotBackdrop"], FRAMEPOINT_CENTER, 0, 0)
                o.inventory.slots[i][j]["buttonFrame"] = CreateFrameByTypeSAP("BUTTON", "BF", o.inventory.slots[i][j]["slotBackdrop"], "", 0, o.inventory.slots[i][j]["slotBackdrop"])
                BlzFrameSetLevel(o.inventory.slots[i][j]["buttonFrame"], 5)
                o.inventory.slots[i][j]["nocText"] = CreateTextFrame("NOCT", o.inventory.frame, "", FRAMEPOINT_BOTTOMRIGHT, o.inventory.slots[i][j]["slotBackdrop"], FRAMEPOINT_BOTTOMRIGHT, -0.005, 0.005)
                o.inventory.slots[i][j]["cooldownFrame"] = CreateFrameByTypeSAP("BUTTON", "CDF", o.inventory.slots[i][j]["buttonFrame"], "", 0, o.inventory.slots[i][j]["buttonFrame"])
                BlzFrameSetVisible(o.inventory.slots[i][j]["cooldownFrame"], false)
                o.inventory.slots[i][j]["cooldownText"] = CreateTextFrame("CDT", o.inventory.frame, "EscMenuTitleTextTemplate", FRAMEPOINT_CENTER, o.inventory.slots[i][j]["cooldownFrame"], FRAMEPOINT_CENTER, 0, 0)
                o.inventory.slots[i][j]["cooldown"] = false
                o.inventory.slots[i][j]["item"] = Item:new()
                BlzFrameSetText(o.tooltip.text, "Пусто")
                BlzFrameSetText(o.tooltip.title, "Пусто")
                o.inventory.slots[i][j]["fr"] = false -- Для отлова правой кнопки мыши на фрейме
                o.inventory.slots[i][j]["triggers"] = {
                    CreateTrigger(),
                    CreateTrigger(),
                    CreateTrigger(),
                    CreateTrigger(),
                    CreateTrigger(),
                }
                o.inventory.slots[i][j]["events"] = {
                    BlzTriggerRegisterFrameEvent(o.inventory.slots[i][j]["triggers"][1], o.inventory.slots[i][j]["buttonFrame"], FRAMEEVENT_MOUSE_ENTER),
                    BlzTriggerRegisterFrameEvent(o.inventory.slots[i][j]["triggers"][2], o.inventory.slots[i][j]["buttonFrame"], FRAMEEVENT_MOUSE_LEAVE),
                    BlzTriggerRegisterFrameEvent(o.inventory.slots[i][j]["triggers"][3], o.inventory.slots[i][j]["buttonFrame"], FRAMEEVENT_CONTROL_CLICK),
                    TriggerRegisterPlayerMouseEventBJ(o.inventory.slots[i][j]["triggers"][4], o.player, bj_MOUSEEVENTTYPE_DOWN),
                    BlzTriggerRegisterFrameEvent(o.inventory.slots[i][j]["triggers"][5], o.inventory.slots[i][j]["cooldownFrame"], FRAMEEVENT_MOUSE_ENTER),
                }
                o.inventory.slots[i][j]["actions"] = {
                    TriggerAddAction(o.inventory.slots[i][j]["triggers"][1], function()
                        o.triggerValues.inventory_leave = false
                        o.inventory.slots[i][j]["fr"] = BlzGetTriggerFrame()
                        BlzFrameSetText(o.tooltip.text, o.inventory.slots[i][j]["item"]["descr"])
                        BlzFrameSetText(o.tooltip.title, o.inventory.slots[i][j]["item"]["name"])
                        if o.inventory.position_x > 0.5 then
                            BlzFrameSetPoint(o.tooltip.backdrop, FRAMEPOINT_TOPRIGHT, o.inventory.slots[i][j]["slotBackdrop"], FRAMEPOINT_TOPLEFT, 0, 0)
                        elseif o.inventory.position_x < 0.5 then
                            BlzFrameSetPoint(o.tooltip.backdrop, FRAMEPOINT_TOPLEFT, o.inventory.slots[i][j]["slotBackdrop"], FRAMEPOINT_TOPRIGHT, 0, 0)
                        end
                        if o.triggerValues.inventory_item_clicked == false then
                            BlzFrameSetVisible(o.tooltip.backdrop, true)
                        end
                    end),
                    TriggerAddAction(o.inventory.slots[i][j]["triggers"][2], function()
                        if not o.inventory.slots[i][j]["cooldown"] then
                            BlzFrameSetAlpha(o.inventory.slots[i][j]["slotItemBackdrop"], 255)
                        end
                        --o.triggerValues["cooldown"] = false
                        o.inventory.slots[i][j]["fr"] = false
                        BlzFrameSetVisible(o.tooltip.backdrop, false)
                        BlzFrameSetText(o.tooltip.text, "")
                        BlzFrameSetText(o.tooltip.title, "")
                        o.triggerValues["inventory_slot_leave"] = true
                    end),
                    TriggerAddAction(o.inventory.slots[i][j]["triggers"][3], function()
                        if o.triggerValues.inventory_item_clicked then
                            if o.triggerValues.equipment_item then
                                if o.inventory.slots[i][j]["item"]["id"] == nil then
                                    PlayLocalSound(o.player, "sound\\interface\\BigButtonClick.flac")
                                    o.inventory.slots[i][j]["item"] = o.triggerValues.inventory_item_clicked
                                    BlzFrameSetTexture(o.inventory.slots[i][j]["slotItemBackdrop"], o.inventory.slots[i][j]["item"]["iconPath"], 0, true)
                                    BlzFrameSetAlpha(o.inventory.slots[i][j]["slotItemBackdrop"], 255)
                                    o.equipment.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"] = Item:new()
                                    BlzFrameSetTexture(o.equipment.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["itemBackdrop"], "war3mapImported\\transparent_slot.blp", 0, true)
                                    for m = 1, #o.inventory.slots[i][j]["item"]["abilitys"] do
                                        UnitRemoveAbility(o.unit, o.inventory.slots[i][j]["item"]["abilitys"][m])
                                    end
                                    InventoryBacklightSetVisible(false)
                                    FramesSetAlpha(o.inventory.lines, o.inventory.columns, o.inventory.slots, 0)
                                    FramesSetAlpha(o.equipment.lines, o.equipment.columns, o.equipment.slots, 0)
                                    o.triggerValues.inventory_item_clicked = false
                                    o.triggerValues.equipment_item = false
                                    o.triggerValues.temp_i = false
                                    o.triggerValues.temp_j = false
                                elseif o.inventory.slots[i][j]["item"]["class"] == o.triggerValues.inventory_item_clicked.class then
                                    PlayLocalSound(o.player, "sound\\interface\\BigButtonClick.flac")
                                    local temp = o.inventory.slots[i][j]["item"]
                                    o.inventory.slots[i][j]["item"] = o.triggerValues.inventory_item_clicked
                                    o.equipment.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"] = temp
                                    BlzFrameSetTexture(o.inventory.slots[i][j]["slotItemBackdrop"], o.inventory.slots[i][j]["item"]["iconPath"], 0, true)
                                    BlzFrameSetAlpha(o.inventory.slots[i][j]["slotItemBackdrop"], 255)
                                    BlzFrameSetTexture(o.equipment.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["itemBackdrop"], o.equipment.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"]["iconPath"], 0, true)
                                    BlzFrameSetAlpha(o.inventory.slots[i][j]["slotTransparent"], 0)
                                    for m = 1, #o.inventory.slots[i][j]["item"]["abilitys"] do
                                        UnitRemoveAbility(o.unit, o.inventory.slots[i][j]["item"]["abilitys"][m])
                                    end
                                    for m = 1, #o.equipment.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"]["abilitys"] do
                                        UnitAddAbility(o.unit, o.equipment.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"]["abilitys"][m])
                                        BlzUnitHideAbility(o.unit, o.equipment.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"]["abilitys"][m], true)
                                    end
                                    InventoryBacklightSetVisible(false)
                                    FramesSetAlpha(o.inventory.lines, o.inventory.columns, o.inventory.slots, 0)
                                    FramesSetAlpha(o.equipment.lines, o.equipment.columns, o.equipment.slots, 0)
                                    o.triggerValues.inventory_item_clicked = false
                                    o.triggerValues.temp_i = false
                                    o.triggerValues.temp_j = false
                                    temp = false
                                    o.triggerValues.equipment_item = false
                                end
                            else
                                if o.inventory.slots[i][j]["item"]["id"] == nil then
                                    PlayLocalSound(o.player, "sound\\interface\\BigButtonClick.flac")
                                    o.inventory.slots[i][j]["item"] = o.triggerValues.inventory_item_clicked
                                    BlzFrameSetTexture(o.inventory.slots[i][j]["slotItemBackdrop"], o.inventory.slots[i][j]["item"]["iconPath"], 0, true)
                                    BlzFrameSetAlpha(o.inventory.slots[i][j]["slotItemBackdrop"], 255)
                                    o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"] = Item:new()
                                    BlzFrameSetTexture(o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["slotItemBackdrop"], "war3mapImported\\transparent_slot.blp", 0, true)
                                    if o.triggerValues.inventory_item_clicked.class == "Potion" then
                                        BlzFrameSetText(o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["nocText"], "")
                                        BlzFrameSetText(o.inventory.slots[i][j]["nocText"], o.triggerValues.inventory_item_clicked.num_of_charges)
                                    end
                                    InventoryBacklightSetVisible(false)
                                    FramesSetAlpha(o.inventory.lines, o.inventory.columns, o.inventory.slots, 0)
                                    FramesSetAlpha(o.equipment.lines, o.equipment.columns, o.equipment.slots, 0)
                                    o.triggerValues.inventory_item_clicked = false
                                    o.triggerValues.temp_i = false
                                    o.triggerValues.temp_j = false
                                else
                                    PlayLocalSound(o.player, "sound\\interface\\BigButtonClick.flac")
                                    local temp = o.inventory.slots[i][j]["item"]
                                    o.inventory.slots[i][j]["item"] = o.triggerValues.inventory_item_clicked
                                    o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"] = temp
                                    BlzFrameSetTexture(o.inventory.slots[i][j]["slotItemBackdrop"], o.inventory.slots[i][j]["item"]["iconPath"], 0, true)
                                    BlzFrameSetAlpha(o.inventory.slots[i][j]["slotItemBackdrop"], 255)
                                    BlzFrameSetTexture(o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["slotItemBackdrop"], o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"]["iconPath"], 0, true)
                                    BlzFrameSetAlpha(o.inventory.slots[i][j]["slotTransparent"], 0)
                                    if o.triggerValues.inventory_item_clicked.class ~= "Potion" and temp["class"] ~= "Potion" then
                                        BlzFrameSetText(o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["nocText"], "")
                                        BlzFrameSetText(o.inventory.slots[i][j]["nocText"], "")
                                    elseif o.triggerValues.inventory_item_clicked.class ~= "Potion" then
                                        BlzFrameSetText(o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["nocText"], o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"]["num_of_charges"])
                                        BlzFrameSetText(o.inventory.slots[i][j]["nocText"], "")
                                    end
                                    if o.triggerValues.inventory_item_clicked.class == "Potion" then
                                        if temp["class"] ~= "Potion" then
                                            BlzFrameSetText(o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["nocText"], "")
                                        else
                                            BlzFrameSetText(o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["nocText"], o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"]["num_of_charges"])
                                        end
                                        BlzFrameSetText(o.inventory.slots[i][j]["nocText"], o.inventory.slots[i][j]["item"]["num_of_charges"])
                                    end
                                    FramesSetAlpha(o.inventory.lines, o.inventory.columns, o.inventory.slots, 0)
                                    FramesSetAlpha(o.equipment.lines, o.equipment.columns, o.equipment.slots, 0)
                                    InventoryBacklightSetVisible(false)
                                    o.triggerValues.inventory_item_clicked = false
                                    o.triggerValues.temp_i = false
                                    o.triggerValues.temp_j = false
                                    temp = false
                                end
                            end
                        else
                            if o.inventory.slots[i][j]["item"]["id"] ~= nil then
                                BlzFrameSetVisible(o.tooltip.backdrop, false)
                                PlayLocalSound(o.player, "sound\\interface\\BigButtonClick.flac")
                                o.triggerValues.inventory_item_clicked = o.inventory.slots[i][j]["item"]
                                o.triggerValues.temp_i = i
                                o.triggerValues.temp_j = j
                                InventoryBacklightSetVisible(true)
                                for n = 1, o.inventory.lines do
                                    for p = 1, o.inventory.columns do
                                        if o.inventory.slots[i][j]["item"] ~= o.inventory.slots[n][p]["item"] then
                                            BlzFrameSetTexture(o.inventory.slots[n][p]["slotTransparent"], "war3mapImported\\emty_transparent.blp", 0, true)
                                            BlzFrameSetAlpha(o.inventory.slots[n][p]["slotTransparent"], 50)
                                        end
                                        if o.inventory.slots[n][p]["cooldown"] then
                                            BlzFrameSetTexture(o.inventory.slots[n][p]["slotTransparent"], "war3mapImported\\full_transparent.blp", 0, true)
                                            BlzFrameSetAlpha(o.inventory.slots[n][p]["slotTransparent"], 50)
                                        end
                                    end
                                end
                                for n = 1, o.equipment.lines do
                                    for p = 1, o.equipment.columns do
                                        if o.equipment.slots[n][p]["class"] == o.inventory.slots[i][j]["item"]["class"] then
                                            BlzFrameSetTexture(o.equipment.slots[n][p]["slotTransparent"], "war3mapImported\\emty_transparent.blp", 0, true)
                                            BlzFrameSetAlpha(o.equipment.slots[n][p]["slotTransparent"], 50)
                                        else
                                            BlzFrameSetTexture(o.equipment.slots[n][p]["slotTransparent"], "war3mapImported\\full_transparent.blp", 0, true)
                                            BlzFrameSetAlpha(o.equipment.slots[n][p]["slotTransparent"], 50)
                                        end
                                    end
                                end
                            end
                        end
                    end),
                    TriggerAddAction(o.inventory.slots[i][j]["triggers"][4], function()
                        if o.inventory.slots[i][j]["fr"] ~= false and BlzGetTriggerPlayerMouseButton() == MOUSE_BUTTON_TYPE_RIGHT then
                            if not o.triggerValues.inventory_item_clicked then
                                --print("Получилось")
                                for t = 1, o.equipment.lines do
                                    for r = 1, o.equipment.columns do
                                        if o.inventory.slots[i][j]["item"]["class"] == o.equipment.slots[t][r]["class"] and o.equipment.slots[t][r]["item"]["id"] == nil then
                                            PlayLocalSound(o.player, "sound\\interface\\BigButtonClick.flac")
                                            o.equipment.slots[t][r]["item"] = o.inventory.slots[i][j]["item"]
                                            o.inventory.slots[i][j]["item"] = Item:new()
                                            BlzFrameSetTexture(o.inventory.slots[i][j]["slotItemBackdrop"], "war3mapImported\\transparent_slot.blp", 0, true)
                                            BlzFrameSetTexture(o.equipment.slots[t][r]["itemBackdrop"], o.equipment.slots[t][r]["item"]["iconPath"] , 0, true)
                                            for z = 1, #o.equipment.slots[t][r]["item"]["abilitys"] do
                                                UnitAddAbility(o.unit, o.equipment.slots[t][r]["item"]["abilitys"][z])
                                                BlzUnitHideAbility(o.unit, o.equipment.slots[t][r]["item"]["abilitys"][z], true)
                                            end
                                            o.inventory.slots[i][j]["fr"] = false
                                            BlzFrameSetVisible(o.tooltip.backdrop, false)
                                            return
                                        elseif o.inventory.slots[i][j]["item"]["class"] == o.equipment.slots[t][r]["class"] and o.equipment.slots[t][r]["item"]["id"] ~= nil then
                                            PlayLocalSound(o.player, "sound\\interface\\BigButtonClick.flac")
                                            local temp = o.equipment.slots[t][r]["item"]
                                            o.equipment.slots[t][r]["item"] = o.inventory.slots[i][j]["item"]
                                            o.inventory.slots[i][j]["item"] = temp
                                            BlzFrameSetTexture(o.inventory.slots[i][j]["slotItemBackdrop"], o.inventory.slots[i][j]["item"]["iconPath"], 0, true)
                                            BlzFrameSetTexture(o.equipment.slots[t][r]["itemBackdrop"], o.equipment.slots[t][r]["item"]["iconPath"] , 0, true)
                                            for y = 1, #o.inventory.slots[i][j]["item"]["abilitys"] do
                                                UnitRemoveAbility(o.unit, o.inventory.slots[i][j]["item"]["abilitys"][y])
                                            end
                                            for z = 1, #o.equipment.slots[t][r]["item"]["abilitys"] do
                                                UnitAddAbility(o.unit, o.equipment.slots[t][r]["item"]["abilitys"][z])
                                                BlzUnitHideAbility(o.unit, o.equipment.slots[t][r]["item"]["abilitys"][z], true)
                                            end
                                            BlzFrameSetVisible(o.tooltip.backdrop, false)
                                            temp = false
                                            --o.inventory.slots[i][j]["fr"] = false
                                            return
                                        elseif o.inventory.slots[i][j]["item"]["class"] == "Potion" then
                                            if o.inventory.slots[i][j]["item"]["num_of_charges"] > 1 then
                                                o.triggerValues["use_potion"] = true
                                                o.inventory.slots[i][j]["cooldown"] = true
                                                o.inventory.slots[i][j]["item"]["num_of_charges"] = o.inventory.slots[i][j]["item"]["num_of_charges"] - 1
                                                BlzFrameSetText(o.inventory.slots[i][j]["nocText"], o.inventory.slots[i][j]["item"]["num_of_charges"])
                                                BlzFrameSetAlpha(o.inventory.slots[i][j]["slotItemBackdrop"], 50)
                                                BlzFrameSetVisible(o.inventory.slots[i][j]["cooldownFrame"], true)
                                                UnitAddItemByIdSwapped(o.inventory.slots[i][j]["item"]["id"], o.unit)
                                                local cd_periodic_trigger = CreateTrigger()
                                                local cd = BlzGetAbilityCooldown(o.inventory.slots[i][j]["item"]["abilitys"][1], 0)
                                                BlzFrameSetText(o.inventory.slots[i][j]["cooldownText"], math.floor(cd))
                                                TriggerRegisterTimerEventPeriodic(cd_periodic_trigger, 1.0)
                                                TriggerAddAction(cd_periodic_trigger, function()
                                                    cd = cd - 1
                                                    BlzFrameSetText(o.inventory.slots[i][j]["cooldownText"], math.floor(cd))
                                                end)
                                                local cd_trigger = CreateTrigger()
                                                TriggerRegisterTimerEventSingle(cd_trigger, cd)
                                                TriggerAddAction(cd_trigger, function()
                                                    BlzFrameSetText(o.inventory.slots[i][j]["cooldownText"], "")
                                                    DestroyTrigger(cd_periodic_trigger)
                                                    BlzFrameSetAlpha(o.inventory.slots[i][j]["slotItemBackdrop"], 255)
                                                    BlzFrameSetVisible(o.inventory.slots[i][j]["cooldownFrame"], false)
                                                    if o.triggerValues.inventory_item_clicked then
                                                        BlzFrameSetTexture(o.inventory.slots[i][j]["slotTransparent"], "war3mapImported\\emty_transparent.blp", 0, true)
                                                        BlzFrameSetAlpha(o.inventory.slots[i][j]["slotTransparent"], 50)
                                                    end
                                                    o.inventory.slots[i][j]["cooldown"] = false
                                                    cd_trigger = false
                                                end)
                                                UnitUseItem(o.unit, GetLastCreatedItem())
                                                RemoveItem(GetLastCreatedItem())
                                                o.triggerValues["use_potion"] = false
                                                return
                                            else
                                                o.triggerValues["use_potion"] = true
                                                UnitAddItemByIdSwapped(o.inventory.slots[i][j]["item"]["id"], o.unit)
                                                UnitUseItem(o.unit, GetLastCreatedItem())
                                                RemoveItem(GetLastCreatedItem())
                                                o.inventory.slots[i][j]["item"] = Item:new()
                                                BlzFrameSetTexture(o.inventory.slots[i][j]["slotItemBackdrop"], "war3mapImported\\transparent_slot", 0, true)
                                                BlzFrameSetText(o.inventory.slots[i][j]["nocText"], "")
                                                o.triggerValues["use_potion"] = false
                                                return
                                            end
                                        end
                                    end
                                end
                            elseif o.inventory.slots[i][j]["item"]["id"] ~= nil then
                                BlzFrameSetAlpha(o.inventory.slots[i][j]["slotTransparent"], 0)
                                InventoryBacklightSetVisible(false)
                                FramesSetAlpha(o.inventory.lines, o.inventory.columns, o.inventory.slots, 0)
                                FramesSetAlpha(o.equipment.lines, o.equipment.columns, o.equipment.slots, 0)
                                o.triggerValues.inventory_item_clicked = false
                                o.triggerValues.temp_i = false
                                o.triggerValues.temp_j = false
                                o.triggerValues.equipment_item = false
                            else
                                BlzFrameSetTexture(o.inventory.slots[i][j]["slotItemBackdrop"], "war3mapImported\\transparent_slot.blp", 0, true)
                                BlzFrameSetAlpha(o.inventory.slots[i][j]["slotItemBackdrop"], 255)
                                FramesSetAlpha(o.inventory.lines, o.inventory.columns, o.inventory.slots, 0)
                                FramesSetAlpha(o.equipment.lines, o.equipment.columns, o.equipment.slots, 0)
                                o.triggerValues.inventory_item_clicked = false
                                o.triggerValues.temp_i = false
                                o.triggerValues.temp_j = false
                                o.triggerValues.equipment_item = false
                            end
                        end
                    end),
                    TriggerAddAction(o.inventory.slots[i][j]["triggers"][5], function()
                        o.triggerValues.inventory_leave = false
                    end)
                }
            end
        end

        for i = 1, o.equipment.lines do
            o.equipment.slots[i] = {}
            for j = 1, o.equipment.columns do
                o.equipment.slots[i][j] = {}
                o.equipment.slots[i][j]["backdrop"] = BlzCreateFrameByType("BACKDROP", "Backdrop", o.inventory.frame, "", 0)
                o.equipment.slots[i][j]["itemBackdrop"] = BlzCreateFrameByType("BACKDROP", "ItemBackdrop", o.inventory.frame, "", 0)
                o.equipment.slots[i][j]["slotTransparent"] = BlzCreateFrameByType("BACKDROP", "SlotTransparent", o.inventory.frame, "", 0)
                BlzFrameSetTexture(o.equipment.slots[i][j]["slotTransparent"], "war3mapImported\\transparent_slot.blp", 0, true)
                o.equipment.slots[i][j]["buttonFrame"] = BlzCreateFrameByType("BUTTON", "", o.equipment.slots[i][j]["backdrop"], "", 0)
                o.equipment.slots[i][j]["item"] = Item:new()
                BlzFrameSetAllPoints(o.equipment.slots[i][j]["slotTransparent"], o.equipment.slots[i][j]["backdrop"])
                o.equipment.slots[i][j]["fr"] = false
                o.equipment.slots[i][j]["triggers"] = {
                    CreateTrigger(),
                    CreateTrigger(),
                    CreateTrigger(),
                    CreateTrigger(),
                }
                o.equipment.slots[i][j]["events"] ={
                    BlzTriggerRegisterFrameEvent(o.equipment.slots[i][j]["triggers"][1], o.equipment.slots[i][j]["buttonFrame"], FRAMEEVENT_MOUSE_ENTER),
                    BlzTriggerRegisterFrameEvent(o.equipment.slots[i][j]["triggers"][2], o.equipment.slots[i][j]["buttonFrame"], FRAMEEVENT_MOUSE_LEAVE),
                    BlzTriggerRegisterFrameEvent(o.equipment.slots[i][j]["triggers"][3], o.equipment.slots[i][j]["buttonFrame"], FRAMEEVENT_CONTROL_CLICK),
                    TriggerRegisterPlayerMouseEventBJ(o.equipment.slots[i][j]["triggers"][4], o.player, bj_MOUSEEVENTTYPE_DOWN),
                }
                o.equipment.slots[i][j]["actions"] = {
                    TriggerAddAction(o.equipment.slots[i][j]["triggers"][1], function()
                        o.equipment.slots[i][j]["fr"] = BlzGetTriggerFrame()
                        o.triggerValues.inventory_leave = false
                        BlzFrameSetText(o.tooltip.text, o.equipment.slots[i][j]["item"]["descr"])
                        BlzFrameSetText(o.tooltip.title, o.equipment.slots[i][j]["item"]["name"])
                        if o.inventory.position_x > 0.5 then
                            BlzFrameSetPoint(o.tooltip.backdrop, FRAMEPOINT_TOPRIGHT, o.equipment.slots[i][j]["backdrop"], FRAMEPOINT_TOPLEFT, 0, 0)
                        elseif o.inventory.position_x < 0.5 then
                            BlzFrameSetPoint(o.tooltip.backdrop, FRAMEPOINT_TOPLEFT, o.equipment.slots[i][j]["backdrop"], FRAMEPOINT_TOPRIGHT, 0, 0)
                        end
                        if o.triggerValues.inventory_item_clicked == false then
                            BlzFrameSetVisible(o.tooltip.backdrop, true)
                        end
                        --BlzFrameSetVisible(o.tooltip.backdrop, true)
                    end),
                    TriggerAddAction(o.equipment.slots[i][j]["triggers"][2], function()
                        BlzFrameSetVisible(o.tooltip.backdrop, false)
                        BlzFrameSetText(o.tooltip.text, "")
                        BlzFrameSetText(o.tooltip.title, "")
                        o.equipment.slots[i][j]["fr"] = false
                    end),
                    TriggerAddAction(o.equipment.slots[i][j]["triggers"][3], function()
                        if o.triggerValues.inventory_item_clicked then
                            if o.equipment.slots[i][j]["class"] == o.triggerValues.inventory_item_clicked.class and o.equipment.slots[i][j]["item"]["id"] == nil then
                                PlayLocalSound(o.player, "sound\\interface\\BigButtonClick.flac")
                                o.equipment.slots[i][j]["item"] = o.triggerValues.inventory_item_clicked
                                o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"] = Item:new()
                                BlzFrameSetTexture(o.equipment.slots[i][j]["itemBackdrop"], o.equipment.slots[i][j]["item"]["iconPath"], 0, true)
                                BlzFrameSetTexture(o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["slotItemBackdrop"], "war3mapImported\\transparent_slot.blp", 0, true)
                                BlzFrameSetAlpha(o.equipment.slots[i][j]["itemBackdrop"], 255)
                                for m = 1, #o.equipment.slots[i][j]["item"]["abilitys"] do
                                    UnitAddAbility(o.unit, o.equipment.slots[i][j]["item"]["abilitys"][m])
                                    BlzUnitHideAbility(o.unit, o.equipment.slots[i][j]["item"]["abilitys"][m], true)
                                end
                                InventoryBacklightSetVisible(false)
                                FramesSetAlpha(o.inventory.lines, o.inventory.columns, o.inventory.slots, 0)
                                FramesSetAlpha(o.equipment.lines, o.equipment.columns, o.equipment.slots, 0)
                                o.triggerValues.inventory_item_clicked = false
                                o.triggerValues.equipment_item = false
                                o.triggerValues.temp_i = false
                                o.triggerValues.temp_j = false
                            elseif o.equipment.slots[i][j]["item"]["id"] == o.triggerValues.inventory_item_clicked.id then
                                PlayLocalSound(o.player, "sound\\interface\\BigButtonClick.flac")
                                BlzFrameSetAlpha(o.equipment.slots[i][j]["slotTransparent"], 0)
                                InventoryBacklightSetVisible(false)
                                FramesSetAlpha(o.inventory.lines, o.inventory.columns, o.inventory.slots, 0)
                                FramesSetAlpha(o.equipment.lines, o.equipment.columns, o.equipment.slots, 0)
                                o.triggerValues.inventory_item_clicked = false
                                o.triggerValues.equipment_item = false
                                o.triggerValues.temp_i = false
                                o.triggerValues.temp_j = false
                            elseif o.equipment.slots[i][j]["class"] == o.triggerValues.inventory_item_clicked.class and o.equipment.slots[i][j]["item"]["id"] ~= nil then
                                PlayLocalSound(o.player, "sound\\interface\\BigButtonClick.flac")
                                local temp = o.equipment.slots[i][j]["item"]
                                o.equipment.slots[i][j]["item"] = o.triggerValues.inventory_item_clicked
                                o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"] = temp
                                BlzFrameSetTexture(o.equipment.slots[i][j]["itemBackdrop"], o.equipment.slots[i][j]["item"]["iconPath"], 0, true)
                                BlzFrameSetAlpha(o.equipment.slots[i][j]["itemBackdrop"], 255)
                                BlzFrameSetTexture(o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["slotItemBackdrop"], o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"]["iconPath"], 0, true)
                                BlzFrameSetAlpha(o.equipment.slots[i][j]["slotTransparent"], 0)
                                for m = 1, #o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"]["abilitys"] do
                                    UnitRemoveAbility(o.unit, o.inventory.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"]["abilitys"][m])
                                end
                                for m = 1, #o.equipment.slots[i][j]["item"]["abilitys"] do
                                    UnitAddAbility(o.unit, o.equipment.slots[i][j]["item"]["abilitys"][m])
                                    BlzUnitHideAbility(o.unit, o.equipment.slots[i][j]["item"]["abilitys"][m], true)
                                end
                                InventoryBacklightSetVisible(false)
                                FramesSetAlpha(o.inventory.lines, o.inventory.columns, o.inventory.slots, 0)
                                FramesSetAlpha(o.equipment.lines, o.equipment.columns, o.equipment.slots, 0)
                                o.triggerValues.inventory_item_clicked = false
                                o.triggerValues.temp_i = false
                                o.triggerValues.temp_j = false
                                temp = false
                                o.triggerValues.equipment_item = false
                            elseif o.equipment.slots[i][j]["class"] ~= o.triggerValues.inventory_item_clicked.class then

                            else
                                InventoryBacklightSetVisible(false)
                                FramesSetAlpha(o.inventory.lines, o.inventory.columns, o.inventory.slots, 0)
                                FramesSetAlpha(o.equipment.lines, o.equipment.columns, o.equipment.slots, 0)
                                o.triggerValues.inventory_item_clicked = false
                                o.triggerValues.equipment_item = false
                                o.triggerValues.temp_i = false
                                o.triggerValues.temp_j = false
                            end
                        else
                            if o.equipment.slots[i][j]["item"]["id"] ~= nil then
                                PlayLocalSound(o.player, "sound\\interface\\BigButtonClick.flac")
                                o.triggerValues.inventory_item_clicked = o.equipment.slots[i][j]["item"]
                                o.triggerValues.equipment_item = true
                                o.triggerValues.temp_i = i
                                o.triggerValues.temp_j = j
                                InventoryBacklightSetVisible(true)
                                for n = 1, o.equipment.lines do
                                    for p = 1, o.equipment.columns do
                                        if o.equipment.slots[n][p]["class"] == o.equipment.slots[i][j]["item"]["class"] then

                                        else
                                            BlzFrameSetTexture(o.equipment.slots[n][p]["slotTransparent"], "war3mapImported\\full_transparent.blp", 0, true)
                                            BlzFrameSetAlpha(o.equipment.slots[n][p]["slotTransparent"], 50)
                                        end
                                    end
                                end
                                for n = 1, o.inventory.lines do
                                    for p = 1, o.inventory.columns do
                                        BlzFrameSetTexture(o.inventory.slots[n][p]["slotTransparent"], "war3mapImported\\emty_transparent.blp", 0, true)
                                        BlzFrameSetAlpha(o.inventory.slots[n][p]["slotTransparent"], 50)
                                        if o.inventory.slots[n][p]["item"]["id"] ~= nil and o.inventory.slots[n][p]["item"]["class"] ~= o.equipment.slots[o.triggerValues.temp_i][o.triggerValues.temp_j]["item"]["class"] then
                                            BlzFrameSetTexture(o.inventory.slots[n][p]["slotTransparent"], "war3mapImported\\full_transparent.blp", 0, true)
                                            BlzFrameSetAlpha(o.inventory.slots[n][p]["slotTransparent"], 50)
                                        end
                                    end
                                end
                            end
                        end
                    end),
                    TriggerAddAction(o.equipment.slots[i][j]["triggers"][4], function()
                        if o.equipment.slots[i][j]["fr"] ~= false and BlzGetTriggerPlayerMouseButton() == MOUSE_BUTTON_TYPE_RIGHT and o.equipment.slots[i][j]["item"]["id"] ~= nil then
                            local temp = o.equipment.slots[i][j]["item"]
                            for t = 1, o.inventory.lines do
                                for r = 1, o.inventory.columns do
                                    if o.inventory.slots[t][r]["item"]["id"] == nil then
                                        o.equipment.slots[i][j]["item"] = Item:new()
                                        o.inventory.slots[t][r]["item"] = temp
                                        BlzFrameSetTexture(o.equipment.slots[i][j]["itemBackdrop"], "war3mapImported\\transparent_slot.blp", 0, true)
                                        BlzFrameSetTexture(o.inventory.slots[t][r]["slotItemBackdrop"], temp["iconPath"], 0, true)
                                        for y = 1, #temp["abilitys"] do
                                            UnitRemoveAbility(o.unit, temp["abilitys"][y])
                                        end
                                        BlzFrameSetVisible(o.tooltip.backdrop, false)
                                        temp = nil
                                        o.triggerValues.inventory_item_clicked = false
                                        o.triggerValues.temp_i = false
                                        o.triggerValues.temp_j = false
                                        o.triggerValues.equipment_item = false
                                        return
                                    elseif t == o.inventory.lines and r == o.inventory.columns and o.inventory.slots[t][r]["item"]["id"] ~= nil then
                                        DisplayTextToForce(o.player, "Инвентарь полон")
                                    end
                                end
                            end
                        elseif o.equipment.slots[i][j]["fr"] ~= false and BlzGetTriggerPlayerMouseButton() == MOUSE_BUTTON_TYPE_RIGHT then
                            if o.triggerValues.inventory_item_clicked then

                            elseif o.triggerValues.equipment_item then

                            else
                                o.triggerValues.inventory_item_clicked = false
                                o.triggerValues.temp_i = false
                                o.triggerValues.temp_j = false
                                o.triggerValues.equipment_item = false
                            end
                        end
                    end)
                }
                BlzFrameSetTexture(o.equipment.slots[i][j]["itemBackdrop"], "war3mapImported\\transparent_slot.blp", 0, true)
                BlzFrameSetSize(o.equipment.slots[i][j]["backdrop"], 0.038, 0.038)
                BlzFrameSetSize(o.equipment.slots[i][j]["itemBackdrop"], 0.038, 0.038)
                BlzFrameSetAllPoints(o.equipment.slots[i][j]["buttonFrame"], o.equipment.slots[i][j]["backdrop"])
                BlzFrameSetPoint(o.equipment.slots[i][j]["itemBackdrop"], FRAMEPOINT_CENTER, o.equipment.slots[i][j]["backdrop"], FRAMEPOINT_CENTER, 0, 0)
                BlzFrameSetPoint(o.equipment.slots[i][j]["backdrop"], FRAMEPOINT_TOP, o.inventory.frame, FRAMEPOINT_TOP, -0.058 + ((j - 1) * 0.058), -0.042 - ((i - 1) * 0.058))
            end
        end
        BlzFrameSetTexture(o.equipment.slots[1][1]["backdrop"], ICON_ONE, 0, true)
        o.equipment.slots[1][1]["class"] = EQUIPMENT_CLASS_ONE
        BlzFrameSetTexture(o.equipment.slots[1][2]["backdrop"], ICON_TWO, 0, true)
        o.equipment.slots[1][2]["class"] = EQUIPMENT_CLASS_TWO
        BlzFrameSetTexture(o.equipment.slots[1][3]["backdrop"], ICON_THREE, 0, true)
        o.equipment.slots[1][3]["class"] = EQUIPMENT_CLASS_THREE
        BlzFrameSetTexture(o.equipment.slots[2][1]["backdrop"], ICON_FOUR, 0, true)
        o.equipment.slots[2][1]["class"] = EQUIPMENT_CLASS_FOUR
        BlzFrameSetTexture(o.equipment.slots[2][2]["backdrop"], ICON_FIVE, 0, true)
        o.equipment.slots[2][2]["class"] = EQUIPMENT_CLASS_FIVE
        BlzFrameSetTexture(o.equipment.slots[2][3]["backdrop"], ICON_SIX, 0, true)
        o.equipment.slots[2][3]["class"] = EQUIPMENT_CLASS_SIX
        BlzFrameSetTexture(o.equipment.slots[3][1]["backdrop"], ICON_SEVEN, 0, true)
        o.equipment.slots[3][1]["class"] = EQUIPMENT_CLASS_SEVEN
        BlzFrameSetTexture(o.equipment.slots[3][2]["backdrop"], ICON_EIGHT, 0, true)
        o.equipment.slots[3][2]["class"] = EQUIPMENT_CLASS_EIGHT
        BlzFrameSetTexture(o.equipment.slots[3][3]["backdrop"], ICON_NINE, 0, true)
        o.equipment.slots[3][3]["class"] = EQUIPMENT_CLASS_NINE

        BlzFrameSetVisible(o.other.backdrop, false)
        o.triggerSelectionEvent = CreateTrigger()
        TriggerRegisterPlayerSelectionEventBJ(o.triggerSelectionEvent, o.player, true)
        TriggerAddAction(o.triggerSelectionEvent, function()
            if GetTriggerUnit() == o.unit and o.player == GetLocalPlayer() then
                BlzFrameSetVisible(o.other.backdrop, true)
                BlzFrameSetVisible(o.button, true)
            end
        end)
        o.triggerDeselectionEvent = CreateTrigger()
        TriggerRegisterPlayerSelectionEventBJ(o.triggerDeselectionEvent, o.player, false)
        TriggerAddAction(o.triggerDeselectionEvent, function()
            if GetTriggerUnit() == o.unit and o.player == GetLocalPlayer() then
                BlzFrameSetVisible(o.other.backdrop, false)
                BlzFrameSetVisible(o.button, false)
                BlzFrameSetVisible(o.inventory.backdrop, false)
                BlzFrameSetVisible(o.inventory.frame, false)
                o.triggerValues.inventory_leave = false
                o.triggerValues.inventory_item_clicked = false
                o.triggerValues.equipment_item = false
                o.triggerValues.temp_i = false
                o.triggerValues.temp_j = false
            end
        end)

        for i = 1, o.other.lines do
            o.other.slots[i] = {}
            for j = 1, o.other.columns do
                o.other.slots[i][j] = {}
                o.other.slots[i][j]["slotItemBackdrop"] = CreateFrameByTypeSAbsP("BACKDROP", "OSIB", o.other.backdrop, "", 0, "war3mapImported\\transparent_slot.blp", 0.032, 0.032, FRAMEPOINT_CENTER, 0.532 + ((j - 1) * 0.04), 0.095 - ((i - 1) * 0.038))
                o.other.slots[i][j]["buttonFrame"] = CreateFrameByTypeSAP("BUTTON", "", o.other.slots[i][j]["slotItemBackdrop"], "", 0, o.other.slots[i][j]["slotItemBackdrop"])
                --o.other.slots[i][j]["nocText"] = CreateTextFrame("NOCT", o.other.backdrop, "", FRAMEPOINT_BOTTOMRIGHT, o.other.slots[i][j]["slotItemBackdrop"], FRAMEPOINT_BOTTOMRIGHT, -0.002, 0.002)
                o.other.slots[i][j]["menuFrame"] = BlzCreateFrameByType("FRAME", "MF", o.other.backdrop, "", 0)
                BlzFrameSetLevel(o.other.slots[i][j]["menuFrame"], 5)
                BlzFrameSetVisible(o.other.slots[i][j]["menuFrame"], false)
                o.other.slots[i][j]["menuButtons"] = {}
                o.other.slots[i][j]["menuButtonFrames"] = {}
                o.other.slots[i][j]["item"] = Item:new()
                o.other.slots[i][j]["fr"] = false

                o.other.slots[i][j]["triggers"] = {
                    CreateTrigger(),
                    CreateTrigger(),
                    CreateTrigger(),
                    CreateTrigger(),
                }

                o.other.slots[i][j]["events"] = {
                    BlzTriggerRegisterFrameEvent(o.other.slots[i][j]["triggers"][1], o.other.slots[i][j]["buttonFrame"], FRAMEEVENT_MOUSE_ENTER),
                    BlzTriggerRegisterFrameEvent(o.other.slots[i][j]["triggers"][2], o.other.slots[i][j]["buttonFrame"], FRAMEEVENT_MOUSE_LEAVE),
                    BlzTriggerRegisterFrameEvent(o.other.slots[i][j]["triggers"][3], o.other.slots[i][j]["buttonFrame"], FRAMEEVENT_CONTROL_CLICK),
                    TriggerRegisterPlayerMouseEventBJ(o.other.slots[i][j]["triggers"][4], o.player, bj_MOUSEEVENTTYPE_DOWN),
                }

                o.other.slots[i][j]["actions"] ={
                    TriggerAddAction(o.other.slots[i][j]["triggers"][1], function()
                        o.other.slots[i][j]["fr"] = BlzGetTriggerFrame()
                    end),
                    TriggerAddAction(o.other.slots[i][j]["triggers"][2], function()
                        o.other.slots[i][j]["fr"] = false
                    end),
                    TriggerAddAction(o.other.slots[i][j]["triggers"][3], function()

                    end),
                    TriggerAddAction(o.other.slots[i][j]["triggers"][4], function()
                        if o.other.slots[i][j]["fr"] ~= false and BlzGetTriggerPlayerMouseButton() == MOUSE_BUTTON_TYPE_RIGHT then
                            --print("получилось")
                            local temp = {}
                            for n = 1, o.inventory.lines do
                                for p = 1, o.inventory.columns do
                                    if o.inventory.slots[n][p]["item"]["class"] == "Potion" then
                                        table.insert(temp, o.inventory.slots[n][p]["item"])
                                    end
                                end
                            end
                            for n = 1, #temp do
                                o.other.slots[i][j]["menuButtonFrames"][n] = BlzCreateFrameByType("BACKDROP", "mbf", o.other.slots[i][j]["menuFrame"], "", 0)
                                BlzFrameSetSize(o.other.slots[i][j]["menuButtonFrames"][n], 0.02, 0.02)
                                BlzFrameSetTexture(o.other.slots[i][j]["menuButtonFrames"][n], temp[n]["iconPath"], 0, true)
                                BlzFrameSetPoint(o.other.slots[i][j]["menuButtonFrames"][n], FRAMEPOINT_TOPRIGHT, o.other.slots[i][j]["slotItemBackdrop"], FRAMEPOINT_TOPLEFT, 0, (0.02 * #temp) - ((n - 1) * 0.021))
                                o.other.slots[i][j]["menuButtons"][n] = BlzCreateFrameByType("BUTTON", "mb", o.other.slots[i][j]["menuFrame"], "", 0)
                                BlzFrameSetAllPoints(o.other.slots[i][j]["menuButtons"][n], o.other.slots[i][j]["menuButtonFrames"][n])
                                o.other.slots[i][j]["triggers"][n] = {
                                    CreateTrigger()
                                }
                                o.other.slots[i][j]["events"][n] = {
                                    BlzTriggerRegisterFrameEvent(o.other.slots[i][j]["triggers"][n][1], o.other.slots[i][j]["menuButtons"][n], FRAMEEVENT_CONTROL_CLICK)
                                }
                                o.other.slots[i][j]["actions"][n] = {
                                    TriggerAddAction(o.other.slots[i][j]["triggers"][n][1], function()
                                        o.other.slots[i][j]["item"] = temp[n]
                                        BlzFrameSetTexture(o.other.slots[i][j]["slotItemBackdrop"], temp[n]["iconPath"], 0, true)
                                        --BlzFrameSetText(o.other.slots[i][j]["nocText"], temp[n]["num_of_charges"])
                                        BlzFrameSetVisible(o.other.slots[i][j]["menuFrame"], false)
                                    end)
                                }
                            end
                            BlzFrameSetVisible(o.other.slots[i][j]["menuFrame"], true)
                            --temp = false
                        end
                    end),
                }
            end
        end

        BlzFrameClearAllPoints(BlzGetFrameByName("InventoryButton_0", 0))
        BlzFrameClearAllPoints(BlzGetFrameByName("InventoryButton_1", 0))
        BlzFrameClearAllPoints(BlzGetFrameByName("InventoryButton_2", 0))
        BlzFrameClearAllPoints(BlzGetFrameByName("InventoryButton_3", 0))
        BlzFrameClearAllPoints(BlzGetFrameByName("InventoryButton_4", 0))
        BlzFrameClearAllPoints(BlzGetFrameByName("InventoryButton_5", 0))

        BlzFrameSetVisible(o.inventory.backdrop, false)
        BlzFrameSetVisible(o.inventory.frame, false)
        BlzFrameSetVisible(o.button, false)
        return o
    end

    function Inventory:addItem(item)
        for i = 1, self.inventory.lines do
            for j = 1, self.inventory.columns do
                if self.inventory.slots[i][j]["item"]["id"] == nil then
                    for k = 1, #itemsDB do
                        if GetItemTypeId(item) == itemsDB[k]["id"] then
                            if itemsDB[k]["class"] == "Potion" then
                                for l = 1, self.inventory.lines do
                                    for m = 1, self.inventory.columns do
                                        if self.inventory.slots[l][m]["item"]["id"] == itemsDB[k]["id"] and self.inventory.slots[l][m]["item"]["num_of_charges"] < self.inventory.slots[l][m]["item"]["max_stacks"] then
                                            self.inventory.slots[l][m]["item"]["num_of_charges"] = self.inventory.slots[l][m]["item"]["num_of_charges"] + 1
                                            BlzFrameSetText(self.inventory.slots[l][m]["nocText"], self.inventory.slots[l][m]["item"]["num_of_charges"])
                                            PlayLocalSound(self.player, "sound\\interface\\PickUpItem.flac")
                                            RemoveItem(item)
                                            return
                                        end
                                    end
                                end
                            end
                            self.inventory.slots[i][j]["item"] = Item:new({
                                id = itemsDB[k]["id"],
                                name = itemsDB[k]["name"],
                                descr = itemsDB[k]["descr"],
                                class = itemsDB[k]["class"],
                                iconPath = itemsDB[k]["iconPath"],
                                abilitys = itemsDB[k]["abilitys"],
                                max_stacks = itemsDB[k]["max_stacks"],
                                num_of_charges = itemsDB[k]["num_of_charges"],
                            })
                            BlzFrameSetTexture(self.inventory.slots[i][j]["slotItemBackdrop"], self.inventory.slots[i][j]["item"]["iconPath"], 0, true)
                            if self.inventory.slots[i][j]["item"]["class"] == "Potion" then
                                BlzFrameSetText(self.inventory.slots[i][j]["nocText"], self.inventory.slots[i][j]["item"]["num_of_charges"])
                            end
                            PlayLocalSound(self.player, "sound\\interface\\PickUpItem.flac")
                            RemoveItem(item)
                            return
                        end
                    end
                elseif self.inventory.slots[i][j]["item"]["class"] == "Potion" and self.inventory.slots[i][j]["item"]["id"] == GetItemTypeId(item) then
                    if self.inventory.slots[i][j]["item"]["num_of_charges"] < self.inventory.slots[i][j]["item"]["max_stacks"] then
                        self.inventory.slots[i][j]["item"]["num_of_charges"] = self.inventory.slots[i][j]["item"]["num_of_charges"] + 1
                        BlzFrameSetText(self.inventory.slots[i][j]["nocText"], self.inventory.slots[i][j]["item"]["num_of_charges"])
                        PlayLocalSound(self.player, "sound\\interface\\PickUpItem.flac")
                        RemoveItem(item)
                        return
                    end
                elseif i == self.inventory.lines and j == self.inventory.columns and self.inventory.slots[i][j]["item"]["id"] ~= nil then
                    print("Инвентарь полон")
                    UnitDropItem(self.unit, GetItemTypeId(item))
                    RemoveItem(item)
                end
            end
        end
    end

    function CreateInventory(hero, pl)
        return Inventory:new({ unit = hero, player = pl })
    end

    BlzLoadTOCFile("war3mapImported\\framedef.toc")

    BlzFrameClearAllPoints(BlzGetFrameByName("InventoryText", 0))

end