#!/usr/bin/env python3
"""Module for calculating index ranges."""


def index_range(page: int, page_size: int) -> tuple:
    """Calculate the start and end index for a given page and page size.

    Args:
        page (int): The page number (1-indexed)
        page_size (int): The number of items per page

    Returns:
        tuple: A tuple containing the start and end index
    """
    start = (page - 1) * page_size
    end = start + page_size
    return (start, end)
