Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7A5182D0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751452970; cv=none; b=gq7j4siEkoTjjPlxzPeVSuCUPq2qoPKb/PpVgwThnAnCEvRhYz+uZns1EbgcyJXEpTeS1K12PQ5OoJR/tesRoflZqPw6gEpAz37W1wKrshiINQ+ug+Zok+kFz860uX4ystHgQP97q+adstRefNI/b51lyZZit0dmYkf5z35t+Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751452970; c=relaxed/simple;
	bh=EkEXZ6RXULGLL014nDgby1Mjw2I8uRkWR4rl2MXCcWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Chheo5zzLNUuYqrZ3eizGl2kjmKPiwzg+15eFT+cJLFVsaWC88QLp7ug8qhEDdKB7dRbUnhYYVr65PpRxR6rKW+4gvZtYPfIUKjsEdc8PHsySLgNuDIXo0Ho1JXytiluZwzCd3jfMF6kfccfTbqc3Upugph4Teb95MtK1OvsdcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E726522D9;
	Wed,  2 Jul 2025 03:42:33 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70E6C3F58B;
	Wed,  2 Jul 2025 03:42:48 -0700 (PDT)
Date: Wed, 2 Jul 2025 11:42:46 +0100
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
Subject: Re: [PATCH v2 03/28] coresight: etm3x: Always set tracer's device
 mode on target CPU
Message-ID: <20250702104246.GW794930@e132581.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-3-23ebb864fcc1@arm.com>
 <aGUHbWR0vreo29kl@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGUHbWR0vreo29kl@e129823.arm.com>

On Wed, Jul 02, 2025 at 11:18:21AM +0100, Yeoreum Yun wrote:
> Hi Leo,
> 
> [...]
> > @@ -464,17 +477,29 @@ static int etm_enable_perf(struct coresight_device *csdev,
> >  			   struct perf_event *event,
> >  			   struct coresight_path *path)
> >  {
> > +	int ret = 0;
> >  	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> >
> > -	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
> > -		return -EINVAL;
> > +	if (!coresight_take_mode(csdev, CS_MODE_PERF))
> > +		return -EBUSY;
> > +
> > +	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id())) {
> > +		ret = -EINVAL;
> > +		goto out;
> > +	}
> 
> Small question: why drvdata->cpu != smp_processor_id() check after
> changing mode? Would it better to check before change of it?

You are right. I will update in next version.

Thanks for pointing out this!

Leo
