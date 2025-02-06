Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6692253F0;
	Thu,  6 Feb 2025 12:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844800; cv=none; b=eZt3JlXvrX48x50sNv8KeH5EZnQ2IYwLi+Zzb67198jQ/+vtYmjieOx7PJ3bXlZ/woWE9quBkqwdwW0GUQa7+eEwcX4CIMHg+i772GdU0edvCAI4xa8Rd6kIhgUyu58WT02njpXc2BjdXc/4fdw3VJq14SGzpzO+8htgUzZEl70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844800; c=relaxed/simple;
	bh=RQyg43+Uu2hbupDUSgH3bbfuehTuytBTZhP+/VpdDjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRUGoeH23970mT0NUbbbjKIszL23+LaiUWanTyCaYPYXdczlj4x+/cXf+PxI5EuW7wBMsAOFGWJaqFXQQJ+3toYpVpD14yXWtnzaU0FOlAjqvyVql2e2CS777SScx7KndCHbnlwzcUd08uaRwIn1sLBR6PjUgbZIiWm4bVjT8os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FFE812FC;
	Thu,  6 Feb 2025 04:27:00 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FD453F63F;
	Thu,  6 Feb 2025 04:26:34 -0800 (PST)
Date: Thu, 6 Feb 2025 12:26:32 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Abel Vesa <abelvesa@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH NOT APPLY v2 4/4] clk: scmi: Support spread spectrum
Message-ID: <Z6SqeNsAqbZM8nr1@pluto>
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
 <20250205-clk-ssc-v2-4-fa73083caa92@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-clk-ssc-v2-4-fa73083caa92@nxp.com>

On Wed, Feb 05, 2025 at 05:49:54PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Support Spread Spectrum with adding scmi_clk_set_spread_spectrum
> 

Hi,

I forwarded ATG with our latest exchange on the possibility of using a
standard OEM type instead of Vendor one if it is general enough....

...waiting for their feedback on this before reviewing further...BUT
just one comment down below

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/clk-scmi.c        | 47 +++++++++++++++++++++++++++++++++++++++++--
>  include/linux/scmi_protocol.h |  6 ++++++
>  2 files changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index 15510c2ff21c0335f5cb30677343bd4ef59c0738..56b9d0166b0170807c1a83fff391033fecee2159 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -23,6 +23,7 @@ enum scmi_clk_feats {
>  	SCMI_CLK_RATE_CTRL_SUPPORTED,
>  	SCMI_CLK_PARENT_CTRL_SUPPORTED,
>  	SCMI_CLK_DUTY_CYCLE_SUPPORTED,
> +	SCMI_CLK_SSC_SUPPORTED,
>  	SCMI_CLK_FEATS_COUNT
>  };
>  
> @@ -98,6 +99,36 @@ static int scmi_clk_set_parent(struct clk_hw *hw, u8 parent_index)
>  	return scmi_proto_clk_ops->parent_set(clk->ph, clk->id, parent_index);
>  }
>  
> +static int scmi_clk_set_spread_spectrum(struct clk_hw *hw,
> +					struct clk_spread_spectrum *clk_ss)
> +{
> +	struct scmi_clk *clk = to_scmi_clk(hw);
> +	int ret;
> +	u32 val;
> +
> +	/*
> +	 * extConfigValue[7:0]   - spread percentage (%)
> +	 * extConfigValue[23:8]  - Modulation Frequency (KHz)
> +	 * extConfigValue[24]    - Enable/Disable
> +	 * extConfigValue[31:25] - Modulation method
> +	 */
> +	val = FIELD_PREP(SCMI_CLOCK_EXT_SS_PERCENTAGE_MASK, clk_ss->spreaddepth);
> +	val |= FIELD_PREP(SCMI_CLOCK_EXT_SS_MOD_FREQ_MASK, clk_ss->modfreq);
> +	val |= FIELD_PREP(SCMI_CLOCK_EXT_SS_METHOD_MASK, clk_ss->method);
> +	if (clk_ss->enable)
> +		val |= SCMI_CLOCK_EXT_SS_ENABLE_MASK;
> +	ret = scmi_proto_clk_ops->config_oem_set(clk->ph, clk->id,
> +						 SCMI_CLOCK_CFG_SSC,
> +						 val, false);
> +	if (ret)
> +		dev_warn(clk->dev,
> +			 "Failed to set spread spectrum(%u,%u,%u) for clock ID %d\n",
> +			 clk_ss->modfreq, clk_ss->spreaddepth, clk_ss->method,
> +			 clk->id);
> +
> +	return ret;
> +}
> +
>  static u8 scmi_clk_get_parent(struct clk_hw *hw)
>  {
>  	struct scmi_clk *clk = to_scmi_clk(hw);
> @@ -316,9 +347,17 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
>  		ops->set_duty_cycle = scmi_clk_set_duty_cycle;
>  	}
>  
> +	if (feats_key & BIT(SCMI_CLK_SSC_SUPPORTED))
> +		ops->set_spread_spectrum = scmi_clk_set_spread_spectrum;
> +
>  	return ops;
>  }
>  
> +static const char * const scmi_clk_imxlist[] = {
> +	"fsl,imx95",
> +	NULL
> +};
> +
>  /**
>   * scmi_clk_ops_select() - Select a proper set of clock operations
>   * @sclk: A reference to an SCMI clock descriptor
> @@ -370,8 +409,12 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
>  	if (!ci->parent_ctrl_forbidden)
>  		feats_key |= BIT(SCMI_CLK_PARENT_CTRL_SUPPORTED);
>  
> -	if (ci->extended_config)
> -		feats_key |= BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
> +	if (ci->extended_config) {
> +		if (of_machine_compatible_match(scmi_clk_imxlist))

... please NOT this also here if we use a standard OEM type :D..if it
won't be a vendor thing anymore, you should query with CONFIG_GET, OR we
should think also about adding some way in the spec to query the support
for extended configs like we do for other clock features...

Thanks,
Cristian
