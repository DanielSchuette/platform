/* main.c: the program's entry point. */
#include <stdio.h>
#include <stdlib.h>
#include <glad/glad.h>
#include <GLFW/glfw3.h>

#include "utils.h"

char *progname;

void error_callback(int, const char *);
void close_callback(GLFWwindow *);
void resize_callback(GLFWwindow *, int, int);

int main(int argc, char **argv)
{
    progname = *argv;

    /* initialize OpenGL */
    glfwSetErrorCallback(error_callback);
    if (!glfwInit())
        fail("unable to initialize OpenGL");

    /* create a window (OpenGL >= 3.3) */
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_RESIZABLE, GL_TRUE);
    GLFWwindow *window = glfwCreateWindow(640, 480, "An OpenGL window!", NULL, NULL);
    if (!window)
        fail("unable to initialize window");

    /* make context current, set callbacks and initialize loader */
    glfwMakeContextCurrent(window);
    glfwSetWindowCloseCallback(window, close_callback);
    glfwSetWindowSizeCallback(window, resize_callback);
    gladLoadGL();

    while (!glfwWindowShouldClose(window) &&
            glfwGetKey(window, GLFW_KEY_ESCAPE) != GLFW_PRESS)
        glfwPollEvents();
    leave(EXIT_SUCCESS);

    return 0; /* never reached */
}

void error_callback(int error, const char *description)
{
    fprintf(stderr, "OpenGL: error: %s.\n", description);
}

void close_callback(GLFWwindow *w)
{
    glfwDestroyWindow(w);
    leave(EXIT_SUCCESS);
}

void resize_callback(GLFWwindow *w, int x, int y)
{
#ifdef DEBUG
    warn("resizing window (%d, %d)", x, y);
#endif
}
