Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3368F9D9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745845529; cv=none; b=OXql3+v9Rx2GWVhw8uSvCbfhXWKFtXrvHVsa2950Yc0aQji5oEQqS59dVvoUr/9GIX4AclCwYYm/wwjNq6NW9xZo43aFT58PlbQ/BBr93eEc5Kdl58thAkGf3hwuHuE3Fp9hU2LTtzmYBivFkuMjgV+rnkaNO19ChxVvKmo/tOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745845529; c=relaxed/simple;
	bh=p6MaeNDDWI06pgM7o1x7lmB0gE7Nusu6ip0/6BgLPpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRB1zexaWZIWE5pTpqE+QTeZD4o8QE+zh3ICt+Sj2JvABUuHJ+7QCUVVsskL5x7TuECvQJT48ErRGUZpkpxgczOpX7gAwblvDdmalk0xC7NyZYcadI4/7tXEuDHKggeoTn0shoESnwSiUG3EX7F3jn19Yp8HdrxwVGl3enwhW9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBF6F1516;
	Mon, 28 Apr 2025 06:05:17 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD5A63F673;
	Mon, 28 Apr 2025 06:05:23 -0700 (PDT)
Date: Mon, 28 Apr 2025 14:05:19 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Yabin Cui <yabinc@google.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: trbe: Save/restore state across CPU low power
 state
Message-ID: <20250428130519.GF551819@e132581.arm.com>
References: <20250423230046.1134389-1-yabinc@google.com>
 <731dbb1d-e804-4678-9b8c-40f6395e94a7@arm.com>
 <CALJ9ZPNExud7ZQ-ZgpVtPJHUsAyJv_O-CH8mCa6gUyu1E1T8zg@mail.gmail.com>
 <CAJ9a7VhMJDMbowRuB5zgjQw+UfxP7eumZX1SKF2MJQ2_2NebHA@mail.gmail.com>
 <20250428122408.GD551819@e132581.arm.com>
 <CAJ9a7VjhCRk9BxGvE3ZyyZzq__+A1PpD=oRtFQOcD8BwXKa27Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VjhCRk9BxGvE3ZyyZzq__+A1PpD=oRtFQOcD8BwXKa27Q@mail.gmail.com>

On Mon, Apr 28, 2025 at 01:55:29PM +0100, Mike Leach wrote:

[...]

> > > The TRBE PM can follow the model of the ETE / ETMv4 and save and
> > > restore if currently in use.
> >
> > If TRBE PM is registered as a seperate PM notifier, a prominent issue is
> > it cannot promise the depedency between ETE and TRBE when execute CPU
> > power management.  E.g., when entering CPU idle states, ETE should be
> > disabled prior to switch off TRBE, otherwise, it might cause lockup
> > issue in hardware.  If ETE and TRBE register PM notifier separately,
> > we cannot ensure the sequence between ETE and TRBE, this is why we need
> > to do the operations based on CoreSight paths.
> >
> 
> I believe that the architecture requires that if the disabled TRBE
> cannot receive trace then the ETE should regard the trace as having
> been output (A1.4 ETE spec). Incorrect sequencing should only result
> in missing trace, not a core lockup - unless the implementation is not
> compliant.

Thanks for clarification, Mike.

I would prefer to stick with the CoreSight path approach, as this will
help us to resolve the issue in a general way - not just for ETE / TRBE
case, this would be applicable for other types of links and sinks.

Thanks,
Leo
