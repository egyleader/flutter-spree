# Flutter spree <img src="android\app\src\main\res\mipmap-hdpi\ic_launcher.png" style="zoom:40%;" />
Doesn't Have couple of hours every time you type *flutter create new-project* ?? then this repo is for you ,
 Flutter Spree is Starter Boilerplate project for flutter to kickstart your project without spending hours deleting comments , integrating services , organizing files  or copying helpers from other projects so you can focus on building your project .

## What You Get ??

- Scalable files and folders architecture 
- Linitng Using Pendantic package (witch google devs use )
- .env file support for const sensitive information (like api tokens)
- shared preferences support with helper functions 



## Getting Started

just clone this project and start working ,, no other tricks for now ! 

## Shared Prefrences 

spree app comes with the Shared Prefrences Support by default using a singleton that you 
can use by calling *Prefs.yourMethod(args)* anywhere in your app .

## .env

This is a zero-dependency helper that loads environment variables from a `.env` 
witch is a concept inspired by [the 12factor app](https://12factor.net/config)  and the implementation of [lavravel](https://laravel.com/) 
you can use the .env file with 4 easy steps :

1. rename .env.example to .env file and make sure it is in .gitignore
2. add your env consts to it like this *API_TOKEN=Token* 
3. initialize it as early as you can in your app by *Env.init()* (done for you already 😉)
4. load the env value you want with *Env.load(settingName)*

## Helping

you can start by giving this repo a star  and - if you are really feel like it - to contribute in it 