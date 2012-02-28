require "columns-matcher/version"

module ColumnsMatcher
  class Matcher
    
    def initialize
      @header = []
      @matcher = {}
      @columns = nil
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
        matches.each_with_index do |name, label|
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
        
        # corrispondenza esatta
        @matcher.each_with_index do |name, labels|
          labels.each do |label|
            if @header.index_of(label) != -1
              @columns[name] = @header.index_of(label)
            end
          end
        end
        
        # espressione regolare
        # to-do
        
        # similar text
        # to-do
      
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
