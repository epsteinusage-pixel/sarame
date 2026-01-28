local user_input_service = game:GetService("UserInputService")
local tween_service = game:GetService("TweenService")
local players = game:GetService("Players")

local library = {}

function library:create()
    local screen_gui = Instance.new("ScreenGui")
    screen_gui.Name = "anarchy_gui"
    screen_gui.ResetOnSpawn = false
    screen_gui.Parent = game:GetService("CoreGui")

    local function create_sandwich(name, size, pos, parent)
        local black_ext_frame = Instance.new("Frame")
        black_ext_frame.Name = name .. "_black_ext"
        black_ext_frame.Size = size
        black_ext_frame.Position = pos
        black_ext_frame.BackgroundTransparency = 1
        black_ext_frame.Parent = parent
    
        local black_ext_stroke = Instance.new("UIStroke")
        black_ext_stroke.Thickness = 2.5
        black_ext_stroke.Color = Color3.fromRGB(0, 0, 0)
        black_ext_stroke.Parent = black_ext_frame
    
        local corner_ext = Instance.new("UICorner")
        corner_ext.CornerRadius = UDim.new(0, 6)
        corner_ext.Parent = black_ext_frame
    
        local accent_frame = Instance.new("Frame")
        accent_frame.Name = name .. "_accent"
        accent_frame.Size = UDim2.new(1, 0, 1, 0)
        accent_frame.BackgroundTransparency = 1
        accent_frame.Parent = black_ext_frame
    
        local accent_stroke = Instance.new("UIStroke")
        accent_stroke.Thickness = 2
        accent_stroke.Color = Color3.fromRGB(106, 152, 242)
        accent_stroke.Parent = accent_frame
    
        local corner_acc = Instance.new("UICorner")
        corner_acc.CornerRadius = UDim.new(0, 6)
        corner_acc.Parent = accent_frame
    
        local main_content = Instance.new("Frame")
        main_content.Name = name .. "_main"
        main_content.Size = UDim2.new(1, 0, 1, 0)
        main_content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        main_content.BorderSizePixel = 0
        main_content.Parent = accent_frame
    
        local black_int_stroke = Instance.new("UIStroke")
        black_int_stroke.Thickness = 1
        black_int_stroke.Color = Color3.fromRGB(0, 0, 0)
        black_int_stroke.Parent = main_content
    
        local corner_main = Instance.new("UICorner")
        corner_main.CornerRadius = UDim.new(0, 6)
        corner_main.Parent = main_content
    
        return black_ext_frame, main_content
    end
    
    local toggle_outer, toggle_inner = create_sandwich("toggle", UDim2.new(0, 100, 0, 50), UDim2.new(0.1, 0, 0.5, -25), screen_gui)
    toggle_inner.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

    local main_outer, main_inner = create_sandwich("main", UDim2.new(0, 600, 0, 400), UDim2.new(0.5, 0, 0.5, 0), screen_gui)
    main_outer.AnchorPoint = Vector2.new(0.5, 0.5)
    main_inner.ClipsDescendants = true
    
    local ui_gradient = Instance.new("UIGradient")
    ui_gradient.Rotation = 90
    ui_gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 45)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 35))
    })
    ui_gradient.Parent = main_inner
    
    local toggle_btn = Instance.new("TextButton")
    toggle_btn.Size = UDim2.new(1, 0, 1, 0)
    toggle_btn.BackgroundTransparency = 1
    toggle_btn.RichText = true
    toggle_btn.Text = 'Anarchy'
    toggle_btn.TextSize = 22
    toggle_btn.Font = Enum.Font.Roboto
    toggle_btn.TextColor3 = Color3.fromRGB(106, 152, 242)
    toggle_btn.Parent = toggle_inner

    toggle_btn.MouseButton1Click:Connect(function()
        gui_visible = not gui_visible
        main_outer.Visible = gui_visible
    end)
    
    local btn_stroke = Instance.new("UIStroke")
    btn_stroke.Thickness = 1.5
    btn_stroke.Color = Color3.fromRGB(0, 0, 0)
    btn_stroke.Parent = toggle_btn
    
    local anarchy_label = Instance.new("TextLabel")
    local text_stroke = Instance.new("UIStroke")
    anarchy_label.Parent = main_inner
    anarchy_label.BackgroundTransparency = 1
    anarchy_label.Position = UDim2.new(0, 10, 0, 5)
    anarchy_label.Size = UDim2.new(0, 250, 0, 25)
    anarchy_label.RichText = true
    anarchy_label.Text = 'Anarchy Hub'
    anarchy_label.TextSize = 20
    anarchy_label.Font = Enum.Font.Roboto
    anarchy_label.TextColor3 = Color3.fromRGB(106, 152, 242)
    anarchy_label.TextXAlignment = Enum.TextXAlignment.Left
    text_stroke.Thickness = 1.5
    text_stroke.Color = Color3.fromRGB(0, 0, 0)
    text_stroke.Parent = anarchy_label

    local close_btn = Instance.new("TextButton")
    local close_stroke = Instance.new("UIStroke")
    close_btn.Parent = main_inner
    close_btn.BackgroundTransparency = 1
    close_btn.Position = UDim2.new(1, -30, 0, 5)
    close_btn.Size = UDim2.new(0, 25, 0, 25)
    close_btn.Font = Enum.Font.Roboto
    close_btn.Text = "X"
    close_btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    close_btn.TextSize = 18
    close_stroke.Thickness = 1.2
    close_stroke.Color = Color3.fromRGB(0, 0, 0)
    close_stroke.Parent = close_btn

    local mini_btn = Instance.new("TextButton")
    local mini_stroke = Instance.new("UIStroke")
    mini_btn.Parent = main_inner
    mini_btn.BackgroundTransparency = 1
    mini_btn.Position = UDim2.new(1, -60, 0, 5)
    mini_btn.Size = UDim2.new(0, 25, 0, 25)
    mini_btn.Font = Enum.Font.Roboto
    mini_btn.Text = "-"
    mini_btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    mini_btn.TextSize = 24
    mini_stroke.Thickness = 1.2
    mini_stroke.Color = Color3.fromRGB(0, 0, 0)
    mini_stroke.Parent = mini_btn

    local container_holder = Instance.new("Frame")
    container_holder.Parent = main_inner
    container_holder.BackgroundTransparency = 1
    container_holder.Position = UDim2.new(0, 0, 0, 35)
    container_holder.Size = UDim2.new(1, 0, 1, -35)

    local horizontal_separator = Instance.new("Frame")
    horizontal_separator.Parent = main_inner
    horizontal_separator.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    horizontal_separator.BorderSizePixel = 0
    horizontal_separator.Position = UDim2.new(0, 10, 0, 35)
    horizontal_separator.Size = UDim2.new(1, -20, 0, 1)

    local tab_container = Instance.new("Frame")
    tab_container.Parent = container_holder
    tab_container.BackgroundTransparency = 1
    tab_container.Position = UDim2.new(0, 10, 0, 10)
    tab_container.Size = UDim2.new(0, 140, 1, -20)

    local tab_layout = Instance.new("UIListLayout")
    tab_layout.Parent = tab_container
    tab_layout.SortOrder = Enum.SortOrder.LayoutOrder
    tab_layout.Padding = UDim.new(0, 5)

    local vertical_separator = Instance.new("Frame")
    vertical_separator.Parent = container_holder
    vertical_separator.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    vertical_separator.BorderSizePixel = 0
    vertical_separator.Position = UDim2.new(0, 160, 0, 10)
    vertical_separator.Size = UDim2.new(0, 1, 1, -20)

    local content_container = Instance.new("Frame")
    content_container.Parent = container_holder
    content_container.BackgroundTransparency = 1
    content_container.Position = UDim2.new(0, 170, 0, 10)
    content_container.Size = UDim2.new(1, -180, 1, -20)

    local window = {}
    window.tabs = {}

    function window:create_tab(name)
        local tab_button = Instance.new("TextButton")
        local tab_text_stroke = Instance.new("UIStroke")
        local page = Instance.new("ScrollingFrame")

        tab_button.Parent = tab_container
        tab_button.BackgroundTransparency = 1
        tab_button.Size = UDim2.new(1, 0, 0, 30)
        tab_button.Font = Enum.Font.Roboto
        tab_button.Text = name
        tab_button.TextColor3 = Color3.fromRGB(150, 150, 150)
        tab_button.TextSize = 16
        tab_button.TextXAlignment = Enum.TextXAlignment.Left
        tab_text_stroke.Thickness = 1.2
        tab_text_stroke.Color = Color3.fromRGB(0, 0, 0)
        tab_text_stroke.Parent = tab_button

        page.Parent = content_container
        page.Size = UDim2.new(1, 0, 1, 0)
        page.BackgroundTransparency = 1
        page.Visible = false
        page.ScrollBarThickness = 1
        page.BorderSizePixel = 0
        page.CanvasSize = UDim2.new(0, 0, 2, 0)

        tab_button.MouseButton1Click:Connect(function()
            for _, btn in pairs(tab_container:GetChildren()) do
                if btn:IsA("TextButton") then
                    tween_service:Create(btn, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
                end
            end
            for _, p in pairs(content_container:GetChildren()) do
                if p:IsA("ScrollingFrame") then
                    p.Visible = false
                end
            end
            page.Visible = true
            tween_service:Create(tab_button, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(106, 152, 242)}):Play()
        end)

        local tab = {}
        tab.page = page

        function tab:add_toggle(name, has_bind, callback)
            local layout = page:FindFirstChild("UIListLayout") or Instance.new("UIListLayout", page)
layout.Padding = UDim.new(0, 8)
            layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            layout.VerticalAlignment = Enum.VerticalAlignment.Top

            local container_padding = page:FindFirstChild("UIPadding") or Instance.new("UIPadding", page)
            container_padding.PaddingTop = UDim.new(0, 15)

            local toggle_container = Instance.new("Frame")
            toggle_container.Name = name .. "_Toggle"
            toggle_container.Size = UDim2.new(1, -15, 0, 38)
            toggle_container.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            toggle_container.BorderSizePixel = 0
            toggle_container.Parent = page

            local container_corner = Instance.new("UICorner")
            container_corner.CornerRadius = UDim.new(0, 6)
            container_corner.Parent = toggle_container

            local container_black_stroke = Instance.new("UIStroke")
            container_black_stroke.Thickness = 0.5
            container_black_stroke.Color = Color3.fromRGB(120, 120, 120)
            container_black_stroke.Parent = toggle_container

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, -110, 1, 0)
            label.Position = UDim2.new(0, 12, 0, 0)
            label.BackgroundTransparency = 1
            label.Text = name
            label.TextColor3 = Color3.fromRGB(220, 220, 220)
            label.TextSize = 14
            label.Font = Enum.Font.Roboto
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Parent = toggle_container

            local label_stroke = Instance.new("UIStroke")
            label_stroke.Thickness = 1.5
            label_stroke.Color = Color3.fromRGB(0, 0, 0)
            label_stroke.Parent = label

            local current_bind = nil
            local binding = false

            if has_bind then
                local keybind_btn = Instance.new("TextButton")
                keybind_btn.Size = UDim2.new(0, 50, 0, 22)
                keybind_btn.Position = UDim2.new(1, -105, 0.5, -11)
                keybind_btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                keybind_btn.Text = "None"
                keybind_btn.TextColor3 = Color3.fromRGB(180, 180, 180)
                keybind_btn.TextSize = 12
                keybind_btn.Font = Enum.Font.Roboto
                keybind_btn.Parent = toggle_container

                local bind_corner = Instance.new("UICorner")
                bind_corner.CornerRadius = UDim.new(0, 4)
                bind_corner.Parent = keybind_btn

                local bind_stroke = Instance.new("UIStroke")
                bind_stroke.Thickness = 0.5
                bind_stroke.Color = Color3.fromRGB(0, 0, 0)
                bind_stroke.Parent = keybind_btn

                keybind_btn.MouseButton1Click:Connect(function()
                    binding = true
                    keybind_btn.Text = "..."
                    keybind_btn.TextColor3 = Color3.fromRGB(106, 152, 242)
                end)

                user_input_service.InputBegan:Connect(function(input)
                    if binding and input.UserInputType == Enum.UserInputType.Keyboard then
                        if input.KeyCode == Enum.KeyCode.Escape then
                            current_bind = nil
                            keybind_btn.Text = "None"
                        else
                            current_bind = input.KeyCode
                            keybind_btn.Text = input.KeyCode.Name
                        end
                        keybind_btn.TextColor3 = Color3.fromRGB(180, 180, 180)
                        binding = false
                    end
                end)
            end

            local switch_bg = Instance.new("TextButton")
            switch_bg.Size = UDim2.new(0, 38, 0, 20)
            switch_bg.Position = UDim2.new(1, -48, 0.5, -10)
            switch_bg.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            switch_bg.Text = ""
            switch_bg.AutoButtonColor = false
            switch_bg.Parent = toggle_container

            local bg_corner = Instance.new("UICorner")
            bg_corner.CornerRadius = UDim.new(1, 0)
            bg_corner.Parent = switch_bg

            local bg_accent_stroke = Instance.new("UIStroke")
            bg_accent_stroke.Thickness = 1.1
            bg_accent_stroke.Color = Color3.fromRGB(100, 100, 100)
            bg_accent_stroke.Parent = switch_bg

            local knob = Instance.new("Frame")
            knob.Size = UDim2.new(0, 12, 0, 12)
            knob.Position = UDim2.new(0, 4, 0.5, -6)
            knob.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
            knob.Parent = switch_bg

            local knob_corner = Instance.new("UICorner")
            knob_corner.CornerRadius = UDim.new(1, 0)
            knob_corner.Parent = knob

            local knob_stroke = Instance.new("UIStroke")
            knob_stroke.Thickness = 1.5
            knob_stroke.Color = Color3.fromRGB(0, 0, 0)
            knob_stroke.Parent = knob

            local enabled = false

            local function toggle()
                enabled = not enabled
                local knob_pos = enabled and UDim2.new(1, -16, 0.5, -6) or UDim2.new(0, 4, 0.5, -6)
                local target_accent = enabled and Color3.fromRGB(106, 152, 242) or Color3.fromRGB(100, 100, 100)
                local target_text = enabled and Color3.fromRGB(106, 152, 242) or Color3.fromRGB(220, 220, 220)
                local target_bg = enabled and Color3.fromRGB(106, 152, 242) or Color3.fromRGB(55, 55, 55)
                local target_knob = enabled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 200)

                tween_service:Create(knob, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Position = knob_pos, BackgroundColor3 = target_knob}):Play()
                tween_service:Create(switch_bg, TweenInfo.new(0.2), {BackgroundColor3 = target_bg}):Play()
                tween_service:Create(bg_accent_stroke, TweenInfo.new(0.2), {Color = target_accent}):Play()
                tween_service:Create(label, TweenInfo.new(0.2), {TextColor3 = target_text}):Play()

                callback(enabled)
            end

            switch_bg.MouseButton1Click:Connect(toggle)

            user_input_service.InputBegan:Connect(function(input)
                if has_bind and not binding and current_bind and input.KeyCode == current_bind and not user_input_service:GetFocusedTextBox() then
                    toggle()
                end
            end)
        end

        function tab:add_slider(name, min, max, default, callback)
            local layout = page:FindFirstChild("UIListLayout") or Instance.new("UIListLayout", page)
            layout.Padding = UDim.new(0, 8)
            layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            layout.VerticalAlignment = Enum.VerticalAlignment.Top

            local container_padding = page:FindFirstChild("UIPadding") or Instance.new("UIPadding", page)
            container_padding.PaddingTop = UDim.new(0, 15)

            local slider_container = Instance.new("Frame")
            slider_container.Name = name .. "_Slider"
            slider_container.Size = UDim2.new(1, -15, 0, 42)
            slider_container.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            slider_container.BorderSizePixel = 0
            slider_container.Parent = page

            local container_corner = Instance.new("UICorner")
            container_corner.CornerRadius = UDim.new(0, 6)
            container_corner.Parent = slider_container

            local container_stroke = Instance.new("UIStroke")
            container_stroke.Thickness = 0.5
            container_stroke.Color = Color3.fromRGB(120, 120, 120)
            container_stroke.Parent = slider_container

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, -70, 0, 20)
            label.Position = UDim2.new(0, 12, 0, 2)
            label.BackgroundTransparency = 1
            label.Text = name
            label.TextColor3 = Color3.fromRGB(220, 220, 220)
            label.TextSize = 14
            label.Font = Enum.Font.Roboto
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Parent = slider_container

            local label_stroke = Instance.new("UIStroke")
            label_stroke.Thickness = 1.5
            label_stroke.Color = Color3.fromRGB(0, 0, 0)
            label_stroke.Parent = label

            local value_label = Instance.new("TextLabel")
            value_label.Size = UDim2.new(0, 40, 0, 20)
            value_label.Position = UDim2.new(1, -52, 0, 2)
            value_label.BackgroundTransparency = 1
            value_label.Text = tostring(default)
            value_label.TextColor3 = Color3.fromRGB(200, 200, 200)
            value_label.TextSize = 14
            value_label.Font = Enum.Font.Roboto
            value_label.TextXAlignment = Enum.TextXAlignment.Right
            value_label.Parent = slider_container

            local val_stroke = Instance.new("UIStroke")
            val_stroke.Thickness = 1.5
            val_stroke.Color = Color3.fromRGB(0, 0, 0)
            val_stroke.Parent = value_label

            local slider_bg = Instance.new("Frame")
            slider_bg.Size = UDim2.new(1, -24, 0, 4)
            slider_bg.Position = UDim2.new(0, 12, 0, 28)
            slider_bg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            slider_bg.BorderSizePixel = 0
            slider_bg.Parent = slider_container

            Instance.new("UICorner", slider_bg).CornerRadius = UDim.new(1, 0)

            local slider_fill = Instance.new("Frame")
            slider_fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
            slider_fill.BackgroundColor3 = Color3.fromRGB(106, 152, 242)
            slider_fill.BorderSizePixel = 0
            slider_fill.Parent = slider_bg

            Instance.new("UICorner", slider_fill).CornerRadius = UDim.new(1, 0)

            local knob = Instance.new("TextButton")
            knob.Size = UDim2.new(0, 10, 0, 10)
            knob.Position = UDim2.new((default - min) / (max - min), -5, 0.5, -5)
            knob.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
            knob.Text = ""
            knob.AutoButtonColor = false
            knob.Parent = slider_bg

            Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

            local knob_stroke = Instance.new("UIStroke")
            knob_stroke.Thickness = 1.8
            knob_stroke.Color = Color3.fromRGB(0, 0, 0)
            knob_stroke.Parent = knob

            local dragging = false

            local function move()
                local input_pos = user_input_service:GetMouseLocation().X
                local bar_pos = slider_bg.AbsolutePosition.X
                local bar_width = slider_bg.AbsoluteSize.X
                local percent = math.clamp((input_pos - bar_pos) / bar_width, 0, 1)
                local value = math.floor(min + (max - min) * percent)

                value_label.Text = tostring(value)
                knob.Position = UDim2.new(percent, -5, 0.5, -5)
                slider_fill.Size = UDim2.new(percent, 0, 1, 0)

                callback(value)
            end

            knob.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                    tween_service:Create(value_label, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(106, 152, 242)}):Play()
                    tween_service:Create(label, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(106, 152, 242)}):Play()
                end
            end)

            user_input_service.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                    tween_service:Create(value_label, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
                    tween_service:Create(label, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(220, 220, 220)}):Play()
                end
            end)

            user_input_service.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    move()
                end
            end)
        end

        function tab:add_dropdown(name, options, is_multi, callback)
            local dropdown_container = Instance.new("Frame")
            dropdown_container.Name = name .. "_Dropdown"
            dropdown_container.Size = UDim2.new(1, -15, 0, 38)
            dropdown_container.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            dropdown_container.ClipsDescendants = true

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 6)
            corner.Parent = dropdown_container

            local stroke = Instance.new("UIStroke")
            stroke.Thickness = 0.5
            stroke.Color = Color3.fromRGB(120, 120, 120)
            stroke.Parent = dropdown_container

            local trigger = Instance.new("TextButton")
            trigger.Size = UDim2.new(1, 0, 0, 38)
            trigger.BackgroundTransparency = 1
            trigger.Text = ""
            trigger.Parent = dropdown_container

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, -40, 0, 38)
            label.Position = UDim2.new(0, 12, 0, 0)
            label.BackgroundTransparency = 1
            label.Text = name .. ": None"
            label.TextColor3 = Color3.fromRGB(220, 220, 220)
            label.TextSize = 14
            label.Font = Enum.Font.Roboto
            label.RichText = true
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Parent = dropdown_container

            local label_stroke = Instance.new("UIStroke")
            label_stroke.Thickness = 1.5
            label_stroke.Color = Color3.fromRGB(0, 0, 0)
            label_stroke.Parent = label

            local arrow = Instance.new("TextLabel")
            arrow.Size = UDim2.new(0, 38, 0, 38)
            arrow.Position = UDim2.new(1, -38, 0, 0)
            arrow.BackgroundTransparency = 1
            arrow.Text = "▼"
            arrow.TextColor3 = Color3.fromRGB(150, 150, 150)
            arrow.TextSize = 12
            arrow.Parent = dropdown_container

            local arrow_stroke = Instance.new("UIStroke")
            arrow_stroke.Thickness = 1.2
            arrow_stroke.Color = Color3.fromRGB(0, 0, 0)
            arrow_stroke.Parent = arrow

            local option_holder = Instance.new("ScrollingFrame")
            option_holder.Position = UDim2.new(0, 5, 0, 38)
            option_holder.Size = UDim2.new(1, -10, 1, -43)
            option_holder.BackgroundTransparency = 1
            option_holder.ScrollBarThickness = 2
            option_holder.ScrollBarImageColor3 = Color3.fromRGB(106, 152, 242)
            option_holder.BorderSizePixel = 0
            option_holder.CanvasSize = UDim2.new(0, 0, 0, 0)
            option_holder.AutomaticCanvasSize = Enum.AutomaticSize.Y
            option_holder.Parent = dropdown_container

            local layout = Instance.new("UIListLayout")
            layout.Padding = UDim.new(0, 3)
            layout.Parent = option_holder

            local expanded = false
            local selected_options = {}

            trigger.MouseButton1Click:Connect(function()
                expanded = not expanded
                local target_size = expanded and UDim2.new(1, -15, 0, 135) or UDim2.new(1, -15, 0, 38)
                tween_service:Create(dropdown_container, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Size = target_size}):Play()
                if not expanded then
                    option_holder.CanvasPosition = Vector2.new(0, 0)
                end
                arrow.Text = expanded and "▲" or "▼"
            end)

            for _, option in ipairs(options) do
                local opt_btn = Instance.new("TextButton")
                opt_btn.Size = UDim2.new(1, 0, 0, 25)
                opt_btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                opt_btn.Font = Enum.Font.Roboto
                opt_btn.Text = option
                opt_btn.TextColor3 = Color3.fromRGB(180, 180, 180)
                opt_btn.TextSize = 13
                opt_btn.Parent = option_holder

                local btn_corner = Instance.new("UICorner")
                btn_corner.CornerRadius = UDim.new(0, 4)
                btn_corner.Parent = opt_btn

                local opt_stroke = Instance.new("UIStroke")
                opt_stroke.Thickness = 1
                opt_stroke.Color = Color3.fromRGB(0, 0, 0)
                opt_stroke.Parent = opt_btn

                opt_btn.MouseButton1Click:Connect(function()
                    if is_multi then
                        if table.find(selected_options, option) then
                            table.remove(selected_options, table.find(selected_options, option))
                            opt_btn.TextColor3 = Color3.fromRGB(180, 180, 180)
                        else
                            table.insert(selected_options, option)
                            opt_btn.TextColor3 = Color3.fromRGB(106, 152, 242)
                        end
                        local display_text = #selected_options > 0 and table.concat(selected_options, ", ") or "None"
                        label.Text = name .. ": " .. display_text .. ""
                        callback(selected_options)
                    else
                        label.Text = name .. ": " .. option .. ""
                        expanded = false
                        tween_service:Create(dropdown_container, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Size = UDim2.new(1, -15, 0, 38)}):Play()
                        option_holder.CanvasPosition = Vector2.new(0, 0)
                        arrow.Text = "▼"
                        callback(option)
                    end
                end)
            end

            dropdown_container.Parent = page
        end

        function tab:add_color_picker(name, default_color, callback)
            local picker_container = Instance.new("Frame")
            picker_container.Name = name .. "_color_picker"
            picker_container.Size = UDim2.new(1, -15, 0, 38)
            picker_container.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            picker_container.ClipsDescendants = true
            picker_container.Parent = page

            Instance.new("UICorner", picker_container).CornerRadius = UDim.new(0, 6)

            local container_stroke = Instance.new("UIStroke", picker_container)
            container_stroke.Thickness = 0.5
            container_stroke.Color = Color3.fromRGB(120, 120, 120)

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, -80, 0, 38)
            label.Position = UDim2.new(0, 12, 0, 0)
            label.BackgroundTransparency = 1
            label.Text = name
            label.TextColor3 = Color3.fromRGB(220, 220, 220)
            label.TextSize = 14
            label.Font = Enum.Font.Roboto
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Parent = picker_container

            local label_stroke = Instance.new("UIStroke", label)
            label_stroke.Thickness = 1.5
            label_stroke.Color = Color3.fromRGB(0, 0, 0)

            local color_display = Instance.new("TextButton")
            color_display.Size = UDim2.new(0, 40, 0, 20)
            color_display.Position = UDim2.new(1, -52, 0, 9)
            color_display.BackgroundColor3 = default_color
            color_display.Text = ""
            color_display.Parent = picker_container

            Instance.new("UICorner", color_display).CornerRadius = UDim.new(0, 4)

            local display_stroke = Instance.new("UIStroke", color_display)
            display_stroke.Thickness = 1.5
            display_stroke.Color = Color3.fromRGB(0, 0, 0)

            local controls = Instance.new("Frame")
            controls.Position = UDim2.new(0, 10, 0, 42)
            controls.Size = UDim2.new(1, -20, 0, 110)
            controls.BackgroundTransparency = 1
            controls.Parent = picker_container

            local current_h, current_s, current_v, current_t = 0, 1, 1, 0

            local function create_bar(b_name, pos, grad_colors)
                local bar = Instance.new("TextButton")
                bar.Name = b_name
                bar.Size = UDim2.new(1, 0, 0, 10)
                bar.Position = pos
                bar.AutoButtonColor = false
                bar.Text = ""
                bar.Parent = controls

                Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 4)

                local s_stroke = Instance.new("UIStroke", bar)
                s_stroke.Thickness = 1.5
                s_stroke.Color = Color3.fromRGB(0, 0, 0)

                local grad = Instance.new("UIGradient")
                grad.Color = ColorSequence.new(grad_colors)
                grad.Parent = bar

                local knob = Instance.new("Frame")
                knob.Size = UDim2.new(0, 4, 1, 4)
                knob.Position = UDim2.new(0, 0, 0.5, 0)
                knob.AnchorPoint = Vector2.new(0.5, 0.5)
                knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                knob.Parent = bar

                local k_stroke = Instance.new("UIStroke", knob)
                k_stroke.Thickness = 1.5
                k_stroke.Color = Color3.fromRGB(0, 0, 0)

                return bar, knob
            end

            local hue_bar, hue_knob = create_bar("hue", UDim2.new(0, 0, 0, 0), {
                ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)),
                ColorSequenceKeypoint.new(0.16, Color3.new(1, 0, 1)),
                ColorSequenceKeypoint.new(0.33, Color3.new(0, 0, 1)),
                ColorSequenceKeypoint.new(0.49, Color3.new(0, 1, 1)),
                ColorSequenceKeypoint.new(0.66, Color3.new(0, 1, 0)),
                ColorSequenceKeypoint.new(0.83, Color3.new(1, 1, 0)),
                ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0))
            })

            local trans_bar, trans_knob = create_bar("trans", UDim2.new(0, 0, 0, 16), {
                ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
            })

            local picker_square = Instance.new("TextButton")
            picker_square.Size = UDim2.new(1, 0, 0, 70)
            picker_square.Position = UDim2.new(0, 0, 0, 32)
            picker_square.AutoButtonColor = false
            picker_square.Text = ""
            picker_square.BackgroundColor3 = Color3.fromHSV(current_h, 1, 1)
            picker_square.Parent = controls

            Instance.new("UICorner", picker_square).CornerRadius = UDim.new(0, 4)

            local square_stroke = Instance.new("UIStroke", picker_square)
            square_stroke.Thickness = 1.5
            square_stroke.Color = Color3.fromRGB(0, 0, 0)

            local white_grad = Instance.new("Frame")
            white_grad.Size = UDim2.new(1, 0, 1, 0)
            white_grad.BackgroundTransparency = 0
            white_grad.BorderSizePixel = 0
            white_grad.Parent = picker_square

            Instance.new("UICorner", white_grad).CornerRadius = UDim.new(0, 4)

            local w_g = Instance.new("UIGradient")
            w_g.Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.new(1, 1, 1))
            w_g.Transparency = NumberSequence.new(0, 1)
            w_g.Parent = white_grad

            local black_grad = Instance.new("Frame")
            black_grad.Size = UDim2.new(1, 0, 1, 0)
            black_grad.BackgroundTransparency = 0
            black_grad.BorderSizePixel = 0
            black_grad.Parent = picker_square

            Instance.new("UICorner", black_grad).CornerRadius = UDim.new(0, 4)

            local b_g = Instance.new("UIGradient")
            b_g.Color = ColorSequence.new(Color3.new(0, 0, 0), Color3.new(0, 0, 0))
            b_g.Rotation = 90
            b_g.Transparency = NumberSequence.new(1, 0)
            b_g.Parent = black_grad

            local picker_knob = Instance.new("Frame")
            picker_knob.Size = UDim2.new(0, 6, 0, 6)
            picker_knob.BackgroundColor3 = Color3.new(1, 1, 1)
            picker_knob.AnchorPoint = Vector2.new(0.5, 0.5)
            picker_knob.ZIndex = 5
            picker_knob.Parent = picker_square

            Instance.new("UICorner", picker_knob).CornerRadius = UDim.new(1, 0)

            local pk_stroke = Instance.new("UIStroke", picker_knob)
            pk_stroke.Thickness = 1.5
            pk_stroke.Color = Color3.fromRGB(0, 0, 0)

            local function update()
                local picked = Color3.fromHSV(current_h, current_s, current_v)
                picker_square.BackgroundColor3 = Color3.fromHSV(current_h, 1, 1)
                color_display.BackgroundColor3 = picked
                color_display.BackgroundTransparency = current_t
                callback(picked, current_t)
            end

            local function setup_drag(obj, is_square)
                local active = false
                local function move(input)
                    local lx = math.clamp((input.Position.X - obj.AbsolutePosition.X) / obj.AbsoluteSize.X, 0, 1)
                    local ly = math.clamp((input.Position.Y - obj.AbsolutePosition.Y) / obj.AbsoluteSize.Y, 0, 1)

                    if is_square then
                        current_s, current_v = lx, 1 - ly
                        picker_knob.Position = UDim2.new(lx, 0, ly, 0)
                    elseif obj == hue_bar then
                        current_h = lx
                        hue_knob.Position = UDim2.new(lx, 0, 0.5, 0)
                    else
                        current_t = lx
                        trans_knob.Position = UDim2.new(lx, 0, 0.5, 0)
                    end

                    update()
                end

                obj.InputBegan:Connect(function(i)
                    if i.UserInputType == Enum.UserInputType.MouseButton1 then
                        active = true
                        move(i)
                    end
                end)

                user_input_service.InputChanged:Connect(function(i)
                    if active and i.UserInputType == Enum.UserInputType.MouseMovement then
                        move(i)
                    end
                end)

                user_input_service.InputEnded:Connect(function(i)
                    if i.UserInputType == Enum.UserInputType.MouseButton1 then
                        active = false
                    end
                end)
            end

            setup_drag(hue_bar, false)
            setup_drag(trans_bar, false)
            setup_drag(picker_square, true)

            color_display.MouseButton1Click:Connect(function()
                local is_expanded = picker_container.Size.Y.Offset > 50
                local target_y = is_expanded and 38 or 150
                tween_service:Create(picker_container, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Size = UDim2.new(1, -15, 0, target_y)}):Play()
            end)
        end

        table.insert(window.tabs, tab)
        return tab
    end

    local gui_visible = true

    local function make_draggable(obj, target)
        target = target or obj
        local dragging, drag_start, start_pos

        obj.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                drag_start = input.Position
                start_pos = target.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        user_input_service.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - drag_start
                target.Position = UDim2.new(start_pos.X.Scale, start_pos.X.Offset + delta.X, start_pos.Y.Scale, start_pos.Y.Offset + delta.Y)
            end
        end)
    end

    make_draggable(main_inner, main_outer)
    make_draggable(toggle_btn, toggle_outer)

    local minimized = false

    mini_btn.MouseButton1Click:Connect(function()
        minimized = not minimized
        local target_size = minimized and UDim2.new(0, 300, 0, 35) or UDim2.new(0, 600, 0, 400)
        mini_btn.Text = minimized and "+" or "-"
        tween_service:Create(main_outer, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = target_size}):Play()

        if minimized then
            container_holder.Visible = false
            horizontal_separator.Visible = false
        else
            task.delay(0.1, function()
                container_holder.Visible = true
                horizontal_separator.Visible = true
            end)
        end
    end)

    close_btn.MouseButton1Click:Connect(function()
        local close_tween = tween_service:Create(main_outer, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)})
        close_tween:Play()
        close_tween.Completed:Connect(function()
            screen_gui:Destroy()
        end)
    end)

    return window
end

return library
