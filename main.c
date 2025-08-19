#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <signal.h>
#include <setjmp.h>

static jmp_buf catch_strlen;

static void strlensegfault(int unused)
{
	(void)unused;
	longjmp(catch_strlen, 1);
}

size_t	ft_strlen(char *str);
char	*strdup(const char *s);
char	*ft_strdup(const char *s);
char	*ft_strcpy(char *dest, const char *src);
ssize_t	ft_read(int fd, void *buf, size_t count);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_write(int fd, const void *buf, size_t count);

int	error(char *str)
{
	printf("%s\n", str);
	return (1);
}

int	test_len(void)
{
	char	*str;
	size_t	len;

	str = "henlo!";
	len = ft_strlen(str);
	printf("ft_strlen: %zu, supposed to be: %zu\n", len, strlen(str));
	if (len != strlen(str))
		return (error("Length mismatch"));

	str = "";
	len = ft_strlen(str);
	printf("ft_strlen: %zu, supposed to be: %zu\n", len, strlen(str));
	if (len != strlen(str))
		return (error("Length mismatch"));

	str = NULL;
	signal(SIGSEGV, strlensegfault);
	if (setjmp(catch_strlen) == 0)
	{
		len = strlen(str); // Gonna crash
		return (error("Didn't segfault, problem here"));
	}
	else
		printf("segfault and it's expected if str is NULL\n");

	return (0);
}

int	test_dup(void)
{
	char *str;
	char *cpy;

	str = "he-he";
	cpy = ft_strdup(str);
	printf("ft_strdup: %s, supposed to be: %s\n", cpy, str);
	if (strlen(cpy) != strlen(str))
		return(error("Dup difference"));
	return (0);
}

int	test_cpy(void)
{
	char *str;
	char *cpy;

	cpy = malloc(sizeof(char) * 4);
	str = "alo!";
	ft_strcpy(cpy, str);
	printf("ft_strcpy : %s, %s\n", str, cpy);


	return (0);
}

int	main(void)
{
	if (test_len())
		return (1);
	printf("\n");
	if (test_dup())
		return (1);
	printf("\n");
	if (test_cpy())
		return (1);
	return (0);
}
