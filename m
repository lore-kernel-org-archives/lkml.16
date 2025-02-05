Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D221721C9E3
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 12:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738756958; cv=none; b=CZkfgxZk+mS6WtEHEQ4er84ShaxG7B7X1mECc5cJe+y/813Fyvns79U3DnyaciZN6kZ3cT256EVNfhpekN3P8h7mYt6Sj3ADQLXHulkCVaMxxRYWjSlOn+EE4fXno46t/AlhFkoymj6FGbw9Rg7eEb7mNzV1kx8Nd4Db5iWOvOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738756958; c=relaxed/simple;
	bh=agqfF/moWRFKv9gbK1sBe2qFqcKmhT34Jw/CPToM4sU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWbcQcfF71r4Fj6/ySb+wxOW0xE/jClcjZNLpOYpOKweTFVHygjq+/22BuLNCHBLydvHgpWFvuHHuyFJUPdMMMAjIpJvEWBHH1QeRldaXysvEsTIxDy+BNoiG5Jc3zrOoGg3BCMpGT6Yo28Evhnd6jWQYHvVfWA/LLCpUD5kKLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tfe6j-0006Bx-19; Wed, 05 Feb 2025 13:02:17 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tfe6i-003d20-0M;
	Wed, 05 Feb 2025 13:02:16 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tfe6h-00FWfW-39;
	Wed, 05 Feb 2025 13:02:15 +0100
Date: Wed, 5 Feb 2025 13:02:15 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>, arm-scmi@vger.kernel.org,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] clk: Introduce clk_hw_set_spread_spectrum
Message-ID: <20250205120215.if3egfj6vbnynwl3@pengutronix.de>
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
 <20250205-clk-ssc-v2-1-fa73083caa92@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-clk-ssc-v2-1-fa73083caa92@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Hi Peng,

On 25-02-05, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add clk_hw_set_spread_spectrum to configure a clock to enable spread
> spectrum feature. set_spread_spectrum ops is added for clk drivers to
> have their own hardware specific implementation.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/clk.c            | 34 ++++++++++++++++++++++++++++++++++
>  include/linux/clk-provider.h | 32 ++++++++++++++++++++++++++++++++
>  include/linux/clk.h          | 22 ++++++++++++++++++++++
>  3 files changed, 88 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index cf7720b9172ff223d86227aad144e15375ddfd86..e11f9615e683af52c719d4c8419bd30f369f301b 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2790,6 +2790,40 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
>  }
>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
>  
> +int clk_hw_set_spread_spectrum(struct clk_hw *hw, unsigned int modfreq,
> +			       unsigned int spreaddepth, enum clk_ssc_method method,
> +			       bool enable)
> +{
> +	struct clk_spread_spectrum clk_ss;
> +	struct clk_core *core;
> +	int ret;
> +
> +	if (!hw)
> +		return 0;
> +
> +	core = hw->core;
> +
> +	clk_ss.modfreq = modfreq;
> +	clk_ss.spreaddepth = spreaddepth;
> +	clk_ss.method = method;
> +	clk_ss.enable = enable;
> +
> +	clk_prepare_lock();
> +
> +	ret = clk_pm_runtime_get(core);
> +	if (ret)
> +		goto fail;
> +
> +	if (core->ops->set_spread_spectrum)
> +		ret = core->ops->set_spread_spectrum(hw, &clk_ss);
> +
> +	clk_pm_runtime_put(core);
> +
> +fail:
> +	clk_prepare_unlock();
> +	return ret;
> +}
> +
>  /**
>   * clk_get_parent - return the parent of a clk
>   * @clk: the clk whose parent gets returned
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 2e6e603b749342931c0d0693c3e72b62c000791b..ac0270cc9ec133954b1f8dcffed015723bd1ff5d 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -84,6 +84,28 @@ struct clk_duty {
>  	unsigned int den;
>  };
>  
> +/* Aligned with dtschema/schemas/clock/clock.yaml */
> +enum clk_ssc_method {
> +	CLK_SSC_CENTER_SPREAD,
> +	CLK_SSC_UP_SPREAD,
> +	CLK_SSC_DOWN_SPREAD,
> +};
> +
> +/**
> + * struct clk_spread_spectrum - Structure encoding spread spectrum of a clock
> + *
> + * @modfreq:		Modulation frequency
> + * @spreadpercent:	Modulation percent
> + * @method:		Modulation method
> + * @enable:		Modulation enable or disable
> + */
> +struct clk_spread_spectrum {
> +	unsigned int modfreq;
> +	unsigned int spreaddepth;

Please use per mil as unit since I noticed that 0.x% is a common value
too.

Regards,
  Marco


> +	enum clk_ssc_method method;
> +	bool enable;
> +};
> +
>  /**
>   * struct clk_ops -  Callback operations for hardware clocks; these are to
>   * be provided by the clock implementation, and will be called by drivers
> @@ -178,6 +200,11 @@ struct clk_duty {
>   *		separately via calls to .set_parent and .set_rate.
>   *		Returns 0 on success, -EERROR otherwise.
>   *
> + * @set_spread_spectrum: Configure the modulation frequency, modulation percentage
> + *		and method. This callback is optional for clocks that does not
> + *		support spread spectrum feature or no need to enable this feature.
> + *		Returns 0 on success, -EERROR otherwise.
> + *
>   * @recalc_accuracy: Recalculate the accuracy of this clock. The clock accuracy
>   *		is expressed in ppb (parts per billion). The parent accuracy is
>   *		an input parameter.
> @@ -255,6 +282,8 @@ struct clk_ops {
>  	int		(*set_rate_and_parent)(struct clk_hw *hw,
>  				    unsigned long rate,
>  				    unsigned long parent_rate, u8 index);
> +	int		(*set_spread_spectrum)(struct clk_hw *hw,
> +					       struct clk_spread_spectrum *clk_ss);
>  	unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
>  					   unsigned long parent_accuracy);
>  	int		(*get_phase)(struct clk_hw *hw);
> @@ -1404,6 +1433,9 @@ void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
>  			   unsigned long *max_rate);
>  void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
>  			   unsigned long max_rate);
> +int clk_hw_set_spread_spectrum(struct clk_hw *hw, unsigned int modfreq,
> +			       unsigned int spreaddepth, enum clk_ssc_method method,
> +			       bool enable);
>  
>  static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
>  {
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index b607482ca77e987b9344c38f25ebb5c8d35c1d39..49a7f7eb8b03233e11cd3b92768896c4e45c4e7c 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -858,6 +858,21 @@ int clk_set_rate(struct clk *clk, unsigned long rate);
>   */
>  int clk_set_rate_exclusive(struct clk *clk, unsigned long rate);
>  
> +/**
> + * clk_set_spread_spectrum - set the spread spectrum for a clock
> + * @clk: clock source
> + * @modfreq: modulation freq
> + * @spreadpercent: modulation percentage
> + * @method: down spread, up spread, center spread or else
> + * @enable: enable or disable
> + *
> + * Configure the spread spectrum parameters for a clock.
> + *
> + * Returns success (0) or negative errno.
> + */
> +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
> +			    unsigned int spreadpercent, unsigned int method,
> +			    bool enable);
>  /**
>   * clk_has_parent - check if a clock is a possible parent for another
>   * @clk: clock source
> @@ -1088,6 +1103,13 @@ static inline int clk_set_rate_exclusive(struct clk *clk, unsigned long rate)
>  	return 0;
>  }
>  
> +static inline int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
> +					  unsigned int spreadpercent,
> +					  unsigned int method, bool enable)
> +{
> +	return 0;
> +}
> +
>  static inline long clk_round_rate(struct clk *clk, unsigned long rate)
>  {
>  	return 0;
> 
> -- 
> 2.37.1
> 
> 
> 
