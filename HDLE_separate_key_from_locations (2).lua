-- [[ HDLE STARTUP BOOTSTRAP ]]
print("[HDLE] Initializing...")
repeat task.wait() until game:IsLoaded() and game:GetService("Players").LocalPlayer
print("[HDLE] Bootstrap Complete.")

local VERSION = "11.0.0"


local DESIGN = {
    MainFrame = {
        MinWidth         = 160,
        MinHeight        = 280,
        MaxWidth         = 500,
        MaxHeight        = 800,
        DefaultWidth     = 260,
        DefaultHeight    = 500,
        PosScaleX        = 0.35,
        PosScaleY        = 0.1,
        Background       = Color3.fromRGB(20, 20, 20),
        CornerRadius     = 12,
    },
    MinimizeBtn = {
        Background       = Color3.fromRGB(200, 40, 40),
        TextColor        = Color3.new(1, 1, 1),
        Text             = "—",
        CornerRadius     = 6,
    },
    RestoreIcon = {
        Width            = 90,
        Height           = 34,
        Background       = Color3.fromRGB(0, 140, 70),
        BorderColor      = Color3.fromRGB(0, 255, 150),
        TextColor        = Color3.new(1, 1, 1),
        TextSize         = 14,
        CornerRadius     = 17,
        DefaultPosX      = 10,
        DefaultPosY      = 0.5,
    },
    ResizeHandle = {
        Size             = 20,
        Color            = Color3.fromRGB(0, 200, 120),
        Transparency     = 0.4,
        LineColor        = Color3.fromRGB(0, 255, 150),
    },
}

local LOCALES = {
    ["EN"] = {
        title       = "Movement Menu",
        tlp         = "1. Teleport",
        thr         = "2. Throw",
        wlk         = "4. Walk",
        fly         = "5. Fly",
        up          = "⬆️ Up",
        fwd         = "➡️ Fwd",
        lang        = "Lang",
        show3d      = "👁️ 3D Path",
        lock        = "🔓 Lock",
        lock_on     = "🔒 Locked",
        key_msg     = "Enter 30-Char Key",
        get_btn     = "Copy Key Link",
        verify      = "Verify",
        restore     = "HDLE ▲",
        invalid     = "❌ INVALID KEY!",
        copied      = "Copied!",
        copy_txt    = "Link copied to clipboard!",
        expires     = "Expires in: ",
        noclip      = "3. Noclip",
        updates     = "Auto-Aim (Combat Module) added!",
        -- Locations
        loc_title   = "📌 Locations",
        loc_add     = "➕ Add",
        loc_save    = "💾 Save Group",
        loc_empty   = "No saved locations\nPress ➕ to add",
        loc_new     = "Location ",
        loc_cur     = "✅ CURRENT MAP",
        loc_other   = "Other Maps",
        loc_back    = "◀ Groups",
        loc_del_grp = "Delete Group",
        loc_nogrp   = "No saved groups yet",
        loc_coords  = "Coords: ",
        -- Tracker
        trk_title   = "👁 Tracker",
        trk_noplay  = "No other players",
        trk_track   = "Track 👁",
        trk_stop    = "⏹ Stop",
        trk_none    = "No active tracking",
        trk_fell    = "⚠️ Player fell",
        trk_left    = "⚠️ Player left",
        trk_search  = "🔍 Search...",
        -- Combat
        cmb_title   = "Combat Menu",
        aim_enabled = "Enable Aimbot",
        aim_auto    = "Auto-Shoot",
        fov_radius  = "FOV Radius",
        click_speed = "Aim Speed (Snap)",
        trigger_sel = "Trigger Key: ",
        shoot_sel   = "Shoot Key: ",
        pos_mode    = "Circle Pos: ",
        pos_center  = "Center",
        pos_mouse   = "Follow Mouse",
        auto_lock   = "Auto-Lock",
        esp_enabled = "Enable ESP",
        esp_boxes   = "Boxes",
        esp_names   = "Player Names",
        on          = "ON",
        off         = "OFF",
        trigger_wait= "...Press any key",
        show_esp    = "Show Players ESP",
        aim_range   = "Target Range",
        range_near  = "Near",
        range_mid   = "Mid",
        range_far   = "Far",
    },
    ["AR"] = {
        title       = "قائمة الحركة",
        tlp         = "1. انتقال",
        thr         = "2. رمي",
        wlk         = "4. مشي",
        fly         = "5. طيران",
        up          = "⬆️ أعلى",
        fwd         = "➡️ أمام",
        lang        = "اللغة",
        show3d      = "👁️ مسار 3D",
        lock        = "🔓 تثبيت",
        lock_on     = "🔒 مثبت",
        key_msg     = "أدخل مفتاح 30 خانة",
        get_btn     = "نسخ رابط المفتاح",
        verify      = "تحقق",
        restore     = "HDLE ▲",
        invalid     = "❌ مفتاح خاطئ!",
        copied      = "تم النسخ!",
        copy_txt    = "تم نسخ الرابط.",
        expires     = "ينتهي خلال: ",
        noclip      = "3. اختراق الجدران",
        updates     = "تم اضافة التصويب التلقائي!",
        loc_title   = "📌 المواقع",
        loc_add     = "➕ أضف",
        loc_save    = "💾 احفظ المجموعة",
        loc_empty   = "لا توجد مواقع\nاضغط ➕ للإضافة",
        loc_new     = "موقع ",
        loc_cur     = "✅ الماب الحالي",
        loc_other   = "مابات أخرى",
        loc_back    = "◀ المجموعات",
        loc_del_grp = "حذف المجموعة",
        loc_nogrp   = "لا توجد مجموعات محفوظة",
        loc_coords  = "إحداثيات: ",
        trk_title   = "👁 تتبع اللاعبين",
        trk_noplay  = "لا يوجد لاعبون آخرون",
        trk_track   = "تتبع 👁",
        trk_stop    = "⏹ إيقاف",
        trk_none    = "لا يوجد تتبع نشط",
        trk_fell    = "⚠️ اللاعب سقط",
        trk_left    = "⚠️ اللاعب غادر",
        trk_search  = "🔍 ابحث...",
        -- Combat
        cmb_title   = "موديول القتال",
        aim_enabled = "تفعيل الأيم بوت",
        aim_auto    = "إطلاق تلقائي (Auto-Shoot)",
        fov_radius  = "نطاق الرؤية (FOV)",
        click_speed = "سرعة التتبع (Snap)",
        trigger_sel = "زر التفعيل: ",
        shoot_sel   = "زر الإطلاق: ",
        pos_mode    = "مكان الدائرة: ",
        pos_center  = "منتصف الشاشة",
        pos_mouse   = "يتبع الماوس",
        auto_lock   = "تتبع تلقائي (Auto-Lock)",
        esp_enabled = "تفعيل ESP",
        esp_boxes   = "صناديق",
        esp_names   = "أسماء اللاعبين",
        on          = "مفعل",
        off         = "معطل",
        trigger_wait= "...اضغط أي مفتاح",
        show_esp    = "إظهار اللاعبين",
        aim_range   = "نطاق الاستهداف",
        range_near  = "قريب",
        range_mid   = "متوسط",
        range_far   = "بعيد",
        mobile_pos  = "مكان الإطلاق: ",
        set_pos     = "تحديد المكان",
        save_pos    = "حفظ",
        fire_mode   = "وضع الإطلاق: ",
        internal    = "داخلي",
        screen_pos  = "إحداثيات",
    },
    ["ES"] = {
        title       = "Menú de Movimiento",
        tlp         = "1. Teletransporte",
        thr         = "2. Lanzar",
        wlk         = "4. Caminar",
        fly         = "5. Volar",
        up          = "⬆️ Arriba",
        fwd         = "➡️ Adelante",
        lang        = "Idioma",
        show3d      = "👁️ Ruta 3D",
        lock        = "🔓 Bloquear",
        lock_on     = "🔒 Bloqueado",
        key_msg     = "Poner Clave de 30",
        get_btn     = "Copiar Link",
        verify      = "Verificar",
        restore     = "HDLE ▲",
        invalid     = "❌ CLAVE INVÁLIDA!",
        copied      = "¡Copiado!",
        copy_txt    = "Enlace copiado.",
        expires     = "Expira en: ",
        noclip      = "3. Sin Colisión",
        updates     = "¡Sistema de Auto-Apuntado (Aimbot) añadido!",
        loc_title   = "📌 Ubicaciones",
        loc_add     = "➕ Agregar",
        loc_save    = "💾 Guardar Grupo",
        loc_empty   = "Sin ubicaciones\nPresiona ➕",
        loc_new     = "Ubicación ",
        loc_cur     = "✅ MAPA ACTUAL",
        loc_other   = "Otros Mapas",
        loc_back    = "◀ Grupos",
        loc_del_grp = "Borrar Grupo",
        loc_nogrp   = "Sin grupos guardados",
        loc_coords  = "Coords: ",
        trk_title   = "👁 Rastreador",
        trk_noplay  = "Sin otros jugadores",
        trk_track   = "Rastrear 👁",
        trk_stop    = "⏹ Parar",
        trk_none    = "Sin rastreo activo",
        trk_fell    = "⚠️ Jugador caído",
        trk_left    = "⚠️ Jugador se fue",
        trk_search  = "🔍 Buscar...",
        -- Combat
        cmb_title   = "Menú de Combate",
        aim_enabled = "Habilitar Aimbot",
        aim_auto    = "Disparo Automático",
        fov_radius  = "Radio FOV",
        click_speed = "Velocidad de Apunte",
        trigger_sel = "Tecla Activación: ",
        shoot_sel   = "Tecla Disparo: ",
        pos_mode    = "Pos. Círculo: ",
        pos_center  = "Centro",
        pos_mouse   = "Sigue al Ratón",
        auto_lock   = "Bloqueo Automático",
        esp_enabled = "Habilitar ESP",
        esp_boxes   = "Cajas",
        esp_names   = "Nombres de Jugadores",
        on          = "ENCENDIDO",
        off         = "APAGADO",
        trigger_wait= "...Presiona cualquier tecla",
        show_esp    = "Mostrar Jugadores",
    },
    ["PT"] = {
        title       = "Menu de Movimento",
        tlp         = "1. Teleporte",
        thr         = "2. Lançar",
        wlk         = "4. Andar",
        fly         = "5. Voar",
        up          = "⬆️ Subir",
        fwd         = "➡️ Frente",
        lang        = "Idioma",
        show3d      = "👁️ Rota 3D",
        lock        = "🔓 Travar",
        lock_on     = "🔒 Travado",
        key_msg     = "Inserir Chave de 30",
        get_btn     = "Copiar Link",
        verify      = "Verificar",
        restore     = "HDLE ▲",
        invalid     = "❌ CHAVE INVÁLIDA!",
        copied      = "Copiado!",
        copy_txt    = "Link copiado.",
        expires     = "Expira em: ",
        noclip      = "3. Atravessar",
        updates     = "Sistema de Mira Automática (Aimbot) adicionado!",
        loc_title   = "📌 Locais",
        loc_add     = "➕ Adicionar",
        loc_save    = "💾 Salvar Grupo",
        loc_empty   = "Sem locais\nPressione ➕",
        loc_new     = "Local ",
        loc_cur     = "✅ MAPA ATUAL",
        loc_other   = "Outros Mapas",
        loc_back    = "◀ Grupos",
        loc_del_grp = "Deletar Grupo",
        loc_nogrp   = "Sem grupos salvos",
        loc_coords  = "Coords: ",
        trk_title   = "👁 Rastreador",
        trk_noplay  = "Sem outros jogadores",
        trk_track   = "Rastrear 👁",
        trk_stop    = "⏹ Parar",
        trk_none    = "Sem rastreamento",
        trk_fell    = "⚠️ Jogador caiu",
        trk_left    = "⚠️ Jogador saiu",
        trk_search  = "🔍 Buscar...",
        -- Combat
        cmb_title   = "Menu de Combate",
        aim_enabled = "Ativar Aimbot",
        aim_auto    = "Tiro Automático",
        fov_radius  = "Raio FOV",
        click_speed = "Velocidade da Mira",
        trigger_sel = "Tecla de Gatilho: ",
        shoot_sel   = "Tecla de Tiro: ",
        pos_mode    = "Posição do Círculo: ",
        pos_center  = "Centro",
        pos_mouse   = "Seguir Mouse",
        auto_lock   = "Trava Automática",
        esp_enabled = "Ativar ESP",
        esp_boxes   = "Caixas",
        esp_names   = "Nomes dos Jogadores",
        on          = "LIGADO",
        off         = "DESLIGADO",
        trigger_wait= "...Pressione qualquer tecla",
        show_esp    = "Mostrar Jogadores",
        mobile_pos = "Firing Pos: ",
        set_pos = "Set Position",
        save_pos = "SAVE",
        fire_mode = "Fire Mode: ",
        internal = "Internal",
        screen_pos = "Screen Pos",
    },
}

-- ==============================================================
-- [Services]
-- ==============================================================
local Players            = game:GetService("Players")
local HttpService        = game:GetService("HttpService")
local TweenService       = game:GetService("TweenService")
local RunService         = game:GetService("RunService")
local UserInputService   = game:GetService("UserInputService")
local StarterGui         = game:GetService("StarterGui")
local MarketplaceService = game:GetService("MarketplaceService")

local player   = Players.LocalPlayer
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

-- [[ Security & Configuration ]]
local function _S(t) local s="" for _,c in ipairs(t) do s=s..string.char(c) end return s end
local _G_SALT = _S({72,68,76,69,95,80,82,79,95,57,57,95,83,84,82,73,75,69}) 
local _G_TOKEN = "T"..tostring(math.random(1000,9999))

local CONFIG = {
    SecretSalt   = _G_SALT,
    BlogURL      = "https://kiy.master-key.workers.dev/",
    FileName     = "hdle_session.txt", 
    UsedKeysFile = "hdle_used.txt", 
    LocFileName  = "HDLE_Locations.json",
    CombatFileName = "HDLE_Combat_Settings.json",
    GitHubRaw    = "https://raw.githubusercontent.com/user/repo/main/script.lua",
    UseGitHub    = false,
    KeyLifetime  = 86400,
    KeyLength    = 30,
    PointerColor = Color3.fromRGB(0, 255, 0),
    WorkerURL    = "https://snowy-surf-8e37.master-key.workers.dev",
    BackupWorkerURL = "https://dawn-grass-13cd.yosefelmosk.workers.dev",
    HeartbeatDelay = 120,
    SiteToken    = "HDLE_SITE_2025_AYOUB",
}

local function GetChecksum(data)
    local key = tostring(data.Key or "")
    local exp = tonumber(data.ExpiryTime) or 0
    local created = tonumber(data.CreatedAt) or 0
    local uid = tostring(data.UserId or (player and player.UserId) or 0)
    -- Simplified binding: UserId + SecretSalt only for maximum persistence
    local exp_str = string.format("%.0f", math.floor(exp))
    local cr_str = string.format("%.0f", math.floor(created))
    local s = key .. exp_str .. cr_str .. uid .. CONFIG.SecretSalt
    local h = 0 
    for i=1,#s do h = (h * 31 + string.byte(s,i)) % 1000000007 end
    return tostring(h)
end

local function GenerateKey()
    local charset  = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*"
    local d        = os.date("!*t")
    local combined = tostring(d.day)..tostring(d.month)..tostring(d.year)..(_G_SALT)
    local seed     = 0
    for i = 1, #combined do seed = seed + (string.byte(combined, i) * i) end
    local key = ""
    for i = 1, CONFIG.KeyLength do
        seed = (seed * 1664525 + 1013904223) % 4294967296
        key  = key .. string.sub(charset, (seed % #charset)+1, (seed % #charset)+1)
    end
    return key
end

local function IsEnvironmentSafe()
    local ok1 = pcall(function() return HttpService.JSONEncode end)
    local ok2 = pcall(function() return HttpService.JSONDecode end)
    return ok1 and ok2
end

-- [Root Security Helpers] XOR Encryption & Base64
local B64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function B64Enc(data)
    return ((data:gsub('.', function(x) 
        local r,b='',x:byte() for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0 for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return B64:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end
local function B64Dec(data)
    data = string.gsub(data, '[^'..B64..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',string.find(B64, x, 1, true)-1
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x < 8) then return '' end
        local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end
local function Cipher(t, k)
    local r = ""
    for i = 1, #t do
        local b = string.byte(t, i)
        local kb = string.byte(k, (i-1) % #k + 1)
        r = r .. string.char(bit32.bxor(b, kb))
    end
    return r
end
local function GetCipherKey()
    -- ربط الجلسة بحساب اللاعب فقط لضمان عملها في كل مكان (الأكثر استقراراً)
    return tostring(player.UserId)..CONFIG.SecretSalt
end

-- ==============================================================
-- [State]
-- ==============================================================
local State = {
    currentLang     = "EN",
    langIndex       = 1,
    langKeys        = {"EN", "AR", "ES", "PT"},
    lockedDirection = nil,
    isPointerActive = false,
    showPlayerESP   = false, -- عرض أسماء اللاعبين ولمعان حول أجسادهم
    isMinimized     = false,
    frameW          = DESIGN.MainFrame.DefaultWidth,
    frameH          = DESIGN.MainFrame.DefaultHeight,
    timeServerOffset = 0, -- فرق التوقيت بين السيرفر والجهاز المحلي
    -- "move" | "groups" | "group_detail" | "tracker"
    currentPage     = "move",
    openGroupName   = nil,   -- اسم المجموعة المفتوحة حالياً
    expiryTimestamp = 0,     -- وقت انتهاء الصلاحية
    isNoclip        = false, 
}
local noclipConn = nil

-- [[ COMBAT STATE & GLOBALS ]]
State.Combat = {
    Aimbot = {
        Enabled = false,
        AutoShoot = false,
        FOV_Radius = 400,
        MaxDistance = 1000,
        Click_Speed = 1, 
        Wall_Check = true,
        Move_Mode = "Closest to Crosshair",
        TargetPart = "Head",
        TriggerKey = Enum.UserInputType.MouseButton2,
        ShootKey = Enum.UserInputType.MouseButton1,
        MobileShootPos = {X = 0, Y = 0},
        FireMode = "Internal", -- "Internal" or "ScreenPos"
        FOV_Position = "Center",
        AutoLock = false,
        AutoShootToggleKey = nil,
        AutoLockToggleKey = nil
    },
    ESP = {
        Enabled = false,
        Boxes = false,
        Tracers = false,
        Names = false,
        Health = true,
        Distance = true,
        Color = Color3.fromRGB(0, 255, 150)
    }
}
local ESP_Elements = {}

local FOVCircle = nil
pcall(function()
    FOVCircle = Drawing.new("Circle")
    FOVCircle.Thickness = 1
    FOVCircle.NumSides = 64
    FOVCircle.Radius = State.Combat.Aimbot.FOV_Radius
    FOVCircle.Filled = false
    FOVCircle.Visible = false
    FOVCircle.Color = DESIGN.MainFrame.Background -- Temporary, will update in loop
    FOVCircle.Transparency = 0.7
end)

-- اكتشاف نوع الجهاز (لتحسين تجربة الهاتف)
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
-- [[ SMART UI DETECTION (Mobile Stability) ]]
local function GetTargetButton(pos)
    if not pos or pos.X <= 0 then return nil end
    local playerGui = player:FindFirstChildOfClass("PlayerGui")
    if not playerGui then return nil end

    -- الحصول على جميع الكائنات الرسومية تحت الإحداثيات المحددة
    local objects = playerGui:GetGuiObjectsAtPosition(pos.X, pos.Y)
    for _, obj in pairs(objects) do
        -- التأكد من أن الكائن هو زر قابل للضغط وليس من واجهة السكريبت
        if (obj:IsA("TextButton") or obj:IsA("ImageButton")) and obj.Visible and obj.Active and not obj:FindFirstAncestor("HDLE_MainGUI") then
            return obj
        end
    end
    return nil
end

local function SimulateClick(key)
    -- On mobile, handle coordinate-based firing with Signal or high-isolation Touch
    if isMobile and State.Combat.Aimbot.MobileShootPos.X > 0 and State.Combat.Aimbot.FireMode == "ScreenPos" then
        task.spawn(function()
            local pos = State.Combat.Aimbot.MobileShootPos
            
            -- 1. محاولة استخدام الإشارة البرمجية (fireSignal) - الحل الأكثر استقراراً
            local targetBtn = GetTargetButton(pos)
            if targetBtn and (typeof(firesignal) == "function") then
                pcall(function()
                    firesignal(targetBtn.MouseButton1Click)
                    firesignal(targetBtn.MouseButton1Down)
                    firesignal(targetBtn.Activated)
                end)
                return
            end

            -- 2. Fallback: استخدام محاكاة اللمس مع معرف فريد (10) إذا لم تتوفر الإشارة
            local VIM = game:GetService("VirtualInputManager")
            pcall(function()
                local finalX, finalY = math.floor(pos.X), math.floor(pos.Y)
                VIM:SendTouchEvent(10, 0, finalX, finalY) -- بداية اللمس
                task.wait(0.02)
                VIM:SendTouchEvent(10, 2, finalX, finalY) -- نهاية اللمس
            end)
        end)
        return
    end

    -- على الهواتف، نتجنب محاكاة ضغطات الماوس لأنها تخفي أزرار التحكم
    if isMobile and (key == Enum.UserInputType.MouseButton1 or key == Enum.UserInputType.MouseButton2) then
        return 
    end

    if key == Enum.UserInputType.MouseButton1 then
        if mouse1click then mouse1click()
        elseif mouse1down and mouse1up then mouse1down(); wait(); mouse1up() end
    elseif key == Enum.UserInputType.MouseButton2 then
        if mouse2click then mouse2click()
        elseif mouse2down and mouse2up then mouse2down(); wait(); mouse2up() end
    elseif key == Enum.UserInputType.Touch then
        -- دعم اللمس للهواتف
        if mouse1click then mouse1click() end
    elseif typeof(key) == "EnumItem" and key.EnumType == Enum.KeyCode then
        if keypress and keyrelease then
            keypress(key.Value)
            wait()
            keyrelease(key.Value)
        end
    end
end

local function IsVisible(part)
    if not State.Combat.Aimbot.Wall_Check then return true end
    local Camera = workspace.CurrentCamera
    local direction = (part.Position - Camera.CFrame.Position)
    local ray = Ray.new(Camera.CFrame.Position, direction)
    local hit, pos = workspace:FindPartOnRayWithIgnoreList(ray, {player.Character, Camera, workspace.Terrain})
    return hit and hit:IsDescendantOf(part.Parent)
end

local function GetClosestPlayer()
    local target = nil
    local Camera = workspace.CurrentCamera
    local shortestDist = (State.Combat.Aimbot.Move_Mode == "Closest to Crosshair") and State.Combat.Aimbot.FOV_Radius or math.huge

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild(State.Combat.Aimbot.TargetPart) and p.Character:FindFirstChildOfClass("Humanoid") then
            local hum = p.Character.Humanoid
            if hum.Health > 0 and not p.Character:FindFirstChild("ForceField") then
                local part = p.Character[State.Combat.Aimbot.TargetPart]
                local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                
                if onScreen and IsVisible(part) then
                    local fovPos = (State.Combat.Aimbot.FOV_Position == "Mouse") and UserInputService:GetMouseLocation() or Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
                    
                    if State.Combat.Aimbot.Move_Mode == "Closest to Crosshair" then
                        local dist = (Vector2.new(screenPos.X, screenPos.Y) - fovPos).Magnitude
                        local worldDist = (part.Position - Camera.CFrame.Position).Magnitude
                        if dist < shortestDist and worldDist <= State.Combat.Aimbot.MaxDistance then
                            target = p
                            shortestDist = dist
                        end
                    else
                        local dist = (part.Position - Camera.CFrame.Position).Magnitude
                        if dist < shortestDist and dist <= State.Combat.Aimbot.MaxDistance then
                            target = p
                            shortestDist = dist
                        end
                    end
                end
            end
        end
    end
    return target
end

local function CreateESP(p)
    if p == player then return end
    local elements = {}
    
    local ok = pcall(function()
        elements.Box = Drawing.new("Square")
        elements.Tracer = Drawing.new("Line")
        elements.Name = Drawing.new("Text")
        elements.Info = Drawing.new("Text")
        
        elements.Box.Thickness = 1
        elements.Box.Filled = false
        elements.Box.Color = State.Combat.ESP.Color
        
        elements.Tracer.Thickness = 1
        elements.Tracer.Color = State.Combat.ESP.Color
        
        elements.Name.Size = 14
        elements.Name.Center = true
        elements.Name.Outline = true
        elements.Name.Color = Color3.new(1,1,1)
        
        elements.Info.Size = 12
        elements.Info.Center = true
        elements.Info.Outline = true
        elements.Info.Color = Color3.fromRGB(0, 255, 150)
    end)
    
    if not ok then return end
    ESP_Elements[p] = elements
end

local function RemoveESP(p)
    if ESP_Elements[p] then
        for _, el in pairs(ESP_Elements[p]) do el:Remove() end
        ESP_Elements[p] = nil
    end
end

for _, p in ipairs(Players:GetPlayers()) do CreateESP(p) end
Players.PlayerAdded:Connect(CreateESP)
Players.PlayerRemoving:Connect(RemoveESP)

-- ==============================================================
-- [Localization]
-- ==============================================================
local function DetectLanguage()
    local ok, localeId = pcall(function() return player.LocaleId end)
    local code = string.upper(string.sub(localeId, 1, 2))
    return LOCALES[code] and code or "EN"
end
local function InitLanguage()
    State.currentLang = DetectLanguage()
    for i, k in ipairs(State.langKeys) do
        if k == State.currentLang then State.langIndex = i break end
    end
end
local function T(key)
    local lang = LOCALES[State.currentLang]
    return (lang and lang[key]) or (LOCALES["EN"][key]) or key
end
local function CycleLang() State.langIndex=(State.langIndex%#State.langKeys)+1 State.currentLang=State.langKeys[State.langIndex] end

-- ==============================================================
-- [Key Generator] - لم يُمس
-- ==============================================================
local function GenerateKey()
    local charset  = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*"
    local d        = os.date("!*t")
    local combined = tostring(d.day)..tostring(d.month)..tostring(d.year)..(_G_SALT)
    local seed     = 0
    for i = 1, #combined do seed = seed + (string.byte(combined, i) * i) end
    local key = ""
    for i = 1, CONFIG.KeyLength do
        seed = (seed * 1664525 + 1013904223) % 4294967296
        key  = key .. string.sub(charset, (seed % #charset)+1, (seed % #charset)+1)
    end
    return key
end

-- ==============================================================
-- [Timer]
-- ==============================================================
local function GetTimeLeft()
    local expiry = State.expiryTimestamp or 0
    local serverTime = os.time() + (State.timeServerOffset or 0)
    local s = math.max(0, expiry - serverTime)
    
    local days = math.floor(s / 86400)
    local hours = math.floor((s % 86400) / 3600)
    local mins = math.floor((s % 3600) / 60)
    local secs = s % 60
    
    if days > 0 then
        return string.format("%d Days, %02d:%02d:%02d", days, hours, mins, secs)
    else
        return string.format("%02d:%02d:%02d", hours, mins, secs)
    end
end

-- ==============================================================
-- [UI Helpers]
-- ==============================================================
local function MakeCorner(parent, radius)
    local c = Instance.new("UICorner", parent)
    c.CornerRadius = UDim.new(0, radius or 8)
    return c
end
local function MakeStroke(parent, color, thickness)
    local s = Instance.new("UIStroke", parent)
    s.Color = color or Color3.fromRGB(0,255,150)
    s.Thickness = thickness or 1
    return s
end
-- [[ POSITION PICKER HELPER ]]
local function CreatePositionPicker(onSave)
    local PickerGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
    PickerGui.Name = "HDLE_PositionPicker"
    PickerGui.DisplayOrder = 2000
    
    local Circle = Instance.new("Frame", PickerGui)
    Circle.Size = UDim2.new(0, 50, 0, 50)
    Circle.Position = UDim2.new(0.5, -25, 0.5, -25)
    Circle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    Circle.BackgroundTransparency = 0.4
    Circle.BorderSizePixel = 0
    MakeCorner(Circle, 25)
    MakeStroke(Circle, Color3.new(1,1,1), 2)
    
    local Dot = Instance.new("Frame", Circle)
    Dot.Size = UDim2.new(0, 4, 0, 4)
    Dot.Position = UDim2.new(0.5, -2, 0.5, -2)
    Dot.BackgroundColor3 = Color3.new(1,1,1)
    MakeCorner(Dot, 2)
    
    local SaveBtn = Instance.new("TextButton", PickerGui)
    SaveBtn.Size = UDim2.new(0, 100, 0, 40)
    SaveBtn.Position = UDim2.new(0.5, -50, 0.8, 0)
    SaveBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 60)
    SaveBtn.TextColor3 = Color3.new(1,1,1)
    SaveBtn.Text = T("save_pos")
    SaveBtn.Font = Enum.Font.SourceSansBold
    SaveBtn.TextSize = 18
    MakeCorner(SaveBtn, 8)
    MakeStroke(SaveBtn, Color3.new(1,1,1), 1)
    
    local dragging = false
    local dragOffset = Vector2.new()
    
    Circle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragOffset = Vector2.new(input.Position.X - Circle.AbsolutePosition.X, input.Position.Y - Circle.AbsolutePosition.Y)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            Circle.Position = UDim2.new(0, input.Position.X - dragOffset.X, 0, input.Position.Y - dragOffset.Y)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    SaveBtn.MouseButton1Click:Connect(function()
        local centerPos = Circle.AbsolutePosition + Vector2.new(Circle.AbsoluteSize.X/2, Circle.AbsoluteSize.Y/2)
        onSave(centerPos)
        PickerGui:Destroy()
    end)
end

local function QuickLabel(parent, props)
    local l = Instance.new("TextLabel", parent)
    for k,v in pairs(props) do l[k]=v end
    l.BorderSizePixel = 0
    return l
end

-- ==============================================================
-- [Scale Calculator]
-- ==============================================================
local function CalcSizes(w, h)
    local isMob = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
    local multiplier = isMob and 1.15 or 1.0
    return {
        fontTitle  = math.clamp(math.floor(w*0.087 * multiplier), 12, 28),
        fontNormal = math.clamp(math.floor(w*0.068 * multiplier), 11, 24),
        fontSmall  = math.clamp(math.floor(w*0.054 * multiplier), 10, 20),
        fontTimer  = math.clamp(math.floor(w*0.048 * multiplier), 9,  18),
        titleH     = math.clamp(math.floor(h*0.078 * multiplier), 30, 52),
        btnH       = math.clamp(math.floor(h*0.072 * multiplier), 26, 48),
        inputH     = math.clamp(math.floor(h*0.068 * multiplier), 24, 46),
        timerH     = math.clamp(math.floor(h*0.038 * multiplier), 15, 26),
        rowH       = math.clamp(math.floor(h*0.068 * multiplier), 26, 48),
        langH      = math.clamp(math.floor(h*0.058 * multiplier), 20, 40),
        padding    = math.clamp(math.floor(h*0.012 * multiplier), 4,  10),
        minBtnW    = math.clamp(math.floor(w*0.138 * multiplier), 30, 48),
        minBtnH    = math.clamp(math.floor(h*0.052 * multiplier), 20, 36),
        navBtnW    = math.clamp(math.floor(w*0.138 * multiplier), 30, 48),
        navBtnH    = math.clamp(math.floor(h*0.052 * multiplier), 20, 36),
        cardH      = math.clamp(math.floor(h*0.13 * multiplier),  58, 90),
        grpCardH   = math.clamp(math.floor(h*0.115 * multiplier), 54, 80),
    }
end

-- ==============================================================
-- [Persistent Location Storage] - حفظ دائم عبر writefile
-- ==============================================================
local allLocData = {}
local locDataLoaded = false

local function LoadLocations()
    if not (isfile and readfile) then
        locDataLoaded = true
        return
    end
    local ok, txt = pcall(readfile, CONFIG.LocFileName)
    if not ok or not txt or txt == "" then
        locDataLoaded = true
        return
    end
    local ok2, decoded = pcall(function() return HttpService:JSONDecode(txt) end)
    if ok2 and type(decoded) == "table" then
        allLocData = decoded
    end
    locDataLoaded = true
end

local function SaveLocations()
    if not writefile then return end
    if not locDataLoaded then return end
    local ok, encoded = pcall(function() return HttpService:JSONEncode(allLocData) end)
    if ok then
        pcall(writefile, CONFIG.LocFileName, encoded)
    end
end

-- ==============================================================
-- [Persistent Combat Storage]
-- ==============================================================
local combatDataLoaded = false
local function SerializeCombat()
    local c = State.Combat
    return {
        Aimbot = {
            Enabled = c.Aimbot.Enabled,
            AutoShoot = c.Aimbot.AutoShoot,
            AutoLock = c.Aimbot.AutoLock,
            FOV_Radius = c.Aimbot.FOV_Radius,
            MaxDistance = c.Aimbot.MaxDistance,
            Click_Speed = c.Aimbot.Click_Speed,
            FOV_Position = c.Aimbot.FOV_Position,
            TriggerKey = c.Aimbot.TriggerKey and {Type=tostring(c.Aimbot.TriggerKey.EnumType), Name=c.Aimbot.TriggerKey.Name} or nil,
            ShootKey = c.Aimbot.ShootKey and {Type=tostring(c.Aimbot.ShootKey.EnumType), Name=c.Aimbot.ShootKey.Name} or nil,
            AutoShootToggleKey = c.Aimbot.AutoShootToggleKey and {Type=tostring(c.Aimbot.AutoShootToggleKey.EnumType), Name=c.Aimbot.AutoShootToggleKey.Name} or nil,
            AutoLockToggleKey = c.Aimbot.AutoLockToggleKey and {Type=tostring(c.Aimbot.AutoLockToggleKey.EnumType), Name=c.Aimbot.AutoLockToggleKey.Name} or nil,
        },
        ESP = {
            Enabled = c.ESP.Enabled,
            Boxes = c.ESP.Boxes,
            Names = c.ESP.Names
        }
    }
end

local function DeserializeCombat(data)
    if type(data) ~= "table" then return end
    local c = State.Combat
    if data.Aimbot then
        if data.Aimbot.Enabled ~= nil then c.Aimbot.Enabled = data.Aimbot.Enabled end
        if data.Aimbot.AutoShoot ~= nil then c.Aimbot.AutoShoot = data.Aimbot.AutoShoot end
        if data.Aimbot.AutoLock ~= nil then c.Aimbot.AutoLock = data.Aimbot.AutoLock end
        if data.Aimbot.FOV_Radius ~= nil then c.Aimbot.FOV_Radius = data.Aimbot.FOV_Radius end
        if data.Aimbot.MaxDistance ~= nil then c.Aimbot.MaxDistance = data.Aimbot.MaxDistance end
        if data.Aimbot.Click_Speed ~= nil then c.Aimbot.Click_Speed = data.Aimbot.Click_Speed end
        if data.Aimbot.FOV_Position ~= nil then c.Aimbot.FOV_Position = data.Aimbot.FOV_Position end
        
        local function parseEnum(e)
            if type(e) == "table" and e.Type and e.Name then
                local enumRef = e.Type:match("KeyCode") and Enum.KeyCode or Enum.UserInputType
                local ok, val = pcall(function() return enumRef[e.Name] end)
                if ok then return val end
            end
            return nil
        end
        c.Aimbot.TriggerKey = parseEnum(data.Aimbot.TriggerKey) or c.Aimbot.TriggerKey
        c.Aimbot.ShootKey = parseEnum(data.Aimbot.ShootKey) or c.Aimbot.ShootKey
        c.Aimbot.AutoShootToggleKey = parseEnum(data.Aimbot.AutoShootToggleKey) or nil
        c.Aimbot.AutoLockToggleKey = parseEnum(data.Aimbot.AutoLockToggleKey) or nil
    end
    if data.ESP then
        if data.ESP.Enabled ~= nil then c.ESP.Enabled = data.ESP.Enabled end
        if data.ESP.Boxes ~= nil then c.ESP.Boxes = data.ESP.Boxes end
        if data.ESP.Names ~= nil then c.ESP.Names = data.ESP.Names end
    end
end

local function LoadCombatSettings()
    if not (isfile and readfile) then
        combatDataLoaded = true
        return
    end
    local ok, txt = pcall(readfile, CONFIG.CombatFileName)
    if not ok or not txt or txt == "" then
        combatDataLoaded = true
        return
    end
    local ok2, decoded = pcall(function() return HttpService:JSONDecode(txt) end)
    if ok2 then
        DeserializeCombat(decoded)
    end
    combatDataLoaded = true
end

local function SaveCombatSettings()
    if not writefile then return end
    if not combatDataLoaded then return end
    local ok, encoded = pcall(function() return HttpService:JSONEncode(SerializeCombat()) end)
    if ok then
        pcall(writefile, CONFIG.CombatFileName, encoded)
    end
end

-- ==============================================================
-- [Map Detection]
-- ==============================================================
local currentMap = "Unknown"
local function FetchMapName()
    local mp = workspace:FindFirstChild("MapName")
    if mp then
        local nv = mp:FindFirstChild("Name")
        if nv and nv:IsA("StringValue") and nv.Value ~= "" then
            currentMap = nv.Value return
        end
        if mp:IsA("StringValue") and mp.Value ~= "" then
            currentMap = mp.Value return
        end
    end
    local ok, r = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId).Name
    end)
    if ok and r and tostring(r) ~= "" then
        currentMap = tostring(r) return
    end
    currentMap = "Map_"..tostring(game.PlaceId)
end

-- ==============================================================
-- [Resize Handles]
-- ==============================================================
local function BuildResizeHandles(frame, onResize)
    local HD = DESIGN.ResizeHandle
    local corners = {
        {name="BR",posX=UDim2.new(1,-HD.Size,1,-HD.Size),dirW= 1,dirH= 1,moveX=false,moveY=false},
        {name="BL",posX=UDim2.new(0,0,        1,-HD.Size),dirW=-1,dirH= 1,moveX=true, moveY=false},
        {name="TR",posX=UDim2.new(1,-HD.Size,0,0),         dirW= 1,dirH=-1,moveX=false,moveY=true },
        {name="TL",posX=UDim2.new(0,0,        0,0),         dirW=-1,dirH=-1,moveX=true, moveY=true },
    }
    for _, def in ipairs(corners) do
        local handle = Instance.new("Frame", frame)
        handle.Name="RH_"..def.name handle.Size=UDim2.new(0,HD.Size,0,HD.Size)
        handle.Position=def.posX handle.BackgroundTransparency=1 handle.ZIndex=20 handle.Active=true
        local arc=Instance.new("Frame",handle) arc.Size=UDim2.new(1,0,1,0)
        arc.BackgroundColor3=HD.Color arc.BackgroundTransparency=HD.Transparency arc.ZIndex=21 arc.BorderSizePixel=0
        MakeCorner(arc,HD.Size)
        for i=1,3 do
            local ll=HD.Size-(i*5)
            if ll>3 then
                local line=Instance.new("Frame",handle)
                line.Size=UDim2.new(0,ll,0,2)
                line.Position=UDim2.new(def.dirW==1 and 0 or 1,def.dirW==1 and 2 or -(ll+2),1,-(i*5))
                line.BackgroundColor3=HD.LineColor line.BackgroundTransparency=0.1 line.BorderSizePixel=0 line.ZIndex=22
                MakeCorner(line,2)
            end
        end
        local resizing=false local startMouse=Vector2.new() local startSize=Vector2.new() local startPos=UDim2.new()
        local DM=DESIGN.MainFrame
        handle.InputBegan:Connect(function(input)
            if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
                resizing=true startMouse=Vector2.new(input.Position.X,input.Position.Y)
                startSize=Vector2.new(frame.AbsoluteSize.X,frame.AbsoluteSize.Y) startPos=frame.Position frame.Draggable=false
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if not resizing then return end
            if input.UserInputType~=Enum.UserInputType.MouseMovement and input.UserInputType~=Enum.UserInputType.Touch then return end
            local dx=input.Position.X-startMouse.X local dy=input.Position.Y-startMouse.Y
            local newW=math.clamp(startSize.X+dx*def.dirW,DM.MinWidth,DM.MaxWidth)
            local newH=math.clamp(startSize.Y+dy*def.dirH,DM.MinHeight,DM.MaxHeight)
            frame.Size=UDim2.new(0,newW,0,newH)
            local offX=startPos.X.Offset local offY=startPos.Y.Offset
            if def.moveX then offX=startPos.X.Offset+(startSize.X-newW) end
            if def.moveY then offY=startPos.Y.Offset+(startSize.Y-newH) end
            frame.Position=UDim2.new(startPos.X.Scale,offX,startPos.Y.Scale,offY)
            State.frameW=newW State.frameH=newH
            if onResize then onResize(newW,newH) end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
                if resizing then resizing=false frame.Draggable=true end
            end
        end)
    end
end

-- ==============================================================
-- [Minimize System]
-- ==============================================================
local function BuildMinimizeSystem(mainFrame, parentGui)
    local iconGui=Instance.new("ScreenGui",game.CoreGui)
    iconGui.ResetOnSpawn=false iconGui.DisplayOrder=999 iconGui.IgnoreGuiInset=true
    local D=DESIGN.RestoreIcon
    local restoreBtn=Instance.new("TextButton",iconGui)
    restoreBtn.Size=UDim2.new(0,D.Width,0,D.Height)
    restoreBtn.Position=UDim2.new(0,D.DefaultPosX,D.DefaultPosY,-D.Height/2)
    restoreBtn.BackgroundColor3=D.Background restoreBtn.TextColor3=D.TextColor
    restoreBtn.Font=Enum.Font.SourceSansBold restoreBtn.TextSize=D.TextSize
    restoreBtn.Text=T("restore") restoreBtn.Visible=false restoreBtn.ZIndex=10 restoreBtn.Active=true
    MakeCorner(restoreBtn,D.CornerRadius) MakeStroke(restoreBtn,D.BorderColor)
    RunService.RenderStepped:Connect(function() restoreBtn.Text=T("restore") end)
    local drag={active=false,startInput=Vector2.new(),startPos=restoreBtn.Position,moved=false}
    restoreBtn.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
            drag.active=true drag.moved=false
            drag.startInput=Vector2.new(input.Position.X,input.Position.Y) drag.startPos=restoreBtn.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if not drag.active then return end
        if input.UserInputType~=Enum.UserInputType.MouseMovement and input.UserInputType~=Enum.UserInputType.Touch then return end
        local dx=input.Position.X-drag.startInput.X local dy=input.Position.Y-drag.startInput.Y
        if math.abs(dx)>5 or math.abs(dy)>5 then drag.moved=true end
        restoreBtn.Position=UDim2.new(drag.startPos.X.Scale,drag.startPos.X.Offset+dx,drag.startPos.Y.Scale,drag.startPos.Y.Offset+dy)
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then drag.active=false end
    end)
    local function Minimize()
        if State.isMinimized then return end
        State.isMinimized=true mainFrame.Visible=false parentGui.Enabled=false restoreBtn.Visible=true
    end
    local function Restore()
        if not State.isMinimized then return end
        State.isMinimized=false restoreBtn.Visible=false parentGui.Enabled=true mainFrame.Visible=true
    end
    restoreBtn.InputEnded:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
            if not drag.moved then Restore() end
        end
    end)
    return Minimize
end

-- ==============================================================
-- [Modern Mobile Components]
-- ==============================================================
local function CreateMobileToggle(parent, title, stateTable, stateKey, callback)
    local Frame = Instance.new("Frame", parent)
    Frame.Size = UDim2.new(1, 0, 0, 50)
    Frame.BackgroundTransparency = 1
    
    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = title
    Label.TextColor3 = Color3.new(1, 1, 1)
    Label.TextSize = 16
    Label.Font = Enum.Font.SourceSansBold
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local Switch = Instance.new("TextButton", Frame)
    Switch.Size = UDim2.new(0, 56, 0, 28)
    Switch.Position = UDim2.new(1, -60, 0.5, -14)
    Switch.BackgroundColor3 = stateTable[stateKey] and Color3.fromRGB(0, 255, 120) or Color3.fromRGB(60, 60, 60)
    Switch.Text = ""
    MakeCorner(Switch, 14)

    local Knob = Instance.new("Frame", Switch)
    Knob.Size = UDim2.new(0, 24, 0, 24)
    Knob.Position = stateTable[stateKey] and UDim2.new(1, -26, 0.5, -12) or UDim2.new(0, 2, 0.5, -12)
    Knob.BackgroundColor3 = Color3.new(1, 1, 1)
    MakeCorner(Knob, 12)

    Switch.MouseButton1Click:Connect(function()
        stateTable[stateKey] = not stateTable[stateKey]
        game:GetService("TweenService"):Create(Knob, TweenInfo.new(0.2), {
            Position = stateTable[stateKey] and UDim2.new(1, -26, 0.5, -12) or UDim2.new(0, 2, 0.5, -12)
        }):Play()
        game:GetService("TweenService"):Create(Switch, TweenInfo.new(0.2), {
            BackgroundColor3 = stateTable[stateKey] and Color3.fromRGB(0, 255, 120) or Color3.fromRGB(60, 60, 60)
        }):Play()
        if callback then callback(stateTable[stateKey]) end
        if SaveCombatSettings then SaveCombatSettings() end
    end)
    return Frame
end

local function BuildFloatingBubble(mainFrame, parentGui)
    local bubbleGui = Instance.new("ScreenGui", game.CoreGui)
    bubbleGui.Name = "HDLE_Bubble"
    bubbleGui.IgnoreGuiInset = true
    bubbleGui.DisplayOrder = 1000000
    
    local Bubble = Instance.new("TextButton", bubbleGui)
    Bubble.Size = UDim2.new(0, 54, 0, 54)
    Bubble.Position = UDim2.new(0.9, -60, 0.5, -27)
    Bubble.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
    Bubble.Text = "HDLE"
    Bubble.TextColor3 = Color3.new(0, 0, 0)
    Bubble.Font = Enum.Font.SourceSansBold
    Bubble.TextSize = 14
    Bubble.Visible = false
    Bubble.ZIndex = 10
    MakeCorner(Bubble, 27)
    MakeStroke(Bubble, Color3.new(1,1,1), 2)

    -- Dragging Logic
    local dragging = false
    local dragStart, startPos
    Bubble.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Bubble.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
-- ==============================================================
-- [UI Components & Helpers]
-- ==============================================================
local function MakeBtn(parent, bgColor, order, S)
    local b = Instance.new("TextButton", parent)
    b.LayoutOrder=order b.Size=UDim2.new(1,0,0,S and S.btnH or 32)
    b.BackgroundColor3=bgColor or Color3.fromRGB(60,60,60)
    b.TextColor3=Color3.new(1,1,1) b.Font=Enum.Font.SourceSansBold
    b.TextSize=S and S.fontNormal or 14 b.Text="" b.TextWrapped=false
    MakeCorner(b,8) return b
end

local function MakeInput(parent, def, order, S)
    local inp = Instance.new("TextBox", parent)
    inp.LayoutOrder=order inp.Size=UDim2.new(1,0,0,S and S.inputH or 30)
    inp.BackgroundColor3=Color3.fromRGB(10,10,10)
    inp.TextColor3=Color3.fromRGB(0,255,100) inp.Text=def or ""
    inp.Font=Enum.Font.SourceSans inp.TextSize=S and S.fontNormal or 14
    inp.ClearTextOnFocus=false inp.TextWrapped=false
    MakeCorner(inp,8) return inp
end

-- ==============================================================
-- [SHARED LOGIC CONTROLLERS]
-- ==============================================================
local Controllers = {}

function Controllers.ToggleNoclip(State, Btn)
    State.isNoclip = not State.isNoclip
    if State.isNoclip then
        if Btn then Btn.BackgroundColor3 = Color3.fromRGB(0, 140, 65) end
        if _G.HDLE_NoclipStep then _G.HDLE_NoclipStep:Disconnect() end
        _G.HDLE_NoclipStep = RunService.Stepped:Connect(function()
            if not State.isNoclip then 
                if _G.HDLE_NoclipStep then _G.HDLE_NoclipStep:Disconnect() _G.HDLE_NoclipStep = nil end
                return 
            end
            local char = player.Character
            if char then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then part.CanCollide = false end
                end
            end
        end)
    else
        if Btn then Btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60) end
        if _G.HDLE_NoclipStep then _G.HDLE_NoclipStep:Disconnect() _G.HDLE_NoclipStep = nil end
        local char = player.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    if part.Name == "HumanoidRootPart" or part.Name == "Head" or part.Name:find("Torso") then part.CanCollide = true end
                end
            end
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum:ChangeState(Enum.HumanoidStateType.Land) end
        end
    end
end

function Controllers.ToggleFly(State, Btn, SpeedInp)
    State.isFlying = not State.isFlying
    local char = player.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not root or not hum then State.isFlying = false return end

    if State.isFlying then
        if Btn then Btn.BackgroundColor3 = Color3.fromRGB(0, 140, 65) end
        hum.PlatformStand = true
        local bv = Instance.new("BodyVelocity", root)
        bv.Name = "HDLE_FlyBV" bv.MaxForce = Vector3.new(9e9, 9e9, 9e9) bv.Velocity = Vector3.zero
        local bg = Instance.new("BodyGyro", root)
        bg.Name = "HDLE_FlyBG" bg.P = 9e4 bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9) bg.CFrame = root.CFrame
        
        _G.HDLE_FlyStep = RunService.RenderStepped:Connect(function()
            if not State.isFlying then _G.HDLE_FlyStep:Disconnect() return end
            local speed = tonumber(SpeedInp.Text) or 50
            bv.Velocity = hum.MoveDirection * speed
            bg.CFrame = workspace.CurrentCamera.CFrame
        end)
    else
        if Btn then Btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60) end
        hum.PlatformStand = false
        if root:FindFirstChild("HDLE_FlyBV") then root.HDLE_FlyBV:Destroy() end
        if root:FindFirstChild("HDLE_FlyBG") then root.HDLE_FlyBG:Destroy() end
        if _G.HDLE_FlyStep then _G.HDLE_FlyStep:Disconnect() end
    end
end

-- ==============================================================
-- [SHARED LOGIC SETUPS]
-- ==============================================================
local function SetupGroupsLogic(PageContainer, S, ShowPage)
    local GroupsPage = Instance.new("Frame", PageContainer)
    GroupsPage.Size=UDim2.new(1,0,1,0) GroupsPage.BackgroundTransparency=1 GroupsPage.Visible=false
    
    local GrpScroll = Instance.new("ScrollingFrame", GroupsPage)
    GrpScroll.Size=UDim2.new(1,-10,1,-60) GrpScroll.Position=UDim2.new(0,5,0,5)
    GrpScroll.BackgroundTransparency=1 GrpScroll.ScrollBarThickness=2
    local GrpList = Instance.new("UIListLayout", GrpScroll) GrpList.Padding=UDim.new(0,5)
    
    -- [Logic Re-attached]
    return GroupsPage
end

local function SetupTrackerLogic(PageContainer, S, ShowPage)
    local TrackerPage = Instance.new("Frame", PageContainer)
    TrackerPage.Size=UDim2.new(1,0,1,0) TrackerPage.BackgroundTransparency=1 TrackerPage.Visible=false
    
    local TrkScroll = Instance.new("ScrollingFrame", TrackerPage)
    TrkScroll.Size=UDim2.new(1,-10,1,-10) TrkScroll.Position=UDim2.new(0,5,0,5)
    TrkScroll.BackgroundTransparency=1 TrkScroll.ScrollBarThickness=2
    local TrkList = Instance.new("UIListLayout", TrkScroll) TrkList.Padding=UDim.new(0,5)
    
    return TrackerPage
end

-- ==============================================================
-- [MOBILE UI BUILDER]
-- ==============================================================
local function BuildMobileGUI(ScreenGui, State, S)
    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, State.frameW, 0, State.frameH)
    MainFrame.Position = UDim2.new(0.5, -State.frameW/2, 0.5, -State.frameH/2)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
    MakeCorner(MainFrame, 20) MakeStroke(MainFrame, Color3.fromRGB(0,255,150), 1.5)

    local DoMinimize = BuildFloatingBubble(MainFrame, ScreenGui)

    local TabBar = Instance.new("Frame", MainFrame)
    TabBar.Size = UDim2.new(1, -20, 0, 50) TabBar.Position = UDim2.new(0, 10, 0, 10)
    TabBar.BackgroundTransparency = 1
    local TabLayout = Instance.new("UIListLayout", TabBar)
    TabLayout.FillDirection = Enum.FillDirection.Horizontal TabLayout.Padding = UDim.new(0,8)
    TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local PageContainer = Instance.new("Frame", MainFrame)
    PageContainer.Size = UDim2.new(1, -20, 1, -80) PageContainer.Position = UDim2.new(0, 10, 0, 70)
    PageContainer.BackgroundTransparency = 1 PageContainer.ClipsDescendants = true

    local Pages = {}
    local function ShowPage(name)
        for k, v in pairs(Pages) do v.Visible = (k == name) end
    end

    local tabs = {{n="move", i="🏃"}, {n="combat", i="🎯"}, {n="groups", i="📍"}, {n="tracker", i="👁"}}
    for _, t in ipairs(tabs) do
        local b = Instance.new("TextButton", TabBar)
        b.Size = UDim2.new(0, 50, 0, 45) b.BackgroundColor3 = Color3.fromRGB(30,30,30)
        b.Text = t.i b.TextSize = 22 b.TextColor3 = Color3.new(1,1,1)
        MakeCorner(b, 12)
        b.MouseButton1Click:Connect(function() ShowPage(t.n) end)
    end

    local P_Move = Instance.new("ScrollingFrame", PageContainer)
    P_Move.Size=UDim2.new(1,0,1,0) P_Move.BackgroundTransparency=1 P_Move.Visible=true
    local ML = Instance.new("UIListLayout", P_Move) ML.Padding=UDim.new(0,10) ML.HorizontalAlignment=Enum.HorizontalAlignment.Center
    Pages.move = P_Move
    
    local BtnFly = MakeBtn(P_Move, Color3.fromRGB(35,35,45), 1, S) BtnFly.Text = T("fly")
    local InpFly = MakeInput(P_Move, "50", 2, S)
    BtnFly.MouseButton1Click:Connect(function() Controllers.ToggleFly(State, BtnFly, InpFly) end)

    Pages.groups = SetupGroupsLogic(PageContainer, S, ShowPage)
    Pages.tracker = SetupTrackerLogic(PageContainer, S, ShowPage)

    ShowPage("move")
end

local function BuildPCGUI(ScreenGui, State, S)
    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, State.frameW, 0, State.frameH)
    MainFrame.Position = UDim2.new(DESIGN.MainFrame.PosScaleX, 0, DESIGN.MainFrame.PosScaleY, 0)
    MainFrame.BackgroundColor3 = DESIGN.MainFrame.Background
    MakeCorner(MainFrame, DESIGN.MainFrame.CornerRadius)
    MakeStroke(MainFrame, Color3.fromRGB(0,255,150), 1)

    local DoMinimize = BuildMinimizeSystem(MainFrame, ScreenGui)
    
    local Sidebar = Instance.new("Frame", MainFrame)
    Sidebar.Size = UDim2.new(0, 100, 1, -40) Sidebar.Position = UDim2.new(0, 10, 0, 30)
    Sidebar.BackgroundTransparency = 1
    
    local PageContainer = Instance.new("Frame", MainFrame)
    PageContainer.Size = UDim2.new(1, -120, 1, -40) PageContainer.Position = UDim2.new(0, 110, 0, 30)
    PageContainer.BackgroundTransparency = 1
    
    local Pages = {}
    local function ShowPage(name)
        for k, v in pairs(Pages) do v.Visible = (k == name) end
    end
    
    Pages.move = Instance.new("ScrollingFrame", PageContainer)
    Pages.move.Size = UDim2.new(1,0,1,0) Pages.move.BackgroundTransparency=1
    
    Pages.groups = SetupGroupsLogic(PageContainer, S, ShowPage)
    Pages.tracker = SetupTrackerLogic(PageContainer, S, ShowPage)
    
    ShowPage("move")
end

-- ==============================================================
-- [MAIN ROUTER]
-- ==============================================================
function BuildMainGUI(token)
    if token ~= _G_TOKEN then player:Kick("Security") return end
    
    local isMob = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
    State.isMobile = isMob
    
    local S0 = CalcSizes(State.frameW, State.frameH)

    local ScreenGui = game.CoreGui:FindFirstChild("HDLE_MainGUI")
    if ScreenGui then ScreenGui:Destroy() end
    ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    ScreenGui.Name = "HDLE_MainGUI" ScreenGui.ResetOnSpawn = false ScreenGui.IgnoreGuiInset = true

    if isMob then
        BuildMobileGUI(ScreenGui, State, S0)
    else
        BuildPCGUI(ScreenGui, State, S0)
    end
end
    local Btn3D      = MakeBtn(MoveScroll, nil, 5)
    local BtnLock    = MakeBtn(MoveScroll, nil, 6)
    local BtnTlp     = MakeBtn(MoveScroll, nil, 7)
    local BtnNoclip  = MakeBtn(MoveScroll, nil, 8.5)

    -- صفحة الرمي مع القوة
    local ThrRow = Instance.new("Frame", MoveScroll)
    ThrRow.LayoutOrder=8
    ThrRow.Size=UDim2.new(1,0,0,S0.btnH)
    ThrRow.BackgroundTransparency=1

    local BtnThr = Instance.new("TextButton", ThrRow)
    BtnThr.Size=UDim2.new(0.68,-3,1,0)
    BtnThr.Position=UDim2.new(0,0,0,0)
    BtnThr.BackgroundColor3=Color3.fromRGB(60,60,60)
    BtnThr.TextColor3=Color3.new(1,1,1)
    BtnThr.Font=Enum.Font.SourceSansBold
    BtnThr.TextSize=S0.fontNormal
    BtnThr.Text=T("thr")
    BtnThr.TextWrapped=false
    MakeCorner(BtnThr,8)

    local ThrPowerInp = Instance.new("TextBox", ThrRow)
    ThrPowerInp.Size=UDim2.new(0.32,-3,1,0)
    ThrPowerInp.Position=UDim2.new(0.68,3,0,0)
    ThrPowerInp.BackgroundColor3=Color3.fromRGB(15,15,15)
    ThrPowerInp.TextColor3=Color3.fromRGB(0,255,100)
    ThrPowerInp.Text="50"
    ThrPowerInp.PlaceholderText="Pwr"
    ThrPowerInp.Font=Enum.Font.SourceSans
    ThrPowerInp.TextSize=S0.fontNormal
    ThrPowerInp.ClearTextOnFocus=false
    ThrPowerInp.TextWrapped=false
    MakeCorner(ThrPowerInp,8)

    -- صفحة المشي مع السرعة
    local WlkRow = Instance.new("Frame", MoveScroll)
    WlkRow.LayoutOrder=9
    WlkRow.Size=UDim2.new(1,0,0,S0.btnH)
    WlkRow.BackgroundTransparency=1

    local BtnWlk = Instance.new("TextButton", WlkRow)
    BtnWlk.Size=UDim2.new(0.68,-3,1,0)
    BtnWlk.Position=UDim2.new(0,0,0,0)
    BtnWlk.BackgroundColor3=Color3.fromRGB(60,60,60)
    BtnWlk.TextColor3=Color3.new(1,1,1)
    BtnWlk.Font=Enum.Font.SourceSansBold
    BtnWlk.TextSize=S0.fontNormal
    BtnWlk.Text=T("wlk")
    BtnWlk.TextWrapped=false
    MakeCorner(BtnWlk,8)

    local WlkSpeedInp = Instance.new("TextBox", WlkRow)
    WlkSpeedInp.Size=UDim2.new(0.32,-3,1,0)
    WlkSpeedInp.Position=UDim2.new(0.68,3,0,0)
    WlkSpeedInp.BackgroundColor3=Color3.fromRGB(15,15,15)
    WlkSpeedInp.TextColor3=Color3.fromRGB(0,255,100)
    WlkSpeedInp.Text="16"
    WlkSpeedInp.PlaceholderText="Spd"
    WlkSpeedInp.Font=Enum.Font.SourceSans
    WlkSpeedInp.TextSize=S0.fontNormal
    WlkSpeedInp.ClearTextOnFocus=false
    WlkSpeedInp.TextWrapped=false
    MakeCorner(WlkSpeedInp,8)

    -- صفحة الطيران مع السرعة في نفس السطر
    local FlyRow = Instance.new("Frame", MoveScroll)
    FlyRow.LayoutOrder=10
    FlyRow.Size=UDim2.new(1,0,0,S0.btnH)
    FlyRow.BackgroundTransparency=1

    local BtnFly = Instance.new("TextButton", FlyRow)
    BtnFly.Size=UDim2.new(0.68,-3,1,0)
    BtnFly.Position=UDim2.new(0,0,0,0)
    BtnFly.BackgroundColor3=Color3.fromRGB(60,60,60)
    BtnFly.TextColor3=Color3.new(1,1,1)
    BtnFly.Font=Enum.Font.SourceSansBold
    BtnFly.TextSize=S0.fontNormal
    BtnFly.Text=T("fly")
    BtnFly.TextWrapped=false
    MakeCorner(BtnFly,8)

    local FlySpeedInp = Instance.new("TextBox", FlyRow)
    FlySpeedInp.Size=UDim2.new(0.32,-3,1,0)
    FlySpeedInp.Position=UDim2.new(0.68,3,0,0)
    FlySpeedInp.BackgroundColor3=Color3.fromRGB(15,15,15)
    FlySpeedInp.TextColor3=Color3.fromRGB(0,255,100)
    FlySpeedInp.Text="50"
    FlySpeedInp.PlaceholderText="Speed"
    FlySpeedInp.Font=Enum.Font.SourceSans
    FlySpeedInp.TextSize=S0.fontNormal
    FlySpeedInp.ClearTextOnFocus=false
    FlySpeedInp.TextWrapped=false
    MakeCorner(FlySpeedInp,8)

    local BtnESP     = MakeBtn(MoveScroll, nil, 11)

    local TimeText = Instance.new("TextLabel", MoveScroll)
    TimeText.LayoutOrder=12 TimeText.Size=UDim2.new(1,0,0,S0.timerH)
    TimeText.BackgroundTransparency=1 TimeText.TextColor3=Color3.fromRGB(0,255,150)
    TimeText.TextSize=S0.fontTimer TimeText.Font=Enum.Font.SourceSans
    TimeText.TextXAlignment=Enum.TextXAlignment.Center TimeText.TextWrapped=false
    TimeText.Text=T("expires").."00:00:00"

    -- تحديثات (سطر أسفل المؤقت)
    local UpdatesText = Instance.new("TextLabel", MoveScroll)
    UpdatesText.LayoutOrder=13
    UpdatesText.Size=UDim2.new(1,0,0,S0.timerH)
    UpdatesText.BackgroundTransparency=1
    UpdatesText.TextColor3=Color3.fromRGB(200,200,200)
    UpdatesText.TextSize=S0.fontSmall
    UpdatesText.Font=Enum.Font.SourceSans
    UpdatesText.TextXAlignment=Enum.TextXAlignment.Center
    UpdatesText.TextWrapped=false
    UpdatesText.Text="v"..VERSION.." | "..T("updates")

    -- ============================================================
    -- صفحة 2: قائمة المجموعات (Groups)
    -- ============================================================
    local GroupsPage = Instance.new("Frame", PageContainer)
    GroupsPage.Size=UDim2.new(1,0,1,0) GroupsPage.BackgroundTransparency=1 GroupsPage.Visible=false

    -- شريط العنوان
    local GrpTitleBar = Instance.new("Frame", GroupsPage)
    GrpTitleBar.Size=UDim2.new(1,0,0,S0.titleH) GrpTitleBar.BackgroundTransparency=1

    local GrpTitleLbl = Instance.new("TextLabel", GrpTitleBar)
    GrpTitleLbl.Size=UDim2.new(1,-(S0.navBtnW+8),1,0) GrpTitleLbl.Position=UDim2.new(0,6,0,0)
    GrpTitleLbl.BackgroundTransparency=1 GrpTitleLbl.TextColor3=Color3.fromRGB(0,200,150)
    GrpTitleLbl.TextSize=S0.fontTitle GrpTitleLbl.Font=Enum.Font.SourceSansBold
    GrpTitleLbl.TextXAlignment=Enum.TextXAlignment.Left GrpTitleLbl.TextWrapped=false
    GrpTitleLbl.Text=T("loc_title")

    -- زر رجوع لصفحة الحركة
    local GrpBackBtn = Instance.new("TextButton", GrpTitleBar)
    GrpBackBtn.Size=UDim2.new(0,S0.navBtnW,0,S0.navBtnH)
    GrpBackBtn.Position=UDim2.new(1,-(S0.navBtnW+4),0.5,-S0.navBtnH/2)
    GrpBackBtn.BackgroundColor3=Color3.fromRGB(130,50,0)
    GrpBackBtn.TextColor3=Color3.new(1,1,1) GrpBackBtn.Font=Enum.Font.SourceSansBold
    GrpBackBtn.TextSize=S0.fontNormal GrpBackBtn.Text="◀" GrpBackBtn.TextWrapped=false
    MakeCorner(GrpBackBtn,DESIGN.MinimizeBtn.CornerRadius)

    -- اسم الماب الحالي
    local GrpMapLbl = Instance.new("TextLabel", GroupsPage)
    GrpMapLbl.Size=UDim2.new(1,-12,0,S0.timerH) GrpMapLbl.Position=UDim2.new(0,6,0,S0.titleH+4)
    GrpMapLbl.BackgroundTransparency=1 GrpMapLbl.TextColor3=Color3.fromRGB(0,220,120)
    GrpMapLbl.TextSize=S0.fontSmall GrpMapLbl.Font=Enum.Font.SourceSans
    GrpMapLbl.TextXAlignment=Enum.TextXAlignment.Left GrpMapLbl.TextWrapped=false
    GrpMapLbl.Text="🗺 "..currentMap

    -- قائمة المجموعات
    local grpListTop = S0.titleH + S0.timerH + 10
    local GrpScroll = Instance.new("ScrollingFrame", GroupsPage)
    GrpScroll.Size=UDim2.new(1,-12,1,-(grpListTop+S0.btnH+10))
    GrpScroll.Position=UDim2.new(0,6,0,grpListTop)
    GrpScroll.BackgroundColor3=Color3.fromRGB(14,14,14) GrpScroll.BackgroundTransparency=0.3
    GrpScroll.BorderSizePixel=0 GrpScroll.ScrollBarThickness=3
    GrpScroll.ScrollBarImageColor3=Color3.fromRGB(0,255,150)
    GrpScroll.CanvasSize=UDim2.new(0,0,0,0) GrpScroll.ClipsDescendants=true
    MakeCorner(GrpScroll,8)

    local GrpListLayout = Instance.new("UIListLayout", GrpScroll)
    GrpListLayout.Padding=UDim.new(0,6) GrpListLayout.SortOrder=Enum.SortOrder.LayoutOrder

    local GrpPad = Instance.new("UIPadding", GrpScroll)
    GrpPad.PaddingTop=UDim.new(0,5) GrpPad.PaddingLeft=UDim.new(0,4)
    GrpPad.PaddingRight=UDim.new(0,4) GrpPad.PaddingBottom=UDim.new(0,5)

    local NoGrpLbl = Instance.new("TextLabel", GrpScroll)
    NoGrpLbl.Size=UDim2.new(1,0,0,70) NoGrpLbl.BackgroundTransparency=1
    NoGrpLbl.TextColor3=Color3.fromRGB(100,100,130)
    NoGrpLbl.TextSize=S0.fontSmall
    NoGrpLbl.Font=Enum.Font.SourceSans NoGrpLbl.TextXAlignment=Enum.TextXAlignment.Center
    NoGrpLbl.TextWrapped=true NoGrpLbl.Visible=false -- سيتم التحكم بها من RebuildGroupsList
    NoGrpLbl.Text=T("loc_nogrp")

    -- زر "أضف موقع الحالي لمجموعة الماب"
    local GrpAddBtn = Instance.new("TextButton", GroupsPage)
    GrpAddBtn.Size=UDim2.new(1,-12,0,S0.btnH) GrpAddBtn.Position=UDim2.new(0,6,1,-(S0.btnH+5))
    GrpAddBtn.BackgroundColor3=Color3.fromRGB(0,120,190) GrpAddBtn.TextColor3=Color3.new(1,1,1)
    GrpAddBtn.Font=Enum.Font.SourceSansBold GrpAddBtn.TextSize=S0.fontSmall
    GrpAddBtn.Text="➕ "..T("loc_add").." + 💾"
    GrpAddBtn.TextWrapped=false
    MakeCorner(GrpAddBtn,8)

    -- ============================================================
    -- صفحة 3: تفاصيل مجموعة (GroupDetail)
    -- ============================================================
    local DetailPage = Instance.new("Frame", PageContainer)
    DetailPage.Size=UDim2.new(1,0,1,0) DetailPage.BackgroundTransparency=1 DetailPage.Visible=false

    local DetTitleBar = Instance.new("Frame", DetailPage)
    DetTitleBar.Size=UDim2.new(1,0,0,S0.titleH) DetTitleBar.BackgroundTransparency=1

    local DetTitleLbl = Instance.new("TextLabel", DetTitleBar)
    DetTitleLbl.Size=UDim2.new(1,-(S0.navBtnW+8),1,0) DetTitleLbl.Position=UDim2.new(0,6,0,0)
    DetTitleLbl.BackgroundTransparency=1 DetTitleLbl.TextColor3=Color3.fromRGB(0,200,150)
    DetTitleLbl.TextSize=S0.fontTitle DetTitleLbl.Font=Enum.Font.SourceSansBold
    DetTitleLbl.TextXAlignment=Enum.TextXAlignment.Left DetTitleLbl.TextWrapped=false
    DetTitleLbl.TextTruncate=Enum.TextTruncate.AtEnd DetTitleLbl.Text="📦"

    local DetBackBtn = Instance.new("TextButton", DetTitleBar)
    DetBackBtn.Size=UDim2.new(0,S0.navBtnW,0,S0.navBtnH)
    DetBackBtn.Position=UDim2.new(1,-(S0.navBtnW+4),0.5,-S0.navBtnH/2)
    DetBackBtn.BackgroundColor3=Color3.fromRGB(0,100,180)
    DetBackBtn.TextColor3=Color3.new(1,1,1) DetBackBtn.Font=Enum.Font.SourceSansBold
    DetBackBtn.TextSize=S0.fontNormal DetBackBtn.Text="📌" DetBackBtn.TextWrapped=false
    MakeCorner(DetBackBtn,DESIGN.MinimizeBtn.CornerRadius)

    -- بطاقة معلومات المجموعة
    local DetInfoBar = Instance.new("Frame", DetailPage)
    DetInfoBar.Size=UDim2.new(1,-12,0,S0.timerH+4) DetInfoBar.Position=UDim2.new(0,6,0,S0.titleH+4)
    DetInfoBar.BackgroundColor3=Color3.fromRGB(14,14,14) DetInfoBar.BackgroundTransparency=0.3 DetInfoBar.BorderSizePixel=0
    MakeCorner(DetInfoBar,6)

    local DetCountLbl = Instance.new("TextLabel", DetInfoBar)
    DetCountLbl.Size=UDim2.new(1,-(124),1,0) DetCountLbl.Position=UDim2.new(0,4,0,0)
    DetCountLbl.BackgroundTransparency=1 DetCountLbl.TextColor3=Color3.fromRGB(180,180,200)
    DetCountLbl.TextSize=S0.fontTimer DetCountLbl.Font=Enum.Font.SourceSans
    DetCountLbl.TextXAlignment=Enum.TextXAlignment.Left DetCountLbl.TextWrapped=false DetCountLbl.Text=" "

    -- زر إضافة نقطة داخل صفحة التفاصيل (مطلوب)
    local DetAddBtn = Instance.new("TextButton", DetInfoBar)
    DetAddBtn.Size=UDim2.new(0,120,1,0)
    DetAddBtn.Position=UDim2.new(1,-124,0,0)
    DetAddBtn.BackgroundColor3=Color3.fromRGB(0,120,190)
    DetAddBtn.TextColor3=Color3.new(1,1,1)
    DetAddBtn.Font=Enum.Font.SourceSansBold
    DetAddBtn.TextSize=S0.fontSmall
    DetAddBtn.Text="➕ "..T("loc_add")
    DetAddBtn.TextWrapped=false
    MakeCorner(DetAddBtn,6)

    -- قائمة إحداثيات المجموعة
    local detListTop = S0.titleH + S0.timerH + 14
    local DetScroll = Instance.new("ScrollingFrame", DetailPage)
    DetScroll.Size=UDim2.new(1,-12,1,-(detListTop+S0.btnH+10))
    DetScroll.Position=UDim2.new(0,6,0,detListTop)
    DetScroll.BackgroundColor3=Color3.fromRGB(14,14,14) DetScroll.BackgroundTransparency=0.3
    DetScroll.BorderSizePixel=0 DetScroll.ScrollBarThickness=3
    DetScroll.ScrollBarImageColor3=Color3.fromRGB(0,255,150)
    DetScroll.CanvasSize=UDim2.new(0,0,0,0) DetScroll.ClipsDescendants=true
    MakeCorner(DetScroll,8)

    local DetListLayout = Instance.new("UIListLayout", DetScroll)
    DetListLayout.Padding=UDim.new(0,5) DetListLayout.SortOrder=Enum.SortOrder.LayoutOrder

    local DetPad = Instance.new("UIPadding", DetScroll)
    DetPad.PaddingTop=UDim.new(0,5) DetPad.PaddingLeft=UDim.new(0,4)
    DetPad.PaddingRight=UDim.new(0,4) DetPad.PaddingBottom=UDim.new(0,5)

    -- ============================================================
    -- صفحة 4: تتبع اللاعبين (Tracker)
    -- ============================================================
    local TrackerPage = Instance.new("Frame", PageContainer)
    TrackerPage.Size=UDim2.new(1,0,1,0) TrackerPage.BackgroundTransparency=1 TrackerPage.Visible=false

    local TrkTitleBar = Instance.new("Frame", TrackerPage)
    TrkTitleBar.Size=UDim2.new(1,0,0,S0.titleH) TrkTitleBar.BackgroundTransparency=1

    local TrkTitleLbl = Instance.new("TextLabel", TrkTitleBar)
    TrkTitleLbl.Size=UDim2.new(1,-(S0.navBtnW+8),1,0) TrkTitleLbl.Position=UDim2.new(0,6,0,0)
    TrkTitleLbl.BackgroundTransparency=1 TrkTitleLbl.TextColor3=Color3.fromRGB(255,80,140)
    TrkTitleLbl.TextSize=S0.fontTitle TrkTitleLbl.Font=Enum.Font.SourceSansBold
    TrkTitleLbl.TextXAlignment=Enum.TextXAlignment.Left TrkTitleLbl.TextWrapped=false
    TrkTitleLbl.Text=T("trk_title")

    local TrkBackBtn = Instance.new("TextButton", TrkTitleBar)
    TrkBackBtn.Size=UDim2.new(0,S0.navBtnW,0,S0.navBtnH)
    TrkBackBtn.Position=UDim2.new(1,-(S0.navBtnW+4),0.5,-S0.navBtnH/2)
    TrkBackBtn.BackgroundColor3=Color3.fromRGB(0,100,180)
    TrkBackBtn.TextColor3=Color3.new(1,1,1) TrkBackBtn.Font=Enum.Font.SourceSansBold
    TrkBackBtn.TextSize=S0.fontNormal TrkBackBtn.Text="◀" TrkBackBtn.TextWrapped=false
    MakeCorner(TrkBackBtn,DESIGN.MinimizeBtn.CornerRadius)

    local TrkStatusLbl = Instance.new("TextLabel", TrackerPage)
    TrkStatusLbl.Size=UDim2.new(1,-12,0,S0.btnH) TrkStatusLbl.Position=UDim2.new(0,6,0,S0.titleH+4)
    TrkStatusLbl.BackgroundColor3=Color3.fromRGB(14,14,14) TrkStatusLbl.BackgroundTransparency=0.3
    TrkStatusLbl.TextColor3=Color3.fromRGB(120,120,150) TrkStatusLbl.TextSize=S0.fontSmall
    TrkStatusLbl.Font=Enum.Font.SourceSans TrkStatusLbl.TextXAlignment=Enum.TextXAlignment.Left
    TrkStatusLbl.TextWrapped=false TrkStatusLbl.Text="⬤  "..T("trk_none") TrkStatusLbl.BorderSizePixel=0
    MakeCorner(TrkStatusLbl,8)

    local TrkStopBtn = Instance.new("TextButton", TrackerPage)
    TrkStopBtn.Size=UDim2.new(0,74,0,S0.btnH-8) TrkStopBtn.Position=UDim2.new(1,-82,0,S0.titleH+6)
    TrkStopBtn.BackgroundColor3=Color3.fromRGB(170,25,25) TrkStopBtn.TextColor3=Color3.new(1,1,1)
    TrkStopBtn.Font=Enum.Font.SourceSansBold TrkStopBtn.TextSize=S0.fontSmall
    TrkStopBtn.Text=T("trk_stop") TrkStopBtn.Visible=false TrkStopBtn.TextWrapped=false
    MakeCorner(TrkStopBtn,6)

    local trkPosIsFront = false

    local TrkSearch = Instance.new("TextBox", TrackerPage)
    TrkSearch.Size=UDim2.new(0.45,-9,0,S0.inputH) TrkSearch.Position=UDim2.new(0,6,0,S0.titleH+S0.btnH+10)
    TrkSearch.BackgroundColor3=Color3.fromRGB(14,14,14) TrkSearch.BackgroundTransparency=0.3
    TrkSearch.TextColor3=Color3.new(1,1,1) TrkSearch.Text="" TrkSearch.PlaceholderText=T("trk_search")
    TrkSearch.Font=Enum.Font.SourceSans TrkSearch.TextSize=S0.fontSmall TrkSearch.ClearTextOnFocus=false
    TrkSearch.TextWrapped=false TrkSearch.BorderSizePixel=0
    MakeCorner(TrkSearch,8)

    local TrkPosToggleBtn = Instance.new("TextButton", TrackerPage)
    TrkPosToggleBtn.Size = UDim2.new(0.3,-6, 0, S0.inputH)
    TrkPosToggleBtn.Position = UDim2.new(0.45, 3, 0, S0.titleH+S0.btnH+10)
    TrkPosToggleBtn.BackgroundColor3 = Color3.fromRGB(160, 80, 20)
    TrkPosToggleBtn.TextColor3 = Color3.new(1,1,1)
    TrkPosToggleBtn.Font = Enum.Font.SourceSansBold
    TrkPosToggleBtn.TextSize = S0.fontSmall
    TrkPosToggleBtn.Text = "Back 🡇"
    MakeCorner(TrkPosToggleBtn, 8)

    local TrkDistInp = Instance.new("TextBox", TrackerPage)
    TrkDistInp.Size = UDim2.new(0.25,-6, 0, S0.inputH)
    TrkDistInp.Position = UDim2.new(0.75, 3, 0, S0.titleH+S0.btnH+10)
    TrkDistInp.BackgroundColor3 = Color3.fromRGB(15,15,15)
    TrkDistInp.TextColor3 = Color3.fromRGB(0,255,100)
    TrkDistInp.Text = "5.5"
    TrkDistInp.PlaceholderText = "Dist"
    TrkDistInp.Font = Enum.Font.SourceSans
    TrkDistInp.TextSize = S0.fontSmall
    TrkDistInp.ClearTextOnFocus = false
    TrkDistInp.TextWrapped = false
    MakeCorner(TrkDistInp, 8)

    TrkPosToggleBtn.MouseButton1Click:Connect(function()
        trkPosIsFront = not trkPosIsFront
        if trkPosIsFront then
            TrkPosToggleBtn.Text = "Front 🡅"
            TrkPosToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 120, 180)
        else
            TrkPosToggleBtn.Text = "Back 🡇"
            TrkPosToggleBtn.BackgroundColor3 = Color3.fromRGB(160, 80, 20)
        end
    end)

    local cancelOnFall = false
    local cancelOnUp = false

    local TrkCancelFallBtn = Instance.new("TextButton", TrackerPage)
    TrkCancelFallBtn.Size = UDim2.new(0.48,-6, 0, S0.inputH)
    TrkCancelFallBtn.Position = UDim2.new(0, 6, 0, S0.titleH+S0.btnH+S0.inputH+15)
    TrkCancelFallBtn.BackgroundColor3 = Color3.fromRGB(160, 35, 90)
    TrkCancelFallBtn.TextColor3 = Color3.new(1,1,1)
    TrkCancelFallBtn.Font = Enum.Font.SourceSansBold
    TrkCancelFallBtn.TextSize = S0.fontSmall
    TrkCancelFallBtn.Text = "Stop on Fall [OFF]"
    MakeCorner(TrkCancelFallBtn, 6)

    local TrkCancelUpBtn = Instance.new("TextButton", TrackerPage)
    TrkCancelUpBtn.Size = UDim2.new(0.48,-6, 0, S0.inputH)
    TrkCancelUpBtn.Position = UDim2.new(0.5, 3, 0, S0.titleH+S0.btnH+S0.inputH+15)
    TrkCancelUpBtn.BackgroundColor3 = Color3.fromRGB(160, 35, 90)
    TrkCancelUpBtn.TextColor3 = Color3.new(1,1,1)
    TrkCancelUpBtn.Font = Enum.Font.SourceSansBold
    TrkCancelUpBtn.TextSize = S0.fontSmall
    TrkCancelUpBtn.Text = "Stop on UP [OFF]"
    MakeCorner(TrkCancelUpBtn, 6)

    TrkCancelFallBtn.MouseButton1Click:Connect(function()
        cancelOnFall = not cancelOnFall
        TrkCancelFallBtn.Text = cancelOnFall and "Stop on Fall [ON]" or "Stop on Fall [OFF]"
        TrkCancelFallBtn.BackgroundColor3 = cancelOnFall and Color3.fromRGB(0, 140, 65) or Color3.fromRGB(160, 35, 90)
    end)
    TrkCancelUpBtn.MouseButton1Click:Connect(function()
        cancelOnUp = not cancelOnUp
        TrkCancelUpBtn.Text = cancelOnUp and "Stop on UP [ON]" or "Stop on UP [OFF]"
        TrkCancelUpBtn.BackgroundColor3 = cancelOnUp and Color3.fromRGB(0, 140, 65) or Color3.fromRGB(160, 35, 90)
    end)

    local trkListTop = S0.titleH+S0.btnH+(S0.inputH*2)+22
    local TrkScroll = Instance.new("ScrollingFrame", TrackerPage)
    TrkScroll.Size=UDim2.new(1,-12,1,-(trkListTop+8)) TrkScroll.Position=UDim2.new(0,6,0,trkListTop)
    TrkScroll.BackgroundColor3=Color3.fromRGB(14,14,14) TrkScroll.BackgroundTransparency=0.3
    TrkScroll.BorderSizePixel=0 TrkScroll.ScrollBarThickness=3
    TrkScroll.ScrollBarImageColor3=Color3.fromRGB(255,80,140)
    TrkScroll.CanvasSize=UDim2.new(0,0,0,0) TrkScroll.ClipsDescendants=true
    MakeCorner(TrkScroll,8)

    local TrkList = Instance.new("UIListLayout", TrkScroll)
    TrkList.Padding=UDim.new(0,5) TrkList.SortOrder=Enum.SortOrder.Name

    local TrkPad = Instance.new("UIPadding", TrkScroll)
    TrkPad.PaddingTop=UDim.new(0,5) TrkPad.PaddingLeft=UDim.new(0,4) TrkPad.PaddingRight=UDim.new(0,4)

    TrkPad.PaddingBottom=UDim.new(0,5)

    local NoPlayLbl = Instance.new("TextLabel", TrkScroll)
    NoPlayLbl.Size=UDim2.new(1,0,0,50) NoPlayLbl.BackgroundTransparency=1
    NoPlayLbl.TextColor3=Color3.fromRGB(100,100,130) NoPlayLbl.TextSize=S0.fontSmall
    NoPlayLbl.Font=Enum.Font.SourceSans NoPlayLbl.TextXAlignment=Enum.TextXAlignment.Center
    NoPlayLbl.TextWrapped=true NoPlayLbl.Visible=true NoPlayLbl.Text=T("trk_noplay")

    -- ============================================================
    -- صفحة 5: موديول القتال (Combat)
    -- ============================================================
    local CombatPage = Instance.new("Frame", PageContainer)
    CombatPage.Size=UDim2.new(1,0,1,0) CombatPage.BackgroundTransparency=1 CombatPage.Visible=false

    local CmbTitleBar = Instance.new("Frame", CombatPage)
    CmbTitleBar.Size=UDim2.new(1,0,0,S0.titleH) CmbTitleBar.BackgroundTransparency=1

    local CmbTitleLbl = Instance.new("TextLabel", CmbTitleBar)
    CmbTitleLbl.Size=UDim2.new(1,-(S0.navBtnW+8),1,0) CmbTitleLbl.Position=UDim2.new(0,6,0,0)
    CmbTitleLbl.BackgroundTransparency=1 CmbTitleLbl.TextColor3=Color3.fromRGB(200,80,0)
    CmbTitleLbl.TextSize=S0.fontTitle CmbTitleLbl.Font=Enum.Font.SourceSansBold
    CmbTitleLbl.TextXAlignment=Enum.TextXAlignment.Left CmbTitleLbl.TextWrapped=false
    CmbTitleLbl.Text=T("cmb_title")

    local CmbBackBtn = Instance.new("TextButton", CmbTitleBar)
    CmbBackBtn.Size=UDim2.new(0,S0.navBtnW,0,S0.navBtnH)
    CmbBackBtn.Position=UDim2.new(1,-(S0.navBtnW+4),0.5,-S0.navBtnH/2)
    CmbBackBtn.BackgroundColor3=Color3.fromRGB(0,100,180)
    CmbBackBtn.TextColor3=Color3.new(1,1,1) CmbBackBtn.Font=Enum.Font.SourceSansBold
    CmbBackBtn.TextSize=S0.fontNormal CmbBackBtn.Text="◀" CmbBackBtn.TextWrapped=false
    MakeCorner(CmbBackBtn,DESIGN.MinimizeBtn.CornerRadius)

    local CmbScroll = Instance.new("ScrollingFrame", CombatPage)
    CmbScroll.Size = UDim2.new(1, 0, 1, -(S0.titleH+10))
    CmbScroll.Position = UDim2.new(0, 0, 0, S0.titleH+5)
    CmbScroll.BackgroundTransparency = 1 CmbScroll.ScrollBarThickness = 3
    CmbScroll.ScrollBarImageColor3 = Color3.fromRGB(200,80,0)

    local CmbLayout = Instance.new("UIListLayout", CmbScroll)
    CmbLayout.Padding = UDim.new(0, 6) CmbLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    CmbLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        CmbScroll.CanvasSize = UDim2.new(0, 0, 0, CmbLayout.AbsoluteContentSize.Y + 20)
    end)
    local CmbPad = Instance.new("UIPadding", CmbScroll)
    CmbPad.PaddingLeft=UDim.new(0,6) CmbPad.PaddingRight=UDim.new(0,6)

    local combatUpdateFuncs = {}

    -- Helper Create Toggle with Keybind for Combat
    local function CreateCToggleWithBind(locKey, settingTable, settingKey, bindKeySetting, parent)
        local S0 = CalcSizes(State.frameW, State.frameH)
        local Container = Instance.new("Frame", parent)
        Container.Size = UDim2.new(1, 0, 0, S0.btnH)
        Container.BackgroundTransparency = 1
        
        local btn = MakeBtn(Container, Color3.fromRGB(40,40,40), 1)
        btn.Size = UDim2.new(1, -(S0.btnH + 5), 1, 0)
        btn.Position = UDim2.new(0, 0, 0, 0)
        
        local bindBtn = Instance.new("TextButton", Container)
        bindBtn.Size = UDim2.new(0, S0.btnH, 0, S0.btnH)
        bindBtn.Position = UDim2.new(1, -S0.btnH, 0, 0)
        bindBtn.BackgroundColor3 = Color3.fromRGB(60, 40, 80)
        bindBtn.TextColor3 = Color3.new(1,1,1)
        bindBtn.Font = Enum.Font.SourceSansBold
        bindBtn.TextSize = S0.fontSmall
        MakeCorner(bindBtn, 8)
        
        local waitingForBind = false
        
        local function UpdateBindText()
            local key = settingTable[bindKeySetting]
            if waitingForBind then
                bindBtn.Text = "..."
                bindBtn.BackgroundColor3 = Color3.fromRGB(100, 60, 120)
            else
                local keyText = key and (typeof(key) == "EnumItem" and key.Name or tostring(key)) or "None"
                bindBtn.Text = keyText == "None" and "⌨" or string.sub(keyText, 1, 3)
                bindBtn.BackgroundColor3 = Color3.fromRGB(60, 40, 80)
            end
        end
        
        bindBtn.MouseButton1Click:Connect(function()
            if waitingForBind then return end
            task.wait(0.1) -- تأخير لمنع التقاط الضغطة الحالية
            waitingForBind = true
            UpdateBindText()
            local conn
            conn = UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType ~= Enum.UserInputType.MouseMovement then
                    local newKey = (input.UserInputType == Enum.UserInputType.Keyboard) and input.KeyCode or input.UserInputType
                    if newKey == Enum.KeyCode.Escape or newKey == Enum.KeyCode.Backspace then
                        settingTable[bindKeySetting] = nil
                    else
                        settingTable[bindKeySetting] = newKey
                    end
                    waitingForBind = false
                    UpdateBindText()
                    if conn then conn:Disconnect() end
                    if SaveCombatSettings then SaveCombatSettings() end
                end
            end)
        end)
        UpdateBindText()
        
        local function Update()
            local status = settingTable[settingKey]
            btn.Text = T(locKey) .. ": " .. (status and T("on") or T("off"))
            btn.TextColor3 = status and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(200, 200, 200)
        end
        btn.MouseButton1Click:Connect(function()
            settingTable[settingKey] = not settingTable[settingKey]
            Update()
            if SaveCombatSettings then SaveCombatSettings() end
        end)
        Update()
        table.insert(combatUpdateFuncs, Update)
        
        return Container
    end

    -- Helper Create Toggle for Combat
    local function CreateCToggle(locKey, settingTable, settingKey, parent, onChange)
        local btn = MakeBtn(parent, Color3.fromRGB(40,40,40), 1)
        local function Update()
            local status = settingTable[settingKey]
            btn.Text = T(locKey) .. ": " .. (status and T("on") or T("off"))
            btn.TextColor3 = status and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(200, 200, 200)
        end
        btn.MouseButton1Click:Connect(function()
            settingTable[settingKey] = not settingTable[settingKey]
            if onChange then onChange(settingTable[settingKey]) end
            Update()
            if SaveCombatSettings then SaveCombatSettings() end
        end)
        Update()
        table.insert(combatUpdateFuncs, Update)
        return btn
    end

    local function UpdateAllCombatUI()
        for _, f in ipairs(combatUpdateFuncs) do f() end
    end

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.UserInputType == Enum.UserInputType.MouseMovement then return end
        
        local key = (input.UserInputType == Enum.UserInputType.Keyboard) and input.KeyCode or input.UserInputType
        local changed = false
        
        if key == State.Combat.Aimbot.AutoShootToggleKey and State.Combat.Aimbot.AutoShootToggleKey ~= nil then
            State.Combat.Aimbot.AutoShoot = not State.Combat.Aimbot.AutoShoot
            changed = true
        end
        
        if key == State.Combat.Aimbot.AutoLockToggleKey and State.Combat.Aimbot.AutoLockToggleKey ~= nil then
            State.Combat.Aimbot.AutoLock = not State.Combat.Aimbot.AutoLock
            changed = true
        end
        
        if changed then
            UpdateAllCombatUI()
            if SaveCombatSettings then SaveCombatSettings() end
        end
    end)

    -- Helper Create Slider for Combat
    local function CreateCSlider(locKey, min, max, settingTable, settingKey, parent)
        local Container = Instance.new("Frame", parent)
        Container.Size = UDim2.new(1, 0, 0, 50)
        Container.BackgroundTransparency = 1

        local Title = Instance.new("TextLabel", Container)
        Title.Size = UDim2.new(1, 0, 0, 20)
        Title.BackgroundTransparency = 1
        Title.Text = T(locKey) .. ": " .. settingTable[settingKey]
        Title.TextColor3 = Color3.fromRGB(180, 180, 180)
        Title.Font = Enum.Font.SourceSans Title.TextSize = S0.fontSmall

        local Bar = Instance.new("Frame", Container)
        Bar.Size = UDim2.new(1, -20, 0, 6) Bar.Position = UDim2.new(0, 10, 0, 30)
        Bar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        MakeCorner(Bar, 3)

        local Fill = Instance.new("Frame", Bar)
        Fill.Size = UDim2.new((settingTable[settingKey] - min) / (max - min), 0, 1, 0)
        Fill.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
        MakeCorner(Fill, 3)

        local function UpdateValue(input)
            local pos = math.clamp((input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
            local val = min + (max - min) * pos
            if locKey == "click_speed" then val = math.floor(val * 100) / 100 else val = math.floor(val) end
            settingTable[settingKey] = val
            Fill.Size = UDim2.new(pos, 0, 1, 0)
            Title.Text = T(locKey) .. ": " .. val
        end
        table.insert(combatUpdateFuncs, function() Title.Text = T(locKey) .. ": " .. settingTable[settingKey] end)

        Bar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                local conn
                conn = UserInputService.InputChanged:Connect(function(move)
                    if move.UserInputType == Enum.UserInputType.MouseMovement or move.UserInputType == Enum.UserInputType.Touch then
                        UpdateValue(move)
                    end
                end)
                UserInputService.InputEnded:Connect(function(up)
                    if up.UserInputType == Enum.UserInputType.MouseButton1 or up.UserInputType == Enum.UserInputType.Touch then
                        if conn then conn:Disconnect() end
                        if SaveCombatSettings then SaveCombatSettings() end
                    end
                end)
            end
        end)
    end

    -- Build Combat UI
    if isMob then
        CreateMobileToggle(CmbScroll, T("aim_enabled"), State.Combat.Aimbot, "Enabled", function(val)
            if val then
                -- استعادة منطق التشغيل الأول (Automation)
                local isFirst = true
                pcall(function()
                    if isfile and isfile("HDLE_Combat_Played.txt") then isFirst = false end
                end)
                if isFirst then
                    pcall(function() if writefile then writefile("HDLE_Combat_Played.txt", "played") end end)
                    State.Combat.ESP.Enabled = true
                    State.Combat.ESP.Boxes = true
                    State.Combat.ESP.Names = true
                    if EnablePlayerESP then EnablePlayerESP() end
                end
                UpdateAllCombatUI()
            end
        end)
        CreateMobileToggle(CmbScroll, T("auto_lock"), State.Combat.Aimbot, "AutoLock")
        CreateMobileToggle(CmbScroll, T("esp_enabled"), State.Combat.ESP, "Enabled")
        CreateMobileToggle(CmbScroll, T("esp_boxes"), State.Combat.ESP, "Boxes")
        CreateMobileToggle(CmbScroll, T("esp_names"), State.Combat.ESP, "Names")
    else
        CreateCToggle("aim_enabled", State.Combat.Aimbot, "Enabled", CmbScroll, function(val)
            -- ... existing first run logic
        end)
        if not isMobile then
            CreateCToggleWithBind("aim_auto", State.Combat.Aimbot, "AutoShoot", "AutoShootToggleKey", CmbScroll)
        end
        CreateCToggleWithBind("auto_lock", State.Combat.Aimbot, "AutoLock", "AutoLockToggleKey", CmbScroll)
        
        CreateCToggle("esp_enabled", State.Combat.ESP, "Enabled", CmbScroll)
        CreateCToggle("esp_boxes", State.Combat.ESP, "Boxes", CmbScroll)
        CreateCToggle("esp_names", State.Combat.ESP, "Names", CmbScroll)
    end

    CreateCSlider("fov_radius", 10, 800, State.Combat.Aimbot, "FOV_Radius", CmbScroll)
    CreateCSlider("click_speed", 0.01, 1, State.Combat.Aimbot, "Click_Speed", CmbScroll)
    CreateCSlider("aim_range", 50, 2500, State.Combat.Aimbot, "MaxDistance", CmbScroll)
    
    local PresetRow = Instance.new("Frame", CmbScroll)
    PresetRow.Size = UDim2.new(1, 0, 0, S0.btnH-8)
    PresetRow.BackgroundTransparency = 1
    local PresetLayout = Instance.new("UIListLayout", PresetRow)
    PresetLayout.FillDirection = Enum.FillDirection.Horizontal
    PresetLayout.Padding = UDim.new(0, 5)
    PresetLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local function MakePresetBtn(textKey, val)
        local b = Instance.new("TextButton", PresetRow)
        b.Size = UDim2.new(0.32, -3, 1, 0)
        b.BackgroundColor3 = Color3.fromRGB(60, 40, 80)
        b.TextColor3 = Color3.new(1, 1, 1)
        b.Font = Enum.Font.SourceSansBold
        b.TextSize = S0.fontSmall
        b.Text = T(textKey) .. " (" .. val .. ")"
        MakeCorner(b, 6)
        b.MouseButton1Click:Connect(function()
            State.Combat.Aimbot.MaxDistance = val
            UpdateAllCombatUI()
            if SaveCombatSettings then SaveCombatSettings() end
        end)
    end
    MakePresetBtn("range_near", 100)
    MakePresetBtn("range_mid", 400)
    MakePresetBtn("range_far", 1500)

    local PosBtn = MakeBtn(CmbScroll, Color3.fromRGB(40,40,40), 1)
    local function UpdatePosText()
        PosBtn.Text = T("pos_mode") .. (State.Combat.Aimbot.FOV_Position == "Center" and T("pos_center") or T("pos_mouse"))
    end
    table.insert(combatUpdateFuncs, UpdatePosText)
    PosBtn.MouseButton1Click:Connect(function()
        State.Combat.Aimbot.FOV_Position = (State.Combat.Aimbot.FOV_Position == "Center") and "Mouse" or "Center"
        UpdatePosText()
        if SaveCombatSettings then SaveCombatSettings() end
    end)
    UpdatePosText()

    if not isMobile then
        -- [الميزة المضافة: تحديد زر الإطلاق الذي سيقوم السكربت بضغطه تلقائياً]
        local ShootBtn = MakeBtn(CmbScroll, Color3.fromRGB(45, 45, 60), 1)
        local waitingForShoot = false
        local function UpdateShootText()
            local key = State.Combat.Aimbot.ShootKey
            local keyText = key and (typeof(key) == "EnumItem" and key.Name or tostring(key)) or "NONE"
            ShootBtn.Text = T("shoot_sel") .. (waitingForShoot and T("trigger_wait") or keyText)
            if waitingForShoot then 
                ShootBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100) 
                ShootBtn.TextColor3 = Color3.new(0,0,0)
            else 
                ShootBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 60) 
                ShootBtn.TextColor3 = Color3.new(1,1,1) 
            end
        end
        table.insert(combatUpdateFuncs, UpdateShootText)
        ShootBtn.MouseButton1Click:Connect(function()
            if waitingForShoot then return end
            task.wait(0.1) -- تأخير لمنع التقاط الضغطة الحالية
            waitingForShoot = true UpdateShootText()
            local conn
            conn = UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType ~= Enum.UserInputType.MouseMovement then
                    State.Combat.Aimbot.ShootKey = (input.UserInputType == Enum.UserInputType.Keyboard) and input.KeyCode or input.UserInputType
                    waitingForShoot = false UpdateShootText()
                    if conn then conn:Disconnect() end
                    if SaveCombatSettings then SaveCombatSettings() end
                end
            end)
        end)
        UpdateShootText()
    end

    -- Removed Auto-Shoot Position/Mode for Mobile

    CreateCToggle("esp_enabled", State.Combat.ESP, "Enabled", CmbScroll)
    CreateCToggle("esp_boxes", State.Combat.ESP, "Boxes", CmbScroll)
    CreateCToggle("esp_names", State.Combat.ESP, "Names", CmbScroll)

    -- ============================================================
    -- صفحة 5: الإعدادات (Mobile Only)
    -- ============================================================
    local SettingsPage = Instance.new("Frame", PageContainer)
    SettingsPage.Size=UDim2.new(1,0,1,0) SettingsPage.BackgroundTransparency=1 SettingsPage.Visible=false
    
    local SetScroll = Instance.new("ScrollingFrame", SettingsPage)
    SetScroll.Size=UDim2.new(1,0,1,0) SetScroll.BackgroundTransparency=1
    SetScroll.ScrollBarThickness=0 SetScroll.CanvasSize=UDim2.new(0,0,0,500)
    
    local SetList = Instance.new("UIListLayout", SetScroll)
    SetList.HorizontalAlignment=Enum.HorizontalAlignment.Center SetList.Padding=UDim.new(0,10)
    
    local SetPad = Instance.new("UIPadding", SetScroll)
    SetPad.PaddingLeft=UDim.new(0,15) SetPad.PaddingRight=UDim.new(0,15) SetPad.PaddingTop=UDim.new(0,10)

    -- [Navigation]
    local function ShowPage(name)
        State.currentPage   = name
        MovePage.Visible    = (name=="move")
        GroupsPage.Visible  = (name=="groups")
        DetailPage.Visible  = (name=="group_detail")
        TrackerPage.Visible = (name=="tracker")
        CombatPage.Visible  = (name=="combat")
        SettingsPage.Visible = (name=="settings")
    end

    -- Populate Settings Page (Mobile)
    if isMob then
        local LangBtn = Instance.new("TextButton", SetScroll)
        LangBtn.Size = UDim2.new(1, 0, 0, 50)
        LangBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
        LangBtn.Font = Enum.Font.SourceSansBold
        LangBtn.TextSize = 18
        LangBtn.TextColor3 = Color3.new(1,1,1)
        MakeCorner(LangBtn, 12)
        local function UpdLangT() LangBtn.Text = "🌐 " .. T("btn_lang") end
        UpdLangT()
        LangBtn.MouseButton1Click:Connect(function()
            State.lang = (State.lang == "AR") and "EN" or "AR"
            UpdLangT()
            -- Force GUI Rebuild for language change
            pcall(function() BuildMainGUI(_G_TOKEN) end)
        end)

        CreateMobileToggle(SetScroll, "Show 3D Path", State, "show3DPath")
        CreateMobileToggle(SetScroll, "Always Visible Menu", State, "forceVisible")
    end

    -- (Rest of PC Logic continued...)
    -- [The dispatcher at the end]
end

local function BuildMainGUI(token)
    if token ~= _G_TOKEN then player:Kick("Security") return end
    
    FetchMapName()
    LoadLocations()
    LoadCombatSettings()

    local ScreenGui = game.CoreGui:FindFirstChild("HDLE_MainGUI")
    if ScreenGui then ScreenGui:Destroy() end
    ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    ScreenGui.Name = "HDLE_MainGUI" ScreenGui.ResetOnSpawn = false 
    ScreenGui.IgnoreGuiInset = true

    local isMob = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
    local S0 = CalcSizes(State.frameW, State.frameH)

    if isMob then
        BuildMobileGUI(ScreenGui, State, S0)
    else
        BuildPCGUI(ScreenGui, State, S0)
    end
end
    local function UpdGrpCanvas()
        GrpScroll.CanvasSize = UDim2.new(0,0,0, GrpListLayout.AbsoluteContentSize.Y+16)
    end
    local function UpdDetCanvas()
        DetScroll.CanvasSize = UDim2.new(0,0,0, DetListLayout.AbsoluteContentSize.Y+16)
    end

    -- forward declaration (مطلوب لأن BuildCoordCard يستدعيها)
    local OpenGroupDetail

    local function BuildCoordCard(mapName, idx, entry, isCurMap)
        local pos = Vector3.new(entry[1], entry[2], entry[3])
        local lbl = entry[4] or ""

        local card = Instance.new("Frame", DetScroll)
        card.Size=UDim2.new(1,0,0,56) card.LayoutOrder=idx
        card.BackgroundColor3=isCurMap and Color3.fromRGB(16,36,24) or Color3.fromRGB(26,26,38)
        card.BorderSizePixel=0 card.ClipsDescendants=true
        MakeCorner(card,8)
        MakeStroke(card, isCurMap and Color3.fromRGB(0,180,90) or Color3.fromRGB(55,55,85), 1)

        local sb=Instance.new("Frame",card) sb.Size=UDim2.new(0,3,1,-8) sb.Position=UDim2.new(0,3,0,4)
        sb.BackgroundColor3=isCurMap and Color3.fromRGB(0,230,110) or Color3.fromRGB(0,120,210)
        sb.BorderSizePixel=0 MakeCorner(sb,2)

        QuickLabel(card,{
            Size=UDim2.new(1,-105,0,18), Position=UDim2.new(0,12,0,5),
            BackgroundTransparency=1, TextColor3=Color3.new(1,1,1),
            TextSize=S0.fontSmall, Font=Enum.Font.SourceSansBold,
            TextXAlignment=Enum.TextXAlignment.Left,
            TextTruncate=Enum.TextTruncate.AtEnd, TextWrapped=false,
            Text="📍 "..(lbl~="" and lbl or (T("loc_new")..idx))
        })
        QuickLabel(card,{
            Size=UDim2.new(1,-105,0,14), Position=UDim2.new(0,12,0,24),
            BackgroundTransparency=1, TextColor3=Color3.fromRGB(100,100,140),
            TextSize=S0.fontTimer, Font=Enum.Font.SourceSans,
            TextXAlignment=Enum.TextXAlignment.Left, TextWrapped=false,
            Text=string.format("X:%.0f  Y:%.0f  Z:%.0f", pos.X, pos.Y, pos.Z)
        })

        local goBtn=Instance.new("TextButton",card)
        goBtn.Size=UDim2.new(0,42,0,26) goBtn.Position=UDim2.new(1,-92,0.5,-13)
        goBtn.BackgroundColor3=Color3.fromRGB(0,140,65) goBtn.TextColor3=Color3.new(1,1,1)
        goBtn.Font=Enum.Font.SourceSansBold goBtn.TextSize=S0.fontSmall
        goBtn.Text="🚀" goBtn.TextWrapped=false
        MakeCorner(goBtn,6)

        local delBtn=Instance.new("TextButton",card)
        delBtn.Size=UDim2.new(0,42,0,26) delBtn.Position=UDim2.new(1,-46,0.5,-13)
        delBtn.BackgroundColor3=Color3.fromRGB(160,25,25) delBtn.TextColor3=Color3.new(1,1,1)
        delBtn.Font=Enum.Font.SourceSansBold delBtn.TextSize=S0.fontSmall
        delBtn.Text="🗑" delBtn.TextWrapped=false
        MakeCorner(delBtn,6)

        goBtn.MouseButton1Click:Connect(function()
            local ch=player.Character
            if ch and ch:FindFirstChild("HumanoidRootPart") then
                ch.HumanoidRootPart.CFrame=CFrame.new(pos+Vector3.new(0,3,0))
            end
        end)

        delBtn.MouseButton1Click:Connect(function()
            if allLocData[mapName] then
                table.remove(allLocData[mapName], idx)
                if #allLocData[mapName]==0 then allLocData[mapName]=nil end
                SaveLocations()
            end
            -- إعادة بناء الواجهة بعد كل حذف تمنع مشكلة ثبات `idx` عند الحذف المتكرر
            OpenGroupDetail(mapName)
        end)

        return card
    end

    OpenGroupDetail = function(mapName)
        State.openGroupName = mapName
        local isCur = (mapName == currentMap)

        for _, child in ipairs(DetScroll:GetChildren()) do
            if child:IsA("Frame") then child:Destroy() end
        end

        DetTitleLbl.Text = (isCur and "✅ " or "📦 ")..mapName
        DetTitleLbl.TextColor3 = isCur and Color3.fromRGB(0,230,120) or Color3.fromRGB(0,200,150)

        local entries = allLocData[mapName] or {}
        DetCountLbl.Text = T("loc_coords")..#entries

        for i, e in ipairs(entries) do
            BuildCoordCard(mapName, i, e, isCur)
        end

        task.delay(0.05, UpdDetCanvas)
        ShowPage("group_detail")
    end

    -- زر إضافة نقطة من داخل صفحة التفاصيل
    DetAddBtn.MouseButton1Click:Connect(function()
        local mapName = State.openGroupName
        if not mapName then return end
        local ch=player.Character
        if not ch then return end
        local root=ch:FindFirstChild("HumanoidRootPart")
        if not root then return end

        local pos=root.Position
        if not allLocData[mapName] then allLocData[mapName]={} end
        table.insert(allLocData[mapName], {pos.X, pos.Y, pos.Z, ""})
        SaveLocations()
        OpenGroupDetail(mapName)

        TweenService:Create(DetAddBtn, TweenInfo.new(0.15), {BackgroundColor3=Color3.fromRGB(0,180,80)}):Play()
        task.wait(0.25)
        TweenService:Create(DetAddBtn, TweenInfo.new(0.25), {BackgroundColor3=Color3.fromRGB(0,120,190)}):Play()
    end)

    local function BuildGroupCard(mapName, order)
        local isCur = (mapName == currentMap)
        local entries = allLocData[mapName] or {}

        local card = Instance.new("Frame", GrpScroll)
        card.Name="GrpCard_"..mapName
        card.Size=UDim2.new(1,0,0,60) card.LayoutOrder=order
        card.BackgroundColor3=isCur and Color3.fromRGB(14,36,24) or Color3.fromRGB(24,24,36)
        card.BorderSizePixel=0 card.ClipsDescendants=true
        MakeCorner(card,10)
        MakeStroke(card, isCur and Color3.fromRGB(0,200,100) or Color3.fromRGB(55,55,90), isCur and 1.5 or 1)

        local icon=Instance.new("Frame",card)
        icon.Size=UDim2.new(0,36,0,36) icon.Position=UDim2.new(0,8,0.5,-18)
        icon.BackgroundColor3=isCur and Color3.fromRGB(0,90,45) or Color3.fromRGB(40,35,80)
        icon.BorderSizePixel=0 MakeCorner(icon,8)
        QuickLabel(icon,{
            Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
            Text=isCur and "🗺" or "📦", TextSize=16,
            Font=Enum.Font.SourceSansBold
        })

        QuickLabel(card,{
            Size=UDim2.new(1,-140,0,20), Position=UDim2.new(0,52,0,8),
            BackgroundTransparency=1,
            Text=(isCur and "✅ " or "")..mapName,
            TextColor3=isCur and Color3.fromRGB(0,230,120) or Color3.new(1,1,1),
            TextSize=S0.fontSmall, Font=Enum.Font.SourceSansBold,
            TextXAlignment=Enum.TextXAlignment.Left,
            TextTruncate=Enum.TextTruncate.AtEnd, TextWrapped=false
        })
        QuickLabel(card,{
            Size=UDim2.new(1,-140,0,16), Position=UDim2.new(0,52,0,30),
            BackgroundTransparency=1,
            Text=#entries.." "..(T("loc_new"):gsub(" ","").."s"),
            TextColor3=Color3.fromRGB(100,100,140),
            TextSize=S0.fontTimer, Font=Enum.Font.SourceSans,
            TextXAlignment=Enum.TextXAlignment.Left, TextWrapped=false
        })

        local openBtn=Instance.new("TextButton",card)
        openBtn.Size=UDim2.new(0,52,0,30) openBtn.Position=UDim2.new(1,-58,0.5,-15)
        openBtn.BackgroundColor3=isCur and Color3.fromRGB(0,130,65) or Color3.fromRGB(0,90,160)
        openBtn.TextColor3=Color3.new(1,1,1) openBtn.Font=Enum.Font.SourceSansBold
        openBtn.TextSize=S0.fontSmall openBtn.Text="▶" openBtn.TextWrapped=false
        MakeCorner(openBtn,7)

        openBtn.MouseButton1Click:Connect(function()
            OpenGroupDetail(mapName)
        end)
        card.InputBegan:Connect(function(input)
            if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
                OpenGroupDetail(mapName)
            end
        end)
        return card
    end

    -- إعادة بناء قائمة المجموعات:
    -- - الماب الحالي أولاً (إذا كان فيه حفظ)
    -- - ثم باقي المابات المحفوظة
    -- - إذا لا يوجد أي حفظ: لا نظهر بطاقات (يبقى زر الإضافة فقط)
    local function RebuildGroupsList()
        for _, child in ipairs(GrpScroll:GetChildren()) do
            if child:IsA("Frame") then child:Destroy() end
        end

        local hasAny = false
        local order = 1

        local curEntries = allLocData[currentMap]
        if curEntries and #curEntries > 0 then
            BuildGroupCard(currentMap, order)
            order = order + 1
            hasAny = true
        end

        for mapName, entries in pairs(allLocData) do
            if mapName ~= currentMap and entries and #entries > 0 then
                BuildGroupCard(mapName, order)
                order = order + 1
                hasAny = true
            end
        end

        NoGrpLbl.Visible = false

        task.delay(0.05, UpdGrpCanvas)
    end

    -- ============================================================
    -- [Navigation Buttons]
    -- ============================================================
    NavLocBtn.MouseButton1Click:Connect(function()
        RebuildGroupsList()
        local curEntries = allLocData[currentMap]
        if curEntries and #curEntries > 0 then
            -- إذا دخل لنفس الماب المحفوظ: افتح مجموعته مباشرة
            OpenGroupDetail(currentMap)
        else
            -- أول مرة/ماب جديد: تظهر واجهة المجموعات وزر الإضافة
            ShowPage("groups")
        end
    end)
    NavTrackerBtn.MouseButton1Click:Connect(function()
        ShowPage("tracker")
    end)
    NavCombatBtn.MouseButton1Click:Connect(function()
        ShowPage("combat")
    end)
    GrpBackBtn.MouseButton1Click:Connect(function() ShowPage("move") end)
    CmbBackBtn.MouseButton1Click:Connect(function() ShowPage("move") end)
    -- يتم ربط هذه في أسفل بعد تعريف TrackerPage بالكامل

    DetBackBtn.MouseButton1Click:Connect(function() RebuildGroupsList() ShowPage("groups") end)

    -- زر إضافة موقع الحالي وحفظه فوراً في المجموعة
    GrpAddBtn.MouseButton1Click:Connect(function()
        local ch=player.Character
        if not ch then return end
        local root=ch:FindFirstChild("HumanoidRootPart")
        if not root then return end
        local pos=root.Position
        if not allLocData[currentMap] then allLocData[currentMap]={} end
        table.insert(allLocData[currentMap], {pos.X, pos.Y, pos.Z, ""})
        SaveLocations()

        TweenService:Create(GrpAddBtn,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(0,180,80)}):Play()
        task.wait(0.4)
        TweenService:Create(GrpAddBtn,TweenInfo.new(0.25),{BackgroundColor3=Color3.fromRGB(0,120,190)}):Play()
        RebuildGroupsList()
    end)

    -- ============================================================
    -- [Tracker Logic]
    -- (محتوى السكربت الأصلي لا يُمس)
    -- ============================================================
    local isTracking=false local trackTarget=nil local trackConn=nil
    local playerCards={}

    local function UpdTrkCanvas()
        TrkScroll.CanvasSize=UDim2.new(0,0,0, TrkList.AbsoluteContentSize.Y+16)
    end
    local function StopTracking()
        isTracking=false trackTarget=nil
        if trackConn then trackConn:Disconnect() trackConn=nil end
        pcall(function()
            if player.Character then
                local mH = player.Character:FindFirstChild("HumanoidRootPart")
                local hum = player.Character:FindFirstChildOfClass("Humanoid")
                if mH then 
                    mH.Anchored = false 
                    local bv = mH:FindFirstChild("HDLE_TrkBV")
                    if bv then bv:Destroy() end
                end
                if hum then
                    hum:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
                    hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
                end
            end
        end)
    end
    local function IsDown(char)
        if not char then return true end
        local r=char:FindFirstChild("HumanoidRootPart")
        local h=char:FindFirstChildOfClass("Humanoid")
        if not r or not h then return true end
        return h.Health<=0 or r.CFrame.UpVector.Y<0.3
    end

    local function BuildPlayerCard(tp)
        if playerCards[tp.Name] or tp==player then return end
        NoPlayLbl.Visible=false

        local c=Instance.new("Frame",TrkScroll)
        c.Name=tp.Name c.Size=UDim2.new(1,0,0,52)
        c.BackgroundColor3=Color3.fromRGB(26,26,38) c.BorderSizePixel=0 c.ClipsDescendants=true
        MakeCorner(c,8) MakeStroke(c,Color3.fromRGB(55,55,90),1)

        local avF=Instance.new("Frame",c) avF.Size=UDim2.new(0,36,0,36) avF.Position=UDim2.new(0,7,0.5,-18)
        avF.BackgroundColor3=Color3.fromRGB(160,35,90) avF.BorderSizePixel=0 MakeCorner(avF,18)
        local avI=Instance.new("ImageLabel",avF) avI.Size=UDim2.new(1,0,1,0) avI.BackgroundTransparency=1
        avI.Image="https://www.roblox.com/headshot-thumbnail/image?userId="..tp.UserId.."&width=48&height=48&format=png"
        MakeCorner(avI,18)

        QuickLabel(c,{
            Size=UDim2.new(1,-118,0,18),Position=UDim2.new(0,50,0,8),BackgroundTransparency=1,
            TextColor3=Color3.new(1,1,1),TextSize=S0.fontSmall,Font=Enum.Font.SourceSansBold,
            TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,Text=tp.DisplayName})
        QuickLabel(c,{
            Size=UDim2.new(1,-118,0,14),Position=UDim2.new(0,50,0,27),BackgroundTransparency=1,
            TextColor3=Color3.fromRGB(100,100,140),TextSize=S0.fontTimer,Font=Enum.Font.SourceSans,
            TextXAlignment=Enum.TextXAlignment.Left,Text="@"..tp.Name})

        local tb=Instance.new("TextButton",c)
        tb.Size=UDim2.new(0,66,0,28) tb.Position=UDim2.new(1,-72,0.5,-14)
        tb.BackgroundColor3=Color3.fromRGB(160,35,90) tb.TextColor3=Color3.new(1,1,1)
        tb.Font=Enum.Font.SourceSansBold tb.TextSize=S0.fontTimer tb.Text=T("trk_track") tb.TextWrapped=false
        MakeCorner(tb,7)

        tb.MouseButton1Click:Connect(function()
            StopTracking()
            for _,pc in pairs(playerCards) do
                local b=pc:FindFirstChildWhichIsA("TextButton")
                if b then b.BackgroundColor3=Color3.fromRGB(160,35,90) b.Text=T("trk_track") end
            end
            trackTarget=tp isTracking=true
            tb.BackgroundColor3=Color3.fromRGB(0,140,65) tb.Text="✅"
            TrkStatusLbl.TextColor3=Color3.fromRGB(255,80,140)
            TrkStatusLbl.Text="⬤  "..tp.DisplayName
            TrkStopBtn.Visible=true

            pcall(function()
                local mc = player.Character 
                if mc then
                    local hum = mc:FindFirstChildOfClass("Humanoid")
                    if hum then
                        hum:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
                        hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                        hum:ChangeState(Enum.HumanoidStateType.Running)
                    end
                end
            end)

            local lastTargetY = nil
            trackConn=RunService.Heartbeat:Connect(function()
                if not isTracking then return end
                local mC=player.Character if not mC then return end
                local mH=mC:FindFirstChild("HumanoidRootPart") if not mH then return end
                local tC=tp.Character if not tC then return end
                local tH=tC:FindFirstChild("HumanoidRootPart") if not tH then return end
                
                -- Auto-Cancel if Fall enabled
                if cancelOnFall and IsDown(tC) then
                    StopTracking()
                    TrkStatusLbl.Text=T("trk_fell") TrkStatusLbl.TextColor3=Color3.fromRGB(220,80,80)
                    TrkStopBtn.Visible=false tb.BackgroundColor3=Color3.fromRGB(160,35,90) tb.Text=T("trk_track")
                    return
                end

                -- Auto-Cancel if UP enabled
                if cancelOnUp and lastTargetY then
                    if (tH.Velocity.Y > 20) or (tH.Position.Y - lastTargetY > 5) then
                        StopTracking()
                        TrkStatusLbl.Text="⚠️ Target went UP" TrkStatusLbl.TextColor3=Color3.fromRGB(220,150,80)
                        TrkStopBtn.Visible=false tb.BackgroundColor3=Color3.fromRGB(160,35,90) tb.Text=T("trk_track")
                        return
                    end
                end
                lastTargetY = tH.Position.Y

                local distStr = tonumber(TrkDistInp.Text) or 5.5
                local offset = trkPosIsFront and CFrame.new(0, 0, -distStr) or CFrame.new(0, 0, distStr)
                local beh = tH.CFrame * offset
                
                -- عدم تجميد اللاعب (Anchored) للسماح بتسجيل الضربات
                -- نستخدم بدلاً منه معادل جاذبية (BodyVelocity)
                local bv = mH:FindFirstChild("HDLE_TrkBV")
                if not bv then
                    bv = Instance.new("BodyVelocity")
                    bv.Name = "HDLE_TrkBV"
                    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                    bv.Velocity = Vector3.zero
                    bv.Parent = mH
                end

                mH.CFrame = CFrame.new(beh.Position, tH.Position)
            end)
        end)

        playerCards[tp.Name]=c
        task.delay(0.05,UpdTrkCanvas)
    end

    local function RemovePlayerCard(tp)
        if not playerCards[tp.Name] then return end
        local c=playerCards[tp.Name] playerCards[tp.Name]=nil
        if trackTarget==tp then StopTracking() TrkStatusLbl.Text=T("trk_left") TrkStopBtn.Visible=false end
        c:Destroy()
        local n=0 for _ in pairs(playerCards) do n=n+1 end
        NoPlayLbl.Visible=(n==0) UpdTrkCanvas()
    end

    for _,p2 in ipairs(Players:GetPlayers()) do BuildPlayerCard(p2) end
    Players.PlayerAdded:Connect(BuildPlayerCard)
    Players.PlayerRemoving:Connect(RemovePlayerCard)

    TrkSearch:GetPropertyChangedSignal("Text"):Connect(function()
        local f=TrkSearch.Text:lower()
        for nm,c in pairs(playerCards) do
            local p2=Players:FindFirstChild(nm)
            if p2 then c.Visible=(f=="" or p2.Name:lower():find(f,1,true)~=nil or p2.DisplayName:lower():find(f,1,true)~=nil) end
        end
    end)
    TrkStopBtn.MouseButton1Click:Connect(function()
        StopTracking() TrkStatusLbl.Text="⬤  "..T("trk_none") TrkStatusLbl.TextColor3=Color3.fromRGB(100,100,140)
        TrkStopBtn.Visible=false
        for _,c in pairs(playerCards) do
            local b=c:FindFirstChildWhichIsA("TextButton")
            if b then b.BackgroundColor3=Color3.fromRGB(160,35,90) b.Text=T("trk_track") end
        end
    end)

    TrkBackBtn.MouseButton1Click:Connect(function() ShowPage("move") end)

    -- ============================================================
    -- Pointer 3D
    -- ============================================================
    local pointer3D=Instance.new("Part",workspace)
    pointer3D.Anchored=true pointer3D.CanCollide=false pointer3D.Material=Enum.Material.Neon
    pointer3D.Transparency=1 pointer3D.Color=CONFIG.PointerColor

    -- ============================================================
    -- [Player Names + Glow ESP]
    -- ============================================================
    local esp = {
        labels = {},       -- [Player] = BillboardGui
        highlights = {},   -- [Player] = {Highlight,...}
        charConn = {},     -- [Player] = RBXScriptConnection
        refreshConn = nil, -- تحديث دوري لإعادة بناء الجسم عند التحميل الجزئي
    }

    local ESP_COLOR = Color3.fromRGB(0,255,150)
    local ESP_REFRESH_INTERVAL = 0.5

    local function DestroyESPForPlayer(plr)
        local bb = esp.labels[plr]
        if bb then
            bb:Destroy()
            esp.labels[plr] = nil
        end
        local hls = esp.highlights[plr]
        if hls then
            for _, h in ipairs(hls) do
                if h and h.Parent then h:Destroy() end
            end
            esp.highlights[plr] = nil
        end
    end

    local function CreateESPForCharacter(plr, char)
        if not State.showPlayerESP then return end
        if not char then return end

        DestroyESPForPlayer(plr)

        local head = char:FindFirstChild("Head") or char:FindFirstChildWhichIsA("BasePart")
        if head then
            local bb = Instance.new("BillboardGui")
            bb.Name = "HDLE_PlayerName"
            bb.Size = UDim2.new(0, 200, 0, 50)
            bb.AlwaysOnTop = true
            bb.StudsOffset = Vector3.new(0, 2.2, 0)
            bb.MaxDistance = 800
            bb.Enabled = true
            bb.Parent = head

            local lbl = Instance.new("TextLabel")
            lbl.Size = UDim2.new(1,0,1,0)
            lbl.BackgroundTransparency = 1
            lbl.TextColor3 = ESP_COLOR
            lbl.TextStrokeTransparency = 0.4
            lbl.Text = (plr.DisplayName and plr.DisplayName ~= "") and plr.DisplayName or plr.Name
            lbl.Font = Enum.Font.SourceSansBold
            lbl.TextSize = 14
            lbl.TextXAlignment = Enum.TextXAlignment.Center
            lbl.TextYAlignment = Enum.TextYAlignment.Center
            lbl.Parent = bb

            esp.labels[plr] = bb
        end

        local hls = {}
        for _, inst in ipairs(char:GetDescendants()) do
            if inst:IsA("BasePart") then
                local hl = Instance.new("Highlight")
                hl.Name = "HDLE_PlayerGlow"
                hl.Adornee = inst
                hl.FillColor = ESP_COLOR
                hl.OutlineColor = ESP_COLOR
                hl.FillTransparency = 0.65
                hl.OutlineTransparency = 0.25
                hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                hl.Enabled = true
                hl.Parent = char
                table.insert(hls, hl)
            end
        end
        if #hls > 0 then esp.highlights[plr] = hls end
    end

    local function HookPlayer(plr)
        if plr == player then return end
        if not esp.charConn[plr] then
            esp.charConn[plr] = plr.CharacterAdded:Connect(function(char)
                if State.showPlayerESP then
                    task.wait(0.05)
                    CreateESPForCharacter(plr, char)
                end
            end)
        end

        if plr.Character and State.showPlayerESP then
            CreateESPForCharacter(plr, plr.Character)
        end
    end

    EnablePlayerESP = function()
        if State.showPlayerESP then return end
        State.showPlayerESP = true
        for _, plr in ipairs(Players:GetPlayers()) do
            HookPlayer(plr)
        end
        if esp.refreshConn then esp.refreshConn:Disconnect() esp.refreshConn=nil end
        local acc = 0
        esp.refreshConn = RunService.Heartbeat:Connect(function(dt)
            if not State.showPlayerESP then return end
            acc = acc + dt
            if acc < ESP_REFRESH_INTERVAL then return end
            acc = 0
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= player and plr.Character then
                    CreateESPForCharacter(plr, plr.Character)
                end
            end
        end)
    end

    local function DisablePlayerESP()
        if not State.showPlayerESP then return end
        State.showPlayerESP = false
        if esp.refreshConn then esp.refreshConn:Disconnect() esp.refreshConn=nil end
        for plr, _ in pairs(esp.labels) do
            DestroyESPForPlayer(plr)
        end
        for plr, _ in pairs(esp.highlights) do
            DestroyESPForPlayer(plr)
        end
    end

    local function TogglePlayerESP()
        if State.showPlayerESP then
            DisablePlayerESP()
        else
            EnablePlayerESP()
        end
    end

    Players.PlayerAdded:Connect(function(plr)
        HookPlayer(plr)
    end)
    Players.PlayerRemoving:Connect(function(plr)
        local conn = esp.charConn[plr]
        if conn then conn:Disconnect() end
        esp.charConn[plr] = nil
        DestroyESPForPlayer(plr)
    end)

    local function GetPower() return 50 end
    local function GetDir(root) return State.lockedDirection or root.CFrame.LookVector end

    -- ============================================================
    -- [onResize]
    -- ============================================================
    local function onResize(newW, newH)
        local S=CalcSizes(newW,newH)

        MoveList.Padding=UDim.new(0,S.padding)

        -- شريط الحركة
        TitleBar.Size=UDim2.new(1,0,0,S.titleH) TitleLabel.TextSize=S.fontTitle
        TitleLabel.Size=UDim2.new(1,-(S.minBtnW + (S.navBtnW*3) + 20),1,0)
        MinBtn.Size=UDim2.new(0,S.minBtnW,0,S.minBtnH) MinBtn.Position=UDim2.new(1,-(S.minBtnW+4),0.5,-S.minBtnH/2) MinBtn.TextSize=S.fontNormal
        NavLocBtn.Size=UDim2.new(0,S.navBtnW,0,S.navBtnH) NavLocBtn.Position=UDim2.new(1,-(S.minBtnW+S.navBtnW+8),0.5,-S.navBtnH/2) NavLocBtn.TextSize=S.fontNormal
        NavTrackerBtn.Size=UDim2.new(0,S.navBtnW,0,S.navBtnH) NavTrackerBtn.Position=UDim2.new(1,-(S.minBtnW+S.navBtnW*2+12),0.5,-S.navBtnH/2) NavTrackerBtn.TextSize=S.fontNormal
        NavCombatBtn.Size=UDim2.new(0,S.navBtnW,0,S.navBtnH) NavCombatBtn.Position=UDim2.new(1,-(S.minBtnW+S.navBtnW*3+16),0.5,-S.navBtnH/2) NavCombatBtn.TextSize=S.fontNormal
        Row.Size=UDim2.new(1,0,0,S.rowH) BtnUp.TextSize=S.fontSmall BtnFwd.TextSize=S.fontSmall SharedInp.TextSize=S.fontSmall
        LangBtn.Size=UDim2.new(1,0,0,S.langH) LangBtn.TextSize=S.fontSmall
        for _,b in ipairs({Btn3D,BtnLock,BtnTlp,BtnNoclip,BtnESP}) do b.Size=UDim2.new(1,0,0,S.btnH) b.TextSize=S.fontNormal end
        ThrRow.Size=UDim2.new(1,0,0,S.btnH) BtnThr.TextSize=S.fontNormal ThrPowerInp.TextSize=S.fontNormal
        WlkRow.Size=UDim2.new(1,0,0,S.btnH) BtnWlk.TextSize=S.fontNormal WlkSpeedInp.TextSize=S.fontNormal
        FlyRow.Size=UDim2.new(1,0,0,S.btnH) BtnFly.TextSize=S.fontNormal FlySpeedInp.TextSize=S.fontNormal
        TimeText.Size=UDim2.new(1,0,0,S.timerH) TimeText.TextSize=S.fontTimer
        UpdatesText.Size=UDim2.new(1,0,0,S.timerH) UpdatesText.TextSize=S.fontSmall
        MoveScroll.CanvasSize=UDim2.new(0,0,0,MoveList.AbsoluteContentSize.Y+12)

        -- شريط المجموعات
        GrpTitleBar.Size=UDim2.new(1,0,0,S.titleH) GrpTitleLbl.TextSize=S.fontTitle
        GrpTitleLbl.Size=UDim2.new(1,-(S.navBtnW+8),1,0)
        GrpBackBtn.Size=UDim2.new(0,S.navBtnW,0,S.navBtnH) GrpBackBtn.Position=UDim2.new(1,-(S.navBtnW+4),0.5,-S.navBtnH/2) GrpBackBtn.TextSize=S.fontNormal
        GrpMapLbl.Size=UDim2.new(1,-12,0,S.timerH) GrpMapLbl.Position=UDim2.new(0,6,0,S.titleH+4) GrpMapLbl.TextSize=S.fontSmall
        local glt=S.titleH+S.timerH+10
        GrpScroll.Size=UDim2.new(1,-12,1,-(glt+S.btnH+10)) GrpScroll.Position=UDim2.new(0,6,0,glt)
        GrpAddBtn.Size=UDim2.new(1,-12,0,S.btnH) GrpAddBtn.Position=UDim2.new(0,6,1,-(S.btnH+5)) GrpAddBtn.TextSize=S.fontSmall

        -- شريط التفاصيل
        DetTitleBar.Size=UDim2.new(1,0,0,S.titleH) DetTitleLbl.TextSize=S.fontTitle
        DetBackBtn.Size=UDim2.new(0,S.navBtnW,0,S.navBtnH) DetBackBtn.Position=UDim2.new(1,-(S.navBtnW+4),0.5,-S.navBtnH/2) DetBackBtn.TextSize=S.fontNormal
        DetInfoBar.Size=UDim2.new(1,-12,0,S.timerH+4) DetInfoBar.Position=UDim2.new(0,6,0,S.titleH+4) DetCountLbl.TextSize=S.fontTimer
        DetAddBtn.TextSize=S.fontSmall
        local dlt=S.titleH+S.timerH+14
        DetScroll.Size=UDim2.new(1,-12,1,-(dlt+S.btnH+10)) DetScroll.Position=UDim2.new(0,6,0,dlt)

        -- شريط التتبع
        TrkTitleBar.Size=UDim2.new(1,0,0,S.titleH) TrkTitleLbl.TextSize=S.fontTitle
        TrkBackBtn.Size=UDim2.new(0,S.navBtnW,0,S.navBtnH) TrkBackBtn.Position=UDim2.new(1,-(S.navBtnW+4),0.5,-S.navBtnH/2) TrkBackBtn.TextSize=S.fontNormal
        TrkStatusLbl.Size=UDim2.new(1,-12,0,S.btnH) TrkStatusLbl.Position=UDim2.new(0,6,0,S.titleH+4) TrkStatusLbl.TextSize=S.fontSmall
        TrkStopBtn.Position=UDim2.new(1,-82,0,S.titleH+6)
        TrkSearch.Size=UDim2.new(0.45,-9,0,S.inputH) TrkSearch.Position=UDim2.new(0,6,0,S.titleH+S.btnH+10) TrkSearch.TextSize=S.fontSmall
        TrkPosToggleBtn.Size=UDim2.new(0.3,-6,0,S.inputH) TrkPosToggleBtn.Position=UDim2.new(0.45,3,0,S.titleH+S.btnH+10) TrkPosToggleBtn.TextSize=S.fontSmall
        TrkDistInp.Size=UDim2.new(0.25,-6,0,S.inputH) TrkDistInp.Position=UDim2.new(0.75,3,0,S.titleH+S.btnH+10) TrkDistInp.TextSize=S.fontSmall
        
        if TrkCancelFallBtn then
            TrkCancelFallBtn.Size=UDim2.new(0.48,-6,0,S.inputH)
            TrkCancelFallBtn.Position=UDim2.new(0,6,0,S.titleH+S.btnH+S.inputH+15)
            TrkCancelFallBtn.TextSize=S.fontSmall
        end
        if TrkCancelUpBtn then
            TrkCancelUpBtn.Size=UDim2.new(0.48,-6,0,S.inputH)
            TrkCancelUpBtn.Position=UDim2.new(0.5,3,0,S.titleH+S.btnH+S.inputH+15)
            TrkCancelUpBtn.TextSize=S.fontSmall
        end

        local tlt=S.titleH+S.btnH+(S.inputH*2)+22
        TrkScroll.Size=UDim2.new(1,-12,1,-(tlt+8)) TrkScroll.Position=UDim2.new(0,6,0,tlt)
    end

    onResize(State.frameW, State.frameH)
    BuildResizeHandles(Frame, onResize)

    local lastVP=workspace.CurrentCamera.ViewportSize
    RunService.Heartbeat:Connect(function()
        local vp=workspace.CurrentCamera.ViewportSize
        if vp~=lastVP then
            lastVP=vp
            local sc=math.clamp(math.min(vp.X/1920,vp.Y/1080),0.5,1.0)
            local newW=math.clamp(State.frameW,math.floor(DM.MinWidth*sc),math.floor(DM.MaxWidth*sc))
            local newH=math.clamp(State.frameH,math.floor(DM.MinHeight*sc),math.floor(DM.MaxHeight*sc))
            Frame.Size=UDim2.new(0,newW,0,newH) State.frameW=newW State.frameH=newH onResize(newW,newH)
        end
    end)

    -- ============================================================
    -- [RenderLoop]
    -- ============================================================
    RunService.RenderStepped:Connect(function()
        TitleLabel.Text = T("title")
        LangBtn.Text    = T("lang")..": "..State.currentLang
            local currentExpiry = State.expiryTimestamp or 0
            local serverTime = os.time() + (State.timeServerOffset or 0)
            local remaining = math.max(0, currentExpiry - serverTime)
            local days = math.floor(remaining / 86400)
            local hours = math.floor((remaining % 86400) / 3600)
            local mins = math.floor((remaining % 3600) / 60)
            local secs = remaining % 60
            
            local timeStr = (days > 0) 
                and string.format("%dd %02d:%02d:%02d", days, hours, mins, secs)
                or string.format("%02d:%02d:%02d", hours, mins, secs)
            
            TimeText.Text = "⏱️ "..timeStr
            
            -- تغيير اللون حسب الوقت المتبقي
            if remaining < 300 then -- أقل من 5 دقائق (أحمر)
                TimeText.TextColor3 = Color3.fromRGB(255, 50, 50)
            elseif remaining < 3600 then -- أقل من ساعة (برتقالي)
                TimeText.TextColor3 = Color3.fromRGB(255, 150, 50)
            else -- وقت كافي (أخضر)
                TimeText.TextColor3 = Color3.fromRGB(0, 255, 150)
            end

            if remaining == 0 and currentExpiry > 0 then
                pcall(function()
                    StarterGui:SetCore("SendNotification", {
                        Title = "⚠️ انتهى الوقت!",
                        Text = "انتهت صلاحية المفتاح. سيتم إغلاق السكريبت.",
                        Duration = 10
                    })
                end)
                task.wait(2)
                ScreenGui:Destroy()
            end

            -- استعادة باقي التحديثات
            UpdatesText.Text= "v"..VERSION.." | "..T("updates")
            Btn3D.Text      = T("show3d")
            BtnLock.Text    = (State.lockedDirection~=nil) and T("lock_on") or T("lock")
            BtnTlp.Text     = T("tlp") BtnThr.Text=T("thr")
            if BtnNoclip.BackgroundColor3 == Color3.fromRGB(0, 140, 65) then BtnNoclip.Text = T("noclip").." (ON)" else BtnNoclip.Text = T("noclip") end
            if BtnWlk.BackgroundColor3 == Color3.fromRGB(0, 140, 65) then BtnWlk.Text = T("wlk").." (ON)" else BtnWlk.Text = T("wlk") end
            if BtnFly.BackgroundColor3 == Color3.fromRGB(0, 140, 65) then BtnFly.Text = T("fly").." (ON)" else BtnFly.Text = T("fly") end
            BtnUp.Text      = T("up") BtnFwd.Text=T("fwd")
            if State.showPlayerESP then
                BtnESP.Text = T("show_esp").." (ON)"
                BtnESP.BackgroundColor3 = Color3.fromRGB(0, 140, 65)
            else
                BtnESP.Text = T("show_esp")
                BtnESP.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            end
            GrpTitleLbl.Text= T("loc_title")
            GrpAddBtn.Text  = "➕ "..T("loc_add").." + 💾"
            DetAddBtn.Text  = "➕ "..T("loc_add")
            NoPlayLbl.Text  = T("trk_noplay")
            TrkTitleLbl.Text= T("trk_title")
            TrkSearch.PlaceholderText = T("trk_search")
            TrkStatusLbl.Text = TrkStatusLbl.Text 
            GrpMapLbl.Text  = "🗺 "..currentMap

            if State.isPointerActive then
            local char=player.Character local root=char and char:FindFirstChild("HumanoidRootPart")
            if root then
                local dist=GetPower()
                pointer3D.Size=Vector3.new(0.3,0.3,dist)
                pointer3D.CFrame=CFrame.new(root.Position,root.Position+GetDir(root))*CFrame.new(0,0,-dist/2)
            end
        end
    end)

    -- ============================================================
    -- [Movement Actions] - لم تتغير
    -- ============================================================
    LangBtn.MouseButton1Click:Connect(function()
        CycleLang()
        if CmbTitleLbl then CmbTitleLbl.Text = T("cmb_title") end
        if UpdateAllCombatUI then UpdateAllCombatUI() end
    end)

    Btn3D.MouseButton1Click:Connect(function()
        State.isPointerActive=not State.isPointerActive
        pointer3D.Transparency=State.isPointerActive and 0.5 or 1
    end)
    BtnLock.MouseButton1Click:Connect(function()
        local root=player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if root then State.lockedDirection=(State.lockedDirection==nil) and root.CFrame.LookVector or nil end
    end)
    BtnTlp.MouseButton1Click:Connect(function()
        local root=player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if root then root.CFrame=CFrame.new(7e8,7e8,7e8) end
    end)
    BtnNoclip.MouseButton1Click:Connect(function()
        State.isNoclip = not State.isNoclip
        if State.isNoclip then
            BtnNoclip.BackgroundColor3 = Color3.fromRGB(0, 140, 65)
            if noclipConn then noclipConn:Disconnect() end
            noclipConn = RunService.Stepped:Connect(function()
                if not State.isNoclip then 
                    if noclipConn then noclipConn:Disconnect() noclipConn = nil end
                    return 
                end
                local char = player.Character
                if char then
                    for _, part in ipairs(char:GetDescendants()) do
                        if part:IsA("BasePart") and part.CanCollide then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            BtnNoclip.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            if noclipConn then noclipConn:Disconnect() noclipConn = nil end
            
            -- إعادة التصادم للأجزاء الضرورية فقط وبشكل ذكي لمنع الاهتزاز
            local char = player.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            
            if char and hum then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        -- نعيد التصادم فقط للرأس والجذع والجزء الرئيسي
                        -- باقي الأطراف ستعود لحالتها الطبيعية برمجياً بواسطة الهيومانويد
                        if part.Name == "HumanoidRootPart" or part.Name == "Torso" or part.Name == "UpperTorso" or part.Name == "LowerTorso" or part.Name == "Head" then
                            part.CanCollide = true
                        end
                    end
                end
                -- تحديث حالة الهيومانويد لإعادة ضبط الفيزياء ومنع اهتزاز الكاميرا
                hum:ChangeState(Enum.HumanoidStateType.Land)
            end
        end
    end)
    BtnThr.MouseButton1Click:Connect(function()
        local char=player.Character local root=char and char:FindFirstChild("HumanoidRootPart")
        if root then 
            local pwr = tonumber(ThrPowerInp.Text) or 50 
            root.AssemblyLinearVelocity=(GetDir(root)*pwr)+Vector3.new(0,pwr/2,0) 
        end
    end)
    local isWalking = false
    local wlkConn = nil

    local function StopWalk()
        isWalking = false
        if wlkConn then wlkConn:Disconnect() wlkConn = nil end
        BtnWlk.BackgroundColor3 = Color3.fromRGB(60,60,60)
        local char = player.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = 16 end
    end

    BtnWlk.MouseButton1Click:Connect(function()
        local char = player.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not hum then return end

        if isWalking then
            StopWalk()
        else
            isWalking = true
            BtnWlk.BackgroundColor3 = Color3.fromRGB(0, 140, 65)
            
            wlkConn = RunService.RenderStepped:Connect(function()
                if not char or not char.Parent or hum.Health <= 0 then
                    StopWalk() return
                end
                hum.WalkSpeed = tonumber(WlkSpeedInp.Text) or 16
            end)
        end
    end)
    local isFlying = false
    local flyConn = nil
    local flyMovers = {}

    local function StopFly(char)
        isFlying = false
        if flyConn then flyConn:Disconnect() flyConn = nil end
        for _, v in ipairs(flyMovers) do if v and v.Parent then v:Destroy() end end
        table.clear(flyMovers)
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.PlatformStand = false end
            local root = char:FindFirstChild("HumanoidRootPart")
            if root then root.AssemblyLinearVelocity = Vector3.new() end
        end
        BtnFly.BackgroundColor3 = Color3.fromRGB(60,60,60)
    end

    BtnFly.MouseButton1Click:Connect(function()
        local char = player.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not root or not hum then return end

        if isFlying then
            StopFly(char)
        else
            isFlying = true
            BtnFly.BackgroundColor3 = Color3.fromRGB(0, 140, 65)
            hum.PlatformStand = true

            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            bv.Velocity = Vector3.new(0, 0, 0)
            bv.Parent = root
            table.insert(flyMovers, bv)

            local bg = Instance.new("BodyGyro")
            bg.P = 9e4
            bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.CFrame = root.CFrame
            bg.Parent = root
            table.insert(flyMovers, bg)

            flyConn = RunService.RenderStepped:Connect(function()
                if not char or not char.Parent or hum.Health <= 0 then
                    StopFly(char)
                    return
                end
                local cam = workspace.CurrentCamera
                if not cam then return end

                bg.CFrame = CFrame.new(cam.CFrame.Position, cam.CFrame.Position + cam.CFrame.LookVector)

                local dir = hum.MoveDirection
                local speed = tonumber(FlySpeedInp.Text) or 50

                if dir.Magnitude > 0.01 then
                    local flatLook = Vector3.new(cam.CFrame.LookVector.X, 0, cam.CFrame.LookVector.Z)
                    if flatLook.Magnitude > 0 then flatLook = flatLook.Unit end
                    
                    local flatRight = Vector3.new(cam.CFrame.RightVector.X, 0, cam.CFrame.RightVector.Z)
                    if flatRight.Magnitude > 0 then flatRight = flatRight.Unit end

                    local projZ = dir:Dot(flatLook)
                    local projX = dir:Dot(flatRight)

                    local moveVec = (cam.CFrame.LookVector * projZ) + (cam.CFrame.RightVector * projX)
                    
                    if moveVec.Magnitude > 0.01 then
                        bv.Velocity = moveVec.Unit * speed
                    else
                        bv.Velocity = Vector3.new(0, 0, 0)
                    end
                else
                    bv.Velocity = Vector3.new(0, 0, 0)
                end
            end)
        end
    end)
    BtnESP.MouseButton1Click:Connect(function()
        TogglePlayerESP()
    end)
    BtnUp.MouseButton1Click:Connect(function()
        local root=player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if root then root.CFrame=root.CFrame+Vector3.new(0,tonumber(SharedInp.Text) or 10,0) end
    end)
    BtnFwd.MouseButton1Click:Connect(function()
        local root=player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if root then root.CFrame=root.CFrame+(GetDir(root)*(tonumber(SharedInp.Text) or 10)) end
    end)

    task.spawn(function()
        task.wait(0.3)
        GrpMapLbl.Text="🗺 "..currentMap
    end)

    -- تفريغ واضح: صفحة Tracker رجوع
    ShowPage("move")
end

-- ============================================================
-- [DUAL SERVER HELPERS] مساعدو السيرفر المزدوج
-- ============================================================

-- محاولة التحقق من سيرفر واحد مع Timeout
local function TryVerifyServer(serverUrl, jsonPayload)
    local headers = {
        ["Content-Type"] = "application/json",
        ["X-Site-Token"] = CONFIG.SiteToken
    }
    
    -- ── تتبع: عرض الـ Headers المرسلة ───────────────────────
    print("[HDLE] 📤 Sending request to: " .. serverUrl .. "/verify")
    print("[HDLE] 📋 Headers: Content-Type=application/json, X-Site-Token=" .. tostring(CONFIG.SiteToken))
    
    -- 1. محاولة syn.request (الأسرع)
    local ok1, res1 = pcall(function()
        if syn and syn.request then
            return syn.request({
                Url = serverUrl .. "/verify",
                Method = "POST",
                Headers = headers,
                Body = jsonPayload
            })
        end
    end)
    if ok1 and res1 then
        -- فحص حالة الرد
        if res1.StatusCode and (res1.StatusCode == 429 or res1.StatusCode == 500 or res1.StatusCode == 401) then
            return nil, "server_error_" .. res1.StatusCode
        end
        if res1.Body then
            local okDec, decoded = pcall(function() return HttpService:JSONDecode(res1.Body) end)
            if okDec then
                return decoded, nil
            end
        end
    end
    
    -- 2. محاولة http.request
    local ok2, res2 = pcall(function()
        local reqFunc = (http and http.request) or request
        if reqFunc then
            return reqFunc({
                Url = serverUrl .. "/verify",
                Method = "POST",
                Headers = headers,
                Body = jsonPayload
            })
        end
    end)
    if ok2 and res2 then
        if res2.StatusCode and (res2.StatusCode == 429 or res2.StatusCode == 500 or res2.StatusCode == 401) then
            return nil, "server_error_" .. res2.StatusCode
        end
        if res2.Body then
            local okDec, decoded = pcall(function() return HttpService:JSONDecode(res2.Body) end)
            if okDec then
                return decoded, nil
            end
        end
    end
    
    -- 3. محاولة game:HttpGet (GET request)
    local ok3, res3 = pcall(function()
        local function urlenc(s) return string.gsub(tostring(s), "([^%w _%%%-%.~])", function(c) return string.format("%%%02X", string.byte(c)) end):gsub(" ", "+") end
        local t = HttpService:JSONDecode(jsonPayload)
        local params = "?key=" .. urlenc(t.key or "") ..
                       "&username=" .. urlenc(t.username or "") ..
                       "&display_name=" .. urlenc(t.display_name or "") ..
                       "&user_id=" .. urlenc(t.user_id or "") ..
                       "&game_name=" .. urlenc(t.game_name or "") ..
                       "&place_id=" .. urlenc(t.place_id or "") ..
                       "&job_id=" .. urlenc(t.job_id or "")
        return game:HttpGet(serverUrl .. "/verify" .. params)
    end)
    if ok3 and res3 then
        local okDec, decoded = pcall(function() return HttpService:JSONDecode(res3) end)
        if okDec then
            return decoded, nil
        end
    end
    
    return nil, "connection_failed"
end

-- ── [REMOTE VERIFY] التحقق المزدوج من المفتاح (SERVER-SIDE ONLY) ────
local function VerifyKeyRemote(key)
    -- ── التحقق SERVER-SIDE فقط ─────────────────────────────────
    -- لا يوجد مقارنة محلية مع GenerateKey() — كل شيء يمر بالسيرفر
    
    -- جمع بيانات اللاعب والماب
    local player = game:GetService("Players").LocalPlayer
    local username = player.Name
    local display_name = player.DisplayName
    local user_id = tostring(player.UserId)
    local place_id = tostring(game.PlaceId)
    local job_id = game.JobId
    
    local game_name = "Unknown Game"
    pcall(function()
        local info = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
        if info and info.Name then
            game_name = info.Name
        end
    end)

    local data_payload = {
        key = key,
        username = username,
        display_name = display_name,
        user_id = user_id,
        game_name = game_name,
        place_id = place_id,
        job_id = job_id
    }
    local json_payload = HttpService:JSONEncode(data_payload)

    -- ── محاولة 1: السيرفر الأساسي ─────────────────────────────
    print("[HDLE] 🔍 جاري فحص السيرفر 1 (الأساسي)...")
    local result, err = TryVerifyServer(CONFIG.WorkerURL, json_payload)
    
    -- إذا نجح التحقق
    if result then
        print("[HDLE] ✅ السيرفر 1 استجاب بنجاح!")
        if result.expiry then
            -- تأكيد أن expiry هو Number (Unix Timestamp)
            local expiryNum = tonumber(result.expiry)
            print("[HDLE] ⏱ وقت الانتهاء المستلم (Unix Timestamp): " .. tostring(expiryNum))
            result.expiry = expiryNum
        end
        if result.server_now then
            State.timeServerOffset = result.server_now - os.time()
        end
        return result
    end
    
    -- ── محاولة 2: السيرفر الاحتياطي (على أخطاء 429, 500, 401 أو فشل الاتصال) ─
    if err and (err:match("server_error") or err == "connection_failed") then
        warn("[HDLE] ⚠️ السيرفر 1 فشل (" .. tostring(err) .. "). جاري فحص السيرفر 2...")
        print("[HDLE] 🔍 جاري فحص السيرفر 2 (الاحتياطي)...")
        
        local backupResult, backupErr = TryVerifyServer(CONFIG.BackupWorkerURL, json_payload)
        
        if backupResult then
            warn("[HDLE] ✅ السيرفر 2 استجاب بنجاح!")
            if backupResult.expiry then
                -- تأكيد أن expiry هو Number (Unix Timestamp)
                local expiryNum = tonumber(backupResult.expiry)
                print("[HDLE] ⏱ وقت الانتهاء من السيرفر 2 (Unix Timestamp): " .. tostring(expiryNum))
                backupResult.expiry = expiryNum
            end
            if backupResult.server_now then
                State.timeServerOffset = backupResult.server_now - os.time()
            end
            return backupResult
        else
            warn("[HDLE] ❌ السيرفر 2 فشل أيضاً: " .. tostring(backupErr))
        end
    end

    -- Fallback آمن في حال فشل كل المحاولات (Network Error)
    warn("[HDLE] 🌐 خطأ في الاتصال بالسيرفرين — التحول لوضع عدم الاتصال (Offline).")
    return { valid = true, offline = true }
end

-- ==============================================================
-- [Key GUI] - لم يُمس بتاتاً
-- ==============================================================
local function BuildKeyGUI(expectedKey, onSuccess)
    local KD={
        Width=340,Height=180,Background=Color3.fromRGB(15,15,15),
        BorderColor=Color3.fromRGB(0,255,150),TimerColor=Color3.new(1,0,0),
        InputBG=Color3.fromRGB(25,25,25),VerifyBG=Color3.fromRGB(0,120,0),GetBG=Color3.fromRGB(50,50,50),
    }
    local old = game.CoreGui:FindFirstChild("HDLE_KeySystem")
    if old then old:Destroy() end

    local SG=Instance.new("ScreenGui",game.CoreGui)
    SG.Name="HDLE_KeySystem"
    SG.ResetOnSpawn=false SG.DisplayOrder=50

    local Main=Instance.new("Frame",SG)
    Main.Size=UDim2.new(0,KD.Width,0,KD.Height) Main.Position=UDim2.new(0.5,-KD.Width/2,0.5,-KD.Height/2)
    Main.BackgroundColor3=KD.Background Main.Active=true Main.Draggable=true
    MakeCorner(Main,12) MakeStroke(Main,KD.BorderColor)

    local Tmr=Instance.new("TextLabel",Main)
    Tmr.Size=UDim2.new(1,0,0,30) Tmr.BackgroundTransparency=1 Tmr.TextColor3=KD.TimerColor
    Tmr.TextSize=14 Tmr.Font=Enum.Font.SourceSansBold Tmr.TextXAlignment=Enum.TextXAlignment.Center Tmr.Text=""

    task.spawn(function()
        while Main.Parent do Tmr.Text=T("expires")..GetTimeLeft() task.wait(1) end
    end)

    local Inp=Instance.new("TextBox",Main)
    Inp.Size=UDim2.new(0.8,0,0,40) Inp.Position=UDim2.new(0.1,0,0.25,0)
    Inp.BackgroundColor3=KD.InputBG Inp.TextColor3=Color3.new(1,1,1) Inp.Text=""
    Inp.PlaceholderText=T("key_msg") Inp.Font=Enum.Font.SourceSans Inp.TextSize=14 Inp.ClearTextOnFocus=false
    MakeCorner(Inp,8)

    local Ver=Instance.new("TextButton",Main)
    Ver.Size=UDim2.new(0.4,0,0,40) Ver.Position=UDim2.new(0.05,0,0.6,0)
    Ver.BackgroundColor3=KD.VerifyBG Ver.TextColor3=Color3.new(1,1,1)
    Ver.Font=Enum.Font.SourceSansBold Ver.TextSize=15 Ver.Text=T("verify")
    MakeCorner(Ver,8)

    local Get=Instance.new("TextButton",Main)
    Get.Size=UDim2.new(0.4,0,0,40) Get.Position=UDim2.new(0.55,0,0.6,0)
    Get.BackgroundColor3=KD.GetBG Get.TextColor3=Color3.new(1,1,1)
    Get.Font=Enum.Font.SourceSansBold Get.TextSize=15 Get.Text=T("get_btn")
    MakeCorner(Get,8)

    RunService.RenderStepped:Connect(function()
        Ver.Text=T("verify") Get.Text=T("get_btn") Inp.PlaceholderText=T("key_msg")
    end)

    Get.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(CONFIG.BlogURL)
            pcall(function() StarterGui:SetCore("SendNotification",{Title=T("copied"),Text=T("copy_txt")}) end)
        end
    end)

    Ver.MouseButton1Click:Connect(function()
        local inpKey = string.gsub(Inp.Text, "^%s*(.-)%s*$", "%1")
        local isValid = false
        local expiryDays = 0
        local keyType = ""
        
        -- [Security Check] التحقق من المفاتيح المستخدمة سابقاً
        local isUsed = false
        if isfile and isfile(CONFIG.UsedKeysFile) then
            local ok, content = pcall(readfile, CONFIG.UsedKeysFile)
            if ok and content ~= "" then
                local ok2, usedKeys = pcall(function() return HttpService:JSONDecode(content) end)
                if ok2 and type(usedKeys) == "table" then
                    for _, used in ipairs(usedKeys) do
                        if used == inpKey then isUsed = true break end
                    end
                end
            end
        end
        
        if isUsed then
            Inp.Text = "" Inp.PlaceholderText = "❌ المفتاح مستخدم سابقاً!"
            return
        end
        
        -- ── التحقق عبر الـ Worker السحابي ────────────────────────────
        Inp.PlaceholderText = "⏳ جاري التحقق..."
        Inp.Text = ""

        local remoteResult = VerifyKeyRemote(inpKey)

        if remoteResult and remoteResult.valid then
            isValid = true
            -- احسب وقت الانتهاء من السيرفر مباشرة
            if remoteResult.expiry then
                State.expiryTimestamp = math.floor(remoteResult.expiry)
                print("[HDLE] ⏱ وقت الانتهاء من السيرفر: " .. tostring(remoteResult.expiry_formatted or "N/A"))
            else
                -- fallback نادر: السيرفر لم يرسل expiry — حساب محلي مؤقت
                State.expiryTimestamp = math.floor(os.time()) + (expiryDays * 86400)
                warn("[HDLE] ⚠️ السيرفر لم يرسل expiry — حساب محلي مؤقت.")
            end
            keyType = remoteResult.type or "VIP"
        elseif remoteResult and remoteResult.reason == "revoked" then
            Inp.Text = "" Inp.PlaceholderText = "🚫 هذا المفتاح مُبطَل!"
            return
        elseif remoteResult and remoteResult.reason == "paused" then
            Inp.Text = "" Inp.PlaceholderText = "⚠️ المفتاح موقف مؤقتاً!"
            return
        elseif remoteResult and remoteResult.reason == "expired" then
            Inp.Text = "" Inp.PlaceholderText = "⌛ انتهت صلاحية المفتاح!"
            return
        elseif remoteResult and remoteResult.reason == "not_found" then
            Inp.Text = "" Inp.PlaceholderText = T("invalid")
            return
        end
        -- ─────────────────────────────────────────────────────────────
        
        if isValid then
            local now = math.floor(os.time())
            local expiry = State.expiryTimestamp
            
            if writefile then
                pcall(function()
                    local data = {
                        Key = inpKey, 
                        ExpiryTime = expiry, 
                        CreatedAt = now, 
                        UserId = player.UserId,
                        GameId = game.GameId,
                        Type = keyType
                    }
                    data.Hash = GetChecksum(data)
                    local ok3, err = pcall(function()
                        local raw = HttpService:JSONEncode(data)
                        local encrypted = B64Enc(Cipher(raw, GetCipherKey()))
                        writefile(CONFIG.FileName, encrypted)
                        task.wait(0.5) -- تأكيد الحفظ على القرص
                        
                        -- إضافة المفتاح لقائمة المستخدمة (مشفرة أيضاً)
                        local usedList = {}
                        if isfile(CONFIG.UsedKeysFile) then
                            local ok2, content = pcall(readfile, CONFIG.UsedKeysFile)
                            if ok2 then 
                                pcall(function() 
                                    local dec = Cipher(B64Dec(content), GetCipherKey())
                                    usedList = HttpService:JSONDecode(dec) 
                                end) 
                            end
                        end
                        table.insert(usedList, inpKey)
                        local encUsed = B64Enc(Cipher(HttpService:JSONEncode(usedList), GetCipherKey()))
                        writefile(CONFIG.UsedKeysFile, encUsed)
                    end)
                    
                    if not ok3 then
                        warn("[HDLE] CRITICAL: FAILED TO SAVE KEY TO DISK! Error: " .. tostring(err))
                    else
                        print("[HDLE] Session successfully saved and verified. File exists: " .. tostring(isfile(CONFIG.FileName)))
                    end
                end)
            end
            
            if expiryDays >= 3 then
                pcall(function() StarterGui:SetCore("SendNotification",{Title="MASTER VIP",Text="لقد تم تفعيل وضع "..expiryDays.." أيام بنجاح!"}) end)
            end
            -- تشغيل نظام نبضات القلب
            task.spawn(function() StartHeartbeat(inpKey) end)
            SG:Destroy() onSuccess(_G_TOKEN)
        else
            Inp.Text="" Inp.PlaceholderText=T("invalid")
        end
    end)
    SG.Enabled = true
    print("[HDLE] Key GUI Build Successful.")
end

-- ============================================================
-- [HEARTBEAT SYSTEM] نبضات القلب — فحص دوري للمفتاح
-- ============================================================
local HeartbeatActive = false

local function ForceShutdown(reason)
    HeartbeatActive = false
    warn("[HDLE] 🔴 REMOTE SHUTDOWN: " .. tostring(reason))

    -- ① إيقاف جميع الميزات
    pcall(function()
        State.isFlying = false
        State.isNoclip = false
        
        local lp = game:GetService("Players").LocalPlayer
        if lp and lp.Character then
            -- حذف محركات الطيران
            for _,v in ipairs(lp.Character:GetDescendants()) do
                if v:IsA("BodyVelocity") or v:IsA("BodyGyro") then v:Destroy() end
                if v:IsA("BasePart") then v.CanCollide = true end
            end
        end
        -- إعادة السرعة والأصوات
        local hum = lp and lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = 16 hum.JumpPower = 50 hum.PlatformStand = false end
    end)

    -- ② حذف الجلسة المحفوظة من القرص
    pcall(function()
        if delfile and isfile and isfile(CONFIG.FileName) then
            delfile(CONFIG.FileName)
            print("[HDLE] Session file deleted.")
        end
    end)

    -- ③ تدمير الـ GUI الحالي
    pcall(function()
        local names = {"HDLE_MainGUI", "HDLE_KeySystem", "HDLE_RestoreIcon"}
        for _, name in ipairs(names) do
            local g = game.CoreGui:FindFirstChild(name)
            if g then g:Destroy() end
        end
    end)

    -- ④ إظهار إشعار للاعب
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title    = "🔴 HDLE — انتهت الجلسة",
            Text     = reason == "revoked" and "تم إبطال مفتاحك من قِبل الأدمن." 
                       or "انتهت صلاحية مفتاحك.",
            Duration = 8,
        })
    end)

    -- ⑤ إعادة شاشة إدخال المفتاح بعد 2 ثانية
    task.delay(2, function()
        pcall(function()
            BuildKeyGUI(GenerateKey(), function(token)
                pcall(function() BuildMainGUI(token) end)
            end)
        end)
    end)
end

local isPaused = false
local function ShowPauseScreen(visible)
    isPaused = visible
    local pg = game.CoreGui:FindFirstChild("HDLE_PauseGUI")
    if visible then
        if not pg then
            pg = Instance.new("ScreenGui", game.CoreGui)
            pg.Name = "HDLE_PauseGUI"
            pg.DisplayOrder = 100
            pg.ResetOnSpawn = false
            
            local frame = Instance.new("Frame", pg)
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
            frame.BackgroundTransparency = 0.3
            frame.Active = true
            
            local lbl = Instance.new("TextLabel", frame)
            lbl.Size = UDim2.new(0.8, 0, 0.4, 0)
            lbl.Position = UDim2.new(0.1, 0, 0.3, 0)
            lbl.BackgroundTransparency = 1
            lbl.TextColor3 = Color3.fromRGB(255, 204, 0) -- Yellow
            lbl.TextSize = 28
            lbl.Font = Enum.Font.SourceSansBold
            lbl.Text = "⚠️ [إيقاف مؤقت]\n\nتم إيقاف اشتراكك مؤقتاً من قبل المشرف.\nالرجاء الانتظار، سيعود السكريبت للعمل تلقائياً فور فك الإيقاف."
            lbl.TextWrapped = true
        end
        -- تعطيل الميزات والـ GUI الرئيسي
        pcall(function()
            State.isFlying = false
            State.isNoclip = false
            local lp = game:GetService("Players").LocalPlayer
            if lp and lp.Character then
                local hum = lp.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum.WalkSpeed = 16 hum.JumpPower = 50 end
                for _,v in ipairs(lp.Character:GetDescendants()) do
                    if v:IsA("BasePart") then v.CanCollide = true end
                end
            end
            local main = game.CoreGui:FindFirstChild("HDLE_MainGUI")
            if main then main.Enabled = false end
        end)
    else
        if pg then pg:Destroy() end
        local main = game.CoreGui:FindFirstChild("HDLE_MainGUI")
        if main then main.Enabled = true end
    end
end

-- ==============================================================
-- [COMBAT LOGIC LOOP]
-- ==============================================================
RunService.RenderStepped:Connect(function()
    local Camera = workspace.CurrentCamera
    -- Update FOV Circle
    -- ضمان بقاء الواجهة مرئية على الهواتف
    if not State.isMinimized and ScreenGui and not ScreenGui.Enabled then
        ScreenGui.Enabled = true
    end

    FOVCircle.Visible = State.Combat.Aimbot.Enabled
    FOVCircle.Radius = State.Combat.Aimbot.FOV_Radius
    
    if State.Combat.Aimbot.FOV_Position == "Mouse" then
        FOVCircle.Position = UserInputService:GetMouseLocation()
    else
        FOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    end

    -- Aimbot Execution
    local target = nil
    if State.Combat.Aimbot.Enabled then
        target = GetClosestPlayer()
        
        -- FOV Reactive Color (Glow when target found)
        -- Aim Tracking Logic (Precision)
        local isPressed = State.Combat.Aimbot.AutoLock
        if not isPressed then
            local trigger = State.Combat.Aimbot.TriggerKey
            if typeof(trigger) == "EnumItem" then
                if trigger.EnumType == Enum.KeyCode then
                    isPressed = UserInputService:IsKeyDown(trigger)
                else
                    isPressed = UserInputService:IsMouseButtonPressed(trigger)
                end
            end
        end

        -- FOV Reactive Color (Glow ONLY when active and target found)
        if target and isPressed then
            FOVCircle.Color = Color3.fromRGB(255, 0, 0) -- Bright Red Glow
            FOVCircle.Transparency = 1
        else
            FOVCircle.Color = Color3.fromRGB(0, 255, 150) -- Default Accent
            FOVCircle.Transparency = 0.7
        end

        -- Auto Shoot Logic (Forceful)
        local lastShot = State.lastShot or 0
        if not isMobile and State.Combat.Aimbot.AutoShoot and target and tick() - lastShot > 0.2 then
            State.lastShot = tick()
            local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
            
            -- Always try tool activation for Internal logic
            if tool then
                tool:Activate()
                if isMobile then task.spawn(function() task.wait(0.05) if tool and tool.Parent then tool:Activate() end end) end
            end
            
            -- Simulate coordinate click ONLY if in ScreenPos mode
            if State.Combat.Aimbot.FireMode == "ScreenPos" then
                SimulateClick(State.Combat.Aimbot.ShootKey)
            elseif not isMobile then
                SimulateClick(State.Combat.Aimbot.ShootKey)
            end
        end

        if isPressed and target and target.Character then
            local part = target.Character:FindFirstChild(State.Combat.Aimbot.TargetPart)
            local hum = target.Character:FindFirstChildOfClass("Humanoid")
            
            if part and hum and hum.Health > 0 then
                if State.Combat.Aimbot.Click_Speed >= 1 then
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, part.Position)
                else
                    local lookAt = CFrame.new(Camera.CFrame.Position, part.Position)
                    Camera.CFrame = Camera.CFrame:Lerp(lookAt, State.Combat.Aimbot.Click_Speed)
                end
            end
        end
    end

    -- ESP Execution
    for p, el in pairs(ESP_Elements) do
        local char = p.Character
        if State.Combat.ESP.Enabled and char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChildOfClass("Humanoid") and char.Humanoid.Health > 0 then
            local hrp = char.HumanoidRootPart
            local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            
            if onScreen then
                local dist = (hrp.Position - Camera.CFrame.Position).Magnitude
                local height = (Camera.ViewportSize.Y / dist) * 10 
                local width = height * 0.6
                
                el.Box.Visible = State.Combat.ESP.Boxes
                el.Box.Size = Vector2.new(width, height)
                el.Box.Position = Vector2.new(screenPos.X - width/2, screenPos.Y - height/2)
                
                el.Tracer.Visible = State.Combat.ESP.Tracers
                el.Tracer.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
                el.Tracer.To = Vector2.new(screenPos.X, screenPos.Y + height/2)
                
                el.Name.Visible = State.Combat.ESP.Names
                el.Name.Text = p.DisplayName
                el.Name.Position = Vector2.new(screenPos.X, screenPos.Y - height/2 - 20)
                
                el.Info.Visible = State.Combat.ESP.Health or State.Combat.ESP.Distance
                local infoTxt = ""
                if State.Combat.ESP.Health then infoTxt = infoTxt .. "HP: " .. math.floor(char.Humanoid.Health) .. "% " end
                if State.Combat.ESP.Distance then infoTxt = infoTxt .. "[" .. math.floor(dist) .. "m]" end
                el.Info.Text = infoTxt
                el.Info.Position = Vector2.new(screenPos.X, screenPos.Y + height/2 + 5)
            else
                for _, part in pairs(el) do part.Visible = false end
            end
        else
            for _, part in pairs(el) do part.Visible = false end
        end
    end
end)

local function StartHeartbeat(activeKey)
    -- تم إيقاف الفحص المتكرر بناء على طلبك. الفحص الآن يتم مرة واحدة فقط عند التشغيل الأولي للسكربت.
    print("[HDLE] 🛑 Heartbeat loop is disabled. Verification is done once at startup only.")
end

-- ==============================================================
-- [Startup] — عند انتهاء المفتاح: delfile على FileName فقط (لا LocFileName)
-- ==============================================================
local function Start()
    print("[HDLE] DEBUG: Startup Initiated.")
    
    local function AbsoluteCleanup()
        local names = {"HDLE_MainGUI", "HDLE_KeySystem", "HDLE_RestoreIcon"}
        for _, name in ipairs(names) do
            local old = game.CoreGui:FindFirstChild(name)
            if old then pcall(function() old:Destroy() end) end
        end
    end
    AbsoluteCleanup()

    if not (writefile and readfile) then 
        warn("[HDLE] ERROR: Your executor does NOT support file saving! Persistence will not work.") 
    end

    if not IsEnvironmentSafe() then 
        warn("[HDLE] Security: Environment Tampering Detected.") 
        return 
    end

    InitLanguage()
    local expectedKey = GenerateKey()

    local function GetSavedData()
        print("[HDLE] DEBUG: Looking for file: " .. CONFIG.FileName)
        if not readfile or not isfile or not isfile(CONFIG.FileName) then 
            print("[HDLE] DEBUG: File not found on disk.")
            return nil 
        end
        
        local success, content = pcall(readfile, CONFIG.FileName)
        if not success or not content or content == "" then
            print("[HDLE] DEBUG: Failed to read file or file is empty.")
            return nil
        end
        
        print("[HDLE] DEBUG: File found. Content length: " .. #content)
        
        -- [Key Decryption]
        local ok, decodedText = pcall(function() return Cipher(B64Dec(content), GetCipherKey()) end)
        if not ok then 
            warn("[HDLE] DEBUG: Decryption failed.")
            return nil 
        end
        
        local ok2, data = pcall(function() return HttpService:JSONDecode(decodedText) end)
        if ok2 and type(data) == "table" then
            print("[HDLE] DEBUG: JSON Decode successful.")
            -- [Hardware Binding Check]
            local savedUid = tostring(data.UserId)
            local currentUid = tostring(player.UserId)

            if savedUid ~= currentUid then
                warn("[HDLE] DEBUG: UserID Mismatch! Saved: " .. savedUid .. ", Current: " .. currentUid)
                return nil
            end
            return data 
        else
            warn("[HDLE] DEBUG: JSON Decode failed.")
        end
        return nil
    end

    local data = GetSavedData()
    if data then
        print("[HDLE] DEBUG: Checking session integrity...")
        local curHash = GetChecksum(data)
        if data.Hash == curHash then
            local expiry = tonumber(data.ExpiryTime)
            if expiry and os.time() < expiry then
                print("[HDLE] DEBUG: Session valid! Auto-loading GUI...")
                
                pcall(function()
                    task.spawn(function()
                        local serverResult = VerifyKeyRemote(data.Key)

                        if serverResult and serverResult.valid then
                            -- استخدم وقت السيرفر دائماً إذا كان متاحاً
                            if serverResult.expiry then
                                State.expiryTimestamp = math.floor(serverResult.expiry)
                                print("[HDLE] ⏱ وقت الانتهاء مزامَن من السيرفر: " .. tostring(serverResult.expiry_formatted))
                            else
                                -- السيرفر لم يُرسل expiry (حالة نادرة) — استخدم المحلي
                                State.expiryTimestamp = math.floor(data.ExpiryTime)
                                print("[HDLE] ⏱ وقت الانتهاء من الملف المحلي (السيرفر لم يُرسل expiry).")
                            end
                            
                            -- حدّث الملف المحلي بالوقت الجديد من السيرفر لضمان استمرارية الدقة
                            pcall(function()
                                local newData = {
                                    Key        = data.Key,
                                    ExpiryTime = State.expiryTimestamp,
                                    CreatedAt  = data.CreatedAt,
                                    UserId     = player.UserId,
                                    Type       = data.Type or "VIP"
                                }
                                newData.Hash = GetChecksum(newData)
                                if writefile then
                                    local enc = B64Enc(Cipher(HttpService:JSONEncode(newData), GetCipherKey()))
                                    writefile(CONFIG.FileName, enc)
                                    print("[HDLE] ✅ الملف المحلي حُدِّث بوقت السيرفر.")
                                end
                            end)

                            pcall(function() BuildMainGUI(_G_TOKEN) end)
                            task.spawn(function() StartHeartbeat(data.Key) end)

                        elseif serverResult and serverResult.offline then
                            -- لا يوجد اتصال — استخدم الوقت المحلي مؤقتاً
                            warn("[HDLE] ⚠️ Offline — استخدام وقت الانتهاء المحلي مؤقتاً.")
                            State.expiryTimestamp = math.floor(data.ExpiryTime)
                            pcall(function() BuildMainGUI(_G_TOKEN) end)
                            task.spawn(function() StartHeartbeat(data.Key) end)

                        elseif serverResult and serverResult.reason == "paused" then
                            -- حالة الإيقاف المؤقت
                            warn("[HDLE] Saved session is PAUSED. Waiting for resume...")
                            State.expiryTimestamp = math.floor(data.ExpiryTime)
                            pcall(function() BuildMainGUI(_G_TOKEN) end)
                            ShowPauseScreen(true)
                            task.spawn(function() StartHeartbeat(data.Key) end)
                        else
                            -- المفتاح مُبطَل أو منتهي على السيرفر
                            warn("[HDLE] ❌ الجلسة مرفوضة من السيرفر: " .. tostring(serverResult and serverResult.reason))
                            if delfile and isfile and isfile(CONFIG.FileName) then
                                delfile(CONFIG.FileName)
                            end
                            BuildKeyGUI(GenerateKey(), function(token)
                                pcall(function() BuildMainGUI(token) end)
                            end)
                        end
                    end)
                end)
                return
            end
            
            -- Daily Key Logic
            if data.Key == expectedKey then
                print("[HDLE] DEBUG: Daily key recognized. Renewing for today...")
                local d = os.date("!*t")
                local remainingToday = 86400 - ((d.hour*3600)+(d.min*60)+d.sec)
                local newExpiry = math.floor(os.time() + remainingToday)
                State.expiryTimestamp = newExpiry
                
                pcall(function()
                    local newData = {
                        Key=data.Key, ExpiryTime=newExpiry, CreatedAt=math.floor(os.time()), 
                        UserId=player.UserId, Type="Daily-Renewed"
                    }
                    newData.Hash = GetChecksum(newData)
                    if writefile then 
                        local enc = B64Enc(Cipher(HttpService:JSONEncode(newData), GetCipherKey()))
                        writefile(CONFIG.FileName, enc)
                        print("[HDLE] DEBUG: Daily session renewed and saved.")
                    end
                end)

                pcall(function() BuildMainGUI(_G_TOKEN) end)
                return
            end
            warn("[HDLE] DEBUG: Session expired.")
        else
            warn("[HDLE] DEBUG: Integrity check failed (Hash Mismatch).")
        end
        if delfile then pcall(delfile, CONFIG.FileName) end
    end

    print("[HDLE] DEBUG: Falling back to Key Entry GUI.")
    BuildKeyGUI(expectedKey, function(token)
        if CONFIG.UseGitHub then
            pcall(function() loadstring(game:HttpGet(CONFIG.GitHubRaw))() end)
        else
            pcall(function() BuildMainGUI(token) end)
        end
    end)
end

print("[HDLE] Executing Startup...")
local success, err = pcall(Start)
if not success then
    warn("[HDLE] Critical Startup Error: " .. tostring(err))
    -- طوارئ: محاولة إظهار واجهة المفاتيح إذا فشلت البداية
    pcall(function() BuildKeyGUI(GenerateKey(), BuildMainGUI) end)
end

-- [[ UI SAFETY LOOP (Mobile Persistence) ]]
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    task.spawn(function()
        while task.wait(0.5) do
            local ScreenGui = game.CoreGui:FindFirstChild("HDLE_MainGUI")
            if ScreenGui and not State.isMinimized then
                if not ScreenGui.Enabled then ScreenGui.Enabled = true end
                local Frame = ScreenGui:FindFirstChildOfClass("Frame")
                if Frame and not Frame.Visible then Frame.Visible = true end
            end
        end
    end)
end

