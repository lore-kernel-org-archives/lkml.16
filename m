Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AB11FAC5A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570445; cv=none; b=etM5B762Scmc/W/S45FGT0/awP12bNIfWk6qpQpRz64svncz5rLJzoIAMqzHHxnnXEluVxOAl7gUrWmav65zz9vFh14RYOpxseR7PWuEJVKED7G4TLe7aZj3N+BMTqJ1olgxEnB0UscPiibozpEg5VqDo+/OfHaEB2qipv6SreA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570445; c=relaxed/simple;
	bh=mPZJdrVcDCv2uGlGXqGH2pzUMDmCY6I5QB0RYCWCN9o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=abTAvxN/OmxDDKPOfNp2rq2s5vDUBd91f5xa8I9oDy6GNKN2U3gvPX4TlqyOmY4o1kRz/uVQugyG1a8kGAX6YXuueeabUcG/IkvuSY8GG2PMMf+x3anrWIuRh87gSxcWom+XJphffwkORCejrjg5+vteHTmPMbOyeMVZzJJPdPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3cfba354f79so96589035ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 00:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738570443; x=1739175243;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0Hl/r44rLg/e3Yn4/Yz22/j8jRDh/jhPGEQU63KpLQ=;
        b=GNsqoTyAZqh4Xo6EKabrvhemaTbPBUNj5YIcyHpuC8b1zOWqOcYgfGodAKX4IGoYK6
         berx1T8x2EzEQsDQGPcS0lbqKo/NMwaV9+jSuzqkB/QXtlOFEs+zgftnuaIaHvUR2T7a
         xZ5UIdN7L0Jbep4+3uhd4FQeppLtPDSZT0YefRe+lHFcz75SZ8ndvq80Uuocinc4THoU
         0UCGz8rTCBSf/eQQWrnLx2mvWehmR+5moBe/roa0hDPTtxIfTSZFiwEaz5aL3ZOpKNLc
         c/kKGI709rmkfHzWWbyx5uLHfbH9is4ugvffnLLOm/1XAlE9seX6hGlHBjeHO4+2K8kI
         Nz3g==
X-Forwarded-Encrypted: i=1; AJvYcCVCI0m6j6XIkGNYQoYC9QSD82H3Kjzm5g7tUIhUEqzg24zeCP7YouKI7aEPPBpz1/6UnMUv3KrmIAKqoLU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTMQ3FQowEY56VZRBSSXf6ey9pA1HS67XYbFtd99rOO+fSNY8e
	KOeXGLDdy/DrVU/b6s/kM9DkpH65NlKJsKTzTt2o2odXv3uoYGhOGCMKnHUEwk/11iAuhlg579t
	guucf3oiKYB0fl/ieG7LVssuV+2bS6U4e3hlFh3SWuPmu9MVEjqxG590=
X-Google-Smtp-Source: AGHT+IFksxVJM30WRnJS2jHkuXeNs5orgaarVFPzxhtVuS4WGL5LdGMpL3HXYP9MBW/JL4njsL27T9Kh0XUeWVmv8heCvqSCw6xM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:308d:b0:3d0:285a:56b with SMTP id
 e9e14a558f8ab-3d0285a07f1mr58083675ab.17.1738570442973; Mon, 03 Feb 2025
 00:14:02 -0800 (PST)
Date: Mon, 03 Feb 2025 00:14:02 -0800
In-Reply-To: <Z6BwO0utCjxMG6RI@linux-dev>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a07aca.050a0220.d7c5a.0083.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] KMSAN: uninit-value in longest_match_std (2)
From: syzbot <syzbot+08d8956768c96a2c52cf@syzkaller.appspotmail.com>
To: gauthamgujjula@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

no output from test machine



Warning: Permanently added '10.128.0.13' (ED25519) to the list of known hos=
ts.
2025/02/03 08:08:22 ignoring optional flag "sandboxArg"=3D"0"
2025/02/03 08:08:24 parsed 1 programs
[  208.007169][ T5774] cgroup: Unknown subsys name 'net'
[  208.124779][ T5774] cgroup: Unknown subsys name 'cpuset'
[  208.138415][ T5774] cgroup: Unknown subsys name 'rlimit'
[  224.374733][ T1279] ieee802154 phy0 wpan0: encryption failed: -22
[  224.381757][ T1279] ieee802154 phy1 wpan1: encryption failed: -22
[  252.636791][ T5774] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[  256.615109][ T5788] soft_limit_in_bytes is deprecated and will be remove=
d. Please report your usecase to linux-mm@kvack.org if you depend on this f=
unctionality.
[  259.280546][   T34] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  259.289550][   T34] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  259.306947][   T80] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  259.314983][   T80] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  285.809674][ T1279] ieee802154 phy0 wpan0: encryption failed: -22
[  285.816368][ T1279] ieee802154 phy1 wpan1: encryption failed: -22
[  347.249425][ T1279] ieee802154 phy0 wpan0: encryption failed: -22
[  347.256185][ T1279] ieee802154 phy1 wpan1: encryption failed: -22
[  408.689264][ T1279] ieee802154 phy0 wpan0: encryption failed: -22
[  408.696057][ T1279] ieee802154 phy1 wpan1: encryption failed: -22


syzkaller build log:
go env (err=3D<nil>)
GO111MODULE=3D'auto'
GOARCH=3D'amd64'
GOBIN=3D''
GOCACHE=3D'/syzkaller/.cache/go-build'
GOENV=3D'/syzkaller/.config/go/env'
GOEXE=3D''
GOEXPERIMENT=3D''
GOFLAGS=3D''
GOHOSTARCH=3D'amd64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMODCACHE=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs-2/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/usr/local/go'
GOSUMDB=3D'sum.golang.org'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/usr/local/go/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.22.7'
GCCGO=3D'gccgo'
GOAMD64=3D'v1'
AR=3D'ar'
CC=3D'gcc'
CXX=3D'g++'
CGO_ENABLED=3D'1'
GOMOD=3D'/syzkaller/jobs-2/linux/gopath/src/github.com/google/syzkaller/go.=
mod'
GOWORK=3D''
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
PKG_CONFIG=3D'pkg-config'
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build569088624=3D/tmp/go-build -gno-record-gcc=
-switches'

git status (err=3D<nil>)
HEAD detached at f3558dbf03
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' ./sys/syz-sysgen | grep -q false || go install ./sy=
s/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
go fmt ./sys/... >/dev/null
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build "-ldflags=3D-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3Df3558dbf032eab2b77c1cb11b9ce2baffe7838d3 -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20250103-110009'" "-tags=
=3Dsyz_target syz_os_linux syz_arch_amd64 " -o ./bin/linux_amd64/syz-execpr=
og github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include -fpermissive -w -DGOOS_linu=
x=3D1 -DGOARCH_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"f3558dbf032eab2b77c1cb11b9ce2baffe=
7838d3\"
/usr/bin/ld: /tmp/ccVC8SPt.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking



Tested on:

commit:         2014c95a Linux 6.14-rc1
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dfacc04d1f62a4ae=
1
dashboard link: https://syzkaller.appspot.com/bug?extid=3D08d8956768c96a2c5=
2cf
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debia=
n) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D159117645800=
00

