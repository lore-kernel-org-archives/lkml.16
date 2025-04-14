Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341C976410;
	Mon, 14 Apr 2025 12:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744632417; cv=none; b=VjZO2YdrCAZemTMrO9rzUXFMPL9ss3VEoR0DSZnF0uxLgldBDso5QFOd/VwTn4hTtVwceFy41DAmaOpg21LQQZkyV8p5LLtYJck7LX5IrdRl3a3m/QmzSe1Y28fA8REmaXrI3NomBR1V4vm85mxyfotjQUSaE0zAF/ercXC3Yow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744632417; c=relaxed/simple;
	bh=WcLtvxpwzwPgtQtkLcpRaZQLmb6t05vi+h9aREg9uzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sL6RqLP9dqH7anHnGdmb80CARVZ2IALen70ifxnE9Nz6sgy6BcE2A/J51uINHtettTezljMYo+Nx39aIDF2+mlTB6ybc0fAuKAX8gdY3SFYay6OzWGGAGgieSWKTMcE9PB+YNbFQXDE8XVVTZ6YeIPFeMOmAcag8ZlWfU30xkBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=lg/kMsby; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Tl4qp1yp reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="lg/kMsby";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Tl4qp1yp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744632413; x=1776168413;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0qRngjH5NfK8k3qCBdkRYGMa0moa4Ms3X3uCZG/AMm0=;
  b=lg/kMsbyuGx1Ws0rHxwaJWElv9SSKX+ZYssJzZihLs/sC0bUSeJxuiKZ
   DAIKha5vbqVScW//bOIlzxHQu9PFaZUm0dKhfYerIpg7i1ryHXyP4wzCv
   rohBl1Adma6faMFv+K1wuxU9BaGA5V0FC2FCyh5f4TDapYilPvWbVzcKY
   VtE78nwM1HEjSVi7weaUirEVNoOELUCSTKSflg0I6nquaiUSmxQM0f6Co
   trKkB6ZQc6TcvazrE19OPBV/bYvfI6Kl6rTLqdcxejIKkuWUrvM0+6H3j
   R0AmSMu+5UZxfQ7EI0Oo8uznfrILv2EDFBet/mD6MBO7TzRap/GPdh0z3
   Q==;
X-CSE-ConnectionGUID: kH924yWkRCymE1jkCKaZGw==
X-CSE-MsgGUID: tgjbru6kQT2ztrblDagr2w==
X-IronPort-AV: E=Sophos;i="6.15,212,1739833200"; 
   d="scan'208";a="43513528"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 14 Apr 2025 14:06:44 +0200
X-CheckPoint: {67FCFA54-F-903EAEAC-E04C76C8}
X-MAIL-CPID: E1346D004478E871A011FAD80CD6DD9E_5
X-Control-Analysis: str=0001.0A006378.67FCFA53.003E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60C11160F74;
	Mon, 14 Apr 2025 14:06:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744632399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0qRngjH5NfK8k3qCBdkRYGMa0moa4Ms3X3uCZG/AMm0=;
	b=Tl4qp1ypBg1TFonNEIdoGASEqRt8LFOamSTfyjhS+4n69oR0qt2D3mwv0+5Jr8UlF3oi/z
	prGKl+D49I9qlAX5db8g94IB5w81Qi0OMxBymjretiwb+ihk9UAK4DnoZLmM0HBe1NXsSh
	QxPt3L5X6lX3S7v0qPIGcm2tPFMQxjo2mx+x9+IeaCDOOpOMQWYRhbYEmQGpMrKnxQ9vRh
	TFgMthFmB7TbTC4Lht3SoL1tL9Zy57kYlrRGie57ZQ63+D7+KHMfmIMwU3D8YztSbjZUAe
	XxnlRkWhTeOoMuEAFdOQ4VjtbZykuYYgxMPbwAcz5EoXEzVfcfDyYEyFP4eLfw==
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
Date: Mon, 14 Apr 2025 14:06:37 +0200
Message-ID: <2778503.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Z/kqVYPOV1Em+6H2@lizhi-Precision-Tower-5810>
References:
 <20250128211559.1582598-1-Frank.Li@nxp.com> <1970445.taCxCBeP46@steina-w>
 <Z/kqVYPOV1Em+6H2@lizhi-Precision-Tower-5810>
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

Am Freitag, 11. April 2025, 16:42:29 CEST schrieb Frank Li:
> On Fri, Apr 11, 2025 at 08:53:02AM +0200, Alexander Stein wrote:
> > Hi,
> >
> > Am Mittwoch, 9. April 2025, 16:59:21 CEST schrieb Frank Li:
> > > On Wed, Apr 09, 2025 at 12:14:48PM +0200, Alexander Stein wrote:
> > > > Hi Frank,
> > > >
> > > > Am Donnerstag, 27. M=E4rz 2025, 19:48:33 CEST schrieb Frank Li:
> > > > > [snip]
> > > > > Finially we get realtek PCI card
> > > > >
> > > > > it quite complex, there are one PCIe switch to split it to two pc=
i bus.
> > > > >
> > > > >  lspci -t
> > > > > -[0000:00]---00.0-[01-ff]----00.0-[02-04]--+-03.0-[03]----00.0
> > > > >                                            \-07.0-[04]----00.0
> > > >
> > > > Interesting. Mine looks slightly different:
> > > >
> > > > $ lspci -t
> > > > -[0000:00]---00.0-[01-ff]----00.0-[02-04]--+-01.0-[03]----00.0
> > > >                                            \-02.0-[04]----00.0
> > > >
> > > > >
> > > > >
> > > > > 0000:00:00.0 PCI bridge: Philips Semiconductors Device 0000
> > > > > 0000:01:00.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port =
PCIe x1 Gen2 Packet Switch
> > > > > 0000:02:03.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port =
PCIe x1 Gen2 Packet Switch
> > > > > 0000:02:07.0 PCI bridge: ASMedia Technology Inc. ASM1182e 2-Port =
PCIe x1 Gen2 Packet Switch
> > > >
> > > > It seems you have a newer hardware revision. I have
> > > > 0000:01:00.0 PCI bridge: Pericom Semiconductor Device a303 (rev 03)
> > > > 0000:02:01.0 PCI bridge: Pericom Semiconductor Device a303 (rev 03)
> > > > 0000:02:02.0 PCI bridge: Pericom Semiconductor Device a303 (rev 03)
> > > >
> > > > PCIe bridges.
> > > >
> > > > > 0000:03:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.=
 RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 09)
> > > > > 0000:04:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.=
 RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 09)
> > > > >
> > > > > It need below change
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm6=
4/boot/dts/freescale/imx95.dtsi
> > > > > index 9bb26b466a061..9dbf395b9a67b 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > > > @@ -1660,10 +1660,18 @@ pcie0: pcie@4c300000 {
> > > > >                         power-domains =3D <&scmi_devpd IMX95_PD_H=
SIO_TOP>;
> > > > >                         /* pcie0's Devid(BIT[7:6]) is 0x00, strea=
m id(BIT[5:0]) is 0x10~0x17 */
> > > > >                         msi-map =3D <0x0 &its 0x10 0x1>,
> > > > > -                                 <0x100 &its 0x11 0x7>;
> > > > > +                                 <0x100 &its 0x11 0x1>,
> > > > > +                                 <0x218 &its 0x12 0x1>,
> > > > > +                                 <0x238 &its 0x13 0x1>,
> > > > > +                                 <0x300 &its 0x14 0x1>,
> > > > > +                                 <0x400 &its 0x15 0x1>;
> > > > >                         iommu-map =3D <0x000 &smmu 0x10 0x1>,
> > > > > -                                   <0x100 &smmu 0x11 0x7>;
> > > > > -                       iommu-map-mask =3D <0x1ff>;
> > > > > +                                   <0x100 &smmu 0x11 0x1>,
> > > > > +                                   <0x218 &smmu 0x12 0x1>,
> > > > > +                                   <0x238 &smmu 0x13 0x1>,
> > > > > +                                   <0x300 &smmu 0x14 0x1>,
> > > > > +                                   <0x400 &smmu 0x15 0x1>;
> > > > > +                       //iommu-map-mask =3D <0x1ff>;
> > > > >                         fsl,max-link-speed =3D <3>;
> > > > >                         status =3D "disabled";
> > > > >
> > > > >
> > > > > Only 8 stream id assign to PCIe0 device, it is hard to dynamaic a=
lloce one,
> > > > > or need extra works
> > > >
> > > > Uh, this looks awefully complicated. Even worse this doesn't work on
> > > > my hardware. I need mappings for IDs 0x208 and 0x210, so I replaced=
 0x218
> > > > and 0x238 from your diff into my numbers.
> > > >
> > > > So I take that PCIe bridges are not supported properly. What would =
be
> > > > necessary to support this?
> > >
> > > I remember bridge use msi to do port power managements.
> > >
> > > ITS msi-map can distribute difference irq to difference cores beside =
iommu
> > > address protection. It is quite userful for nvme or network devices, =
which
> > > have multi queues. Of course, we need more elegant solution.
> > >
> > > My card use difference pcie switch chip. But suppose it should work a=
fter
> > > you update RID information.
> >
> > Yep, after adjusting RID mapping, it works here.
>=20
> Are you sure it work after adjusting RID mapping? you said
> "I take that PCIe bridges are not supported properly"
>=20
> So I am confused. If it works, I can think how to allocate a stream elega=
nt.

Sorry, this sounded misleading. I was referring to the current state.
Without additional adjustments PCIe bridges might not work, AFAIU.
If I adjust the RID mapping, the Ethernet hardware having 2 bridges works on
my platforms.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


