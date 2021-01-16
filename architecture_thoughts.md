Enigma is "top" class
TWO runner files encrypt.rb AND decrypt.rb (live in root obvi)

https://codelikethis.com/lessons/learn-to-code/argv
^^^^^
page that teaches you how to 

Three options per interaction pattern:

1)
encrypt a message with a key and date
enigma.encrypt("hello world", "02715", "040895")
decrypt a message with a key and date
enigma.decrypt("keder ohulw", "02715", "040895")

2)
encrypt a message with a key (uses today's date)
encrypted = enigma.encrypt("hello world", "02715")
decrypt a message with a key (uses today's date)
enigma.decrypt(encrypted[:encryption], "02715")

3)
encrypt a message (generates random key and uses today's date)
enigma.encrypt("hello world")

encryption/decryption  always in a hash
{encryption: "keder ohulw", key: "02715", date: "040895"}

{encryption: "hello world", key: "02715", date: "040895"}

