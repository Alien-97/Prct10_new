
Nodo = Struct.new(:value,:next,:prev)

class Lista
	
	attr_reader :head, :tail,:sz
	def initialize()
		@head = nil
		@tail = nil
		@sz = 0
	end
	
	def push_head(value)

      if value.class == Nodo
        added_node = value
      else
        added_node = Nodo.new(value)
      end

      added_node.prev = nil
      added_node.next = @head

      @head.prev = added_node unless @head.nil?
      @head = added_node

      @tail = added_node if @tail.nil? 
      @sz = @sz + 1
      return nil
      
    end

    def push_tail(value)
     
    end
end
