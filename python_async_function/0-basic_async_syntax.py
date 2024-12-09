#!/usr/bin/env python3
"""Module implementing basic async syntax with random delay."""

import random
import asyncio


async def wait_random(max_delay: int = 10) -> float:
    """Wait for a random delay between 0 and max_delay seconds.

    Args:
        max_delay (int): Maximum delay in seconds (default: 10)

    Returns:
        float: Random delay time that was waited
    """
    delay = random.uniform(0, max_delay)
    await asyncio.sleep(delay)
    return delay
