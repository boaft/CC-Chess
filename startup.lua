--TODO
--https://en.wikipedia.org/wiki/Descriptive_notation
--Make array of all possible squares using get touch
--Make setup pieces function
--Make move logic
--Make timers and start game **players both hit start on thier screens within 3 seconds
local function round(num, mult)
  return math.floor(num / mult + 0.5) * mult
end

function debug()
  term.redirect(testview)
  while true do
    event, side, xPos, yPos = os.pullEvent("monitor_touch") 
    x=math.floor(xPos/15)+1
    y=math.ceil(yPos/10)
    print(event .. " => Side: " .. tostring(side) .. ", " ..
    "x: " .. tostring(x) .. ", " ..
    "y: " .. tostring(y))
  end
end

function setup()
  surface = dofile("surface")
  monitor = peripheral.wrap("back")
  testview=peripheral.wrap("top")
  monitor.setTextScale(0.5)
  term.redirect(monitor)

  width, height = term.getSize()
  screen = surface.create(width, height,colors.white)
  font = surface.loadFont(surface.load("font"))

  board=surface.load("board.nfp")
  selection=surface.load("selection.nfp")
  pawn_white = surface.load("w_pawn.nfp")
  select_pawn_white=surface.load("w_pawn_select.nfp")
  pawn_black = surface.load("b_pawn.nfp")
  rook_white = surface.load("w_rook.nfp")
  rook_black = surface.load("b_rook.nfp")
  knight_white = surface.load("w_knight.nfp")
  knight_black = surface.load("b_knight.nfp")
  bishop_white = surface.load("w_bishop.nfp")
  bishop_black = surface.load("b_bishop.nfp")
  king_white = surface.load("w_king.nfp")
  king_black = surface.load("b_king.nfp")
  queen_white=surface.load("w_queen.nfp")
  queen_black=surface.load("b_queen.nfp")

  squares={
    {10,15},{10,30},{10,45},{10,60},{10,76},{10,91},{10,106},{10,121},
    {20,15},{20,30},{20,45},{20,60},{20,76},{20,91},{20,106},{20,121},
    {30,15},{30,30},{30,45},{30,60},{30,76},{30,91},{30,106},{30,121},
    {40,15},{40,30},{40,45},{40,60},{40,76},{40,91},{40,106},{40,121},
    {51,15},{51,30},{51,45},{51,60},{51,76},{51,91},{51,106},{51,121},
    {61,15},{61,30},{61,45},{61,60},{61,76},{61,91},{61,106},{61,121},
    {71,15},{71,30},{71,45},{71,60},{71,76},{71,91},{71,106},{71,121},
    {81,15},{81,30},{81,45},{81,60},{81,76},{81,91},{81,106},{81,121}
  }
  memory={
    {"Brook"},{"Bknight"},{"Bbishop"},{"Bqueen"},{"Bking"},{"Bbishop"},{"Bknight"},{"Brook"},
    {"Bpawn"},{"Bpawn"},{"Bpawn"},{"Bpawn"},{"Bpawn"},{"Bpawn"},{"Bpawn"},{"Bpawn"},
    {"X"},{"X"},{"X"},{"X"},{"X"},{"X"},{"X"},{"X"},
    {"X"},{"X"},{"X"},{"X"},{"X"},{"X"},{"X"},{"X"},
    {"X"},{"X"},{"X"},{"X"},{"X"},{"X"},{"X"},{"X"},
    {"X"},{"X"},{"X"},{"X"},{"X"},{"X"},{"X"},{"X"},
    {"Wpawn"},{"Wpawn"},{"Wpawn"},{"Wpawn"},{"Wpawn"},{"Wpawn"},{"Wpawn"},{"Wpawn"},
    {"Wrook"},{"Wknight"},{"Wbishop"},{"Wqueen"},{"Wking"},{"Wbishop"},{"Wknight"},{"Wrook"}
  }
end

function draw_board()
  flag=1
  for j=1,8 do
    if flag==5 then
      for i=2,8,2 do
      screen:fillRect((squares[i][2])-15,squares[j*8][1]-11,15,11,colors.black)
      if i==5 then
        screen:fillRect((squares[i][2])-16,squares[j*8][1]-10,16,10,colors.black)
      end
      end
    elseif flag%2==0 then
      for i=1,8,2 do
      screen:fillRect((squares[i][2])-15,squares[j*8][1]-10,15,10,colors.black)
      if i==5 then
        screen:fillRect((squares[i][2])-16,squares[j*8][1]-10,16,10,colors.black)
      end
      end
    else
      for i=2,8,2 do
      screen:fillRect((squares[i][2])-15,squares[j*8][1]-10,15,10,colors.black)
      if i==5 then
        screen:fillRect((squares[i][2])-16,squares[j*8][1]-10,16,10,colors.black)
      end
      end
    end
    flag=flag+1
  end
  screen:output()
end

function player_selection()
  flag=0
  while true do
    event, side, xPos, yPos = os.pullEvent("monitor_touch") 
    x=math.floor(xPos/15)+1
    y=math.ceil(yPos/10)
    if x==5 and y~=5 then
      screen:drawRect((squares[x][2])-16, (squares[y*8][1])-10, 16, 10,colors.red)
    elseif y==5 and x~=5 then
      screen:drawRect((squares[x][2])-15, (squares[y*8][1])-11, 15, 11,colors.red)
    elseif y==5 and x==5 then
      screen:drawRect((squares[x][2])-16, (squares[y*8][1])-11, 16, 11,colors.red)
    else
      screen:drawSurface(pawn_white,(squares[x][2])-10,(squares[y*8][1])-6)
    end
  end
end

function pieces_setup()
  for i=1,8 do
    if i==1 or i==8 then
      screen:drawSurface(rook_white,squares[i][2]-10,squares[8*8][1]-6)
      screen:drawSurface(rook_black,squares[i][2]-10,squares[8*1][1]-8)
    elseif i==2 or i==7 then
      screen:drawSurface(knight_white,squares[i][2]-10,squares[8*8][1]-6)
      screen:drawSurface(knight_black,squares[i][2]-10,squares[8*1][1]-8)
    elseif i==3 or i==6 then
      screen:drawSurface(bishop_white,squares[i][2]-10,squares[8*8][1]-6)
      screen:drawSurface(bishop_black,squares[i][2]-10,squares[8*1][1]-8)
    elseif i==4 then
      screen:drawSurface(king_white,squares[i][2]-10,squares[8*8][1]-6)
      screen:drawSurface(king_black,squares[i][2]-10,squares[8*1][1]-8)
    elseif i==5 then
      screen:drawSurface(queen_white,squares[i][2]-10,squares[8*8][1]-6)
      screen:drawSurface(queen_black,squares[i][2]-10,squares[8*1][1]-8)
    end
    screen:drawSurface(pawn_white,(squares[i][2])-10,(squares[8*7][1])-6)
    screen:drawSurface(pawn_black,(squares[i][2])-10,(squares[8*2][1])-7)
    screen:output()
    os.sleep(0.25)
  end
end

function test()
  --draw_board()
  screen:drawSurface(board,0,0,width,height)
  pieces_setup()
  screen:drawSurface(select_pawn_white,5,5,100,100)
  player_selection()
end

setup()
test()
