/**************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   rush_flex.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bpoumeau <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/14 20:33:39 by bpoumeau          #+#    #+#             */
/*   Updated: 2023/07/14 20:55:52 by marobert         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef RUSH_FLEX
# define RUSH_FLEX

# include <stdlib.h>
# include <stdio.h>
# include <unistd.h>

char	**ft_split(char const *str, char c);
int		ft_sqrt(int nb);

typedef struct s_rush
{
	unsigned int size;
	char	**arr;
	char	*n;
	char	*w;
	char	*s;
	char	*e;
}	t_rush;

#endif 

