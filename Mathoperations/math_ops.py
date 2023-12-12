from web3 import Web3
import abi
class MakeConnection:

    def __init__(self, url):
        self.web3 = Web3(Web3.HTTPProvider(url))


class MathOperations(MakeConnection):

    def __init__(self, url, abi, contract_address):

        super().__init__(url)
        self.abi = abi
        self.contract = self.web3.eth.contract(
            address=contract_address, abi=self.abi)

    def addnumbers(self, num1=None, num2=None):

        try:
            return self.contract.functions.addNumbers(num1, num2).call()
        except Exception as e:
            return e
        
    def multiply(self,num1=None,num2=None):
        try:
            return self.contract.functions.multiplyNumbers(num1, num2).call()
        except Exception as e:
            return e
        
    def subtranumbers(self,num1=None,num2=None):
        try:
            return self.contract.functions.subtractNumbers(num1,num2).call()
        except Exception as e:
            return e
            
               

if __name__ == '__main__':
    
    url = input()              # Testnet or main-net url
    contract_abi = abi.abi     # get contract abi while compilation on remix
    contract_address = input() # contract address
    
    maths = MathOperations(url=url,abi=abi.abi,contract_address=contract_abi)
    print(maths.addnumbers(num1=10,num2=100))
    print(maths.multiply(num1=200,num2=300))
    print(maths.subtranumbers(num1=300,num2=50))
