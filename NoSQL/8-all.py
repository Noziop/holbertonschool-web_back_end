#!/usr/bin/env python3
"""Module for listing documents in MongoDB."""


def list_all(mongo_collection):
    """List all documents in a collection.

    Args:
        mongo_collection: The PyMongo collection object

    Returns:
        list: The list of documents in the collection
    """
    return list(mongo_collection.find())
