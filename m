Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163121DF75D;
	Tue,  3 Jun 2025 23:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748994673; cv=none; b=LcWV6/zBcXRHjzXS20jAJRWNOlNCUrOjdad84F1+UqSvgswhiDpT6os/YXdVHvoLrbxE9b3tXi3Cgy8rui5KdpKAPa0bvV7cabrk1XRD2e3b+/1/Ey/jcICBWgBgqQ7R87hn0/QcaoluZdAkTk5vQefz+aCdqoJC9I0hv3wc3Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748994673; c=relaxed/simple;
	bh=3iFWj11CkWHH71h9SyiDUGmXnlU/tw+q2bH9dzB+VJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZy2Iy3iCiEJZQjGJCFL39xcwevHXwybLA5SOb94tJ+kFd6TwT34RFBJTtlos/CVyMRV57RmjGzUoWTRyd7AJ9zq6JfDZoaGjo2BJ57y9dXz7/2fpdAPmY891wrP0bImn2pXKLC2ksqX+XWQ6Be1eYrVXaoSI+sMXI9JwM0mMAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImDctZfG; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImDctZfG"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b2c4476d381so382247a12.0;
        Tue, 03 Jun 2025 16:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748994671; x=1749599471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9L47Pw4FJq00Mo4o1EG2exd2hnFJSmIOUsOxTsjqiA=;
        b=ImDctZfGFy7g4v1XzPy223U/CDPGuSQ2qW73V7En9RL3K1htiVvj7moCMLZXS6Ulqf
         EgJa5nhG1OMgheV3nFjInyTa5m+T7qWSFrjQVx7n6JaVIKqjm4nsivBGOjmzT3P7YMCI
         bSMGv+d6E4nE/xgIfgkMJgVRJAHI+3cTolIAVbl+AE9H3heY9vSDHMkH203t9v4PhY3n
         WS9UfrJcASa+llBfkhglHNAvYb02drKJQ99dcB2MAn4lM9r6ioVivVu+yNZbhaXLTYRO
         nAQHUprumyW5K9XyVBsRB4mbIREkH9rJpwyzRKgcSYkxlue41TaSt/XWBdpHePqNGrs6
         okrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748994671; x=1749599471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9L47Pw4FJq00Mo4o1EG2exd2hnFJSmIOUsOxTsjqiA=;
        b=eaQDjGWm2ROcjqIgIeK9HcvWkzoKEwlIl29dabwLfeIwLr4vcoFeLQQRMW/SON2NhQ
         HMHODCkAmCag6Yjq/jv8j8LtwsW6RN26ilsw8VtgnLY/x5OmtSas59hsKYffVNFocQyw
         U3wsosJKeqbOmBkXIld/oBbhAFKbbJHhWQg0A3nvD4GfHptN/Kjcy9jd8NxPsucS3ilV
         XoloaW7vNZda9KD1y5ZwKcaewpbltZ08HMwSvqdGBnawAWn4Ck9UZ9QWrsrWM5Js//s9
         Ih9p957EDN9XhbdYZ6LgA2bvTg2hgJbcgeEKfAVfPVF/2S+BhoWqILco0kDmhWrMpCrf
         sMeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVitO2GKE1WrNSKP4dVkobDUemy7uJ2DVmlawQzDgGCraENmiSQMwteeVt45oh1v2NBSvYRhfKsE3Mq@vger.kernel.org, AJvYcCXchixMv6KgXeUZS1RI4UbrRMPd5oTVDfzCzUCDU1kxb4thQG7CR0GNowKIcH483NN92he7c8mBu/cS0qBc@vger.kernel.org
X-Gm-Message-State: AOJu0YzQYfMQk2Qdke4EPRchAi4lUIF3n1cgBl1XZdM+kwZiGhDFLB5V
	fUCer8viGhsXHcVBB4BY9nqeBE8roSnnlQszrbe4cGtJXyVGLqwRgK01nizqQ9Vjth+6HcvL9cg
	vDhc47+5QCyf7msY2x011K0szTy9NVvujF+pl
X-Gm-Gg: ASbGncs0AIYD7xt1pkYZdjzkuHamVsp4p/LNjoQNqCKmrdBdXOoIMN5Gqugau+BLvUr
	5NElq1EnAO5g7/TMDDEiHK42DjAbi4kYtIZAjXABKvGliHhH7oetLZ8D8qtYY/irpbmkxVmURvi
	W46yZ36ORY3iT7/Gw9LzVD0oL0AUIe4bLI
X-Google-Smtp-Source: AGHT+IFNst2H7GFHVcub0yd3Kmx7L7dZwZEJToym/csaIT88WJqNMHe3BnbzVXN+qxD/TPW9kbEM0Emgl9txshV4zbM=
X-Received: by 2002:a17:90b:1c0b:b0:311:abba:53b6 with SMTP id
 98e67ed59e1d1-3130dce1bcemr1068222a91.14.1748994671162; Tue, 03 Jun 2025
 16:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530221713.54804-1-aford173@gmail.com> <20250530221713.54804-5-aford173@gmail.com>
 <20250601183620.npuicmipv6kv54z6@pengutronix.de> <CAHCN7xKjEt3rq4VUOSSTqcT4SyWxSCPLHGf6jR6KVHvor5wfKQ@mail.gmail.com>
In-Reply-To: <CAHCN7xKjEt3rq4VUOSSTqcT4SyWxSCPLHGf6jR6KVHvor5wfKQ@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 3 Jun 2025 18:51:00 -0500
X-Gm-Features: AX0GCFtCdZakQVBK8i9Mwd6h5JPSbdyOFZQ8LmRy0bByuZIyxG3rUNoDH5Gee58
Message-ID: <CAHCN7xLr-7YQ9P8022g3SNPVgfQcEU8rSzZ-grMMom8kLm6e0Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: imx8mp: Configure VPU clocks for overdrive
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 10:35=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> On Sun, Jun 1, 2025 at 1:36=E2=80=AFPM Marco Felsch <m.felsch@pengutronix=
.de> wrote:
> >
> > Hi Adam,
> >
> > thanks for the patch.
> >
> > On 25-05-30, Adam Ford wrote:
> > > The defaults for this SoC are configured for overdrive mode, but
> > > the VPU clocks are currently configured for nominal mode.
> > > Increase VPU_G1_CLK_ROOT to 800MHZ from 600MHz,
> > > Increase VPU_G2_CLK_ROOT to 700MHZ from 500MHz, and
> > > Increase VPU_BUS_CLK_ROOT to 800MHz from 600MHz.
> > >
> > > This requires adjusting the clock parents. Since there is already
> > > 800MHz clock references, move the VPU_BUS and G1 clocks to it.
> > > This frees up the VPU_PLL to be configured at 700MHz to run
> > > the G2 clock at 700MHz.
> > >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/b=
oot/dts/freescale/imx8mp.dtsi
> > > index 909555a5da4b..848b25c9b752 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > @@ -2256,8 +2256,8 @@ vpu_g1: video-codec@38300000 {
> > >                       interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > >                       clocks =3D <&clk IMX8MP_CLK_VPU_G1_ROOT>;
> > >                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_G1>;
> > > -                     assigned-clock-parents =3D <&clk IMX8MP_VPU_PLL=
_OUT>;
> > > -                     assigned-clock-rates =3D <600000000>;
> > > +                     assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL=
1_800M>;
> > > +                     assigned-clock-rates =3D <800000000>;
> > >                       power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUB=
LK_PD_G1>;
> > >               };
> > >
> > > @@ -2267,8 +2267,8 @@ vpu_g2: video-codec@38310000 {
> > >                       interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> > >                       clocks =3D <&clk IMX8MP_CLK_VPU_G2_ROOT>;
> > >                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_G2>;
> > > -                     assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL=
2_1000M>;
> > > -                     assigned-clock-rates =3D <500000000>;
> > > +                     assigned-clock-parents =3D <&clk IMX8MP_VPU_PLL=
_OUT>;
> > > +                     assigned-clock-rates =3D <700000000>;
> > >                       power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUB=
LK_PD_G2>;
> > >               };
> > >
> > > @@ -2284,8 +2284,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> > >                                <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> > >                       clock-names =3D "g1", "g2", "vc8000e";
> > >                       assigned-clocks =3D <&clk IMX8MP_VPU_PLL>, <&cl=
k IMX8MP_CLK_VPU_BUS>;
> > > -                     assigned-clock-parents =3D <0>, <&clk IMX8MP_VP=
U_PLL_OUT>;
> > > -                     assigned-clock-rates =3D <600000000>, <60000000=
0>;
> > > +                     assigned-clock-parents =3D <0>, <&clk IMX8MP_SY=
S_PLL1_800M>;
> > > +                     assigned-clock-rates =3D <700000000>, <80000000=
0>;
> >
> > I think we can drop the "assigned-clocks =3D <&clk IMX8MP_VPU_PLL>" par=
t
> > completely.
> >
> > Before your patch the IMX8MP_VPU_PLL_OUT was used as clock-parent for
> > the IMX8MP_CLK_VPU_BUS. With yout patch IMX8MP_SYS_PLL1_800M is used.
>
> I think you're right.  I'll fix that up and do a V2.  I forgot to add
> my own s-o-b tag, so I'll fix that too.  I'll try to do it this week.

Marco,

I tried removing the assigned-clock references to the IMX8MP_VPU_PLL,
but i found the defaul speed was 800MHz for the PLL even when asking
G2 to be 700MHz.  The only way that I found to set the G2 to 700MHz
was to set the VPU_PLL to 700MHz.  I can do that either inside the G2
node or the vpumix_blk_ctrl node. I generally like to have the
blk_ctrl do it since it controls the G1_ROOT and G2_ROOT clocks, but
it doesn't seem to hurt it being inside the G2 node either.  I can see
the argument for having it insde the G2 node, since the G2 clock is
what's requiring the VPU_PLL to be 700MHz.

Let me know your preferences, and I'll move forward accordingly.

adam
>
> adam
> >
> > Regards,
> >   Marco
