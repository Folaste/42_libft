# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fleblanc <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/28 13:19:35 by fleblanc          #+#    #+#              #
#    Updated: 2022/05/17 19:15:04 by fleblanc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
# Name

NAME		= libft.a

# **************************************************************************** #
# Compilator

CC			= gcc
WFLAGS		= -Wall -Wextra -Werror
IFLAGS		= -I $(INCDIR)

# **************************************************************************** #
# System Commands

AR			= ar -rcs
MKDIR		= mkdir -p
NORMINETTE	= norminette
RM			= rm -rf

# **************************************************************************** #
# Directories

INCDIR		= ./includes
OBJDIR		= ./objects
SRCDIR		= ./sources

# **************************************************************************** #
# List of sources files

SRCNAME		= conversions/ft_atoi.c \
			  conversions/ft_itoa.c \
			  conversions/ft_tolower.c \
			  conversions/ft_toupper.c \
			  counters/ft_intlen.c \
			  lists/ft_lstadd_back.c \
			  lists/ft_lstadd_front.c \
			  lists/ft_lstclear.c \
			  lists/ft_lstdelone.c \
			  lists/ft_lstiter.c \
			  lists/ft_lstlast.c \
			  lists/ft_lstmap.c \
			  lists/ft_lstnew.c \
			  lists/ft_lstsize.c \
			  memory/ft_bzero.c \
			  memory/ft_calloc.c \
			  memory/ft_memchr.c \
			  memory/ft_memcmp.c \
			  memory/ft_memcpy.c \
			  memory/ft_memmove.c \
			  memory/ft_memset.c \
			  predicates/ft_isalnum.c \
			  predicates/ft_isalpha.c \
			  predicates/ft_isascii.c \
			  predicates/ft_isdigit.c \
			  predicates/ft_isprint.c \
			  print/ft_putchar_fd.c \
			  print/ft_putendl_fd.c \
			  print/ft_putnbr_base_fd.c \
			  print/ft_putnbr_fd.c \
			  print/ft_putstr_fd.c \
			  string/ft_split.c \
			  string/ft_strchr.c \
			  string/ft_strdup.c \
			  string/ft_striteri.c \
			  string/ft_strjoin.c \
			  string/ft_strlcat.c \
			  string/ft_strlcpy.c \
			  string/ft_strlen.c \
			  string/ft_strmapi.c \
			  string/ft_strncmp.c \
			  string/ft_strnstr.c \
			  string/ft_strrchr.c \
			  string/ft_strtrim.c \
			  string/ft_substr.c \
			  utilities/ft_printf/ft_printf.c \
			  utilities/ft_printf/ft_printf_char.c\
			  utilities/ft_printf/ft_printf_check_args.c \
			  utilities/ft_printf/ft_printf_hexa.c \
			  utilities/ft_printf/ft_printf_hexa_utils.c \
			  utilities/ft_printf/ft_printf_init_struct.c \
			  utilities/ft_printf/ft_printf_number.c \
			  utilities/ft_printf/ft_printf_number_utils.c \
			  utilities/ft_printf/ft_printf_pointer.c \
			  utilities/ft_printf/ft_printf_pointer_utils.c \
			  utilities/ft_printf/ft_printf_string.c \
			  utilities/ft_printf/ft_printf_unsigned.c \
			  utilities/ft_printf/ft_printf_unsigned_utils.c \
			  utilities/get_next_line/get_next_line.c \
			  utilities/get_next_line/get_next_line_utils.c

# **************************************************************************** #
# Automatic variables for names of sources and objects files

SRCS		= $(addprefix $(SRCDIR)/, $(SRCNAME))
OBJS		= $(addprefix $(OBJDIR)/, $(SRCNAME:.c=.o))

# **************************************************************************** #
# Extra

CR			= "\r"$(CLEAR)
CLEAR       = "\\033[0K"
EOC			= "\033[0;0m"
RED			= "\033[0;31m"
GREEN		= "\033[0;32m"
BASENAME	= `basename $(PWD)`

# **************************************************************************** #
# Rules

all: 		$(NAME)

$(NAME):	$(OBJS)
		@$(AR) $(NAME) $(OBJ)
		@printf $(CR)$(GREEN)"✓ $(NAME) is created\n"$(EOC)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
		@$(MKDIR) $(dir $@)
		@$(CC) $(WFLAGS) $(IFLAGS) -c $< -o $@
		@printf $(CR)"[ libft/%s ]" $@

clean:
		@if [ -d $(OBJDIR) ]; then \
			$(RM) $(OBJDIR) \
			&& printf $(CR)$(RED)"✗ The objects files of libft are cleaned\n"$(EOC); \
		fi

fclean: clean
		@if [ -f $(NAME) ]; then \
			$(RM) $(NAME) \
			&& printf $(CR)$(RED)"✗ $(NAME) is cleaned\n"$(EOC); \
		fi

re: fclean all

norm:
		@$(NORMINETTE) $(INCDIR) $(SRCDIR)

.PHONY: all clean fclean re norm
