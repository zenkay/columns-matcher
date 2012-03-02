# Column Matcher

When you work with spreadsheets and casual users things do not always go as you want.

I worked on a project where users have to upload a spreadsheet with a lot of data about clients purchases.
After 3 upload they call me because the system "did not work well".

The files look like these followiong.

File 1:

<table>
  <tr>
    <th>Name</th>
    <th>Surname</th>
    <th>Emails</th>
  </tr>
  <tr>
    <td>John</td>
    <td>Smith</td>
    <td>john.smith@gmail.com</td>
  </tr>
  <tr>
    <td>John</td>
    <td>Doe</td>
    <td>john.doe@hotmail.com</td>
  </tr>
</table>

File 2:

<table>
  <tr>
    <th>Surname</th>
    <th>Name</th>
    <th>E-mail</th>
  </tr>
  <tr>
    <td>Smith</td>
    <td>John</td>
    <td>john.smith@gmail.com</td>
  </tr>
  <tr>
    <td>Doe</td>
    <td>John</td>
    <td>john.doe@hotmail.com</td>
  </tr>
</table>

File 3:

<table>
  <tr>
    <th>Mail</th>
    <th>Nombre</th>
    <th>Apellido</th>
  </tr>
  <tr>
    <td>john.smith@gmail.com</td>
    <td>John</td>
    <td>Smith</td>
  </tr>
  <tr>
    <td>john.doe@hotmail.com</td>
    <td>John</td>
    <td>Doe</td>
  </tr>
</table>

3 files, 3 different structures. 3 different headers. WTF!
How can i guess the position of the columns i'm looking for?

This gem try to solve the problem

## Install

Add to your Gemfile and run the `bundle` command to install it.

```ruby
gem "columns-matcher"
```
 
**N.B. Requires Ruby 1.9.2 or later.**

## Use

```ruby

@matcher = ColumnsMatcher::Matcher.new

# the column that contains the name can be lebeled with "NAME", "NOME" or "NOMBRE"
@matcher.add_column("name", ["NAME", "NOME", "NOMBRE"])

# the column that contains the name can be lebeled with "NAME", "NOME" or "NOMBRE"
@matcher.add_column("cognome", ["SURNAME", "COGNOME", "APELLIDOS"])

# We suppose the header is ["COGNOME", "NOME", "INDIRIZZO"]
@matcher.set_header(header_loaded_from_spreadsheet)

@matcher.column_of("name") # return 1
@matcher.column_of("cognome") # return 0

```
