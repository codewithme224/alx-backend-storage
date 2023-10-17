#!/usr/bin/env python3
"""This module  lists nginx stats"""


from pymongo import MongoClient

if __name__ == "__main__":
    # Establish the connection
    client = MongoClient(host="localhost", port=27017)
    # Select the database
    db = client["logs"]
    # Select the collection
    collection = db.nginx
    total_logs = collection.count_documents({})
    print("{} logs".format(total_logs))
    status = collection.count_documents({"path": "/status"})
    print("Methods:")
    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    for method in methods:
        method_count = collection.count_documents({"method": method})
        print(f"\tmethod {method}: {method_count}")
    print(f"{status} status check")

    agg = collection.aggregate([
        {"$group":
         {"_id": "$ip", "con":
          {"$sum": 1}
          }
         },
        {"$sort":
         {"con": -1}
         },
        {"$limit": 10}
    ])
    print("IPs:")
    for i in agg:
        log_id = i["_id"]
        ip_count = i["con"]
        print(f"\t{log_id}: {ip_count}")
