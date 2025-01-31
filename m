Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690F46A8D2
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738343039; cv=none; b=B85J2dgkkl3qhWlhoCFa1S8/kXWmvOPiR9NwC/gryZMBjuTTuj5TMMPIky1YREEn3zCPuslZXLpeOwaZViuUtTstqV/bn+5VLnptqHSDl4cbGkoCCVUFFQIHAFD7L4o9QMFS2HxqjZ5dT84eXl3gp6dMUrway21rvYhLFoSFG44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738343039; c=relaxed/simple;
	bh=0P55tX36YnjGgxuXV9fClqYoPcCvp8mJT2Y6nq0OCDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBLYDqA5zZHtvJHN2gyEIzpVwLHojrMFhBUsYz6bUXBDEpguHki+HwF6tYQVHuFki5hc1D/0OMvj8nOWmMvlSHzy6ynyL0obplEaWC27AXOteUcGaLxE4KqWuUZD/nLVmQh9A+zOGSauQVG32Uk3zy28HQpnyOC4BcXB2/4PkOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=t/sZRENV; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="t/sZRENV"
Date: Fri, 31 Jan 2025 09:03:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738343035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qaQGPp6ddTyuXw6qY9SjSQ+H3AysFRGJVYo1Wy3tqJA=;
	b=t/sZRENVwTvWil5d24XUhkvpKGoPUPv/03wBQSZg/Zc8YrEat9ZeJaejIGEWsrBLcUvTPi
	/+2FfOVpGS9vEWzsSz1+dzYfpnEIQxVOTuEjE07OOld72tJFkVRZFmxf8XCEzvZhRhqPX3
	5ZP7K/EnyYq4Dl55xinMqsGh5ADM9+0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>, James Morse <james.morse@arm.com>,
	stable@vger.kernel.org, Moritz Fischer <moritzf@google.com>,
	Pedro Martelletto <martelletto@google.com>,
	Jon Masters <jonmasters@google.com>
Subject: Re: [PATCH] arm64: Move storage of idreg overrides into mmuoff
 section
Message-ID: <Z50CdVT8fPof-_Zc@linux.dev>
References: <20250130204614.64621-1-oliver.upton@linux.dev>
 <Z5yseC1kCyTcwlMy@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5yseC1kCyTcwlMy@J2N7QTR9R3>
X-Migadu-Flow: FLOW_OUT

On Fri, Jan 31, 2025 at 10:56:56AM +0000, Mark Rutland wrote:
> On Thu, Jan 30, 2025 at 12:46:15PM -0800, Oliver Upton wrote:
> > There are a few places where the idreg overrides are read w/ the MMU
> > off, for example the VHE and hVHE checks in __finalise_el2. And while
> > the infrastructure gets this _mostly_ right (i.e. does the appropriate
> > cache maintenance), the placement of the data itself is problematic and
> > could share a cache line with something else.
> > 
> > Depending on how unforgiving an implementation's handling of mismatched
> > attributes is, this could lead to data corruption. In one observed case,
> > the system_cpucaps shared a line with arm64_sw_feature_override and the
> > cpucaps got nuked after entering the hyp stub...
> 
> This doesn't sound right. Non-cacheable/Device reads should not lead to
> corruption of a cached copy regardless of whether that cached copy is
> clean or dirty.
> 
> The corruption suggests that either we're performing a *write* with
> mismatched attributes (in which case the use of .mmuoff.data.read below
> isn't quite right), or we have a plan invalidate somewhere without a
> clean (and e.g. something else might need to be moved into
> .mmuoff.data.write).
> 
> Seconding Ard's point, I think we need to understand this scenario
> better.

Of course. So the write to the idreg override is fine and gets written
back after cache maintenance.

What's happening afterwards is CPU0 pulls in the line to write to
system_cpucaps which also happens to contain arm64_sw_feature_override.
That line is in UD state when CPU0 calls HVC_FINALISE_EL2 and goes to
EL2 with the MMU off.

__finalise_el2() does a load on arm64_sw_feature_override which goes out
as a ReadNoSnp. I is the only cache state for this request (IHI 0050G
B4.2.1.2) and the SF stops tracking the line, so writeback never
actually goes anywhere.

This patch might have been a touch premature, let me double check a few
things on our side.

-- 
Thanks,
Oliver
