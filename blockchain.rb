require 'digest'
 
class Block
  attr_accessor :id, :timestamp, :data, :previous_fingerprint, :fingerprint, :nonce
  def initialize(id, timestamp, data, previous_fingerprint = '')
    self.id = id
    self.timestamp = timestamp
    self.data = data
    self.previous_fingerprint = previous_fingerprint
    self.fingerprint = ''
    self.nonce = 0
  end
  
  def calculate_Hash()
    return Digest::SHA256.hexdigest(self.id.to_s + self.timestamp.to_s + self.data.to_s + self.nonce.to_s).to_s
  end
  
  def mine_block(difficulty)
    pow = Array.new(difficulty + 1, '0').join()

    while self.fingerprint[0..difficulty] != pow
      self.nonce += 1
      self.fingerprint = self.calculate_Hash
    end
    puts "block mined: " + self.fingerprint
  end
end

class Blockchain
  attr_accessor :chain, :difficulty
  def initialize()
    self.chain = [self.createGenesisBlock()]
    self.difficulty = 3
  end

  def createGenesisBlock()
    Block.new(0, "25/10/2017", "First Blocky", 0)
  end

  def getLastBlock()
    self.chain[self.chain.length - 1]
  end
    
  def addBlock(newBlock)
    newBlock2 = newBlock
    newBlock2.previous_fingerprint = self.getLastBlock().fingerprint
    newBlock2.mine_block(self.difficulty)
    self.chain.push(newBlock2)
  end

  def isChainValid?
    self.chain.each_with_index do |num, i|
      currentBlock = self.chain[i + 1]
      previousBlock = self.chain[i]
      if currentBlock.fingerprint != currentBlock.calculate_Hash()
        return false
      end
      if currentBlock.previous_fingerprint != previousBlock.fingerprint
        return false
      end
      return true
    end
  end
end

mizutacoin = Blockchain.new()
puts "mining block "
mizutacoin.addBlock(Block.new(1, "26/11/2017", {amount: 4}))
puts "\n"
puts "mining block 2..."
mizutacoin.addBlock(Block.new(2, "27/11/2017", {amount: 10}))
puts "\n"
puts "mining block 3..."
mizutacoin.addBlock(Block.new(3, "27/11/2017", {amount: 109}))
puts "\n"
puts "mining block 4..."
mizutacoin.addBlock(Block.new(4, "27/11/2017", {amount: 8810}))
puts "\n"
puts mizutacoin.chain.class
puts "\n"
my_block = mizutacoin.chain.first
puts my_block.class
puts "\n"
mizutacoin.chain.each do |item|
  puts "id:            " + item.id.to_s
  puts "timestamp:     " + item.timestamp.to_s
  if item.data.is_a? Hash
    item.data.each do |key, value|
      puts "#{key}" + " : " + value.to_s
    end
  else
    puts item.data
  end
  puts "previous hash is: " + item.previous_fingerprint.to_s + "\n"
  puts "hash is: " + item.fingerprint.to_s
  puts "\n"
end
puts mizutacoin.isChainValid?
puts "\n"