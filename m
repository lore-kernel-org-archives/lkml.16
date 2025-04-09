Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D74E25A2DC;
	Wed,  9 Apr 2025 10:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744193703; cv=none; b=VzorYc8izLf4X/bYNnnw7J4AdGbEQdhx7BjkDmptccQ8stQMLn9T+VMMZP67FaK2/Eft1joSvWYKOtobc6JTLRKhuEOMrsbQJim9Kl6xqOnT8aqauYoUvyRowOb0/hAjPTjwActaQXrJ94Ulm3dmgzAmJqE8o+sqSJtDBRD4qro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744193703; c=relaxed/simple;
	bh=Wro90VfYL3b5j7TbNKN81Xu/BV5HuwqQ7RbveyBWuXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R19O9Rg4GWlPw0SatFkB82XdkU/z2LKTOlt9EpeRsrnfA2OFShyGg54JYGFjrKknAiszq26b27VQfltrJnqSEnIFpIQBD/eMXNlvB540h2UQXpSjtAIlAD7laNzBJMtMdVRG8jzBLKpn6HvlRjnwbWkJmFaDWymGAAMnia1k9IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=T+zpQimh; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=U5co9zDH reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="T+zpQimh";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="U5co9zDH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744193698; x=1775729698;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BNoNE6e64sEYfFsroSfsCY8QuIvX813ZAxY1wFGvAfs=;
  b=T+zpQimh7RJ4+BqmTQBXiIZxRCB852eTKHJjZwAneooHbdMdUIjiZqhR
   8oIGOTBJICzfc14e+ByxKw50IUyHQA/Kvfvr5801VRp0pA9YCn+f2NSqV
   YPJFeo0W53YJ2te1FVYQQEIUuivB9SUZSgNeu3QW6JpZf2ZxnhVdmCcQA
   OKOz04ilJc7yqh1lA/p+OvnIGjHV5gMpv5iWiAue5tJEITCwn4932sSjw
   wN2Wp8JrBTAoIGy1aq+Rfv44evD/rFkDcZxoPnCNfrLpKPkyaz8DjS+Ym
   UqFrpG7NoZQ1+papy14qIHLgvOXiBsaXLakX2LWUY/Sa3vIm9jYIvpImB
   w==;
X-CSE-ConnectionGUID: QsBY5tYfRvO4jvFCFUdRaw==
X-CSE-MsgGUID: aXOJ8JttQUS4xI0EqVv4JA==
X-IronPort-AV: E=Sophos;i="6.15,200,1739833200"; 
   d="scan'208";a="43425758"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Apr 2025 12:14:55 +0200
X-CheckPoint: {67F6489F-13-7141A0B0-E6EDEC14}
X-MAIL-CPID: AD203921DB3D5B5D91448C1600452817_3
X-Control-Analysis: str=0001.0A006371.67F6489C.0095,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4929164F85;
	Wed,  9 Apr 2025 12:14:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744193690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BNoNE6e64sEYfFsroSfsCY8QuIvX813ZAxY1wFGvAfs=;
	b=U5co9zDHmUiL4PoV2Bj2nlNzBH5Iw4uyo0kqMS2d6jtR4Z5RRyNUgOHxnyq53EzUGy9Hs1
	X1kpcaOShYEFlPCqXOlvyCdjzA0qcaogFMx4vIRjMzJo9cHvrvkqqGl02d3U5f7d16MQGQ
	UL5wPE6Zjx4+f34EB7abO0z0TGl1JdUWax3kcWhx7AUrgNe9NX0QqF9Iq2mApQgzjqOw+I
	mX+nEs5xCCxaSughpJRy4a4v4gDxI+Z0XZQrSLD2z2RED29IdYaENPyjIF3ueEvZpBa0H0
	6uNRtF3XLiaBKXoVOiaocRtSUeM74EPUb6/tPFMBPxvEdEBKrtSyw5IQdgMjQw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, hongxing.zhu@nxp.com
Subject:
 Re: [PATCH 4/5] arm64: dts: imx95: add PCIe's msi-map and iommu-map property
Date: Wed, 09 Apr 2025 12:14:48 +0200
Message-ID: <10643619.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Z+WdgWQo4dbPG5tP@lizhi-Precision-Tower-5810>
References:
 <20250128211559.1582598-1-Frank.Li@nxp.com>
 <Z8HuU6ULEN756lyr@lizhi-Precision-Tower-5810>
 <Z+WdgWQo4dbPG5tP@lizhi-Precision-Tower-5810>
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

Am Donnerstag, 27. M=E4rz 2025, 19:48:33 CEST schrieb Frank Li:
> [snip]
> Finially we get realtek PCI card
>=20
> it quite complex, there are one PCIe switch to split it to two pci bus.
>=20
>  lspci -t
> -[0000:00]---00.0-[01-ff]----00.0-[02-04]--+-03.0-[03]----00.0
>                                            \-07.0-[04]----00.0

Interesting. Mine looks slightly different:

$ lspci -t
=2D[0000:00]---00.0-[01-ff]----00.0-[02-04]--+-01.0-[03]----00.0
                                           \-02.0-[04]----00.0

>=20
>=20
> 0000:00:00.0 PCI bridge: Philips Semiconductors Device 0000
> 0000:01:00.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port PCIe x1 =
Gen2 Packet Switch
> 0000:02:03.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port PCIe x1 =
Gen2 Packet Switch
> 0000:02:07.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port PCIe x1 =
Gen2 Packet Switch

It seems you have a newer hardware revision. I have
0000:01:00.0 PCI bridge: Pericom Semiconductor Device a303 (rev 03)
0000:02:01.0 PCI bridge: Pericom Semiconductor Device a303 (rev 03)
0000:02:02.0 PCI bridge: Pericom Semiconductor Device a303 (rev 03)

PCIe bridges.

> 0000:03:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111=
/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 09)
> 0000:04:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111=
/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 09)
>=20
> It need below change
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index 9bb26b466a061..9dbf395b9a67b 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1660,10 +1660,18 @@ pcie0: pcie@4c300000 {
>                         power-domains =3D <&scmi_devpd IMX95_PD_HSIO_TOP>;
>                         /* pcie0's Devid(BIT[7:6]) is 0x00, stream id(BIT=
[5:0]) is 0x10~0x17 */
>                         msi-map =3D <0x0 &its 0x10 0x1>,
> -                                 <0x100 &its 0x11 0x7>;
> +                                 <0x100 &its 0x11 0x1>,
> +                                 <0x218 &its 0x12 0x1>,
> +                                 <0x238 &its 0x13 0x1>,
> +                                 <0x300 &its 0x14 0x1>,
> +                                 <0x400 &its 0x15 0x1>;
>                         iommu-map =3D <0x000 &smmu 0x10 0x1>,
> -                                   <0x100 &smmu 0x11 0x7>;
> -                       iommu-map-mask =3D <0x1ff>;
> +                                   <0x100 &smmu 0x11 0x1>,
> +                                   <0x218 &smmu 0x12 0x1>,
> +                                   <0x238 &smmu 0x13 0x1>,
> +                                   <0x300 &smmu 0x14 0x1>,
> +                                   <0x400 &smmu 0x15 0x1>;
> +                       //iommu-map-mask =3D <0x1ff>;
>                         fsl,max-link-speed =3D <3>;
>                         status =3D "disabled";
>=20
>=20
> Only 8 stream id assign to PCIe0 device, it is hard to dynamaic alloce on=
e,
> or need extra works

Uh, this looks awefully complicated. Even worse this doesn't work on
my hardware. I need mappings for IDs 0x208 and 0x210, so I replaced 0x218
and 0x238 from your diff into my numbers.

So I take that PCIe bridges are not supported properly. What would be
necessary to support this?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


