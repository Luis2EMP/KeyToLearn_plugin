--KeyToLearn plugin, for 1.2.0 stable version of Xournal++

--Hex values to my colors                   -- RGB          (order of usage, kinda)
local GraphiteColor   = 0x292929            -- 41 41 41
local blueColor       = 0x1982c4            -- 25 130 196
local purpleColor     = 0x5B0888  --Novo    -- 91 8 136
local greenColor      = 0x86DA3B  --Novo    -- 134 218 59
local yellowColor     = 0xFFCA3A            -- 255 202 58
local redColor        = 0xC53737            -- 197 55 55
local orangeColor     = 0xFF9041  --Novo    -- 255 144 65
local offWhiteColor   = 0xF8F8F2            -- 248 248 242
local fullBlack       = 0x000000            -- 0 0 0
local whiteColor      = 0xFFFFFF            -- 255 255 255
local lightBlueColor  = 0x83b5d1  --Novo    -- 131 181 209
local lightPurpleColor= 0x935D96  --Novo    -- 147 93 150
local brownColor      = 0xA9794D  --Novo    -- 169 121 77

--Same colors but softer sufix-S
local blueColorS        = 0x3091cf          -- 48 145 207
local purpleColorS      = 0x671e8f          -- 103 30 143
local greenColorS       = 0x98e058          -- 152 224 88
local yellowColorS      = 0xffd257          -- 255 210 87
local redColorS         = 0xd14343          -- 209 67 67
local orangeColorS      = 0xfc9a53          -- 252 154 83

--0x232323 KLT Background Dark Mode

--Fonts 
local fontname1 = "Times New Roman Regular"
local fontname2 = "Strawberry Muffins Demo Regular"
local fontsize1 = "6" --Similar to my FINE size writing, works for these two fonts above
local fontsize2 = "5" --Similar to my VERY_FINE size writing

--Other variables
--local linestyleList = {"PLAIN", "DASH", "DASH_DOT", "DOT"}
--local sizeList = {"VERY_FINE","FINE","MEDIUM", "THICK","VERY_THICK"}
--local drawingtypeList = {"TOOL_DRAW_RECT", "TOOL_DRAW_CIRCLE", "TOOL_DRAW_ARROW", "RULER", "TOOL_DRAW_SPLINE", "SHAPE_RECOGNIZER"} -- Don't include coordinate system and default tool
--local eraserList = {"STANDARD", "DELETE_STROKE","WHITEOUT"}

function initUi()
    --MAIN TOOLS
    app.registerUi({["menu"] = "Pen",               ["callback"] = "clickPen",              ["accelerator"] = "q"});
    app.registerUi({["menu"] = "Highlighter",       ["callback"] = "clickHighlighter",      ["accelerator"] = "w"});
    app.registerUi({["menu"] = "Eraser",            ["callback"] = "clickEraser",           ["accelerator"] = "e"});
    app.registerUi({["menu"] = "Hand",              ["callback"] = "clickHand",             ["accelerator"] = "x"});
    app.registerUi({["menu"] = "Text",              ["callback"] = "clickText",             ["accelerator"] = "t"});
    app.registerUi({["menu"] = "TEX",               ["callback"] = "clickTex",              ["accelerator"] = "<Shift>t"});

    --ACTION SIZES
    app.registerUi({["menu"] = "Size Very Fine",    ["callback"] = "clickVeryFine",         ["accelerator"] = "a"});
    app.registerUi({["menu"] = "Size Fine",         ["callback"] = "clickFine",             ["accelerator"] = "s"});
    app.registerUi({["menu"] = "Size Medium",       ["callback"] = "clickMedium",           ["accelerator"] = "d"});

    --LINE STYLES
    app.registerUi({["menu"] = "Linestyle",         ["callback"] = "linestyle",             ["accelerator"] = "f"});
    app.registerUi({["menu"] = "Fill mode",         ["callback"] = "clickFill",             ["accelerator"] = "<Shift>f"});
    app.registerUi({["menu"] = "Cycle Eraser Style",["callback"] = "eraserstyle",           ["accelerator"] = "<Shift>e"});

    --SHAPES
    app.registerUi({["menu"] = "Shape Recognizer",  ["callback"] = "clickShapeRecognizer",  ["accelerator"] = "c"});
    app.registerUi({["menu"] = "Ruler/Line",        ["callback"] = "clickRuler",            ["accelerator"] = "r"});
    app.registerUi({["menu"] = "Draw Rectangle",    ["callback"] = "clickRectangle",        ["accelerator"] = "<Shift>a"});
    app.registerUi({["menu"] = "Draw Ellipse",      ["callback"] = "clickEllipse",          ["accelerator"] = "<Shift>d"});
    app.registerUi({["menu"] = "Draw Spline",       ["callback"] = "clickSpline",           ["accelerator"] = "<Shift>s"});
    --app.registerUi({["menu"] = "Cycle Drawing Type", ["callback"] = "drawingType", ["accelerator"] = "c"});

    --SELECTIONS
    app.registerUi({["menu"] = "Select Rectangle",  ["callback"] = "clickSelectRectangle",  ["accelerator"] = "g"});
    app.registerUi({["menu"] = "Select Region",     ["callback"] = "clickSelectRegion",     ["accelerator"] = "<Shift>g"});

    --ZOOM AND PAGES
    app.registerUi({["menu"] = "Zoom In (MesaDig)", ["callback"] = "clickZoomIn",           ["accelerator"] = "<Shift>i"});     --Botão de cima da caneta
    app.registerUi({["menu"] = "Zoom Out (MesaDig)",["callback"] = "clickZoomOut",          ["accelerator"] = "<Shift>o"});     --Botão de baixo da caneta
    app.registerUi({["menu"] = "Zoom Fit ",         ["callback"] = "clickZoomFit",          ["accelerator"] = "<Shift>x"});
    --Configurar no driver da Wacom pra quando tiver Xournal++ aberto ser Shift+i no botão de cima e Shift+o no debaixo

    --OTHER FUNCTIONS
    app.registerUi({["menu"] = "Clean All",         ["callback"] = "cleanAll",              ["accelerator"] = "<Shift>q"});
    app.registerUi({["menu"] = "Grid Snap",         ["callback"] = "gridSnap",              ["accelerator"] = "v"});
    app.registerUi({["menu"] = "Angle Snap",        ["callback"] = "rotationSnap",          ["accelerator"] = "<Shift>v"});
end

---------------------------------------
--            MAIN TOOLS             --
---------------------------------------

function clickPen()
    app.uiAction({["action"] = "ACTION_TOOL_PEN"})
end

function clickEraser()
    app.uiAction({["action"] = "ACTION_TOOL_ERASER"})
    app.uiAction({["action"] = "ACTION_SIZE_VERY_FINE"})    --Só por que é muito raro eu aumentar o tamanho dela
    cleanShapes()
    cleanLinestyle()
end

function clickHighlighter()
    app.uiAction({["action"] = "ACTION_TOOL_HIGHLIGHTER"})
end

function clickHand()
    app.uiAction({["action"]="ACTION_TOOL_HAND"})
    cleanShapes()
end

function clickText()
    app.uiAction({["action"]="ACTION_TOOL_TEXT"})
end

function clickTex()
    app.uiAction({["action"] = "ACTION_TEX"})
end

---------------------------------------
--           ACTION SIZES            --
---------------------------------------

function clickVeryFine()
    app.uiAction({["action"] = "ACTION_SIZE_VERY_FINE"})
  end

function clickFine()
    app.uiAction({["action"] = "ACTION_SIZE_FINE"})
end

function clickMedium()
    app.uiAction({["action"] = "ACTION_SIZE_MEDIUM"})
end

---------------------------------------
--            LINE STYLES            --
---------------------------------------

local linestyleList = {"PLAIN", "DASH", "DASH_DOT", "DOT"}
local currentLinestyle = 1

function linestyle()
    currentLinestyle = currentLinestyle % #linestyleList + 1
    app.uiAction({["action"] = "ACTION_TOOL_LINE_STYLE_" .. linestyleList[currentLinestyle]})
end

local currentFill = false
function clickFill()
    currentFill = not currentFill
    app.uiAction({["action"]="ACTION_TOOL_FILL", ["enabled"] = currentFill})
end

local eraserList = {"STANDARD", "DELETE_STROKE"} --I don't use WHITEOUT normally
local currentEraser = 1

function eraserstyle()
    currentEraser = currentEraser % #eraserList + 1
    app.uiAction({["action"] = "ACTION_TOOL_ERASER_" .. eraserList[currentEraser]})
end

---------------------------------------
--               SHAPES              --
---------------------------------------

local drawingTypeList = {"TOOL_DRAW_RECT", "TOOL_DRAW_ELLIPSE", "TOOL_DRAW_SPLINE"}     -- Don't include coordinate system and default tool
local currentDrawingType = 1

local currentShapeRecognizer = true
function clickShapeRecognizer()
    currentShapeRecognizer = not currentShapeRecognizer
    app.uiAction({["action"] = "ACTION_SHAPE_RECOGNIZER", ["enabled"] = currentShapeRecognizer})
end

local currentRuler = false
function clickRuler()
    currentRuler = not currentRuler
    app.uiAction({["action"] = "ACTION_RULER", ["enabled"] = currentRuler})
end

--[[ function drawingType()
    currentDrawingType = currentDrawingType % #drawingTypeList + 1
    app.uiAction({["action"] = "ACTION_" .. drawingTypeList[currentDrawingType]})
    print("ACTION_" .. drawingTypeList[currentDrawingType])
end ]]

local currentRectangle = false
function clickRectangle()
    currentRectangle = not currentRectangle
    app.uiAction({["action"] = "ACTION_TOOL_DRAW_RECT", ["enabled"] = currentRectangle})
end

local currentEllipse = false
function clickEllipse()
    currentEllipse = not currentEllipse
    app.uiAction({["action"] = "ACTION_TOOL_DRAW_ELLIPSE", ["enabled"] = currentEllipse})
end

local currentSpline = false
function clickSpline()
    currentSpline = not currentSpline
    app.uiAction({["action"] = "ACTION_TOOL_DRAW_SPLINE", ["enabled"] = currentSpline})
end

---------------------------------------
--             SELECTIONS            --
---------------------------------------

function clickSelectRectangle()
    app.uiAction({["action"] = "ACTION_TOOL_SELECT_RECT"})
end

function clickSelectRegion()
    app.uiAction({["action"] = "ACTION_TOOL_SELECT_REGION"})
end

---------------------------------------
--          ZOOM AND PAGES           --
---------------------------------------

function clickZoomIn()
    app.uiAction({["action"] = "ACTION_ZOOM_IN"})
end

function clickZoomOut()
    app.uiAction({["action"] = "ACTION_ZOOM_OUT"})
end

function clickZoomFit()
    app.uiAction({["action"]="ACTION_ZOOM_FIT"})
end
  
---------------------------------------
--          OTHER FUNCTIONS          --
---------------------------------------

function cleanAll()
    --Fazer um for loop aqui pra ele limpar o highlighter, pen, e borracha, dá pra fazer com os '..' só vai mudar o EX: ACTION_TOOL_{NOME}_DRAW_ARROW
    --N precisa fazer esse loop, como ela vai limpar da ferramenta que está selecionada, logo se eu quiser limpar o 'Highlighter' eu clico 'w' e dps '<Shift>q'
    app.uiAction({["action"] = "ACTION_RULER", ["enabled"] = false})
    app.uiAction({["action"] = "ACTION_TOOL_DRAW_ARROW", ["enabled"] = false})
    app.uiAction({["action"] = "ACTION_TOOL_DRAW_RECT", ["enabled"] = false})
    app.uiAction({["action"] = "ACTION_TOOL_DRAW_ELLIPSE", ["enabled"] = false})
    app.uiAction({["action"] = "ACTION_TOOL_DRAW_SPLINE", ["enabled"] = false})
    app.uiAction({["action"] = "ACTION_TOOL_FILL", ["selection"] = true, ["enabled"] = false})
    app.uiAction({["action"] = "ACTION_TOOL_SHAPE_RECOGNIZER", ["enabled"] = false})

    app.uiAction({["action"] = "ACTION_TOOL_LINE_STYLE_PLAIN"})
    app.uiAction({["action"] = "ACTION_TOOL_PEN_SHAPE_RECOGNIZER", ["enabled"] = true})
    app.uiAction({["action"] = "ACTION_TOOL_PEN_SIZE_FINE"})
    app.uiAction({["action"] = "ACTION_TOOL_ERASER_SIZE_VERY_FINE"})
    app.uiAction({["action"] = "ACTION_TOOL_ERASER_DELETE_STROKE"})
end

function cleanShapes() --Used in other functions, not as shortcuts
    app.uiAction({["action"] = "ACTION_RULER", ["enabled"] = false})
    app.uiAction({["action"] = "ACTION_TOOL_DRAW_ARROW", ["enabled"] = false})
    app.uiAction({["action"] = "ACTION_TOOL_DRAW_RECT", ["enabled"] = false})
    app.uiAction({["action"] = "ACTION_TOOL_DRAW_ELLIPSE", ["enabled"] = false})
    app.uiAction({["action"] = "ACTION_TOOL_DRAW_SPLINE", ["enabled"] = false})
    app.uiAction({["action"] = "ACTION_TOOL_SHAPE_RECOGNIZER", ["enabled"] = false})
end

function cleanLinestyle() --Used in other functions, not as shortcuts
    app.uiAction({["action"] = "ACTION_TOOL_LINE_STYLE_PLAIN"})
    app.uiAction({["action"] = "ACTION_TOOL_FILL", ["enabled"] = false})
end

function gridSnap()
    app.uiAction({["action"]="ACTION_GRID_SNAPPING"})
end

function rotationSnap()
    app.uiAction({["action"]="ACTION_ROTATION_SNAPPING"})
end