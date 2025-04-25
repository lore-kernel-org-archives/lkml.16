Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688A328936E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745619396; cv=none; b=blzcRV3/uyml7CZULeP82qtyk5AvGZ5XCrNzdIPCqbBuSraZqok1cWcS5Dms79KQE2gH81KAbampdR9of4p60efXdATz2LfrNu2TT6NkWll/aj2MlEzKdfQ7ruxs6YK/DUUOzx2z/gKqLTXanqSwxvsLFPnD3sdNeqM1nJ40cTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745619396; c=relaxed/simple;
	bh=W30Elu0BPXUZLgDMxTxpH20ZLIU0eYAyb8+7H14ZRjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=akaUYciEYbPSV/EamuxHNf41TcuvqRiecjOg48pCw9aiBp2I02ywOdx7VUr2F+AGZbGYnwruCnW3PNxWBShleBBA6M2r993hjqijPVqC32NPKrjmHhg3DyDMxH6M5oMMqyzvuWxwjLfdCGlBh2fMwAzRTpOAkd6kfq3hiRD6/Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=StnhT1Dw; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="StnhT1Dw"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736c1138ae5so2766816b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1745619394; x=1746224194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgXD6hkPKUGRTdY1zhGVp/H0Rv3gRoc0tuevqLhxiZs=;
        b=StnhT1DwrphxpWMTf+Y/JEzLMG3JkwBbljfQQAsYTbqZDhS1cuVzVU1fOo8EYeDSLt
         sV7GuBSYBsbN5NnUZ+rib0r4MaNOQDErIkvHEIUvBbFWGBryhdeOLPmt+HckATBax3cs
         n/Xy7gmfZ75jVfiSYnjfXPgo9u/3cD7J0RK60hDW33t8ScPXAcCiz9xHZ95ASnnZRED4
         ORWuKX5gvag2Xa8mU7pxlGyAzL0HNXOlZfjPCmPrbxqWpP+21/fh27cFTPzvz3R+HSGo
         tDfR0FD/0VNhv2zEX7vgucuXdg8d9uQSj+UTCfiOzK0HqsjUdDgelc8KEXZMuOiKUKhv
         CeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745619394; x=1746224194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgXD6hkPKUGRTdY1zhGVp/H0Rv3gRoc0tuevqLhxiZs=;
        b=McpbZWHucXzA3GQ8I4COlRhitAFfJyLhr+2pXCx+kfo3ziA1UabLcdxCVY8oglzwfu
         FIiPYLSmmLczRs8WmN3NFh3s2vul3wAuPXtWv182Ww+eHCJOlYhxkTu0wHOnH3SHE16t
         v09zZ0iYHHal71+pl337P3b94cGJdso91qE0rBz/QEzUKkwQe2kIAgeqJuRDd12IIPiV
         ITH+kfW3f/eCNjT0pYvrkrwWF+ZbG4Cz0ZZyXu9rkTKa1fokbRMousq+9hL2C0fOqfWE
         6y9cSp1qQ3az1JCfsk0KQE+/D14W2LgtBb+Nk7yOBBDGUJMv7NjDDTsFn93Xv30cWVT1
         yCWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVunYv30XDzeXOgqasw8klOQJdvzYlqObMdKNFD6V4HupNJh7r5OHUCX7iYliF8DvxIlRYX7OIinGcaV6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBjUgD2HNo9g0bniIFHpSIVlF1xXm/zDqrJDcjvuECt3L686JW
	CDx4SmZWLQsJXEkjnIjRitiqhL01GamnUcyLm0q+p/M4ifzCJubssappj/nd66VgFzSsS0EdEZV
	GcouKirlvgsgWkB+1swdBy3C2aw/FxndVGfYgfw==
X-Gm-Gg: ASbGnctHaYOCj5Rrcj+27zj0xTk1ADgLRqllpuT4ifZasXT1NBVXPioPJbdi9t+kMQg
	oFdnNAgftDC9kcsLNS/pMlXRdscPIumVI48BOCoYi++7BkylFzwtT5pAkBZFg44+c/xAs/do3cz
	tWbarfNuBSo+2CdcM4IhakkjadTMSddLDvVy2sgdbGVjXmQsUYgBkRVVUq
X-Google-Smtp-Source: AGHT+IH2N4ln+J9HVbv+8+sHBp1P/isBj0gkTrIzOTOJCwbUCAtU7RG/jp9P807JAV09WP22RBF21hsTQbnlFLBbfcE=
X-Received: by 2002:a05:6a00:218c:b0:736:5c8e:baaa with SMTP id
 d2e1a72fcca58-73ff7255d1fmr1386610b3a.2.1745619394656; Fri, 25 Apr 2025
 15:16:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415232521.2049906-1-william@wkennington.com> <79400920-22b4-4bce-b204-c58087495c22@kernel.org>
In-Reply-To: <79400920-22b4-4bce-b204-c58087495c22@kernel.org>
From: William Kennington <william@wkennington.com>
Date: Fri, 25 Apr 2025 15:16:23 -0700
X-Gm-Features: ATxdqUG71cOtnC9xnSIu_N-FLI_cL9Ilck2vh1utGY_dfZmPABCB1UECKPYRuu0
Message-ID: <CAD_4BXiaqLa563LoyGsPV=C164KxREzs0H+VcXPGR9QagzKs0A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Fix nuvoton 8xx clock properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 11:55=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 16/04/2025 01:25, William A. Kennington III wrote:
> > The latest iteration of the clock driver got rid of the separate clock
>
> I don't see the binding deprecated.
>
> > compatible node, merging clock and reset devices.
> >
> > Signed-off-by: William A. Kennington III <william@wkennington.com>
> > ---
> >  .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 16 ++++++----------
> >  .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts     |  8 ++++++++
> >  2 files changed, 14 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/=
arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > index ecd171b2feba..4da62308b274 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > @@ -47,17 +47,13 @@ ahb {
> >               interrupt-parent =3D <&gic>;
> >               ranges;
> >
> > -             rstc: reset-controller@f0801000 {
> > +             clk: rstc: reset-controller@f0801000 {
> >                       compatible =3D "nuvoton,npcm845-reset";
> >                       reg =3D <0x0 0xf0801000 0x0 0x78>;
>
> So now it lacks quite a bit of address space. This must be explained in
> commit msg.

Can do that when i make the updated series. Basically the old value
was just never consumed by an actual driver and the chip reserves that
entire 0x1000 size address space for clock registers. However, only
0xC4 bytes (0x78 was incorrect) of that space are used for these
registers.

>
> >                       #reset-cells =3D <2>;
> >                       nuvoton,sysgcr =3D <&gcr>;
> > -             };
> > -
> > -             clk: clock-controller@f0801000 {
> > -                     compatible =3D "nuvoton,npcm845-clk";
> > +                     clocks =3D <&refclk>;
> >                       #clock-cells =3D <1>;
> > -                     reg =3D <0x0 0xf0801000 0x0 0x1000>;
> >               };
> >
> >               apb {
> > @@ -81,7 +77,7 @@ timer0: timer@8000 {
> >                               compatible =3D "nuvoton,npcm845-timer";
> >                               interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL=
_HIGH>;
> >                               reg =3D <0x8000 0x1C>;
> > -                             clocks =3D <&clk NPCM8XX_CLK_REFCLK>;
> > +                             clocks =3D <&refclk>;
>
> Not explained in commit msg.

Yeah, I can do that WRT using an on board refclk instead of a value
that comes from the SoC.

>
>
> Best regards,
> Krzysztof
