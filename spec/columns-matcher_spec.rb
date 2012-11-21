# encoding: utf-8
require 'spec_helper'
describe ColumnsMatcher do
  
  describe "Matcher standard" do
    
    before do
      @matcher = ColumnsMatcher::Matcher.new
    end
    
    it "should can create the object" do
      @matcher.should_not be_nil
    end
    
    it "should recognize single column with a single description" do
      @matcher.add_column("name", "NOME")
      @matcher.set_header(["NOME"])
      @matcher.column_of("name").should be(0)
    end

    it "should recognize single column with a single description including spaces" do
      @matcher.add_column("coupon_code", ["Codigo coupon"])
      @matcher.set_header(["Codigo coupon"])
      @matcher.column_of("coupon_code").should be(0)
    end
    
    it "should recognize single column with multiple descriptions" do
      @matcher.add_column("name", ["NAME", "NOME", "NOMBRE"])
      @matcher.set_header(["NOME"])
      @matcher.column_of("name").should be(0)
    end
    
    it "should recognize single column within different fields" do
      @matcher.add_column("name", ["NAME", "NOME", "NOMBRE"])
      @matcher.set_header(["COGNOME", "NOME", "INDIRIZZO"])
      @matcher.column_of("name").should be(1)
    end
    
    it "should recognize multiple columns within different fields" do
      @matcher.add_column("name", ["NAME", "NOME", "NOMBRE"])
      @matcher.add_column("cognome", ["SURNAME", "COGNOME", "APELIDOS"])
      @matcher.set_header(["COGNOME", "NOME", "INDIRIZZO"])
      @matcher.column_of("name").should be(1)
      @matcher.column_of("cognome").should be(0)
    end
    
    it "should recognize multiple columns within different fields with a single definition" do
      @matcher.add_columns(
        "name" => ["NAME", "NOME", "NOMBRE"],
        "cognome" => ["SURNAME", "COGNOME", "APELIDOS"]
      )
      @matcher.set_header(["COGNOME", "NOME", "INDIRIZZO"])
      @matcher.column_of("name").should be(1)
      @matcher.column_of("cognome").should be(0)
    end
    
    it "should recognize single column with different case" do
      @matcher.add_column("name", ["nome"])
      @matcher.set_header(["NOME"])
      @matcher.column_of("name").should be(0)
    end
    
    it "should recognize multiple columns within different fields with different case" do
      @matcher.add_column("name", ["name", "nome", "nombre"])
      @matcher.add_column("cognome", ["surname", "cognome", "apelidos"])
      @matcher.set_header(["COGNOME", "NOME", "INDIRIZZO"])
      @matcher.column_of("name").should be(1)
      @matcher.column_of("cognome").should be(0)
    end
    
    it "should recognize single column with a reg exp" do
      @matcher.add_column("name", ["N[AO]+ME"])
      @matcher.set_header(["NOME"])
      @matcher.column_of("name").should be(0)
    end

    it "should not find single column with a reg exp" do
      @matcher.add_column("name", ["[AO]+ME"])
      @matcher.set_header(["NOME"])
      @matcher.column_of("name").should be_nil
    end

    it "should not find single column with a reg exp" do
      @matcher.add_column("email", ["[Ee]?[\-]*mail[s]*"])
      @matcher.set_header(["Emails"])
      @matcher.column_of("email").should be(0)
    end
    
    it "should not find single column with a reg exp and spaces" do
      @matcher.add_column("coupon_code", ["Codigo cupon[^\"]*"])
      @matcher.set_header(["Codigo cupon (pedido #)"])
      @matcher.column_of("coupon_code").should be(0)
    end

  end
  
  
end