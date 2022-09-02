##
## EPITECH PROJECT, 2021
## Project Makefile
## File description:
## This script is the default project Makefile.
##

SRC_MAIN		=	main.c

SRC				=

SRC_UNITTEST   	=

OBJ				=	$(SRC:%.c=%.o) $(SRC_MAIN:%.c=%.o)

OBJ_UNITTEST	=	$(SRC:%.c=%.o) $(SRC_UNITTEST:%.c=%.o)

NAME   			=	chocolatine

UNIT_TEST		=	unit_tests

CC				=	gcc

CFLAGS			+=	-Wall -Wextra -Wshadow -I./includes

TESTFLAGS		+=	--coverage -lcriterion -I./includes

all:		$(NAME)

$(NAME): 	$(OBJ)
	$(CC) -o $(NAME) $(OBJ) $(CFLAGS)

tests_run:	make_lib
	$(RM) *.gc*
	$(CC) -o $(UNIT_TEST) $(SRC) $(SRC_UNITTEST) $(TESTFLAGS)
	./$(UNIT_TEST)
	gcovr

clean:
	$(RM) $(OBJ)
	$(RM) *.gc*

fclean: 	clean
	$(RM) $(NAME)
	$(RM) $(UNIT_TEST)

re:			fclean all

.PHONY: all make_lib tests_run clean fclean clean_lib fclean_lib re