/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parsing.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marobert <marobert@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/14 20:33:37 by marobert          #+#    #+#             */
/*   Updated: 2023/07/15 10:53:53 by marobert         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "rush_flex.h"

t_rush	*free_rush(t_rush *rush)
{
	free(rush->n);
	free(rush->w);
	free(rush->s);
	free(rush->e);
	free(rush->arr);
	free(rush);
	return (NULL);
}

t_rush	*parsing(int argc, char **argv)
{
	t_rush			*rush;
	char			**sides;
	unsigned int	size;

	if (argc != 2)
		return (write(STDOUT_FILENO, "Error\n", 6), NULL);
	sides = ft_split(argv[1], ' ');
	if (ft_tab_len(sides) % 4 != 0)
	{
		free(rush);
		return (write(STDOUT_FILENO, "Error\n", 6), NULL);
	}
	size = ft_tab_len(sides) / 4;
	rush = init_rush(size);
	if (!rush)
		return (write(STDOUT_FILENO, "Error\n", 6), NULL);
}
