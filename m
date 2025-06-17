Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84B02EFD8C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750192351; cv=none; b=DJDPDPABjW4G81EzFNUNf3qrTBLYSDDtIilZ/QB0ozj2MmkDYoLxZ++Rh8GoKcQsbuk1Uvq01eUyBZ3aTdWWlwJ7VRs2ePLMHNEL7gIJZ7oTRsEktoan06r7Wpx7o8T/zm7Q/bSxtalhphPtAqOgsasmxVgVb5+LeLsgKZa5YSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750192351; c=relaxed/simple;
	bh=t15GzUBTFymOWyDKXqbcy1Md6W8mYGu1qrdMqwhs0cI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KhrVn+K01Ii/MxrnH4NIPN0mA8vNhiaypn0O2pti2IJ6nmx97io+qAK2Cwwcr0xuDE96yso2vzQ49p2ZG1nH5l/8FAs8M/VC18oYhLoahZK0t0K6AzKQmzr6+IUux63Xv3wtiqMbQ+b3/i4SYJF0fJ+lCMSjuSRYk6odtei3nfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7TDstPY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7TDstPY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750192349; x=1781728349;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=t15GzUBTFymOWyDKXqbcy1Md6W8mYGu1qrdMqwhs0cI=;
  b=d7TDstPYOTVReuwp65ZTtyZ+PW326gWM4L5LlIRvLZb5Xkp3eQOMYrF6
   qWRNqBZSVlEIG7+1N4wNkIZr1n5XqKa07EdCV1VYBWO5Ba1+EX9edVc78
   cIkBlIh+vLisf1A35CC5iMdczu3AQCJMuz0e4mDntDc8AzH6AGoMe/Pw/
   /6myBMzfQaVxtb75dGkpyZMJwalRYwlEbGgtRPrbYhY/hNX6nVlmOoMiN
   7yy9vs/kueq0PUhfLh3XpOp619F7L1Cck6mE1w+q6YTlkH12S206heByK
   sMfEia3BqreRkcxPsKiRRsZsjpFQd8Xgq2KOggKS8f9AVYqSWud0SVBc/
   w==;
X-CSE-ConnectionGUID: ZkcZ64HWSUCyp7g2oMCUaA==
X-CSE-MsgGUID: GINnZNIXRVKCQLSq9wAY9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56191508"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="56191508"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 13:32:28 -0700
X-CSE-ConnectionGUID: Bo19y/xBTpy9ToCWtAO74g==
X-CSE-MsgGUID: BY1X6FaJR3+A2bZrgGB70A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="148808082"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 13:32:28 -0700
Received: from [10.246.136.52] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 39CA720B5736;
	Tue, 17 Jun 2025 13:32:26 -0700 (PDT)
Message-ID: <be13b2ce-a8c1-4aa7-9ddf-9ae8daee0ae1@linux.intel.com>
Date: Tue, 17 Jun 2025 16:32:24 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/12] perf: Support extension of sample_regs
To: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>
Cc: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>, mingo@redhat.com,
 acme@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
 dave.hansen@linux.intel.com, irogers@google.com, adrian.hunter@intel.com,
 jolsa@kernel.org, alexander.shishkin@linux.intel.com,
 linux-kernel@vger.kernel.org, ak@linux.intel.com, zide.chen@intel.com,
 broonie@kernel.org
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
 <aFGBxBVFLnkmg3CP@J2N7QTR9R3>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <aFGBxBVFLnkmg3CP@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-06-17 10:55 a.m., Mark Rutland wrote:
> On Tue, Jun 17, 2025 at 04:44:16PM +0200, Peter Zijlstra wrote:
>> On Tue, Jun 17, 2025 at 03:24:01PM +0100, Mark Rutland wrote:
>>
>>> TBH, I don't think we can handle extended state in a generic way unless
>>> we treat this like a ptrace regset, and delegate the format of each
>>> specific register set to the architecture code.
>>>
>>> On arm64, the behaviour is modal (with two different vector lengths for
>>> streaming/non-streaming SVE when SME is implemented), per-task
>>> configurable (with different vector lengths), can differ between
>>> host/guest for KVM, and some of the registers only exist in some
>>> configurations (e.g. the FFR only exists for SME if FA64 is
>>> implemented).
>>
>> Well, much of this is per necessity architecture specific. But the
>> general form of vector registers is similar enough.
>>
>> The main point is to not try and cram the vector registers into multiple
>> GP regs (sadly that is exactly what x86 started doing).
> 
> I see, sorry for the noise. I completely agree that we shouldn't cram
> this stuff into GP regs.
> 
>> Anyway, your conditional length thing is 'fun' and has two solutions:
>>
>>   - the arch can refuse to create per-cpu counters with SIMD samples, or
>>
>>   - 0 pad all 'unobtainable state'.
>>
>> Same when asking for wider vectors than the hardware supports; eg.
>> asking for 512 wide registers on Intel clients will likely end up in a
>> lot of 0s for the high bits -- seeing how AVX512 is mostly a server
>> thing on Intel.
> 
> Yep, those options may work for us, but we'd need to think harder about
> it. Our approach for ptrace and signals has been to have a header and
> pack at the active vector length, so padding to a max width would be
> different, but maybe it's fine.
> 
> Having another representation feels like a recipe waiting to happen.
> 

I'd like to make sure I understand correctly.
If we'd like an explicit predicate register word, the below change in
struct perf_event_attr is OK for ARM as well, right?

	__u16 sample_simd_pred_reg_words;
	__u16 sample_simd_pred_reg_intr;
	__u16 sample_simd_pred_reg_user;
	__u16 sample_simd_reg_words;
	__u64 sample_simd_reg_intr;
	__u64 sample_simd_reg_user;

BTW: would that be easier for ARM if changing the _words to _type?
You may define some types like, stream_sve, n_stream_sve, etc.
The output will depend on the types, rather than the max length of
registers.

Thanks,
Kan

