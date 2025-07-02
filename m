Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED509307ADF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466926; cv=none; b=LXdRSu9piGRNhYRBHHKeuTOS4vIoAP1aB14KJiZuKrkFi61Pd0xKMouO75sAbuW0RwTchtdE4KFxqpLwIbfJ2+Qsr/eQTf5Wzv7ZNEc5NLtWkp/o6jwVV+9mHJV9OJpFxcBF8bXBRKN3lIxEhrPsUgUWK0V4zU0qR49XNBWKqQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466926; c=relaxed/simple;
	bh=jqDhb7+2VAbOj/yhhEXH5qFRBKDEbussUgg5EXXUCo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rm9y0vWzOnKMSfE5NRWFSqVCWI6nDneU3O95WUMslNqr/1pKu/IygpaPHQzru2xwhV2Q0ooJ/ccbzfC4DUKP4bF2E42J0/dH7p4TF/sWBpsLyJ5qLCoCfoVpKFfxppxG8lRfZq42tS3Vztzg44Y43eAZ6BBdhp/NIg3iMMyiBrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8102C22C7;
	Wed,  2 Jul 2025 07:35:09 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEC8A3F6A8;
	Wed,  2 Jul 2025 07:35:23 -0700 (PDT)
Date: Wed, 2 Jul 2025 15:35:21 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/28] coresight: etm4x: Ensure context
 synchronization is not ignored
Message-ID: <20250702143521.GX794930@e132581.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-5-23ebb864fcc1@arm.com>
 <aGUTmZgrN13GtrBp@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGUTmZgrN13GtrBp@e129823.arm.com>

Hi Levi,

On Wed, Jul 02, 2025 at 12:10:17PM +0100, Yeoreum Yun wrote:

[...]

> > @@ -579,6 +572,13 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> >
> >  	if (!drvdata->paused)
> >  		rc = etm4_enable_trace_unit(drvdata);
> > +
> > +	/*
> > +	 * As recommended by section 4.3.7 (Synchronization of register updates)
> > +	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> > +	 * ISB instruction after programming the trace unit registers.
> > +	 */
> > +	isb();
> 
> But according to 4.3.7 ("Synchronization when using memory-mapped
> interface"), doesn't it need to dsb like:
> 
>   if (csa->iomem)
>     dsb(sy);
>   isb();
> 
> Or am I missing something?

Section 4.3.7 suggests using a DSB barrier to ensure that writes have
completed in MMIO mode. It also mentions an alternative:

"If the memory is marked as Device-nGnRE or stronger, read back the
value of any register in the trace unit. This relies on the peripheral
coherence order defined in the Arm architecture."

In the etm4_{enable|disable}_trace_unit() functions, each time the
TRCPRGCTLR register is written, the driver polls bits in TRCSTATR.
This acts as synchronization using read-after-write (RAW), which is
exactly the approach suggested above.

This is why we don't need DSB() anymore.

Thanks,
Leo
