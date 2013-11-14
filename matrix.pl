%%  zero_matrix(+Dimension, ?Matrix) is det
%
%   Generates a square zero matrix K with dimension n*n.
%   Uses zero_matrix/3 with both n and m equal.

zero_matrix(N, K) :-
    zero_matrix(N, N, K).

%%  zero_matrix(+Rows, +Columns, ?Matrix) is det
%
%   Generates a zero matrix K with n rows and m zeros in each row.
%   Uses zero_vector/2 to generate each row of zero vectors.

zero_matrix(0, _, []) :- !.
zero_matrix(N, M, [L|K]) :-
    N1 is N - 1,
    zero_vector(M, L),
    zero_matrix(N1, M, K).

%%  zero_vector(+Size, ?List) is det
%
%   Generates a m long vector containing only zeros.

zero_vector(0, []) :- !.
zero_vector(M, [0|L]) :-
    M1 is M - 1,
    zero_vector(M1, L).

%%  transpose(+Matrix, ?Transpose) is det
%
%   Transposes a matrix (squared or rectangular).
%   Uses transpose/3 and first_column/3 with an accumulator.

transpose([R|A], At) :-
    transpose(R, [R|A], At).

%   transpose(+Matrix, +Accumulator, ?Transpose)

transpose([], _, []).
transpose([_|Rs], Rest, [Rt|At]) :-
    first_column(Rest, Rt, NewRest),
    transpose(Rs, NewRest, At).

%   first_column(+Matrix, ?List, ?Rest)

first_column([], [], []).
first_column([[E|R]|Rs], [E|Acc], [R|Rest]) :-
    first_column(Rs, Acc, Rest).