Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778B86ADD
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 06:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748844976; cv=none; b=MXQ+dInkppAnASLtZmIOex/4jK8okZtIVJiZcLnEFBu1eOoJQzsggHC5uNp7EADx4/sVvM0wQ7e3GRytnz11GIP3lk5TQ683BHqJjPabjpvjqnwTstwugFbdcMLUn0i/Qbrc65VmwtlO007phu7hOk+WYJlC9mhHl0y50xenksY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748844976; c=relaxed/simple;
	bh=FQm3i5fnr8FfnwJ1MJZ34CB/0ROk4/mP7E//KPV+hdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pY8lPzMSk/pEmvQ4abifnDKmOsrC4//CeqyrWgxsFlilMvF61YggNIPOiI7Wt27c+n70soGaUSuj6nsZnXe5fdB6PxN2Vuk73T/AVPKfoX60gauslPyMIbLmci6DrRPrGaPgYwukAj8aS0DXTPUPHUDAV+YH3abj/m7jAixqwbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DBkgBfp5; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DBkgBfp5"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-311ea13388fso684680a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 23:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748844974; x=1749449774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kg+fzmBmJzpfowpLETdoRjYjZL+2Q+5MM7s/tg0DnuI=;
        b=DBkgBfp5RA+SOWPQCIhEcAHmQwgtnzi24tp9F/b0x01J7RKhcYJX4Y4s/kZAGgUNGS
         O8iMIKGPJREuSmYVjzSwnnczPgPmpSEn+qfCjV95jerlxwwrlHwsii7iBkHnaYVrkEmZ
         XtOf50t4hObCs1ycTy1PDZryRIXucQ8xaZLgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748844974; x=1749449774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kg+fzmBmJzpfowpLETdoRjYjZL+2Q+5MM7s/tg0DnuI=;
        b=uBlVVtkY7Je21RUQXl6tUDUDjhEE6JuT2gyVxyV50SRYZeYEaH3EQKqoQthokZtpiO
         vIleiRg5+x7kxUxLNYLWwSL8tLepqQyRJtzO7cm+yLXjwLZsr2AC7/HSiovHNri/niHq
         bhu9X62E6tA50mxd+vbKveObplBWHFeXDJ+DvFhGDKfpR4S+pFRrboMVBdaUAOaGzUld
         SSNl6uDsyIdh14iUDonbfuz9Knvfr/7M0jT6ZshixjFgP5TmBArx5ZRxohI6ziiqVV0Q
         JfBXVbMoAp16S1/tE7RhW3vUhegP91kRNIiGyROf9U7gWed5+qgsn3VFPcZIPsMK9S1t
         d2GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO+wuDKdexLQ+cEt5qfrqZl8jD2Qhqoj6m03aUlKaCYxPK6au2TtlF/WOAXH/h6lYu/7ybA5lsdmtXFFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyvmMD1D5MTlN3woXeud00lftY6ZGcza9rGGnzFDkAo+Jf9ucM
	8+U0BOg3lfKV772mjMIlf9XbOuLUBP/Dp/erl5hw2cVf7QSfYmWYirF7QuFWyTpG0uYWG6KtpRc
	RSjqQCYbkU8F4ciERz8vgHJ6tqHMCfr9HT7GD+10+
X-Gm-Gg: ASbGncv3Zt2onyBAmd7K6/avJZQYw+1N1ql+suElZSY3Zh8DT/UEl8TLi2QuwdUG/nZ
	Ub2KRf6XS/HfoDOAyN2kxtYtifFcsKrCx1xHZfAZFthCDbhimRdEUvcRjF24TJN66yLcVkSkOpY
	uzSxeTOwJ1/UTNpviLcXvFpSuTNE18TS/Yx32e6psXaSO9
X-Google-Smtp-Source: AGHT+IFMlfQUD7moOpfg4aT4yDgNNHn2G/ju7GUIqlBaYZ8TuXzg41PK7q+ydNibjtimH5jvesqqedaYEBQfto0+oXM=
X-Received: by 2002:a17:90b:384e:b0:312:639:a06d with SMTP id
 98e67ed59e1d1-3124db30c05mr6707357a91.5.1748844973604; Sun, 01 Jun 2025
 23:16:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530034713.4165309-1-dregan@broadcom.com> <CAOiHx=nzNZiOiBKUVqpTA5S8uY+ZNdPpLpEQGGDN9jP2-4Lj8Q@mail.gmail.com>
In-Reply-To: <CAOiHx=nzNZiOiBKUVqpTA5S8uY+ZNdPpLpEQGGDN9jP2-4Lj8Q@mail.gmail.com>
From: David Regan <dregan@broadcom.com>
Date: Sun, 1 Jun 2025 23:16:01 -0700
X-Gm-Features: AX0GCFuVyL7dDgRdoT4ePcHrZD_g_s6cPa8iqimsPGxMvpcaZjE13ahnxTwc0SY
Message-ID: <CAA_RMS5xf7fmMWp_a0Jy_4Sd365gH=MBjS6bi4o7ocx43M61rA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: brcmnand: fix mtd corrected bits stat
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: David Regan <dregan@broadcom.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Dan Beygelman <dan.beygelman@broadcom.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	=?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	rafal@milecki.pl, computersforpeace@gmail.com, frieder.schrempf@kontron.de, 
	Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, 
	Boris Brezillon <bbrezillon@kernel.org>, kdasu.kdev@gmail.com, 
	JaimeLiao <jaimeliao.tw@gmail.com>, Adam Borowski <kilobyte@angband.pl>, dgcbueu@gmail.com, 
	dregan@mail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonas,

On Fri, May 30, 2025 at 1:27=E2=80=AFAM Jonas Gorski <jonas.gorski@gmail.co=
m> wrote:
>
> Hi,
>
> On Fri, May 30, 2025 at 5:48=E2=80=AFAM David Regan <dregan@broadcom.com>=
 wrote:
> >
> > Currently we attempt to get the amount of flipped bits from a hardware
> > location which is reset on every subpage. Instead obtain total flipped
> > bits stat from hardware accumulator. In addition identify the correct
> > maximum subpage corrected bits.
> >
> > Signed-off-by: David Regan <dregan@broadcom.com>
> > Reviewed-by: William Zhang <william.zhang@broadcom.com>
> > Reviewed-by: Kamal Dasu <kamal.dasu@broadcom.com>
> > ---
> >  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 48 ++++++++++++++++++------
> >  1 file changed, 37 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nan=
d/raw/brcmnand/brcmnand.c
> > index 62bdda3be92f..43ab4aedda55 100644
> > --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> > +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> > @@ -361,6 +361,7 @@ enum brcmnand_reg {
> >         BRCMNAND_CORR_COUNT,
> >         BRCMNAND_CORR_EXT_ADDR,
> >         BRCMNAND_CORR_ADDR,
> > +       BRCMNAND_READ_ERROR_COUNT,
> >         BRCMNAND_UNCORR_EXT_ADDR,
> >         BRCMNAND_UNCORR_ADDR,
> >         BRCMNAND_SEMAPHORE,
> > @@ -389,6 +390,7 @@ static const u16 brcmnand_regs_v21[] =3D {
> >         [BRCMNAND_CORR_THRESHOLD_EXT]   =3D     0,
> >         [BRCMNAND_UNCORR_COUNT]         =3D     0,
> >         [BRCMNAND_CORR_COUNT]           =3D     0,
> > +       [BRCMNAND_READ_ERROR_COUNT]     =3D     0,
> >         [BRCMNAND_CORR_EXT_ADDR]        =3D  0x60,
> >         [BRCMNAND_CORR_ADDR]            =3D  0x64,
> >         [BRCMNAND_UNCORR_EXT_ADDR]      =3D  0x68,
> > @@ -419,6 +421,7 @@ static const u16 brcmnand_regs_v33[] =3D {
> >         [BRCMNAND_CORR_THRESHOLD_EXT]   =3D     0,
> >         [BRCMNAND_UNCORR_COUNT]         =3D     0,
> >         [BRCMNAND_CORR_COUNT]           =3D     0,
> > +       [BRCMNAND_READ_ERROR_COUNT]     =3D     0,
> >         [BRCMNAND_CORR_EXT_ADDR]        =3D  0x70,
> >         [BRCMNAND_CORR_ADDR]            =3D  0x74,
> >         [BRCMNAND_UNCORR_EXT_ADDR]      =3D  0x78,
> > @@ -449,6 +452,7 @@ static const u16 brcmnand_regs_v50[] =3D {
> >         [BRCMNAND_CORR_THRESHOLD_EXT]   =3D     0,
> >         [BRCMNAND_UNCORR_COUNT]         =3D     0,
> >         [BRCMNAND_CORR_COUNT]           =3D     0,
> > +       [BRCMNAND_READ_ERROR_COUNT]     =3D     0,
>
> I see this register in BCM63268's NAND controller at 0x80, which is a
> v4.x one, so I'm surprised v5.0 doesn't have it. Or does it not work
> there? I don't know if v3.3 also has it or if using this on v4.x would
> require a separate brcmnand_regs entry.

Thank you for pointing this out, I did just verify the register at offset
0x80 does appear to work correctly on my 63268. I'll put some update
in the next patch revision to reflect this.

>
> Can't really comment on the remaining changes.
>
> Regards,
> Jonas

-Dave
