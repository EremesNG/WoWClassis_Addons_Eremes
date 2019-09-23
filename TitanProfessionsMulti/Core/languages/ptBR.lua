--[[
  Oi para você que é brasileiro e está vindo até aqui ler as traduções! HAHA! Se encontrar algum erro, me avise, tá bem?
  Esse aplicativo foi feito por um cara que não manja nada de programação... Brasileiro é foda, né? Quer se meter em tudo... Um marqueteiro querendo desenvolver addon, vê se pode!
  Mas enfim, aproveite minhas gambiarras, HAHA, foram feitas com amor para você.
	Tudo aqui neste arquivo foi traduzido por mim, Paulo Canettieri! (com ajuda do wowhead, ninguém é de ferro!)
--]]

local _, L = ...;
if GetLocale() == "ptBR" then
------ Professions pack
--- Profissions
L["alchemy"] = "Alquimia"
L["archaeology"] = "Arqueologia"
L["blacksmithing"] = "Ferraria"
L["cooking"] = "Culinária"
L["enchanting"] = "Encantamento"
L["engineering"] = "Engenharia"
L["firstAid"] = "Primeiros Socorros"
L["fishing"] = "Pesca"
L["herbalism"] = "Herborismo"
L["herbalismskills"] = "Perícias de Herborismo"
L["inscription"] = "Escrivania"
L["jewelcrafting"] = "Joalheria"
L["leatherworking"] = "Couraria"
L["mining"] = "Mineração"
L["miningskills"] = "Perícia em Mineração"
L["skinning"] = "Esfolamento"
L["skinningskills"] = "Habilidades em Esfolamento"
L["tailoring"] = "Alfaiataria"
L["smelting"] = "Fundição"
--- Master
L["masterPlayer"] = "|cFFFFFFFFExibindo todas profissões de ${player}|cFFFFFFFF.|r"
L["masterTutorialBar"] = "|cFF69FF69Passe o cursor aqui! :)|r"
L["masterTutorial"] = TitanUtils_GetHighlightText("\r[INTRODUÇÃO]").."\r\rEste plugin tem a função de resumir todas suas profissões\rem um único lugar. Diferentemente dos plugins avulsos,\reste exibirá TUDO nesta tooltip.\r\r"..TitanUtils_GetHighlightText("[COMO USAR]").."\r\rPara começar, clique com o botão direito no plugin e\rselecione a opção"..TitanUtils_GetHighlightText(" 'Esconder Tutorial'")..".\r\rVocê poderá coloca-lo no canto direito do Painel Titan\rpara ficar ainda mais agradável visualmente!"
L["hideTutorial"] = "Esconder Tutorial"
L["masterHint"] = "|cFFB4EEB4Dica:|r |cFFFFFFFFClique esquerdo abre a janela da profissão nº1\re com o botão do meio abre a janela da profissão nº2.|r\r\r"
L["primprof"] = "Mostrar Profissões Primárias"
L["bar"] = "Barra"

------ Reagents pack
--- Achaeology
L["ready"] = "|cFF69FF69Pronto!  "
L["archfragments"] = "Fragmentos de Arqueologia"
L["fragments"] = "Fragmentos"
L["fragtooltip"] = "|cFFB4EEB4Dica:|r |cFFFFFFFFClique com o botão direito no\rplugin e escolha quais fragmentos\rserão mostrados na barra.|r\r"
L["hidehint"] = "Esconder Dica"
L["displaynofrag"] = "Exibir Raças Sem Fragmentos"
L["inprog"] = "\rEm progresso:"
L["nofragments"] = "Sem fragmentos"
L["tooltip"] = "Texto de Ajuda"
L["noarchaeology"] = "|cFFFF2e2eVocê ainda não aprendeu arqueologia\rou não tem fragmentos.|r\r\rVá ao treinador mais próximo para aprender\rou visite um campo de escavação."

--- Enchanting (Legião)
L["arkhana"] = "|cFFFFFFFFArkhana|r"
L["leylight"] = "|cff0070ddEstilhaço de Luz Meridiana|r"
L["chaosCrystal"] = "|cffa335eeCristal do Caos|r"
--- Enchanting (BfA)
L["gdust"] = "|cFFFFFFFFPó Tenebroso|r"
L["umbrashard"] = "|cff0070ddEstilhaço da Umbra|r"
L["veiledcrystal"] = "|cffa335eeCristal Velado|r"

--- Fishing (Legião)
L["mackerel"] = "|cFFFFFFFFCavala Prateada|r"
L["queenfish"] = "|cFFFFFFFFPeixe-rainha Amaldiçoado|r"
L["salmon"] = "|cFFFFFFFFSalmão Altamontês|r"
L["mossgill"] = "|cFFFFFFFFNinho de Pinalimo|r"
L["stormray"] = "|cFFFFFFFFTrovarraia|r"
L["koi"] = "|cFFFFFFFFCarpa escama rúnica|r"
L["barracuda"] = "|cFFFFFFFFBarracuda Negra|r"
--- Fishing (BfA)
L["gscatfish"] = "|cFFFFFFFFBagre do Grande Oceano|r"
L["redtaill"] = "|cFFFFFFFFBótia Caudarrubra|r"
L["smackerel"] = "|cFFFFFFFFCavala Viscosa|r"
L["sshifter"] = "|cFFFFFFFFCisca-areia|r"
L["tperch"] = "|cFFFFFFFFPerca de Tiragarde|r"
L["lsnapper"] = "|cFFFFFFFFCioba|r"
L["ffangtooth"] = "|cFFFFFFFFPresadente Frenético|r"
L["msalmon"] = "|cff1eff00Salmão da Meia-noite|r"

--- Herbalism (Legião)
L["yseralline"] = "|cFFFFFFFFSemente de Yseralina|r"
L["felwort"] = "|cff1eff00Maltevil|r"
L["starlight"] = "|cFFFFFFFFRosa-da-luz-estelar|r"
L["fjarn"] = "|cFFFFFFFFFjarnskaggl|r"
L["foxflower"] = "|cFFFFFFFFFlor-de-raposa|r"
L["dreamleaf"] = "|cFFFFFFFFFolha-de-sonho|r"
L["aethril"] = "|cFFFFFFFFAethril|r"
--- Herbalism (BfA) -- AINDA NÃO FIZ...
L["riverbud"] = "|cFFFFFFFFRiverbud|r"
L["seastalk"] = "|cff1eff00Sea Stalk|r"
L["starmoss"] = "|cFFFFFFFFStar Moss|r"
L["akunda"] = "|cFFFFFFFFAkunda's Bite|r"
L["wkiss"] = "|cFFFFFFFFWinter's Kiss|r"
L["spollen"] = "|cFFFFFFFFSiren's Pollen|r"
L["aweed"] = "|cFFFFFFFFAnchor Weed|r"

--- Mining (Legião)
L["leystone"] = "|cFFFFFFFFMinério de Pedra de Meridiano|r"
L["felslate"] = "|cFFFFFFFFVilardósia|r"
L["brimstone"] = "|cff1eff00Enxofre Infernal|r"
L["blood"] = "|cff0070ddSangue de Sargeras|r"
--- Mining (BfA)
L["monelite"] = "|cFFFFFFFFMinério de Monelita|r"
L["stormSilver"] = "|cFFFFFFFFMinério de Prata Procelosa|r"
L["platinumOre"] = "|cff1eff00Minério de Platina|r"

--- Skinning (Legião)
L["stormscale"] = "|cFFFFFFFFEscamarraio|r"
L["stonehide"] = "|cFFFFFFFFCouro Pétreo|r"
L["felhide"] = "|cff1eff00Couro Vil|r"
L["tooth"] = "|cFFFFFFFFDente Inteiro|r"
L["claw"] = "|cFFFFFFFFGarra Inteira|r"
--- Skinning (BfA)  -- AINDA NÃO FIZ...
L["coarsel"] = "|cFFFFFFFFCoarse Leather|r"
L["tempesth"] = "|cff1eff00Tempest Hide|r"
L["shimmerscale"] = "|cFFFFFFFFShimmerscale|r"
L["mistscale"] = "|cff1eff00Mistscale|r"
L["bloodstained"] = "|cFFFFFFFFBlood-Stained Bone|r"
L["cbone"] = "|cff1eff00Calcified Bone|r"

--- Tailoring (Legião)
L["shaldorei"] = "|cFFFFFFFFSeda Shal'dorei|r"
L["silkweave"] = "|cFFFFFFFFTramasseda Imbuída|r"
--- Tailoring (BfA)
L["tidespray"] = "|cFFFFFFFFLinho Borrifado pela Maré|r"
L["nylonthread"] = "|cFFFFFFFFFio de Nylon|r"
L["deepseasatin"] = "|cff1eff00Seda do Mar Profundo|r"
L["embroideredsatin"] = "|cff0070ddSeda do Mar Profundo Bordada|r"

------ Shared with one or more
--- Shared
L["hint"] = "|cFFB4EEB4Dica:|r |cFFFFFFFFClique para abrir a janela da\rprofissão.|r\r\r"
L["maximum"] = "Máx"
L["noprof"] = "Não aprendido"
L["bonus"] = "(Bônus)"
L["hidemax"] = "Esconder Valores Máximos"
L["session"] = "|rAprendido na sessão: "
L["noskill"] = "|cFFFF2e2eVocê não aprendeu esta profissão ainda.|r\r\rVá ao treinador mais próximo para aprende-la.\rSe precisar, poderá esquecer qualquer profissão primária."
L["nosecskill"] = "|cFFFF2e2eVocê não aprendeu esta profissão ainda.|r\r\rVá ao treinador mais próximo para aprende-la."
L["showbb"] = "Exibir Saldo da Sessão na Barra"
L["simpleb"] = "Bônus Simplificado"
L["craftsmanship"] = "\rPerícia: "
L["goodwith"] = "\r\r"..TitanUtils_GetHighlightText("[Combina com]").."\r"
L["info"] = TitanUtils_GetHighlightText("[Informações]")
L["maxskill"] = "|rVocê chegou ao potencial máximo!"
L["warning"] = "\r\r|cFFFF2e2e[Atenção!]|r\rVocê chegou ao máximo de perícia e\rnão está aprendendo mais! Vá a um\rtreinador ou aprenda a perícia local."
L["maxtext"] = "\r|rMáximo atual (sem bônus): "
L["totalbag"] = "Total na Bolsa: "
L["totalbank"] = "Total no Banco: "
L["reagents"] = "Reagentes"
L["rLegion"] = "Reagentes - Legion"
L["rBfA"] = "Reagentes - BfA"
L["noreagent"] = "Você ainda não obteve\rnenhum destes reagentes."
L["hide"] = "Esconder"
end
