Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564FD2594;
	Tue, 29 Apr 2025 15:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745940435; cv=none; b=BpIrhvA8jjIpLVVWHR0IMz7XJggVqpyVd56LsWwrwnPyBkF7zSKGELV6CqV3DbSpNUbRCeD1twNsJvj1fCWPFAQpOZbw1gczXfynzyec6G7JI3krwV42nTPZy6FUdyGZLTJHm5WxKO6yrpExC/E1IflsDPDLJ4aJX6y7x/gUUWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745940435; c=relaxed/simple;
	bh=GjdVk+rdncADmZBEZkeDM/YGTxp1UuQCxZ9Eo6oPEZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IHHWf+D3Ns65712F1f79d9/J39x+qYM2fVfaRUt4XJ5lCx3PqvqHlLUldq79Bxsr4Gp6XOAMJ8d73xxGamMs7SlRioU1Yx/8bJG2i7AagPBidGLF48peMxTI30wjy3X2Yb8Nx9d6e6BryQGcATeN6y2vCONF/8+C1ci4OS7rPGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4caUiNN; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4caUiNN"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f4ca707e31so10330437a12.2;
        Tue, 29 Apr 2025 08:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745940432; x=1746545232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vc3WSfpQvNDEgBDU00QUHdbslsZjLasvip3IA6Eo2q8=;
        b=c4caUiNNAl4lzqODTPiC9pz/0rs+kpz/N0O2YVitY2+cERB16Us3w3ImSoCZBtTjVx
         YwF/j2z286hvo3FiTCqOC0OGssv8BCeR28IETAM6Nsb4c4Mpe3VZw0fImV1VRbbJ1BO2
         oydYFbvSXxaOgBOSLBezbg0Kxm601xpbE5TBk+zEIsCunHl2PlzCUSaye5U8i5vOw9YG
         qixglQBI10oa9Hl7yrY35P25y8cjc74sapVCn2eHBCiGtWNtSqSzl6n/6G+68Vti4v5j
         tXu9n+Th5lGfgtnG6EdKWQnZDC/FoKOVZt51mfXB3HZF9LYw+MAci3URITHK39tFN85P
         k44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745940432; x=1746545232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vc3WSfpQvNDEgBDU00QUHdbslsZjLasvip3IA6Eo2q8=;
        b=syUKDvUz55Rgr92Mb/JdWmsbqoT9wGFQAA2NZLxwGWLnyQJVYRqBIipN+R7TxvlSpk
         FgqEpASWuIfLuQhO6JI1WPgpJ3WjRVE7KlKW6nqjXTbTHUDTCulgeqTL2LqsdWejescL
         Q8sA6hOOkV2r54rw6ptm5GQxBuK2CqkDNRpJt+qZw76bWWPEfPaJub3Nx9/2qs9d6Jug
         Xk73ZaXsXKuhjukxXpCQk6IuGtM1/p/loABHg6mMI4MqM2XDI7WDJsE2gFwQu1f0qyCV
         DZGUZodnEeApH7HKagK3nsr1Ir7wnXA+6JPyGhloAntVUaozVaGOrlGGwbpKaTHeYP+G
         3wKw==
X-Forwarded-Encrypted: i=1; AJvYcCWsWkQjohF12CJiKCX1EfxdXJRALiwoDfUyLOSx7azM5XTJDRNTTxJv12JXJKQVDsSZJohNjrhRkJYu@vger.kernel.org, AJvYcCXmO5LIwWVlLuHm2jE+UWn9KdUgQhJfY4nKcUEX7xdC76UxCiUOVfpFeMefc3p1K9NAIKQiekJ/ki2WQAeN@vger.kernel.org
X-Gm-Message-State: AOJu0YyLGeOfzJN6uMJZs+g/tM9SctwQJ3a6FR++3rlw3fpbzvbXU+dR
	0MrYyQ1qPbAFc/Vl2ax0iFtDZ9aNmR468FwcYk1B1ZXhvk7rcS0y
X-Gm-Gg: ASbGncs8DGTYPvLVTvioeh9U5gm+01nQqfWal+jLmgWPTMC/aWKvCe6hjKSNnc8k/wJ
	FXVFQqoMbpFL6KCPrCMeZAzDQwnMZZcbVThejrLhOr9CmgMFG/TigSruvqHhOgHpe5sYI6mef2o
	lAzUuyKTlT2vB0uP5X3f8W7YKKToPmQ+P2zG0T3BYRK/OcctAoYjvqB3MF8C6wHNetmWN+USllS
	ZOd80WKIgc0OE/kZr9/UIHf/HH8tjsmSYmwUGaU9GHZU1jsaWCENvJrdltadbn0Oix3TCQpQcqL
	JvnxxKeecAWnNxUx/1HnnnZNxh77BPT6rVU5OOccIBT5t/JZjcrW5FvTaW/tZlzyg5gTipBcogn
	rtQpeTnePAEBuTWSr
X-Google-Smtp-Source: AGHT+IGsJ57Of2nb457tr3CBW6uYeC7DETfVfedFrbH1sj9I4XHUkmt+rUOCY3dZmn0H2Z0tPv7kog==
X-Received: by 2002:a05:6402:5192:b0:5f8:7d69:2688 with SMTP id 4fb4d7f45d1cf-5f87d692a4cmr444453a12.19.1745940431485;
        Tue, 29 Apr 2025 08:27:11 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7286bb2e1sm7322523a12.36.2025.04.29.08.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 08:27:11 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andre Przywara <andre.przywara@arm.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org, samuel@sholland.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Date: Tue, 29 Apr 2025 17:27:10 +0200
Message-ID: <4975791.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <4645060.LvFx2qVVIh@jernej-laptop>
References:
 <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <6a056bf8-9f39-4204-9378-8cc39be60038@lunn.ch>
 <4645060.LvFx2qVVIh@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 29. april 2025 ob 17:24:18 Srednjeevropski poletni =C4=8Das je J=
ernej =C5=A0krabec napisal(a):
> Dne torek, 29. april 2025 ob 17:09:22 Srednjeevropski poletni =C4=8Das je=
 Andrew Lunn napisal(a):
> > On Tue, Apr 29, 2025 at 04:51:59PM +0200, Jernej =C5=A0krabec wrote:
> > > Dne ponedeljek, 28. april 2025 ob 14:37:48 Srednjeevropski poletni =
=C4=8Das je Andrew Lunn napisal(a):
> > > > On Sat, Apr 26, 2025 at 08:00:49PM +0200, Jernej =C5=A0krabec wrote:
> > > > > Dne petek, 25. april 2025 ob 17:34:14 Srednjeevropski poletni =C4=
=8Das je Andrew Lunn napisal(a):
> > > > > > > > +&emac {
> > > > > > > > +	pinctrl-names =3D "default";
> > > > > > > > +	pinctrl-0 =3D <&ext_rgmii_pins>;
> > > > > > > > +	phy-mode =3D "rgmii-rxid";
> > > > > > >=20
> > > > > > > So relating to what Andrew said earlier today, should this re=
ad rgmii-id
> > > > > > > instead? Since the strap resistors just set some boot-up valu=
e, but we
> > > > > > > want the PHY driver to enable both RX and TX delay programmat=
ically?
> > > > > >=20
> > > > > > Yes.
> > > > > >=20
> > > > > > There is a checkpatch.pl patch working its way through the syst=
em
> > > > > > which will add warning about any rgmii value other than rgmii-i=
d. Such
> > > > > > values need a comment that the PCB has extra long clock
> > > > > > lines. Hopefully that will make people actually stop and think =
about
> > > > > > this, rather than just copy broken vendor code.
> > > > >=20
> > > > > I spent quite some time working on ethernet support for this boar=
d. Once
> > > > > I've found PHY datasheet, I confirmed that there is added delay. =
So this
> > > > > particular board needs "rgmii-rxid" mode.
> > > >=20
> > > > There have been numerous discussions about what these rgmii modes
> > > > mean, because DT developers frequently get them wrong.
> > > >=20
> > > > Does the PCB have an extra long clock line in the TX direction? That
> > > > is what rgmii-rxid means, the PCB is providing the TX delay, the
> > > > MAC/PHY pair needs to add the RX delay.
> > >=20
> > > While schematic is accessible, AFAIK PCB/gerbers are not, so I can't =
really
> > > tell how long it is. But without this extra delay, ethernet doesn't w=
ork.
> >=20
> > You are not adding an extra delay, you are subtracting a
> > delay. 'rgmii-rxid' says the TX delay is implemented by the PCB, hence
> > the PHY does not need to add the delay.
> >=20
> > What is normal is that the PCB adds no delays, and the PHY adds the
> > delay for both the RX and the TX. And you represent this with
> > 'rgmii-id'.
>=20
> ok, thanks for explanation.
>=20
> >=20
> > So what you need to find out is, where does the TX delay come from?
>=20
> How to do that? Strapping show me this way and testing confirmed it. Not
> sure what more I can do? As a hobbyist, I don't have access to anything m=
ore
> than schematic.

I just to be clear, I tested various combinations, including rgmii-id, and =
it
didn't work, except rgmii-rxid, which matches strapping. Of course Motorcomm
PHY driver took that into account and set registers accordingly.

Best regards,
Jernej





