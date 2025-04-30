Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048EC25A630
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746020498; cv=none; b=b63l5VRs6DAlfjP5QQIi84xhGRAMlhrMrnU0XIdN0sx/2jeycFCgCDWY9e6WLIEIxUPYRgdK8m9LIkYCxhjYH2rbTnPzluuL2DR27Cdug1otFQDl7BpR+UfLAvgdp5HXqLsZD9rBLFQyLcF86WW9R8IgY3WtkYupwQMShNcipQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746020498; c=relaxed/simple;
	bh=QGB2XMZ3b98RyBr6jLE2vhZLG4Sa8QcjzCO41p/5Y4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pd6fYPqgojBdoADx/dbVRP5meP/eOPXrjnyOwRzSMFzvztatsB6hGDteDkCZuUTUK7rsAkkKdjztAL0strAdzGcuO0NEpTbAzZtMcoghgc1jKRMH/QJfxZ1dk4VWydBPHjc7sKcaqSV4W7IqqtacwiYvK0Ur/VZb5Sw092abogM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHRuArQ5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHRuArQ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E162C4CEEC
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746020497;
	bh=QGB2XMZ3b98RyBr6jLE2vhZLG4Sa8QcjzCO41p/5Y4I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AHRuArQ5T5BE3rRZJhwhD/cPLidIj1TxMbH7D5/vjJBepTdkGvJYoB7/lCVwd1kIr
	 owUAQgMp7M9px6qpkgyIwbLwbi/vviOnrDF/oKyxYsX2W/fHMKOtNDEsWG1qL19kmS
	 fxYjjv4ESfjxPr01BsbYR+4ZF9g3iQs70vsZpxWKymTbyNWNNeXGMxj4tjoSZjawKb
	 zM4bQcTXKQBrYWNmtuBJcW5mQJssyUPgce+iZxOtSxmPNghDNyBSBszHYNuG3l9XU5
	 TaRM0vWnhmWkyRno52COd/9LaydXBKqdr5Ut+qPfG7y74RowB2RHkM/Caxc5MCErhg
	 PjTj1euHE5JBg==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acbb48bad09so31616066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:41:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDYRhZeQV08MXbLc6utJbhEFemNc2XU0sXbdHKP7oo5Wc4lbgrFCUBtK72A/h9W3X9mnGWNn3E8DFcsBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGf3ACFt/vX5q23xWD3LjCk4UcP1zztN1na+ZIXA2lESCRXmVk
	mB7+C4oCIy0MNFplJPtWYhcoVktvmvWwMmr0lIbsU78YUz3c/B2xZ+Pr3rCov2lT4RmX+5Z++Ei
	gKYzwOyc5TfBcwqsQtD3o/hCjh1w=
X-Google-Smtp-Source: AGHT+IHXUpfOm//QDSYq47hzNiCnbmw36W2KgA2g2eqr94IRM8uWxxPujN7KVzb5HO3fwsM3UXw+m62Dddzlz4IebzE=
X-Received: by 2002:a17:907:3dac:b0:ac1:f5a4:6da5 with SMTP id
 a640c23a62f3a-acee24b45a6mr243504666b.37.1746020496119; Wed, 30 Apr 2025
 06:41:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430131516.24287-1-yangtiezhu@loongson.cn>
In-Reply-To: <20250430131516.24287-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 30 Apr 2025 21:41:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4VpYVEhwnhh4s083FuNsfEhGwrYxtceFDKD_imnBBrjw@mail.gmail.com>
X-Gm-Features: ATxdqUGbaEYKmGnm9DyQj8rMCXaC6pz5JAVISdlfNXN9k8Z8IHGlk_nwdRPQh3M
Message-ID: <CAAhV-H4VpYVEhwnhh4s083FuNsfEhGwrYxtceFDKD_imnBBrjw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Enable some configs in loongson3_defconfig
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

When I enable these options:
CONFIG_FTRACE=3Dy
CONFIG_FUNCTION_TRACER=3Dy
CONFIG_FUNCTION_GRAPH_TRACER=3Dy
CONFIG_DYNAMIC_FTRACE=3Dy
CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
CONFIG_DYNAMIC_FTRACE_WITH_ARGS=3Dy
CONFIG_KPROBES=3Dy
CONFIG_UPROBES=3Dy
CONFIG_KPROBE_EVENTS=3Dy
CONFIG_UPROBE_EVENTS=3Dy

Then your above commands will hang (or get a SIGTRAP), which options I
am missing?

I haven't tried your patches, maybe it works, but I want to know the
exactly needed options.

Huacai


On Wed, Apr 30, 2025 at 9:15=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> This is a small patchset based on 6.15-rc4, each patch is a
> single logical change to better describe the problem and make
> it easier to review.
>
> If the changes make sense, all of them can be squashed into one
> single patch, I think that would be fine as well, let us see if
> other people have concern about it.
>
> By the way, I received many compile-time error reports about tools,
> most are related with configs, this is the motivation of this series.
>
> Additionally, I also received one run-time bug report about uprobe,
> but it works fine on my test environment. If somebody can reproduce
> it, please let me know, maybe I am missing something.
>
> 1. How to reproduce
>
> (1) Compile and install Tongsuo
>
> git clone https://github.com/Tongsuo-Project/Tongsuo.git
> cd Tongsuo && ./config --prefix=3D/opt/tongsuo -Wl,-rpath,/opt/tongsuo/li=
b
> make && sudo make install
>
> https://www.tongsuo.net/docs/compilation/source-compilation
>
> (2) Compile and update kernel
>
> Apply this series based on 6.15-rc4, then use the loongson3_defconfig,
> CONFIG_UPROBE_EVENTS is already set.
>
> (3) Probe "openssl speed sm2"
>
> cd tools/perf && make
> sudo ./perf probe -x /usr/lib64/libcrypto.so BN_mod_mul_montgomery
> sudo ./perf stat -e probe_libcrypto:BN_mod_mul_montgomery /opt/tongsuo/bi=
n/openssl speed sm2
>
> 2. My test results
>
> fedora@linux:~/uprobe.git/tools/perf$ sudo ./perf probe -x /usr/lib64/lib=
crypto.so BN_mod_mul_montgomery
> Added new event:
>   probe_libcrypto:BN_mod_mul_montgomery (on BN_mod_mul_montgomery in /usr=
/lib64/libcrypto.so.3.2.2)
>
> You can now use it in all perf tools, such as:
>
>         perf record -e probe_libcrypto:BN_mod_mul_montgomery -aR sleep 1
>
> fedora@linux:~/uprobe.git/tools/perf$ sudo ./perf stat -e probe_libcrypto=
:BN_mod_mul_montgomery /opt/tongsuo/bin/openssl speed sm2
> Doing 256 bits sign CurveSM2's for 10s: 7463 256 bits CurveSM2 signs in 1=
0.00s
> Doing 256 bits verify CurveSM2's for 10s: 9681 256 bits CurveSM2 verify i=
n 9.98s
> ...
>                               sign    verify    sign/s verify/s
>  256 bits SM2 (CurveSM2)   0.0013s   0.0010s    746.3    970.0
>
>  Performance counter stats for '/opt/tongsuo/bin/openssl speed sm2':
>
>                  0      probe_libcrypto:BN_mod_mul_montgomery
>
>       20.007539877 seconds time elapsed
>
>       19.990010000 seconds user
>        0.000000000 seconds sys
>
> Thanks,
> Tiezhu
>
> Tiezhu Yang (5):
>   LoongArch: Clean up loongson3_defconfig
>   LoongArch: Enable tracing infrastructure in defconfig
>   LoongArch: Enable tracing syscalls in defconfig
>   LoongArch: Enable debug information in defconfig
>   LoongArch: Enable kprobe and ftrace in defconfig
>
>  arch/loongarch/configs/loongson3_defconfig | 74 +++++-----------------
>  1 file changed, 16 insertions(+), 58 deletions(-)
>
> --
> 2.42.0
>
