
# postman-sign-jwt

Build a script that signs JSON Web Tokens in Postman.

## Build the script

Build the Postman script by running this command, which also installs node modules:

```bash
npm run start
```

## Use the script

The built Postman script is at `dist/pre-request-script.js`.

Copy the content of this file and paste it into Postman's **Pre-request Script** panel. Notice that it sets a Postman environment variable named `bearerToken`.

If you're on macOS copy the script to the Clipboard with this Terminal command:

```bash
pbcopy < dist/pre-request-script.js
```

Over in the **Headers** panel, add a header key `Authorization` whose value is `Bearer {{bearerToken}}`.
