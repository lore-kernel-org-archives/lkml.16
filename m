Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAF7322A
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 03:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746069602; cv=none; b=r406dulemYfxG6Vqc1kxz1/o5GeYV8mzdGvVjSXzXkI6xjStUdQ4TeSKG8Y1dYgoPEwgvGKMHsN1dqCtO2OCGkVfB7RbRjk5N9wpM1KgPkkkQNle5cn2f2S+SxQbWPRYqrIDmHRvj3KNezBowBWNXkOBZPdFULMO8MMXaQOf2a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746069602; c=relaxed/simple;
	bh=rNZdiJjKxu84kSTnNRG+40N/y18b49cbWcQi5Jqh2cY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KC0qn0dBxM9Nq/3fJt84GWyr8nrjdMm2PmWaiFmgkWcwYhZwpvThX4Y04dlijuf/aNmG24qB7GSzGxBu28ATE4nAOUtk+P7WpmcGX+qvSAbXkxw21oclSeB2FE+VwD0bEsx2v5nYEzij3u1kbFXRsEOFVmLf8RnnshYfJJqbgnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jr23s1vv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jr23s1vv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61176C4CEEE
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 03:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746069602;
	bh=rNZdiJjKxu84kSTnNRG+40N/y18b49cbWcQi5Jqh2cY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jr23s1vvkPRLCDizbc/ovUZQ309MVDdNSx/TOwKB6I/r1CWL2CUXRC/h9jDuxTFxx
	 fai0cYvd3haAcdNYm4n4mv/4Ej703a5Ovnb5JUbenJy5JaHz/FU9Q2H63MS9VgMo+s
	 BjqgRxGYbweoZbvC/yuZF/dod4pBDtRWHN5zBojXkfRD2nmZBzv7z6+wZc3vCL1Bjk
	 iPZ7+zlkbxeFf24bD++LXhEQ/tUw41LhS6bqIzCJk6NYcoT0PRl398010B4s7sviGY
	 ALrBVQu3ld9h8V3hSP/mm1h2VBAzMgPedVgFfqxMD1Mr03oLJ0LU6XAgYz0MvXvobg
	 Q7ANbddqURqnQ==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso3032253a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 20:20:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVa7mJNxBKXczHfd/v3pBaU4S5lw9iKaA9tkVUAljMqHOOSoRZuyn3K3XIcQ2/iFIxF70lJpUyOmrJwsik=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUyoO5SRKEtrBaIoXlNSB5890evrbz/R64RcryxmXvQTOoyDUB
	9yKrQWId3yEhnDU7zktvgSct4gyG2LvS/ZWHFEkckF/7d5IFB/BjpCn8eKJmLLt6APymGoZzqce
	SEZML9UjgvTc0/1/oEA7MxOfJQAY=
X-Google-Smtp-Source: AGHT+IEbIuXTioJc9AKI2HGu8HCXXj65872Ny6SvDbzCaRnxnK4JjETLTLYJ6jhqyCVXoW1C77G0g8eHSTYHyadllRI=
X-Received: by 2002:a05:6402:5216:b0:5f6:22ca:8aae with SMTP id
 4fb4d7f45d1cf-5f919836912mr690952a12.2.1746069600974; Wed, 30 Apr 2025
 20:20:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430131516.24287-1-yangtiezhu@loongson.cn>
 <CAAhV-H4VpYVEhwnhh4s083FuNsfEhGwrYxtceFDKD_imnBBrjw@mail.gmail.com> <CAK3+h2xQbw=4s8qRK9WDGmzDhsWC2WhqkYWuwKUXdJFwLaL2Pg@mail.gmail.com>
In-Reply-To: <CAK3+h2xQbw=4s8qRK9WDGmzDhsWC2WhqkYWuwKUXdJFwLaL2Pg@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 1 May 2025 11:19:49 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5V8YFK59KOTUqsoEq_JYgdZRiazggoGZO5gTG7oJN8Uw@mail.gmail.com>
X-Gm-Features: ATxdqUGJW4t7VFCABxkJD2b-FGOjkjojqrk3V44BX6A4Zy-owiuDIT2yHdlMgk0
Message-ID: <CAAhV-H5V8YFK59KOTUqsoEq_JYgdZRiazggoGZO5gTG7oJN8Uw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Enable some configs in loongson3_defconfig
To: Vincent Li <vincent.mc.li@gmail.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Vincent,

On Thu, May 1, 2025 at 9:38=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.com>=
 wrote:
>
> Hi Tiezhu,
>
> On Wed, Apr 30, 2025 at 6:41=E2=80=AFAM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > Hi, Tiezhu,
> >
> > When I enable these options:
> > CONFIG_FTRACE=3Dy
> > CONFIG_FUNCTION_TRACER=3Dy
> > CONFIG_FUNCTION_GRAPH_TRACER=3Dy
> > CONFIG_DYNAMIC_FTRACE=3Dy
> > CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> > CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> > CONFIG_DYNAMIC_FTRACE_WITH_ARGS=3Dy
> > CONFIG_KPROBES=3Dy
> > CONFIG_UPROBES=3Dy
> > CONFIG_KPROBE_EVENTS=3Dy
> > CONFIG_UPROBE_EVENTS=3Dy
> >
> > Then your above commands will hang (or get a SIGTRAP), which options I
> > am missing?
> >
> > I haven't tried your patches, maybe it works, but I want to know the
> > exactly needed options.
> >
> > Huacai
> >
> >
> > On Wed, Apr 30, 2025 at 9:15=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> > >
> > > This is a small patchset based on 6.15-rc4, each patch is a
> > > single logical change to better describe the problem and make
> > > it easier to review.
> > >
> > > If the changes make sense, all of them can be squashed into one
> > > single patch, I think that would be fine as well, let us see if
> > > other people have concern about it.
> > >
> > > By the way, I received many compile-time error reports about tools,
> > > most are related with configs, this is the motivation of this series.
> > >
> > > Additionally, I also received one run-time bug report about uprobe,
> > > but it works fine on my test environment. If somebody can reproduce
> > > it, please let me know, maybe I am missing something.
> > >
> > > 1. How to reproduce
> > >
> > > (1) Compile and install Tongsuo
> > >
> > > git clone https://github.com/Tongsuo-Project/Tongsuo.git
> > > cd Tongsuo && ./config --prefix=3D/opt/tongsuo -Wl,-rpath,/opt/tongsu=
o/lib
> > > make && sudo make install
> > >
> > > https://www.tongsuo.net/docs/compilation/source-compilation
> > >
> > > (2) Compile and update kernel
> > >
> > > Apply this series based on 6.15-rc4, then use the loongson3_defconfig=
,
> > > CONFIG_UPROBE_EVENTS is already set.
> > >
> > > (3) Probe "openssl speed sm2"
> > >
> > > cd tools/perf && make
> > > sudo ./perf probe -x /usr/lib64/libcrypto.so BN_mod_mul_montgomery
> > > sudo ./perf stat -e probe_libcrypto:BN_mod_mul_montgomery /opt/tongsu=
o/bin/openssl speed sm2
> > >
> > > 2. My test results
> > >
> > > fedora@linux:~/uprobe.git/tools/perf$ sudo ./perf probe -x /usr/lib64=
/libcrypto.so BN_mod_mul_montgomery
> > > Added new event:
> > >   probe_libcrypto:BN_mod_mul_montgomery (on BN_mod_mul_montgomery in =
/usr/lib64/libcrypto.so.3.2.2)
> > >
> > > You can now use it in all perf tools, such as:
> > >
> > >         perf record -e probe_libcrypto:BN_mod_mul_montgomery -aR slee=
p 1
> > >
> > > fedora@linux:~/uprobe.git/tools/perf$ sudo ./perf stat -e probe_libcr=
ypto:BN_mod_mul_montgomery /opt/tongsuo/bin/openssl speed sm2
> > > Doing 256 bits sign CurveSM2's for 10s: 7463 256 bits CurveSM2 signs =
in 10.00s
> > > Doing 256 bits verify CurveSM2's for 10s: 9681 256 bits CurveSM2 veri=
fy in 9.98s
> > > ...
> > >                               sign    verify    sign/s verify/s
> > >  256 bits SM2 (CurveSM2)   0.0013s   0.0010s    746.3    970.0
> > >
> > >  Performance counter stats for '/opt/tongsuo/bin/openssl speed sm2':
> > >
> > >                  0      probe_libcrypto:BN_mod_mul_montgomery
> > >
> > >       20.007539877 seconds time elapsed
> > >
> > >       19.990010000 seconds user
> > >        0.000000000 seconds sys
> > >
> > > Thanks,
> > > Tiezhu
> > >
> > > Tiezhu Yang (5):
> > >   LoongArch: Clean up loongson3_defconfig
> > >   LoongArch: Enable tracing infrastructure in defconfig
> > >   LoongArch: Enable tracing syscalls in defconfig
> > >   LoongArch: Enable debug information in defconfig
> > >   LoongArch: Enable kprobe and ftrace in defconfig
> > >
> > >  arch/loongarch/configs/loongson3_defconfig | 74 +++++---------------=
--
> > >  1 file changed, 16 insertions(+), 58 deletions(-)
>
> I recommend putting all the config changes in one patch so it is
> easier to review change and test, I have to look through each patch to
> see what config changed.
This series is probably a RFC and I will not apply.
1) The motivation of this series is to solve an uprobes hang issue,
but as I mentioned above I still don't know why it hangs. Maybe due to
config options but I'm not sure.
2) Don't mix the kernel defconfig and distribution config. A
distribution config tries to enable as many features as possible, and
different distributions have different preferences. The kernel
defconfig is probably a bootable config, plus some widely used
features. Take x86 as an example, it doesn't even enable NUMA
Balancing, THP and BPF which are already widely used in morden
systems, let alone a large set of tracers.
3) About the cleanup, as I explained before (but not in this thread),
though CONFIG_LOONGARCH, CONFIG_64BIT, CONFIG_MACH_LOONGSON64,
CONFIG_PAGE_SIZE_16KB=3Dy, CONFIG_HZ_250=3Dy, CONFIG_DMI=3Dy, CONFIG_EFI=3D=
y,
CONFIG_SMP=3Dy, CONFIG_ACPI=3Dy and some other similar options are
implicitly selected so they will disappear during "make
savedefconfig". I still want to keep them in the defconfig, just
because I hope we can easily know what is fundamentally needed by
LoongArch via reading the defconfig file.

Huacai

>
> > >
> > > --
> > > 2.42.0
> > >
> >
