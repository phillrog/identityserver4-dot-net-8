[![Build Clients](https://github.com/phillrog/identityserver4-dot-net-8/actions/workflows/ci-clients.yml/badge.svg)](https://github.com/phillrog/identityserver4-dot-net-8/actions/workflows/ci-clients.yml)

[![CI](https://github.com/phillrog/identityserver4-dot-net-8/actions/workflows/ci.yml/badge.svg)](https://github.com/phillrog/identityserver4-dot-net-8/actions/workflows/ci.yml)

[![CodeQL](https://github.com/phillrog/identityserver4-dot-net-8/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/phillrog/identityserver4-dot-net-8/actions/workflows/codeql-analysis.yml)



# About IdentityServer
Com a descontinuação do suporte para Identity Server 4 e a necessidade de compatibilidade com .NET 8.0, realizei a atualização do repositório original para esta nova versão. Este projeto é simplesmente uma versão atualizada do Identity Server 4 e compatibilidade com .NET 8.0.

É crucial ressaltar que este projeto não pretende ser uma bifurcação (fork) ou substituto do Identity Server 4. Todos os direitos autorais e propriedade intelectual permanecem com os criadores e fundadores originais do Identity Server 4. O objetivo principal é fornecer uma versão compatível com .NET 8.0 para fins de aprendizado e uso pessoal, mantendo a integridade e o respeito pela obra original.

IdentityServer é um framework OpenID Connect e OAuth 2.0 gratuito e de código aberto para ASP.NET Core. IdentityServer4 incorpora todas as implementações de protocolo e pontos de extensibilidade necessários para integrar autenticação baseada em token, logon único e controle de acesso à API em seus aplicativos. IdentityServer4 é oficialmente certificado pela OpenID Foundation e, portanto, compatível com as especificações e interoperável. Faz parte da .NET Foundation e opera sob seu código de conduta. É licenciado sob Apache 2 (uma licença aprovada pela OSI).

# Important update
Update para .net 8

## About IdentityServer4
[<img align="right" width="100px" src="https://dotnetfoundation.org/img/logo_big.svg" />](https://dotnetfoundation.org/projects?searchquery=IdentityServer&type=project)

IdentityServer is a free, open source [OpenID Connect](http://openid.net/connect/) and [OAuth 2.0](https://tools.ietf.org/html/rfc6749) framework for ASP.NET Core.
Founded and maintained by [Dominick Baier](https://twitter.com/leastprivilege) and [Brock Allen](https://twitter.com/brocklallen), IdentityServer4 incorporates all the protocol implementations and extensibility points needed to integrate token-based authentication, single-sign-on and API access control in your applications.
IdentityServer4 is officially [certified](https://openid.net/certification/) by the [OpenID Foundation](https://openid.net) and thus spec-compliant and interoperable.
It is part of the [.NET Foundation](https://www.dotnetfoundation.org/), and operates under their [code of conduct](https://www.dotnetfoundation.org/code-of-conduct). It is licensed under [Apache 2](https://opensource.org/licenses/Apache-2.0) (an OSI approved license).

For project documentation, please visit [readthedocs](https://identityserver4.readthedocs.io).

## Branch structure
Active development happens on the main branch. This always contains the latest version. Each (pre-) release is tagged with the corresponding version. The [aspnetcore1](https://github.com/IdentityServer/IdentityServer4/tree/aspnetcore1) and [aspnetcore2](https://github.com/IdentityServer/IdentityServer4/tree/aspnetcore2) branches contain the latest versions of the older ASP.NET Core based versions.

## How to build

* [Install](https://www.microsoft.com/net/download/core#/current) the latest .NET Core 3.1 SDK
* Install Git
* Clone this repo
* Run `build.ps1` or `build.sh` in the root of the cloned repo

## Documentation
For project documentation, please visit [readthedocs](https://identityserver4.readthedocs.io).

See [here](http://docs.identityserver.io/en/aspnetcore1/) for the 1.x docs, and [here](http://docs.identityserver.io/en/aspnetcore2/) for the 2.x docs.

## Bug reports and feature requests
Please use the [issue tracker](https://github.com/IdentityServer/IdentityServer4/issues) for that. We only support the latest version for free. For older versions, you can get a commercial support agreement with us.

## Commercial and Community Support
If you need help with implementing IdentityServer4 or your security architecture in general, there are both free and commercial support options.
See [here](https://identityserver4.readthedocs.io/en/latest/intro/support.html) for more details.

## Sponsorship
If you are a fan of the project or a company that relies on IdentityServer, you might want to consider sponsoring.
This will help us devote more time to answering questions and doing feature development. If you are interested please head to our [Patreon](https://www.patreon.com/identityserver) page which has further details.

### Platinum Sponsors
[<img src="https://user-images.githubusercontent.com/1454075/62819413-39550c00-bb55-11e9-8f2f-a268c3552c71.png" width="200">](https://udelt.no)

[<img src="https://user-images.githubusercontent.com/1454075/66454740-fb973580-ea68-11e9-9993-6c1014881528.png" width="200">](https://github.com/dotnet-at-microsoft)

### Corporate Sponsors
[Ritter Insurance Marketing](https://www.ritterim.com)  
[ExtraNetUserManager](https://www.extranetusermanager.com/)  
[Knab](https://www.knab.nl/)

You can see a list of our current sponsors [here](https://github.com/IdentityServer/IdentityServer4/blob/main/SPONSORS.md) - and for companies we have some nice advertisement options as well.

## Acknowledgements
IdentityServer4 is built using the following great open source projects and free services:

* [ASP.NET Core](https://github.com/dotnet/aspnetcore)
* [Bullseye](https://github.com/adamralph/bullseye)
* [SimpleExec](https://github.com/adamralph/simple-exec)
* [MinVer](https://github.com/adamralph/minver)
* [Json.Net](http://www.newtonsoft.com/json)
* [XUnit](https://xunit.github.io/)
* [Fluent Assertions](http://www.fluentassertions.com/)
* [GitReleaseManager](https://github.com/GitTools/GitReleaseManager)

..and last but not least a big thanks to all our [contributors](https://github.com/IdentityServer/IdentityServer4/graphs/contributors)!
