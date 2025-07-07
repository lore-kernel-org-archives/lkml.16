Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9877F2620FC;
	Mon,  7 Jul 2025 05:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751865113; cv=none; b=ATvbvNzT+Cxj4uEHNInsURYUBFibZUHoZO1/awXwFA+enlnALM4kWtbclESRQOfbVKY/JufpXu9x2IKdYLueEMeUVLf424+NqRgqryHVa8fzEUA0cs2928cSQzD2yX/zlPOUlnjguqeqsITHgOnd8rwDlIaPsfPUeowm/7oxukI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751865113; c=relaxed/simple;
	bh=OdRh8/576wHjaSuIhGUDAO/d8lBtbvnSHmhlO2AG8/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A7VMU2Nn/ltKm7Vn5g6wGH5Eg5qYRrQviaA9l2Ae72U/pucV/fWA5Txf98wAJuFxeHvBwWtE0oy8vTGkNDeud8YDuMcFr8Qk/jKZk26ysW3xyOg7Bfg6mfFdFz5D5/wflaRYMpLwdKN+LNfrfUqn//7Jf9FnB/PJJOSLTFipOVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=oJgdjrJE; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Sv/Tj0oC reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="oJgdjrJE";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Sv/Tj0oC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751865110; x=1783401110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MS9l5V7rnppikpjmqzYLq+jQty7Y2WLmP6gMpwdm78Y=;
  b=oJgdjrJEQNmOdUS0QRfWoYgAamMTLEbe9PkagYP2Na3RRnoY7tAYXHhY
   b9ZQhE9d1qupiWyQrKTsSPycHYKC+mJ7He81t5qpdxK7K0X4uxtlGs1jx
   R0fxZ7pg2ChrE+FXhgqHsqfcrsqdXiWqWVEVrRSLw0ld2SVW9D9cPxfCk
   QTGy15J1SVA3EAGNkQsUqmWPog4fkEM6ijNMWvoNEH2OrmwPzdphrfY5C
   UCrHfmHQ/+9wb4zjXjcF3lS3jHKlcgEOmK42Wgz0M79XTRHdmLi5IsUW+
   OvXqpt6Xl4PYxt6/jee55FQrSEnxtYfY6rZ4XSf74RqvnDwFomyGpSr3S
   A==;
X-CSE-ConnectionGUID: cdaaUOoYQXi065uLnbbgdw==
X-CSE-MsgGUID: 0JndVCJeRv+mZnXHP+VpkA==
X-IronPort-AV: E=Sophos;i="6.16,293,1744063200"; 
   d="scan'208";a="45049649"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jul 2025 07:11:41 +0200
X-CheckPoint: {686B570C-37-4FC15ADB-CD71293B}
X-MAIL-CPID: CDEB1C0A765BD2ADCEED811366CB8CCC_0
X-Control-Analysis: str=0001.0A00639C.686B573B.0052,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D13916397D;
	Mon,  7 Jul 2025 07:11:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751865096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MS9l5V7rnppikpjmqzYLq+jQty7Y2WLmP6gMpwdm78Y=;
	b=Sv/Tj0oC82xoMR1uXwWA8qfioW3rO7wpmNR/uZgCiQmeZzZrSn2E63+UVAUlk9V0l4qJuy
	AJRxZV7EIx62zzv4zAzBSENpA1wsUn9oDEEZsXaiKPg7Io9D+oq60Smn8aUreMEuTeGxE8
	rji8rJ0gCULqQlmk2/jXlw0m7MYYPpcYXVv2/oVUm4izNYU/H6W84teDFCSAZb4BHQLJrS
	4+ZPa9rFp0rBvky/PyI9jO6eMErzxoh7QPF8/OZ/EySD/SSDhuLeDGQPDU2ouLGblBG49k
	v3AkMrqkRNWlloyKomXI2+jSQ0GnDJPMwH2CbW13e8UA9FIBK7F7l/T3ViLtlQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Mon, 07 Jul 2025 07:11:33 +0200
Message-ID: <5029548.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
References:
 <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk>
 <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
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

Am Mittwoch, 2. Juli 2025, 21:54:09 CEST schrieb Laurentiu Mihalcea:
> On 7/2/2025 9:49 PM, Mark Brown wrote:
> > On Tue, Jun 10, 2025 at 12:01:50PM -0400, Laurentiu Mihalcea wrote:
> >> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >>
> >> AIPS5 is actually AIPSTZ5 as it offers some security-related
> >> configurations. Since these configurations need to be applied before
> >> accessing any of the peripherals on the bus, it's better to make AIPST=
Z5
> >> be their parent instead of keeping AIPS5 and adding a child node for
> >> AIPSTZ5. Also, because of the security configurations, the address spa=
ce
> >> of the bus has to be changed to that of the configuration registers.
> >>
> >> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
> >> missing 'power-domains' property. The domain needs to be powered on be=
fore
> >> attempting to configure the security-related registers.
> > I'm seeing failures to probe the audio devices on the i.MX8MP Verdin
> > system in -next which seem to bisect down to this commit,  I'm seeing
> > separate boot failures on the EVK so haven't been able to confirm the
> > status there.  There's no obvious logging, the dt selftest shows:
> >
> > # not ok 141 /sound
> > # not ok 142 /sound-hdmi
> >
> > Full log at:
> >
> >   https://lava.sirena.org.uk/scheduler/job/1530197#L5119
>=20
> Hi Mark,
>=20
> Thanks for catching this!
>=20
> After browsing through the provided logs it would seem like no device und=
er the
> AIPSTZ bus gets probed. Right now, my guess is that the AIPSTZ driver is =
not being
> compiled since CONFIG_IMX_AIPSTZ might be set to 'n'.
>=20
> Which defconfig is the CI using? Is it arch/arm64/configs/defconfig?

I'm also seeing audio problems starting with this commit. In my case I get
the following error:
fsl-asoc-card sound: failed to find CPU DAI device
fsl-asoc-card sound: probe with driver fsl-asoc-card failed with error -22

DAI device is sai5 aka /soc@0/bus@30df0000/spba-bus@30c00000/sai@30c50000.
It turns out that the module snd_soc_fsl_sai is not even autoloaded. Loading
manually doesn't have any effect. So I assume starting from this commit
the subnodes (at least sai5) are not even populated.
Reverting this commit fixes my setup.
I've set CONFIG_IMX_AIPSTZ to both  'y' or 'm' and doesn't change anything.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


