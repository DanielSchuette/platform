#include <stdio.h>

#include <glad/glad.h>
#include <GLFW/glfw3.h>

int main(void)
{
    GLFWwindow *window = glfwCreateWindow(640, 480, "My first window", NULL, NULL);
    if (!window)
        fprintf(stderr, "error: window creation failed.\n");
    while (1) ;
    return 0;
}
