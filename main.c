#include <string.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

size_t ft_strlen(char *str);
char *ft_strcpy(char *dest, const char *src);
ssize_t ft_read(int fd, void *buf, size_t count);
ssize_t ft_write(int fd, const void *buf, size_t count);

int main()
{

	// Test ft_strlen
	char buf[5];
	printf("Len : %ld\n", ft_strlen("Helloooo"));

	// Test ft_write
	int fd = open("test.txt", O_WRONLY | O_CREAT | O_TRUNC, 0644);
	printf("Write : %ld\n", ft_write(fd, "Hellooooo", 9));
	close(fd);

	// Test ft_write
	fd = open("test.txt", O_RDONLY);
	printf("Read : %ld : %s\n", ft_read(fd, buf, 5), buf);
	close(fd);

	// Test ft_strcpy
	char *str = "Hello";
	char dest[6];
	printf("Copy : %s\n", ft_strcpy(dest, str));
	return 0;
}
