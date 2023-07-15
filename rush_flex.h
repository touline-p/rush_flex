/**************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   rush_flex.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bpoumeau <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/14 20:33:39 by bpoumeau          #+#    #+#             */
/*   Updated: 2023/07/15 10:55:40 by marobert         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef RUSH_FLEX
# define RUSH_FLEX

# include <stdlib.h>
# include <stdio.h>
# include <unistd.h>

typedef struct s_rush
{
	unsigned int size;
	char	**arr;
	char	*n;
	char	*w;
	char	*s;
	char	*e;
}	t_rush;

unsigned int	ft_tab_len(char **tab);
char		**ft_split(char const *str, char c);
int			ft_sqrt(int nb);
char		**init_arr(t_rush *rush, unsigned int size);
t_rush		*init_rush(unsigned int size);
t_rush		*free_rush(t_rush *rush);

#endif 

