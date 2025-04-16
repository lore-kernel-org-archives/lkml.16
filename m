Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC9822422C;
	Wed, 16 Apr 2025 18:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744829052; cv=none; b=MgkBKBQFnou5ZFVG9DANyb329NDmiPH+Xigo3ya8r4pyM+YB/NeAUqqxyM3gxPOLjAzyAJmMRR4pWmWf+X9uJSf3n0mUjQzRIe/E9KxDTXjy4jU5Nt41wbyFNiiNb/CTQ6JLTOe9pRBey97GDXUeV1RUFJ5eYqljj8NVbkUUQVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744829052; c=relaxed/simple;
	bh=H5AP05X1FxLbAixabp+9tPIVEJfNISg6Bzi3JvoMkcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dch/wBhKsCct4RsfgJaDAIVMsjVfjEoxum7YueuPzJjWaPIPrpRCO/WUcf/UKqjM4h+yOHgGCQf43hJ+yC1NGo7vU9AG7JyP9bGZq4b6x1EQ0CcgZPPVzROXEvJALlW4V9aZmnz33X1DIMi5yPcXWqN7W17zX4UuDCT96UHPbsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmlyGQzL; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmlyGQzL"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e643f235a34so8983276.1;
        Wed, 16 Apr 2025 11:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744829049; x=1745433849; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9L7mgnCNt3Zcj27rYN9qHZPaxHK5LZvqb/g7txzNM8o=;
        b=AmlyGQzLZ4oHKhEndsym7mGIUPtCPhEREjREQCBaCFsMFNoheFZhgO0uiLxs/eaNeI
         bodPfhBTDtJ4EBjChu44NhknISq/pkQaC2vZK8IDM3C6FjGpXhr0OR0IGrhgRgCVqIVl
         T/uFY86xWJxDlz4it9C4FyQD8wu/DQS7cUmkzy6+z9uhMX4y4yy1M6CUiPCowBCY5mhf
         8LmxiuSyRdSUJ5wMNmazmm1hYIpjN8MHJSnc7BzpSC95jQKevBxlxf0U8g2gB6enY4Cu
         nzKH0byYzymXADN4xmKUBk3Ds4XRXgUdRwjP2feY0It0apL5k4LoG4cRpsm9FkITpwuw
         IzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744829049; x=1745433849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9L7mgnCNt3Zcj27rYN9qHZPaxHK5LZvqb/g7txzNM8o=;
        b=iNRvVaEOLINpvwIfZlHOl18s6IwDvN671bj+dg4wD/bEOuvrvMjepaxhcLMQUuIDz+
         +QIT66DFh9mnDSxsXSB+eycpVJBjxAAeE8LmTfOuUHEzFS0uWPxIp9H+sNSNut0qgRYI
         GhoqQWRvlekpG39KGMxldp2GJeMtybUtiSejBdaF5JqvYw3MW352eXh4IFRc+BrwGJF6
         8h50Oc8pfYHnM59IO2HzNzARZx8lNM2vE2ULGkXsACLp8dt7EzUP4Mb7DQeIyYw1qXyk
         75WJxnZX9LU5Dh/XX8Wjfl91N3b7Dk9oSt/gx2bm+TZvJ1e0UZEUvJdocv62ULE+q9Sx
         IM0g==
X-Forwarded-Encrypted: i=1; AJvYcCWc2GJlP3ei+SVBIXNRZSolsXCp/olDxzbPceX8nmG0fQmMPWMRYizkT9EFOAyQO0X5EqIDBWKixD1y@vger.kernel.org, AJvYcCXDPGdeV4r0D4W0lBSlm0MTfQwyYZcc0j8rizT+53RBUQagMcC7rmeGDXsArL/by6RLBVRtHlf6bYim4LXd@vger.kernel.org
X-Gm-Message-State: AOJu0YwgEW2PrwPRP1MsbcVCEcc8b7ZiSxMMzqZ8kc0ytasGvk2kyyZE
	jTZ99yU9fDMxedQA9lYVpqfoQ7q3z7W0DrSO4BbMLmjtsIUesDhbPh0f6/Vzgz1l9+gZjXGcCy0
	VSMujk52Av/EnD4PeWOUmjZpQiRU=
X-Gm-Gg: ASbGncutf9Rbl350gE4dcKWbDfIMLUKBoB2yexdqqlJxnlRYUIQcDN5WH32x4PLSywW
	IJOpnp3FbzBNceQqoWieHjYL8CiQJPU7P82odK2Y5M/t/2F0ifAujGpKSX4XY7DsFt3phBRP2oJ
	C5QCihp4k1M5iNPWfgpYznc24=
X-Google-Smtp-Source: AGHT+IEEBGywpXm1UW45uwOGqb7UdYKdiM+qbWRcwxBFHDyQXsY3vRbyD9GoL5p+AQKSEba/9aW56/65sg2UtuDOAQ8=
X-Received: by 2002:a05:6902:2e0f:b0:e60:b04f:c191 with SMTP id
 3f1490d57ef6-e72757ec530mr3998015276.16.1744829049649; Wed, 16 Apr 2025
 11:44:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415232521.2049906-1-william@wkennington.com> <79400920-22b4-4bce-b204-c58087495c22@kernel.org>
In-Reply-To: <79400920-22b4-4bce-b204-c58087495c22@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 16 Apr 2025 21:43:58 +0300
X-Gm-Features: ATxdqUFPu4JepknFDDO-V4GlcrbJC_4d8VB1hYrlUJdQoMVkkJLheWUWjlaMw8A
Message-ID: <CAP6Zq1hURTrDgScx=eN_GO5FV8vZNsaGVQLOxbZPCXSqc0Kxwg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Fix nuvoton 8xx clock properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "William A. Kennington III" <william@wkennington.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

William, thanks for the patch.


On Wed, 16 Apr 2025 at 09:55, Krzysztof Kozlowski <krzk@kernel.org> wrote:
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
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > index ecd171b2feba..4da62308b274 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > @@ -47,17 +47,13 @@ ahb {
> >               interrupt-parent = <&gic>;
> >               ranges;
> >
> > -             rstc: reset-controller@f0801000 {
> > +             clk: rstc: reset-controller@f0801000 {
> >                       compatible = "nuvoton,npcm845-reset";
> >                       reg = <0x0 0xf0801000 0x0 0x78>;
The size of the registers offset is 0xC4 (last register is at offset 0xC0)
Therefore, the reg property should be modified as well to reg = <0x0
0xf0801000 0x0 0xC4>;
>
> So now it lacks quite a bit of address space. This must be explained in
> commit msg.
>
> >                       #reset-cells = <2>;
> >                       nuvoton,sysgcr = <&gcr>;
> > -             };
> > -
> > -             clk: clock-controller@f0801000 {
> > -                     compatible = "nuvoton,npcm845-clk";
> > +                     clocks = <&refclk>;
> >                       #clock-cells = <1>;
> > -                     reg = <0x0 0xf0801000 0x0 0x1000>;
> >               };
> >
> >               apb {
> > @@ -81,7 +77,7 @@ timer0: timer@8000 {
> >                               compatible = "nuvoton,npcm845-timer";
> >                               interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> >                               reg = <0x8000 0x1C>;
> > -                             clocks = <&clk NPCM8XX_CLK_REFCLK>;
> > +                             clocks = <&refclk>;
>
> Not explained in commit msg.
>
>
> Best regards,
> Krzysztof

Best regards,

Tomer
