import json
import random
import string
from flask import Flask,request



#JsonIN='{ "letters":"yes", "digits":"yes", "specialcharacter":"yes", "length":"10", "passwords":""}'

def get_pass_requirements(letters, digits, specialcharacter, length, passwords):
    chars = ''
    Dic={}
    if letters:
        chars += string.ascii_letters
    if digits:
        chars += string.digits
    if specialcharacter:
        chars += string.punctuation
    for iter in range(0, passwords):
        randompass = ''.join(random.choice(chars) for i in range(length))
        Value="Password" + f'{iter}'
        #print (Value,randompass)
        Dic[Value]=randompass
    #print (Dic)
    JsonOUT = json.dumps(Dic)
    print (JsonOUT)
    return JsonOUT

passwordApp = Flask(__name__)
@passwordApp.route('/', methods=['GET'])
def hello_world():
    return "<p>UP</p>"

@passwordApp.route('/p', methods=['POST'])        
def read_json():
    JsonIN=request.data
    print (JsonIN)
    PassVars=json.loads(JsonIN)
    if (PassVars["letters"].lower() != "no"):
        V1="yes"
    else:
        V1=''
    if (PassVars["digits"].lower() != "no"):
        V2="yes"
    else:
        V2=''
    if (PassVars["specialcharacter"].lower() != "no"):
        V3="yes"
    else:
        V3=''
    if PassVars["length"]:
        V4=int(PassVars["length"])
    else:
        V4=int(16)
    if PassVars["passwords"]:
        V5=int(PassVars["passwords"])
    else:
        V5=int(5)
    return get_pass_requirements(V1, V2, V3, V4, V5)

def main():
    passwordApp.run(host='0.0.0.0')


if __name__ == "__main__":
    main()
