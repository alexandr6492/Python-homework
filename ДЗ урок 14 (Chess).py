class Figure:

    def __init__(self, color, position):
        self.color = color
        self.position = position


    def change_color(self):
        if self.color == "black":
            self.color = "white"
        elif self.color == "white":
            self.color = "black"


    def set_position(self, x, y):
        if 0 <= x <= 7 and 0 <= y <= 7:
            set_position = (x, y)
        else:
            print('invalid coordinates')


figure = Figure("black", (2, 3))
print(figure.color)
figure.change_color()
print(figure.color)
figure.set_position(8, 2)
print(figure.position)


from typing import List, Tuple

class ChessPiece:
    def __init__(self, color: str, position: Tuple[int, int]):
        self.color = color
        self.position = position

    def is_valid_move(self, new_position: Tuple[int, int]) -> bool:
        x, y = new_position
        if not self._is_valid_position(x, y):
            return False
        # Додаткові перевірки, для кожного типу шахової фігури
        return True

    def _is_valid_position(self, x: int, y: int) -> bool:
        return 0 <= x <= 7 and 0 <= y <= 7

def get_possible_moves(pieces: List[ChessPiece], new_position: Tuple[int, int]) -> List[ChessPiece]:
    possible_moves = []
    for piece in pieces:
        if piece.is_valid_move(new_position):
            possible_moves.append(piece)
    return possible_moves

class Pawn(ChessPiece):
    def is_valid_move(self, new_position: Tuple[int, int]) -> bool:
        x, y = new_position
        if not self._is_valid_position(x, y):
            return False
        # Додаткові перевірки, для пішака
        return True

class Knight(ChessPiece):
    def is_valid_move(self, new_position: Tuple[int, int]) -> bool:
        x, y = new_position
        if not self._is_valid_position(x, y):
            return False
        # Додаткові перевірки, для коня
        return True

class Bishop(ChessPiece):
    def is_valid_move(self, new_position: Tuple[int, int]) -> bool:
        x, y = new_position
        if not self._is_valid_position(x, y):
            return False
        # Додаткові перевірки, для офіцера
        return True

class Rook(ChessPiece):
    def is_valid_move(self, new_position: Tuple[int, int]) -> bool:
        x, y = new_position
        if not self._is_valid_position(x, y):
            return False
        # Додаткові перевірки, для тури
        return True

class Queen(ChessPiece):
    def is_valid_move(self, new_position: Tuple[int, int]) -> bool:
        x, y = new_position
        if not self._is_valid_position(x, y):
            return False
        # Додаткові перевірки, для ферзя
        return True

class King(ChessPiece):
    def is_valid_move(self, new_position: Tuple[int, int]) -> bool:
        x, y = new_position
        if not self._is_valid_position(x, y):
            return False
        # Додаткові перевірки, для короля

        return True


# Створення фігур

pawn = Pawn("black", (3, 2))
knight = Knight("white", (1, 1))
bishop = Bishop("black", (4, 3))
rook = Rook("white", (7, 7))
queen = Queen("black", (5, 5))
king = King("white", (0, 0))

# Список фігур
pieces = [pawn, knight, bishop, rook, queen, king]

# Отримання фігур, які можуть дістатися певної клітинки
possible_moves = get_possible_moves(pieces, (2, 2))
for piece in possible_moves:
    print(piece.color, piece.position)







