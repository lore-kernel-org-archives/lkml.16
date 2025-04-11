Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4369278144;
	Fri, 11 Apr 2025 01:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744335005; cv=pass; b=OoveByI8jfEl0DoETUkqmJTZTD7CYDNw7BOTDtpoMBTfWJUMbmEg0eEcXtud5TsFrYDPkkZUu+Gunqf2mFdj8JtZRO8v99gap03UXXd5VjALP1zV/2aWzJ2VXRJ/1jAzSpQe2CJsD9Jr/rJFUsC7HhM4PSzcsxOYULvnAR28ocU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744335005; c=relaxed/simple;
	bh=GlMkW2v14p4FyqOTgR6k6cTeh7ov1bybA9ctoSXXWmE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NsaafRPOMpqyRFm2GfVz6/fg2iYnz+d+f8bdzpEa5oA8+DscgIZ8ke7nSIGOFX842dxvSGb5nHA/C0VBEnqmlHDGkWBEsltF6Q3awdKUCEhkgN7D2zF/OgGHQDSuC51O9O1YeJ9QthFQDb4EcOMmzoTYnko/kTtZkRRmOE19Ylg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=LuPAeHBB; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="LuPAeHBB"
ARC-Seal: i=1; a=rsa-sha256; t=1744334986; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DcoYYlo/TpIntFbIXs6JO5gEd9tpCgTfSSe7TkBXqkiYxhwdYZ46HcJa8XXkTw2//ak7mCi58OvT1gPt00EY5rJCCbGge/NVT3I2fc44jKInbNENxuKDC13RIxA28DP90sXA8VikvMhE9fJc312/TnaNnSrT04PTto+7jiEYj7k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744334986; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GlMkW2v14p4FyqOTgR6k6cTeh7ov1bybA9ctoSXXWmE=; 
	b=mFQRTJ8KCY9gU3nYH6TzOn1rOM0A0SvzctCCfe5jdFyIeWo9va2vFEJb7UQBWqnKk4wsnsMGAhL5rKbo+agV3qDybZyxn/grMnQ84G/GdiUdtGUOczpi+G6h6XO0MiGJ5nCg3CIen0I3sr9+th4o0/sev88jqZ1/2sri0S9SkcM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744334986;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=GlMkW2v14p4FyqOTgR6k6cTeh7ov1bybA9ctoSXXWmE=;
	b=LuPAeHBBfYeBnP/1icxI277vmNIIDS6T47NQsr60/mFPfe4BwfxeVt4Z6wqQJpwn
	hm/XMe2z8csXSEidiq6yQzs1HQGtDUpE+Yq58DQW2ZHvt3aw+BZK6tuUEebxnQ96gxT
	ooo7IyM/TYQRo818I/WOgeBTS7nopGOmQHhj3lGaBwS7r6qGHLBmKylH+w3VetyEMpC
	dBAlzZKjNjjsOTvohq+YIfdMsnfHVtx64wNHaogj88idHccmdyfwzz5xqzFo1FDuwC6
	v3JiGv5XyUwXtKGakVPQyzflm5n9dc9w5crVJIR/YWewCIoR8ipWjOw8ecsWAFHyLiB
	ilRBoMuSlA==
Received: by mx.zohomail.com with SMTPS id 1744334984374548.2768904052069;
	Thu, 10 Apr 2025 18:29:44 -0700 (PDT)
Message-ID: <8fbd6ffdd053760b6d0980173c7f8af6c09963ba.camel@icenowy.me>
Subject: Re: [PATCH 2/2] riscv: dts: starfive: add DT for Orange Pi RV
From: Icenowy Zheng <uwu@icenowy.me>
To: Yao Zi <ziyao@disroot.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Emil
 Renner Berthing <kernel@esmil.dk>, Jisheng Zhang <jszhang@kernel.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Drew Fustini
 <drew@beagleboard.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 11 Apr 2025 09:29:38 +0800
In-Reply-To: <Z_f30vAuATR1DCWk@pie>
References: <20250409091801.855083-1-uwu@icenowy.me>
	 <20250409091801.855083-2-uwu@icenowy.me> <Z_f30vAuATR1DCWk@pie>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2025-04-10=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 16:54 +0000=EF=BC=
=8CYao Zi=E5=86=99=E9=81=93=EF=BC=9A
> On Wed, Apr 09, 2025 at 05:18:01PM +0800, Icenowy Zheng wrote:
> > Orange Pi RV is a newly released SBC with JH7110 SoC, single GbE
> > port
> > (connected to JH7110 GMAC0 via a YT8531 PHY), 4 USB ports (via a
> > VL805
> > PCIe USB controller connected to JH7110 PCIE0), a M.2 M-key slot
> > (connected to JH7110 PCIE1), a HDMI video output, a 3.5mm audio
> > output
> > and a microSD slot.
> >=20
> > Onboard peripherals contain a SPI NOR (which contains the U-Boot
> > firmware) and an Ampak AP6256 SDIO Wi-Fi module.
> >=20
> > As the schematics isn't available yet, the SDIO Wi-Fi is left
> > disabled
> > yet.
> >=20
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > ---
> > =C2=A0arch/riscv/boot/dts/starfive/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0.../boot/dts/starfive/jh7110-orangepi-rv.dts=C2=A0 | 73
> > +++++++++++++++++++
> > =C2=A02 files changed, 74 insertions(+)
> > =C2=A0create mode 100644 arch/riscv/boot/dts/starfive/jh7110-orangepi-
> > rv.dts
> >=20
> > diff --git a/arch/riscv/boot/dts/starfive/Makefile
> > b/arch/riscv/boot/dts/starfive/Makefile
> > index b3bb12f78e7d5..24f1a44828350 100644
> > --- a/arch/riscv/boot/dts/starfive/Makefile
> > +++ b/arch/riscv/boot/dts/starfive/Makefile
> > @@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7100-starfive-
> > visionfive-v1.dtb
> > =C2=A0
> > =C2=A0dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-deepcomputing-fml13v01.dt=
b
> > =C2=A0dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-milkv-mars.dtb
> > +dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-orangepi-rv.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-pine64-star64.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-
> > v1.2a.dtb
> > =C2=A0dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-
> > v1.3b.dtb
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
> > b/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
> > new file mode 100644
> > index 0000000000000..bde01f117e0b2
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
> > @@ -0,0 +1,73 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> > + */
> > +
> > +/dts-v1/;
> > +#include "jh7110-common.dtsi"
> > +#include <dt-bindings/leds/common.h>
> > +
> > +/ {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0model =3D "Xunlong Orange Pi=
 RV";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "xunlong,oran=
gepi-rv", "starfive,jh7110";
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0leds {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0compatible =3D "gpio-leds";
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0led-ack {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpios =
=3D <&aongpio 3 GPIO_ACTIVE_HIGH>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0color =
=3D <LED_COLOR_ID_GREEN>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0functi=
on =3D LED_FUNCTION_HEARTBEAT;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0linux,=
default-trigger =3D "heartbeat";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0label =
=3D "ack";
>=20
> Should we sort the properties in alphabet order? i.e. color,
> function,
> gpios, label then linux,default-trigger. See dts-coding-style.rst,

Well in case of GPIO LED, I think gpios is something like reg? Although
this is only my personal feel, and label really needs to be reordered
then.

>=20
> > The following order of properties in device nodes is preferred:
> >=20
> > 1. "compatible"
> > 2. "reg"
> > 3. "ranges"
> > 4. Standard/common properties (defined by common bindings, e.g.
> > without
> > vendor-prefixes)
> > 5. Vendor-specific properties
> > 6. "status" (if applicable)
> > 7. Child nodes, where each node is preceded with a blank line
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0};
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> > +};
> > +
> > +&gmac0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0starfive,tx-use-rgmii-clk;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0assigned-clocks =3D <&aoncrg=
 JH7110_AONCLK_GMAC0_TX>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0assigned-clock-parents =3D <=
&aoncrg
> > JH7110_AONCLK_GMAC0_RMII_RTX>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
>=20
> Vendor property starfive,tx-use-rgmii-clk should go after the common
> ones.

Okay, I will fix this (and the one below) in next revision.

Thanks,
Icenowy

>=20
> > +};
> > +
> > +&i2c0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> > +};
> > +
> > +&mmc0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* TODO: Ampak AP6256 Wi-Fi =
module attached here */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "disabled";
> > +};
> > +
> > +&mmc1 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/delete-property/ cd-gpios;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0broken-cd;
> > +};
> > +
> > +&pcie0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> > +};
> > +
> > +&pcie1 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> > +};
> > +
> > +&phy0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0motorcomm,tx-clk-adj-enabled=
;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0motorcomm,tx-clk-10-inverted=
;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0motorcomm,tx-clk-100-inverte=
d;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0motorcomm,tx-clk-1000-invert=
ed;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0motorcomm,rx-clk-drv-microam=
p =3D <3970>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0motorcomm,rx-data-drv-microa=
mp =3D <2910>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rx-internal-delay-ps =3D <15=
00>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tx-internal-delay-ps =3D <15=
00>;
> > +};
>=20
> Ditto, move the vendor properties below the common ones.
>=20
> > +&pwmdac {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> > +};
> > +
> > +&spi0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> > +};
> > --=20
> > 2.49.0
> >=20
>=20
> Best regards,
> Yao Zi

