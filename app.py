from fastapi import FastAPI
from pydantic import BaseModel
from blockchain import Blockchain
from fastapi.responses import JSONResponse


#class Data(BaseModel):
#    data: str

app = FastAPI()
blockchain = Blockchain()

# Minado de un nuevo bloque
@app.get('/mine_block', status_code=200)
def mine_block():
    previous_block = blockchain.get_previous_block()
    previous_proof = previous_block['proof']
    proof = blockchain.proof_of_work(previous_proof)
    previous_hash = blockchain.hash(previous_block)
    block = blockchain.create_block(proof, previous_hash)
    response = {'message': 'Congratulations, you just mined a block!',
                'index': block['index'],
                'timestamp': block['timestamp'],
                'proof': block['proof'],
                'previous_hash': block['previous_hash']}
    return JSONResponse(response)

# Obtener la cadena de bloques completa
@app.get('/get_chain', status_code=200)
def get_chain():
    response = {'chain': blockchain.chain,
                'length': len(blockchain.chain)}
    return JSONResponse(response)

# Check si la cadena es correcta
@app.get('/is_valid', status_code=200)
def is_valid():
    is_valid = blockchain.is_chain_valid(blockchain.chain)
    if is_valid:
        response = {'message': 'All good. The Blockchain is valid.'}
    else:
        response = {'message': 'Houston, we have a problem. The Blockchain is not valid.'}
    return JSONResponse(response)

