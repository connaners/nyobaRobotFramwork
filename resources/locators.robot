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




