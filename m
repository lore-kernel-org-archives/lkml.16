Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCACB2E3376
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598914; cv=none; b=NauXpaNuvlCVJM+UFW3YBarDtBfpyqgmL42pvnKnmqt08L+I9Hl4uX9CR6zyvNmho1eO7/XLb0VsWgZngfdrGEw1L2pEE6nrN2x+4eTZc3fnz9+xyCivHFnXmS8DHgO4XWoovry8cUUXkjty4dEmIOcrvjMB5e3pTYI+/12YdkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598914; c=relaxed/simple;
	bh=uSXLrb+iFNWhB6AZfQ3dh2Mlvj/AK6pLvmlXdZH+Dfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsBj7twxHyfJDZBTzD6yKS0OzWkeD6mB4fRaR6+PdOH/KLFU/Db7slYBXUU6zdRWscOL4tFXJd4y7OrFSs432PeYVJr25RK3cREpxJo1/CAOn8nGRfivo3NzYhZdUOM/iulegPaLqm1uwDGw9d9A7A/FEu9J82Va04kIG65BW4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16EF7106F;
	Wed,  2 Apr 2025 06:01:54 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5F983F694;
	Wed,  2 Apr 2025 06:01:50 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:01:45 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yabin Cui <yabinc@google.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] coresight: catu: Introduce refcount and spinlock
 for enabling/disabling
Message-ID: <20250402130145.GI115840@e132581.arm.com>
References: <20250402011832.2970072-1-yabinc@google.com>
 <20250402011832.2970072-2-yabinc@google.com>
 <CALJ9ZPNBGBd9OTBgedoQStXh3d2oGDGi6fUF7PXbU5qTEBRHew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALJ9ZPNBGBd9OTBgedoQStXh3d2oGDGi6fUF7PXbU5qTEBRHew@mail.gmail.com>

Hi Yabin,

On Tue, Apr 01, 2025 at 06:21:59PM -0700, Yabin Cui wrote:

[...]

> > @@ -486,12 +491,17 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
> >
> >  static int catu_disable(struct coresight_device *csdev, void *__unused)
> >  {
> > -       int rc;
> > +       int rc = 0;
> >         struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
> > +       guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
> >
> > -       CS_UNLOCK(catu_drvdata->base);
> > -       rc = catu_disable_hw(catu_drvdata);
> > -       CS_LOCK(catu_drvdata->base);
> > +       if (--csdev->refcnt == 0) {
> > +               CS_UNLOCK(catu_drvdata->base);
> > +               rc = catu_disable_hw(catu_drvdata);
> > +               CS_LOCK(catu_drvdata->base);
> > +       } else {
> > +               rc = -EBUSY;

This is not an error if the decremented reference counter is not zero.
It should return 0.  Otherwise, the change looks good to me.

Thanks,
Leo
