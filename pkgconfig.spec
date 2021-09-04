# 这是一个自动生成的rpm.spec文件，请按照注释提示修改（打包前请删除注释）

%define _name_prefix selboo
%define _name pkgconfig
%define debug_package  %{nil}

%define _binaries_in_noarch_packages_terminate_build   0
%define __os_install_post %{nil}
%define _rhel %{?dist}

Name: %{_name_prefix}-%{_name}
Version: %{_version}
Release: %{_release}%{_rhel}
Vendor: selboo
License: selboo
Group: Applications/selboo
URL: http://www.selboo.com/%{_name}
Source: https://www.pkgconfig.org/source/pkg-config-%{version}.tar.gz
BuildRoot: %{_tmppath}/%{_name}
BuildArch: x86_64

# 给rpm包改名时，新rpm包的spec文件里需要添加下面一行（声明废弃老rpm包）
# Obsoletes: old-package

%define orprefix    %{_usr}/local/%{_name_prefix}/%{_name}

Summary: %{_name_prefix}-%{_name} (RHEL AS%{_osvernum} / CentOS%{_osvernum})

Requires: rpm
Requires: perl-WWW-Curl
BuildRequires: rpm

# 如果你想要关闭rpmbuild的自动依赖检测，可以去掉下面一行的注释。
# Autoreq: 0


%description
Build from: https://www.pkgconfig.org/source/pkgconfig-%{version}.tar.gz

%prep
%setup -q -n pkg-config-%{version}

%build
./configure --prefix=%{orprefix} --with-internal-glib
make -j8
#make test

%install
mkdir -p %{buildroot}/%{orprefix}
make DESTDIR=%{buildroot} install


#%clean
#rm -rf %{buildroot}

%files
%defattr(-,root,root)
%{orprefix}

%pre
#安装前

%post
#安装后

