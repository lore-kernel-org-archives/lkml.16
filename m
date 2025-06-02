Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB4F1C245C;
	Mon,  2 Jun 2025 15:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748878559; cv=none; b=tsJxmar+Z0YNz+KCN8nUFn1GmesHKoeLqVax93JjrESWDM2dyJKsVVOeSanUlN5KCte0kVF5BInwhZh429zNkEH3SSozzL8nNc9kDYprvnkLhmWuDnSlHW3sHiIMd5qhJEHScHcRCYVziOQH7ZPFBOadMASquVspsOWv2D4JTIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748878559; c=relaxed/simple;
	bh=uVanfGYE8GJVCmIGdZwtcNhOll4tNtdy4QOFK3CEVJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LxQ49Os5z6EIxc8WWz7kask1cRQZf2cpbQ6HzqNrpCdVWbVeALrzWdogR5iMzc9ID42+MGHwGaKlO+KgrHRoaXBVuqp0q8CNv8eAgu3tuotzSggPo4tNsq7iZyC1M0Kg3BJV438B2TMFsSCzs3HgOHP7vcIeq6y9l74inmoOIVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NMBjYTl0; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMBjYTl0"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso3159556b3a.2;
        Mon, 02 Jun 2025 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748878557; x=1749483357; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNrtHxvAARLKVPFpYujSB14zlhbXQAvcOq3ksde84Gc=;
        b=NMBjYTl0xTDelfX06hD96AEcXEIpylKu6yfl0MQuYsct0extdVrY3Cf6AWHPWNinMY
         0XPJTHw4kiXBqh/vJD+YJagsfoO8J4cMuqkus/WgFX7DRTYqwbpdsfq6viez48jMKZyZ
         xab93EdRFG0jY9TIQk0zQQ07cl5Ktovxh1MSYr/rzkCcyrFZh5wj/m9DMzYpsA6984dP
         6FOJ01KUJhXrw5EReWW0PzzDkBvxUe011vqmcxqNsJUFMQxj+sZcCkL42iosvqwi5svG
         tI5jrqRbXagKIXN2bDGlNTrsm+BDm4X7l/7Q/reRWa0LYSA256g2A0nmo7qS33hOGHZM
         Kp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748878557; x=1749483357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNrtHxvAARLKVPFpYujSB14zlhbXQAvcOq3ksde84Gc=;
        b=AXLWlEv5psk53Ei9YP0B2Ldaq955L8UWociv6zuvbAosMkoQKGnTu0Q4LeMsyqgoL8
         oSPEAadej4CTG8sCZi8gbfOeJcIsH598wpd+wN2t4DyTK9UKpxZmTwbSCNXZl3o1FroJ
         K0g1C1Zrb/8ZMR9X21oWtG1eirag6tzb9rbCLeaaFhISAfTqPuNCdLU8V7KEmWoKGB4m
         xgZa/Jzrn8EPrW9s/M7uovS+7LCXuKkJzKy4N4XgXh/hx3kuiUV+xVDjrsSj1kiK5YkQ
         7tA57ykI/XfmTMKuntO2SKjUrSEjPK6WpVVah3HH97PtDTnq51EfZwRdGeu3yZ4oxhA4
         BEkg==
X-Forwarded-Encrypted: i=1; AJvYcCX7Naab0uZs96dMlg7cKuxsRgslRWq3omgK/cqI7uNmSD07HjkROneo68nTcaACnrKM44sfvuJafXbnclNz@vger.kernel.org, AJvYcCXNFyYZtWxC3zkXCTBW882W+3wE3mWbpl/8w9iK8oauYBB4/wmb+2qM1bnXYuHtt3vfB277q7FtR8t2@vger.kernel.org
X-Gm-Message-State: AOJu0YxQV83SzqwYaG7s/OhfLDkyYB+a3oqb4qcZgNY7/AStcK/0vvnP
	0qjyaOTiihhmDP+NzgSc+DLJ1oviR1/uf3RWEEjDI5P2hPWpNEPVlblQYEFhokzJNkVbWjdfiLr
	pKjix0EEbF1xxVfQVG1ZyVx+1IrJL+XkbMYPR
X-Gm-Gg: ASbGncuuZL1RSlDzLpGpNTt2Azy41kkEzQdmZrthWpCGOcvQlXUjcAQjR9bhCD9y5oO
	nxQdfybXlqtdaTTEJ2ybUbcjLK+Mk9chQFIWfVcJPF56aqYg4G18Or9EBE1nbjWFd9dYzIvrnnO
	kR9OWEma27KeAlfOKRCXY6fGFWFRpEkq3FMdz5e+JY00I=
X-Google-Smtp-Source: AGHT+IE8dA1Pco98GdRrtQc3CXC3zKuqxixGckqlX0jZC5qF1ahyeT/uWicDjaPk55wZT7A9YkfMRqlC7hap1CDu8es=
X-Received: by 2002:a05:6a00:88e:b0:73e:2d76:9eb1 with SMTP id
 d2e1a72fcca58-747bd96bb7bmr16842852b3a.10.1748878557404; Mon, 02 Jun 2025
 08:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530221713.54804-1-aford173@gmail.com> <20250530221713.54804-5-aford173@gmail.com>
 <20250601183620.npuicmipv6kv54z6@pengutronix.de>
In-Reply-To: <20250601183620.npuicmipv6kv54z6@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 2 Jun 2025 10:35:46 -0500
X-Gm-Features: AX0GCFv__4JuP0qoSXHoB0hrfnXBe2PzvmOKWGMVmTMtI6s693tpZjD_UaOkNuc
Message-ID: <CAHCN7xKjEt3rq4VUOSSTqcT4SyWxSCPLHGf6jR6KVHvor5wfKQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: imx8mp: Configure VPU clocks for overdrive
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 1, 2025 at 1:36=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.d=
e> wrote:
>
> Hi Adam,
>
> thanks for the patch.
>
> On 25-05-30, Adam Ford wrote:
> > The defaults for this SoC are configured for overdrive mode, but
> > the VPU clocks are currently configured for nominal mode.
> > Increase VPU_G1_CLK_ROOT to 800MHZ from 600MHz,
> > Increase VPU_G2_CLK_ROOT to 700MHZ from 500MHz, and
> > Increase VPU_BUS_CLK_ROOT to 800MHz from 600MHz.
> >
> > This requires adjusting the clock parents. Since there is already
> > 800MHz clock references, move the VPU_BUS and G1 clocks to it.
> > This frees up the VPU_PLL to be configured at 700MHz to run
> > the G2 clock at 700MHz.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index 909555a5da4b..848b25c9b752 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -2256,8 +2256,8 @@ vpu_g1: video-codec@38300000 {
> >                       interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> >                       clocks =3D <&clk IMX8MP_CLK_VPU_G1_ROOT>;
> >                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_G1>;
> > -                     assigned-clock-parents =3D <&clk IMX8MP_VPU_PLL_O=
UT>;
> > -                     assigned-clock-rates =3D <600000000>;
> > +                     assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL1_=
800M>;
> > +                     assigned-clock-rates =3D <800000000>;
> >                       power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUBLK=
_PD_G1>;
> >               };
> >
> > @@ -2267,8 +2267,8 @@ vpu_g2: video-codec@38310000 {
> >                       interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> >                       clocks =3D <&clk IMX8MP_CLK_VPU_G2_ROOT>;
> >                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_G2>;
> > -                     assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_=
1000M>;
> > -                     assigned-clock-rates =3D <500000000>;
> > +                     assigned-clock-parents =3D <&clk IMX8MP_VPU_PLL_O=
UT>;
> > +                     assigned-clock-rates =3D <700000000>;
> >                       power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUBLK=
_PD_G2>;
> >               };
> >
> > @@ -2284,8 +2284,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> >                                <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> >                       clock-names =3D "g1", "g2", "vc8000e";
> >                       assigned-clocks =3D <&clk IMX8MP_VPU_PLL>, <&clk =
IMX8MP_CLK_VPU_BUS>;
> > -                     assigned-clock-parents =3D <0>, <&clk IMX8MP_VPU_=
PLL_OUT>;
> > -                     assigned-clock-rates =3D <600000000>, <600000000>=
;
> > +                     assigned-clock-parents =3D <0>, <&clk IMX8MP_SYS_=
PLL1_800M>;
> > +                     assigned-clock-rates =3D <700000000>, <800000000>=
;
>
> I think we can drop the "assigned-clocks =3D <&clk IMX8MP_VPU_PLL>" part
> completely.
>
> Before your patch the IMX8MP_VPU_PLL_OUT was used as clock-parent for
> the IMX8MP_CLK_VPU_BUS. With yout patch IMX8MP_SYS_PLL1_800M is used.

I think you're right.  I'll fix that up and do a V2.  I forgot to add
my own s-o-b tag, so I'll fix that too.  I'll try to do it this week.

adam
>
> Regards,
>   Marco
