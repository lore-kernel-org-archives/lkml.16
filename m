Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D082701BB
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059402; cv=none; b=n5nCsC95Ea0rLO/GBnFKjM+ETAO/shSFSCwDTf/SglPWDCLwGUMz1FD4V3hg09y9MXOVBOZ/DcvXv+Nxn4gYFWEbYaWMCHm7Z7IZgCnpThzzI6uiCPd8OMTPVHRpUNCGHMKegXYqT9WphBbyhK2Rd3f8Pq7etchIvm9Lroa9x7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059402; c=relaxed/simple;
	bh=jPFQczlSLbc2Xh08IbMCJNliLIE/LT/xCD1aHJ9YNYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VfLK80W64X3kih2BB2n2QLoYt327ohvriSL0sh32t4L6TbDT2IBtrM6k64bfdzLTJvFRo1XxGIEVZeL6zSJxSCoEpV/AsoGFTnwayAwY0qiMV0e7bCOP3O4y4N5Rn1OO6YVoEXwDY+RmeBUHu6Ud6QDCnxSrUoKw3rpPR2rdNDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UdHyAn2p; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UdHyAn2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751059401; x=1782595401;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jPFQczlSLbc2Xh08IbMCJNliLIE/LT/xCD1aHJ9YNYk=;
  b=UdHyAn2pAXv1FxYLBzKkXF7gbnncNRGhhAQ1iFDQCWK3hKy62qRf5OPf
   nKaKCZnKveP+WTho6+YmM8e2htjHL0vwLqt02LgHwOHsztKvzx0SSHVEW
   eUKBhf+rZ6R5D32SKoJo0xlpCLhpUmqErTCA3fcZYBUOaKmWHofRPay/D
   hjPDfRxJFMRd97h6CiFGx6FScCZRTBUb9yIveN/VtHzpeQO4QbRGo8m0i
   xHPFG2uEzNOlTdMoyHDSehN+F+UvRF3lCR66e+T+kTAHKQRTQOXi1b8jW
   6w3nuvATll7zF5z+kQd86jaXJ9x3AnNX4kitXcWiRymQRfPV3dWqZcfhP
   g==;
X-CSE-ConnectionGUID: EVsA2IYsRA2L2bVeVuNo2A==
X-CSE-MsgGUID: zAz9e08LRLOf8S/GimGb2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57062325"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="57062325"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:23:21 -0700
X-CSE-ConnectionGUID: JWhBvyJZSvyFkvohvUx/PA==
X-CSE-MsgGUID: Dy7Sg0EFRm+3hTZOQK8bsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="190088620"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:23:20 -0700
Received: from [10.246.136.52] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 4414320B5736;
	Fri, 27 Jun 2025 14:23:17 -0700 (PDT)
Message-ID: <d50b0407-c006-48c0-98dc-37d428d5aacf@linux.intel.com>
Date: Fri, 27 Jun 2025 17:23:15 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V2 05/13] perf/x86: Support XMM register for non-PEBS
 and REGS_USER
To: Dave Hansen <dave.hansen@intel.com>, peterz@infradead.org,
 mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
 dave.hansen@linux.intel.com, irogers@google.com, adrian.hunter@intel.com,
 jolsa@kernel.org, alexander.shishkin@linux.intel.com,
 linux-kernel@vger.kernel.org
Cc: dapeng1.mi@linux.intel.com, ak@linux.intel.com, zide.chen@intel.com,
 mark.rutland@arm.com, broonie@kernel.org, ravi.bangoria@amd.com
References: <20250626195610.405379-1-kan.liang@linux.intel.com>
 <20250626195610.405379-6-kan.liang@linux.intel.com>
 <b894739e-a0e1-4451-92c5-8bc577d3979b@intel.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <b894739e-a0e1-4451-92c5-8bc577d3979b@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-06-27 10:35 a.m., Dave Hansen wrote:
> On 6/26/25 12:56, kan.liang@linux.intel.com wrote:
>> +static void x86_pmu_get_ext_regs(struct x86_perf_regs *perf_regs, u64 mask)
>> +{
>> +	struct xregs_state *xsave = per_cpu(ext_regs_buf, smp_processor_id());
>> +
>> +	if (WARN_ON_ONCE(!xsave))
>> +		return;
>> +
>> +	xsaves_nmi(xsave, mask);
> 
> This makes me a little nervous.
> 
> Could we maybe keep a mask around that reminds us what 'ext_regs_buf'
> was sized for and then ensure that no bits in the passed-in mask are set
> in that?
>

The x86_pmu.ext_regs_mask tracks the available bits of
x86_pmu.ext_regs_buf. But it has its own format.
I will make it use the XSAVE format, and add a check here.


> I almost wonder if you want to add a
> 
> 	struct fpu_state_config fpu_perf_cfg;
> 
> I guess it's mostly overkill for this. But please do have a look at the
> data structures in:
> 
> 	arch/x86/include/asm/fpu/types.h
> 

It looks overkill. The perf usage is simple. It should be good enough to
have one mask to track the available bits. The size is from FPU's
xstate_calculate_size(). I think, as long as perf inputs the correct
mask, the size can be trusted.

>> +	if (mask & XFEATURE_MASK_SSE &&
>> +	    xsave->header.xfeatures & BIT_ULL(XFEATURE_SSE))
>> +		perf_regs->xmm_space = xsave->i387.xmm_space;
>> +}
> 
> There's a lot going on here.
> 
> 'mask' and 'xfeatures' have the exact same format. Why use
> XFEATURE_MASK_SSE for one and BIT_ULL(XFEATURE_SSE) for the other?
>

Ah, my bad. The same XFEATURE_MASK_SSE should be used.
> Why check both? How could a bit get into 'xfeatures' without being in
> 'mask'?

The 'mask' is what perf wants/configures. I think the 'xfeatures' is
what XSAVE really gives. I'm not quite sure if HW can always give us
everything we configured. If not, I think both checks are required.

I'm thinking to add the below first.

valid_mask = x86_pmu.ext_regs_mask & mask & xsave->header.xfeatures;

Then only use the valid_mask to check each XFEATURE.

> 
> How does the caller handle the fact that ->xmm_space might be written or
> not?
> 

For this series, the returned XMM value is zeroed if the ->xmm_space is
NULL.
But I should clear the nr_vectors. So nothing will be dumped to the
userspace if the ->xmm_space is not available. I will address it in V3.

Thanks,
Kan
