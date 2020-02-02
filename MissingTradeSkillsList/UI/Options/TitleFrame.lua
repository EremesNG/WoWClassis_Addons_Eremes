------------------------------------------------------------------
-- Name: TitleFrame											    --
-- Description: The tile frame of the databasefame				--
-- Parent Frame: OptionsMenuFrame              					--
------------------------------------------------------------------

MTSLOPTUI_TITLE_FRAME = {
    FRAME_HEIGHT = 30,

    ---------------------------------------------------------------------------------------
    -- Initialises the titleframe
    ----------------------------------------------------------------------------------------
    Initialise = function (self, parent_frame)
        self.FRAME_WIDTH = MTSLUI_OPTIONS_MENU_FRAME.FRAME_WIDTH
        self.ui_frame = MTSLUI_TOOLS:CreateBaseFrame("Frame", "MTSLOPTUI_TitleFrame", parent_frame, nil, self.FRAME_WIDTH, self.FRAME_HEIGHT, false)
        -- just below config menu
        self.ui_frame:SetPoint("TOPLEFT", parent_frame, "TOPLEFT", 0, 0)
        -- Title text
        local title_text = MTSLUI_FONTS.COLORS.TEXT.TITLE ..MTSLUI_ADDON.NAME .. MTSLUI_FONTS.COLORS.TEXT.NORMAL .. " (by " .. MTSLUI_ADDON.AUTHOR .. ") " .. MTSLUI_FONTS.COLORS.TEXT.TITLE  .. "v" .. MTSLUI_ADDON.VERSION .. MTSLUI_FONTS.COLORS.TEXT.NORMAL .. " - " .. MTSLUI_LOCALES_LABELS["options"][MTSLUI_CURRENT_LANGUAGE]
        self.ui_frame.text = MTSLUI_TOOLS:CreateLabel(self.ui_frame, title_text, 0, 0, "LARGE", "CENTER")
    end
}