# MemoryLeakRefereciaCircular

Fala radzeiros e radzeiras, tudo certo? Essa semana estava falando com um colega e ele apresentou uma situação, até então não conhecia a mesma, então resolvi fazer esse post para compartilhar com vocês.

Certamente você já instanciou uma interface e pensou “com essa não preciso me preocupar”. Bem, em partes esta certo, porem existe uma situação que isso não ocorre e acaba apresentando vazamento de memória. Quando criamos uma Referência Circular entre Objetos, os objetos não são destruídos. 

Como é sabido,não contamos como garbage collector, mas temos um contador de referências, esse é incrementado quando criamos o objeto e quando não a mais referências 
ou atribuímos nil, esse contador é decrementado. 

Mas quando um objeto aponta para outro, referencia circular, nenhum deles sai da memória, pois um segura o outro, ambos ainda tem uma referência. Para corrigir isso o delphi usa referência fraca, uma anotação [weak], como mostrado nesse projeto.


Notem que quando é criada nota (INota), no construtor é criada instância de IItem e essa instância recebe por injeção de dependência INota(self), criando assim a referência circular entre os objetos. Minha sugestão é evitar esse tipo de prática e se necessário utilizar o [weak], como pode ser visto no exemplo.



https://objectpascalprogramming.com/posts/interfaces-e-a-referencia-circular-entre-objetos/
