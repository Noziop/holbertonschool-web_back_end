#!/usr/bin/env python3
"""Module for hypermedia pagination."""

import math
from typing import List, Dict


class Server(Server):
    """Server class to paginate a database of popular baby names with hypermedia."""

    def get_hyper(self, page: int = 1, page_size: int = 10) -> Dict:
        """Get a page of the dataset with hypermedia information.

        Args:
            page (int): The page number (1-indexed)
            page_size (int): The number of items per page

        Returns:
            Dict: A dictionary containing hypermedia information
        """
        data = self.get_page(page, page_size)
        total_pages = math.ceil(len(self.dataset()) / page_size)

        return {
            "page_size": len(data),
            "page": page,
            "data": data,
            "next_page": page + 1 if page < total_pages else None,
            "prev_page": page - 1 if page > 1 else None,
            "total_pages": total_pages
        }
