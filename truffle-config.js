const HDWalletProvider = require("@truffle/hdwallet-provider");
module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },

    matic: {
      provider: () => new HDWalletProvider("edge grant spray coconut anxiety shock citizen crisp cotton day hurdle turkey", `https://goerli.infura.io/v3/4a17090cd5eb44f699a6b0e9b277088c`),
      network_id: 80001,
      confirmations: 1,
      skipDryRun: true
    },

    goerli: {
      provider: () => {
        return new HDWalletProvider("edge grant spray coconut anxiety shock citizen crisp cotton day hurdle turkey", 'https://goerli.infura.io/v3/4a17090cd5eb44f699a6b0e9b277088c')
      },
      network_id: 5,
      gas: 4465030,
      gasPrice: 10000000000,
    },

  },

  compilers: {
    solc: {
      version: '0.8.9',
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
}