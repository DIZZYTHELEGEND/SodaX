local function OpenCommandList(player)
    local playerGui = player:WaitForChild("PlayerGui")
    
    local existingUI = playerGui:FindFirstChild("CommandListUI")
    if existingUI then
        existingUI:Destroy()
    end
    
    local commandListUI = Instance.new("ScreenGui")
    commandListUI.Name = "CommandListUI"
    commandListUI.Parent = playerGui
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.6, 0, 0.6, 0)
    frame.Position = UDim2.new(0.2, 0, 0.2, 0)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BackgroundTransparency = 0.1
    frame.Parent = commandListUI
    
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, 0, 0.8, 0)
    scrollFrame.Position = UDim2.new(0, 0, 0.15, 0) 
    scrollFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    scrollFrame.BackgroundTransparency = .4
    scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 8
    scrollFrame.Parent = frame
    
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -30, 0, 0)
    closeButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    closeButton.TextColor3 = Color3.new(1, 1, 1)
    closeButton.Text = "X"
    closeButton.Font = Enum.Font.SourceSansBold
    closeButton.TextSize = 18
    closeButton.Parent = frame
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0.1, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 0.5
    title.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Text = "∞ Empathy.lua ∞"
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 24
    title.Parent = frame
    
    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, 0, 0.05, 0)
    subtitle.Position = UDim2.new(0, 0, 0.1, 0)
    subtitle.BackgroundTransparency = 1
    subtitle.TextColor3 = Color3.new(1, 1, 1)
    subtitle.Text = "Command List"
    subtitle.Font = Enum.Font.SourceSansItalic
    subtitle.TextSize = 18
    subtitle.Parent = frame
    
    local commands = {
        {name = "-warn [plr]", description = "Warn the player for breaking a rule. 3 warns will blacklist them."},
        {name = "-bl/-unbl [plr]", description = "Blacklists or unblacklists a player from the game."},
        {name = "-pmlag/-nopmlag [plr]", description = "Lags or stops lagging the player, preventing them from viewing chat."},
        {name = "-house", description = "Teleports you to the house."},
        {name = "-spawn", description = "Teleports you to the spawn."},
        {name = "-rj/-rej/-rejoin", description = "Rejoins the server."},
        {name = "-hop/-shop/-serverhop", description = "ServerHops to a new server."},
        {name = "-hideobby", description = "Flips the baseplate and lowers the walls."},
        {name = "-railcannon", description = "Loads a a fucking huge rail cannon."},
        {name = "-fixc/-fixcam", description = "Fixes your camera if someone breaks it."},
        {name = "-audiolog", description = "Logs the music audio and saves it to file in workspace. [KahLogged.txt]"},
        {name = "-errorcrash", description = "A silent crash that looks like an error."},
        {name = "-viruscrash", description = "Plays you are and idiot hah ha ha and crashes."},
        {name = "-fixp/-fixpaint/-fixcolor/-fixcolors", description = "Fixes the map colors."},
        {name = "-whats [math]", description = "Answers a math question. [+, -, *, /] (may tag)"},
        {name = "-morecommands soon", description = "a description?"},
    }
    
    local yOffset = 0.03
    for _, command in pairs(commands) do
        local commandLabel = Instance.new("TextLabel")
        commandLabel.Size = UDim2.new(1, 0, 0, 30)
        commandLabel.Position = UDim2.new(0, 0, yOffset, 0)
        commandLabel.BackgroundTransparency = 1
        commandLabel.BackgroundColor3 = Color3.new(0, 0, 0)
        commandLabel.TextColor3 = Color3.new(1, 1, 1)
        commandLabel.TextTransparency = 0
        commandLabel.Text = command.name .. ": " .. command.description
        commandLabel.Font = Enum.Font.SourceSans
        commandLabel.TextSize = 18
        commandLabel.Parent = scrollFrame
        
        yOffset = yOffset + 0.035
    end
    
    closeButton.MouseButton1Click:Connect(function()
        commandListUI:Destroy()
    end)
end

local player = game.Players.LocalPlayer
OpenCommandList(player)
