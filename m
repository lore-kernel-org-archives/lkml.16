Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF181288CA5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156105; cv=none; b=ddxQcmc3Oedg8c7Z6YXAnJUnhh9jROpavoR4jzj1kLtArJIS4RE+ftyYdFSUsyQqPnFRRBlI5G/d0kfpj1rzYYgNV7lj1Lo+idb3Ynrr/ASsgo6ybTjJQ7RUOn7M+4tircQD+82w69oyKnxPxS4F4u4ctbCdbtVxWTKQLkeP2Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156105; c=relaxed/simple;
	bh=eVvVXzAivmyoPeIPtgk9j4pQsdFrqsclraKFl6wvCOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5AUV+EDQao5j1AbGg9bJeLFwN1ZpYOfqPU6HKNhgrPn6AbiR7kkg5XqphMV4l4veob+GSQH1Sdy67UBRsLgI/6hLOLOWHN/mXcYHeqiXeKrO/UFZCTee/f50BOfihZGL4csN16QJLQtikIdJ1xP2jqOb8XXd2Dx0WnmrgcCHQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hZia7DZ/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hZia7DZ/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gPqe2qqXPOG40kC/rHNaREjSYQkeSOT+kLcO1eV74u8=; b=hZia7DZ/L/zdaqjhBj9uPG9K+E
	b2ryK2Co/Q6pjgaL++5cTTKCEGe2BUwnSu4tvA8olRXSoltO0VU6vVbQ8QI/mQ0e0+fcJlfh1V/x4
	5qm6O0f1sgnzovHfkHrJONU2GYm8od2Xpwt8KzmnRmY3fHjz8AQm3yk9DzzGqcOb4XJjnVgRM6urI
	FvtcOyWQ1ZV0Igdn+J7cYsLQkP2BrbFKfKpfTFOwqL1oy6T3r9UrBhvlMLSH6QmcDIMCayhLiLhkf
	PubMF0M28owFY/e59RLdZ8oS723uFVA+hxJoRTmnVaDkTHCWDmXjGzvDxwFajNYGJqNIlw9Dmb+Ij
	MRLABmoA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTY7-0000000H0AD-37rA;
	Tue, 17 Jun 2025 10:28:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E9FE530BDAD; Tue, 17 Jun 2025 12:28:13 +0200 (CEST)
Date: Tue, 17 Jun 2025 12:28:13 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: kan.liang@linux.intel.com, mingo@redhat.com, acme@kernel.org,
	namhyung@kernel.org, tglx@linutronix.de,
	dave.hansen@linux.intel.com, irogers@google.com,
	adrian.hunter@intel.com, jolsa@kernel.org,
	alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
	ak@linux.intel.com, zide.chen@intel.com
Subject: Re: [RFC PATCH 06/12] perf: Support extension of sample_regs
Message-ID: <20250617102813.GS1613376@noisy.programming.kicks-ass.net>
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250613134943.3186517-7-kan.liang@linux.intel.com>
 <20250617081458.GI1613376@noisy.programming.kicks-ass.net>
 <8fbf7fc5-2e38-4882-8835-49869b6dd47f@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fbf7fc5-2e38-4882-8835-49869b6dd47f@linux.intel.com>

On Tue, Jun 17, 2025 at 05:49:13PM +0800, Mi, Dapeng wrote:
> 
> On 6/17/2025 4:14 PM, Peter Zijlstra wrote:
> > On Fri, Jun 13, 2025 at 06:49:37AM -0700, kan.liang@linux.intel.com wrote:
> >> From: Kan Liang <kan.liang@linux.intel.com>
> >>
> >> More regs may be required in a sample, e.g., the vector registers. The
> >> current sample_regs_XXX has run out of space.
> >>
> >> Add sample_ext_regs_intr/user[2] in the struct perf_event_attr. It's used
> >> as a bitmap for the extension regs. There will be more than 64 registers
> >> added.
> >> Add a new flag PERF_PMU_CAP_EXTENDED_REGS2 to indicate the PMU which
> >> supports sample_ext_regs_intr/user.
> >>
> >> Extend the perf_reg_validate() to support the validation of the
> >> extension regs.
> >>
> >> Extend the perf_reg_value() to retrieve the extension regs. The regs may
> >> be larger than u64. Add two parameters to store the pointer and size.
> >> Add a dedicated perf_output_sample_ext_regs() to dump the extension
> >> regs.
> >>
> >> This is just a generic support for the extension regs. Any attempts to
> >> manipulate the extension regs will error out, until the driver-specific
> >> supports are implemented, which will be done in the following patch.
> >>
> >> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
> >> index 78a362b80027..e22ba72efcdb 100644
> >> --- a/include/uapi/linux/perf_event.h
> >> +++ b/include/uapi/linux/perf_event.h
> >> @@ -382,6 +382,10 @@ enum perf_event_read_format {
> >>  #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
> >>  #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
> >>  #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
> >> +#define PERF_ATTR_SIZE_VER9			168	/* Add: sample_ext_regs_intr */
> >> +							/* Add: sample_ext_regs_user */
> >> +
> >> +#define PERF_ATTR_EXT_REGS_SIZE			2
> >>  
> >>  /*
> >>   * 'struct perf_event_attr' contains various attributes that define
> >> @@ -543,6 +547,10 @@ struct perf_event_attr {
> >>  	__u64	sig_data;
> >>  
> >>  	__u64	config3; /* extension of config2 */
> >> +
> >> +	/* extension of sample_regs_XXX */
> >> +	__u64	sample_ext_regs_intr[PERF_ATTR_EXT_REGS_SIZE];
> >> +	__u64	sample_ext_regs_user[PERF_ATTR_EXT_REGS_SIZE];
> >>  };
> > Did anybody read this email?
> >
> >   https://lkml.kernel.org/r/20250416155327.GD17910@noisy.programming.kicks-ass.net
> >
> > The current regs interface really was designed for regular registers,
> > and trying to squish SIMD registers into it is a trainwreck.
> >
> > Not to mention that AAAARGHH64 and Risc-V have vector widths up to 2048
> > bit.
> 
> Yes, we followed this discussion. In sample_ext_regs_intr/user[], each bit
> represents an extended register regardless of how much bits does the
> register have.  At the beginning we added a item "sample_simd_reg_words" to
> represent the bit-width of the corresponding extended register, but we
> found it's unnecessary since the regs bitmap is fixed for a specific arch

So I disagree. Fundamentally we have only 32 SIMD registers on x86. We
should not have more bits than that.

> and the arch-specific code would know how many bits for the certain regs,
> e.g., on x86 platform, the bit 0 would represent YMMH0 in this patchset ,
> then the x86 specific perf code would know its bit-wdith is 128bits.

This is nonsense; YMMH0 is not a register. It should never be in this
array.

> The reason that we define an array with 2 u64 words is that we plan to
> support YMM (16 bits) + APX (16 bits) + OPMASK (8 bits) + ZMM (32 bits) +
> SSP (1 bit) regs which needs 73 bits and one u64 word is not enough.

This is insane. So now you're having 16 XMM 'regs', 16 YMMH 'regs' and
32 ZMMH 'regs' for a total of 64 bits that should have been just 32.

Suppose we're going to be doing AVX-1024, because awesome. That means we
need another 32 bits to denote whatever letter comes after 'Z'.

So no, this idiocy stops now.

We're going to do a sane SIMD register set with variable width, and
reclaim the XMM regs from the normal set.
