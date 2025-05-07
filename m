Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA66FBF6
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 04:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746591894; cv=none; b=oQaq0IatBc4RQp5e3e8JKR3bV2Q14+BgGRGnjTvGaKbqBXZb+3OWDbFUEweViv1UPTmP3M4lJmb7xPCI93vJlYR145UyquInEwogkP4bE9KeRe7KJoumsBfjM8pEtTcBNXw4vZXQIK86hze08I7zTSnAWy12OwZ46e3fs/l2A04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746591894; c=relaxed/simple;
	bh=kcwpV41BC4KW8ihl8UMz+kyj/Wxk6AUGPfE92GZwFHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sm6FIrq32N+1LKvZ+w/BBPu8WYcUIYzEitPWCZen3T7DbJNIQYuewp/VFsT3SrqT+V/JumT1qJi+p8qY6pDmNVnR4bpAgfUvGoLMMjgdN/fqjhxtMbakEW1fxnoOSFR7J2OYJrvZjVCA/+mU/vNm3RwLQRBvrmlV0ZvJOelBm74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0Od9s6B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0Od9s6B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB604C4CEE9
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 04:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746591893;
	bh=kcwpV41BC4KW8ihl8UMz+kyj/Wxk6AUGPfE92GZwFHM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=L0Od9s6BxAMJ6t9plvCt3NLz5Gv/v8NbaK1Je9eWKJdht8IvSjU1gXSgH5c+AlKxO
	 yxzOYzSgDfuZajrhlbArQNRLJPqnIL+4trJ6TIA9aZv7OV3wdtAh9RC8JRCS1MT09b
	 1qRlbuUZAhcWliDcvPv95EoBQZT4FER1aSAMZC6owQXmPYlUEyN8rsHlwME06T4t3T
	 NIlnrmKHYOSZJuFWC1oRiNs/5CI8iTlhIfPbpL8lejB6B4GAvLKLE9QMZ1hZLuzcZC
	 m0sDnZejTWg7wG8WDEzasa6DgFsoa6TSsoF1VJxlpsxHrZlRv8gDobbHNHFzj9OpLO
	 xDUo/l2svR63A==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5fbcd9088a7so1108423a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 21:24:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNyxaCJ2jntCix3uTD+p5wmGR/Dy0IsUA6UNtMJcSMd6XOaX21nOQe9gsc2OLZB3bKlUj59mRSMFxyfiI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4rQhpD1N9b0L7ASwZtQX8sz6tgb8EboL1LAR2yGKSWhKTdffs
	2jdTbAGlL6OSoLEZxG22MLtag8rF8G5PY6OVj8j9clxQ427xA+/d27RGoY2at8frcQQQPkYgKiu
	20hef6HxKXh8d3n3LQlLGcr1FZbI=
X-Google-Smtp-Source: AGHT+IHs9xp6ZZFIlEX52LdyK+HCC1QbH+Imhzalre8iOTVBs48o+DUZbbjDkhFQskHdxEgTAd8W62cG5mdEbhALLak=
X-Received: by 2002:a05:6402:430b:b0:5f6:22ca:8aae with SMTP id
 4fb4d7f45d1cf-5fbe7621160mr1942455a12.2.1746591892471; Tue, 06 May 2025
 21:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430131516.24287-1-yangtiezhu@loongson.cn> <CAAhV-H4VpYVEhwnhh4s083FuNsfEhGwrYxtceFDKD_imnBBrjw@mail.gmail.com>
In-Reply-To: <CAAhV-H4VpYVEhwnhh4s083FuNsfEhGwrYxtceFDKD_imnBBrjw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 7 May 2025 12:24:30 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5yvrfd0aH=AuFwYQzFcnQAMBekO0frvwhThaPKx6p1RQ@mail.gmail.com>
X-Gm-Features: ATxdqUGzUKwc5G2b9kAUUSS2cXN8V_gP2ST8jxsM7RU_R7fUlzKBmiQfZhTnYJA
Message-ID: <CAAhV-H5yvrfd0aH=AuFwYQzFcnQAMBekO0frvwhThaPKx6p1RQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Enable some configs in loongson3_defconfig
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Wed, Apr 30, 2025 at 9:41=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Tiezhu,
>
> When I enable these options:
> CONFIG_FTRACE=3Dy
> CONFIG_FUNCTION_TRACER=3Dy
> CONFIG_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_DYNAMIC_FTRACE=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_ARGS=3Dy
> CONFIG_KPROBES=3Dy
> CONFIG_UPROBES=3Dy
> CONFIG_KPROBE_EVENTS=3Dy
> CONFIG_UPROBE_EVENTS=3Dy
>
> Then your above commands will hang (or get a SIGTRAP), which options I
> am missing?
>
> I haven't tried your patches, maybe it works, but I want to know the
> exactly needed options.
Have you investigated this? I have tried your patchset, but still get
a SIGTRAP or system hang.

I think I know why your tests "success":

sudo ./perf probe -x /usr/lib64/libcrypto.so BN_mod_mul_montgomery
sudo ./perf stat -e probe_libcrypto:BN_mod_mul_montgomery
/opt/tongsuo/bin/openssl speed sm2

In the first step you probe the OpenSSL library, and in the second
step you are running "Tongsuo".

Have you tried (both OpenSSL)

sudo ./perf probe -x /usr/lib64/libcrypto.so BN_mod_mul_montgomery
sudo ./perf stat -e probe_libcrypto:BN_mod_mul_montgomery openssl speed sm2

or (both Tongsuo)

sudo ./perf probe -x /opt/tongsuo/lib/libcrypto.so BN_mod_mul_montgomery
sudo ./perf stat -e probe_libcrypto:BN_mod_mul_montgomery
/opt/tongsuo/bin/openssl speed sm2

and still success?

I tried, and both got a SIGTRAP or system hang.


Huacai

>
> Huacai
>
>
> On Wed, Apr 30, 2025 at 9:15=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.=
cn> wrote:
> >
> > This is a small patchset based on 6.15-rc4, each patch is a
> > single logical change to better describe the problem and make
> > it easier to review.
> >
> > If the changes make sense, all of them can be squashed into one
> > single patch, I think that would be fine as well, let us see if
> > other people have concern about it.
> >
> > By the way, I received many compile-time error reports about tools,
> > most are related with configs, this is the motivation of this series.
> >
> > Additionally, I also received one run-time bug report about uprobe,
> > but it works fine on my test environment. If somebody can reproduce
> > it, please let me know, maybe I am missing something.
> >
> > 1. How to reproduce
> >
> > (1) Compile and install Tongsuo
> >
> > git clone https://github.com/Tongsuo-Project/Tongsuo.git
> > cd Tongsuo && ./config --prefix=3D/opt/tongsuo -Wl,-rpath,/opt/tongsuo/=
lib
> > make && sudo make install
> >
> > https://www.tongsuo.net/docs/compilation/source-compilation
> >
> > (2) Compile and update kernel
> >
> > Apply this series based on 6.15-rc4, then use the loongson3_defconfig,
> > CONFIG_UPROBE_EVENTS is already set.
> >
> > (3) Probe "openssl speed sm2"
> >
> > cd tools/perf && make
> > sudo ./perf probe -x /usr/lib64/libcrypto.so BN_mod_mul_montgomery
> > sudo ./perf stat -e probe_libcrypto:BN_mod_mul_montgomery /opt/tongsuo/=
bin/openssl speed sm2
> >
> > 2. My test results
> >
> > fedora@linux:~/uprobe.git/tools/perf$ sudo ./perf probe -x /usr/lib64/l=
ibcrypto.so BN_mod_mul_montgomery
> > Added new event:
> >   probe_libcrypto:BN_mod_mul_montgomery (on BN_mod_mul_montgomery in /u=
sr/lib64/libcrypto.so.3.2.2)
> >
> > You can now use it in all perf tools, such as:
> >
> >         perf record -e probe_libcrypto:BN_mod_mul_montgomery -aR sleep =
1
> >
> > fedora@linux:~/uprobe.git/tools/perf$ sudo ./perf stat -e probe_libcryp=
to:BN_mod_mul_montgomery /opt/tongsuo/bin/openssl speed sm2
> > Doing 256 bits sign CurveSM2's for 10s: 7463 256 bits CurveSM2 signs in=
 10.00s
> > Doing 256 bits verify CurveSM2's for 10s: 9681 256 bits CurveSM2 verify=
 in 9.98s
> > ...
> >                               sign    verify    sign/s verify/s
> >  256 bits SM2 (CurveSM2)   0.0013s   0.0010s    746.3    970.0
> >
> >  Performance counter stats for '/opt/tongsuo/bin/openssl speed sm2':
> >
> >                  0      probe_libcrypto:BN_mod_mul_montgomery
> >
> >       20.007539877 seconds time elapsed
> >
> >       19.990010000 seconds user
> >        0.000000000 seconds sys
> >
> > Thanks,
> > Tiezhu
> >
> > Tiezhu Yang (5):
> >   LoongArch: Clean up loongson3_defconfig
> >   LoongArch: Enable tracing infrastructure in defconfig
> >   LoongArch: Enable tracing syscalls in defconfig
> >   LoongArch: Enable debug information in defconfig
> >   LoongArch: Enable kprobe and ftrace in defconfig
> >
> >  arch/loongarch/configs/loongson3_defconfig | 74 +++++-----------------
> >  1 file changed, 16 insertions(+), 58 deletions(-)
> >
> > --
> > 2.42.0
> >
