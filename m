Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27CB20AF8A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743521394; cv=none; b=gxYhzwjzLSbW9ihtKQZw683S7pbVgEJM9R2VJqjrEO0a3fzMbtgXoptbGuIWqrDoCkjQ2AAwwWP5OCdM3i4Dzgd8Aws1L5BdIpRBts2CnpMECdn1qV134WSoazF8pzRHl9pMEPwnAR04kFb1TVaHU2oeU/ZdjbXU3I26E3DOScc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743521394; c=relaxed/simple;
	bh=S75cGONzrP0Lj6oXieyprst7HYFKeDFMZZ+9tKmR170=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXgEbCMrpqnnKL8inHtOAV3JodFe24G8YNCHVgusyDVBmb4yflqqDe0TOEFMo9zR9j7ju+Yw0nJz+wUg45sejMV54bKAgJOhxiCiX5gN4fuQ2t2cdX5gKGIQKgEprcUJT6lcuWedkojNynA+v8Mym2JcDmg5CT9/K6mHjbbuPt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3248714BF;
	Tue,  1 Apr 2025 08:29:54 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CED03F694;
	Tue,  1 Apr 2025 08:29:50 -0700 (PDT)
Date: Tue, 1 Apr 2025 16:29:45 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Jie Gan <quic_jiegan@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v1 9/9] coresight: Consolidate clock enabling
Message-ID: <20250401152945.GE115840@e132581.arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-10-leo.yan@arm.com>
 <b9046586-c884-484f-a308-9f256d3d99f5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9046586-c884-484f-a308-9f256d3d99f5@linaro.org>

On Tue, Apr 01, 2025 at 03:58:42PM +0100, James Clark wrote:

[...]

> >   /*
> > - * Attempt to find and enable "APB clock" for the given device
> > + * Attempt to find and enable programming clock (pclk) and trace clock (atclk)
> > + * for the given device.
> >    *
> > - * Returns:
> > + * The AMBA bus driver will cover the pclk, to avoid duplicate operations,
> > + * skip to get and enable the pclk for an AMBA device.
> >    *
> > - * clk   - Clock is found and enabled
> > - * NULL  - Clock is not needed as it is managed by the AMBA bus driver
> > - * ERROR - Clock is found but failed to enable
> > + * atclk is an optional clock, it will be only enabled when it is existed.
> > + * Otherwise, a NULL pointer will be returned to caller.
> > + *
> > + * Returns: '0' on Success; Error code otherwise.
> >    */
> > -static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
> > +static inline int coresight_get_enable_clocks(struct device *dev,
> > +					      struct clk **pclk,
> > +					      struct clk **atclk)
> 
> This function has grown a bit now, probably best to remove it from the
> header and export it instead.

Sure.  I can move this function into coresight-core.c file.

> >   {
> > -	struct clk *pclk = NULL;
> > +	WARN_ON(!pclk);
> >   	if (!dev_is_amba(dev)) {
> > -		pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > -		if (IS_ERR(pclk))
> > -			pclk = devm_clk_get_enabled(dev, "apb");
> > +		*pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > +		if (IS_ERR(*pclk))
> > +			*pclk = devm_clk_get_enabled(dev, "apb");
> > +		if (IS_ERR(*pclk))
> > +			return PTR_ERR(*pclk);
> > +	} else {
> > +		/* Don't enable pclk for an AMBA device */
> > +		*pclk = NULL;
> 
> Now the "apb" clock won't be enabled for amba devices. I'm assuming that's
> fine if the clock was always called "apb_pclk" for them, but the commit that
> added the new clock name didn't specify any special casing either.

> Can we have a comment that says it's deliberate? But the more I think about
> it the more I'm confused why CTCU needed a different clock name to be
> defined, when all the other Coresight devices use "apb_pclk".

Yes, seems to me, "apb" clock is the same thing with "apb_pclk".  As
CTCU DT binding has been merged, for backward compatible, we cannot
remove it now.

CTCU driver only supports static probe, it is never probed by AMBA bus
driver.  I think this is another reason that "apb_pclk" is not used in
CTCU driver.  I can add a comment like:

  "apb_pclk" is the default clock name used by the AMBA bus driver,
  while "apb" is used only by the CTCU driver.  A CoreSight driver
  should use "apb_pclk" as its programming clock name.

Thanks,
Leo

> >   	}
> > -	return pclk;
> > +	if (atclk) {
> > +		*atclk = devm_clk_get_optional_enabled(dev, "atclk");
> > +		if (IS_ERR(*atclk))
> > +			return PTR_ERR(*atclk);
> > +	}
> > +
> > +	return 0;
> >   }
> >   #define CORESIGHT_PIDRn(i)	(0xFE0 + ((i) * 4))
> 
