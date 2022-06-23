#!/usr/bin/env python3
"""
Demo module for using vault to store environment variables and json configs.

Author: Bård-Kristian Krohg  <2022>
"""


import os
import json

def main() -> None:
    """Main function"""
    print("Hello from python!\n")

    secret_user = os.getenv("SECRET_USER", "")
    secret_token = os.getenv("SECRET_TOKEN", "")

    print(f"Current environment variables:\n"
          f"SECRET_USER={secret_user}\n"
          f"SECRET_TOKEN={secret_token}\n")

    with open("/app/conf/pyconf.json", "r", encoding="utf-8") as conf:
        configuration = json.load(conf)
    print("Loaded JSON file:\n")
    print(json.dumps(configuration, indent=4, sort_keys=True))


if __name__ == "__main__":
    main()
