SRCS = ft_strlen.s
DIR = src
DIR_OBJS = .objs

OBJS = $(addprefix $(DIR_OBJS)/, $(SRCS:.s=.o))

NAME = libasm.a

CFLAGS = -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(DIR_OBJS) $(OBJS)
	ar rcs $(NAME) $(OBJS)

$(DIR_OBJS)/%.o: $(DIR)/%.s
	nasm -f elf64 $< -o $@

$(DIR_OBJS):
	mkdir -p $@

clean:
	rm -rf $(DIR_OBJS)

fclean: clean

re: fclean all

run: all
	gcc $(CFLAGS) main.c $(NAME) -o run
	./run

.PHONY: all clean fclean re
