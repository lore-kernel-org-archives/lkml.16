Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B319E56A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745313676; cv=none; b=p0cmuVniPVswxNpK9M7kNTqsV57MbC7SlTzdLPTsPxEFRjmMU+5kiQzIx+92y2piyFpEeyjcxVaE/RByqkPDWtIs/93ScpSCJh10vwod9KHTmMlIQpFywaucG/G3MZL2fqNh/ItctYru8aatubHm2TVJ9lSjKmshsXpw6lKwJns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745313676; c=relaxed/simple;
	bh=CaPUPBto2TK7JH6QlfJ4aRRREIMXKvac2Kcpnoc280c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxwYD7vWvABNIORmycSXy4riyH7PHatD+znf+opXTfl18Nq0acR6tX9b3hPI4dQdNQFj0hNyYvl3q45erOZvv+S1EjtHUGpgsjRBIRnkC1EVJFwUXUeE8vqALkRvVAqj2f3qTTy3Lckqb1Va4J7rdXVEyIy08f7kCiJFhWkgZLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E99BC152B;
	Tue, 22 Apr 2025 02:21:08 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C22443F5A1;
	Tue, 22 Apr 2025 02:21:12 -0700 (PDT)
Date: Tue, 22 Apr 2025 10:21:07 +0100
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
Subject: Re: [PATCH v1 7/9] coresight: Make clock sequence consistent
Message-ID: <20250422092107.GC28953@e132581.arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-8-leo.yan@arm.com>
 <d94c6f97-4ca8-4a3a-ae8a-8e872eaa8d3b@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d94c6f97-4ca8-4a3a-ae8a-8e872eaa8d3b@arm.com>

On Thu, Apr 03, 2025 at 12:40:39PM +0530, Anshuman Khandual wrote:
> On 3/27/25 17:08, Leo Yan wrote:
> > Since atclk is enabled after pclk during the probe phase, this commit
> > maintains the same sequence for the runtime resume flow.
> > 
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  drivers/hwtracing/coresight/coresight-funnel.c     | 6 +++---
> >  drivers/hwtracing/coresight/coresight-replicator.c | 6 +++---
> >  drivers/hwtracing/coresight/coresight-stm.c        | 6 +++---
> >  drivers/hwtracing/coresight/coresight-tpiu.c       | 6 +++---
> >  4 files changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> > index ec6d3e656548..e378c2fffca9 100644
> > --- a/drivers/hwtracing/coresight/coresight-funnel.c
> > +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> > @@ -299,11 +299,11 @@ static int funnel_runtime_resume(struct device *dev)
> >  {
> >  	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
> >  
> > -	if (drvdata && !IS_ERR(drvdata->atclk))
> > -		clk_prepare_enable(drvdata->atclk);
> > -
> >  	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> >  		clk_prepare_enable(drvdata->pclk);
> > +
> > +	if (drvdata && !IS_ERR(drvdata->atclk))
> > +		clk_prepare_enable(drvdata->atclk);
> >  	return 0;
> >  }
> 
> funnel_probe() enables pclk after atclk though - which needs to be
> reversed as well ?

Good point!

The key point is a dynamic probe enables pclk clock in AMBA bus driver,
which is anyway prior to enable atclk.

We need to keep consistent flow for all flows (static probe, dynamic
probe, runtime PM resume).  The patch 09 consolidates clock enabling for
static and dynamic probe, and this patch is for runtime PM.

For a better organization, I will place this patch after the patch 09
in the next spin.

[...]

> I assume this patch is trying to have the same clock sequence enablement
> during original probe and resume path and then just the reverse sequence
> during suspend path.

Correct.  As said, the patch 09 is for clock enabling sequence in
probe, and this patch is for the resume path.

Thanks,
Leo
