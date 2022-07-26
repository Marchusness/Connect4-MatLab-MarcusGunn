% testing a function to test if a move was legal. once this finction worked
% i coppied it to the legalMove function which was used in the game.

function [ legal ] = legalMoveTesting(board, position)
legal = false;
if position > 0 && position < 8
    if board(2, position*2) == " "
        legal = true;
    end
end
end

