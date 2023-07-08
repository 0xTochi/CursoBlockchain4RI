# CursoBlockchain4RI

Este repositorio contiene el código de la parte 1 del módulo de blockchain del diplomado de tecnologías de la cuarta revolución  industrial de la facultad de ciencias exactas y naturales de la universidad de Antioquia.


Para instalar los paquetes necesarios basta ejecutar el siguiente comando.

```
pip3 install -r requirements.txt
```

Para desplegar de manera local el API-REST que contiene la blockchain, basta ejecutar el comando

```
python3 -m uvicorn app:app
```

La api a través del puerto 8000 habilita tres endpoints con métodos GET que permiten hacer operaciones básicas dentro de la red blockchain.

**get_chain**

Permite obtener el estado de la red, se ejecuta con el comando 
```
curcl http://127.0.0.1:8000/get_chain
```
y se obtiene un resuultado como el siguiente

```
{
	"chain": [
		{
			"index": 1,
			"timestamp": "2023-06-24 04:38:29.551838",
			"proof": 1,
			"previous_hash": "0"
		},
		{
			"index": 2,
			"timestamp": "2023-06-24 04:38:35.620213",
			"proof": 533,
			"previous_hash": "9602514b7ea03f52e23ceb391eb79c0f91c197f90f529c779eb5d5a49df3173b"
		},
		{
			"index": 3,
			"timestamp": "2023-06-24 04:38:36.918888",
			"proof": 45293,
			"previous_hash": "4470f73a2a6e3facdea049705eba47f6e32b75db05d37a27ec44dbd034ec9057"
		}
	],
	"length": 3
}
```

**mine_block**

Permite minar un nuevo bloque. Similar al anterior, se usa el comando
```
curcl http://127.0.0.1:8000/mine_block
```

Con un resultado

```
{
	"message": "Congratulations, you just mined a block!",
	"index": 3,
	"timestamp": "2023-06-24 04:38:36.918888",
	"proof": 45293,
	"previous_hash": "4470f73a2a6e3facdea049705eba47f6e32b75db05d37a27ec44dbd034ec9057"
}
```