class Leaf:
    def __init__(self, value):
        self.value = value

    def __str__(self):
        return "leaf(" + str(self.value) + ")"

class InternalNode:
    def __init__(self, left, value, right):
        self.left = left
        self.value = value
        self.right = right

    def __str__(self):
        return "internalNode(" + str(self.left) + ", " + str(self.value) + ", " + str(self.right) + ")"
    
def gen(depth):
    yield Leaf(0)
    if depth > 0:
        for left in gen(depth - 1):
            for right in gen(depth - 1):
                yield InternalNode(left, 0, right)

def foo():
    yield 1
    yield 2
    yield 3
