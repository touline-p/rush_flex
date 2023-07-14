/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marobert <marobert@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/08 13:51:42 by marobert          #+#    #+#             */
/*   Updated: 2022/11/11 14:38:19 by marobert         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>

static char	*ft_strndup(char const *src, size_t n)
{
	char	*dup;
	size_t	len_src;
	size_t	i;

	len_src = 0;
	i = 0;
	while (src[len_src] && len_src < n)
		len_src++;
	dup = malloc(sizeof(char) * (len_src + 1));
	if (!dup)
		return (dup);
	while (i < len_src)
	{
		dup[i] = src[i];
		i++;
	}
	dup[i] = 0;
	return (dup);
}

static size_t	word_len(char const *str, char sep)
{
	size_t	i;

	i = 0;
	while (str[i] && str[i] != sep)
		i++;
	return (i);
}

static char	**check_malloc(char **tab_words, size_t size)
{
	int		error;
	size_t	i;

	error = 0;
	i = 0;
	while (i < size && !error)
		if (tab_words[i++] == NULL)
			error = 1;
	if (error)
	{
		i = 0;
		while (i < size)
			if (!tab_words[i])
				free(tab_words[i++]);
		free(tab_words);
		return (0);
	}
	return (tab_words);
}

char	**ft_split(char const *str, char c)
{
	char	**tab_words;
	int		words;
	int		i;

	words = 0;
	i = -1;
	while (str[++i])
		if (str[i] != c && (str[i - 1] == c || !i))
			words++;
	tab_words = malloc(sizeof(char *) * (words + 1));
	if (!tab_words)
		return (tab_words);
	i = -1;
	words = -1;
	while (str[++i])
		if (str[i] != c && (str[i - 1] == c || !i))
			tab_words[++words] = ft_strndup(&str[i], word_len(&str[i], c));
	tab_words[words + 1] = 0;
	return (check_malloc(tab_words, words + 1));
}
