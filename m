Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E29226D1E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749837100; cv=none; b=H/I9OFfA10stirOytawH+0wvaPun5vIVRUucU9dCqPDBmsMliDZyci9rWa+LL2egpt6msExeVO2Fvu9/Odu6cP7cylQBwPWx/ef16PnL/NjYl+BFwC99qGtP9r+rk96ssk921esuodlbcbyfAf6KEkXaPpq3J3QS6vHPtjchq1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749837100; c=relaxed/simple;
	bh=xpa4dfpoM5hOX/Y1c1DJeXAk9lEa3u2lCcJmG6Cknj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hUj+7WocnvPMPR7ABjApUsYNjGqamYsuaZkeq6R736+CP+qSw5xPMtpBEhltwGaMxuZ/lEdFTdbXdvc6LR/K1SaYXNd0l1xF6gkG2ycpD9pbVcJo/PZHd6u9SLEcfWpAIPFiXLFNIBuh7EcjdHccfOvaucVDGssFQs0C6yu18DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRFn+nCA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRFn+nCA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749837098; x=1781373098;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xpa4dfpoM5hOX/Y1c1DJeXAk9lEa3u2lCcJmG6Cknj4=;
  b=cRFn+nCAPaokZyUZfUf6U3W0QunFkaCEo0CUtH09ACeAKeKFeJq/kE6A
   845weHI6Jn/WAaYK5gkLZqBUjzXJ27gt0Mp2H8m/wBiNwDhPrM2tFDtYY
   AJR5c7bmpStHoHuBGMi8HbD8IQ2/69h0yWskWDL1lDtVhsYvvaCr3KiKt
   6dNLD3meGhyHnrZ1frZSI4eLo/1/0R0Wtsw8aKHhcGvzmfL8ND2bBw9gn
   iipXzXhLfMLls1b2UDAwC8rHGTHY/Wt4Olqulz04sEycpo2GpJVWed2GC
   VzRvWePUE1/Iup+s1tDAGVEGmSrVqvHu3HC5MYKGYJ6YqAxWF/CPVsApU
   Q==;
X-CSE-ConnectionGUID: ThU17CDlQpSB9O8yongZBA==
X-CSE-MsgGUID: PHJ/Y4TQTtuEf8gU7+19CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55860695"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="55860695"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 10:51:37 -0700
X-CSE-ConnectionGUID: ir8GYJZtQVOytR9aIYD6nQ==
X-CSE-MsgGUID: +/6/9GbUSZmmazPgA9bZhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="148358114"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 10:51:37 -0700
Received: from [10.246.136.52] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id B0CFE20B5736;
	Fri, 13 Jun 2025 10:51:34 -0700 (PDT)
Message-ID: <d095993b-01e4-4a7a-bb50-363db92df007@linux.intel.com>
Date: Fri, 13 Jun 2025 13:51:33 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/12] perf/x86: Support XMM register for non-PEBS and
 REGS_USER
To: Dave Hansen <dave.hansen@intel.com>, peterz@infradead.org,
 mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
 dave.hansen@linux.intel.com, irogers@google.com, adrian.hunter@intel.com,
 jolsa@kernel.org, alexander.shishkin@linux.intel.com,
 linux-kernel@vger.kernel.org
Cc: dapeng1.mi@linux.intel.com, ak@linux.intel.com, zide.chen@intel.com
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250613134943.3186517-6-kan.liang@linux.intel.com>
 <368e7626-c9bd-47be-bb42-f542dc3d67b7@intel.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <368e7626-c9bd-47be-bb42-f542dc3d67b7@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-06-13 11:15 a.m., Dave Hansen wrote:
>> +static DEFINE_PER_CPU(void *, ext_regs_buf);
> 
> This should probably use one of the types in asm/fpu/types.h, not void*.
> 
>> +static void x86_pmu_get_ext_regs(struct x86_perf_regs *perf_regs, u64 mask)
>> +{
>> +	void *xsave = (void *)ALIGN((unsigned long)per_cpu(ext_regs_buf, smp_processor_id()), 64);
> 
> I'd just align the allocation to avoid having to align it at runtime
> like this.
> 
>> +	struct xregs_state *xregs_xsave = xsave;
>> +	u64 xcomp_bv;
>> +
>> +	if (WARN_ON_ONCE(!xsave))
>> +		return;
>> +
>> +	xsaves_nmi(xsave, mask);
>> +
>> +	xcomp_bv = xregs_xsave->header.xcomp_bv;
>> +	if (mask & XFEATURE_MASK_SSE && xcomp_bv & XFEATURE_SSE)
>> +		perf_regs->xmm_regs = (u64 *)xregs_xsave->i387.xmm_space;
>> +}
> 
> Could we please align the types on:
> 
> 	perf_regs->xmm_regs
> and
> 	xregs_xsave->i387.xmm_space
> 
> so that no casting is required?
> 
>> +static void reserve_ext_regs_buffers(void)
>> +{
>> +	size_t size;
>> +	int cpu;
>> +
>> +	if (!x86_pmu.ext_regs_mask)
>> +		return;
>> +
>> +	size = FXSAVE_SIZE + XSAVE_HDR_SIZE;
>> +
>> +	/* XSAVE feature requires 64-byte alignment. */
>> +	size += 64;
> 
> Does this actually work? ;)
> 
> Take a look at your system when it boots. You should see some helpful
> pr_info()'s:
> 
>> [    0.137276] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
>> [    0.138799] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
>> [    0.139681] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
>> [    0.140576] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
>> [    0.141569] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
>> [    0.142804] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
>> [    0.143665] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
>> [    0.144436] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
>> [    0.145290] x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
>> [    0.146238] x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
>> [    0.146803] x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
>> [    0.147397] x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:    8
>> [    0.147986] x86/fpu: Enabled xstate features 0x2e7, context size is 2440 bytes, using 'compacted' format.
> 
> Notice that we're talking about a buffer which is ~2k in size when
> AVX-512 is in play. Is 'size' above that big?
> 
>> +	for_each_possible_cpu(cpu) {
>> +		per_cpu(ext_regs_buf, cpu) = kzalloc_node(size, GFP_KERNEL,
>> +							  cpu_to_node(cpu));
>> +		if (!per_cpu(ext_regs_buf, cpu))
>> +			goto err;
>> +	}
> 
> Right now, any kmalloc() >=256b is going to be rounded up and aligned to
> a power of 2 and thus also be 64b aligned although this is just an
> implementation detail today. There's a _guarantee_ that all kmalloc()'s
> with powers of 2 are naturally aligned and also 64b aligned.
> 
> In other words, in practice, these kzalloc_node() are 64b aligned and
> rounded up to a power of 2 size.
> 
> You can *guarantee* they'll be 64b aligned by just rounding size up to
> the next power of 2. This won't increase the size because they're
> already being rounded up internally.
> 
> I can also grumble a little bit because this reinvents the wheel, and I
> suspect it'll continue reinventing the wheel when it actually sizes the
> buffer correctly.
> 
> We already have code in the kernel to dynamically allocate an fpstate:
> fpstate_realloc(). It uses vmalloc() which wouldn't be my first choice
> for this, but I also don't think it will hurt much. Looking at it, I'm
> not sure how much of it you want to refactor and reuse, but you should
> at least take a look.
>
> There's also xstate_calculate_size(). That, you _definitely_ want to use
> if you end up doing your own allocations.
> 
The fpstate_realloc() seems too complicate for this simple usage.
I will use the xstate_calculate_size() to get the size of each
component. The size is the real size after 64-byte alignment for each
component. Then the vmalloc() is used to allocate the buffer. I think it
should be good enough for this usage.

Thanks,
Kan

