--TODO
--https://en.wikipedia.org/wiki/Descriptive_notation
--Make pieces
--Make array of all possible squares using get touch
--Make setup pieces function
--Make move logic
--Make timers and start game **players both hit start on thier screens within 3 seconds

function setup()
  surface = dofile("surface")
  monitor = peripheral.wrap("back")
  --player_screen_1 = peripheral.find("monitor_1")
  --player_screen_1.setCursorPos((player_screen_1.getSize())/2)
  --player_screen_2 = peripheral.find("monitor_2")
  --player_screen_2.setCursorPos((player_screen_2.getSize())/2)
  monitor.setTextScale(0.5)
  term.redirect(monitor)
  width, height = term.getSize()
  screen = surface.create(width, height)
  font = surface.loadFont(surface.load("font"))
  board = surface.load("board.nfp")
  pawn_white = surface.load("pawn_white.nfp")
  pawn_black = surface.load("pawn_black.nfp")
  squares={
    {{},{},{},{},{},{},{},{}},
    {{},{},{},{},{},{},{},{}},
    {{},{},{},{},{},{},{},{}},
    {{},{},{},{},{},{},{},{}},
    {{},{},{},{},{},{},{},{}},
    {{},{},{},{},{},{},{},{}},
    {{},{},{},{},{},{},{},{}},
    {{},{},{},{},{},{},{},{}}
  }
end
function test()
  screen:clear(colors.blue)
  screen:drawSurface(board,0,0,121,81)
  --screen:drawSurface(pawn_white,4,64,6,3)
  screen:output()
  -- while true do
  --   event, side, xPos, yPos = os.pullEvent("monitor_touch")
  --   print(event .. " => Side: " .. tostring(side) .. ", " ..
  --   "X: " .. tostring(xPos) .. ", " ..
  --   "Y: " .. tostring(yPos))
  -- end
end
function timers()
  player_1_time=0
  player_2_time=0
  while true do
    player_screen_1.write(player_1_time)
    player_screen_2.write(player_2_time)
    os.sleep(1)
    player_1_time=player_1_time+1
    player_2_time=player_2_time+1
  end
end
function whos_turn()
end
function pieces_setup()
end
function move_logic()
end
function player_selection()
end

setup()
test()
