#!/usr/bin/env python3
"""Module that provides a function for summing a list of integers and floats."""

from typing import List, Union


def sum_mixed_list(mxd_lst: List[Union[int, float]]) -> float:
    """Calculate the sum of a list of integers and floats.

    Args:
        mxd_lst (List[Union[int, float]]): List of integers and floats

    Returns:
        float: The sum of all numbers in the list
    """
    return sum(mxd_lst)
