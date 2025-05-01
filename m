Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4CF1F874F
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 01:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746063492; cv=none; b=mPZd/VkONjU6szU14w8PME5YRP2bM7CKXOkD+2LzUyahamAS2otCKN6DaR5dQm50LNXlsaReznkxtCw59tHzHjVLswtanglxDE2H3ZlI7QeHzMZ1D/qDuw+iuPXiwzwR6OcmcYM+o3bxdrc0LCHFcFpH33bFVIIHGnCvQVtkNEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746063492; c=relaxed/simple;
	bh=qswmRgxBtKtJNAvLHM4hZPfSNBEZni24oTOcHXgl2v4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BET3LjXUjo+Cr/342QlOFrCf5UtOFPew0QF8XZB0Z0yajtyTutcF4ubNeXJPRd42aK6LNz172j54xyqSBq5sixt7WtSUzyQ+vj4iaqqXBpFRpw2dq6VFA1A+AzyHeaP4FVmpN62m6yHpIZ+Oxs3aniViHZnvfejZosSUHLnZ6K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVMhv0ND; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVMhv0ND"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476977848c4so7074741cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746063489; x=1746668289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nX4dVDllopq+tS8FzjHQ5g5N61k8rKm72Q1pN8FUsr0=;
        b=DVMhv0NDKabUBPw1V5nqcdrlk+PHizZKx7Ddx/dvoJ/ptAnSKR4WquAqVoyj2EMoPc
         nPantTXX2elepNvAHABkSxC/66RyL/o0gXR54sHkS9KCWxfHXhl3coXrpKMMqF7Fs2hA
         m3OHxQlj6rXSIcC7JGSB9zQtOQFv09Frmgiso7/ms9USJZhk7hZTSeqHAaLH2NAyJJv7
         IygLnxYAhpTxO67zP2Q1BJR7e4IhpPZd1LC3durhx1l8TLXGyEvDvwvuAYsFp5zrYnDk
         7JNeWZZxZk63vx9FyDuG6rWK5QQbwXHLnWZdRnu0IID15uMi+kZs/X0otR4Isd7zlUWY
         r8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746063489; x=1746668289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nX4dVDllopq+tS8FzjHQ5g5N61k8rKm72Q1pN8FUsr0=;
        b=KVb0eETUPHxYFulhdqCi42XFC0wtD0MYHyoMD9FKs4fUzdNVdIUAQui20UorcjMw1Q
         X2Uh1hOLyJl2dI88RuDIyh9Yd0+aJHPeBw0roPX+ElSy7aId5CRDOp6cd+/hmDVu1eon
         fK2yfmmxYMTBA6uDRclCIuvkpyNVMFP/D/XQkgI3H+e7MWq8LrOvAQ/l9xrDqqH+Ivkt
         L3fkHVE4gTOP6RcLQeGqDWEX/TtKVY3TeNcE/UM0BxoqExb0zFHwDHcG/YQYCx7+cbRi
         u/qo6wuLa8uA9utsvdwWFaz1xF5eFlnU5etJyU+wyERgFekRVf1cJLUPCYxIZVFSnKgM
         T4JA==
X-Forwarded-Encrypted: i=1; AJvYcCXHVQB4MbEd1v5ZO/iwaSlAqH1Dg3BptRSbj7q+txLxD7fDU+CuGZIaOrqNPklmMm9pQPkolyBkFUViYHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL1ZqwDlfrP15dDPNvptCMajXGRfKduAlDoWWjqiLW7ty5fJJY
	37v7g7c2/KWEu10vwAa8ZXIdA00ZwdVwBjGxiXlp+e2ly2Jqu9PUOesinGJPO1BBFYVbwoE1apR
	ZVCSv40DUkeVnZRsxmuSfF3UUkTs=
X-Gm-Gg: ASbGnct+4jZwlIRCzDJNNP5ooq+SuJonNLxCvuhyBcb4ToD3l/pMMfBlB21elm9o+tc
	81rw835E0gwrGTfDIH0YCeuiRUNnnhD6JQmnsWz0ri2UiKn/BeFP432fFTiP1D52Be5p23sJeBi
	BLZ5hT2cwrY1mdIurfp5NByL+/+LmZI2JRJm5MoME55GWATvz8zP1jlA==
X-Google-Smtp-Source: AGHT+IHrCLTmNcY0FHD5WEC/WePPcdfn+RpbojiuUZCKwBlyUNvxT6k2qlNTuF2RqkP+4o2DKBbTidh6sUg7qZ3qWVQ=
X-Received: by 2002:a05:622a:1148:b0:477:5d12:aac5 with SMTP id
 d75a77b69052e-48b21a60df3mr11470771cf.35.1746063489322; Wed, 30 Apr 2025
 18:38:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430131516.24287-1-yangtiezhu@loongson.cn> <CAAhV-H4VpYVEhwnhh4s083FuNsfEhGwrYxtceFDKD_imnBBrjw@mail.gmail.com>
In-Reply-To: <CAAhV-H4VpYVEhwnhh4s083FuNsfEhGwrYxtceFDKD_imnBBrjw@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Wed, 30 Apr 2025 18:37:57 -0700
X-Gm-Features: ATxdqUFlmxlvNicj0lwYOXAq-vMhrWpp638DpK7NoOjFQFt_McQ3EnOPUchj68M
Message-ID: <CAK3+h2xQbw=4s8qRK9WDGmzDhsWC2WhqkYWuwKUXdJFwLaL2Pg@mail.gmail.com>
Subject: Re: [PATCH 0/5] Enable some configs in loongson3_defconfig
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tiezhu,

On Wed, Apr 30, 2025 at 6:41=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
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

I recommend putting all the config changes in one patch so it is
easier to review change and test, I have to look through each patch to
see what config changed.

> >
> > --
> > 2.42.0
> >
>
