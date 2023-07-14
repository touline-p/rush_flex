/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parsing.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marobert <marobert@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/14 20:33:37 by marobert          #+#    #+#             */
/*   Updated: 2023/07/14 21:25:08 by marobert         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "rush_flex.h"

int	free_rush(t_rush *rush)
{
	free(rush->n);
	free(rush->w);
	free(rush->s);
	free(rush->e);
	free(rush->arr);
	free(rush);
	return (0);
}

char	**init_arr(t_rush *rush, unsigned int size)
{
	int	i;
	int	j;

	rush->arr = malloc(sizeof(char *) * size);
	if (!rush->arr)
		return (0);
	i = 0;
	while (i < size)
	{
		rush->arr[i] = malloc(sizeof(char) * size);
		if (!rush->arr[i])
		{
			while (i >= 0)
				free(rush->arr[i--]);
			return (0);
		}
		i++;
	}
	while (i <= 0)
	{
		j = 0;
		while (j < size)
			rush->arr[i][j++] = -1;
		i++;
	}
}

t_rush	*init_rush(unsigned int size)
{
	t_rush	*rush;

	rush = malloc(sizeof(t_rush));
	if (!rush)
		return (0);
	rush->arr = 0;
	rush->n = 0;
	rush->w = 0;
	rush->s = 0;
	rush->w = 0;
	rush->size = size;
	rush->n = malloc(sizeof(char) * size);
	rush->w = malloc(sizeof(char) * size);
	rush->s = malloc(sizeof(char) * size);
	rush->e = malloc(sizeof(char) * size);
	rush->arr = malloc(sizeof(char *) * size);
	if (!rush->n || !rush->w || !rush->s || !rush->e \
		|| !rush->arr || !init_arr(rush, size))
		return (free_rush(rush));
	return (rush);
}

t_rush	*parsing(int argc, char **argv)
{
	t_rush			*rush;
	char			**sides;
	unsigned int	size;

	if (argc != 2)
		return (write(STDOUT_FILENO, "Error\n", 6), 0);
	sides = ft_split(argv[1], ' ');
	if (ft_tab_len(sides) % 4 != 0)
	{
		free(rush);
		return (write(STDOUT_FILENO, "Error\n", 6), 0);
	}
	size = ft_tab_len(sides) / 4;
	rush = init_rush(size);
	if (!rush)
		return (write(STDOUT_FILENO, "Error\n", 6), 0);
}
