#ifndef KHTTPD_HTTP_SERVER_H
#define KHTTPD_HTTP_SERVER_H

#include <net/sock.h>

struct http_server_param {
    struct socket *listen_socket;
};

struct http_service {
    bool is_stopped;
    struct list_head workers;
};

extern int http_server_daemon(void *arg);

#endif
