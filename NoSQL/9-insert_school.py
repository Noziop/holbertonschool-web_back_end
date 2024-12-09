#!/usr/bin/env python3
"""Module for inserting documents in MongoDB."""


def insert_school(mongo_collection, **kwargs):
    """Insert a new document in a collection.

    Args:
        mongo_collection: The PyMongo collection object
        **kwargs: The document fields to insert

    Returns:
        str: The new document ID
    """
    result = mongo_collection.insert_one(kwargs)
    return result.inserted_id
