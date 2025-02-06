Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BDF17A586
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835267; cv=none; b=QIIFoEoztpwejZGGrVPp8MJj6i1Z2Haxh9UjYCFKkfo5t58atv7tgpyTLPMOCsVb0x0COOtK5BnkOf5bQFxQ4NTplCL22oTvbMU9EsuqYet54RkAVHa4Gr5LEcwOb4Pm9ZEm0sNJozlXM1fJK87X39Bso0EicZULwuu0z8ZoD/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835267; c=relaxed/simple;
	bh=4hgc0MuHG5FvWdrZpFfso+UT5CtO43uqX8XMsBNTa2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMw0BLM6m89qovJAlg2SGjchEW5F7Z1+KxwqDpJ9l+YPtd16tS6iPRd/1tyInQ5ubctpWGGW9ZsJWtuS75yAKKUEiD4RW/ls1TselT78ROCJXysW+40bMF8YDYdbVrZxinJ6AJGb+YN4uDoCHihJysGbIuP4aPbGYZnJ7BHY1LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tfyTq-0008NS-9e; Thu, 06 Feb 2025 10:47:30 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tfyTp-003meg-2S;
	Thu, 06 Feb 2025 10:47:29 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tfyTp-00HMaX-21;
	Thu, 06 Feb 2025 10:47:29 +0100
Date: Thu, 6 Feb 2025 10:47:29 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/4] clk: Introduce clk_hw_set_spread_spectrum
Message-ID: <20250206094729.7ebs4ocruw6yrnxc@pengutronix.de>
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
 <20250205-clk-ssc-v2-1-fa73083caa92@nxp.com>
 <20250205120215.if3egfj6vbnynwl3@pengutronix.de>
 <PAXPR04MB8459CDBB65AE57CDE780339A88F62@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459CDBB65AE57CDE780339A88F62@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On 25-02-06, Peng Fan wrote:
> > Subject: Re: [PATCH v2 1/4] clk: Introduce
> > clk_hw_set_spread_spectrum
> > 
> > Hi Peng,
> > 
> > On 25-02-05, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Add clk_hw_set_spread_spectrum to configure a clock to enable
> > spread
> > > spectrum feature. set_spread_spectrum ops is added for clk drivers to
> > > have their own hardware specific implementation.
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/clk/clk.c            | 34 ++++++++++++++++++++++++++++++++++
> > >  include/linux/clk-provider.h | 32
> > ++++++++++++++++++++++++++++++++
> > >  include/linux/clk.h          | 22 ++++++++++++++++++++++
> > >  3 files changed, 88 insertions(+)
> > >
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c index
> > >
> > cf7720b9172ff223d86227aad144e15375ddfd86..e11f9615e683af52c7
> > 19d4c8419b
> > > d30f369f301b 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -2790,6 +2790,40 @@ int clk_set_max_rate(struct clk *clk,
> > unsigned
> > > long rate)  }  EXPORT_SYMBOL_GPL(clk_set_max_rate);
> > >
> > > +int clk_hw_set_spread_spectrum(struct clk_hw *hw, unsigned int
> > modfreq,
> > > +			       unsigned int spreaddepth, enum
> > clk_ssc_method method,
> > > +			       bool enable)
> > > +{
> > > +	struct clk_spread_spectrum clk_ss;
> > > +	struct clk_core *core;
> > > +	int ret;
> > > +
> > > +	if (!hw)
> > > +		return 0;
> > > +
> > > +	core = hw->core;
> > > +
> > > +	clk_ss.modfreq = modfreq;
> > > +	clk_ss.spreaddepth = spreaddepth;
> > > +	clk_ss.method = method;
> > > +	clk_ss.enable = enable;
> > > +
> > > +	clk_prepare_lock();
> > > +
> > > +	ret = clk_pm_runtime_get(core);
> > > +	if (ret)
> > > +		goto fail;
> > > +
> > > +	if (core->ops->set_spread_spectrum)
> > > +		ret = core->ops->set_spread_spectrum(hw, &clk_ss);
> > > +
> > > +	clk_pm_runtime_put(core);
> > > +
> > > +fail:
> > > +	clk_prepare_unlock();
> > > +	return ret;
> > > +}
> > > +
> > >  /**
> > >   * clk_get_parent - return the parent of a clk
> > >   * @clk: the clk whose parent gets returned diff --git
> > > a/include/linux/clk-provider.h b/include/linux/clk-provider.h index
> > >
> > 2e6e603b749342931c0d0693c3e72b62c000791b..ac0270cc9ec13395
> > 4b1f8dcffed0
> > > 15723bd1ff5d 100644
> > > --- a/include/linux/clk-provider.h
> > > +++ b/include/linux/clk-provider.h
> > > @@ -84,6 +84,28 @@ struct clk_duty {
> > >  	unsigned int den;
> > >  };
> > >
> > > +/* Aligned with dtschema/schemas/clock/clock.yaml */ enum
> > > +clk_ssc_method {
> > > +	CLK_SSC_CENTER_SPREAD,
> > > +	CLK_SSC_UP_SPREAD,
> > > +	CLK_SSC_DOWN_SPREAD,
> > > +};
> > > +
> > > +/**
> > > + * struct clk_spread_spectrum - Structure encoding spread spectrum
> > of
> > > +a clock
> > > + *
> > > + * @modfreq:		Modulation frequency
> > > + * @spreadpercent:	Modulation percent
> > > + * @method:		Modulation method
> > > + * @enable:		Modulation enable or disable
> > > + */
> > > +struct clk_spread_spectrum {
> > > +	unsigned int modfreq;
> > > +	unsigned int spreaddepth;
> > 
> > Please use per mil as unit since I noticed that 0.x% is a common value
> > too.
> 
> I use " The modulation depth in permyriad " in dt-schema, since
> Dario said ST chips has permyriad.

Ah okay, thanks for the explanation, this wasn't clear since also the
comment says: "Modulation percent". I wouldn't call it permyriad or
per_myriad since this unit is rather rare. Instead I would call it "basis
point" so the variable name could be 'spread_bp'. While on it, we could
rename modfreq to modfreq_hz to make it clear.

Regards,
  Marco

> 
> So change it to moddepth_per_myriad?
> 
> Thanks,
> Peng.
> 
> > 
> > Regards,
> >   Marco
> > 
> > 
> > > +	enum clk_ssc_method method;
> > > +	bool enable;
> > > +};
> > > +
> > >  /**
> > >   * struct clk_ops -  Callback operations for hardware clocks; these are
> > to
> > >   * be provided by the clock implementation, and will be called by
> > > drivers @@ -178,6 +200,11 @@ struct clk_duty {
> > >   *		separately via calls to .set_parent and .set_rate.
> > >   *		Returns 0 on success, -EERROR otherwise.
> > >   *
> > > + * @set_spread_spectrum: Configure the modulation frequency,
> > modulation percentage
> > > + *		and method. This callback is optional for clocks that
> > does not
> > > + *		support spread spectrum feature or no need to enable
> > this feature.
> > > + *		Returns 0 on success, -EERROR otherwise.
> > > + *
> > >   * @recalc_accuracy: Recalculate the accuracy of this clock. The
> > clock accuracy
> > >   *		is expressed in ppb (parts per billion). The parent
> > accuracy is
> > >   *		an input parameter.
> > > @@ -255,6 +282,8 @@ struct clk_ops {
> > >  	int		(*set_rate_and_parent)(struct clk_hw *hw,
> > >  				    unsigned long rate,
> > >  				    unsigned long parent_rate, u8
> > index);
> > > +	int		(*set_spread_spectrum)(struct clk_hw *hw,
> > > +					       struct
> > clk_spread_spectrum *clk_ss);
> > >  	unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
> > >  					   unsigned long
> > parent_accuracy);
> > >  	int		(*get_phase)(struct clk_hw *hw);
> > > @@ -1404,6 +1433,9 @@ void clk_hw_get_rate_range(struct clk_hw
> > *hw, unsigned long *min_rate,
> > >  			   unsigned long *max_rate);
> > >  void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long
> > min_rate,
> > >  			   unsigned long max_rate);
> > > +int clk_hw_set_spread_spectrum(struct clk_hw *hw, unsigned int
> > modfreq,
> > > +			       unsigned int spreaddepth, enum
> > clk_ssc_method method,
> > > +			       bool enable);
> > >
> > >  static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw
> > > *src)  { diff --git a/include/linux/clk.h b/include/linux/clk.h index
> > >
> > b607482ca77e987b9344c38f25ebb5c8d35c1d39..49a7f7eb8b03233e
> > 11cd3b927688
> > > 96c4e45c4e7c 100644
> > > --- a/include/linux/clk.h
> > > +++ b/include/linux/clk.h
> > > @@ -858,6 +858,21 @@ int clk_set_rate(struct clk *clk, unsigned
> > long rate);
> > >   */
> > >  int clk_set_rate_exclusive(struct clk *clk, unsigned long rate);
> > >
> > > +/**
> > > + * clk_set_spread_spectrum - set the spread spectrum for a clock
> > > + * @clk: clock source
> > > + * @modfreq: modulation freq
> > > + * @spreadpercent: modulation percentage
> > > + * @method: down spread, up spread, center spread or else
> > > + * @enable: enable or disable
> > > + *
> > > + * Configure the spread spectrum parameters for a clock.
> > > + *
> > > + * Returns success (0) or negative errno.
> > > + */
> > > +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
> > > +			    unsigned int spreadpercent, unsigned int
> > method,
> > > +			    bool enable);
> > >  /**
> > >   * clk_has_parent - check if a clock is a possible parent for another
> > >   * @clk: clock source
> > > @@ -1088,6 +1103,13 @@ static inline int
> > clk_set_rate_exclusive(struct clk *clk, unsigned long rate)
> > >  	return 0;
> > >  }
> > >
> > > +static inline int clk_set_spread_spectrum(struct clk *clk, unsigned
> > int modfreq,
> > > +					  unsigned int spreadpercent,
> > > +					  unsigned int method, bool
> > enable) {
> > > +	return 0;
> > > +}
> > > +
> > >  static inline long clk_round_rate(struct clk *clk, unsigned long
> > > rate)  {
> > >  	return 0;
> > >
> > > --
> > > 2.37.1
> > >
> > >
> > >
> 
