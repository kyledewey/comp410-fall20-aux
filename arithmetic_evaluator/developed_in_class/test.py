#!/usr/bin/env python3

# numbers: 1, 23, 83, -7
# operations: + (addition), - (subtraction), * (multiplication), - (unary negation)

# -(1 + 2)

# create: Number(5), Number(6)
#         new Number(5), new Number(6)
class Number:
    def __init__(self, value):
        self.value = value

    def __str__(self):
        return str(self.value)

class Plus:
    def __init__(self, left, right):
        self.left = left
        self.right = right

class Minus:
    def __init__(self, left, right):
        self.left = left
        self.right = right

class Multiply:
    def __init__(self, left, right):
        self.left = left
        self.right = right

class Negate:
    def __init__(self, expr):
        self.expr = expr

# Java: evalExpr
# Takes an expression to evaluate, represented as an AST
# returns an integer representing the expression's value
def eval_expr(expr):
    if isinstance(expr, Number):
        return expr.value
    elif isinstance(expr, Plus):
        left = eval_expr(expr.left)
        right = eval_expr(expr.right)
        return left + right
    elif isinstance(expr, Minus):
        return eval_expr(expr.left) - eval_expr(expr.right)
    elif isinstance(expr, Multiply):
        return eval_expr(expr.left) * eval_expr(expr.right)
    elif isinstance(expr, Negate):
        return -eval_expr(expr.expr)
    else:
        raise Exception("Unknown expression: " + expr)
