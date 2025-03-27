Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3860E224F0;
	Thu, 27 Mar 2025 15:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743088644; cv=none; b=aGBl5dlGTfp3002vkYYSUYUeYMBcSBOvXinVHPEowdU4BMzfOLuWR8SjiYA47VgMQFQgvXbrNLVho0FMIDOCjsLTTJHYJ0nnsC+IukMqWhlJhz80K1KwcGBoNK8+QpN2+zDeoEnqvvrE4q3WKiXjq0dNk5er4yToLS8QkJwOutU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743088644; c=relaxed/simple;
	bh=oCznubISwDBJTpXZxjSqwKCnkYhZ8P4u13fownGsO/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tco7t6eExOaVSKQ55rhqf0b8Fh1ZvhL72rfFWVe7vE5yqtHMPZJ2gySmxFCQCkfBfCoNEv73Mf10d/1rB0kfRmAD8+ADe9wxpYFnVHNPR9MHgpSE5LzUOE4jjgxTik2i7c7Y4vzWIEqfDYSSjM5V2v5o3bhUFvox1RIez4bXNhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=pI2ft4KY; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=gazNy7g5 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="pI2ft4KY";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="gazNy7g5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743088641; x=1774624641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q5N17KOsgfd5tU8QCiBgB2dYYl62hiU+7Jh0VcyVGqQ=;
  b=pI2ft4KYS8XB7+bTkevYQKYf6Oy5d1V4wYYavmU6FK9kYb7XbBmpcr3N
   h30L+NsX4QkByeEiC2DnUbhn8pjXDkjOlDsdYwV2AC9ubwX5AvOU/sWAn
   +6sz7zWhdFzoUnrLDisbrnVp5nznCK7AVBZnRPgkhw29IOHb77lldaS71
   u5MJ0oYVsfuhe0TrOvF0pxmQv96iSWj0zP7peS52ga4E8cOT7EVA8WrYW
   YzhN44UI3EORsaBW5kETdchD3N/AbSfQxPOX/ZL5lK69kofDwSLBJihhw
   3PXZOMJX18JSyQzxUJuuubbvRsWDKm6GRxr7UWFFlVx/stGW70MR/VV2B
   Q==;
X-CSE-ConnectionGUID: zFpRplEPRlihr1sVJCWn0w==
X-CSE-MsgGUID: VhuchQarTSmZCCqKjJv0nQ==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43200592"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 16:17:18 +0100
X-CheckPoint: {67E56BFE-25-2417938-F0170C2B}
X-MAIL-CPID: 9D2C94109F316BB6688BAB2DCFEC054B_2
X-Control-Analysis: str=0001.0A006378.67E56BF7.006E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA52416C5D9;
	Thu, 27 Mar 2025 16:17:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743088634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q5N17KOsgfd5tU8QCiBgB2dYYl62hiU+7Jh0VcyVGqQ=;
	b=gazNy7g5HlLQhl60V7ofVmlS/b8twdF3ZC9kSnv5Wz7NV3mgX/0oINBbyGumnGGYfqE8sR
	RWOZbtNhO+a1OL30b6x3ZdfojCxQpv1vENTaIoxIooUn86g9uqO08Ph4azErd6VOhj5BE5
	fxDq9slGOJTnHprTsSav7tmW2sl9N7XAZTaIGxkbtLHgWL8NvqCTCSngkOJ6Ati8/OnnOV
	nX4sNGntFocf4mDFyWfhHv4ekGPo0/OfTeenaso+O+ixdUMJMAw7hMzYTVhBpKjys2ayUt
	EwieziGJ+xpKb/6wYjj7s0mWGo6uhIxHTUAz31JADuhe1ABKrPmrktTidGUb8A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 4/7] ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay for Tianma
 TM070JVGH33
Date: Thu, 27 Mar 2025 16:17:09 +0100
Message-ID: <3347513.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Z+VoEI9Ep3izRKBJ@lizhi-Precision-Tower-5810>
References:
 <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
 <20250327144118.504260-5-alexander.stein@ew.tq-group.com>
 <Z+VoEI9Ep3izRKBJ@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Frank,

Am Donnerstag, 27. M=E4rz 2025, 16:00:32 CET schrieb Frank Li:
> On Thu, Mar 27, 2025 at 03:41:10PM +0100, Alexander Stein wrote:
> > This adds an overlay for the supported LVDS display tianma tm070jvhg33.
> > The on-board RGB-to-LVDS encoder and DCU graphics chain are configured
> > accordingly. Add the missing power supply as well.
>=20
> 		      ^^^ missed?

Thanks for the comment. We are touching English grammar here and I might
be completely wrong.
IMHO this gerund is describing the power supply is missing the whole time.
In contrast to 'missed' which indicates it had been missed (just) once.
Anyway I don't have hard feelings.

Best regards,
Alexander

> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  arch/arm/boot/dts/nxp/ls/Makefile             |  2 +
> >  ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 47 +++++++++++++++++++
> >  .../nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts   |  1 +
> >  3 files changed, 50 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls102=
1a-lvds-tm070jvhg33.dtso
> >
> > diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/=
ls/Makefile
> > index 225a7665b8ad1..7f96de6f80224 100644
> > --- a/arch/arm/boot/dts/nxp/ls/Makefile
> > +++ b/arch/arm/boot/dts/nxp/ls/Makefile
> > @@ -8,4 +8,6 @@ dtb-$(CONFIG_SOC_LS1021A) +=3D \
> >  	ls1021a-twr.dtb
> >
> >  ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs +=3D ls1021a-tqmls1021a-mbls102=
1a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
> > +ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs +=3D ls1021a-tqmls1=
021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
> >  dtb-$(CONFIG_SOC_LS1021A) +=3D ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
> > +dtb-$(CONFIG_SOC_LS1021A) +=3D ls1021a-tqmls1021a-mbls1021a-lvds-tm070=
jvhg33.dtb
> > diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds=
=2Dtm070jvhg33.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a=
=2Dlvds-tm070jvhg33.dtso
> > new file mode 100644
> > index 0000000000000..e9708f3c67403
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070j=
vhg33.dtso
> > @@ -0,0 +1,47 @@
> > +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> > +/*
> > + * Copyright 2013-2014 Freescale Semiconductor, Inc.
> > + * Copyright 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> > + * D-82229 Seefeld, Germany.
> > + * Author: Alexander Stein
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&backlight_dcu {
> > +	status =3D "okay";
> > +};
> > +
> > +&dcu {
> > +	status =3D "okay";
> > +
> > +	port {
> > +		dcu_out: endpoint {
> > +			remote-endpoint =3D <&lvds_encoder_in>;
> > +		};
> > +	};
> > +};
> > +
> > +&display {
> > +	compatible =3D "tianma,tm070jvhg33";
> > +	status =3D "okay";
> > +};
> > +
> > +&lvds_encoder {
> > +	status =3D "okay";
> > +};
> > +
> > +&lvds_encoder_in {
> > +	remote-endpoint =3D <&dcu_out>;
> > +};
> > +
> > +&lvds_encoder_out {
> > +	remote-endpoint =3D <&panel_in>;
> > +};
> > +
> > +&panel_in {
> > +	remote-endpoint =3D <&lvds_encoder_out>;
> > +};
> > diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts =
b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> > index 27a55fa638128..80dae0c09542d 100644
> > --- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> > +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> > @@ -147,6 +147,7 @@ hdmi_in: endpoint {
> >  	display: panel {
> >  		backlight =3D <&backlight_dcu>;
> >  		enable-gpios =3D <&pca9554_1 3 GPIO_ACTIVE_HIGH>;
> > +		power-supply =3D <&reg_3p3v>;
> >  		status =3D "disabled";
> >
> >  		port {
> > --
> > 2.43.0
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


