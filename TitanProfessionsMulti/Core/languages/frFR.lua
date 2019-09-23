--[[
	Do you want help us translating to your language?
	Access the translation project: https://wow.curseforge.com/projects/titan-panel-professions-multi/localization
	Author: Canettieri
  French translator: akirra83, aniceto
  Last update: 07/04/2017
--]]

local _, L = ...;
if GetLocale() == "frFR" then
--- Profissions
L["alchemy"] = "Alchimie"
L["archaeology"] = "Archéologie"
L["blacksmithing"] = "Forge"
L["cooking"] = "Cuisine"
L["enchanting"] = "Enchantement"
L["engineering"] = "Ingénierie"
L["firstAid"] = "Secourisme"
L["fishing"] = "Pêche"
L["herbalism"] = "Herboristerie"
L["herbalismskills"] = "Compétences en Herboristerie"
L["inscription"] = "Calligraphie"
L["jewelcrafting"] = "Joaillerie"
L["leatherworking"] = "Travail du cuir"
L["mining"] = "Minage"
L["miningskills"] = "Compétences en minage"
L["skinning"] = "Dépeçage"
L["skinningskills"] = "Compétences en Dépeçage"
L["tailoring"] = "Couture"
L["smelting"] = "Fonte"
--- Master
L["masterPlayer"] = "|cFFFFFFFFAffiche tout les métiers de ${player}|r|cFFFFFFFF.|r"
L["masterTutorialBar"] = "|cFF69FF69Mettez votre curseur ici! :)|r"
L["masterTutorial"] = TitanUtils_GetHighlightText("\r[INTRODUCTION]").."\r\rCe plugin a la fonction de résumer toutes vos professions dans un seul endroit.\rContrairement aux plugins séparés, celui-ci affichera TOUT dans cette info-bulle.\r\r"..TitanUtils_GetHighlightText("[COMMENT UTILISER]").."\r\rPour commencer, cliquez bouton droit sur ce plug-in et sélectionnez l'option\r"..TitanUtils_GetHighlightText("«Cacher Tutorial»")..".\r\rPeut être affiché sur le côté droit du panneau de Titan pour devenir encore plus\ragréable visuellement!"
L["hideTutorial"] = "Masquer le tutoriel"
L["masterHint"] = "|cFFB4EEB4Astuces:|r |cFFFFFFFFClic gauche ouvre la fenêtre du métier\r#1 et clic du milieu ouvre la fenêtre du métier #2.|r\r\r"
L["primprof"] = "Affiche les métiers principaux"
L["bar"] = "Barre"

------ Reagents pack
--- Achaeology
L["ready"] = "|cFF69FF69Prêt!  "
L["archfragments"] = "Fragments d'archéologie"
L["fragments"] = "Fragments"
L["fragtooltip"] = "|cFFB4EEB4Conseil:|r |cFFFFFFFFcliquez avec le bouton droit de la\rsouris dans le plugin et sélectionnez le\rfragment qui sera affiché dans la barre.|r\r"
L["hidehint"] = "Masquer les astuces"
L["displaynofrag"] = "Affiche les races sans fragments"
L["inprog"] = "\rEn progression:"
L["nofragments"] = "Aucun fragment"
L["tooltip"] = "Info-bulle"
L["noarchaeology"] = "|cFFFF2e2eVous n'avez pas encore appris l'archéologie ou n'avez\rpas de fragments.|r\r\rAller à l'instructeur le plus proche pour l'apprendre ou\rvisiter un champ d'excavation."
--- Enchanting
L["arkhana"] = "|cFFFFFFFFArkhana|r"
L["leylight"] = "|cff0070ddEclat de lumière tellurique|r"
L["chaosCrystal"] = "|cffa335eeCristal du chaos|r"
--- Fishing
L["mackerel"] = "|cFFFFFFFFMaquereau d'argent|r"
L["queenfish"] = "|cFFFFFFFFTalang maudit|r"
L["salmon"] = "|cFFFFFFFFSaumon de Haut-Roc|r"
L["mossgill"] = "|cFFFFFFFFPerche moussebranchie|r"
L["stormray"] = "|cFFFFFFFFRaie-tempête|r"
L["koi"] = "|cFFFFFFFFKoï runécaille|r"
L["barracuda"] = "|cFFFFFFFFBarracuda noir|r"
--- Herbalism
L["yseralline"] = "|cFFFFFFFFGraine d'yseralline|r"
L["felwort"] = "|cff1eff00Gangrèche|r"
L["starlight"] = "|cFFFFFFFFRose lumétoile|r"
L["fjarn"] = "|cFFFFFFFFFjarnskaggl|r"
L["foxflower"] = "|cFFFFFFFFVulpille|r"
L["dreamleaf"] = "|cFFFFFFFFSongefeuille|r"
L["aethril"] = "|cFFFFFFFFAethril|r"
--- Mining
L["leystone"] = "|cFFFFFFFFMinerai de tellurium|r"
L["felslate"] = "|cFFFFFFFFGangreschiste|r"
L["brimstone"] = "|cff1eff00Soufre infernal|r"
L["blood"] = "|cff0070ddSang de Sargeras|r"
--- Skinning
L["stormscale"] = "|cFFFFFFFFEcaille de tempête|r"
L["stonehide"] = "|cFFFFFFFFCuir de peau-roche|r"
L["felhide"] = "|cff1eff00Gangrepeau|r"
L["tooth"] = "|cFFFFFFFFDent intacte|r"
L["claw"] = "|cFFFFFFFFGriffe intacte|r"
--- Tailoring
L["shaldorei"] = "|cFFFFFFFFSoie shal'dorei|r"
L["silkweave"] = "|cFFFFFFFFSoie tissée imprégnée|r"

--- Shared
L["hint"] = "|cFFB4EEB4Astuce:|r |cFFFFFFFFClic gauche ouvre votre\rfenêtre des métiers.|r\r\r"
L["maximum"] = "Max"
L["noprof"] = "Non appris"
L["bonus"] = "(Bonus)"
L["hidemax"] = "Masquer les valeurs Max"
L["session"] = "|rAppris cette session: "
L["noskill"] = "|cFFFF2e2eVouz n'avez pas encore appris cette profession.|r\r\rAllez à l'instructeur le plus proche pour l'apprendre.\rSi vous en avez besoin, vous pouvez oublier toute\rprofession primaire."
L["nosecskill"] = "|cFFFF2e2eVouz n'avez pas encore appris cette profession.|r\r\rAllez à l'instructeur le plus proche pour l'apprendre."
L["showbb"] = "Affiche la balance de la session dans la barre"
L["simpleb"] = "Bonus simpliflié"
L["craftsmanship"] = "\rCompétence: "
L["goodwith"] = "\r\r"..TitanUtils_GetHighlightText("[Combine avec]").."\r"
L["info"] = TitanUtils_GetHighlightText("[Information]")
L["maxskill"] = "|rVous avez atteint votre niveau maximum!"
L["warning"] = "\r\r|cFFFF2e2e[Attention!]|r\rVous avez atteint l'expertise\rmaximale et n'apprenez plus!\rVisiter un instructeur ou apprenez\rl'expertise locale." -- Not tested!
L["maxtext"] = "\r|rMaximum actuel (sans bonus): "
L["totalbag"] = "Total dans les sacs: "
L["totalbank"] = "Total en banque: "
L["reagents"] = "Composants"
L["noreagent"] = "Vous n'avez aucun de ces composants."
L["hide"] = "Masquer"
end
