Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7526A26E703
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749652364; cv=none; b=oPjZZwsKjswVvNgKx8sUxCxXfhWIUQ2YrkPZy071i3CakzZfQ0e9wF+SrUntOThcDC5N6mCxtescul6cXJbDIBQ5sU2MAHhGA1r60G0VIWrPm7uHEJ4KY3Dyv0J5eQdmBquSpXdbgNiuOmgKcRiJcvXDJ6ZSAxy9kp3Abkdu+g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749652364; c=relaxed/simple;
	bh=LIJKwYSQIfaGc2pHLi1K+zxTkENHkvAhCuTT19zf1Cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TAdG+Zn7YghYIzsPuySBxXat8fb16yG0hZi7NegyeZtwPmSPdG05pM4iu0nzoZR1kpYqwaE44RzlBD/enijxZCDBL1psyxBEhRvfH2Tz5vcA73TWVPVYWKggpde//gvvk6nbRNksXtpbPLszv9caFmcRw0SD/2n9jWMYZxfUzmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=tUgAHisK; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="tUgAHisK"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ade48b24c97so656698266b.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749652360; x=1750257160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60kjyrVoPLH2Ifa+97Mi20o2GvNQ5P+ZX0EZmjkoYqM=;
        b=tUgAHisKiRkEnrM13+qfPjcfwWKF7MghM4GgRFvbWUnqysEyk6XZcs0AkDABqKPpGU
         V/Ccpsi99HacuKGKeBGHEs6VaeKhX0+jDSyJ2MhSVa6hJLbssEXsbOXSaPYgu4tQijWT
         NXzbTPWPoeEoYTY62p7dvsWuGvI3VJuZLkgngKii8zR2Y8Qbb0qvI6Bb6+vtR+ePQdjl
         BNmhPAuaKoxbm8/ceJ0tWiYD6T6J6xrMyoz/iR5w08zEjyjrD6bivZshFmzxuvREYIOQ
         PJWbrID9ZnZtCSIV/wleNEufIvaeWaSUEKENLopO/UDUj7hZjgxCuqvGkiyICgnUCSv9
         XmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749652360; x=1750257160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60kjyrVoPLH2Ifa+97Mi20o2GvNQ5P+ZX0EZmjkoYqM=;
        b=eCVoEOdMzonvGMi9G+V77hlcfZhnU6bC3UNSAHFSLg7NSMW6sV5dtBTHooGZRRmzHK
         Qv+NV8b8JVuPpINkmWVFQRZTaF/22em6DYaOpu1hjhGjVjSTFzE6mp/el07uHd9wz4vf
         ePOz5vwF1p0LEgchnHSq3GAE2TJUVkTJ5bCFRMus0ehD6FVbVeAO1atihf7YGZSn8YNu
         Pet2Pc/G4lB5xnTaDfn+bMJdd5vs+Jc+Paib5zK5lWNYLVzq+pSdb1cgq2uLC7X5+UUJ
         II8jyxsmQA+QnoV1+UdmrQ4veD90Z0+t/H4O4DagmpJmkBSG6p0PoXqEjTNHpxTMGscD
         HXKw==
X-Forwarded-Encrypted: i=1; AJvYcCWmcauwhKkc9L0ZlvI670aiHTO2jwWaxtcLueAvKsEMmTKqNknJrDuaFFqqCmDUq58EsihJeBP5IOlA10w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBlEVswXEsisjCRkEX057Hw2zCd/Qd1SOzIYhs7IgGb3jvkP3H
	Mizb5bEYC/IDRXl7UKmHtJVR/H18V/hGovQuKmW0xWL9LiQR3dHCWZLeRn3VutGMzXknewjkOnh
	iVAfuvZWUcZ+wMl1rX9mKBkSCZN+3Oi6Ex/wkzrjsfQ==
X-Gm-Gg: ASbGncuiHzRgwGSU8ddB/8CoIeGiFwnECKZB+DaiP2W+Be2xOJds6SX0UY/CKSdcWPI
	e675FUwwBce7UBmDxXFT+d4FACBjYaTotjng9BbXgL/cG6nkXo4qYqHNvjTdeO4Kwzpy1etPDOl
	XTkvVSiY0vKbtunBe18nXv5pXB0+Zq46Iv8/4cbbN3RzVo
X-Google-Smtp-Source: AGHT+IEzETwYHx0nLbiFdWUeLmV4KrW57JrGro1I3zlSg5jafQBDwMDY2f+YekL/HJyWs+OOnv2PB4JAvv0sXW+xiFM=
X-Received: by 2002:a17:907:3e1b:b0:ad2:4fa0:88cd with SMTP id
 a640c23a62f3a-ade893e3192mr285970566b.9.1749652359722; Wed, 11 Jun 2025
 07:32:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-7-guodong@riscstar.com>
 <20250611135757-GYC125008@gentoo>
In-Reply-To: <20250611135757-GYC125008@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 11 Jun 2025 22:32:27 +0800
X-Gm-Features: AX0GCFsCOSkDRyqL6Nxt48HaUVxbrrOp5EdO9-GyXjMkq6GZqJ07_JcYpuCfhG4
Message-ID: <CAH1PCMbt3wLbeomQ+kgR6yZZ18TZ=_LF-kCcnLqad55FSHBhDA@mail.gmail.com>
Subject: Re: [PATCH 6/8] riscv: dts: spacemit: Enable PDMA0 controller on
 Banana Pi F3
To: Yixun Lan <dlan@gentoo.org>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, elder@riscstar.com, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 9:58=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong,
>
> On 20:57 Wed 11 Jun     , Guodong Xu wrote:
> > Enable the Peripheral DMA controller (PDMA0) on the SpacemiT K1-based
> > Banana Pi F3 board by setting its status to "okay". This board-specific
> > configuration activates the PDMA controller defined in the SoC's base
> > device tree.
> >
>   Although this series is actively developed under Bananapi-f3 board
> but it should work fine with jupiter board, so I'd suggest to enable
> it too, thanks
>

I'd be glad to include the Jupiter board as well. Since I don't have Jupite=
r
hardware for testing, could someone with access verify it works before I
add it to the series?

-Guodong

> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/ris=
cv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index 2363f0e65724..115222c065ab 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -45,3 +45,7 @@ &uart0 {
> >       pinctrl-0 =3D <&uart0_2_cfg>;
> >       status =3D "okay";
> >  };
> > +
> > +&pdma0 {
> > +     status =3D "okay";
> > +};
> > --
> > 2.43.0
> >
> >
>
> --
> Yixun Lan (dlan)
