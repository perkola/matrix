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

[Coding guidelines for Prolog] [1]
-------------
[1]: http://www.ai.uga.edu/mc/plcoding.pdf      "plcoding.pdf"