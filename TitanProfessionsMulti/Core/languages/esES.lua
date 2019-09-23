--[[
	Do you want help us translating to your language?
	Access the translation project: https://wow.curseforge.com/projects/titan-panel-professions-multi/localization
	Author: Canettieri
  Spanish translator: aniceto
  Last update: 07/04/2017
--]]

local _, L = ...;
if GetLocale() == "esES" then
--- Profissions
L["alchemy"] = "Alquimia"
L["archaeology"] = "Arqueología"
L["blacksmithing"] = "Herrería"
L["cooking"] = "Cocina"
L["enchanting"] = "Encantamiento"
L["engineering"] = "Ingeniería"
L["firstAid"] = "Primeros auxilios"
L["fishing"] = "Pesca"
L["herbalism"] = "Herboristería"
L["herbalismskills"] = "Habilidades en herboristería"
L["inscription"] = "Inscripción"
L["jewelcrafting"] = "Joyería"
L["leatherworking"] = "Peletería"
L["mining"] = "Minería"
L["miningskills"] = "Habilidades mineras"
L["skinning"] = "Desuello"
L["skinningskills"] = "Habilidad en desuello"
L["tailoring"] = "Sastrería"
L["smelting"] = "Fundición"
-- Master
L["masterPlayer"] = "|cFFFFFFFFMostrando todas las profesiones de ${player}|r|cFFFFFFFF.|r"
L["masterTutorialBar"] = "|cFF69FF69¡Mueva su cursor aquí! :)|r"
L["masterTutorial"] = TitanUtils_GetHighlightText("\r[INTRODUCCIÓN]").."\r\rEste plugin tiene la función de resumir todas sus profesiones en un solo lugar.\rA diferencia de los plugins separados, éste mostrará TODO en esta información\rsobre herramientas.\r\r"..TitanUtils_GetHighlightText("[CÓMO USAR]").."\r\rPara comenzar, haga clic derecho en este complemento y seleccione la opción\r"..TitanUtils_GetHighlightText("'Ocultar tutorial'")..".\r\r¡Se puede visualizar en el lado derecho del Panel de Titán y así ser visualmente\rmás agradable!"
L["hideTutorial"] = "Ocultar Tutorial"
L["masterHint"] = "|cFFB4EEB4Sugerencia:|r |cFFFFFFFFClic izquierdo abre la ventana\rde la profesión #1 y clic botón central abre\rla ventana de la profesión #2.|r\r\r"
L["primprof"] = "Muestra profesiones primarias"
L["bar"] = "Barra"

------ Reagents pack
--- Achaeology
L["ready"] = "|cFF69FF69¡Preparado!  "
L["archfragments"] = "Fragmentos de Arqueología"
L["fragments"] = "Fragmentos"
L["fragtooltip"] = "|cFFB4EEB4Sugerencia:|r |cFFFFFFFFClic derecho en el plugin y\rseleccione el fragmento que será\rmostrado en la barra.|r\r"
L["hidehint"] = "Ocultar Sugerencia"
L["displaynofrag"] = "Mostrar Razas Sin Fragmentos"
L["inprog"] = "\rEn progreso:"
L["nofragments"] = "Sin fragmentos"
L["tooltip"] = "Descripción emergente"
L["noarchaeology"] = "|cFFFF2e2eTodavía no aprendiste arqueología o no tiene fragmentos.|r\r\rVisite al instructor más cercano para aprenderlo o diríjase\ra una zona de excavación."
--- Enchanting
L["arkhana"] = "|cFFFFFFFFArkhana|r"
L["leylight"] = "|cff0070ddFragmento de luz Ley|r"
L["chaosCrystal"] = "|cffa335eeCristal del Caos|r"
--- Fishing
L["mackerel"] = "|cFFFFFFFFCaballa de Plata|r"
L["queenfish"] = "|cFFFFFFFFPez Reina Maldito|r"
L["salmon"] = "|cFFFFFFFFSalmón de Monte Alto|r"
L["mossgill"] = "|cFFFFFFFFPerca Branquimusgo|r"
L["stormray"] = "|cFFFFFFFFRaya Tormenta|r"
L["koi"] = "|cFFFFFFFFKoi de escamas rúnicas|r"
L["barracuda"] = "|cFFFFFFFFBarracuda negra|r"
--- Herbalism
L["yseralline"] = "|cFFFFFFFFSemilla de Yseralline|r"
L["felwort"] = "|cff1eff00Matojo vil|r"
L["starlight"] = "|cFFFFFFFFRosa luz estelar|r"
L["fjarn"] = "|cFFFFFFFFFjarnskaggl|r"
L["foxflower"] = "|cFFFFFFFFFlor de raposa|r"
L["dreamleaf"] = "|cFFFFFFFFFrondasueño|r"
L["aethril"] = "|cFFFFFFFFAethril|r"
--- Mining
L["leystone"] = "|cFFFFFFFFMena de piedra Ley|r"
L["felslate"] = "|cFFFFFFFFPizarra Vil|r"
L["brimstone"] = "|cff1eff00Azufre Infernal|r"
L["blood"] = "|cff0070ddSangre de Sargeras|r"
--- Skinning
L["stormscale"] = "|cFFFFFFFFEscama Tormentosa|r"
L["stonehide"] = "|cFFFFFFFFCuero de Petrapiel|r"
L["felhide"] = "|cff1eff00Pellejo Vil|r"
L["tooth"] = "|cFFFFFFFFDiente sin romper|r"
L["claw"] = "|cFFFFFFFFGarra sin romper|r"
--- Tailoring
L["shaldorei"] = "|cFFFFFFFFSeda Shal'dorei |r"
L["silkweave"] = "|cFFFFFFFFTejido de seda imbuido|r"

------ Shared with one or more
--- Shared
L["hint"] = "|cFFB4EEB4Sugerencia:|r |cFFFFFFFFClic Izquierdo abre la ventana\rde su profesión.|r\r\r"
L["maximum"] = "Max"
L["noprof"] = "Sin aprender"
L["bonus"] = "(Bonificación)"
L["hidemax"] = "Ocultar Valores Máximos"
L["session"] = "|rAprendido en esta sesión: "
L["noskill"] = "|cFFFF2e2eTodavía no aprendiste esta profesión.|r\r\rVaya al entrenador más cercano para aprenderlo.\rSi lo necesita, puede olvidar cualquier profesión primaria."
L["nosecskill"] = "|cFFFF2e2eTodavía no aprendiste esta profesión.|r\r\rVaya al instructor más cercano para aprenderlo."
L["showbb"] = "Mostrar Balance de Sesión en la Barra"
L["simpleb"] = "Bonificación Simplificada"
L["craftsmanship"] = "\rHabilidad: "
L["goodwith"] = "\r\r"..TitanUtils_GetHighlightText("[Combinar con]").."\r"
L["info"] = TitanUtils_GetHighlightText("[Informaciones]")
L["maxskill"] = "|r¡Has alcanzado tu máximo potencial!"
L["warning"] = "\r\r|cFFFF2e2e[¡Atención!]|r\r¡Ha alcanzado la máxima maestría\ry no está aprendiendo más! Visite\run instructor o aprenda la maestría\rlocal." -- Not tested
L["maxtext"] = "\r|rMáximo actual (sin bonificación): "
L["totalbag"] = "Total en la Bolsa: "
L["totalbank"] = "Total en el Banco: "
L["reagents"] = "Componentes"
L["noreagent"] = "No tiene ninguno de\restos componentes."
L["hide"] = "Ocultar"
end
