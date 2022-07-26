% was used to test different itteration of the computer move generator
% before finalising the one used in the final code.


function [ position ] = computerMoveTesting(board, difficulty, turns)
legalMoves = [];
for i = 1:7
    if legalMove(board, i)
        legalMoves = [legalMoves i];
    end
end
position = 0;
for j = legalMoves
    if testConnect4(placeCounter(board, j, "o"),j)
        position = j;
    end
end
if position == 0 
    for j = legalMoves
        if testConnect4(placeCounter(board, j, "x"),j)
            position = j;
        end
    end
end
if position == 0 
    if turns == 1 && board(7, 8) == "x"
        position = 3;
    end
end
if position == 0 
    if turns == 1 && (board(7, 10) == "x" || board(7, 6) == "x")
        position = 4;
    end
end
if position == 0 
    results = [];
    for j = legalMoves
        results = [results randomSuccessRatioTesting(board, j, difficulty*100)];
    end
    [~, idx] = max(results);
    disp(results)
    position = legalMoves(idx);
end


end

