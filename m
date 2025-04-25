Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3558A208997
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745619255; cv=none; b=of7a3D4kQIbiGMZkmO3KTSYLeKa4MSuIi5UHDD1FrJruK7kqSopSPQQwnT68GPFYbisRYG+8fA/p49PFuZmjusdM/wgAmt+v+9XPLo9SOnS0qToHSgXb6JQN0AQFJugC6limDiqlFLn4qGuMTPnbGqt812Pr8lqew8WQGYi79AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745619255; c=relaxed/simple;
	bh=blm43ygUXqMRKFxLrd+VNrcueEbWd4jm8fGqgZgMydM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A1SWDUmOW3v5OxU6kj1x1zXMDaLklasARF5XcRS4gUXbTP6KFlWG5dhx9kdzHKT6euMRY6PNB3yQmN6k8QA2IJfEElzc8PAD1x7jv/Gc3hsFPEMIpTnJTlyBoRXhf+K7uJfkDh3iucR43Vl39HPn1ABr1Y2i49dYCtjrH58VVv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=foYOjgqR; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="foYOjgqR"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-739525d4e12so2520813b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1745619252; x=1746224052; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9rkq+P8mjayzisoLVUkDsT/oFVSZ8gJxLOEbIMf1ko=;
        b=foYOjgqRkSLnh1cGLywYaokivqpt2NNPx7zvUHtG97kSByeIfNAoEJqkfbIXvH3KRi
         TGyiZCS4Vh5oyAy4X8CchWeiJd34r9QJXriXpPaVqoNreQJ7Kam7z+YisOOKtD3t0fjA
         6ZpjQXNOJnezI2rHGSxrzbTrYWcxM996bCyvGvxXwEdSDUMapTJyCOp4vLYufv7Flm8i
         /Og8K/HCHRvUUR9gXbKYxPSAz/G4S8la9k/SGSJQ8NCZg0wvdYoLyCNgg1j6XesLm13W
         H5Qg52LguppekUSAlKHLo0MToRaeMhQEyfSMukT/mI/H0x7m/UJbRBPbZY/Cd/tZl/w7
         3zRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745619252; x=1746224052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9rkq+P8mjayzisoLVUkDsT/oFVSZ8gJxLOEbIMf1ko=;
        b=d1wY8M1xY1k9EnDBxxIyRQJgX4Wy+1bMFY71ba3wPByatK5KLlqoMYXw4PYlVeH9Ui
         kjfPfZhE0xvzPlG+mxhEMqFSuVLTdGE4ZQilEZ8Qp2FQl4W7VmtbwEEdTKG/UG30b/dV
         GQYKZF3F2X9+iUsqhx5Gtp2rg+oxyek1p7sjdzd3SKp6HviDirev75aWQdRZXALAet/Y
         ONNc3mRcaxbobxX0RFjrZTzSGt21c9aKLSRiT4MriUi61fj1s3ZI1ZR+miKRKfhQC02+
         w1E9oN7oP5UJP+Afllpr7eIuSLWRnedSAYE0qTJyKB0MYziFtIE7tKRQTXcd0qW7RAH+
         l5Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUqSSKyCh/qBakZ/2OYhOREmtNZ+VK4G/MaAuKfByUByzxaoPMRMpB3KARGSfQUQm4LzxtDmVx559xAXsM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0rksUY7b+a/Zrq7u3OCB7BWwzVrbyhJ5Ks4zAaQJhEcbPBKd+
	B6bZDO0Z/tgcwgxMd7NJ4wNlh4zEPITtes8gClZhcTxwaXNfEH0HK/7NSU6EYc96RC4ID/K5hkz
	GuXLfnYFKTglRS+yWUGMtNZVLpz4z7ZNN9U20RQ==
X-Gm-Gg: ASbGnctD+OOhZmLOWApLzFFFRUP4SbSUex5Gpv3bjjadoL0JZV7JizO9Yz9j0F6a3Qo
	kJo7GcZC9wLzfUn7/1nmtcGySDDHTIGLzeUoYQ3zffNhndQPvjRU5rFfWEXO/DftBl9WSF3fEh1
	09XcX4IjzWBqMzL6Jbm6xuu2LRkxk5/8Hkdw5ClZCrJqzJxdmeK0jsYuuq
X-Google-Smtp-Source: AGHT+IFZTpWnme11BLsiPrcwXvSidsxjw3T39w0pBWnpaOhvadBjE/0Txqz4t2IWUG9KzyHeFaqSA44grQcYa9JFaXI=
X-Received: by 2002:a05:6a00:2443:b0:736:65c9:9187 with SMTP id
 d2e1a72fcca58-73fd72cdc0dmr4750282b3a.9.1745619252491; Fri, 25 Apr 2025
 15:14:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415232521.2049906-1-william@wkennington.com>
 <79400920-22b4-4bce-b204-c58087495c22@kernel.org> <CAP6Zq1hURTrDgScx=eN_GO5FV8vZNsaGVQLOxbZPCXSqc0Kxwg@mail.gmail.com>
In-Reply-To: <CAP6Zq1hURTrDgScx=eN_GO5FV8vZNsaGVQLOxbZPCXSqc0Kxwg@mail.gmail.com>
From: William Kennington <william@wkennington.com>
Date: Fri, 25 Apr 2025 15:14:01 -0700
X-Gm-Features: ATxdqUH-kgNXVnWhZKo-pz8xJdgdBSJB7vJqIou_QQp0LlJRjkJ91-cRCOwfLeY
Message-ID: <CAD_4BXifgETo1z1awWQbAA-BA9U=8Tdo9JHo7SM1+6J5G_s2Pg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Fix nuvoton 8xx clock properties
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 11:44=E2=80=AFAM Tomer Maimon <tmaimon77@gmail.com>=
 wrote:
>
> William, thanks for the patch.
>
>
> On Wed, 16 Apr 2025 at 09:55, Krzysztof Kozlowski <krzk@kernel.org> wrote=
:
> >
> > On 16/04/2025 01:25, William A. Kennington III wrote:
> > > The latest iteration of the clock driver got rid of the separate cloc=
k
> >
> > I don't see the binding deprecated.
> >
> > > compatible node, merging clock and reset devices.
> > >
> > > Signed-off-by: William A. Kennington III <william@wkennington.com>
> > > ---
> > >  .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 16 ++++++--------=
--
> > >  .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts     |  8 ++++++++
> > >  2 files changed, 14 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi =
b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > > index ecd171b2feba..4da62308b274 100644
> > > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > > @@ -47,17 +47,13 @@ ahb {
> > >               interrupt-parent =3D <&gic>;
> > >               ranges;
> > >
> > > -             rstc: reset-controller@f0801000 {
> > > +             clk: rstc: reset-controller@f0801000 {
> > >                       compatible =3D "nuvoton,npcm845-reset";
> > >                       reg =3D <0x0 0xf0801000 0x0 0x78>;
> The size of the registers offset is 0xC4 (last register is at offset 0xC0=
)
> Therefore, the reg property should be modified as well to reg =3D <0x0
> 0xf0801000 0x0 0xC4>;

Yeah, I just looked at the DS to verify this value for the last clock regis=
ter.

> >
> > So now it lacks quite a bit of address space. This must be explained in
> > commit msg.
> >
> > >                       #reset-cells =3D <2>;
> > >                       nuvoton,sysgcr =3D <&gcr>;
> > > -             };
> > > -
> > > -             clk: clock-controller@f0801000 {
> > > -                     compatible =3D "nuvoton,npcm845-clk";
> > > +                     clocks =3D <&refclk>;
> > >                       #clock-cells =3D <1>;
> > > -                     reg =3D <0x0 0xf0801000 0x0 0x1000>;
> > >               };
> > >
> > >               apb {
> > > @@ -81,7 +77,7 @@ timer0: timer@8000 {
> > >                               compatible =3D "nuvoton,npcm845-timer";
> > >                               interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEV=
EL_HIGH>;
> > >                               reg =3D <0x8000 0x1C>;
> > > -                             clocks =3D <&clk NPCM8XX_CLK_REFCLK>;
> > > +                             clocks =3D <&refclk>;
> >
> > Not explained in commit msg.
> >
> >
> > Best regards,
> > Krzysztof
>
> Best regards,
>
> Tomer
