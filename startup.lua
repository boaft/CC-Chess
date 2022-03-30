function setup()
  surface = dofile("surface")
  monitor = peripheral.wrap("back")
  monitor.setTextScale(0.5)
  term.redirect(monitor)
  width, height = term.getSize()
  screen = surface.create(width, height)
  font = surface.loadFont(surface.load("font"))
  board = surface.load("test.nfp")
  location={0,0}
end
function test()
  screen:clear(colors.blue)
  screen:drawSurface(board,0,0,121,81)
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
