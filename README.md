# TheGraph Essentials

* TheGraph is a decentralized Protocol for Indexing and Querying Data from Blockchains
* TheGraph allows the Indexing of Blockchain Data
* Events within Smart Contracts to communicate outside the Blockchain
* TheGraph processes every single (Transfer) Event that is emitted from the indexed Smart Contract and then aggregates it
* It reads Metadata from Storage Networks like IPFS using the Token ID and IPFS Hash and then aggregates it

<p align="center">
    <img src="https://user-images.githubusercontent.com/29623199/146331751-c8e06574-c90d-439c-9c85-4909c35f3af3.png" alt="The Graph" width="75%"/>
</P>

<hr/>

## Smart Contract Indexing

* Using the __Hosted Service__ from The graph with GitHub
* Contract Address on Testnet Rinkeby: __0x176EaCdFbcA9F053166184bB90bEcB5CD634124b__
* The following Steps are necessary to generate the Subgraph Code:
    1) graph init --product hosted-service <GITHUB_USER>/<SUBGRAPH NAME>
    2) yarn install (in Subgraph Folder)
    3) yarn codegen (in Subgraph Folder)
* The Mappings for the Subgraph have to be adapted for the upcoming Events from the indexed Smart Contract
* After that deploying the Subgraph as follows:
    * graph auth --product hosted-service <ACCESS_TOKEN>
    * graph deploy --product hosted-service <GITHUB_USER>/<SUBGRAPH NAME>

## Subgraph

* A Subgraph defines which Data TheGraph will index from the Blockchain, and how it will store it

### Manifest

* The Subgraph Manifest or `subgraph.yaml` defines the Smart Contracts to be indexed from this Subgraph

### Endpoints

* Subgraph Endpoints:
    * Queries (HTTP):     https://api.thegraph.com/subgraphs/name/michael-steinert/flip-coin
    * Subscriptions (WS): wss://api.thegraph.com/subgraphs/name/michael-steinert/flip-coin
