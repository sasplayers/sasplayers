---- #########################################################################
---- #                                                                       #
---- # Copyright (C) OpenTX                                                  #
-----#                                                                       #
---- # License GPLv2: http://www.gnu.org/licenses/gpl-2.0.html               #
---- #                                                                       #
---- # This program is free software; you can redistribute it and/or modify  #
---- # it under the terms of the GNU General Public License version 2 as     #
---- # published by the Free Software Foundation.                            #
---- #                                                                       #
---- # This program is distributed in the hope that it will be useful        #
---- # but WITHOUT ANY WARRANTY; without even the implied warranty of        #
---- # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         #
---- # GNU General Public License for more details.                          #
---- #                                                                       #
---- #########################################################################

----Reusing the Ghost lua scripts to make a betaflight Modes script
local WGTNAME = "SwiLabels" .. "1.0"  -- max 9 characters

local backgroundBitmap

local idSF
local idSE
local idSA
local idSB
local idS1
local idS2
local idSC
local idSD
local idSG
local idSH
local id6P
local idLS
local idRS

local nameSF
local nameSE
local nameSA
local nameSB
local nameS1
local nameS2
local nameSC
local nameSD
local nameSG
local nameSH
local name6P
local nameLS
local nameRS

local offsetX
local offsetY

local blocks = {}
blocks ['modelname'] = {x=3, y=0,  font=MIDSIZE, dy=10}
blocks ['switches'] = {x=X0A,y=Y1, font=SMLSIZE, dy=12, colsep=40}
blocks ['channels']=	{x=6+56, y=102, dy=8, hBar=5, side=18}


-----------------
-- OPTIONS
-----------------
local options = {
  {"modestate", BOOL, 0 },
  {"Use dflt clrs", BOOL, 1 },
  {"IBTColor", COLOR, BLACK },
	{"IBColor", COLOR, WHITE },
	{"HColor", COLOR, RED },
  {"txt", SOURCE, 1 },
}
--------------------------------
-- callback 
-- called to mode.mix item to getfieldinfo.
--------------------------------
local function matchIdtomodesource(findit)
  local i = 0
    while model.getMix (i,0) do

          if model.getMix(i,0).source == findit then
          findit = model.getMix(i,0).name
          end
    i = i + 1
    end
  return findit
end

-- This function determines the number of items in a field
local function getNumItems (field, maxitems)
	local i = 1
	while true do
		if i > maxitems or not getFieldInfo(field ..i) then
			break
		end
		i = i + 1
	end
	return i-1
end

local function getValues(wgt)
  if wgt.options.modestate == 0 then

  else

  end
end

-- gets images ready for displaying
--
local function create(zone, options)
  local wgt = { zone=zone, options=options}
  backgroundBitmap = Bitmap.open("/WIDGETS/Modes/img/background.png")
  lcd.setColor( CUSTOM_COLOR, options.HColor )
  options = options,
  --start debugging
  print("\n")
  print("creating zone and options")
  print("\n")
  print("\n")
  print("\n")



  offsetX = (wgt.zone.w - 178) / 2
  offsetY = (wgt.zone.h - 148) / 2
  return wgt
end

---------------------------------------------
-- UPDATE is called by OpenTX on registration
-- and at change of settings
---------------------------------------------
local function update(wgt, options)
  wgt.options = options

end

--------------------------------
-- BACKGROUND
-- PERIODICALLY CALLED FUNCTION
--------------------------------
local function background(wgt)
  wgt.options = options
end

------------------------------------
-- REFRESH
-- This is run when the Widget is being displayed
------------------------------------
function refresh(wgt)
  -- runs onty on large enough zone
  if wgt.zone.w < 180 or wgt.zone.h < 145 then
    return
  end

  if backgroundBitmap ~= nil then
    lcd.drawBitmap(backgroundBitmap, wgt.zone.x , wgt.zone.y)
  end
  
  
  getValues(wgt)

  -------------------------------
	-- Model And switch names
	-------------------------------
local bl = blocks['modelname']
--wgt.options = options
		-- stash field id's and names (efficiency)
    idSA = getFieldInfo('sa').id
    nameSA = matchIdtomodesource(idSA)
    --print(nameSA)
    idSB = getFieldInfo('sb').id
    nameSB = matchIdtomodesource(idSB)
    idSC = getFieldInfo('sc').id
    nameSC = matchIdtomodesource(idSC)
    idSD = getFieldInfo('sd').id
    nameSD = matchIdtomodesource(idSD)
    idSE = getFieldInfo('se').id
    nameSE = matchIdtomodesource(idSE)
    idSF = getFieldInfo('sf').id
    nameSF = matchIdtomodesource(idSF)
    idSG = getFieldInfo('sg').id
    nameSG = matchIdtomodesource(idSG)
    idS1 = getFieldInfo('s1').id
    nameS1 = matchIdtomodesource(idS1)
    idS2 = getFieldInfo('s2').id
    nameS2 = matchIdtomodesource(idS2)
    idLS = getFieldInfo('ls').id
    nameLS = matchIdtomodesource(idLS)
    idRS = getFieldInfo('rs').id
    nameRS = matchIdtomodesource(idRS)
    idSH = getFieldInfo('sh').id
    nameSH = matchIdtomodesource(idSH)
    --id6P = getFieldInfo('6p').id
    --print(getValue("157"))
lcd.drawText (wgt.zone.x, wgt.zone.y, model.getInfo().name, MIDSIZE + SHADOWED)
--print("\n")
--print("\n")
--print("\n")
--print(wgt.options.HColor)
--print("\n")
--print("\n")
--print("\n")
lcd.setColor (TEXT_COLOR, wgt.options.HColor)

lcd.drawText (wgt.zone.x + 60, wgt.zone.y + 215 ,nameSA ,SMLSIZE + INVERS)
lcd.drawText (wgt.zone.x + 120, wgt.zone.y + 185 ,nameSB ,SMLSIZE + INVERS)
lcd.drawText (wgt.zone.x + 320, wgt.zone.y + 185 ,nameSC ,SMLSIZE + INVERS)
lcd.drawText (wgt.zone.x + 360, wgt.zone.y + 215 ,nameSD ,SMLSIZE + INVERS)
lcd.drawText (wgt.zone.x + 60, wgt.zone.y + 160 ,nameSE ,SMLSIZE + INVERS)
lcd.drawText (wgt.zone.x + 80, wgt.zone.y + 120 ,nameSF ,SMLSIZE + INVERS)
lcd.drawText (wgt.zone.x + 380, wgt.zone.y + 120 ,nameSG ,SMLSIZE + INVERS)
lcd.drawText (wgt.zone.x + 360, wgt.zone.y + 160 ,nameSH ,SMLSIZE + INVERS)
lcd.drawText (wgt.zone.x + 6, wgt.zone.y + 240 ,nameRS ,SMLSIZE + INVERS)
lcd.drawText (wgt.zone.x + 420, wgt.zone.y + 240 ,nameLS ,SMLSIZE + INVERS)
lcd.drawText (wgt.zone.x + 180, wgt.zone.y + 145 ,nameS1 ,SMLSIZE + INVERS)
lcd.drawText (wgt.zone.x + 260, wgt.zone.y + 145 ,nameS2 ,SMLSIZE + INVERS) 
lcd.setColor (TEXT_INVERTED_COLOR, wgt.options.IBTColor)
lcd.setColor (TEXT_INVERTED_BGCOLOR, wgt.options.IBColor)

return { zone=zone, options=options }

end
return { name="SwiLabels", options=options, create=create, update=update, refresh=refresh, background=background }
