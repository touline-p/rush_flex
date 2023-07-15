unsigned int	ft_tab_len(char **tab)
{
	unsigned int	i;

	i = 0;
	while (tab[i])
		i++;
	return (i);
}
