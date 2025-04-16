Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A538E18DB05
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744763374; cv=none; b=Mki9oiwUtWuFvqena+HUwUfZn3zWZvPLaAIWtNHaEU3dHA6ehC7JSuVevNjYpHpS6katRSRYgYY17kpbPqyYHsk9BP4hZ71e92ju3JinT/5DNI58m5+PRFUy5xaxWnEbI9cSKTMUtzhMZwIN5A96fw3E9q0j8yecNiJJttbmu1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744763374; c=relaxed/simple;
	bh=L8INdmtqXRNnXeb9qcyuBijnNDXaEw4iJtIkI/+aT9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfblhiKeoC1mLsFuzr1EponhBQfYB4drmjr0TXCxEgL4g8VrbR9IDx0ovffMIfR3vqxI1oGDXddDG45fACFv9dpMzQvCtVtKpEZ2yAhOegt/oq/gbhjxywJTASsEc4unQWWTp6wjr2FLaelWYHRGv4esUF7XjmH4AawwCRzQnoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ASIP1Iuy; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ASIP1Iuy"
Date: Tue, 15 Apr 2025 17:29:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744763369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=juY5rQQTwTG2gqesjXtjvnT2T7dGlYMsoq8YMrMgl5w=;
	b=ASIP1Iuywocc4KZzqAl2rycFwRdJKnrT8KVQ83SAR5eEc8dGOqpyU64+vrz43PWh0iFR4M
	oOeBKBTLS21BmLSdy9uRFQjprxTdK5gx909yKf46Q2H/VCJ+V7kvy/f0+rWF7eA9FWqNOt
	eMwWbepZnFQxs922EZ/+rdJWF1itSCs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: D Scott Phillips <scott@os.amperecomputing.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Clark <james.clark@linaro.org>,
	James Morse <james.morse@arm.com>, Joey Gouly <joey.gouly@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>, Will Deacon <will@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: errata: Work around AmpereOne's erratum
 AC04_CPU_23
Message-ID: <Z_753eQ29wP7OQlg@linux.dev>
References: <20250415154711.1698544-1-scott@os.amperecomputing.com>
 <20250415154711.1698544-2-scott@os.amperecomputing.com>
 <Z_6SKjdvje1Lpeo3@linux.dev>
 <864iypgjjc.fsf@scott-ph-mail.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864iypgjjc.fsf@scott-ph-mail.amperecomputing.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Apr 15, 2025 at 03:13:43PM -0700, D Scott Phillips wrote:
> > At least from your erratum description it isn't clear to me that this
> > eliminates the problem and only narrows the window of opportunity.
> > Couldn't the implementation speculatively fetch translations with an
> > unsynchronized HCR up to the ISB? Do we know what translation regimes
> > are affected by the erratum?
> 
> Hi Oliver, I got some clarification from the core folks. The issue
> affects the data side of the core only, not the instruction side.  I'll
> update my description to include that.
> 
> Speculation after the `msr hcr_el2` couldn't launch a problem
> translation when the `msr` is followed by an `isb` like this.

Thanks, agree that the subsequent ISB protects against speculative
behavior relating to the instruction stream. To be absolutely certain,
there's no risk of, say, a TLB prefetcher pulling in a problematic
translation in this window? IOW, there's no behavior that meets the ARM
ARM definition of a Speculative operation that can lead to a corrupted
translation.

Sorry to hassle about these issues but they're helpful for maintaining
the workaround in the future. If you can fold all the extra details into
the patch for v2 that'd be great.

> Marc Zyngier <maz@kernel.org> writes:
> 
> > On Tue, 15 Apr 2025 16:47:11 +0100,
> > If the write to HCR_EL2 can corrupt translations, what guarantees that
> > such write placed on a page boundary (therefore requiring another TLB
> > lookup to continue in sequence) will be able to get to the ISB?
> 
> Hi Marc, I understand now from the core team that an ISB on another page
> will be ok as the problem is on the data side only.

Thanks,
Oliver
