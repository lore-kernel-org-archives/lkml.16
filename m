Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A1E183CCA;
	Thu, 27 Mar 2025 15:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743088510; cv=none; b=Yb+dZORGoCIc/9cokarB7C9DuGkt/8/DS6X3KnIhT6vZEXUNBUa8e4qc8lBJyKbhvxRgRRWj0sL9gyfjYhvjerRynbnafEu3EiOMVKEhHPxYRDWwpJ5vWO2XjqQ42Q3kIP3iXSeOJobX55IialaIjeQhdPkNcilXOHayH14JMPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743088510; c=relaxed/simple;
	bh=5Xu+VE/XacfHrf2g/0iLLd133xAW8JqrMHN2mfv+QI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZNY5Ve3x8gNhld7iRksuDoQF1OukuRzMJ2rqheiCkDlBjSpf2KrYXhQrGw9WHwlfDxGsB6Ww7roZ3RSmG4pLMi7PFVRTuv261n+yXlXJqhmYfmEqErP4HgJh5wY8XAc8Sh58U9Hs56OMPTp4Af5oMlsp3ptC//YWiD6K2gEXj8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=lYk+IOM3; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=VE0C+Jtn reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="lYk+IOM3";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="VE0C+Jtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743088507; x=1774624507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ud+rCOovqPBYftUvAbjQR4Vh3uI8WDVAAK+bZlJ7MfQ=;
  b=lYk+IOM3rK0MjdLNw5mOnvLff72deKM25KSus5+dUPydPUGpBlvkXaH5
   bgO2N96wBcq/SlgSHwi2c4vyy5uQJfFCbQVCohmQ20f3SzvJ/ARShSa1j
   vpELms0K7Gn24dlAA9SCNsWnEXWGDH2wT0GBA4nnvsufLjFFC8wT6jR0C
   /IXoHwpf2205K1HfoPctzYFJJM+8C/vCQkwri9ieBuRWZ9Fo+OKghncXf
   6262t/ozx/XiWuRGzOYR364K61mgta5R3OUIS5H2Poj6kAqjQXouacOgV
   19LnEQkLCojCWUJSek4BZG5GLebW3YJ5yF9H2piMYifsRBnkWx+wCdDjq
   w==;
X-CSE-ConnectionGUID: CFqsMjfbRLmQsVQYGewxrQ==
X-CSE-MsgGUID: iF+iBo9FQVejDBdU/JGIvg==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43200532"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 16:15:03 +0100
X-CheckPoint: {67E56B77-9-7141A0B0-E6EDEC14}
X-MAIL-CPID: 315FAB61A1C307C00CDFAC91E8194F7C_3
X-Control-Analysis: str=0001.0A006374.67E56B63.00AC,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4516C166CAF;
	Thu, 27 Mar 2025 16:14:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743088499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ud+rCOovqPBYftUvAbjQR4Vh3uI8WDVAAK+bZlJ7MfQ=;
	b=VE0C+JtnYp/lLP9VD3bj9T1hvlCj0fchsBJeSBfLIaSZ4tJ9Tvf3N7A+xXQI0M/9nNrVRs
	ZnsK5uCtagKvB54YFNHXelkMhc1hjLM5LSSggWu8HjRBxFDHQ313xLOe7Orx3XyAvnsfj6
	5ensmTE+auns9zedGB7lP5A2gZOdrNOcRha3mjt6GUdrK68Z8LS3c1FcsEHJvsW3L1udoV
	6/nnFXspseXzYa2yhAhutU/K83YxDm9rrv2CS5hePaijSEggPjkGGFOWfIUsSQWBTsmkiM
	PBDh2qEZsNvz5Vrae1PnKubbRiBCORlJqarKhMECJQTLTRGnjrVfQ3d+Y/hgTw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] TQMLS102xA: New display overlays and small fixes
Date: Thu, 27 Mar 2025 16:14:53 +0100
Message-ID: <2223114.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Z+VmonrbclCB3zVh@lizhi-Precision-Tower-5810>
References:
 <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
 <Z+VmonrbclCB3zVh@lizhi-Precision-Tower-5810>
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

thanks for the review.

Am Donnerstag, 27. M=E4rz 2025, 15:54:26 CET schrieb Frank Li:
> On Thu, Mar 27, 2025 at 03:41:06PM +0100, Alexander Stein wrote:
> > Hi,
> >
> > this series adds several display overlays for HDMI, LVDS and RGB displa=
ys.
> > Additionally it fixes the license header and updates the sound card mod=
el
> > name similar to i.MX based platforms by TQ.
>=20
> Next time please cc imx@lists.linux.dev for layerscape platform change.

I only followed the entries from get_maintainer.pl. Would you mind adding
arch/arm/boot/dts/nxp/ls to MAINTAINERS?

Thanks and best regards,
Alexander

> Frank
> >
> > Best regards,
> > Alexander
> >
> > Alexander Stein (7):
> >   ARM: dts: ls1021a-tqmals1021a: Fix license
> >   ARM: dts: ls1021a-tqmals1021a: Add vcc-supply for spi-nor
> >   ARM: dts: ls1021a-tqmals1021a: Add HDMI overlay
> >   ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay for Tianma TM070JVGH33
> >   ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech FC21 RGB display
> >   ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech DC44 RGB display
> >   ARM: dts: ls1021a-tqmals1021a: change sound card model name
> >
> >  arch/arm/boot/dts/nxp/ls/Makefile             |  9 +++
> >  .../ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso | 32 +++++++++++
> >  ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 47 ++++++++++++++++
> >  ...-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso | 55 ++++++++++++++++++
> >  ...-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso | 56 +++++++++++++++++++
> >  .../nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts   |  5 +-
> >  .../boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi   |  3 +-
> >  7 files changed, 204 insertions(+), 3 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls102=
1a-hdmi.dtso
> >  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls102=
1a-lvds-tm070jvhg33.dtso
> >  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls102=
1a-rgb-cdtech-dc44.dtso
> >  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls102=
1a-rgb-cdtech-fc21.dtso
> >
> > --
> > 2.43.0
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


