Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7A319F480
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750759744; cv=none; b=ejIi+Ika9n8esgo1Hq9q9qQ/hM21MK0jrMFd5/YglBYIElSco+6YmnM5o1bCJpEpxwWIWd3axutwAJ+9+WeLjQlB3kWyTSpvV78RaftTemYC0417dIYcE594VPUulsG9t/Ex3rwQR18g/dCGDGE+45CKkp+gCKilXgTPahrYn9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750759744; c=relaxed/simple;
	bh=9bvfOKivrR8mbh+kFEOOOH0ZzhuJYsAMnxq+uOTd/60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TA23XiULE7yXFwI0jOO0CXo7BPy30a7pexsx9Tp15B5Wb1+NjrAv83dxTh4dcs9jAdyasbwCDB6sRjIx+BC2lqGus4kwAfeGq1qRTP+U83vLdHDSJYxGny/VAVE1ewCsCsPpiREFtAjtlVKRlTEHa08ObYxe5COJsyLujiH9aUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AD48106F;
	Tue, 24 Jun 2025 03:08:44 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C08E03F63F;
	Tue, 24 Jun 2025 03:09:01 -0700 (PDT)
Date: Tue, 24 Jun 2025 11:08:59 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/9] coresight: Consolidate clock enabling
Message-ID: <20250624100859.GM794930@e132581.arm.com>
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-7-423b3f1f241d@arm.com>
 <bb0a5725-36d0-4809-b17d-6ead7ba8d520@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb0a5725-36d0-4809-b17d-6ead7ba8d520@arm.com>

On Tue, Jun 24, 2025 at 11:14:17AM +0530, Anshuman Khandual wrote:

[...]

> > CoreSight drivers are refined so that clocks are initialized in one go.
> > As a result, driver data no longer needs to be allocated separately in
> > the static and dynamic probes.  Moved the allocation into a low-level
> > function to avoid code duplication.
> 
> But why should this change be included here in this patch that
> consolidates pclk and atclk clock initialization ? Should this
> be done in a separate patch instead ?

Good point. It indeed we can divide into two smaller patches, one is
for clock consolidations, and another patch is for refining driver data
allocation.

I will do this in next spin.

> > +/*
> > + * Attempt to find and enable programming clock (pclk) and trace clock (atclk)
> > + * for the given device.
> > + *
> > + * The AMBA bus driver will cover the pclk, to avoid duplicate operations,
> > + * skip to get and enable the pclk for an AMBA device.
> > + *
> > + * atclk is an optional clock, it will be only enabled when it is existed.
> > + * Otherwise, a NULL pointer will be returned to caller.
> > + *
> > + * Returns: '0' on Success; Error code otherwise.
> > + */
> > +int coresight_get_enable_clocks(struct device *dev, struct clk **pclk,
> > +				struct clk **atclk)
> Moving this helper function here does make sense.
> 
> > +{
> > +	WARN_ON(!pclk);
> 
> That is because pclk will be populated in all possible scenarios
> including the one assigned as NULL - hence it needs to have been
> allocated.
>  > +
> > +	if (dev_is_amba(dev)) {
> > +		/* Don't enable pclk for an AMBA device */
> > +		*pclk = NULL;
> > +	} else {
> > +		/*
> > +		 * "apb_pclk" is the default clock name for an Arm Primecell
> > +		 * peripheral, while "apb" is used only by the CTCU driver.
> > +		 *
> > +		 * For easier maintenance, CoreSight drivers should use
> > +		 * "apb_pclk" as the programming clock name.
> > +		 */
> > +		*pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > +		if (IS_ERR(*pclk))
> > +			*pclk = devm_clk_get_enabled(dev, "apb");
> > +		if (IS_ERR(*pclk))
> > +			return PTR_ERR(*pclk);
> > +	}
> > +
> > +	if (atclk) {
> 
> But an allocated atclk indicates need for atclk clock init instead.

To be clear, we strictly follow up DT binding doc, atclk clock is
always optional. For a atclk pointer:

- If atclk is NULL: the driver does not require atclk at all.
- If atclk is not NULL: the driver requires atclk optional.

> Probably a 'which all clocks' flag based approach might been better ?
> But I guess this proposal will create less code churn.

So far, CoreSight driver has a fixed requirement for clocks.

- APB clock (pclk): it is mandatory. It can be either controlled by
  AMBA bus driver or CoreSight driver.

- atclk: It is not required (CTCU) or it is optional.

Given the pattern is fixed, I don't think an extra flag would be helpful
at here. But I understand the code is not very strightforward, I will
add comments for easier understanding.

> > +		*atclk = devm_clk_get_optional_enabled(dev, "atclk");
> > +		if (IS_ERR(*atclk))
> > +			return PTR_ERR(*atclk);
> > +	}
> 
> atclk when requested - either will have a valid clock or an error
> pointer but never a NULL pointer unlike the pclk clock ?

As mentioned, atclk can be a NULL pointer - it is optional and may be
absent in the device tree binding. This is why we use the optional
variant of the clock API to initialize it. If it returns a NULL
pointer, it is tolerated by IS_ERR(*atclk), and this is considered a
successful case.

Thanks,
Leo
