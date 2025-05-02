Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564B425A2DA
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 16:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204863; cv=none; b=hzyLm7EeVldpzClJpDT1CaxkTTVzxxi1yd8B6XS+C42L70r67S+TAfQ3qc3WbpLinzipGfvSfHNuwBrOL/b8eWi94WEF4ghYE2mdxFBCznrEuOrZPZkFQb97lYIxBWZouTN8nJuYO2J6yMqHjLEqhw4F2GC7lVuBAtC4f/I0KDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204863; c=relaxed/simple;
	bh=3M12KVAiXepaMce8WCfsepjU54GrGCHwMIvFLVFLQ2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuULbq7vIIx75VHQaUoRagZekZQqQYGI3H2HKxdMOy1Jy0vp3j1Gxo517aAdnfaK5ErSAYWU8uogoNWa/Jx+1q/w5fqxX3/tqU0vgPXWm59lCePHf9yggfkCOutwbVE5UGmd+FyzleVRtZ4a5X6PdfT4Pme+jJP4RGG2FXeryFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uAteA-00065d-2h; Fri, 02 May 2025 18:53:58 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uAte9-000mLr-0c;
	Fri, 02 May 2025 18:53:57 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uAte9-00GahR-07;
	Fri, 02 May 2025 18:53:57 +0200
Date: Fri, 2 May 2025 18:53:57 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Cc: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paulk@sys-base.io, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com, sebastian.fricke@collabora.com,
	ming.qian@nxp.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 05/11] arm64: dts: imx8mp: drop gpcv2 vpu
 power-domains and clocks
Message-ID: <20250502165357.ncuve25xwvydhxz3@pengutronix.de>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
 <20250502150513.4169098-6-m.felsch@pengutronix.de>
 <CAHCN7xJ5p+dwJD7i7caqwhmrz8+gZDVeqfdWA_=He-H+aTJgRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xJ5p+dwJD7i7caqwhmrz8+gZDVeqfdWA_=He-H+aTJgRg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On 25-05-02, Adam Ford wrote:
> On Fri, May 2, 2025 at 10:10 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > The GPCv2 G1, G2 and VC8000E power-domain don't need to reference the
> > VPUMIX power-domain nor their module clocks since the power and reset
> > handling is done by the VPUMIX blkctrl driver.
> >
> It was my understanding that having this dependency ensures the order
> of the bring-up, but maybe I am wrong.  Do you know if the 8MP

If that is true, the 8MM should be broken.

> suspend-resume works properly?

No I didn't test suspend/resume.

> Should this get a fixes tag?

It's just a cleanup, therefore I didn't add the fixes-tag.

Regards,
  Marco


> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > index e0d3b8cba221..cf9b6c487bd5 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -879,24 +879,17 @@ pgc_mediamix: power-domain@10 {
> >
> >                                         pgc_vpu_g1: power-domain@11 {
> >                                                 #power-domain-cells = <0>;
> > -                                               power-domains = <&pgc_vpumix>;
> >                                                 reg = <IMX8MP_POWER_DOMAIN_VPU_G1>;
> > -                                               clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
> >                                         };
> >
> >                                         pgc_vpu_g2: power-domain@12 {
> >                                                 #power-domain-cells = <0>;
> > -                                               power-domains = <&pgc_vpumix>;
> >                                                 reg = <IMX8MP_POWER_DOMAIN_VPU_G2>;
> > -                                               clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
> > -
> >                                         };
> >
> >                                         pgc_vpu_vc8000e: power-domain@13 {
> >                                                 #power-domain-cells = <0>;
> > -                                               power-domains = <&pgc_vpumix>;
> >                                                 reg = <IMX8MP_POWER_DOMAIN_VPU_VC8000E>;
> > -                                               clocks = <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> >                                         };
> >
> >                                         pgc_hdmimix: power-domain@14 {
> > --
> > 2.39.5
> >
> >
> 
