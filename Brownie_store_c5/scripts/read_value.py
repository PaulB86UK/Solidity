from brownie import accounts, Storage

print(Storage)


def read_contract():
    simple_storage = Storage[-1]
    # ABI
    # Address
    print(simple_storage.retrieve())


def main():
    read_contract()
