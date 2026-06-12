local CLEARCASTING = GetSpellInfo(16870)

local frame = CreateFrame("Frame", nil, UIParent)

frame:SetFrameStrata("FULLSCREEN_DIALOG")
frame:SetAllPoints(UIParent)
frame:Hide()

local tex = frame:CreateTexture(nil, "OVERLAY")
local w, h = frame:GetSize()

tex:SetPoint("CENTER")
tex:SetSize(w*1.3, h*1.3)

tex:SetTexture("Interface\\AddOns\\SteakFlashCC\\ClearCasting.tga")
tex:SetVertexColor(1, 1, 1)
tex:SetBlendMode("ADD")

local function OnUpdate(self, elapsed)
	self.timer = (self.timer or 0) + elapsed * 3.2
	local alpha = 0.20 + (math.sin(self.timer) * 0.30 + 0.30)

	tex:SetAlpha(alpha)
end

frame:SetScript("OnUpdate", OnUpdate)

local f = CreateFrame("Frame")

local function OnEvent(self, event, unit)
	if event == "UNIT_AURA" and unit ~= "player" then return end

	if UnitBuff("player", CLEARCASTING) then
		frame:Show()
	else
		frame:Hide()
	end
end

f:RegisterEvent("UNIT_AURA")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
