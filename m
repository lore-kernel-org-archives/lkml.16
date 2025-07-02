Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585C42561AF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751467233; cv=none; b=iEMhA0Ca941Zi1xdWBRgVWqWvYP5uzAZHyoWnZdeoxhaeYqMDM+NDHUFUzrmVGkNAusHUYuNIjK5vSiqOKCBGh5BhiKErSYdYSYeU4nnnIJ4fVXMQ9c1NCf10V7IFqF8cEpbbBaAGiJv3X+uSO4k2LNimD8feq2Noe2vsCwpJcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751467233; c=relaxed/simple;
	bh=Aj1dmvOg9aToLcm09LeTlRIpHjx9YflykqH4KN3e/YI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SV3KNvTqzerzfa4J9Fs1qxZ8imANhXJhLPXxPD2XFu/udvak0uVb/58t7eOZpi0WYdFvBBxSCzJjPK0QWxyYwvV1D5ln5HNYrH5Pj3lX+28QZHmNs3Q0YPBVBxPB+WU0sfDRdO31qb3GLrYaGxMw5d88dQJF8bgFk7qu1hu+oFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D90B22C7;
	Wed,  2 Jul 2025 07:40:15 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0824F3F6A8;
	Wed,  2 Jul 2025 07:40:29 -0700 (PDT)
Date: Wed, 2 Jul 2025 15:40:28 +0100
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
Subject: Re: [PATCH v2 06/28] coresight: etm4x: Add context synchronization
 before enabling trace
Message-ID: <20250702144028.GY794930@e132581.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-6-23ebb864fcc1@arm.com>
 <aGUSZpR1QHNgLu6f@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGUSZpR1QHNgLu6f@e129823.arm.com>

On Wed, Jul 02, 2025 at 12:05:10PM +0100, Yeoreum Yun wrote:

[...]

> > @@ -445,13 +445,37 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
> >  		etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
> >
> >  	etm4x_allow_trace(drvdata);
> > +
> > +	/*
> > +	 * According to software usage PKLXF in Arm ARM (ARM DDI 0487 L.a),
> > +	 * execute a Context synchronization event to guarantee the trace unit
> > +	 * will observe the new values of the System registers.
> > +	 */
> > +	if (!csa->io_mem)
> > +		isb();
> > +
> 
> But, when write to SYS_TRFCR_EL1 in etm4x_allow_trace(), it already does
> isb(). Is it redundant?

Good point. It is not sufficient. As a system register writing in
kvm_tracing_set_el1_configuration(), this is why adds a ISB here.

Thanks,
Leo
