Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6571E261F
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 14:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746281479; cv=none; b=burMBoqMK1AY8ojBq9gmCVq1Mf7+fuNqcc+Vlbiu98tKG9SKGjOiTM8DFOUWwgX/d4fPuTWLcpru2rSqMApoItjDTINH4/ZH5w6YqKZqzTSSPNjTb90YHFpofMojjWpRYeoC1gHRBZgKaeP33GNes71wK1MF0rqhT8w1NTneOl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746281479; c=relaxed/simple;
	bh=ciu5FbXkqLQsWfZ8ZKhUxaSuzC0RvHTM5+IZUqMMrFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GCcJPra2kPee+4T0UURpBwQ/7E97r2670ViaBQsulN0zdCGsOz4JUs0LlLRE1cobsXApyX8KTdeq8lAR5XuG2N6eqfEanY3Wn+uTPyac2lbzP2HSCKL9F0mIiNG6hGUc7b2wCcjdZwBeL+L4dZbhgYnSKLBVSF64QjoBPCQoPmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDgb157b; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDgb157b"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso1729138f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 07:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746281476; x=1746886276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCh5nmEj3pX/SsoomowKWDNtilSD1iUESrACm5D+2RE=;
        b=QDgb157brg/LP16BfKfLnLC9YOXmV7i02xehaM7vfoTcrv/6sWpUyLnxQL8tOgWPAr
         /1aWv7ayuz2xsnvs2R7BizFWLD/HbSqqTne8Tu7zSHg+8Z3ttl8hKphZ6WS16ztStltD
         7mZq55yRPFogAZQN44j3OGvcv5GZwnnMm0CA7jAG3cyPT7sPB+XLd3dPsjM6no/Ik5so
         +cf8yw5RKAl9YV1F7QbA8Z8GSkQZ2mLooN96WnfT3eOuMsgknBoxnuuif2IWRRN2drk+
         koZf+Tae07M8MX4U8TrmlPwbgQ60WvTEP5Ik76sp3llkZv520GsJT0UfjfXT/mQ2U9v2
         UAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746281476; x=1746886276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCh5nmEj3pX/SsoomowKWDNtilSD1iUESrACm5D+2RE=;
        b=GR74nmueuAYuy/gWIPmvVOigNuiRAodguE00fsjU2fYtovKTu2wNltiY19cxUMy6LM
         avW5dcz0WkjfXpMZzi3xFBUHoNNdcHqeccGoYdySLB0Q974eVWcGZdcdJrqW1xaZ0J3f
         BUNudKa2/MuVf0fD6oJI/2nCn1F2iOxz00DiZEP5MCB7uFmy0U6jt4zZOf6bfRjIkHZL
         lUCa43tokMuFbMfbDR7xpoYxtqp5HgAD7MdLG6tZyDaVSs3gwlLzVcbNRAu4+Qacdec+
         nWfvFtIP0EDaiNJIQZ1mP9AcF7LMw+N2/5hFZS7+yM5hGIcn54U7o2OOYn0wLWxbcBdh
         ADgA==
X-Forwarded-Encrypted: i=1; AJvYcCVKU0xFVZZSzAPSEnlwM1cRPKAKNKhsvD1uRWOJxSEom5o6Sa5qPzZV8N3/Ny1mSaIWxqd4Kc/KWA0RKv4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9GkrNZDdlYdOGaaxlZbA/j/NXj6P44Qkt77sgzECcXyWmCR48
	eNEJ5gIgOh8ypTmXR2sqvmTVdbnFOspuPh+nPa3qYlUsZSkIibWUaduNowTN3+s08TKou8JU8wK
	0u7fVC3PQGtUVYrKKAzkz4EX8W70=
X-Gm-Gg: ASbGncurg+Y/ZYUR/XNzIS8roWIPHksVl4m/Mc/vdTk3tq/FO5goDCuzYxcyFK8Xz4/
	c/LjcIFUebwQSk3AzPD6BayB5ehJ6MXSFRncKe8Ae3WRad9NxAWCbkgSNegj80+JqvBo4PDYxHR
	aDVkq1PH1twp9gEH0MP794vGg=
X-Google-Smtp-Source: AGHT+IFb7FoJgZJFIZO/UjXktY4mru2tOwWLAcfykM2RabNXRombknByR3vqY2NGtrHcXQxnil1A63HxXg5JD4HSPTA=
X-Received: by 2002:a05:6000:1845:b0:3a0:7b05:cfe4 with SMTP id
 ffacd0b85a97d-3a099ad1c2dmr6177737f8f.11.1746281475670; Sat, 03 May 2025
 07:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430055114.11469-1-clamor95@gmail.com> <20250430055114.11469-3-clamor95@gmail.com>
 <CAPVz0n2dHmAF+x1txDXE40XkRpg-nAsMgqgZAGOPWgkAZ6wfVA@mail.gmail.com>
In-Reply-To: <CAPVz0n2dHmAF+x1txDXE40XkRpg-nAsMgqgZAGOPWgkAZ6wfVA@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 3 May 2025 17:11:04 +0300
X-Gm-Features: ATxdqUGfvdljdGUYK8pN56IkPTYdpQ4Evxfco5yxMRNoxLQAtLlATfHKHlCJRh4
Message-ID: <CAPVz0n30to9CaYPJMLLkyb83JJP=BOvvBjXx4wm-EbPh+zKu5A@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] power: supply: Add support for Maxim MAX8971 charger
To: Sebastian Reichel <sre@kernel.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 3 =D1=82=D1=80=D0=B0=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 09:07=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=81=D1=80, 30 =D0=BA=D0=B2=D1=96=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 08=
:51 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > The MAX8971 is a compact, high-frequency, high-efficiency switch-mode
> > charger for a one-cell lithium-ion (Li+) battery.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  Documentation/ABI/testing/sysfs-class-power |  43 ++
> >  drivers/power/supply/Kconfig                |  14 +
> >  drivers/power/supply/Makefile               |   1 +
> >  drivers/power/supply/max8971_charger.c      | 752 ++++++++++++++++++++
> >  4 files changed, 810 insertions(+)
> >  create mode 100644 drivers/power/supply/max8971_charger.c
> >
>
> ...
>
> > diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfi=
g
> > index 8dbd39afa43c..09fb123efe4f 100644
> > --- a/drivers/power/supply/Kconfig
> > +++ b/drivers/power/supply/Kconfig
> > @@ -595,6 +595,20 @@ config CHARGER_MAX77976
> >           This driver can also be built as a module. If so, the module =
will be
> >           called max77976_charger.
> >
> > +config CHARGER_MAX8971
> > +       tristate "Maxim MAX8971 battery charger driver"
> > +       depends on I2C
>
> Greetings, Sebastian!
>
> Kernel test robot caught an issue regards dependencies of this driver.
> Although, it was made in way that extcon is optional, unfortunately
> extcon framework is not. Extcon header does not provide inline
> versions of functions used here hence undefined references pop up. I
> suppose proper fix would be by adding depends on EXTCON. Would you
> amend this commit or should I send a v7?
>
> Thank you for all your efforts and sorry for inconvenience.
>
> Best regards,
> Svyatoslav R.
>

UPD: addressed by Arnd Bergmann here
https://lkml.org/lkml/2025/5/3/271


> > +       select REGMAP_I2C
> > +       help
> > +         The MAX8971 is a compact, high-frequency, high-efficiency swi=
tch-mode
> > +         charger for a one-cell lithium-ion (Li+) battery. It delivers=
 up to
> > +         1.55A of current to the battery from inputs up to 7.5V and wi=
thstands
> > +         transient inputs up to 22V.
> > +
> > +         Say Y to enable support for the Maxim MAX8971 battery charger=
.
> > +         This driver can also be built as a module. If so, the module =
will be
> > +         called max8971_charger.
> > +
> >  config CHARGER_MAX8997
> >         tristate "Maxim MAX8997/MAX8966 PMIC battery charger driver"
> >         depends on MFD_MAX8997 && REGULATOR_MAX8997
> ...
