Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1C1285072
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240915; cv=none; b=OMy3+u2FX8hfmCZBMpAeMulSoMQTQYDFX0s3L7fMWODGq26nULIxYg/0tWUrNaRzH431rmvXrj9L3YxTbDXvo4ltfQWeWJ94IqQE9ticcEeIWJeRY1D5i5+aORc3S6dDYrklpVjSVHj1yi7DrZFbSbyeJl09G1hBXQxKuoGhkb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240915; c=relaxed/simple;
	bh=DM2altsLWbKvDgY6gQJv5KmHG6kW30hLCFnQZ/8hKKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k86CUj2yyRH+xQ4pm8F4sr5HWkjX787R/rYVvqfSPIFGTwW1xRUdUQwsppgVQvDnPO2zGTNqRXrYdrvemTxUgG4g2OSraGEb2q3tN3avvQaY4VD5XDb3ArFoWLfwX9XfRdNgp2qj0c1VpvvuiGseon+oofZx2oxbGyf2xinniYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vpL/eqGd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vpL/eqGd"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19B8C593;
	Wed, 18 Jun 2025 12:01:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750240899;
	bh=DM2altsLWbKvDgY6gQJv5KmHG6kW30hLCFnQZ/8hKKQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vpL/eqGdNhcN72ssAY0N8VAJLHGaCqrj/DYBnCftDbjBH4pyxg8sBaqYW92D4YvXO
	 +Yr/C4yve4ahnV7hy/7kVHYR1RHYFMNSx7AiguP1mXm7meSrflUO1u6+2sdjKnWLLK
	 RKGlurr+KX0QWr9CY9KQ8p/esiGSJH4oDOwxRA24=
Message-ID: <218ba1a0-068d-4bb2-bba2-2739afa7f470@ideasonboard.com>
Date: Wed, 18 Jun 2025 13:01:48 +0300
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
> 
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

This has a minor conflict with my cdns-dsi series, as I also add
hs_clk_rate but as u32. Also, applying both serieses,
cdns_dphy_config_from_opts() becomes odd as the hs_clk_rate will be
assigned back and forth between opts and cfg. Can you check this?

 Tomi

