<!DOCTYPE html>
<html>
  <head>
    <title>My supersecret credentials</title>
    <style>
      * {
          font-family: Arial, sans-serif;
      }
      .wrapper {
          width: 60em;
          margin: 0 auto;
      }
      .credentials {
          background: #373737;
          color: #FFFFFF;
          font-family: monospace;
          margin: 1em;
          padding: 1em 2em;
          border-radius: 1em;
      }
      .credentials p {
          font-family: monospace;
      }
    </style>
  </head>
  <body>
    <div class="wrapper">
      <h1>Diary Credentials</h1>
      <div class="credentials">
        {{ with secret "kv/web/deployments/diary-creds" -}}
        <p>username: {{ .Data.data.username }}</p>
        <p>password: {{ .Data.data.password }}</p>
        {{- end }}
      </div>
      <p>These are suuuuuper secret, so they should be locked in a <a href="https://vaultproject.io">vault</a> or something!</p>
    </div>
  </body>
</html>
