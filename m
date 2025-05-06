Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9303426C381
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525442; cv=none; b=P/WQcDpMSrPpzUZs/plM2BJOsi+tqo3jwkgo88dBc2lbRX3DKNKNTzUiZvPo/Jrr4WdMc3ncERH+G2WxNK9FA+kOSKLe8Z7fzMVQrldXMXTQJ9QIJmUgoRZlcJ5mCNTSGAD6pTxd0fHCiaV3Jpf6/AkPscMiwxyH4I38ZOoi5yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525442; c=relaxed/simple;
	bh=ZiZ300iQyTN5PSt/6ajULtPv1kS+yITV0njqf9aaST4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TcmWRzEJS372GQE/AHnRyYyvFgVDzv0eD6aB+GLq9LzHs/BdhsB6OlgAxZo8y7PhCaHpQyLYfoa8YTUA+OlJ+WI04JLj7SWsD3NbivndN/ftl2anGeb01+GjD+qzJL80+FxpUOVTbFsZejUad1OmM2Mc0L5SJq5hMrxm5r8kq4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06E5A113E;
	Tue,  6 May 2025 02:57:09 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4ACFD3F5A1;
	Tue,  6 May 2025 02:57:18 -0700 (PDT)
Date: Tue, 6 May 2025 10:57:16 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: replicator: Fix panic for clearing claim tag
Message-ID: <20250506095716.GC177796@e132581.arm.com>
References: <20250502111108.2726217-1-leo.yan@arm.com>
 <6f9346a0-03c5-4b00-85f9-0d54e24d0657@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f9346a0-03c5-4b00-85f9-0d54e24d0657@linaro.org>

On Tue, May 06, 2025 at 10:27:37AM +0100, James Clark wrote:

[...]

> > @@ -262,6 +262,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
> >   		drvdata->base = base;
> >   		desc.groups = replicator_groups;
> >   		desc.access = CSDEV_ACCESS_IOMEM(base);
> > +		coresight_clear_self_claim_tag(&desc.access);
> >   	}
> >   	if (fwnode_property_present(dev_fwnode(dev),
> > @@ -284,7 +285,6 @@ static int replicator_probe(struct device *dev, struct resource *res)
> >   	desc.pdata = dev->platform_data;
> >   	desc.dev = dev;
> > -	coresight_clear_self_claim_tag(&desc.access);
> >   	drvdata->csdev = coresight_register(&desc);
> >   	if (IS_ERR(drvdata->csdev)) {
> >   		ret = PTR_ERR(drvdata->csdev);
> 
> Oops. The other occurrence of this is the funnel, but I got that one right.
> 
> Reviewed-by: James Clark <james.clark@linaro.org>

Thanks for review.  Yes, the funnel driver is fine as it accesses claim
tag for only MMIO mode.

Leo
