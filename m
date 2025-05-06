Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A0324EA8F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523129; cv=none; b=HhG/ysKTRM3Ucl/d58d0kyF2s/G3w6p13wMfGsXL1fswVGTwn5E0qhKufgIjM01PvDkipiG66exdtoVagp+i0hEEPxH6yQei0s3UjXCuq65C5o+8uVlWx4pjVsaG5OwbpMrhYdzhCjZM38OpYn8GBFLo7z6PVO9K7tlnaUmjDWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523129; c=relaxed/simple;
	bh=0Qoqu1h3JNv3RjhwbFFVwQ11InBwuXMrGYdLiROiSps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4w9R47sZ97m9I6BnUoObAq0xQO/bxVYHDG7CcFtZEfAoLNoINkP6uRTKNRQQQbS8kp6YuaQOdu4uCcl+kOrft42zS3AnQwmhafXKviYWDUoxq+KwP7JepY7+5scZy+/3S/ztiOzqkYtWvrfb2kpR6qOutK/QHIl0svutIHcrFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 004D9113E;
	Tue,  6 May 2025 02:18:38 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 427983F5A1;
	Tue,  6 May 2025 02:18:47 -0700 (PDT)
Date: Tue, 6 May 2025 10:18:41 +0100
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
Subject: Re: [PATCH v2 6/9] coresight: Avoid enable programming clock
 duplicately
Message-ID: <20250506091841.GA177796@e132581.arm.com>
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-7-leo.yan@arm.com>
 <063577a4-1530-4658-9838-934b0606e8e0@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <063577a4-1530-4658-9838-934b0606e8e0@arm.com>

Hi Anshuman,

On Fri, May 02, 2025 at 12:08:55PM +0530, Anshuman Khandual wrote:
> On 4/23/25 20:47, Leo Yan wrote:
> > The programming clock is enabled by AMBA bus driver before a dynamic
> > probe.  As a result, a CoreSight driver may redundantly enable the same
> > clock.
> 
> Are you sure AMBA bus driver always enables such clocks in all scenarios ?

Yes.  I confirmed that AMBA bus driver enables the programming clock
prior to calling CoreSight device's probes (see amba_probe()).

I checked other AMBA device drivers (e.g., drivers/dma/amba-pl08x.c)
never touch APB programming clock and the clock by default is covered
by AMAB bus driver.

> Even if that is true - why cannot coresight_get_enable_apb_pclk() ensured
> to be called only for the platform drivers cases via code re-organization,
> rather than changing the coresight_get_enable_apb_pclk() helper itself.

The purpose is to unify the clock enabling for both static probe and
dynamic (AMBA) probe.

Let us take funnel driver as an example.  With the change in this patch,
the clock operations will be consolidated in a central place
(e.g., funnel_probe()).  Therefore, we can avoid to spread the drvdata
allocation and clock operations into dynamic probe and static (platform)
probe separately.

  funnel_probe()
  {
      drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);

      drvdata->pclk = coresight_get_enable_apb_pclk();
  }

  dynamic_funnel_probe()
  {
      funnel_probe();
  }

  funnel_platform_probe()
  {
      funnel_probe();
  }

Thanks,
Leo

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
