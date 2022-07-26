% testing a way to place a counter in the connect 4 board.

function [ board ] = placeCounterTesting(board, position, counter)
notPlaced = true;
col = 7;
while notPlaced
    if board(col, position*2) == " "
        board(col, position*2) = counter;
        notPlaced = false;
    end
    col = col - 1;
end



end

