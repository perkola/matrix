Prolog - matrix
================================
Basic matrix implementation in Prolog.

Predicates in matrix.pl (so far)
-------------------------
* zero_matrix(+Dimension, ?Matrix)
* zero_matrix(+Rows, +Columns, ?Matrix)
* zero_vector(+Size, ?List)
* transpose(+Matrix, ?Transpose)
* symmetric(+Matrix)
* scalar_matrix_mult(+Scalar, +Matrix, ?Matrix)
* scalar_vector_mult(+Scalar, +Vector, ?Vector)
* size(+Matrix, ?Rows, ?Cols)
* valid(+Matrix)
* add_matrices(+Matrix, +Matrix, ?Matrix)

Coding guidelines for Prolog
-------------------------
I tried to follow [these] [1] guidelines as much as possible.
[1]: http://www.ai.uga.edu/mc/plcoding.pdf      "plcoding.pdf"
