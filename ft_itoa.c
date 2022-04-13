/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fleblanc <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/04 14:40:40 by fleblanc          #+#    #+#             */
/*   Updated: 2022/04/12 15:26:25 by fleblanc         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static size_t	ft_intlen(long n)
{
	size_t	i;

	i = 0;
	if (n <= 0)
	{
		i++;
		n *= -1;
	}
	while (n != 0)
	{
		n /= 10;
		i++;
	}
	return (i + 1);
}

char	*ft_itoa(int n)
{
	size_t		len;
	char		*array;
	long int	copy_n;

	copy_n = n;
	len = ft_intlen(n);
	array = ft_calloc(len, sizeof(char));
	if (array == NULL)
		return (NULL);
	len -= 2;
	if (copy_n < 0)
	{
		array[0] = '-';
		copy_n *= -1;
	}
	while (copy_n > 9)
	{
		array[len] = (copy_n % 10) + '0';
		copy_n /= 10;
		len--;
	}
	array[len] = copy_n + '0';
	return (array);
}
