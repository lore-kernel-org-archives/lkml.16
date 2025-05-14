Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E2F1624EA;
	Wed, 14 May 2025 14:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747234586; cv=none; b=n5tOa3lR10KQHJleD4ojCxxA/0sx+W3iLPGYWeAHLkOtcUsMjGvRpo3tpqiK0KoJUFYLNgmPeG0iZaLUpePXYKdm/VA0/7vjPNGCKBBoVchb7YekL5YRI2eJ4Sz7WUTQipr8yUxo6Ql6P1js6DN2jkzMRtvXkwmvTcEISkMIrmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747234586; c=relaxed/simple;
	bh=vqOW1WuEtnGSH0H1EDi7EaJBHJtwR6S8ZbdbfjGrhwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cbr+V0wKxuwhNThLIwSxc184ZQQz+u6IfqUm/rSAbMiP2gWVxbvUoeL5ubMcPEGdIE//zuM2rtW5EFuzKhei41WM2FFYSiDF7eKePooT7ToJsdWArMmRRpdAoNPD/ug6Pvqcvx3yJAJugI9LxM59ZiHqtt0eqhrBbQBq4qSGK2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=LHWtmkWW; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="LHWtmkWW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=5p9FTy7AYLJTuOgTYlyr5CXgIB8ZTMo/qUcqJKJ+R2A=; b=LHWtmkWWW0cgvOXeSkW5bnE2fg
	fF8OFmRs3E23GBjNKjvlIhsDPzL4M7H/qMbzMMjXCcPnTlWz1yItm8KGVjDHobIUgfQrByyOqovtS
	P1kfJUHIV4vmrDFCHRHT/VuGRnMkpvLmUaNB2YbaxnZDovY9paCznZm6mNeuPN96BbIMF6ZYmuDsi
	G7SWWK7P9TmzuWdnOzkdfeWbx21aGkzSy03eKU3E27JB7vEMUyG2x2+gNqpOgEciZtmzbayRmcyGM
	ia4gSsIt7Qc2FxQNEbWP6LYkYzM7+lV9dUeYX+cqvdJbTO3DN2qTOcOalkDVyajAcGiOVegtL6w37
	B4yiBFMA==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFDWs-0006q0-Jr; Wed, 14 May 2025 16:56:18 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>
Cc: quentin.schulz@cherry.de, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject:
 Re: [PATCH v2 4/6] arm64: dts: rockchip: add px30-cobra base dtsi and board
 variants
Date: Wed, 14 May 2025 16:56:17 +0200
Message-ID: <38830328.XM6RcZxFsP@diego>
In-Reply-To: <20250514133951.GA1975151-robh@kernel.org>
References:
 <20250513150234.2331221-1-heiko@sntech.de>
 <20250513150234.2331221-5-heiko@sntech.de>
 <20250514133951.GA1975151-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 14. Mai 2025, 15:39:51 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Rob Herring:
> On Tue, May 13, 2025 at 05:02:32PM +0200, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> >=20
> > Cobra are Touchscreen devices built around the PX30 SoC using
> > a variety of display options.
> >=20
> > The devices feature an EMMC, network port, usb host + OTG ports and
> > a 720x1280 display with a touchscreen.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> > ---
> >  arch/arm64/boot/dts/rockchip/Makefile         |   4 +
> >  .../rockchip/px30-cobra-ltk050h3146w-a2.dts   |  39 ++
> >  .../dts/rockchip/px30-cobra-ltk050h3146w.dts  |  39 ++
> >  .../dts/rockchip/px30-cobra-ltk050h3148w.dts  |  39 ++
> >  .../dts/rockchip/px30-cobra-ltk500hd1829.dts  |  73 +++
> >  arch/arm64/boot/dts/rockchip/px30-cobra.dtsi  | 566 ++++++++++++++++++
> >  6 files changed, 760 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146=
w-a2.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146=
w.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148=
w.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd182=
9.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dt=
s/rockchip/Makefile
> > index 3e8771ef69ba..8151e8bb1cd3 100644
> > --- a/arch/arm64/boot/dts/rockchip/Makefile
> > +++ b/arch/arm64/boot/dts/rockchip/Makefile
> > @@ -1,4 +1,8 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D px30-cobra-ltk050h3146w-a2.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D px30-cobra-ltk050h3146w.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D px30-cobra-ltk050h3148w.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D px30-cobra-ltk500hd1829.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D px30-evb.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D px30-engicam-px30-core-ctouch2.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D px30-engicam-px30-core-ctouch2-of10.d=
tb
> > diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dt=
s b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
> > new file mode 100644
> > index 000000000000..1d26164be7b8
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
> > @@ -0,0 +1,39 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2025 Cherry Embedded Solutions GmbH
> > + */
> > +
> > +/dts-v1/;
> > +#include "px30-cobra.dtsi"
> > +
> > +/ {
> > +	model =3D "Theobroma Systems Cobra with LTK050H3146W-A2 Display";
> > +	compatible =3D "tsd,px30-cobra-ltk050h3146w-a2", "tsd,px30-cobra", "r=
ockchip,px30";
> > +};
> > +
> > +&dsi {
> > +	status =3D "okay";
> > +
> > +	panel@0 {
> > +		compatible =3D "leadtek,ltk050h3146w-a2";
> > +		reg =3D <0>;
> > +		backlight =3D <&backlight>;
> > +		iovcc-supply =3D <&vcc_1v8>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&dsp_rst>;
> > +		reset-gpios =3D <&gpio0 RK_PB2 GPIO_ACTIVE_LOW>;
> > +		vci-supply =3D <&vcc_2v8>;
> > +
> > +		port {
>=20
> 'port' is not allowed by this binding.

It is since last week [0], because the Leadtek displays got their port
property added.


[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?id=3Dbf0636f4348e098e2338eebbe42d7780c58a1195



