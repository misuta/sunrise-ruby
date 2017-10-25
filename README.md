### Sunrise Ruby

Blockchain proof of concept in ruby

![Image of Yaktocat](https://octodex.github.com/images/yaktocat.png)

# A little bit of History

Blockchain was first defined in the source code for Bitcoin; A peer-to-peer protocol for transfer value over internet.
Both were created by Satoshi Nakamoto ( _**et al.?**_). Who published the whitepaper **"[Bitcoin](https://bitcoin.org/bitcoin.pdf): A Peer-to-Peer Electronic Cash System"** on Octorber 2008. In 2009 the Bitcoin network began.

# How does it works?

*Grosso modo* a blockchain is set of blocks _**linked**_ with each other. Each block containing data. Since the blockchain is a distributed ledger, the recods keeping on it cannot be modified. With this in mind there are three components that are the Soul of this process.


name | description
-----|------------
hash | is the fingerprint of the block calculated with the _previous hash_ and a _nonce_
previous hash | is the fingerprint of the previous block necessary in order to link one block with the other
nonce         | is a random number that is added to the calculation of the fingerprint in order to obtain a certain pattern in the fingerprints. Its goal is create a proof of work
              
