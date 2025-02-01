Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF4C33E1;
	Sat,  1 Feb 2025 03:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738381359; cv=none; b=eXFWFC7+7Xrl0dV9NCT8qZFK32shiPF4kFMeoCjwFaeVHF5X1szyoMipm1jXGw2W5jeFIbQyVz/56S6a2RZXOKijlXNQpoXuwMVamlP4/oJ/+sVXuldwhCHmpscDT97YEMK6NdHO53A28WMB/qOK9loppMKuOFjP42+slUilhtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738381359; c=relaxed/simple;
	bh=+rV+UmrUYpJG4kNlKMeTfDc9h3wP1MafTeKi0Yp8HRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sidZSJdJvg4K+1ylqyBShkSFNbypgLpTCpzJRstHMNOS5Nvr53vHypsPS0I8UFt5I5oietC9jxEkY1I4USCp/x0PyjeUCqfn6oeqS4P1/eJUdfFDQVW4g94MnESVC/XdZ+NXnoLie1cmO5z2v5GodrgKI+WGAT0VGYXIvGINA4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldNPT2YF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldNPT2YF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267F2C4CEDF;
	Sat,  1 Feb 2025 03:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738381359;
	bh=+rV+UmrUYpJG4kNlKMeTfDc9h3wP1MafTeKi0Yp8HRg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ldNPT2YFPENPWqGxVza8ikixvx42cQQDy5uicIeXGs0K+r9tEUYxHCPSvTlIsWfVs
	 JmpqzOgAbROiamQZeEcG4UHtzxXlRnNJN3eyOh3C1DnuV3GnMwIxT4PHA0P/gENVSP
	 oPotjRceQ/b9spp9EPHnNKHvJW1/YiGi8xn7b9YrpoGDWYVumwnh5p78imBhCJIVfE
	 ObWuv1BQFNQp+HGGzN1Aybs7BakOs0bhSKNOyHtd8RnIif5KlHA5IdJDyWunqKCjr6
	 J2DbUAJ7TYLyg/DHzoKS0xxsME49bZmzfNr4p+NvnjLhdaKcTSbLjaCW1ztKj3PB5l
	 By04PDbdPzt6A==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-543cc81ddebso2965320e87.1;
        Fri, 31 Jan 2025 19:42:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQQlQ5pzKTF4JUYbZDCTNp1xHzkxbESkufswx3Tk6iei/RP4IM0tjIPgwrECeqFXF+I2YMQoIDkeks@vger.kernel.org, AJvYcCWtA1ob6Xpn5T42pDFSMoXtC+QKdV5iNRsyGLV8guHBHLBPydKMkvZr5vAp2ByZfbIda7HxlxP3ZByKG9KR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlq8heOmHZh39eDZZuIDcmJdm4xPb1C0DS9StePu4UQ2g2Qrup
	BbdncqoxN3NjlbXAkf/TxwTV053nw0KpiEii86r7/xhsFIgys56Zv/EJHrWXLM/BFdlrV8KhcaQ
	u/wrefKqnsGuySgM+IX+6fccIPpQ=
X-Google-Smtp-Source: AGHT+IE8xi7yEZVZiNkHiMJ1Oz93VREX7MH40nif54ifmsI5dRu/2tNLO7bSLRikmgv3pDSskmDFuatI+sQbmvZPgLU=
X-Received: by 2002:a05:6512:1383:b0:542:2192:3eb6 with SMTP id
 2adb3069b0e04-543e4c3ffc6mr3959976e87.52.1738381357745; Fri, 31 Jan 2025
 19:42:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114181359.4192564-1-masahiroy@kernel.org>
 <20250114181359.4192564-4-masahiroy@kernel.org> <CAL_JsqJyNiUF8--wz2DsngUAuSUboq8oqZRxAzqY+iBRM7rkjQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJyNiUF8--wz2DsngUAuSUboq8oqZRxAzqY+iBRM7rkjQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 1 Feb 2025 12:42:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNATCFFQFYenkY2F5HkXx_otub9ebuTHJOD_TLiqCDnYN0w@mail.gmail.com>
X-Gm-Features: AWEUYZm1-QNKCjq_U3BOQQAq_pO2Vl-X6R_qTFZTLVQDy4GjoVnyDhzeIplsKOA
Message-ID: <CAK7LNATCFFQFYenkY2F5HkXx_otub9ebuTHJOD_TLiqCDnYN0w@mail.gmail.com>
Subject: Re: [PATCH 4/4] microblaze: remove unnecessary system.dts
To: Rob Herring <robh@kernel.org>
Cc: Michal Simek <monstr@monstr.eu>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 7:25=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jan 14, 2025 at 12:15=E2=80=AFPM Masahiro Yamada <masahiroy@kerne=
l.org> wrote:
> >
> > The default image linux.bin does not contain any DTB, but a separate
> > system.dtb is compiled.
> >
> > Michal Simek clearly explained "system.dtb is really old dtb more for
> > demonstration purpose and nothing else and likely it is not working on
> > any existing board." [1]
> >
> > The system.dts is not necessary even for demonstration purposes. There
> > is no need to compile out-of-tree *.dts under arch/microblaze/boot/dts/
> > unless it is embedded into the kernel. Users can directly use dtc.
> >
> > [1]: https://lore.kernel.org/all/d2bdfbfd-3721-407f-991e-566d48392add@a=
md.com/
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  arch/microblaze/boot/dts/Makefile   |   3 +-
> >  arch/microblaze/boot/dts/system.dts | 353 ----------------------------
> >  2 files changed, 1 insertion(+), 355 deletions(-)
> >  delete mode 100644 arch/microblaze/boot/dts/system.dts
> >
> > diff --git a/arch/microblaze/boot/dts/Makefile b/arch/microblaze/boot/d=
ts/Makefile
> > index 932dc7550a1b..fa0a6c0854ca 100644
> > --- a/arch/microblaze/boot/dts/Makefile
> > +++ b/arch/microblaze/boot/dts/Makefile
> > @@ -1,8 +1,6 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  #
> >
> > -dtb-y :=3D system.dtb
> > -
> >  ifneq ($(DTB),)
> >  obj-y +=3D linked_dtb.o
> >
> > @@ -11,6 +9,7 @@ $(obj)/linked_dtb.o: $(obj)/system.dtb
> >
> >  # Generate system.dtb from $(DTB).dtb
> >  ifneq ($(DTB),system)
>
> Can't this be dropped as setting DTB=3Dsystem.dtb should work if there's
> not an in-tree system.dts anymore.

I believe this ifneq is necessary, just in case
a user adds system.dtb to arch/microblaze/boot/dts/.

'system.dtb' is a special name because
arch/microblaze/boot/dts/linked_dtb.S wraps it.

So, $(DTB) is copied to system.dtb, and then
it is wrapped by linked_dtb.S.

If $(DTB) is already 'system',
we cannot copy system.dtb to itself.


See the definition of cmd_copy in scripts/Makefile.lib

cmd_copy =3D cat $< > $@


"cat system.dtb > system.dtb"
would create an empty system.dtb






>
> > +targets +=3D system.dtb
> >  $(obj)/system.dtb: $(obj)/$(DTB).dtb FORCE
> >         $(call if_changed,copy)
> >  endif



--=20
Best Regards
Masahiro Yamada
