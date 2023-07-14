# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marobert <marobert@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/28 16:06:19 by marobert          #+#    #+#              #
#    Updated: 2023/07/14 20:31:56 by marobert         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#	Colors from https://misc.flogisoft.com/bash/tip_colors_and_formatting#colors1
RED			=	\033[31m
GREEN		=	\033[32m
CYAN		=	\033[34m
IGREY		=	\033[0;48m
END			=	\033[0m
ERASE		=	\033[2K\r


SRCS		=	main.c
DIR_BUILD	=	.build/
OBJS		=	$(patsubst %.cpp, $(DIR_BUILD)%.o, $(SRCS))
DEPS		=	$(patsubst %.cpp, $(DIR_BUILD)%.d, $(SRCS))
DEPS_FLAGS	=	-MMD -MP
CC			=	cc
RM			=	rm -rf
CFLAGS		=	-Wall -Wextra -Werror
NAME		=	rush

all:		$(NAME)

$(NAME):	$(OBJS)
			@printf "[$(CYAN)Compiling$(END)] % 25s" $(NAME)
			@$(CC) $(CFLAGS) $(DIR_INCS:%=-I %) -o $(NAME) $(OBJS)
			@printf "$(ERASE)[$(GREEN)Done$(END)] % 30s\n" $(NAME)

-include $(DEPS)

$(DIR_BUILD)%.o : %.cpp
			@printf "[$(CYAN)Compiling$(END)] % 25s" $(patsubst $(shell dirname $<)/%, %, $<)
			@mkdir -p $(shell dirname $@)
			@$(CC) $(CFLAGS) $(DEPS_FLAGS) $(DIR_INCS:%=-I %) -c $< -o $@
			@printf "$(ERASE)[$(GREEN)Done$(END)] % 30s\n" $(patsubst $(shell dirname $<)/%, %, $<)

clean:
			@$(RM) $(DIR_BUILD)
			@printf "[$(RED)Deleted$(END)] % 27s\n" "$(NAME) objects"

fclean:		clean
			@$(RM) $(NAME)
			@printf "[$(RED)Deleted$(END)] % 27s\n" $(NAME)

re:			fclean
			@make all

.PHONY: norme
norme:
			norminette $(SRCS) $(DIR_INCS) | grep -v 'OK!' | cat

.PHONY: shrek
shrek:
		@echo "$(GREEN)⢀⡴⠑⡄⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ "
		@echo "⠸⡇⠀⠿⡀⠀⠀⠀⣀⡴⢿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀ "
		@echo "⠀⠀⠀⠀⠑⢄⣠⠾⠁⣀⣄⡈⠙⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀ "
		@echo "⠀⠀⠀⠀⢀⡀⠁⠀⠀⠈⠙⠛⠂⠈⣿⣿⣿⣿⣿⠿⡿⢿⣆⠀⠀⠀⠀⠀⠀⠀ "
		@echo "⠀⠀⠀⢀⡾⣁⣀⠀⠴⠂⠙⣗⡀⠀⢻⣿⣿⠭⢤⣴⣦⣤⣹⠀⠀⠀⢀⢴⣶⣆ "
		@echo "⠀⠀⢀⣾⣿⣿⣿⣷⣮⣽⣾⣿⣥⣴⣿⣿⡿⢂⠔⢚⡿⢿⣿⣦⣴⣾⠁⠸⣼⡿ "
		@echo "⠀⢀⡞⠁⠙⠻⠿⠟⠉⠀⠛⢹⣿⣿⣿⣿⣿⣌⢤⣼⣿⣾⣿⡟⠉⠀⠀⠀⠀⠀ "
		@echo "⠀⣾⣷⣶⠇⠀⠀⣤⣄⣀⡀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀ "
		@echo "⠀⠉⠈⠉⠀⠀⢦⡈⢻⣿⣿⣿⣶⣶⣶⣶⣤⣽⡹⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀ "
		@echo "⠀⠀⠀⠀⠀⠀⠀⠉⠲⣽⡻⢿⣿⣿⣿⣿⣿⣿⣷⣜⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀ "
		@echo "⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣷⣶⣮⣭⣽⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀ "
		@echo "⠀⠀⠀⠀⠀⠀⣀⣀⣈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀ "
		@echo "⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀ "
		@echo "⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀ "
		@echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠻⠿⠿⠿⠿⠛⠉$(END)"

.PHONY: 42
42:
		@echo "$(IGREY)   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡴⠶⠶⠶⠖⠲⠤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ $(END)"
		@echo "$(IGREY)   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⡾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠈⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ $(END)"
		@echo "$(IGREY)   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠤⠄⣴⡚⢀⣼⠏⠀⠀⠀⠀⣀⣀⠀⢀⣀⣀⠀⣴⡿⢶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ $(END)"
		@echo "$(IGREY)   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠀⠈⢀⢎⢞⣁⣿⡇⠀⠀⠀⠀⠀⣇⠈⠉⠉⠀⠉⠉⣿⡂⡄⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ $(END)"
		@echo "$(IGREY)   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⢄⡀⠀⠁⣄⣢⣾⣿⣾⣿⣿⡇⠀⠀⠀⠀⢀⣼⠀⠀⢀⣀⣀⣀⣹⣷⣅⣜⣮⣳⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ $(END)"
		@echo "$(IGREY)   ⠀⠀⠀⠀⠀⠀⠀⠀⣠⣼⣾⣿⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⡅⣰⣞⡉⢳⣤⡷⠀⠊⢭⠶⠶⠸⣿⣿⣿⣿⣿⣿⣾⣿⣟⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀ $(END)"
		@echo "$(IGREY)   ⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠈⣹⣦⠁⠀⠀⠀⠀⠀⣤⣠⣙⣿⣿⣿⣿⣿⣿⣿⣿⣿⠤⠀⠀⠀⠀⠀⠀⠀⠀ $(END)"
		@echo "$(IGREY)   ⠀⠀⠀⠀⢠⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡷⣭⣤⠀⠀⠀⠀⠀⠀⢤⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣝⣦⡀⠀⠀⠀⠀⠀⠀ $(END)"
		@echo "$(IGREY)   ⠀⠀⠀⠀⣾⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⡇⠀⠀⠀⠀⣀⣀⣀⣀⡀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀ $(END)"
		@echo "$(IGREY)   ⠀⠀⠀⣾⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢻⢯⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀ $(END)"
		@echo "$(IGREY)   ⠀⠀⠄⣲⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⠋⠁⠀⠈⣧⠳⡄⠀⠀⠀⠀⠀⡾⢯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡁⠀⠀⠀ $(END)"
		@echo "$(IGREY)   ⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠉⠁⠀⢸⡀⠀⠀⠀⢻⠀⠙⢦⡀⠀⠀⡼⠀⢸⣿⣓⣚⡺⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀ $(END)"
		@echo "$(IGREY)   ⠀⠀⣻⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠈⣧⠀⠀⠀⠘⣇⣀⣤⣿⠶⣾⡁⠀⣸⣿⣿⣿⡇⡇⢸⠀⠉⠻⣿⣿⣿⣿⣿⣿⣿⣽⣿⡆⠀⠀ $(END)"
		@echo "$(IGREY)   ⢀⣴⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠠⡖⠋⠉⠀⠀⠀⠀⠘⣟⠳⠿⣝⣶⣿⢿⠃⢿⣒⣒⣰⠃⠈⡆⠀⢸⣿⣿⣿⣿⣿⣿⣿⡿⣿⠇⠀⠀ $(END)"
		@echo "$(IGREY)   ⢠⣼⣿⣿⣿⣿⣿⣿⣿⠿⠀⠀⠀⠀⢰⡀⠀⠹⡄⠀⠀⠀⠀⠀⠀⠘⣗⠒⠶⠶⠾⠽⡇⢠⡏⠈⡇⠀⠀⡇⠀⣀⣿⣿⣿⣿⣿⣿⣯⠾⣿⠀⠀⠀ $(END)"
		@echo "$(IGREY)   ⠀⢻⣿⣿⣿⣿⣿⣿⠇⢸⠀⠀⠀⠀⠀⣧⠀⠀⢳⡀⠀⠀⠀⠀⠀⠀⢸⣉⡉⠒⠲⠶⡇⢸⡇⠀⡇⠀⠸⡃⢠⠏⣻⣿⣿⣿⣿⣿⣿⣮⠁⠀⠀⠀ $(END)"
		@echo "$(IGREY)   ⠀⢿⣿⣿⣿⣿⣿⣿⠀⠈⣇⠀⠀⠀⠀⠈⡇⠀⠀⠳⡀⠀⠀⠀⠀⠀⠈⣧⠉⠽⠿⣺⡇⠈⢷⡤⠇⠀⢀⡿⠈⡇⠸⣿⣿⣿⣿⣿⣿⠙⠀⠀⠀⠀ $(END)"
		@echo "$(IGREY)   ⠀⢸⣿⣿⣿⣿⣿⣿⠀⠀⠘⣆⠀⠀⠀⠀⡟⠀⠀⠀⠙⠢⣄⠀⠀⠀⠀⠹⣟⣛⣓⣒⡇⠀⢸⡇⠀⣠⠟⠀⢸⠀⠀⣿⣿⣿⣿⣿⣯⠀⠀⠀⠀⠀ $(END)"

.PHONY:		all clean fclean re
