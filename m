Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FA31D619D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743513796; cv=none; b=gQethBX3AvGnOBTxqQVYw/MwWK7fCiUOrZY5XxG/oAtm/KATM8dYgKLE/LbmCVQJ5OUuM8Y8nnEsGjT4zeR4mgp6gvBcBfabtGQ3PjkqKnLkaMyYIgqrlUdmPx6jrfZfHCL7fvdos7BU4JSYmgXAsERAi3F60iib9kK3eZsd70o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743513796; c=relaxed/simple;
	bh=eMROIE9lRi7B0Prl0rRcvrLrO/daEMuUA+agXIgqsyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9T7m97rj2B/UaUvacaUxbU5agW/6Wjz0TiT/o+okOuP6a2v3TwBHY3UDzBct39dYCqnIltiAQbuABneFIsocPt4yl2V48gLRRifOjnfxoRp3WZZf5jDXXKK5FMYYCtuev94nJgIPUea5ilKcWcxebBmSJc9LouVilcA8b6OiwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B20CA1424;
	Tue,  1 Apr 2025 06:23:16 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD73D3F694;
	Tue,  1 Apr 2025 06:23:12 -0700 (PDT)
Date: Tue, 1 Apr 2025 14:23:08 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Yabin Cui <yabinc@google.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH] coresight: catu: Introduce refcount and spinlock for
 enabling/disabling
Message-ID: <20250401132308.GB115840@e132581.arm.com>
References: <20250328223837.2314277-1-yabinc@google.com>
 <ea366793-4c27-44af-9b6b-8964c4151416@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea366793-4c27-44af-9b6b-8964c4151416@linaro.org>

Hi all,

On Mon, Mar 31, 2025 at 03:24:46PM +0100, James Clark wrote:
> On 28/03/2025 10:38 pm, Yabin Cui wrote:

[...]

> > diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> > index 275cc0d9f505..834a7ffbbdbc 100644
> > --- a/drivers/hwtracing/coresight/coresight-catu.c
> > +++ b/drivers/hwtracing/coresight/coresight-catu.c
> > @@ -458,12 +458,19 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
> >   static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
> >   		       void *data)
> >   {
> > -	int rc;
> > +	int rc = 0;
> > +	unsigned long flags;
> >   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
> > -	CS_UNLOCK(catu_drvdata->base);
> > -	rc = catu_enable_hw(catu_drvdata, mode, data);
> > -	CS_LOCK(catu_drvdata->base);
> > +	spin_lock_irqsave(&catu_drvdata->spinlock, flags);

> Hi Yabin,
> 
> This needs to be a raw_spinlock since [1]. Also you might as well use the
> new guard() thing to save someone find-and-replacing it later.
> 
> But I'm wondering if this is accurate. The ETR's refcount is dependent on
> the pid of the owner of the trace session:
> 
>   /* Do not proceed if this device is associated with another session */
>   if (drvdata->pid != -1 && drvdata->pid != pid) {
> 	rc = -EBUSY;
> 	goto unlock_out;
>   }
> 
>   /*
>    * No HW configuration is needed if the sink is already in
>    * use for this session.
>    */
>   if (drvdata->pid == pid) {
> 	csdev->refcnt++;
> 	goto unlock_out;
>   }
> 
> If the helpers get enabled first, could this mean that CATU gets associated
> with a different session than the ETR? Maybe not, but it would be easier to
> understand if the core code handled the refcounting and locking for linked
> devices.

Yes, CATU can be enabled in a different session or even is disturbed
by another mode (E.g., CATU is enabled in a perf session, then it
might be wrongly enabled for Sysfs mode).

But anyway, I think this patch is needed to protect the low level's
operations with a raw spin lock.

Thanks,
Leo

> [1]:
> https://lore.kernel.org/all/20250306121110.1647948-3-yeoreum.yun@arm.com/
> 
> Thanks
> James
> 
> > +	if (csdev->refcnt == 0) {
> > +		CS_UNLOCK(catu_drvdata->base);
> > +		rc = catu_enable_hw(catu_drvdata, mode, data);
> > +		CS_LOCK(catu_drvdata->base);
> > +	}
> > +	if (!rc)
> > +		csdev->refcnt++;
> > +	spin_unlock_irqrestore(&catu_drvdata->spinlock, flags);
> >   	return rc;
> >   }
> > @@ -486,12 +493,17 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
> >   static int catu_disable(struct coresight_device *csdev, void *__unused)
> >   {
> > -	int rc;
> > +	int rc = 0;
> > +	unsigned long flags;
> >   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
> > -	CS_UNLOCK(catu_drvdata->base);
> > -	rc = catu_disable_hw(catu_drvdata);
> > -	CS_LOCK(catu_drvdata->base);
> > +	spin_lock_irqsave(&catu_drvdata->spinlock, flags);
> > +	if (--csdev->refcnt == 0) {
> > +		CS_UNLOCK(catu_drvdata->base);
> > +		rc = catu_disable_hw(catu_drvdata);
> > +		CS_LOCK(catu_drvdata->base);
> > +	}
> > +	spin_unlock_irqrestore(&catu_drvdata->spinlock, flags);
> >   	return rc;
> >   }
> > @@ -550,6 +562,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
> >   	dev->platform_data = pdata;
> >   	drvdata->base = base;
> > +	spin_lock_init(&drvdata->spinlock);
> >   	catu_desc.access = CSDEV_ACCESS_IOMEM(base);
> >   	catu_desc.pdata = pdata;
> >   	catu_desc.dev = dev;
> > diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
> > index 141feac1c14b..663282ec6381 100644
> > --- a/drivers/hwtracing/coresight/coresight-catu.h
> > +++ b/drivers/hwtracing/coresight/coresight-catu.h
> > @@ -65,6 +65,7 @@ struct catu_drvdata {
> >   	void __iomem *base;
> >   	struct coresight_device *csdev;
> >   	int irq;
> > +	spinlock_t spinlock;
> >   };
> >   #define CATU_REG32(name, offset)					\
> 
