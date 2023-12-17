from web3 import Web3
import abi



class MakeConnection:

    def __init__(self, url):
        self.web3 = Web3(Web3.HTTPProvider(url))


class ArrayOperations(MakeConnection):

    def __init__(self, url, abi, contract_address):

        super().__init__(url)
        self.abi = abi
        self.contract = self.web3.eth.contract(
            address=contract_address, abi=self.abi)

    def getarraylength(self, array_=None):

        try:
            return self.contract.functions.getArrayLength(array_).call()
        except Exception as e:
            return e
    
    def addarraynumbers(self,array_=None):

        try:
            return self.contract.functions.getArraySum(array_).call()
        except Exception as e:
            return e
    
    def getnumberatindex(self,array_=None,index=None):

        try:
            return self.contract.functions.getElementAtIndex(array_,index).call()
        except Exception as e:
            return e
            
               

if __name__ == '__main__':
    
    url = input()              # Testnet or main-net url
    contract_abi = abi.abi     # get contract abi while compilation on remix
    contract_address = input() # contract address
    
    arrayops = ArrayOperations(url=url,abi=contract_abi,contract_address=contract_address)
    print(arrayops.getarraylength([1,2,3,4,5]))
    print(arrayops.addarraynumbers([1,2,3,4,5,6,7,8,9,10]))
    print(arrayops.getnumberatindex([1,2,3,4,5],3))
