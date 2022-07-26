% Connect 4 - All code was written by Marcus Gunn

% the connect4 driver is the code that must be run in order to play the
% connect 4 game.

% first the board is initialised. initialising the board like this allowed
% for the use of '|' to make the columns look nicer and to number the
% columns
fprintf("\n")
Board = [
    '.1 2 3 4 5 6 7.';
    '| | | | | | | |';
    '| | | | | | | |';
    '| | | | | | | |';
    '| | | | | | | |';
    '| | | | | | | |';
    '| | | | | | | |'
];

% asks the user to select a game type. will loop until a valid gameType is
% selected
gameTypeSelected = false;
while ~gameTypeSelected 
    gameType = input("Enter Game type: verse computer (type: c) or 2 player (type: p)", "s");
    if gameType == "c" || gameType == "p"
        gameTypeSelected = true;
    end
end

winnerDecided = false; % required to the later 'while' functionality

% depending on the user input of c or p the game type will be started
if gameType == "c"
    disp(Board);
    turns = 0;
    difficulty = input("Select a computer difficulty (enter '1' for easiest and '10' for hardest): ");
    while ~winnerDecided % will loop until winner is decided
        if turns == 21 
            winnerDecided = true;
            disp("It was a draw.");
        end
        player1 = 0; % column where they put the counter
        player2 = 0; % player 2 is the computer
        while ~legalMove(Board, player1) % will loop until the legal move function returns a true. legalMove function tests if the move it legal and returns true. and if not legal will return false
            player1 = input("Player 1: Which row would you like to put your counter? ");
        end
        Board = placeCounter(Board, player1, "x"); % placeCounter function return the Board with a "x" counter in the column position defined by the variable player1
        turns = turns + 1;
        if testConnect4(Board, player1) % testConnect4 function takes in the Board and tests if the last move resulted in a connect 4 and if a connect 4 is achieved true is returned
            winnerDecided = true;
            disp(Board);
            disp("Human wins!"); % if connect4 is achieved winner decided = true stops the while loop. disp(Board) displays it for the user in the command window. and Disp("human wins") shows the winner
        else % if testConnect4 returns false as a connect 4 was not achieved the following code will run instead
            player2 = computerMove(Board,difficulty, turns); % function that generates a good comumn to put the computer counter
            Board = placeCounter(Board, player2, "o"); % places the computer counter, "o"
            disp(Board); % displayes the board for the user to chose their next column
            if testConnect4(Board, player2) % if connect 4 is achieved the loop will stop (winnerdecided = true) and computer wins will be displayed.
                winnerDecided = true;
                disp("Computer wins!")
            end
        end
    end
elseif gameType == "p"
    disp(Board);
    turns = 0;
    while ~winnerDecided % will loop until winner is decided
        if turns == 21 
            winnerDecided = true;
            disp("It was a draw.");
        end
        player1 = 0; % required to allow for the while ~legalMove(Board, player1) to start looping
        player2 = 0;
        while ~legalMove(Board, player1) % loop until a legal move is inputted from the player.
            player1 = input("Player 1: Which row would you like to put your counter? ");
        end
        Board = placeCounter(Board, player1, "x"); % places a counter, "x" in the position selected by player 1
        turns = turns + 1;
        disp(Board);
        if testConnect4(Board, player1) % tests if the counter placed causes connect 4
            winnerDecided = true; % stops loop and ends the game
            disp("Player 1 wins!")
        else
            while ~legalMove(Board, player2) % loop until a legal move is inputted from the player.
                player2 = input("Player 2: Which row would you like to put your counter? ");
            end
            Board = placeCounter(Board, player2, "o"); % places a counter, "o" in the position selected by player 2
            disp(Board);
            if testConnect4(Board, player2) % tests if the counter placed causes connect 4
                winnerDecided = true;
                disp("Player 2 wins!")
            end
        end
    end
end
