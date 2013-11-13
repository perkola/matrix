%%  zero_matrix(+Dimension, ?Matrix) is det
%
%   Generates a square zero matrix K with dimension n*n.

zero_matrix(N, K) :-
    zero_matrix(N, N, K).

%%  zero_matrix(+Rows, +Columns, ?Matrix) is det
%
%   Generates a zero matrix K with n rows and m zeros in each row.

zero_matrix(0, _, []) :- !.
zero_matrix(N, M, [L|K]) :-
    N1 is N - 1,
    zero_list(M, L),
    zero_matrix(N1, M, K).

%   zero_list(+Size, ?List)

zero_list(0, []) :- !.
zero_list(M, [0|L]) :-
    M1 is M - 1,
    zero_list(M1, L).