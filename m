Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FB2801;
	Wed, 11 Jun 2025 07:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749625269; cv=none; b=u1bWUOgx3aYvdhiH6UaPFRNnIvjxWyI7Ec4D8dq++Me6NeJedq0sGWMCDMufYKZsx1hZnUM/6yp/fxKy8jKzO/O1LOShd7Uisp4AzNBoj4c5V67yuXTB9O3ZNoAQFAFQOmBWqogByeLsadp3mhE+lQEe74QFCfknviNrbbGZPBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749625269; c=relaxed/simple;
	bh=uLQDwJB/urYyPbeL9ZhxsxsU9KjYS3PXOlljJwleSZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHCAAwZff7xQXSNcgGzuAxmO7LC2jB1QB96igvGWxD6NMxmJCWBvKQbgeK82e1TvquO0IVFy6k6+gaOg+Z/6+3mDEvge3aBDUXoiEnvKN8O346cTMMJdIjaZVhZYr5f09PsjYMO5RnGtUAK0KVjDy7V0IdMEkvjHSThURAfFplg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=eQx2s46S; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="eQx2s46S"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90F2C1485657;
	Wed, 11 Jun 2025 09:00:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1749625258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y9+jn47auQ8C9viZG2l85GSY3kGgdeG6PFjEMxhDHHU=;
	b=eQx2s46SHQCZ0jYl8XxIcc+yhUFyAF0jkOaw9RpQ0IBXzyKuKkHuo3Wa4E+Jhsw8yDZs2F
	n44T2u0fL6S1PDj072QY5sywdaYuL4nvzeO/6cbJPdcjdFh2ik+0ZOYdkyOG+ctPqpukS4
	ATXTH8/mkxkfKZGFch4xvNbmKCX5gJ5nVGm/4vd1k4J1Jlb9WK/Z8/Ub92BOVx7IsPcc0q
	vOqRMogCAoQPEkpzdBe9QMb0zXr7fR8s9KsiXQ3tY2RTassBnOptivN1X1eJGwrn1HP+1q
	nZCxQI+eajprNS5pMgEXFnL2LWQu24GCojcK9voBxIux+aWbz3+Gd7v5ISPRAw==
Date: Wed, 11 Jun 2025 09:00:51 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Alexander Dahl <ada@thorsis.com>, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8dxl-ss-conn: Disable USB3 nodes
Message-ID: <20250611-unread-other-a559c3b98494@thorsis.com>
Mail-Followup-To: Frank Li <Frank.li@nxp.com>, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20250610060756.8212-1-ada@thorsis.com>
 <aEhQfvmJMf/SyGmK@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEhQfvmJMf/SyGmK@lizhi-Precision-Tower-5810>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Frank,

thanks for reviewing.

Am Tue, Jun 10, 2025 at 11:34:22AM -0400 schrieb Frank Li:
> On Tue, Jun 10, 2025 at 08:07:56AM +0200, Alexander Dahl wrote:
> > The i.MX 8DualXLite/8SoloXLite has a different connectivity memory map
> > than the generic i.MX8 has.  One conflicting resource is usb, where the
> > imx8dxl has a second usb2 phy @5b110000, while the generic imx8 dtsi has
> > one usb2 phy and one usb3 phy, and the usb3otg @5b110000.  When
> > including both imx8dxl-ss-conn.dtsi and imx8-ss-conn.dtsi as done in
> > imx8dxl.dtsi this leads to a duplicate unit-address warning.
> >
> > The usb3otg node was introduced after the initial imx8dxl support with
> > commit a8bd7f155126 ("arm64: dts: imx8qxp: add cadence usb3 support")
> > and since then leads to warnings like this (when building with ptxdist):
> >
> >     CPP generic/platform-v8a/build-target/linux-6.12/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> >     DTC generic/platform-v8a/packages/linux-6.12/boot/imx8dxl-evk.dtb
> >     /home/adahl/Work/bsp/thorsis/generic/platform-v8a/build-target/linux-6.12/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi:148.24-182.4: Warning (unique_unit_address): /bus@5b000000/usb@5b110000: duplicate unit-address (also used in node /bus@5b000000/usbphy@5b110000)
> 
> why linux-6.12? maybe just your directory name. trim down
> "generic/platform-v8a/build-target/linux-6.12/" just keep kernel's related
> patch here.

Yes, just my directory name.  Sorry about that.
Same happens when building recent v6.16-rc1 or master.

> what command do you use? I have not met this warning.

This is ptxdist [1] building dtb files with its own recipe, not going
through kernel's make dtbs.  I could reproduce it on a clean kernel
tree however like this (with PATH and ARCH=arm64 set):

    make defconfig
    make W=2 dtbs

Output (stripped) is this in that case:

      DTC     arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb
    …/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi:148.24-182.4: Warning (unique_unit_address): /bus@5b000000/usb@5b110000: duplicate unit-address (also used in node /bus@5b000000/usbphy@5b110000)
    …/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi:52.23-81.4: Warning (unique_unit_address): /bus@5f000000/pcie@5f010000: duplicate unit-address (also used in node /bus@5f000000/pcie-ep@5f010000)
      also defined at …/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi:41.23-50.4
      also defined at …/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts:645.8-653.3

These warnings do not show up with W=1.

So why do I get this?  kernel build calls dtc with
-Wno-unique_unit_address or not depending on warning level.
ptxdist does not call dtc with that option, so those warnings are not
silenced (details for the curious at [2]).

Do we fix issues coming up with W=2?
If yes I would adapt the commit message and send a v2.

Greets
Alex

[1] https://www.ptxdist.org/
[2] https://git.pengutronix.de/cgit/ptxdist/tree/scripts/lib/ptxd_make_world_dtb.sh
