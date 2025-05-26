Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD2B1A9B3D
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748257188; cv=none; b=ZB9HqO/kAPz+YEtzvHxEaOckL0GLLxlCDftIh4lemgNKCRjnVFcoWuffQ3eerwyBEN9OyywbgxGjcHKB/Faxut8wDcndB8UVk0eg2OcDae3DfowAKKWnSAUvxM3IU8MpAoSpdN3Hqkep36zja9WD76B/kqoJyXbCGpVZ7Vo61zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748257188; c=relaxed/simple;
	bh=q6yxCtpU2w4l/R1IAq7GPag2LRpxvPgx7OCuUMUxKOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uUCQs3FH4B59bMO5jzoKdOey1i7BgXN18vd8wlIGrUmH34XAIdIf29Iah9wKnbEu+34I/dMle9sPKsuVvJ6y1Bw9MLRZNc2H9dVP+EgWHHBQT5UvBQUXcfsijHButpQDriiOhYLEERjN+eDnt7MxiwtQPp3cnZWl+j/Pe2F+tzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tTA+LL+d; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tTA+LL+d"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B62C37E6;
	Mon, 26 May 2025 12:59:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748257160;
	bh=q6yxCtpU2w4l/R1IAq7GPag2LRpxvPgx7OCuUMUxKOg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tTA+LL+dcMuDpSMYpExhHyXubdDU2SwjmunnBF5UMv4YLJot+0UFOOHjgnB3BxiMk
	 2L0IYvmFU/PJP0PyD3FzJFq1MG0OvGBVJN14Lyawz05y3Fet2gxIQBWVjZvOCx+bIu
	 2f9ms5HGZ721kcTlbf+VlQ4iGkhDJydUkKPfSnVM=
Message-ID: <b94facde-7591-41de-bc6f-b26cb46e100a@ideasonboard.com>
Date: Mon, 26 May 2025 13:59:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] phy: cadence: cdns-dphy: Fix PLL lock and
 O_CMN_READY polling
To: Devarsh Thakkar <devarsht@ti.com>
Cc: sakari.ailus@linux.intel.com, u.kleine-koenig@baylibre.com,
 vigneshr@ti.com, aradhya.bhatia@linux.dev, s-jain1@ti.com,
 r-donadkar@ti.com, vkoul@kernel.org, kishon@kernel.org, mripard@kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250502033451.2291330-1-devarsht@ti.com>
 <20250502033451.2291330-2-devarsht@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250502033451.2291330-2-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 02/05/2025 06:34, Devarsh Thakkar wrote:
> PLL lockup and O_CMN_READY assertion can only happen after common state
> machine gets enabled (by programming DPHY_CMN_SSM register), but driver was
> polling them before the common state machine was enabled. To fix this :
> 
> - Add new function callbacks for polling on PLL lock and O_CMN_READY
>   assertion.
> - As state machine and clocks get enabled in power_on callback only, move
>   the clock related programming part from configure callback to power_on
>   callback and poll for the PLL lockup and O_CMN_READY assertion after
>   state machine gets enabled.
> - The configure callback only saves the PLL configuration received from the
>   client driver which will be applied later on in power_on callback.
> - Add checks to ensure configure is called before power_on and state
>   machine is in disabled state before power_on callback is called.
> - Disable state machine in power_off so that client driver can
>   re-configure the PLL by following up a power_off, configure, power_on
>   sequence.

Is the DPHY & PLL documented in the TRM somewhere?

I just find the sequence a bit odd. For example, you wait for the PLL to
lock, and after that, you enable the PLL ref clock. Maybe I'm missing
something here, but... that should not work.

 Tomi

> Cc: stable@vger.kernel.org
> Fixes: 7a343c8bf4b5 ("phy: Add Cadence D-PHY support")
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V3:
> - Move out clock programming logic to power_on as PLL polling and enable
>   can happen only after SSM enable
> - Disable state machine on power off
> 
> V2: 
> - Return error code on polling timeout
> - Moved out calibration logic to separate patch
> 
>  drivers/phy/cadence/cdns-dphy.c | 109 +++++++++++++++++++++++++-------
>  1 file changed, 85 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/phy/cadence/cdns-dphy.c b/drivers/phy/cadence/cdns-dphy.c
> index ed87a3970f83..a94109a63788 100644
> --- a/drivers/phy/cadence/cdns-dphy.c
> +++ b/drivers/phy/cadence/cdns-dphy.c
> @@ -79,6 +79,7 @@ struct cdns_dphy_cfg {
>  	u8 pll_ipdiv;
>  	u8 pll_opdiv;
>  	u16 pll_fbdiv;
> +	u64 hs_clk_rate;
>  	unsigned int nlanes;
>  };
>  
> @@ -99,6 +100,8 @@ struct cdns_dphy_ops {
>  	void (*set_pll_cfg)(struct cdns_dphy *dphy,
>  			    const struct cdns_dphy_cfg *cfg);
>  	unsigned long (*get_wakeup_time_ns)(struct cdns_dphy *dphy);
> +	int (*wait_for_pll_lock)(struct cdns_dphy *dphy);
> +	int (*wait_for_cmn_ready)(struct cdns_dphy *dphy);
>  };
>  
>  struct cdns_dphy {
> @@ -108,6 +111,8 @@ struct cdns_dphy {
>  	struct clk *pll_ref_clk;
>  	const struct cdns_dphy_ops *ops;
>  	struct phy *phy;
> +	bool is_configured;
> +	bool is_powered;
>  };
>  
>  /* Order of bands is important since the index is the band number. */
> @@ -191,6 +196,26 @@ static unsigned long cdns_dphy_get_wakeup_time_ns(struct cdns_dphy *dphy)
>  	return dphy->ops->get_wakeup_time_ns(dphy);
>  }
>  
> +static int cdns_dphy_wait_for_pll_lock(struct cdns_dphy *dphy)
> +{
> +	int ret = 0;
> +
> +	if (dphy->ops->wait_for_pll_lock)
> +		ret = dphy->ops->wait_for_pll_lock(dphy);
> +
> +	return ret;
> +}
> +
> +static int cdns_dphy_wait_for_cmn_ready(struct cdns_dphy *dphy)
> +{
> +	int ret = 0;
> +
> +	if (dphy->ops->wait_for_cmn_ready)
> +		ret = dphy->ops->wait_for_cmn_ready(dphy);
> +
> +	return ret;
> +}
> +
>  static unsigned long cdns_dphy_ref_get_wakeup_time_ns(struct cdns_dphy *dphy)
>  {
>  	/* Default wakeup time is 800 ns (in a simulated environment). */
> @@ -232,7 +257,6 @@ static unsigned long cdns_dphy_j721e_get_wakeup_time_ns(struct cdns_dphy *dphy)
>  static void cdns_dphy_j721e_set_pll_cfg(struct cdns_dphy *dphy,
>  					const struct cdns_dphy_cfg *cfg)
>  {
> -	u32 status;
>  
>  	/*
>  	 * set the PWM and PLL Byteclk divider settings to recommended values
> @@ -249,13 +273,6 @@ static void cdns_dphy_j721e_set_pll_cfg(struct cdns_dphy *dphy,
>  
>  	writel(DPHY_TX_J721E_WIZ_LANE_RSTB,
>  	       dphy->regs + DPHY_TX_J721E_WIZ_RST_CTRL);
> -
> -	readl_poll_timeout(dphy->regs + DPHY_TX_J721E_WIZ_PLL_CTRL, status,
> -			   (status & DPHY_TX_WIZ_PLL_LOCK), 0, POLL_TIMEOUT_US);
> -
> -	readl_poll_timeout(dphy->regs + DPHY_TX_J721E_WIZ_STATUS, status,
> -			   (status & DPHY_TX_WIZ_O_CMN_READY), 0,
> -			   POLL_TIMEOUT_US);
>  }
>  
>  static void cdns_dphy_j721e_set_psm_div(struct cdns_dphy *dphy, u8 div)
> @@ -263,6 +280,23 @@ static void cdns_dphy_j721e_set_psm_div(struct cdns_dphy *dphy, u8 div)
>  	writel(div, dphy->regs + DPHY_TX_J721E_WIZ_PSM_FREQ);
>  }
>  
> +static int cdns_dphy_j721e_wait_for_pll_lock(struct cdns_dphy *dphy)
> +{
> +	u32 status;
> +
> +	return readl_poll_timeout(dphy->regs + DPHY_TX_J721E_WIZ_PLL_CTRL, status,
> +			       status & DPHY_TX_WIZ_PLL_LOCK, 0, POLL_TIMEOUT_US);
> +}
> +
> +static int cdns_dphy_j721e_wait_for_cmn_ready(struct cdns_dphy *dphy)
> +{
> +	u32 status;
> +
> +	return readl_poll_timeout(dphy->regs + DPHY_TX_J721E_WIZ_STATUS, status,
> +			       status & DPHY_TX_WIZ_O_CMN_READY, 0,
> +			       POLL_TIMEOUT_US);
> +}
> +
>  /*
>   * This is the reference implementation of DPHY hooks. Specific integration of
>   * this IP may have to re-implement some of them depending on how they decided
> @@ -278,6 +312,8 @@ static const struct cdns_dphy_ops j721e_dphy_ops = {
>  	.get_wakeup_time_ns = cdns_dphy_j721e_get_wakeup_time_ns,
>  	.set_pll_cfg = cdns_dphy_j721e_set_pll_cfg,
>  	.set_psm_div = cdns_dphy_j721e_set_psm_div,
> +	.wait_for_pll_lock = cdns_dphy_j721e_wait_for_pll_lock,
> +	.wait_for_cmn_ready = cdns_dphy_j721e_wait_for_cmn_ready,
>  };
>  
>  static int cdns_dphy_config_from_opts(struct phy *phy,
> @@ -298,6 +334,7 @@ static int cdns_dphy_config_from_opts(struct phy *phy,
>  		return ret;
>  
>  	opts->wakeup = cdns_dphy_get_wakeup_time_ns(dphy) / 1000;
> +	cfg->hs_clk_rate = opts->hs_clk_rate;
>  
>  	return 0;
>  }
> @@ -334,13 +371,23 @@ static int cdns_dphy_validate(struct phy *phy, enum phy_mode mode, int submode,
>  static int cdns_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
>  {
>  	struct cdns_dphy *dphy = phy_get_drvdata(phy);
> -	struct cdns_dphy_cfg cfg = { 0 };
> -	int ret, band_ctrl;
> -	unsigned int reg;
> +	int ret = 0;
>  
> -	ret = cdns_dphy_config_from_opts(phy, &opts->mipi_dphy, &cfg);
> -	if (ret)
> -		return ret;
> +	ret = cdns_dphy_config_from_opts(phy, &opts->mipi_dphy, &dphy->cfg);
> +	if (!ret)
> +		dphy->is_configured = true;
> +
> +	return ret;
> +}
> +
> +static int cdns_dphy_power_on(struct phy *phy)
> +{
> +	struct cdns_dphy *dphy = phy_get_drvdata(phy);
> +	int ret = 0, band_ctrl;
> +	u32 reg;
> +
> +	if (!dphy->is_configured || dphy->is_powered)
> +		return -EINVAL;
>  
>  	/*
>  	 * Configure the internal PSM clk divider so that the DPHY has a
> @@ -363,9 +410,9 @@ static int cdns_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
>  	 * Configure the DPHY PLL that will be used to generate the TX byte
>  	 * clk.
>  	 */
> -	cdns_dphy_set_pll_cfg(dphy, &cfg);
> +	cdns_dphy_set_pll_cfg(dphy, &dphy->cfg);
>  
> -	band_ctrl = cdns_dphy_tx_get_band_ctrl(opts->mipi_dphy.hs_clk_rate);
> +	band_ctrl = cdns_dphy_tx_get_band_ctrl(dphy->cfg.hs_clk_rate);
>  	if (band_ctrl < 0)
>  		return band_ctrl;
>  
> @@ -373,19 +420,26 @@ static int cdns_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
>  	      FIELD_PREP(DPHY_BAND_CFG_RIGHT_BAND, band_ctrl);
>  	writel(reg, dphy->regs + DPHY_BAND_CFG);
>  
> -	return 0;
> -}
> +	/* Start TX state machine. */
> +	writel(DPHY_CMN_SSM_EN | DPHY_CMN_TX_MODE_EN,
> +	       dphy->regs + DPHY_CMN_SSM);
>  
> -static int cdns_dphy_power_on(struct phy *phy)
> -{
> -	struct cdns_dphy *dphy = phy_get_drvdata(phy);
> +	ret = cdns_dphy_wait_for_pll_lock(dphy);
> +	if (ret) {
> +		dev_err(&dphy->phy->dev, "Failed to lock PLL with err %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = cdns_dphy_wait_for_cmn_ready(dphy);
> +	if (ret) {
> +		dev_err(&dphy->phy->dev, "O_CMN_READY signal failed to assert with err %d\n", ret);
> +		return ret;
> +	}
>  
>  	clk_prepare_enable(dphy->psm_clk);
>  	clk_prepare_enable(dphy->pll_ref_clk);
>  
> -	/* Start TX state machine. */
> -	writel(DPHY_CMN_SSM_EN | DPHY_CMN_TX_MODE_EN,
> -	       dphy->regs + DPHY_CMN_SSM);
> +	dphy->is_powered = true;
>  
>  	return 0;
>  }
> @@ -393,10 +447,17 @@ static int cdns_dphy_power_on(struct phy *phy)
>  static int cdns_dphy_power_off(struct phy *phy)
>  {
>  	struct cdns_dphy *dphy = phy_get_drvdata(phy);
> +	u32 reg;
>  
>  	clk_disable_unprepare(dphy->pll_ref_clk);
>  	clk_disable_unprepare(dphy->psm_clk);
>  
> +	/* Stop TX state machine. */
> +	reg = readl(dphy->regs + DPHY_CMN_SSM);
> +	writel(reg & ~DPHY_CMN_SSM_EN, dphy->regs + DPHY_CMN_SSM);
> +
> +	dphy->is_powered = false;
> +
>  	return 0;
>  }
>  

