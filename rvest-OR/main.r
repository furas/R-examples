# author: Bartlomiej "furas" Burek (https://blog.furas.pl)
# date: 2022.03.17
# [r - How scrap from table that changes class from "odd" to "even" - Stack Overflow](https://stackoverflow.com/questions/71516254/how-scrap-from-table-that-changes-class-from-odd-to-even/)

library(rvest)

text = '
<tr class="odd">
    <td class="">Transferencias de Recursos do FUNDEB - Principal</td>
    <td align="right" class="">6.324.609,86</td>
</tr>

<tr class="even">
    <td class="">Cota-Parte do ICMS - Principal</td>
    <td align="right" class="">3.765.015,28</td>
</tr>

<tr class="advertisement">
    <td class="">Buy new cat</td>
    <td align="right" class="">3.359.964,56</td>
</tr>

<tr class="odd">
    <td class="">Transferencias de Complementacao da Uniao ao FUNDEB - Princ.</td>
    <td align="right" class="">3.359.964,56</td>
</tr>
'

html <- minimal_html(text)

message('--- css selector ---')

results <- html %>% html_elements('.odd, .even')

results

message('--- xpath ---')

results <- html %>% html_elements(xpath='//tr[@class="odd" or @class="even"]')

results

