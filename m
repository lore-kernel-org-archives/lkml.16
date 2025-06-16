Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0608035957;
	Mon, 16 Jun 2025 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078884; cv=none; b=VEyXdCdrfJhSGH90+jzxOudcN05ZihMvMe5CJ+3wHDNyat4KGqYHcl+tkWhsiP8wNd9h78pabwL8ZndE9IqkWEW+Tt+pS4+5eWGX4yPIcc6gladnYXax6RIssAca57Q9kx23+ANuluwF0bJ7y+RI3Soh4JQR69AEKQ5PvFiftNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078884; c=relaxed/simple;
	bh=ONuIo+AnCcXSkSvmvKqIeq1jW2aLTmVOMuS2CQ5WgbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UZw3Y758FZF//gOZY7SlOo4HiByNDnfgA5NxAhr+iX+D63LoiPg9PPiT70VE7ibNystzB+9lXU/joMy7/O31eEep/oNXOvrX6kIVMa/pnSiyshIVPKwCRtPGPv4NbOhrgW7FTvEjqxP0kkcNMv+zwFY6VSX7cVEFMzL/9Ml1pN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Nnc3/6d3; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=kjZ68fhU reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Nnc3/6d3";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="kjZ68fhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1750078880; x=1781614880;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yxALRRYScDYKnexuf1UxNeEFBeVRTJqf7bEilvpn8nY=;
  b=Nnc3/6d34MKWXyMWnXESxLwSGtqgqqr4gdEvzPaaFBuWqpXqDk0vkIPB
   ARUSy3JSb71LDoe9ll4UJlf9SlP2mo164j8nMeEhGaQTnryzpyLRTXc8t
   BmuMeSYXftv+5ut9rM8LXVYr7KdHr5/lnB4k9UQXFNBKHx0KROJ8GhJok
   qZoD7AsPQlxeoB9a/xCFx73q//S9lb71CWP3QuK3LKU0XyItmtz9H8abB
   OZH3kDFhK8vlgrgJES2BkYpnGZt1hecd2AVuaSu56EEfza5kAd55j6IZl
   Sm2sFaYZ+fu+gnabUFIO0O5xzBUFlYoyVqU3URYxSPOv9kMjs0A/GLPM3
   w==;
X-CSE-ConnectionGUID: ykC0lJx2QwyDuee7QurJag==
X-CSE-MsgGUID: nCf91h3nQ7y4VxRRpe5wIw==
X-IronPort-AV: E=Sophos;i="6.16,241,1744063200"; 
   d="scan'208";a="44660120"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 16 Jun 2025 15:01:12 +0200
X-CheckPoint: {68501597-32-28ACC837-DD1065DB}
X-MAIL-CPID: 0D78A9916BC46A124D0B2A24D9C3DCEA_2
X-Control-Analysis: str=0001.0A006378.685015AD.0055,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07815169520;
	Mon, 16 Jun 2025 15:01:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1750078867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yxALRRYScDYKnexuf1UxNeEFBeVRTJqf7bEilvpn8nY=;
	b=kjZ68fhUvFFeJkU6SrbOnINd8NZvl1oPW17GzZaKqV8t57ObVZqmWjlbhy5Z8fxOBaFHt2
	3rLF+RdsJkvr3IlFTV2uuhX4DFVS/ComS89kCpMSCwjnEE9Ey5NEOQgypbD68oqQk54VQs
	DM+h8ILls0CNse9+f3FJWp74gY0qtnppLVdo8zy8mJDHZws0sUdu9fkLAgGE6YsQXpr1jv
	Kp3NowvMt3shYe5hRzm16klR8pgp4KtYuvv5+iw5QDsMrl5wZFfGYVQUceysgxroT2dfWS
	169P/nFSXo/SwqYAW9ROBkPvwzUnMoyVfAd2tMZE8qsH4U2gJZHimViXvKsWzA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com
Subject:
 Re: [PATCH 1/1] arm64: dts: tqma8mpql-mba8mpxl-lvds: Rename overlay to
 include display name
Date: Mon, 16 Jun 2025 15:01:06 +0200
Message-ID: <2788842.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250408140856.1143290-1-alexander.stein@ew.tq-group.com>
References: <20250408140856.1143290-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Dienstag, 8. April 2025, 16:08:55 CEST schrieb Alexander Stein:
> This platform supports several displays, so rename the overlay to reflect
> the actual display being used. This also aligns the name to the other
> TQMa8M* modules.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile                        | 4 ++--
>  ...s.dtso =3D> imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso} | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename arch/arm64/boot/dts/freescale/{imx8mp-tqma8mpql-mba8mpxl-lvds.dts=
o =3D> imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso} (100%)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index 93cbd8d5081b3..38ce3d1c41c10 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -263,7 +263,7 @@ imx8mp-tqma8mpql-mba8mpxl-imx327-isp1-dtbs +=3D imx8m=
p-tqma8mpql-mba8mpxl.dtb imx8
>  imx8mp-tqma8mpql-mba8mpxl-imx327-isp2-dtbs +=3D imx8mp-tqma8mpql-mba8mpx=
l.dtb imx8mp-isp2.dtbo imx8mp-tqma8mpql-mba8mpxl-imx327.dtbo
>  imx8mp-tqma8mpql-mba8mpxl-imx327-isi1-dtbs +=3D imx8mp-tqma8mpql-mba8mpx=
l.dtb imx8mp-isi1.dtbo imx8mp-tqma8mpql-mba8mpxl-imx327.dtbo
>  imx8mp-tqma8mpql-mba8mpxl-imx415-isp1-dtbs +=3D imx8mp-tqma8mpql-mba8mpx=
l.dtb imx8mp-isp1.dtbo imx8mp-tqma8mpql-mba8mpxl-imx415.dtbo
> -imx8mp-tqma8mpql-mba8mpxl-lvds-dtbs +=3D imx8mp-tqma8mpql-mba8mpxl.dtb i=
mx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
> +imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33-dtbs +=3D imx8mp-tqma8mpql-mb=
a8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
>  imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01-dtbs +=3D imx8mp-tqma8mpql-mba8=
mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtbo
>  imx8mp-tqma8mpql-mba8mpxl-lvds-lb070wv8-dtbs +=3D imx8mp-tqma8mpql-mba8m=
pxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-lb070wv8.dtbo
>  imx8mp-tqma8mpql-mba8mpxl-ov9281-isi1-dtbs +=3D imx8mp-tqma8mpql-mba8mpx=
l.dtb  imx8mp-isi1.dtbo imx8mp-tqma8mpql-mba8mpxl-ov9281.dtbo
> @@ -277,7 +277,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl=
=2Dimx327-isp1.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl-imx327-isp2.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl-imx327-isi1.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl-imx415-isp1.dtb
> -dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl-lvds.dtb
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.d=
tb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl-lvds-lb070wv8.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl-ov9281-isi1.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds=
=2Edtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm07=
0jvhg33.dtso
> similarity index 100%
> rename from arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.=
dtso
> rename to arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm=
070jvhg33.dtso
>=20

any other feedback on this patch?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


