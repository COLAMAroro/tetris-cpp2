CPPFRONT	:= cppfront

CPP2SRC		=	game.cpp2	\
			main.cpp2

CXXFLAGS	+= -std=c++20 -fmodules-ts

%.cpp: %.cpp2
	$(CPPFRONT) $< -a -fo -o $@

CPP2toCPP 	= $(CPP2SRC:.cpp2=.cpp)

SRC		=	tetromino.cpp \
			$(CPP2toCPP)


OBJ		=	$(SRC:.cpp=.o)

NAME		=	tetris

all: $(NAME)

$(NAME): $(OBJ)
	$(CXX) -lncurses -o $(NAME) $(OBJ) $(CXXFLAGS)

clean:
	rm -f $(OBJ)

fclean: clean

re: fclean all
