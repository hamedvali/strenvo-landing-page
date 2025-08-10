# 📧 Email Collection Setup Guide

## Option 1: Formspree (Recommended - Free & Easy)

### Setup Steps:
1. **Go to [Formspree.io](https://formspree.io)** and create a free account
2. **Create a new form**:
   - Click "New Form"
   - Name it "Strenvo Email Collection"
   - Copy the form ID (looks like: `xrgjqkab`)

3. **Update the HTML**:
   - Replace `YOUR_FORM_ID` in `index.html` line 481 with your actual form ID
   - Example: `action="https://formspree.io/f/xrgjqkab"`

4. **Configure notifications**:
   - In Formspree dashboard, go to your form settings
   - Set up email notifications to receive emails when someone submits
   - You can also export submissions as CSV

### Benefits:
- ✅ Free up to 50 submissions/month
- ✅ Automatic spam protection
- ✅ Email notifications
- ✅ CSV export
- ✅ No coding required

---

## Option 2: Google Sheets (Free & Advanced)

### Setup Steps:
1. **Create a Google Sheet** for storing emails
2. **Go to [Google Apps Script](https://script.google.com)**
3. **Create a new script** with this code:

```javascript
function doPost(e) {
  const sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  const data = JSON.parse(e.postData.contents);
  const email = data.email;
  const timestamp = new Date();
  
  sheet.appendRow([email, timestamp]);
  
  return ContentService.createTextOutput(JSON.stringify({
    'result': 'success',
    'row': sheet.getLastRow()
  })).setMimeType(ContentService.MimeType.JSON);
}
```

4. **Deploy as web app**:
   - Click "Deploy" → "New deployment"
   - Choose "Web app"
   - Set access to "Anyone"
   - Copy the web app URL

5. **Update the HTML**:
   - Replace the Formspree action with your Google Apps Script URL
   - Update the fetch request to send JSON instead of FormData

### Benefits:
- ✅ Completely free
- ✅ Full control over data
- ✅ Easy to analyze in Google Sheets
- ✅ Can add more fields easily

---

## Option 3: EmailJS (Free & Direct)

### Setup Steps:
1. **Go to [EmailJS.com](https://emailjs.com)** and create account
2. **Add your email service** (Gmail, Outlook, etc.)
3. **Create an email template** for new submissions
4. **Get your service ID and template ID**
5. **Update the HTML** to use EmailJS instead of Formspree

### Benefits:
- ✅ Direct email delivery
- ✅ Custom email templates
- ✅ Free tier available
- ✅ Real-time notifications

---

## Current Implementation Notes:

The current code uses **Formspree** as the default option. To activate it:

1. **Get your Formspree form ID** (follow Option 1 above)
2. **Replace `YOUR_FORM_ID`** in the HTML file
3. **Deploy the changes**

The popup will:
- ✅ Show email form first
- ✅ Collect valid email addresses
- ✅ Show coupon code after submission
- ✅ Remember submission in session storage
- ✅ Fallback gracefully if email service fails

## Testing:

After setup, test the popup by:
1. Opening the site in a new incognito window
2. Waiting 10 seconds or scrolling 60%
3. Entering a test email
4. Verifying you receive the email notification
5. Checking that the coupon code appears

---

**Need help?** The current implementation has a fallback that shows the coupon code even if email submission fails, so your users won't be blocked from getting their discount!
