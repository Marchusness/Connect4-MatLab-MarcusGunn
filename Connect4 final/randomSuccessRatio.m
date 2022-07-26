% function which averages the wins and losses from many simulated games and
% retur the average

function [ successRatio ] = randomSuccessRatio(board, firstMove, iterations)
results = [];
for i = 1:iterations
    winnerDecided = false;
    Board = placeCounter(board, firstMove, "o");
    moves = legalMoveVector(Board);
    while ~winnerDecided % will loop until the game ends
        if moves == [0 0 0 0 0 0 0]
            winnerDecided = true;
            results = [results 10]; % if draw appends results with 10
%             disp("draw"); code used to test if the code was functioning
%             correctly. way used to identify that this function wasnt
%             creating a new 'Board' from the 'board' input each itteration.
        else
            Player1 = 0;
            for j = 1:7 % always tests if the simulated player can can win instantly
                if moves(j) > 0
                    if testConnect4(placeCounter(Board, j, "x"),j)
                        Player1 = j;
                    end
                end
            end
            if Player1 == 0
                for j = 1:7 % if simulated player cant win instantly they will test if they can block a connect 4 
                    if moves(j) > 0
                        if testConnect4(placeCounter(Board, j, "o"),j)
                            Player1 = j;
                        end
                    end
                end
            end
            if Player1 == 0 % if the simulated player cannot wins instantly and cannot block a connect 4 a random place will be generated
                Player1 = randi(7);
            end
            while moves(Player1) < 1
                Player1 = randi(7);
            end
            moves(Player1) = moves(Player1)-1;
            Board = placeCounter(Board, Player1, "x");
            if testConnect4(Board, Player1)
                winnerDecided = true;
                results = [results 1]; % if simulated computer side lost appends results with 1
%                 disp("player won"); code used to test if the code was functioning
%             correctly. way used to identify that this function wasnt
%             creating a new 'Board' from the 'board' input each itteration.
            else
                if moves == [0 0 0 0 0 0 0]
                    winnerDecided = true;
                    results = [results 10]; % if draw appends results with 10
%                     disp("draw"); code used to test if the code was functioning
%             correctly. way used to identify that this function wasnt
%             creating a new 'Board' from the 'board' input each itteration.
                else
                    Player2 = 0;
                    for j = 1:7
                        if moves(j) > 0 % always tests if the simulated player can can win instantly
                            if testConnect4(placeCounter(Board, j, "o"),j)
                                Player2 = j;
                            end
                        end
                    end
                    if Player2 == 0
                        for j = 1:7
                            if moves(j) > 0 % if simulated player cant win instantly they will test if they can block a connect 4 
                                if testConnect4(placeCounter(Board, j, "x"),j)
                                    Player2 = j;
                                end
                            end
                        end
                    end
                    if Player2 == 0 % if the simulated player cannot wins instantly and cannot block a connect 4 a random place will be generated
                        Player2 = randi(7);
                    end
                    while moves(Player2) < 1
                        Player2 = randi(7);
                    end
                    moves(Player2) = moves(Player2)-1;
                    Board = placeCounter(Board, Player2, "o");
                    if testConnect4(Board, Player2)
                        winnerDecided = true;
                        results = [results 100]; % if simulated computer side won appends results with 100
%                         disp("Computer won"); code used to test if the code was functioning
%             correctly. way used to identify that this function wasnt
%             creating a new 'Board' from the 'board' input each itteration.
                    end
                end
            end
        end
    end
end

successRatio = mean(results); % returns the average from all the simulations
end