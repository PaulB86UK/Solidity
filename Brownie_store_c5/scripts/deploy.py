from brownie import accounts, config, Storage, network
import os


def deploy_simple_storage():
    account = get_account()
    # account = accounts.add(os.getenv("PRIVATE_KEY"))
    # account = accounts.add(config["wallets"]["from_key"])
    simple_storage = Storage.deploy({"from": account})
    stored_value = simple_storage.retrieve()  ##its call
    print(stored_value)
    transaction = simple_storage.store(
        15, {"from": account}
    )  ##its transact, need to explicify from
    transaction.wait(1)  # wait for 1 block
    stored_value = simple_storage.retrieve()
    print(stored_value)


def get_account():
    if network.show_active() == "development":
        return accounts[0]
    else:
        return accounts.add(config["wallets"]["from_key"])


def main():
    deploy_simple_storage()
