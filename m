Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693082F3E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310075; cv=none; b=P2S724nmjZsxmPKQEz27lHkZBdigWxfKkbWeg3IuHtbnsaIPUGtzHJEL6wFVp0GHBJCiiMXZIlqcxAbZj8xWFOMHB7+tefbm3bwOSPfexUvmLVm1J/7JPrfPUSvG8o4HDVC0hWf+fCoXe+TxSy7zNtTgmhXY/oxVjJhA13vMGZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310075; c=relaxed/simple;
	bh=gfz+be+miVnCkzKkhkuStkjo7+lozUUXvEUiMfXaEqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYA6TuvLU0ORl1CJXr4uLq/yqZ29//4TlarujIyWpTaSLz6Fgvmt/z2JUlNnIDrnFvO6YMrii/M95pQ5/lLfovQXs3a6mLqD8xKZREikzTW3UJSQKMSP5F6sXkmSwLL4ybMTcYOsoUnDDtuFVE9QDIkOIEDU8xHDrS3qKnB3RA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94764152B;
	Tue, 22 Apr 2025 01:21:09 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6740C3F66E;
	Tue, 22 Apr 2025 01:21:13 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:21:08 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v1 1/9] coresight: tmc: Support atclk
Message-ID: <20250422082108.GB28953@e132581.arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-2-leo.yan@arm.com>
 <b409c701-f126-4e07-ba14-75280529689b@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b409c701-f126-4e07-ba14-75280529689b@arm.com>

On Thu, Apr 03, 2025 at 11:20:38AM +0530, Anshuman Khandual wrote:
> On 3/27/25 17:07, Leo Yan wrote:
> > The atclk is an optional clock for the CoreSight TMC, but the driver
> > misses to initialize it.  In most cases, the TMC shares the same atclk
> 
> TMC shares the atclk or pclk clock with other coresight components ?

I will refine the commit log for this.

[...]

> > --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> > @@ -789,6 +789,10 @@ static int __tmc_probe(struct device *dev, struct resource *res)
> >  	struct coresight_desc desc = { 0 };
> >  	struct coresight_dev_list *dev_list = NULL;
> >  
> > +	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> > +	if (IS_ERR(drvdata->atclk))
> > +		return PTR_ERR(drvdata->atclk);
> > +
> 
> Adding this check here in __tmc_probe() ensures that it gets called
> both during AMBA and platform probe methods.

Yes.

> >  /**
> >   * struct tmc_drvdata - specifics associated to an TMC component
> > + * @atclk:	optional clock for the core parts of the TMC.
> >   * @pclk:	APB clock if present, otherwise NULL
> >   * @base:	memory mapped base address for this component.
> >   * @csdev:	component vitals needed by the framework.
> > @@ -244,6 +245,7 @@ struct tmc_resrv_buf {
> >   *		 Used by ETR/ETF.
> >   */
> >  struct tmc_drvdata {
> > +	struct clk		*atclk;
> >  	struct clk		*pclk;
> >  	void __iomem		*base;
> >  	struct coresight_device	*csdev;
> 
> Otherwise, LGTM.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

Thanks for reviewing!

Leo
