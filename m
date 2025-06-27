Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84292DA745
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751032785; cv=none; b=EVG2NJzpuo5i/Gai6cEoONREwZqPSdGdzYAT8DOQedq0lrBcUzscncIwZnWFdjYLuAUDnqz1DmIJu1oyaBA6nbdFRDUBnirauxAOQOHCB1pTOydL46hiJmTGHCyvaMN6ri0U2ASImQu23fJPs7mUEfSp0+N0qlv++qEojmTv9Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751032785; c=relaxed/simple;
	bh=SZj3OZ64SJ4u1r1jQU4LV/skGlQRq7ZIgcIdwG+PLeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnksUI9lmkLPDumMTsEnyFgniDUBncR15AxRZBQA1kn2TnzdiPHi5n3Sf7jg7IsyipjXcGQxnVMjYI1NCLTvYmOht0wpBlq/uOom2O5DikgpzntG5bV6m3MquSDFHPO+zRrSd/EGltCQyF8ziDP3ymvkJsSg6EeYpygM68xZkq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDE501A00;
	Fri, 27 Jun 2025 06:59:25 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C23E73F58B;
	Fri, 27 Jun 2025 06:59:42 -0700 (PDT)
Date: Fri, 27 Jun 2025 14:59:40 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/10] coresight: tmc: Support atclk
Message-ID: <20250627135940.GR794930@e132581.arm.com>
References: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
 <20250627-arm_cs_fix_clock_v4-v4-1-0ce0009c38f8@arm.com>
 <aF6cVFA7NpN2S273@e129823.arm.com>
 <aF6hX511YW3540Jx@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF6hX511YW3540Jx@e129823.arm.com>

Hi Levi,

On Fri, Jun 27, 2025 at 02:49:19PM +0100, Yeoreum Yun wrote:
> >
> > > @@ -789,6 +789,10 @@ static int __tmc_probe(struct device *dev, struct resource *res)
> > >  	struct coresight_desc desc = { 0 };
> > >  	struct coresight_dev_list *dev_list = NULL;
> > >
> > > +	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> > > +	if (IS_ERR(drvdata->atclk))
> > > +		return PTR_ERR(drvdata->atclk);
> > > +
> > >  	ret = -ENOMEM;
> > >
> >
> > Just another quetion.
> >
> > If this function is called from tmc_platform_probe() and failed,
> > should it call the clk_put() for drvdata->pclk when it failed?
> 
> Sorry, I missed the Patch #7.

No worries.

devm_clk_release() is a registered callback used by the device model
layer to release resources. The clock will be released in the flow:

  devm_clk_release()
    `> clk_put()
         `> free_clk()

Thanks,
Leo
