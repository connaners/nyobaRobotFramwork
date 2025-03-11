*** Variables ***
${URL}                   https://www.jamtangan.com/
${BROWSER}               Chrome
${closePopUpNotif}       id=moe-dontallow_button
${BTN_UTAMA}             xpath=//button[@data-test-id='button-primary']
${BTN_LOGIN}             id=login-button
${BTN_REGISTER}          xpath=//button[normalize-space()='Daftar']
${INPUT_USERNAME}        name=username
${INPUT_PASSWORD}        name=password
${BTN_LOGIN_SUBMIT}      xpath=//button[contains(@class, 'qa-login-button')]
${USER_AVATAR}           xpath=//picture/img[@alt='User avatar icon']
${BTN_LOGOUT}            xpath=//span[text()='Keluar']
${BTN_CONFIRM_LOGOUT}    xpath=//button[@data-testid='confirm-logout-cancel']
${LOGIN_FORM}            xpath=//div[@data-testid='login-form']
${TOAST_LOCATOR}         xpath=//div[contains(@class, 'mw-snackbar') and contains(@class, 'is-visible')]
${TOAST_MESSAGE1}        Ups, email atau password kamu salah
${TOAST_MESSAGE2}        Ups, akun ini belum terdaftar
${TOAST_MESSAGE3}        Failed to fetch
# ${LOGIN_FORM}            xpath=//div[contains(@class, 'login-form-popup')]//div[contains(text(), 'Masuk')]
${FOOTER}                xpath=//div[contains(@class, 'md:bg-neutral') and contains(text(), 'Copyright')]

${KATEGORI}              xpath=//div[contains(@class, 'header-category')]
${KCOUPLE}               //a[@href='/kategori/jam-tangan-couple']//span[contains(text(), 'Couple')]
${KPRIA}                 //a[@href='/kategori/jam-tangan-pria']/li
${SMARTWATCH}            //div[span[text()='Rekomendasi Style']]/following-sibling::ul/li/a[text()='Smart Watch']

${POPUPADS}              xpath=//iframe[contains(@id, 'moe-onsite-campaign')]
${CLOSEIFRAME}           xpath=//button[@id='close-icon']

${SEARCHBAR}             //input[@data-testid = 'search-input']
${BUTTONSEARCH}          //div[@data-testid = 'option-right']//button[@aria-label = 'Search']

${RESULTITEMS}            //div[contains(@class, 'qa-product-list') and @page='1' and @currentpage='1']
${INVALIDRESULTITEMS}     //div[@data-testid='empty-state-component']//div[contains(text(), 'Halaman tidak ditemukan')]
${DETAILITEMS}            //div[@data-testid='productDetail-test']


#item amount
${ITEMAMOUNTS}            xpath=//div[contains(@class, 'value-wrapper')]
${BUTTONADD}              xpath=//button[contains(@class, 'plus-wrapper')]
${BUTTONMINUS}            xpath=//button[contains(@class, 'minus-wrapper')]


#popup modals
${ADDCART}                xpath=//button[@id='btn-add-to-cart' and contains(@data-testid, 'pdp-btn-add-to-cart') and contains(text(), '+ Keranjang')]
${MODALADDTOCART}         xpath=//div[@data-testid='bundling' and contains(., 'Tambah ke Keranjang')]
${BUTTONSUBMIT}           xpath=//button[@id='btn-cta' and contains(@data-testid, 'submit-add-to-cart') and contains(., '+ Keranjang')]
${SNACKBARMESSAGE}        xpath=//div[contains(@class, 'mw-snackbar') and contains(@class, 'is-visible')]//p[@class='message']
...    #xpath=//div[@id='snackbar-root']//div[contains(@class, 'mw-snackbar') and contains(@class, 'is-visible')]//p[@class='message']


#cart
${CLICKCART}              //a[@href='/shopping-cart']
# ...    xpath=//span[@class='qa-cart-button']