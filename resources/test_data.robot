*** Variables ***
${VALID_USERNAME}    hehe@yopmail.com
${VALID_PASSWORD}    Pass1234!

${INVALID_USERNAME}    hehex@yopmail.com
${INVALID_PASSWORD}    Pass1234!!

@{VALID_ITEMS}    hublot    fossil    seiko
${INVALID_ITEMS}    qujtywdvquty

&{ITEMS}    cards1=//a[@data-testid='product-card-test' and contains(., 'Seiko 5 Sports SRPD55K1')]\ 
...         cards2=//a[@data-testid='product-card-test' and contains(., 'Seiko 5 Sports SRPD53K1')]
