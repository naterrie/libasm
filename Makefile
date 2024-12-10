SRCS =	ft_strlen.s\
		ft_read.s \
		ft_write.s \
		ft_strcpy.s

DIR = src
DIR_OBJS = .objs

OBJS = $(addprefix $(DIR_OBJS)/, $(SRCS:.s=.o))

CFLAGS = -Wall -Wextra -Werror

NAME = libasm.a

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
	rm -f $(NAME)
	rm -f run

re: fclean all

run: all
	gcc $(CFLAGS) main.c $(NAME) -o run
	./run

.PHONY: all clean fclean re

.SILENT: $(DIR_OBJS) re clean fclean run
