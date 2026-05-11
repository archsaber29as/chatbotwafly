#!/bin/bash
set -e

echo "Decoding Google credentials..."
python -c "import base64,os; open('credentials.json','w').write(base64.b64decode(os.environ['GOOGLE_CREDENTIALS_B64']).decode())"

echo "Decoding Google token..."
python -c "import base64,os; open('token.pickle','wb').write(base64.b64decode(os.environ['GOOGLE_TOKEN_B64']))"

echo "Starting app..."
exec gunicorn app:app --workers 1 --threads 2 --timeout 120 --bind 0.0.0.0:5000