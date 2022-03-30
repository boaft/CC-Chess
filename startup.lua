--TODO
--Make pieces
--Make array of all possible squares using get touch
--Make setup pieces function
--Make move logic
--Make timers and start game **players both hit start on thier screens within 3 seconds

function setup()
  surface = dofile("surface")
  monitor = peripheral.wrap("back")
  monitor.setTextScale(0.5)
  term.redirect(monitor)
  width, height = term.getSize()
  screen = surface.create(width, height)
  font = surface.loadFont(surface.load("font"))
  board = surface.load("test.nfp")
  pawn_white = surface.load("pawn_white.nfp")
  pawn_black = surface.load("pawn_black.nfp")
  location={0,0}
end
function test()
  screen:clear(colors.blue)
  screen:drawSurface(board,0,0,121,81)
  screen:drawSurface(pawn_white,2,2,6,3)
  screen:drawSurface(pawn_black,10,10,6,3)
  screen:output()
  -- while true do
  --   event, side, xPos, yPos = os.pullEvent("monitor_touch")
  --   print(event .. " => Side: " .. tostring(side) .. ", " ..
  --   "X: " .. tostring(xPos) .. ", " ..
  --   "Y: " .. tostring(yPos))
  -- end
end

setup()
test()
