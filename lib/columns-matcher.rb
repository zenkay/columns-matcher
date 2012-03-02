require "columns-matcher/version"

module ColumnsMatcher
  class Matcher
    
    def initialize
      @header = []
      @matcher = {}
      @columns = {}
    end
    
    def add_column(name, labels)
      begin
        if labels.is_a? String
          @matcher[name] = [labels]
        elsif labels.is_a? Array
          @matcher[name] = labels
        end
        self.match_columns
        return true
      rescue Exception => e
        return false
      end
    end
    
    def add_columns(matches)      
      if matches.is_a? Hash
        matches.each do |name, labels|
          begin
            if labels.is_a? String
              @matcher[name] = [labels]
            elsif labels.is_a? Array
              @matcher[name] = labels
            end
          rescue Exception => e
            puts e.backtrace
          end
        end
        self.match_columns
      end
    end
    
    def set_header(header)
      begin
        if header.is_a? String
          @header = [header]
        elsif header.is_a? Array
          @header = header
        end
        self.match_columns
      rescue Exception => e
      end
    end
    
    def match_columns
      if not @matcher.empty? and not @header.empty?

        @matcher.each do |name, labels|
          labels.each do |label|
            
            # exact match
            unless @header.index(label).nil?
              @columns[name] = @header.index(label)
              break
            end
            
            # different case
            @header.each_with_index do |head, index|
              if head.downcase == label.downcase
                @columns[name] = index
                break
              end
            end
            break unless @columns[name].nil?
            
            # reg-exp
            @header.each_with_index do |head, index|
              unless head.match(/^#{label}$/).nil?
                @columns[name] = index
                break
              end
            end
            break unless @columns[name].nil?
            
            # multiple words search
            # to-do
            
          end
        end
      end
    end
    
    def column_of(name)
      if @columns[name].nil?
        return nil
      else
        return @columns[name]
      end
    end
    
  end
end
