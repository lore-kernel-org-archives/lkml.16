Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794CB24BCFB;
	Mon, 10 Feb 2025 15:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202550; cv=none; b=GYwx7HObg3DsMW/dgPLQL0RidB+Do8oRl5T5XhJegb8Aak4Ya9pY2cNlq6TtIXRPWz49YXRKF3aytkkcAhw95NEhkbqbty8/RRdmqRm9nYQV/iqETLrl+AJ68c9ibapyci115wHKVnD1LTXmZrfXeib6fam/EfGIWmSz7rWx0i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202550; c=relaxed/simple;
	bh=MfuMNL4ma4tuOTtb73c+SttAf3oWKFO53E2ZV9Y7vvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XKsEMa6W0y7EjYISjsYUdpGOJMhXOUrTqHV142Kl14HI9a/FAn6zdEYzX1sP/wDcVA7Da97NPLjJPq6iOIsfSYuZcmL77BdHm0QTQG+QXex+AAu5+V+PRxn0WT5Syk535Frp9aN5omTdfMImCjSuk/EOHkw5PRhpwoZkHa9gaJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=KQZQ/iI+; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=W6jP25cU reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="KQZQ/iI+";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="W6jP25cU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739202548; x=1770738548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pVDvbwIvnOZ4humPqCqO2awtBoUSnhumXMCo453Cge4=;
  b=KQZQ/iI+0l8Dqx4mFSbMn9SkTvq7pFtNgAlAowQ6EOUyYguyYA5Xrtkb
   qk51GB2FnpcsmmceU8IuYHCptLBnN2Kcd/EZ11LbBr8pfE+QBLXuiUKOu
   3ntEuV8REQyxRmHfjt3Il2X8DJ4TGMr9WND0nJRl/Hh27esTlS9Qwrwy0
   XKf8zMtUvRrN6f1gzzZn4MGVJ5ebkoeKFEQS3i7OTnV5rN6I5CXgGtk1+
   Y8dGvrfUW30m9vL3aNnJAhh1myPM5NgQlUWbzxHoK4rkOx3s42Jmo7I8q
   Jtj3IqksiyOV01i7LtL1f1Kx+JWSvnwn36utwFuTAJXLIIZcO/+WeQECE
   w==;
X-CSE-ConnectionGUID: H1xBE4XyRwqDrcXHSdTukA==
X-CSE-MsgGUID: THM2mKF7RlequMHpcGeCOg==
X-IronPort-AV: E=Sophos;i="6.13,274,1732575600"; 
   d="scan'208";a="41723421"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Feb 2025 16:49:02 +0100
X-CheckPoint: {67AA1FEE-1B-B8541F8F-E50F9B0E}
X-MAIL-CPID: 3596EAA376F14855D334F1E93CC1918F_2
X-Control-Analysis: str=0001.0A00636F.67AA1FF1.0017,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40786160ABD;
	Mon, 10 Feb 2025 16:48:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739202538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pVDvbwIvnOZ4humPqCqO2awtBoUSnhumXMCo453Cge4=;
	b=W6jP25cUKKQKO4dVA5Xu2nJmNQ5pXA8eVc1xaW2ifgRB1N51ZD9eXM8rz2bf4oOObaxU/m
	D4U2/6Z98BNU5DLVe272MVsorHmmyJ775GgfWtTKHieZRiyqqBi7L63YIDYQgGIj1wJxHl
	VX9HVC+/TdJqd8VRg+euR4jMk5F3ARbUtGWsu3QN5L3Zw+pUtKBk1nqpR/cnxHDmhkCNkb
	3l3AsF+bJ93WMY1QFPTEMTYppCIZPfJvEtbkm0ygDUPuaL4sIchVLSy9HQnefyIrdz6ugh
	DhaQ4/8oxxEGk+Vn/EJWvX1xINnXJ0Z1bz5xGWITg2p5t/3uK+jzigYck/1uxw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 04/10] arm64: dts: imx8mn: Add access-controller references
Date: Mon, 10 Feb 2025 16:48:56 +0100
Message-ID: <2222299.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <PAXPR04MB845912F48DC37B6BC599313888F22@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com> <8037692.EvYhyI6sBW@steina-w> <PAXPR04MB845912F48DC37B6BC599313888F22@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Montag, 10. Februar 2025, 03:36:48 CET schrieb Peng Fan:
> ********************
> Achtung externe E-Mail: =D6ffnen Sie Anh=E4nge und Links nur, wenn Sie wi=
ssen, dass diese aus einer sicheren Quelle stammen und sicher sind. Leiten =
Sie die E-Mail im Zweifelsfall zur Pr=FCfung an den IT-Helpdesk weiter.
> Attention external email: Open attachments and links only if you know tha=
t they are from a secure source and are safe. In doubt forward the email to=
 the IT-Helpdesk to check it.
> ********************
>=20
> > Subject: Re: [PATCH v2 04/10] arm64: dts: imx8mn: Add access-
> > controller references
> >=20
> > Hi Peng,
> >=20
> > Am Freitag, 7. Februar 2025, 13:02:13 CET schrieb Peng Fan:
> > > On Fri, Feb 07, 2025 at 09:36:09AM +0100, Alexander Stein wrote:
> > > >Mark ocotp as a access-controller and add references on peripherals
> > > >which can be disabled (fused).
> > >
> > > I am not sure whether gpcv2 changes should be included in this
> > > patchset or not. Just add access-controller for fused IP will not wor=
k.
> >=20
> > Well, I was able to successfully boot a i.MX8M Nano DualLite.
> >=20
> > > i.MX8M BLK-CTRL/GPC will hang if the related power domain is still
> > > touched by kernel. The pgc can't power up/down because clock is
> > gated.
> >=20
> > Well, with GPU node disabled, no one should enable the power domain.
> > But to be on the safe side I would also add access-controllers to the
> > corresponding power domains as well.
> >=20
> > > This comment also apply to i.MX8MM/P.
> >=20
> > Sure. Do you have any information what is actually disabled by those
> > fused?
> > It seems it's the IP and their power domains. Anything else?
>=20
> In NXP downstream there is a patch for  drivers/pmdomain/imx/imx8m-blk-ct=
rl.c
>=20
> soc: imx8m-blk-ctrl: Support fused modules
>    =20
>     For fused module, its pgc can't power up/down and clock is gated.
>     Because imx8m-blk-ctrl driver will pm_runtime_get_sync/pm_runtime_put
>     all power domains during suspend/resume. So we have to remove the
>     pgc and clock of fused module from blk-ctrl DTS node.
>     Update the driver to support such case.
>=20
> But this patch also needs U-Boot to update device tree nodes,
> I recalled that U-Boot will remove gpc nodes, but not update blk-ctrl nod=
es.

Does it work, if we add the access-controller as well for pgc_gpu3d
on imx8mp? There is nothing in blk-ctrl AFAICS. But for VPU there is.
Which clock needs to be removed there in case g1 is disabled?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


