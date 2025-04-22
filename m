Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16231F09B3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745324663; cv=none; b=M66hX2UOWjqh/NzRqzNseUxiHHLM/y8WdR+waqdMgnube0hqsUrLGZulpYAt/XbRKFCsD8uk7zbLKrKZXqMoaChN4rl8o5vGAWCuW7bd7pteWdIjBxW0r3JtlRU+FCs/ifCz5PgMQl1jCMFL/jV8kJfycKxr1omiKzy4isTygt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745324663; c=relaxed/simple;
	bh=FUiDZogOER7yzF8/Lv/KRDCXDBSNMP+t80MM4xnehwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSQorz1t7AxKi1Sjw5bC0P647vQOT9cpxjlsWeTSaXus09lRTfbAHHb9GyATPLKf4f+fb1FpAphHq7eeU/0QI/xwlVXRo8xSw9JW5xcvyT+EdLqgHfidvTojE1aLTR+WeTUcuupfWzUaciY64tSe1tDgWVj5dMMjlRSYmmOHYmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91281152B;
	Tue, 22 Apr 2025 05:24:15 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 747503F66E;
	Tue, 22 Apr 2025 05:24:19 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:24:14 +0100
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
Subject: Re: [PATCH v1 5/9] coresight: Avoid enable programming clock
 duplicately
Message-ID: <20250422122414.GE28953@e132581.arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-6-leo.yan@arm.com>
 <5a8aaa17-cc36-4e03-95b3-24c3a16dd987@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a8aaa17-cc36-4e03-95b3-24c3a16dd987@arm.com>

On Thu, Apr 03, 2025 at 12:18:56PM +0530, Anshuman Khandual wrote:
> On 3/27/25 17:07, Leo Yan wrote:
> > The programming clock is enabled by AMBA bus driver before a dynamic
> > probe.  As a result, a CoreSight driver may redundantly enable the same
> > clock.
> > 
> > To avoid this, add a check for device type and skip enabling the
> > programming clock for AMBA devices.  The returned NULL pointer will be
> > tolerated by the drivers.
> > 
> > Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  include/linux/coresight.h | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > index b888f6ed59b2..26eb4a61b992 100644
> > --- a/include/linux/coresight.h
> > +++ b/include/linux/coresight.h
> > @@ -476,15 +476,18 @@ static inline bool is_coresight_device(void __iomem *base)
> >   * Returns:
> >   *
> >   * clk   - Clock is found and enabled
> > + * NULL  - Clock is not needed as it is managed by the AMBA bus driver
> >   * ERROR - Clock is found but failed to enable
> >   */
> >  static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
> >  {
> > -	struct clk *pclk;
> > +	struct clk *pclk = NULL;
> >  
> > -	pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > -	if (IS_ERR(pclk))
> > -		pclk = devm_clk_get_enabled(dev, "apb");
> > +	if (!dev_is_amba(dev)) {
> > +		pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > +		if (IS_ERR(pclk))
> > +			pclk = devm_clk_get_enabled(dev, "apb");
> > +	}
> >  
> >  	return pclk;
> >  }
> 
> coresight_get_enable_apb_pclk() mostly gets called in the platform driver
> probe paths but they are also present in some AMBA probe paths. Hence why
> cannot the callers in AMBA probe paths get fixed instead ?

With this approach, clocking operations are different in static probe
and dynamic probe.  This causes complexity for CoreSight drivers.

After consideration, we decided to use a central place for clock
initialization.  Patch 09 follows the idea to encapsulate pclk and atclk
operations in the coresight_get_enable_clocks() function.

> Besides return
> value never gets checked for NULL, which would have to be changed as well
> if coresight_get_enable_apb_pclk() starts returning NULL values for AMBA
> devices.
> 
> 	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
> 	if (IS_ERR(drvdata->pclk))
> 		return -ENODEV;

I confirmed CoreSight drivers have used this condition, so it is safe
to return NULL pointer from coresight_get_enable_apb_pclk().

Thanks,
Leo
