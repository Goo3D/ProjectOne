

-- Carga de modulos externos

push = require "push" -- Libreria para gestion de resolucion de pantalla



-- Declaracion de variables iniciales

-- Resolucion de pantalla de trabajo
WINDOW_WIDTH = 1080
WINDOW_HEIGHT = 720

-- Resolucion visual
VIRTUAL_WIDTH = 640
VIRTUAL_HEIGHT = 420





--
--                 LOAD PROCESS
--


function love.load()

-- inicializacion de tamaño de ventana
      love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
          fullscreen = false,
          resizable = true,
          vsync = true
      })




--[[
-- Inicialización de push
      push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
          fullscreen = false,
          resizable = false,
          vsync = true
      })

]]


  fnumber = 0            -- Contador de frames
  modulo = 0

  mybutton = {}          -- Tabla con datos del boton
  mybutton.x = 200
  mybutton.y = 300
  mybutton.size = 40


  mouseposX = 0
  mouseposY = 0

  score = 0
  timer = 0

  myFont = love.graphics.newFont(20)

end


--
--                       UPDATE CICLE
--

function love.update(dt)

  -- Keyboard handling, called by LÖVE2D each frame;
  function love.keypressed(key)

      if key == 'escape' then  -- keys can be accessed by string name
        love.event.quit()
      end
  end



  fnumber = fnumber + 1
  modulo = fnumber % 60

  mouseposX = love.mouse.getX()
  mouseposY = love.mouse.getY()




end



--
--                         DRAW CICLE
--

function love.draw()
  --push:start() -- Aplicamos las transformaciones de escala de push

  love.graphics.setFont(myFont)

-- Print parte entera frames/60
  love.graphics.setColor(1, 1, 1)
  love.graphics.print(math.ceil ( fnumber / 60 ))

-- Print actual frame.
  love.graphics.print(modulo, 0, 30)

-- Print Mouse position on Screen
  love.graphics.print("Mouse position:" .. mouseposX .. "--" .. mouseposY, 0, 60)

-- Print Score
  love.graphics.setColor(0, 0, 1)
  love.graphics.print(score,300,50,12)

-- Print Animated Rectangle
  love.graphics.setColor(1,1,1)
  love.graphics.rectangle("fill", 100, 100, 200 + modulo , 100)

-- Print Circle
  love.graphics.setColor(1,0,0)
  love.graphics.circle("fill", mybutton.x, mybutton.y, mybutton.size)





--push:finish()  -- desactivamos push.
end



--
--                   DEFINICION DE FUNCIONES
--








-- MOUSE
function love.mousepressed ( x, y, button, istouch)

if button == 1  then
    if distance (mybutton.x, mybutton.y, love.mouse.getX(), love.mouse.getY()) < mybutton.size
    then
    score = score + 1
    mybutton.x = math.random(mybutton.size, love.graphics.getWidth() - mybutton.size)
    mybutton.y = math.random(mybutton.size, love.graphics.getHeight() - mybutton.size)
    end

  end
end

-- DISTANCE
function distance (x1,y1,x2,y2)
    return math.sqrt((y2-y1)^2 +(x2-x1)^2)
end
