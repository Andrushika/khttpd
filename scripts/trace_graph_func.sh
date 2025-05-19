#!/bin/bash
TRACE_DIR=/sys/kernel/debug/tracing

# clean up
echo > $TRACE_DIR/trace
echo > $TRACE_DIR/set_graph_function
echo > $TRACE_DIR/set_ftrace_filter

echo function_graph > $TRACE_DIR/current_tracer

echo http_server_worker >> $TRACE_DIR/set_graph_function
echo create_work >> $TRACE_DIR/set_graph_function

echo '*:mod:khttpd' > $TRACE_DIR/set_ftrace_filter

echo funcgraph-tail > $TRACE_DIR/trace_options

echo 1 > $TRACE_DIR/tracing_on

curl -s http://localhost:8081/ > /dev/null

echo 0 > $TRACE_DIR/tracing_on
cat $TRACE_DIR/trace