Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8E519D06E
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 20:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738268436; cv=none; b=jYKe9/rATiCHPMXa+bUsJFaJ7irFsoj/B9p5BA+r7zqWP/jABs4LClBFQbJTKkhnSQSjx3I+NY1cm2LxcwjJp4An6YC/dlvuABQB00lXX5USDS153BhS9TjFwj0/6kqJV7OCGa6Tr/kWQh3caeYb1DJpQj+sa5uNUNLaXaVBC4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738268436; c=relaxed/simple;
	bh=SIbUKVwFJlUugci4+H5i9sWdbPUhf/EKe0j2bUNxU6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCnuPDNEg7jZoW6kHn25qzsYcndggb+dbs2M2Y3zgrqCtB7yZuNKcVWgbcTLjJu5rP7l4siv4eK+AKU+2mxbB3i138iUoPFk6pGQPJLicpWZEzaSWuvQvD4y3/XQE3OenDNtPKMExcoQe6U7fhnmkhw4zr1Sr2o2Fzg4Dv5LbFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6/97Ej4; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6/97Ej4"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21654fdd5daso21694965ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 12:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738268434; x=1738873234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClwtUPqUK9mSoT/sTkcB+DgzCNDLW9NdfFhJAOH8qy8=;
        b=G6/97Ej4fitM8NnRxmTasQ9yADLwE1Kpc5MhcsgIZkwqB+Xsnsdt2Yr95hcez/Y233
         +PJAAMYWIj41ikEEAs2s808yao5RMbCj4QDMgGfXETnEOSywoHlb8RAtZqojjVdbzFsY
         0Rp7AaaQtWgjj8tWNkD1U7l32Jxhjenw0hzSUh6yts4vqjpQogCQl9lWGqFomM6vx6WJ
         NQMUxSfZ5TWtNOdofKksvYPVX8AKBHqCXx2avGKN0O0Vf3Yhy7mCMbIIORNYDwHuQtFZ
         ZZUEqu74MBfmdkeRMVBWoyx6Tb+ZAzwvwWfGS5jgFl3CwYKvLZwpAvZOq8vstphoTJEN
         eNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738268434; x=1738873234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClwtUPqUK9mSoT/sTkcB+DgzCNDLW9NdfFhJAOH8qy8=;
        b=T8156ZW6DHfy9Yld0sj0PycTsBpcJQw87AxOhcHnmiGBB+Y2IQU8ccxb8Opzq560Qg
         1OGFwv8iEn3wxfrHfxCbVwmC5P1mKerG6d4eA9LTk53bU46v4QDdlHs1glgL9/SQT5bB
         s3FnjNBgE7Fo/0Yzk86J+eo/J7es+D4B5HFRUjc3NnPMBHq9eAr58/e+zh140I7ykjj+
         I/0GiZXLJt8bMyJ/pCmVf4jOvHBZ26miluOzF3aviZFkMy2982GT98lEL+vLSlvQSoF1
         o4x+awNlVhxbCR7Whf5Kg4CkCpVAojskxKotdPMFhBhvAi2CjtLcn7HWPIsFtueciphQ
         5Gzg==
X-Forwarded-Encrypted: i=1; AJvYcCXSFzNbLpAQBuipZQ1RKbAQfZGkxlPm1QFeZtlwVJjF2KoiQJ5tRe8DqG88L9NvQ510RgtCpvCZfpgJMJE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ijRIEsEL4evhKJV9inMzZfmO2EVMzzguYtekd86mR75lWzpE
	/S/vgunR/eZCnCuUu5D90HCl/Bk3GCnWXC3XN/2K1s8RBh855Vfu903Ac8UpvruzHxwEKQmff0S
	f+WISu5bjGd+09AzG274QsDTxIhc=
X-Gm-Gg: ASbGncvVtRqTdHZmibpJ+FzQMOcy4g7ok6RwARThas6JDN3agk20a7mITBAeRHJXjql
	FNjiVgOgQ3FGVMIFOR3HdWJs5vVIiCSNvynazrx4K6LxsEDeiWGD/Wm2jBG0+gvYxcJr+yaVR
X-Google-Smtp-Source: AGHT+IFO6MMzXBrOGKn80G2XfMMuDquQJiiKg5+z19PUqvvjVTQsOFEcthp4PY5JwLDacbszHCoPQNvHsyHTGtORZ78=
X-Received: by 2002:a05:6a21:4c11:b0:1db:f68a:d943 with SMTP id
 adf61e73a8af0-1ed7a5f8e53mr12606037637.17.1738268433490; Thu, 30 Jan 2025
 12:20:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYsHGrgZsEEVvP0XMcAhLyCYnrCPgZJ1puT6cfQBCGUB9g@mail.gmail.com>
 <20250130200112.6ba7316e@pumpkin>
In-Reply-To: <20250130200112.6ba7316e@pumpkin>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 30 Jan 2025 14:20:21 -0600
X-Gm-Features: AWEUYZns1cg1rhB0SZf6MqVVUTtFBKQq2h0TBzHzypdynHuEzFz6dZCga_Xf-eA
Message-ID: <CAHCN7xJosvgN3R6xJ0E7CB_-0gMqX_qBFPSA1q30_hQ0ftg3Qw@mail.gmail.com>
Subject: Re: linus: arm64: error: call to '__compiletime_assert_536' declared
 with attribute error: FIELD_PREP: value too large for the field
To: David Laight <david.laight.linux@gmail.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, linux-phy@lists.infradead.org, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, David Laight <david.laight@aculab.com>, 
	Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Pei Xiao <xiaopei01@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 2:01=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Thu, 30 Jan 2025 15:22:06 +0530
> Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> > The arm64 build failed with defconfig with gcc-8 toolchain failed due t=
o
> > following build warnings / errors on the mainline linux master branch.
> > But the gcc-13 builds pass.
> >
> > First seen on v6.13-9485-g72deda0abee6 on Jan. 30, 2025
> > Good:  v6.13-9338-g05dbaf8dd8bf on Jan. 29, 2025
> > Bad:  v6.13-9485-g72deda0abee6 on Jan. 30, 2025
> >
> > arm64:
> >   build:
> >     * gcc-8-i386_defconfig
> >
> > Reported-by: Linux Kernel Functional Testing
> >
> > Build log:
> > ---
> > ake --silent --keep-going --jobs=3D8
> > O=3D/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=3Darm64
> > CROSS_COMPILE=3Daarch64-linux-gnu-
> > CROSS_COMPILE_COMPAT=3Darm-linux-gnueabihf- 'CC=3Dsccache
> > aarch64-linux-gnu-gcc' 'HOSTCC=3Dsccache gcc'
> > In file included from <command-line>:
> > In function 'fsl_samsung_hdmi_phy_configure_pll_lock_det.isra.10',
> >     inlined from 'fsl_samsung_hdmi_phy_configure' at
> > drivers/phy/freescale/phy-fsl-samsung-hdmi.c:469:2:
> > include/linux/compiler_types.h:542:38: error: call to
> > '__compiletime_assert_536' declared with attribute error: FIELD_PREP:
> > value too large for the field
> ...
> > drivers/phy/freescale/phy-fsl-samsung-hdmi.c:344:9: note: in expansion
> > of macro 'FIELD_PREP'
> >   writeb(FIELD_PREP(REG12_CK_DIV_MASK, div), phy->regs + PHY_REG(12));
> >          ^~~~~~~~~~
>
> Yep...
> Broken by d567679f2b6a8
>
> Preceded by:
>         /* Find int_pllclk speed */
>         for (div =3D 0; div < 4; div++) {
>                 int_pllclk =3D pclk / (1 << div);
>                 if (int_pllclk < (50 * MHZ))
>                         break;
>         }
> with:
> #define REG12_CK_DIV_MASK       GENMASK(5, 4)
>
> The compiler has optimised (pessimised?) the code somewhat.
> If pclk is very large the loop doesn't 'break' so div =3D=3D 4.

I believe a fix was submitted:
https://patchwork.kernel.org/project/linux-phy/patch/5b9a5f765f075263498f9a=
7b62b0b1030d87b6ba.1736476210.git.xiaopei01@kylinos.cn/

It appears to be waiting for approval and/or merge.  If someone wants
to test it.  I added Pei,the author of the fix, to the CC in this
thread.

adam


adam

> It then does FIELD_PREP(GENMASK(5, 4), 4) - which is an error.
>
>         David
>
>
>
