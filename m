Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FD5253F28
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750172108; cv=none; b=oAKMEZFnsFFH2qm6jOe7HALg4DDk/VO8T8VggL9FNkk31OsS+G2T4gOB0P1QJ+8DyYSrKjyyeedmo2lkxYUp7GLyyC3INXJhgBptCqgYH/JFQPgiYjoHqu/KWZYhaHa7P3vR1GvTqAcNKaz22WiGM/0/AkLVXwfMZ9kAFIBRTXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750172108; c=relaxed/simple;
	bh=HAzt8qCKKmIjvC1HzMQ8bWLKoSrUUV5A0yew5XtORB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEeVSnD15OyhdjFqH+ocXWYRPOUEVyV6NAjXFghAV/+WmhV+wBNG1q++Lf1wij/yT4FihQwb6xlss+FtzOdB7+zrxxFphePfJT9JCdxrWRpy3Z2Sl4SYWLCECmUwfxKvfSBlgkpuFs4MRDe0cxh+nfYWtXIRyN632hI1JOw8lhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50AD5150C;
	Tue, 17 Jun 2025 07:54:44 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA9DA3F673;
	Tue, 17 Jun 2025 07:55:02 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:55:00 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>, kan.liang@linux.intel.com,
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	tglx@linutronix.de, dave.hansen@linux.intel.com, irogers@google.com,
	adrian.hunter@intel.com, jolsa@kernel.org,
	alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
	ak@linux.intel.com, zide.chen@intel.com, broonie@kernel.org
Subject: Re: [RFC PATCH 06/12] perf: Support extension of sample_regs
Message-ID: <aFGBxBVFLnkmg3CP@J2N7QTR9R3>
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250613134943.3186517-7-kan.liang@linux.intel.com>
 <20250617081458.GI1613376@noisy.programming.kicks-ass.net>
 <8fbf7fc5-2e38-4882-8835-49869b6dd47f@linux.intel.com>
 <20250617102813.GS1613376@noisy.programming.kicks-ass.net>
 <dc084dac-170d-434e-9d8c-ba11cbc8e008@linux.intel.com>
 <20250617133333.GU1613376@noisy.programming.kicks-ass.net>
 <20250617140617.GC1613633@noisy.programming.kicks-ass.net>
 <aFF6gdxVyp36ADOi@J2N7QTR9R3>
 <20250617144416.GY1613376@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617144416.GY1613376@noisy.programming.kicks-ass.net>

On Tue, Jun 17, 2025 at 04:44:16PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 17, 2025 at 03:24:01PM +0100, Mark Rutland wrote:
> 
> > TBH, I don't think we can handle extended state in a generic way unless
> > we treat this like a ptrace regset, and delegate the format of each
> > specific register set to the architecture code.
> > 
> > On arm64, the behaviour is modal (with two different vector lengths for
> > streaming/non-streaming SVE when SME is implemented), per-task
> > configurable (with different vector lengths), can differ between
> > host/guest for KVM, and some of the registers only exist in some
> > configurations (e.g. the FFR only exists for SME if FA64 is
> > implemented).
> 
> Well, much of this is per necessity architecture specific. But the
> general form of vector registers is similar enough.
> 
> The main point is to not try and cram the vector registers into multiple
> GP regs (sadly that is exactly what x86 started doing).

I see, sorry for the noise. I completely agree that we shouldn't cram
this stuff into GP regs.

> Anyway, your conditional length thing is 'fun' and has two solutions:
> 
>   - the arch can refuse to create per-cpu counters with SIMD samples, or
> 
>   - 0 pad all 'unobtainable state'.
> 
> Same when asking for wider vectors than the hardware supports; eg.
> asking for 512 wide registers on Intel clients will likely end up in a
> lot of 0s for the high bits -- seeing how AVX512 is mostly a server
> thing on Intel.

Yep, those options may work for us, but we'd need to think harder about
it. Our approach for ptrace and signals has been to have a header and
pack at the active vector length, so padding to a max width would be
different, but maybe it's fine.

Having another representation feels like a recipe waiting to happen.

Mark.
