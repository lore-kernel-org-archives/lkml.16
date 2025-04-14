Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C252A1B393A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744614330; cv=none; b=fLfraF2DMdEWTwvirDwOD4ncu12NCdxfVKLVFZ3bITQJpuETDCKFwr4o7JOQ/3GxHp45y9SBqtDQcHYP2E/GgOEqX+GgJzm2xGsPUwrkUJhhgNpnX+5Q7bzXtSFfk+LsRC1o41BsjhNG65CTYGbTxpJkomMV8mRxvm5eBQi1aHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744614330; c=relaxed/simple;
	bh=44eQA72v4mswU9H8pQxV3pwz7lIjEJsLNjNcRvjEOQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgjAUVi/XMWSLugViBKAFkskT7Bx/qyO6/VBszoNFNDKF29PB4FOAB9GOFtsIuYd4CdGIZSQH8S4VrEcT8MSpeknGy0NLuhuugrATU34kfOVIm5tQ35ZOyVuYzf1bskTL1NBtcxzyEDAaL3qn8XcbYCdWvBNbYINlWx7gEIR+Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vIt0GfAQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vIt0GfAQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89797C4CEE2;
	Mon, 14 Apr 2025 07:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744614330;
	bh=44eQA72v4mswU9H8pQxV3pwz7lIjEJsLNjNcRvjEOQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vIt0GfAQxhuiTXukocJTAwdUin0sX3W/UfcDtA0luQx9PwscTsGLVyYrGdMS8qVJe
	 AiJmcVvO6z41gI7516TEeJfxN7hvh4mqotBYfJWGLN057xJ2gEKSmzrZtNV0VbpGFe
	 j1hvWWcAUfn1uzCgsUQ5Er2ZAvaVVZkzJTkuYl/WXwBOyyEv8OEKYhjPixJFljusoc
	 k04dG1vhd8pck7ejeCgRCU5NA3hadf0gG1fnlevv310ANbVK4q3tkJfO8LPx5M7HUr
	 1Jv/8hsk6gF3H1M7MPrGrhpDiQ+KPqa90Jna3mzw8PPeLdJE1T6rVYTPmFMB9CmnXQ
	 0ZSH6wlIol60A==
Date: Mon, 14 Apr 2025 09:05:22 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	mingo@redhat.com, luto@kernel.org, peterz@infradead.org,
	paulmck@kernel.org, rostedt@goodmis.org, tglx@linutronix.de,
	willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
	raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: Re: [PATCH v3 4/4] x86/folio_zero_user: multi-page clearing
Message-ID: <Z_yzshvBmYiPrxU0@gmail.com>
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-5-ankur.a.arora@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414034607.762653-5-ankur.a.arora@oracle.com>


* Ankur Arora <ankur.a.arora@oracle.com> wrote:

> clear_pages_rep(), clear_pages_erms() use string instructions to zero
> memory. When operating on more than a single page, we can use these
> more effectively by explicitly advertising the region-size to the
> processor, which can use that as a hint to optimize the clearing
> (ex. by eliding cacheline allocation.)
> 
> As a secondary benefit, string instructions are typically microcoded,
> and working with larger regions helps amortize the cost of the decode.

Not just the decoding, but also iterations around page-sized chunks are 
not cheap these days: there's various compiler generated mitigations 
and other overhead that applies on a typical kernel, and using larger 
sizes amortizes that per-page-iteration setup cost.

> When zeroing the 2MB page, maximize spatial locality by clearing in 
> three sections: the faulting page and its immediate neighbourhood, the
> left and the right regions, with the local neighbourhood cleared last.

s/zeroing the 2MB page
 /zeroing a 2MB page


> It's not entirely clear why the performance for pg-sz=2MB improves. 
> We decode fewer instructions and the hardware prefetcher can do a 
> better job, but the perf stats for both of those aren't convincing 
> enough to the extent of ~30%.

s/why the performance
 /why performance

> For both page-sizes, Icelakex, behaves similarly to Milan pg-sz=2MB: we
> see a drop in cycles but there's no drop in cacheline allocation.

s/Icelakex, behaves similarly
 /Icelakex behaves similarly

> Performance for preempt=none|voluntary remains unchanged.

CONFIG_PREEMPT_VOLUNTARY=y is the default on a number of major 
distributions, such as Ubuntu, and a lot of enterprise distro kernels - 
and this patch does nothing for them, for no good reason.

So could you please provide a sensible size granularity cutoff of 16MB 
or so on non-preemptible kernels, instead of this weird build-time 
all-or-nothing binary cutoff based on preemption modes?

On preempt=full/lazy the granularity limit would be infinite.

I.e the only code dependent on the preemption mode should be the size 
cutoff/limit.

On full/lazy preemption the code would, ideally, compile to something 
close to your current code.

> +obj-$(CONFIG_PREEMPTION)	+= memory.o

> +#ifndef CONFIG_HIGHMEM
> +/*
> + * folio_zero_user_preemptible(): multi-page clearing variant of folio_zero_user().

We don't care much about HIGHMEM these days I suppose, but this 
dependency still feels wrong. Is this a stealth dependency on x86-64, 
trying to avoid a new arch Kconfig for this new API, right? ;-)

Thanks,

	Ingo
