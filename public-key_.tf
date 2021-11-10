# Create a key-pair

resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = "
  -----BEGIN OPENSSH PRIVATE KEY-----
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
BAUGBw==
-----END OPENSSH PRIVATE KEY-----"