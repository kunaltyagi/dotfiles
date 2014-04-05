#!/usr/bin/python

import mechanize
from authenticate import Authentication
import sys

internet_login_page = "https://internet.iitb.ac.in"

class IITBLogin:
    def __init__(self):
        self.auth = Authentication()
        assert(self.auth.username == "kunaltyagi")

        self.br = mechanize.Browser()
        self.br.set_handle_equiv(True)
        self.br.set_handle_redirect(True)
        self.br.set_handle_referer(True)
        self.br.set_handle_robots(False)

        self.br.addheaders = [('User-agent', 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.1) Gecko/2008071615 Fedora/3.0.1-1.fc9 Firefox/3.0.1')]
        self.br.set_proxies({})

    def login(self):
        r = self.br.open(internet_login_page)
        html = r.read()
        if "LOGIN AT" in html and "IP ADDRESS" in html:
            print "Already logged in"
        else:
            n_forms = 0
            for f in self.br.forms():
                n_forms = n_forms + 1
            assert (n_forms == 1)
            self.br.select_form(nr=0)
            self.br.form['uname'] = self.auth.username
            self.br.form['passwd'] = self.auth.password
            self.br.submit()
            print "Logged in successfully"

    def logout(self):
        r = self.br.open(internet_login_page)
        html = r.read()
        if "LOGIN AT" in html and "IP ADDRESS" in html:
            n_forms = 0
            for f in self.br.forms():
                n_forms = n_forms + 1
            assert (n_forms == 1)
            self.br.select_form(nr=0)
            self.br.submit()
            print "Logged out"
        else:
            print "Already logged out"

    def process(self, argv):
        if len(argv)>1:
            if argv[1]=="logout":
                l.logout()
                return
        l.login()

if __name__=="__main__":
    l = IITBLogin()
    l.process(sys.argv)
