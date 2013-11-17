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
zero_matrix(N, M, [K|Ks]) :-
    N1 is N - 1,
    zero_vector(M, K),
    zero_matrix(N1, M, Ks).

%%  zero_vector(+Size, ?List) is det
%
%   Generates a m long vector containing only zeros.

zero_vector(0, []) :- !.
zero_vector(M, [0|Ks]) :-
    M1 is M - 1,
    zero_vector(M1, Ks).

%%  transpose(+Matrix, ?Transpose) is det
%
%   Transposes a matrix (squared or rectangular).
%   Uses transpose/3 and first_column/3 with an accumulator.

transpose([A|As], At) :-
    transpose(A, [A|As], At).

%   transpose(+Matrix, +Accumulator, ?Transpose)

transpose([], _, []).
transpose([_|As], Rest, [At|Ats]) :-
    first_column(Rest, At, NewRest),
    transpose(As, NewRest, Ats).

%   first_column(+Matrix, ?List, ?Rest)

first_column([], [], []).
first_column([[A|As]|Ass], [A|Acc], [As|Rest]) :-
    first_column(Ass, Acc, Rest).

%%  symmetric(+Matrix) is det
%   
%   Checks if matrix equals its transpose with transpose/2.

symmetric(A) :- transpose(A, A).

%%  scalar_matrix_mult(+Scalar, +Matrix, ?Matrix) is det
%
%   Multiplies scalar with every element in matrix.
%   Uses scalar_vector_mult/3 for each row in matrix.

scalar_matrix_mult(_, [], []) :- !.
scalar_matrix_mult(S, [R|Rs], [A|As]) :-
    scalar_vector_mult(S, R, A),
    scalar_matrix_mult(S, Rs, As).

%%  scalar_vector_mult(+Scalar, +List, ?List) is det
%
%   Multiplies scalar with every element in list.

scalar_vector_mult(_, [], []) :- !.
scalar_vector_mult(S, [R|Rs], [R1|A]) :-
    R1 is S * R,
    scalar_vector_mult(S, Rs, A).

%%  size(+Matrix, ?Rows, ?Cols) is det
%
%   Calculates number of rows and columns in matrix.
%   Uses built in length/2 for calculation.
%   Also uses valid/1 to verify the dimension.

size([], 0, _).
size([A|As], Rows, Cols) :-
        valid([A|As]),
        length(A, Cols),
        length([A|As], Rows).

%%  valid(+Matrix) is det
%
%   Checks if matrix has the same amount of elements in each row.

valid([[A|As]|Ass]) :-
    length([A|As], Cols),
    valid(Ass, Cols).

%   valid(+Matrix, +Cols)

valid([], _).
valid([A|As], Cols) :-
    length(A, Cols),
    valid(As, Cols).

%%  add_matrices(+Matrix, +Matrix, ?Matrix) is det
%
%   Adds given matrices if their dimensions are equal.
%   Uses add_vectors/3 to perform addition on each row.

add_matrices([], [], []).
add_matrices([A|As], [B|Bs], [R|Rs]) :-
    add_vectors(A, B, R),
    add_matrices(As, Bs, Rs).

%   add_vectors(+List, +List, ?List) is det

add_vectors([], [], []).
add_vectors([A|As], [B|Bs], [R|Rs]) :-
    R is A + B,
    add_vectors(As, Bs, Rs).
