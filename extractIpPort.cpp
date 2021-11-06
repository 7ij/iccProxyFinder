#include <bits/stdc++.h>
using namespace std;
bool isnumber(string &str)
{
    for(auto i:str)
        if(i<'0' || i>'9')
            return false;
    return true;
}
void solve()
{
    string line;
    while(getline(cin, line))
    {
        if(line.find("document.write('") != string::npos)
        {
            int i=44;
            for(; line[i]!='\''; i++)
                cout<<line[i];

            while(line[++i]!='\'') 0; //do nothing
            while(line[++i]!='\'')
                cout<<line[i];

        }
        stringstream ss(line);
        string port;
        ss>>port;
        if(isnumber(port) && port.size()>0)
            cout<<":"<<port<<endl;

    }
}
int main(int argc, char **argv)
{
    if(argc!=2)
    {
        cout<<"Error: Failed to Extract IP. Bad Input Format.";
        return 0;
    }
    freopen(argv[1], "r+", stdin);
    freopen("iplist", "w+", stdout);
    solve();
}
