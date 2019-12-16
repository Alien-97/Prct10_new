# Contenedor que sigue la filosofía de lista doblemente enlazada.
# 
# @author Alien Embarec Riadi
#
# @!attribute [r] head
#   @return [Node] primer elemento de la lista
# @!attribute [r] tail
#   @return [Node] ultimo elemento de la lista
# @!attribute [r] size
#   @return [Fixnum] cantidad de elementos en la lista

Nodo = Struct.new(:value,:next,:prev)

class Lista

	include Enumerable
	attr_reader :head, :tail,:sz

	# Crea una lista vacía.
	#
	# @return [List]
	def initialize()
		@head = nil
		@tail = nil
		@sz = 0
	end

	# Inserta un valor al principio de la lista.
	#
	# @param value valor o nodo que se introduce en la lista.
	
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

    # Inserta un valor al final de la lista.
	#
	# @param value valor o nodo que se introduce en la lista.

    def push_tail(value)
     if value.class == Nodo
        added_node = value
      else
        added_node = Node.new(value)
      end

      added_node.next = nil
      added_node.prev = @tail

      @tail.next = added_node unless @tail.nil?
      @tail = added_node
      @head = added_node if @head.nil? 
      @sz = @sz + 1

      return nil
    end

    # Inserta un elemento en una posición concreta de la lista.
	#
	# @param posicion [Fixnum] posición en la que se quiere insertar el elemento.
	# @param value valor o nodo que se quiere incluir.

    def insert(value,posicion)
    	if posicion.is_a? Integer
			if posicion == 0 
				push_head(value)
			elsif posicion == @sz
				push_tail(value)
			elsif posicion < @sz && posicion > 0
				if value.class == Node
					addedNode = value
				else
					addedNode = Node.new(value)
				end
				iterator = @head
				posicion.times do |i|
					iterator = iterator.next
				end		
				addedNode.prev = iterator.prev
				addedNode.next = iterator
				iterator.prev = addedNode
				addedNode.prev.next = addedNode
				@sz = @sz + 1
			end
		end
    end

   	# Elimina un elemento al principio de la lista.
	#
	# @return val [Nodo]
    def pop_head

		if(@head == nil)
			return nil
		  	else
		    val= @head
		    node = @head.next
		    @head = node
		    if @head != nil
		      	@head.prev = nil
		    else
		    	@tail = nil
		    end
		    @sz = @sz -1
		end

		return val
    end

	# Elimina un elemento del final de la lista.
	#
	# @return val [Nodo]
    def pop_tail
    	if(@tail == nil)
        	return nil
      	else
        	val= @tail
        	node = @tail.prev
        	@tail = node
        	if @tail != nil
          		@tail.next = nil
       	 	else
        		@head = nil
        	end
        	@sz = @sz -1
        end

        return val
    end

    # Muestra la salida formateada de los elementos de la lista
	#
	# @return s [String] la salida formateada de la lista

    def to_s
    	s = ""
        each {|i| s += "#{i.nombre_alimento.to_s}\n"}
        s
    end

    #Metodo para enumerar la lista, poder aplicarle metodos de ordenacion, como collect,sort... todos del modulo enumerable
    def each
		iterator = @head
		while iterator != nil do
			yield iterator.value
			iterator = iterator.next
		end
	end

	def size
		return @sz_
	end

	# Elimina un elemento en una posición concreta de la lista.
	#
	# @param posicion [Fixnum] posición del elemento que se quiere eliminar.

    def delete(posicion)
	    if posicion.is_a? Integer

		    if posicion == 0 
		    	pop_head
		    elsif posicion == (@sz - 1)
		        pop_tail
		    elsif posicion < (@sz - 1) && posicion > 0
		        iterator = @head
		        posicion.times do |i|
		        iterator = iterator.next
		    end   

		    iterator.next.prev = iterator.prev
		    iterator.prev.next = iterator.next
		    @sz = @sz - 1

		    end
	    end
	      
	    return nil
    end
    
    

end
