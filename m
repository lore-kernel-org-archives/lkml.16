Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0656F1E3775
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749827706; cv=none; b=tjoQNoZaFUmjqH2FlopLiCtpEi/Scy9iJmaeGDDeX5I2ikYAweW6LvtdAXJlnhtHVKGUEfxUPhpx6QTqVD/j1nX3webCeu10pgLYruBzPqoKpxCZPQ9vIFZ8Y5+lOMmHZJ0WIANEtsoSUztGITcYJjpG7v94JN57fAyqHjFmpZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749827706; c=relaxed/simple;
	bh=B6WMnDxj2pcVNRpwF3NNTogNNQr6g5OBj7s/d3ZTkGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+Vf49w1RmbtrXr46TlvK6QmHGj0SlU02/r8mxMg815UGmUKvjBcJjFcVaiLbbFpI2ytjoTaL8x9xfP9IgoiJkYTxkPW6kJV1udQ+TLFLjmZaCVgonOesTYH+Dyu5Y7ey0XQ1agefBtp4ISqeX9A663uLuijjGK7HV+ufVqQCxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zzlxb4s/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zzlxb4s/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749827706; x=1781363706;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=B6WMnDxj2pcVNRpwF3NNTogNNQr6g5OBj7s/d3ZTkGA=;
  b=Zzlxb4s/r3UnfE6AwYLvhsrvVHnhTQrMazqu1h14Uq8ODhd7RgRaBTLX
   7yF3k7hgyDd54i8mLrqYhbIbMLNFGjAb6zE3NjcBA7Nugd4Qc+mqagyPV
   tlLd+r0k/F1eSnXp8M26MkQinP1WakJFfW3mpZH7w/hyhNPfRDOGLtU+v
   HvPs5J69b91HHtfGtm9fkW01kjQbu90+0j0qbGzTUFyZrBi9p1RroGeKd
   QuSOaoRJ872/CamH4HkPBOnfaj6lfFz8Xt2SkS6BKMV7mCAm+pIw67a3k
   Gt0kh1jr3gH8Ii1oe2LEpDRcQ0CwMbJ5vKSDPAmspuzYsJqnOA9DWq40P
   A==;
X-CSE-ConnectionGUID: mpkvoUDURkuHxd7vOv7IwQ==
X-CSE-MsgGUID: /Dvn0SZgQzefASKfdZv9XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="62323315"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="62323315"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 08:15:04 -0700
X-CSE-ConnectionGUID: 0inm8qi/Qji/SV21gcFF5Q==
X-CSE-MsgGUID: CGNEs7n0TeajlE2aqe17uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="148222082"
Received: from spandruv-desk1.amr.corp.intel.com (HELO [10.125.111.228]) ([10.125.111.228])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 08:15:03 -0700
Message-ID: <368e7626-c9bd-47be-bb42-f542dc3d67b7@intel.com>
Date: Fri, 13 Jun 2025 08:15:02 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/12] perf/x86: Support XMM register for non-PEBS and
 REGS_USER
To: kan.liang@linux.intel.com, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
 dave.hansen@linux.intel.com, irogers@google.com, adrian.hunter@intel.com,
 jolsa@kernel.org, alexander.shishkin@linux.intel.com,
 linux-kernel@vger.kernel.org
Cc: dapeng1.mi@linux.intel.com, ak@linux.intel.com, zide.chen@intel.com
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250613134943.3186517-6-kan.liang@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20250613134943.3186517-6-kan.liang@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> +static DEFINE_PER_CPU(void *, ext_regs_buf);

This should probably use one of the types in asm/fpu/types.h, not void*.

> +static void x86_pmu_get_ext_regs(struct x86_perf_regs *perf_regs, u64 mask)
> +{
> +	void *xsave = (void *)ALIGN((unsigned long)per_cpu(ext_regs_buf, smp_processor_id()), 64);

I'd just align the allocation to avoid having to align it at runtime
like this.

> +	struct xregs_state *xregs_xsave = xsave;
> +	u64 xcomp_bv;
> +
> +	if (WARN_ON_ONCE(!xsave))
> +		return;
> +
> +	xsaves_nmi(xsave, mask);
> +
> +	xcomp_bv = xregs_xsave->header.xcomp_bv;
> +	if (mask & XFEATURE_MASK_SSE && xcomp_bv & XFEATURE_SSE)
> +		perf_regs->xmm_regs = (u64 *)xregs_xsave->i387.xmm_space;
> +}

Could we please align the types on:

	perf_regs->xmm_regs
and
	xregs_xsave->i387.xmm_space

so that no casting is required?

> +static void reserve_ext_regs_buffers(void)
> +{
> +	size_t size;
> +	int cpu;
> +
> +	if (!x86_pmu.ext_regs_mask)
> +		return;
> +
> +	size = FXSAVE_SIZE + XSAVE_HDR_SIZE;
> +
> +	/* XSAVE feature requires 64-byte alignment. */
> +	size += 64;

Does this actually work? ;)

Take a look at your system when it boots. You should see some helpful
pr_info()'s:

> [    0.137276] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
> [    0.138799] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> [    0.139681] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> [    0.140576] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
> [    0.141569] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
> [    0.142804] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
> [    0.143665] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
> [    0.144436] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> [    0.145290] x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
> [    0.146238] x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
> [    0.146803] x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
> [    0.147397] x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:    8
> [    0.147986] x86/fpu: Enabled xstate features 0x2e7, context size is 2440 bytes, using 'compacted' format.

Notice that we're talking about a buffer which is ~2k in size when
AVX-512 is in play. Is 'size' above that big?

> +	for_each_possible_cpu(cpu) {
> +		per_cpu(ext_regs_buf, cpu) = kzalloc_node(size, GFP_KERNEL,
> +							  cpu_to_node(cpu));
> +		if (!per_cpu(ext_regs_buf, cpu))
> +			goto err;
> +	}

Right now, any kmalloc() >=256b is going to be rounded up and aligned to
a power of 2 and thus also be 64b aligned although this is just an
implementation detail today. There's a _guarantee_ that all kmalloc()'s
with powers of 2 are naturally aligned and also 64b aligned.

In other words, in practice, these kzalloc_node() are 64b aligned and
rounded up to a power of 2 size.

You can *guarantee* they'll be 64b aligned by just rounding size up to
the next power of 2. This won't increase the size because they're
already being rounded up internally.

I can also grumble a little bit because this reinvents the wheel, and I
suspect it'll continue reinventing the wheel when it actually sizes the
buffer correctly.

We already have code in the kernel to dynamically allocate an fpstate:
fpstate_realloc(). It uses vmalloc() which wouldn't be my first choice
for this, but I also don't think it will hurt much. Looking at it, I'm
not sure how much of it you want to refactor and reuse, but you should
at least take a look.

There's also xstate_calculate_size(). That, you _definitely_ want to use
if you end up doing your own allocations.
