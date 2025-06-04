Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4B0139B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 06:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749020098; cv=none; b=c7V1JBonXWEuo2kv71YNzc3O29Rr13xJxjyhx8kaJx9EUKCcsLnuHL71MxOmKvxbBjcS3p6fPsU4VxYB1HhP0mY0s7iv3YvStbB0VvLE6+yS6nZn0EBn2wqcAbHniNFUPEvIbVYjXrAeeLe52NAJ/FJHyaYtYIeTFV4mI1FvfwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749020098; c=relaxed/simple;
	bh=4gB+hVpOJCVGHr2cqDf7rYK+pcqrOIKH3M5jL4MbFgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqaWUGIJVoxYuCVo+iyqGs3zS6gsfPMvgUnpQ5wcYW0I6Sx25TJbSmSWg6pBlIfjOkIudaZnbk6XCnpBUdqVLThH1JhNUROOjK/5egX5o04v4mVw5TJs++NzLNyCmEZVdle6bO992RNMJlOCBPYqoLETT3ppCvwd3oI4uiTZxo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uMi1D-0001En-I2; Wed, 04 Jun 2025 08:54:35 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uMi1D-001kRj-0o;
	Wed, 04 Jun 2025 08:54:35 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uMi1D-00AV4Z-0E;
	Wed, 04 Jun 2025 08:54:35 +0200
Date: Wed, 4 Jun 2025 08:54:35 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: imx8mp: Configure VPU clocks for
 overdrive
Message-ID: <20250604065435.nl3l6h3wxrwstswl@pengutronix.de>
References: <20250530221713.54804-1-aford173@gmail.com>
 <20250530221713.54804-5-aford173@gmail.com>
 <20250601183620.npuicmipv6kv54z6@pengutronix.de>
 <CAHCN7xKjEt3rq4VUOSSTqcT4SyWxSCPLHGf6jR6KVHvor5wfKQ@mail.gmail.com>
 <CAHCN7xLr-7YQ9P8022g3SNPVgfQcEU8rSzZ-grMMom8kLm6e0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xLr-7YQ9P8022g3SNPVgfQcEU8rSzZ-grMMom8kLm6e0Q@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On 25-06-03, Adam Ford wrote:
> On Mon, Jun 2, 2025 at 10:35 AM Adam Ford <aford173@gmail.com> wrote:
> >
> > On Sun, Jun 1, 2025 at 1:36 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > >
> > > Hi Adam,
> > >
> > > thanks for the patch.
> > >
> > > On 25-05-30, Adam Ford wrote:
> > > > The defaults for this SoC are configured for overdrive mode, but
> > > > the VPU clocks are currently configured for nominal mode.
> > > > Increase VPU_G1_CLK_ROOT to 800MHZ from 600MHz,
> > > > Increase VPU_G2_CLK_ROOT to 700MHZ from 500MHz, and
> > > > Increase VPU_BUS_CLK_ROOT to 800MHz from 600MHz.
> > > >
> > > > This requires adjusting the clock parents. Since there is already
> > > > 800MHz clock references, move the VPU_BUS and G1 clocks to it.
> > > > This frees up the VPU_PLL to be configured at 700MHz to run
> > > > the G2 clock at 700MHz.
> > > >
> > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++------
> > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > index 909555a5da4b..848b25c9b752 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > @@ -2256,8 +2256,8 @@ vpu_g1: video-codec@38300000 {
> > > >                       interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > > >                       clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
> > > >                       assigned-clocks = <&clk IMX8MP_CLK_VPU_G1>;
> > > > -                     assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
> > > > -                     assigned-clock-rates = <600000000>;
> > > > +                     assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
> > > > +                     assigned-clock-rates = <800000000>;
> > > >                       power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G1>;
> > > >               };
> > > >
> > > > @@ -2267,8 +2267,8 @@ vpu_g2: video-codec@38310000 {
> > > >                       interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> > > >                       clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
> > > >                       assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>;
> > > > -                     assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
> > > > -                     assigned-clock-rates = <500000000>;
> > > > +                     assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
> > > > +                     assigned-clock-rates = <700000000>;
> > > >                       power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G2>;
> > > >               };
> > > >
> > > > @@ -2284,8 +2284,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> > > >                                <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> > > >                       clock-names = "g1", "g2", "vc8000e";
> > > >                       assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
> > > > -                     assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
> > > > -                     assigned-clock-rates = <600000000>, <600000000>;
> > > > +                     assigned-clock-parents = <0>, <&clk IMX8MP_SYS_PLL1_800M>;
> > > > +                     assigned-clock-rates = <700000000>, <800000000>;
> > >
> > > I think we can drop the "assigned-clocks = <&clk IMX8MP_VPU_PLL>" part
> > > completely.
> > >
> > > Before your patch the IMX8MP_VPU_PLL_OUT was used as clock-parent for
> > > the IMX8MP_CLK_VPU_BUS. With yout patch IMX8MP_SYS_PLL1_800M is used.
> >
> > I think you're right.  I'll fix that up and do a V2.  I forgot to add
> > my own s-o-b tag, so I'll fix that too.  I'll try to do it this week.
> 
> Marco,
> 
> I tried removing the assigned-clock references to the IMX8MP_VPU_PLL,
> but i found the defaul speed was 800MHz for the PLL even when asking
> G2 to be 700MHz.  The only way that I found to set the G2 to 700MHz
> was to set the VPU_PLL to 700MHz.  I can do that either inside the G2
> node or the vpumix_blk_ctrl node. I generally like to have the
> blk_ctrl do it since it controls the G1_ROOT and G2_ROOT clocks, but
> it doesn't seem to hurt it being inside the G2 node either.  I can see
> the argument for having it insde the G2 node, since the G2 clock is
> what's requiring the VPU_PLL to be 700MHz.
> 
> Let me know your preferences, and I'll move forward accordingly.

Hi Adam,

thanks for testing. IMHO we should do the clock handling within the G2
node. This requires no comments because the code would be obvious else
you need to comment the setup of the IMX8MP_VPU_PLL within the
vpumix_blk_ctrl node because this is not obvious.

Regards,
  Marco
