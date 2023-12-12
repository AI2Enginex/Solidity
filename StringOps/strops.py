from web3 import Web3
import abi
class MakeConnection:

    def __init__(self, url):
        self.web3 = Web3(Web3.HTTPProvider(url))


class StringOperations(MakeConnection):

    def __init__(self, url, abi, contract_address):

        super().__init__(url)
        self.abi = abi
        self.contract = self.web3.eth.contract(
            address=contract_address, abi=self.abi)

    def stringlength(self, val=None):

        try:
            return self.contract.functions.getStringLength(val).call()
        except Exception as e:
            return e
        
    def joinstrings(self,str1=None,str2=None):
        try:
            return self.contract.functions.concatenateStrings(str1,str2).call()
        except Exception as e:
            return e
        
    def convert_uppercase(self,str1=None):

        try:
            return self.contract.functions.convertToUppercase(str1).call()
        except Exception as e:
            return e
    
    def reverse_string(self,val=None):

        try:
            return self.contract.functions.reverseString(val).call()
        except Exception as e:
            return e
        
    def count_occurance(self,str1=None,str2=None):

        try:
            return self.contract.functions.countOccurrences(str1,str2).call()
        except Exception as e:
            return e
               

if __name__ == '__main__':
    
    url = input()              # Testnet or main-net url
    contract_abi = abi.abi     # get contract abi while compilation on remix
    contract_address = input() # contract address
    
    stringops = StringOperations(url=url,abi=contract_abi,contract_address=contract_address)
    print(stringops.stringlength(val='India'))
    print(stringops.joinstrings(str1='hot',str2='dog'))
    print(stringops.convert_uppercase(str1="helloworld"))
    print(stringops.reverse_string(val="hello world"))
    print(stringops.count_occurance(str1="hello hello world",str2="hello"))
    