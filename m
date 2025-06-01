Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBAA1F1512
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 18:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748803015; cv=none; b=hyWLkBkvkhKY3TLIGLchl5uDIxCPhtCAdmVuG8Xz4BOX012cYXBjD3zk3TSaRb3X8I3/79BVk30W3Ogz+WB/sZt84My6R2II4r3dYa/ADT07U29glR0iGjqKogIEw/o/dxKR70ZL9Wyu5k4Z9CA2IQ4CsX3AKi8pmQWBLC7+eN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748803015; c=relaxed/simple;
	bh=qB68moaf2z4UHO5qciY2ecC4TUzkvVRoY3kaZnwYhpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fGcBcTV0SP29JXvrrE8e832b507dMiMIooBifuT3JtZRViHAxtd8EX//8LtdrNnj529LocDO1b+DV+9YdZPgCjA/bCgK7C4VljgpayBwH6nF1z6kDDRuyTqgF3WnxqOgwRCMAazJD10GpiKwauTfH+FoZ0zz2Yn18bzBDS0jzrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uLnXh-0000Ae-4Q; Sun, 01 Jun 2025 20:36:21 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uLnXg-001KWO-1K;
	Sun, 01 Jun 2025 20:36:20 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uLnXg-004iLc-0o;
	Sun, 01 Jun 2025 20:36:20 +0200
Date: Sun, 1 Jun 2025 20:36:20 +0200
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
Message-ID: <20250601183620.npuicmipv6kv54z6@pengutronix.de>
References: <20250530221713.54804-1-aford173@gmail.com>
 <20250530221713.54804-5-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530221713.54804-5-aford173@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Hi Adam,

thanks for the patch.

On 25-05-30, Adam Ford wrote:
> The defaults for this SoC are configured for overdrive mode, but
> the VPU clocks are currently configured for nominal mode.
> Increase VPU_G1_CLK_ROOT to 800MHZ from 600MHz,
> Increase VPU_G2_CLK_ROOT to 700MHZ from 500MHz, and
> Increase VPU_BUS_CLK_ROOT to 800MHz from 600MHz.
> 
> This requires adjusting the clock parents. Since there is already
> 800MHz clock references, move the VPU_BUS and G1 clocks to it.
> This frees up the VPU_PLL to be configured at 700MHz to run
> the G2 clock at 700MHz.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index 909555a5da4b..848b25c9b752 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -2256,8 +2256,8 @@ vpu_g1: video-codec@38300000 {
>  			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
>  			assigned-clocks = <&clk IMX8MP_CLK_VPU_G1>;
> -			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
> -			assigned-clock-rates = <600000000>;
> +			assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
> +			assigned-clock-rates = <800000000>;
>  			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G1>;
>  		};
>  
> @@ -2267,8 +2267,8 @@ vpu_g2: video-codec@38310000 {
>  			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
>  			assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>;
> -			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
> -			assigned-clock-rates = <500000000>;
> +			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
> +			assigned-clock-rates = <700000000>;
>  			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G2>;
>  		};
>  
> @@ -2284,8 +2284,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
>  				 <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
>  			clock-names = "g1", "g2", "vc8000e";
>  			assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
> -			assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
> -			assigned-clock-rates = <600000000>, <600000000>;
> +			assigned-clock-parents = <0>, <&clk IMX8MP_SYS_PLL1_800M>;
> +			assigned-clock-rates = <700000000>, <800000000>;

I think we can drop the "assigned-clocks = <&clk IMX8MP_VPU_PLL>" part
completely.

Before your patch the IMX8MP_VPU_PLL_OUT was used as clock-parent for
the IMX8MP_CLK_VPU_BUS. With yout patch IMX8MP_SYS_PLL1_800M is used.

Regards,
  Marco
