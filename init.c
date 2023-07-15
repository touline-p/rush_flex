
#include "rush_flex.h"

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
			return (NULL);
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
		return ((t_rush *)free_rush(rush));
	return (rush);
}

