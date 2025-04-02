Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B19D235BF0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594949; cv=none; b=aj5wTW4Y+vGGvyqga8ttoqthXf58kbWHPSI96aTWP4ErDdoi4J4ouU+ogZ1oRJMdl6pFobvSJs7clu1q7nYA6a6UHs+6AntofXlu11hGPMgNoPGPhbUb6yPoer/Fyytq9ujV7c/hUzX/bKEWfhviZ33RO9yXwu8raEwWypk8s1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594949; c=relaxed/simple;
	bh=iGhjInuiPiD0DP7HTJx5NFPI1h8LtskqPtR5XYjHJYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MGtHhw5sbZ0JC5kX0j/LLRRAmA1z3oHy3bCnGYU4BZg/LuUctU++LiIfwysopqcmWsMXqAHTOZaFkbb5WmsHVPdwnr8J87+I1GCDUd5iR7Sj2W+geqKpP2FL7u/TZih4GyB+35P/kMfP3wzQTiDk2KUooXxLtGHSHOrPjIYgWkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BCjU3XgZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BCjU3XgZ"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB54CB2B;
	Wed,  2 Apr 2025 13:53:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743594833;
	bh=iGhjInuiPiD0DP7HTJx5NFPI1h8LtskqPtR5XYjHJYQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BCjU3XgZCnj4JJZsLV5kgFc2AS1M6AXm0lgqAPeJBlUdJ7inRHDw4XXNzjltAblGF
	 EYyQ8zBQD0sHU+/xpU2IV5wM6UE7TEJ5PIBN92oKBetz2V2l85cZY2FSM/uXWIRx3Z
	 sfW/2VChQu/4bbr78hx39OFxHiYgHnlok/mAdwvk=
Message-ID: <cddb8c30-c614-4fae-9cbd-f5776f930165@ideasonboard.com>
Date: Wed, 2 Apr 2025 14:55:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] phy: cadence: cdns-dphy: Fix PLL lock and
 O_CMN_READY polling
To: Devarsh Thakkar <devarsht@ti.com>, vkoul@kernel.org, kishon@kernel.org,
 mripard@kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, u.kleine-koenig@baylibre.com,
 vigneshr@ti.com, aradhya.bhatia@linux.dev, s-jain1@ti.com, r-donadkar@ti.com
References: <20250326152320.3835249-1-devarsht@ti.com>
 <20250326152320.3835249-2-devarsht@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250326152320.3835249-2-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/03/2025 17:23, Devarsh Thakkar wrote:
> PLL lockup and O_CMN_READY assertion can only happen after common state
> machine gets enabled, but driver was polling them before the common state
> machine was enabled. To fix this, add new function callbacks polling on PLL
> lock and O_CMN_READY assertion and call them only after common state
> machine gets enabled.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7a343c8bf4b5 ("phy: Add Cadence D-PHY support")
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V2:
> - Return error code on polling timeout
> - Moved out calibration logic to separate patch
> 
>   drivers/phy/cadence/cdns-dphy.c | 57 ++++++++++++++++++++++++++++-----
>   1 file changed, 49 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/cadence/cdns-dphy.c b/drivers/phy/cadence/cdns-dphy.c
> index ed87a3970f83..c4de9e4d3e93 100644
> --- a/drivers/phy/cadence/cdns-dphy.c
> +++ b/drivers/phy/cadence/cdns-dphy.c
> @@ -99,6 +99,8 @@ struct cdns_dphy_ops {
>   	void (*set_pll_cfg)(struct cdns_dphy *dphy,
>   			    const struct cdns_dphy_cfg *cfg);
>   	unsigned long (*get_wakeup_time_ns)(struct cdns_dphy *dphy);
> +	int (*wait_for_pll_lock)(struct cdns_dphy *dphy);
> +	int (*wait_for_cmn_ready)(struct cdns_dphy *dphy);
>   };
>   
>   struct cdns_dphy {
> @@ -191,6 +193,26 @@ static unsigned long cdns_dphy_get_wakeup_time_ns(struct cdns_dphy *dphy)
>   	return dphy->ops->get_wakeup_time_ns(dphy);
>   }
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
>   static unsigned long cdns_dphy_ref_get_wakeup_time_ns(struct cdns_dphy *dphy)
>   {
>   	/* Default wakeup time is 800 ns (in a simulated environment). */
> @@ -232,7 +254,6 @@ static unsigned long cdns_dphy_j721e_get_wakeup_time_ns(struct cdns_dphy *dphy)
>   static void cdns_dphy_j721e_set_pll_cfg(struct cdns_dphy *dphy,
>   					const struct cdns_dphy_cfg *cfg)
>   {
> -	u32 status;
>   
>   	/*
>   	 * set the PWM and PLL Byteclk divider settings to recommended values
> @@ -249,13 +270,6 @@ static void cdns_dphy_j721e_set_pll_cfg(struct cdns_dphy *dphy,
>   
>   	writel(DPHY_TX_J721E_WIZ_LANE_RSTB,
>   	       dphy->regs + DPHY_TX_J721E_WIZ_RST_CTRL);
> -
> -	readl_poll_timeout(dphy->regs + DPHY_TX_J721E_WIZ_PLL_CTRL, status,
> -			   (status & DPHY_TX_WIZ_PLL_LOCK), 0, POLL_TIMEOUT_US);
> -
> -	readl_poll_timeout(dphy->regs + DPHY_TX_J721E_WIZ_STATUS, status,
> -			   (status & DPHY_TX_WIZ_O_CMN_READY), 0,
> -			   POLL_TIMEOUT_US);
>   }
>   
>   static void cdns_dphy_j721e_set_psm_div(struct cdns_dphy *dphy, u8 div)
> @@ -263,6 +277,23 @@ static void cdns_dphy_j721e_set_psm_div(struct cdns_dphy *dphy, u8 div)
>   	writel(div, dphy->regs + DPHY_TX_J721E_WIZ_PSM_FREQ);
>   }
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
>   /*
>    * This is the reference implementation of DPHY hooks. Specific integration of
>    * this IP may have to re-implement some of them depending on how they decided
> @@ -278,6 +309,8 @@ static const struct cdns_dphy_ops j721e_dphy_ops = {
>   	.get_wakeup_time_ns = cdns_dphy_j721e_get_wakeup_time_ns,
>   	.set_pll_cfg = cdns_dphy_j721e_set_pll_cfg,
>   	.set_psm_div = cdns_dphy_j721e_set_psm_div,
> +	.wait_for_pll_lock = cdns_dphy_j721e_wait_for_pll_lock,
> +	.wait_for_cmn_ready = cdns_dphy_j721e_wait_for_cmn_ready,
>   };
>   
>   static int cdns_dphy_config_from_opts(struct phy *phy,
> @@ -373,6 +406,14 @@ static int cdns_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
>   	      FIELD_PREP(DPHY_BAND_CFG_RIGHT_BAND, band_ctrl);
>   	writel(reg, dphy->regs + DPHY_BAND_CFG);
>   
> +	ret = cdns_dphy_wait_for_pll_lock(dphy);
> +	if (ret)
> +		dev_err(&dphy->phy->dev, "Failed to lock PLL with err %d\n", ret);
> +
> +	ret = cdns_dphy_wait_for_cmn_ready(dphy);
> +	if (ret)
> +		dev_err(&dphy->phy->dev, "O_CMN_READY signal failed to assert with err %d\n", ret);
> +

Shouldn't these return an error? Or what's the reason these are ok (and 
if so, should the prints be dev_dbg?)

  Tomi

>   	return 0;
>   }
>   

