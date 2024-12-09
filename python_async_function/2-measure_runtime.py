#!/usr/bin/env python3
"""Module for measuring execution time of async functions."""

import time
import asyncio

wait_n = __import__('1-concurrent_coroutines').wait_n


def measure_time(n: int, max_delay: int) -> float:
    """Measure the average execution time of wait_n.

    Args:
        n (int): Number of times to run wait_random
        max_delay (int): Maximum delay for each wait_random call

    Returns:
        float: Average time per operation
    """
    start_time = time.time()
    asyncio.run(wait_n(n, max_delay))
    total_time = time.time() - start_time
    return total_time / n
