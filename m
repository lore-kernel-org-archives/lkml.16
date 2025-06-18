Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E666815D1
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750243713; cv=none; b=Ot9Qykjhsd3VJvaYnvJ7Qcv2nEM6qcCxcBP4Pgd26834zPPbZ4v6grhGinTP+fs/YL75pjaOVbQZMq4WPqWz1OzqvlO3RrFqZw90hXwoRhcYOpceiVjLtzcbmWg4GFTNKIL+Oz4CEPZIOBVIZ9mEKa+hopsTpV5Z5bs8XA1wDtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750243713; c=relaxed/simple;
	bh=UC+vp1feSk5Tkv6AgnISopz6yXA9QU37R2C9XLweefg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q52S+wNQNlD7sn4W0JWVMTJ7VYIPWPlfZqceli9GPtgjF3tYCFyGJT5IUYkfbJmYSCXc68q98h7DsJ8P9fT6uPxs68sTzWjqjz7jRpkXk5rPOAudbIpGAMgGenK/eLee1pplVXrrXrIwI6pPtavK2oU6IT6FGBr3FSbdcgK7Gc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zx6kSgyT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zx6kSgyT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750243712; x=1781779712;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UC+vp1feSk5Tkv6AgnISopz6yXA9QU37R2C9XLweefg=;
  b=Zx6kSgyT5xicqsC9Olqj/kDj/PUGa8O+jvgbUY24M9gtJW6KGRMpAh6J
   2h3CLlhwNSqXtnMFIJYeI4XzEEMS29Imhd+eNxqKkUYSt0lkQiIn+npjc
   n+u1C7hr30jhWmUf0geIDf9UrRQa/oq8HEviEqxcj/pWntbd3HAi3MWpY
   5i1L8/rfjHCfhlFL37/ynT+uvXrhjPsW4Qmk4ElZJPNvOyFMBNrY2ITnV
   fdGRohlQHXqjQc3cIWlx0T5m5+XSawDJedq9xOlOn0CnX9j8+nTDdIeW4
   zhLP0LFL556Q9wbzDJXakTWvJtBmxaeP0UYdM7MHy0Adagq2zwWmPX86Q
   w==;
X-CSE-ConnectionGUID: joV1cVWmSGWqkXZKLPOj3A==
X-CSE-MsgGUID: hvL+oGHcQZCiCSoGE4PM9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63115159"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="63115159"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 03:47:24 -0700
X-CSE-ConnectionGUID: r6F7MWB8TNKJrBxThsglXA==
X-CSE-MsgGUID: 85Ztn2OcT5OvUaL3kJmvIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="153393847"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 03:47:23 -0700
Received: from [10.246.136.52] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 779EA20B5736;
	Wed, 18 Jun 2025 03:47:21 -0700 (PDT)
Message-ID: <a116761e-30bc-49bf-a1f8-9cc0ec1faae2@linux.intel.com>
Date: Wed, 18 Jun 2025 06:47:20 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/12] Support vector and more extended registers in
 perf
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 tglx@linutronix.de, dave.hansen@linux.intel.com, irogers@google.com,
 adrian.hunter@intel.com, jolsa@kernel.org,
 alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
 ak@linux.intel.com, zide.chen@intel.com
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250617082423.GK1613376@noisy.programming.kicks-ass.net>
 <60c18595-c6a8-4c39-98fe-0822755fbdb7@linux.intel.com>
 <20250617142952.GX1613376@noisy.programming.kicks-ass.net>
 <893f1888-b8cb-4976-a0d6-606460438d73@linux.intel.com>
 <1121293d-777e-4c21-b1ad-d34516d2cd3a@linux.intel.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <1121293d-777e-4c21-b1ad-d34516d2cd3a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2025-06-17 8:57 p.m., Mi, Dapeng wrote:
> 
> On 6/17/2025 11:23 PM, Liang, Kan wrote:
>>
>> On 2025-06-17 10:29 a.m., Peter Zijlstra wrote:
>>> On Tue, Jun 17, 2025 at 09:52:12AM -0400, Liang, Kan wrote:
>>>
>>>> OK. So the sample_simd_reg_words actually has another meaning now.
>>> Well, any simd field being non-zero means userspace knows about it. Sort
>>> of an implicit flag.
>> Yes, but the tool probably wouldn't to touch any simd fields if user
>> doesn't ask for simd registers
>>
>>>> It's used as a flag to tell whether utilizing the old format.
>>>>
>>>> If so, I think it may be better to have a dedicate sample_simd_reg_flag
>>>> field.
>>>>
>>>> For example,
>>>>
>>>> #define SAMPLE_SIMD_FLAGS_FORMAT_LEGACY		0x0
>>>> #define SAMPLE_SIMD_FLAGS_FORMAT_WORDS		0x1
>>>>
>>>> 	__u8 sample_simd_reg_flags;
>>>> 	__u8 sample_simd_reg_words;
>>>> 	__u64 sample_simd_reg_intr;
>>>> 	__u64 sample_simd_reg_user;
>>>>
>>>> If (sample_simd_reg_flags != 0) reclaims the XMM space for APX and SPP.
>>>>
>>>> Does it make sense?
> 
> Not sure if I missed some discussion, but are these fields only intended
> for SIMD regs? What about the APX extended GPRs? Suppose APX eGPRs can
> reuse the legacy XMM bitmaps in sample_regs_user/intr[47:32], but we need
> an extra flag to distinguish it's XMM regs or APX eGPRs, maybe add an extra
> bit sample_egpr_reg : 1 in sample_simd_reg_words, but the *simd* word in
> the name would become ambiguous.

It can be used to explicitly tell the kernel that a new format is
expected. The new format means
- Put APX and SPP into sample_regs_user/intr[47:32]
- Use the sample_simd_reg_*

Alternatively, as Peter suggested, we can use the sample_simd_reg_words
to imply the new format.
If so, I will make it an union, for example.
	union {
		__u16 sample_reg_flags;
		__u16 sample_simd_reg_words;
	};

The first thing the tool does should be to set sample_reg_flags = 1,
regardless of whether simd is requested.

> 
> 
>>> Not sure, it eats up a whole byte. Dapeng seemed to favour separate
>>> intr/user vector width (although I'm not quite sure what the use would
>>> be).
> 
> The reason that I prefer to add 2 separate "words" item is that user could
> sample interrupt and user space SIMD regs (but with different bit-width)
> simultaneously in theory, like "--intr-regs=YMM0, --user-regs=XMM0".

I'm not sure why the user wants a different bit-width. The
--user-regs=XMM0" doesn't seem to provide more useful information.

Anyway, I believe the tool can handle this case. The tool can always ask
YMM0 for both --intr-regs and --user-regs, but only output the XMM0 for
--user-regs. The only drawback is that the kernel may dump extra
information for the --user-regs. I don't think it's a big problem.

Thanks,
Kan 
> 
> 
>>>
>>> If you want an explicit bit, we might as well use one from __reserved_1,
>>> we still have some left.
>> OK. I may add a sample_simd_reg : 1 to explicitly tell kernel to utilize
>> the sample_simd_reg_XXX.
>>
>> Thanks,
>> Kan

