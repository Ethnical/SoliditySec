from brownie import Privacy_test, network, config, accounts
from struct import pack, unpack


def deploy(account, gasprice):  # Deploy the smart contract on the chain
    p1 = "0x" + pack("32s", b"\x41" * 16 + 16 * b"\x66").hex()
    p2 = "0x" + pack("32s", b"\x42" * 16 + 16 * b"\x67").hex()
    p3 = "0x" + pack("32s", b"\x43" * 16 + 16 * b"\x68").hex()

    args = [p1, p2, p3]
    r = Privacy_test.deploy(
        args, {"from": accounts[0], "gas_price": gasprice}, publish_source=False
    )
    return r


def get_info(w3, bool):
    if bool == True:
        blockNumber = w3.eth.block_number
        print(f"blockNumber : {blockNumber}")


def main():
    w3 = network.web3
    x = w3.eth.get_storage_at("0xE08E8EBb816be950865240a835dab8f9311FE96A", 4) #leak the slot4 (who has the value of data[2]
    print(x.hex())
    """
    get_info(w3, True)

    account000 = accounts.add(config["wallets"]["account000"])
    deployed = deploy(account000, w3.eth.gasPrice)
    address_ctr = deployed.address
    for i in range(0, 100):
        x = w3.eth.get_storage_at(address_ctr, i)
        print(x.hex())
    """
