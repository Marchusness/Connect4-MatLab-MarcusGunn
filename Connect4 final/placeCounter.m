% takes in inputs board (the current connect 4 board at the time) position
% (column) and the type of counter (Usualy "x" or "o") returns the board
% with the counter placed in that column
function [ board ] = placeCounter(board, position, counter)
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

