% Enter your code here. Read input from STDIN. Print output to STDOUT
% Your class should be named solution

-module(solution).
-export([main/0]).

main() ->
    {MatrixSize, Matrix} = get_matrix(),
    displayPathtoPrincess(MatrixSize,Matrix). 

%%
% Path to Princess 
%%

displayPathtoPrincess(MatrixSize,Matrix) ->
    erlang:display(MatrixSize),
    erlang:display(Matrix).


%%
% Matrix
%%

get_matrix() ->
    {ok, [N]} = io:fread("Matrix Size?> ", "~u"),
    create_matrix(N).
    
%% Do nothing if matrix size is 0, N represents the matrix size 
create_matrix(N) when N =< 0 -> ok;
%% Else, create matrix
create_matrix(N) ->
    create_matrix(N,N,[]). 

%% M is the matrix (accumulator)
create_matrix(MatrixSize,Iter,M) when Iter =< 0 -> 
    {MatrixSize, M};
create_matrix(MatrixSize,Iter,M) -> 
    Line = io:get_line("matrix row> "),
    %%erlang:display(io:format("~c",[lists:nth(3,R)])),
    LineNoNewLine = string:substr(Line,1,string:len(Line)-1),
    create_matrix(MatrixSize,Iter-1,M++[LineNoNewLine]).
