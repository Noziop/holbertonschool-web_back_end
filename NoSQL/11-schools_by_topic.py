#!/usr/bin/env python3
"""Module for querying documents in MongoDB."""


def schools_by_topic(mongo_collection, topic):
    """Returns the list of schools having a specific topic.

    Args:
        mongo_collection: The PyMongo collection object
        topic (str): The topic searched

    Returns:
        list: List of schools having the specified topic
    """
    return list(mongo_collection.find({"topics": topic}))
