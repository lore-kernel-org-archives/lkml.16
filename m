Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1B526AABE
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525275; cv=none; b=d0eC3uqoL38DxHyfwy5QsgDwQEQ52fCqhioCmniuyYb2s5DsK2fCj+ikFXWbJRAQGtSxkEEVfAychClqlTJEuhESOj2lI2u2m83X7cC5VTfollDn2XDV/0Sm/+UjFBaIEDtK2dW8V9BO4OhOzJ3ImbzfUGyncLALkB++Uv91wh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525275; c=relaxed/simple;
	bh=6GMr3lmG8HfLAZBJRSwpp2LkOl+HPSQ4TlOGjP+VNsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0Y+8nFCkBbu/pMno/tAWAlyS24hJT3mtZe8mtC2qqMXVphC8ZXs2rEyyL6ynH2zp90n3qXHYjPp4luV0m4zur5NXNBpC0/vnDCnNxglumz8Hiz4F9LguWHrnK1e/WORC5GvRHVSJEp3usDmDoiTeK/Jba6rZTKUzQo7B1dK4xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C1E6113E;
	Tue,  6 May 2025 02:54:23 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B10C63F5A1;
	Tue,  6 May 2025 02:54:32 -0700 (PDT)
Date: Tue, 6 May 2025 10:54:28 +0100
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
Subject: Re: [PATCH v2 4/9] coresight: Disable programming clock properly
Message-ID: <20250506095428.GB177796@e132581.arm.com>
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-5-leo.yan@arm.com>
 <f56a73a4-ae63-4a46-a493-322c4806b3a2@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f56a73a4-ae63-4a46-a493-322c4806b3a2@arm.com>

On Fri, May 02, 2025 at 11:40:31AM +0530, Anshuman Khandual wrote:
> Even though this might seem to be being bike shedding, the subject
> line above could be re-organized something like the following for
> better clarity.
> 
>  coresight: Properly/Appropriately disable programming clocks

Sure.  I will change the subject to this.

[...]

> > @@ -725,8 +723,6 @@ static void debug_platform_remove(struct platform_device *pdev)
> >  
> >  	__debug_remove(&pdev->dev);
> >  	pm_runtime_disable(&pdev->dev);
> > -	if (!IS_ERR_OR_NULL(drvdata->pclk))
> > -		clk_put(drvdata->pclk);
> >  }
> Should not these IS_ERR_OR_NULL() here be changed to IS_ERR() ?

For the case above, after changed to devm_clk_get_enabled() for the
enabling programming clocks, we don't need any special handling and
leave the clock disabling and releasing to the device model layer.

> Because now there could not be a NULL return value.
>
> drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev)
> 
> #ifdef CONFIG_PM
> static int debug_runtime_suspend(struct device *dev)
> {
>         struct debug_drvdata *drvdata = dev_get_drvdata(dev);
> 
>         if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>                 clk_disable_unprepare(drvdata->pclk);
>         return 0;
> }
> 
> static int debug_runtime_resume(struct device *dev)
> {
>         struct debug_drvdata *drvdata = dev_get_drvdata(dev);
> 
>         if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>                 clk_prepare_enable(drvdata->pclk);
>         return 0;
> }
> #endif

> There might more instances like these as well.
> 	
> git grep IS_ERR_OR_NULL drivers/hwtracing/coresight/ | grep "drvdata->pclk"
> drivers/hwtracing/coresight/coresight-cpu-debug.c:      if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-cpu-debug.c:      if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-funnel.c: if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-funnel.c: if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-replicator.c:     if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-replicator.c:     if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-stm.c:    if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-stm.c:    if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-tpiu.c:   if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> drivers/hwtracing/coresight/coresight-tpiu.c:   if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))

I would like the current patch to focus on the issue of disabling /
releasing the programming clocks.

Though the IS_ERR_OR_NULL() check is redundant, it does not cause
issue or regression.  The refactoring is left in patch 09 for removing
IS_ERR_OR_NULL() checks.

Does this make sense?

Thanks
Leo
