# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rrhaenys <rrhaenys@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/12/27 14:25:41 by rrhaenys          #+#    #+#              #
#    Updated: 2019/01/14 18:17:13 by rrhaenys         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
FLAGS = -Wall -Wextra -Werror
SRC_DIR = src/
SRC_FIL = $(shell ls src | grep -E "ft_.+\.c")
SRCS = $(addprefix  $(SRC_DIR), $(SRC_FIL))
INCLUDE =-Isrc -Isrc/libftr
COMMAND = gcc
LIBFT_DIR = src/libftr/
LIBFT_FIL = $(shell ls src/libftr | grep -E "ft_.+\.c")
LIBFT_SRCS = $(addprefix  $(LIBFT_DIR), $(LIBFT_FIL))
LIBFT_OBJ	= $(LIBFT_SRCS:.c=.o)
OBJ	= $(SRCS:.c=.o) $(LIBFT_SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
	@ar rc $(NAME) $(OBJ)
	@ranlib $(NAME)

.c.o:
	$(COMMAND) $(FLAGS) $(INCLUDE) -g -c -o $@ $<

clean:
	/bin/rm -f $(OBJ)

fclean: clean
	/bin/rm -f $(NAME)
	/bin/rm -f test

re: fclean all

.PHONY: clean fclean all re
