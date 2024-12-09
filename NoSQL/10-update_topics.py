#!/usr/bin/env python3
"""Module for updating documents in MongoDB."""


def update_topics(mongo_collection, name, topics):
    """Change all topics of a school document based on the name.

    Args:
        mongo_collection: The PyMongo collection object
        name (str): The school name to update
        topics (list): The list of topics approached in the school
    """
    mongo_collection.update_many(
        {"name": name},
        {"$set": {"topics": topics}}
    )
