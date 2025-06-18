Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394CF27F4CA
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750241425; cv=none; b=reLi7R7UKpgOEVuWYFVHuz3SFws3HKcC74Nm5DH29KP8n3/kHnp4BuLoIZZ0rdkJmuGhuwEpvn3HhIICf1gwmLhxywB+hyIXzTC58kOF8M6G8cg6+CvGQSevZkWrB4nK6JZpCLEHt7ZNTNy39Dt2OvDoPaICSAs2zvgU91AL/18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750241425; c=relaxed/simple;
	bh=RdXwXdWoJ1VROaERK5qk9Ae02i8ItFcaaTjGIHpluVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pv0iVMDRT+EWYUlErxFIgjwR8jw3aGy+fXQlP6AQzvelRiiMk0X2GSKYYiYvWTVtBMSqESg0+V+2kAMW67HfDioR7BWygLjSVFatx4K103FV6y7OOjOh/uIw6swo3nDJEbfoFeIo7sDfjOqQeMuMLTlZA/HnIJlF93vZkPI39lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ea2I3wrG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ea2I3wrG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750241425; x=1781777425;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RdXwXdWoJ1VROaERK5qk9Ae02i8ItFcaaTjGIHpluVE=;
  b=ea2I3wrGoTxsddy9D7nVsATL9EauSClVjt6LZSQWWq1NrrRysiix2Sxj
   gPEupq0k5CsRZM8PiC9GwRiQJdjJeoxXuxmNdIbfUrPfB3q7O5KRCw6Yo
   ij1PcE3tEXgKMsPrd8k85NNolaRWzK0iY1qkhDlfAKNLN/XL26aJzMLoP
   Y83KgCjtbJH0SyjpxOWLHz0brbCeXtwroQf0d1s1louaTuyjg5vOlXFWz
   x6mbUtTUOJXNqFm2jWiUF4h/IA7tSeen1LNilpTMsZPzsHYjo03d7rAT1
   oh+ABPs1bDd4Xoqwl8rUQPiIWiNUd7tqDvoyV4IOCcGkqD4a3QS3lRBzZ
   w==;
X-CSE-ConnectionGUID: BBZbXZS5T8WQcRFB89ZF+A==
X-CSE-MsgGUID: qYh0T46hTEGTtRN+6RsKDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63875488"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="63875488"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 03:10:24 -0700
X-CSE-ConnectionGUID: Xm8Ce/W0TCCiSe1hZIEKDA==
X-CSE-MsgGUID: G/kjnn2ASvOSrJgiuWAQ2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="149399404"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 03:10:24 -0700
Received: from [10.246.136.52] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id A62B220B5736;
	Wed, 18 Jun 2025 03:10:21 -0700 (PDT)
Message-ID: <0782de41-c8c4-4077-8498-651fb9a10ef5@linux.intel.com>
Date: Wed, 18 Jun 2025 06:10:20 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/12] perf: Support extension of sample_regs
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Mi, Dapeng" <dapeng1.mi@linux.intel.com>, mingo@redhat.com,
 acme@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
 dave.hansen@linux.intel.com, irogers@google.com, adrian.hunter@intel.com,
 jolsa@kernel.org, alexander.shishkin@linux.intel.com,
 linux-kernel@vger.kernel.org, ak@linux.intel.com, zide.chen@intel.com,
 broonie@kernel.org
References: <20250617081458.GI1613376@noisy.programming.kicks-ass.net>
 <8fbf7fc5-2e38-4882-8835-49869b6dd47f@linux.intel.com>
 <20250617102813.GS1613376@noisy.programming.kicks-ass.net>
 <dc084dac-170d-434e-9d8c-ba11cbc8e008@linux.intel.com>
 <20250617133333.GU1613376@noisy.programming.kicks-ass.net>
 <20250617140617.GC1613633@noisy.programming.kicks-ass.net>
 <aFF6gdxVyp36ADOi@J2N7QTR9R3>
 <20250617144416.GY1613376@noisy.programming.kicks-ass.net>
 <aFGBxBVFLnkmg3CP@J2N7QTR9R3>
 <be13b2ce-a8c1-4aa7-9ddf-9ae8daee0ae1@linux.intel.com>
 <20250618093500.GH1613376@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20250618093500.GH1613376@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-06-18 5:35 a.m., Peter Zijlstra wrote:
> On Tue, Jun 17, 2025 at 04:32:24PM -0400, Liang, Kan wrote:
> 
>>> Yep, those options may work for us, but we'd need to think harder about
>>> it. Our approach for ptrace and signals has been to have a header and
>>> pack at the active vector length, so padding to a max width would be
>>> different, but maybe it's fine.
>>>
>>> Having another representation feels like a recipe waiting to happen.
>>>
>>
>> I'd like to make sure I understand correctly.
>> If we'd like an explicit predicate register word, the below change in
>> struct perf_event_attr is OK for ARM as well, right?
>>
>> 	__u16 sample_simd_pred_reg_words;
>> 	__u16 sample_simd_pred_reg_intr;
>> 	__u16 sample_simd_pred_reg_user;
>> 	__u16 sample_simd_reg_words;
>> 	__u64 sample_simd_reg_intr;
>> 	__u64 sample_simd_reg_user;
>>
>> BTW: would that be easier for ARM if changing the _words to _type?
>> You may define some types like, stream_sve, n_stream_sve, etc.
>> The output will depend on the types, rather than the max length of
>> registers.
> 
> I'm thinking what they're after is something like:
> 
> PERF_SAMPLE_SIMD_REGS := {
> 	u16 nr_vectors;
> 	u16 vector_length;
> 	u16 nr_pred;
> 	u16 pred_length;
> 	u64 data[];
> }

Maybe we should use a mask to replace the nr_vectors.
Because Dave mentioned that the XSAVES may fail.
Currently, perf gives all 0 for the failing case. But 0 should also be a
valid output.
The mask can tell the tool that some regs are failed to be collected. So
the tool can give proper feedback to the end user.

PERF_SAMPLE_SIMD_REGS := {
	u64 vectors_mask;
	u16 vector_length;
	u64 pred_mask;
	u16 pred_length;
	u64 data[];
}

Thanks,
Kan>
> Where the output data also has a length. Such that even if we ask for
> 512 bit vectors, the thing is allowed to respond with say 128 bit
> vectors if that is all the machine has at that time.
> 

