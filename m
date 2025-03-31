Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914C21DE892
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743434084; cv=none; b=qi84RTz9+nF5sy69oHIMrmZgZmPR1QaK/NMR13uleTx9Pm92XRkIoByUukj6kYp4ghg3MWSfJpJxChYniflPNcWilDEAPnHYFA4puSCUndu36XNcUCMJAvQGepLPPWvN05eh7G/HOzqGz/gnKUAr+NybtqC1x7Zhidlk7bJi4m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743434084; c=relaxed/simple;
	bh=oJu9nqSUACrMLpFUteGaVMI4D8ZVC8cSoHDouhBbg04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RyTpdwiZUi5qGDzf7VTZpE0vU6aD/11lmeV+eBD+9yt8KHTlp8XJ3ihoCISkMVu9rkYl4+ZwXR9qzymOFt5UUjfZ01AEgxRtjVerx3yUZgDeb6IpTuPHZ74iOj305GZacSKv/7nAw+Ith7HkBJ/EdKEnqt4XHO+nNl8EoRPGRSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRvl1yCg; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRvl1yCg"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2a089fbbdso817757166b.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743434081; x=1744038881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZLQiXv04LloKLYeZwA5zXTGimlLximWhv2V1WjRz0E=;
        b=dRvl1yCgVSa+WlH4CaocCdVupg+dEj2IgdjYLFukKWPYLQccF8jzuInSwI830TPnyQ
         AFXOjp/MTACoc+XY3j+wRfPf+yqLIUHS8dEBPvbbXiiHkYfkditdHTeirhEubyKQkpZI
         KlI2nIVYCrJIZUbrGJrcigJzvbnKLLIx5iQj5KSE6mLCODQaI+Nsa8nJNOfNZFhb6BRI
         BYZY/UhvpihFKDwcYA+O6PBbvmSi51rEb1cgoOIC++LbmHg8ISLFlYvh8IvKocplQJ9E
         4NCeyFEsOaKiliQkMSOg9rmtmQbYSuxn4EeUEk2yOhiWWKJx33pMurGjyn+APksnPdEs
         aPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743434081; x=1744038881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZLQiXv04LloKLYeZwA5zXTGimlLximWhv2V1WjRz0E=;
        b=UPhvGEA3spQALYB8xQkJO3gnSSBe4ZxrfUu32n0IJmzQbxdR2DGUdypSThtCXqJa1E
         0z1B+eTx+mQVyFsiHy6J2/kNGC/6J+VdnN0BvvNMumwaWhtZzfValu4b+9lezRYszOJu
         +44TDn6vBCtOyMosNLgbg0G7BA65CuAPMfLjt6+vyCHPZ/CH6zc4jqQV8BdX2ibcbcCB
         PlUn9s+8Ql16i1DejXPElUpvRdgS75/CmRPLiFny1jFuAgLjDVLrEWRVp041FxDzTy16
         v25RZWGgDrrXzrOSMvAxMLV68lmxkOyykVvVztcLNdbz0SVjGoMPucKPpyvbDqam2Y2/
         pEAw==
X-Forwarded-Encrypted: i=1; AJvYcCVVDkvwa+cyHxJlWvdg7PEmzRZ3oX+vk4FlDcUxzmPUgicVvsKclM5cF6wgVdYNImHInUyU9yCcD1a+xS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD9Ec2uffRkSBXk1NgK/IqvMdA5qnu6WoyDHnzHn/mkfoUVrCr
	iDYZcxLWN6EJqDtfpRj1xwzaSTl+tdz/V6qfOOBtsSnYfxF0jFO7UF84EMWQgB6/L5HOsMw1Tai
	kYuvvLGkESigH+qrrnVL1Kx7E01A=
X-Gm-Gg: ASbGnctroZfpJJAEKGSJdoo471frAsOxu3ATcKcPmjFTYcikfue5y12Wi/C3ZQDxoyI
	QpjKQiuvlxKQa7HPTrXigolMCCaAwMUCEGs/WcU+eFoJtWj4zZsnJws7ju6UHx8zF00yEXzptA1
	98r2Ae/49Qp++DpWY4C1BJLfjL7w==
X-Google-Smtp-Source: AGHT+IG7HN5G5eLR+WHUDukmwWaJ9HBxaScaLGRa3QFd1QA73ltzpMkDeTG4SY8gZeGdQw7rE0NehWEAUHS54/gh1dg=
X-Received: by 2002:a17:906:dc95:b0:ac6:d368:aa97 with SMTP id
 a640c23a62f3a-ac71ec04f75mr1330823266b.10.1743434080528; Mon, 31 Mar 2025
 08:14:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-aWPqAUOIDEzzpZ@shell.armlinux.org.uk> <tencent_F967B6C3FF5405F2D17EF660590BFD213C0A@qq.com>
 <Z-qQuyG7rDeSF_oX@shell.armlinux.org.uk> <Z-qZ_4YmTJdFWAHF@shell.armlinux.org.uk>
In-Reply-To: <Z-qZ_4YmTJdFWAHF@shell.armlinux.org.uk>
From: Maxim Uvarov <muvarov@gmail.com>
Date: Mon, 31 Mar 2025 18:14:27 +0300
X-Gm-Features: AQ5f1JoHnBWx56MjsJrGY62_xZqL_8ufM1v54G-54h7OBc-REg1rQgw-uQfiYFs
Message-ID: <CAJGZr0+zcy+28bJydUo88zpNBN-M2-qcaahr8Pxg=yfdT6RAPg@mail.gmail.com>
Subject: Re: Re: [PATCH] ARM: Fix support for CMDLINE_EXTEND
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: =?UTF-8?B?6LCi6Ie06YKmIChYSUUgWmhpYmFuZyk=?= <Yeking@red54.com>, 
	ardb@kernel.org, bjorn.andersson@sonyericsson.com, dave@vasilevsky.ca, 
	ebiggers@google.com, linus.walleij@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	liuyuntao12@huawei.com, lumag@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, nico@fluxnic.net, oskar.andero@sonyericsson.com, 
	ruanjinjie@huawei.com, victor.boivie@sonyericsson.com, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It will be good  to have some constance here with other arches:
./arch/arm/kernel/atags_parse.c:#if defined(CONFIG_CMDLINE_EXTEND)
./arch/sh/kernel/setup.c:#ifdef CONFIG_CMDLINE_EXTEND
./arch/powerpc/kernel/prom_init.c:    if
(IS_ENABLED(CONFIG_CMDLINE_EXTEND) || l <=3D 0 || p[0] =3D=3D '\0')
./arch/loongarch/kernel/setup.c:     * CONFIG_CMDLINE_EXTEND is enabled.
./arch/loongarch/kernel/setup.c:    if
(IS_ENABLED(CONFIG_CMDLINE_EXTEND) && CONFIG_CMDLINE[0]) {
./arch/riscv/kernel/pi/cmdline_early.c:    if
(IS_ENABLED(CONFIG_CMDLINE_EXTEND) ||

Or drop CONFIG_CMDLINE_EXTEND completely or make arm64 work as others.

BR,
Maxim.

=D0=BF=D0=BD, 31 =D0=BC=D0=B0=D1=80. 2025=E2=80=AF=D0=B3. =D0=B2 16:35, Rus=
sell King (Oracle) <linux@armlinux.org.uk>:
>
> On Mon, Mar 31, 2025 at 01:55:23PM +0100, Russell King (Oracle) wrote:
> > On Mon, Mar 31, 2025 at 08:29:21AM +0000, =E8=B0=A2=E8=87=B4=E9=82=A6 (=
XIE Zhibang) wrote:
> > > > Later arguments override earlier arguments. Any compiled-in command=
 line
> > > > needs to be overridable by user supplied input from the boot loader=
. The
> > > > current behaviour is correct.
> > >
> > > CMDLINE_EXTEND is for the built-in command line to "Extend bootloader=
 kernel
> > > arguments", not for the bootloader command line to extend/override bu=
ilt-in
> > > command line.
> > >
> > > Don't forget that the default empty CMDLINE already gives the bootloa=
der the
> > > ability to override everything. Not to mention that even if CMDLINE i=
s not
> > > empty, the default CMDLINE_FROM_BOOTLOADER continues to give the boot=
loader the
> > > ability to override all.
> >
> > The help text:
> >
> > +         The command-line arguments provided by the boot loader will b=
e
> > +         appended to the default kernel command string.
> >
> > so, you end up with default kernel command string _followed by_ the
> > boot loader arguments. This allows the boot loader arguments to
> > override anything that is in the default kernel command string.
> > That's why it is a _default_ - it can be overrided.
> >
> > If the boot loader command string is extended by the default kernel
> > command string, then that doesn't happen.
> >
> > CMDLINE_EXTEND is default _followed by_ boot loader.
> >
> > You're wanting it to be the other way around. That's broken.
>
> To add further weight:
>
> ARM gained support for CMDLINE_EXTEND in commit 4394c1244249 ("ARM:
> 6893/1: Allow for kernel command line concatenation") dated 4 May
> 2011. In this commit, CONFIG_CMDLINE _prefixes_ the boot loader
> supplied arguments.
>
> In commit 34b82026a507 ("fdt: fix extend of cmd line") dated 13
> April 2016, which _post_ _dates_ the introduction on ARM, and the
> commit even states that it's fixing the lack of appending compared
> to ARM, this adds code to drivers/of to _append_ CONFIG_CMDLINE
> to the FDT arguments which come from the boot loader.
>
> It is DT that implemented this wrongly.
>
> No, we are not going to change arch/arm to conform to something
> that was implemented in a broken way. drivers/of needs fixing
> to actually implement it as it was *originally* intended - and
> there is five years of arch/arm doing this *before* DT started
> to do it.
>
> If drivers/of maintainers also don't want to change, then I'm
> sorry, but you have to then put up with the fact that it got
> wrongly implemented by drivers/of and thus has a different
> behaviour there.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!



--=20
Best regards,
Maxim Uvarov
