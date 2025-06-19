Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CCC14F9F7
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343247; cv=none; b=tpQPINmEOFZBZPIxT2fN73TbmplvhoSuAzqImmM0PLJmuL6KKB3IJroqLm0OD4NPCRwPd1jpSdQDqmluslR1VuRroDiaPF/Jugo8stCGWoAgBgDX0ZLJxswNsUZGjfdlwPMTk+zdKqb31pba+VjHkkPyM/kwklwFAmzoWbKmlXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343247; c=relaxed/simple;
	bh=96VZVcOaEePrbsRqXqLIw1mC+tHHrqlFr4X9SuP6lsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUER1B2aW1K9tHENJw7OgmFZRJaoTJhFWE73dW/paEJ17PbdxzrSzcmiuV5DQ35iNTXyK1MJ0yzxeiKGPPX/2yKJUHl4sILsA5zewSAYX1PRT/yS3xe56okBOi+bkHGyuyYPlqe3GSeqPaYyopfY4xmvedkYHP8n7sBr+9YPrW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wle3RJHO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wle3RJHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750343246; x=1781879246;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=96VZVcOaEePrbsRqXqLIw1mC+tHHrqlFr4X9SuP6lsA=;
  b=Wle3RJHO/gDfcyovMy71y4bSlnBCN2ALDbeMlygoVOA7jjuOdhdTmPji
   b84Zu6hIllrAffhyD15M+qTjp7zGgp7Fni3gJ5C/SUHvja9PadARbTgap
   orTzW5oetLYpfI44maXPv0aTny+yH1Dr6kz7nTB5G5xw+m8pp4k4LGVMl
   wSJhZOc//1OCjwiKop81lw4V4WyujmOB24JhGEAegsZwUl4lHfw6XVBYP
   FDhjxhZRD2dAdf99525dlhCveZj9ziuMFB+hJ5m7WhLN6IKWdD9JtzHp9
   7sIS4J8FgSFpsuzFtUPiQVD110ZzXC99aUavJaJ3KH63W+HTOtjNRoAS0
   w==;
X-CSE-ConnectionGUID: aHtqkwBFRhOH6mCKDLAs6A==
X-CSE-MsgGUID: sbWUEMHdSt2ekWBXzruXag==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="75128224"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="75128224"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 07:27:25 -0700
X-CSE-ConnectionGUID: UbsN8lZhRlOJYipOw53GzA==
X-CSE-MsgGUID: rREHy15uR3W8GtPHoFN4cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150790594"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 07:27:24 -0700
Received: from [10.246.136.52] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 6B7CB20B5736;
	Thu, 19 Jun 2025 07:27:22 -0700 (PDT)
Message-ID: <3f1c9a9e-cb63-47ff-a5e9-06555fa6cc9a@linux.intel.com>
Date: Thu, 19 Jun 2025 10:27:21 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/12] Support vector and more extended registers in
 perf
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, tglx@linutronix.de, dave.hansen@linux.intel.com,
 irogers@google.com, adrian.hunter@intel.com, jolsa@kernel.org,
 alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
 ak@linux.intel.com, zide.chen@intel.com
References: <20250617082423.GK1613376@noisy.programming.kicks-ass.net>
 <60c18595-c6a8-4c39-98fe-0822755fbdb7@linux.intel.com>
 <20250617142952.GX1613376@noisy.programming.kicks-ass.net>
 <893f1888-b8cb-4976-a0d6-606460438d73@linux.intel.com>
 <1121293d-777e-4c21-b1ad-d34516d2cd3a@linux.intel.com>
 <a116761e-30bc-49bf-a1f8-9cc0ec1faae2@linux.intel.com>
 <4d4d1ca5-aab6-45be-9485-43c39b30fd62@linux.intel.com>
 <5aabcb15-0def-4f73-b4dd-03c958192d67@linux.intel.com>
 <1bc9de32-2599-483f-8c6a-6da59f8d9549@linux.intel.com>
 <d97fc799-ab9b-4c6a-a77e-8b542ac82efa@linux.intel.com>
 <20250619133823.GG1613376@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20250619133823.GG1613376@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-06-19 9:38 a.m., Peter Zijlstra wrote:
> On Thu, Jun 19, 2025 at 07:11:23AM -0400, Liang, Kan wrote:
> 
>> @@ -543,6 +544,24 @@ struct perf_event_attr {
>>  	__u64	sig_data;
>>
>>  	__u64	config3; /* extension of config2 */
>> +
>> +
>> +	/*
>> +	 * Defines set of SIMD registers to dump on samples.
>> +	 * The sample_simd_req_enabled !=0 implies the
>> +	 * set of SIMD registers is used to config all SIMD registers.
>> +	 * If !sample_simd_req_enabled, sample_regs_XXX may be used to
>> +	 * config some SIMD registers on X86.
>> +	 */
>> +	union {
>> +		__u16 sample_simd_reg_enabled;
>> +		__u16 sample_simd_pred_reg_qwords;
>> +	};
>> +	__u16 sample_simd_pred_reg_intr;
>> +	__u16 sample_simd_pred_reg_user;
> 
> This limits things to max 16 predicate registers. ARM will fully fill
> that with present hardware.

I think I can use __u32 for predicate registers.
It means we need one more u64 for the qwords. It should not be a problem.

> 
>> +	__u16 sample_simd_reg_qwords;
>> +	__u64 sample_simd_reg_intr;
>> +	__u64 sample_simd_reg_user;
> 
> I would perhaps make this vec_reg.

Sure.

> 
>>  };
>>
>>  /*
>> @@ -1016,7 +1035,15 @@ enum perf_event_type {
>>  	 *      } && PERF_SAMPLE_BRANCH_STACK
>>  	 *
>>  	 *	{ u64			abi; # enum perf_sample_regs_abi
>> -	 *	  u64			regs[weight(mask)]; } && PERF_SAMPLE_REGS_USER
>> +	 *	  u64			regs[weight(mask)];
>> +	 *	  struct {
>> +	 *	  	u16 nr_vectors;
>> +	 *	  	u16 vector_qwords;
>> +	 *	  	u16 nr_pred;
>> +	 *	  	u16 pred_qwords;
>> +	 *	  	u64 data[nr_vectors * vector_qwords + nr_pred * pred_qwords];
>> +	 *	  } && sample_simd_reg_enabled
> 
> Instead of using sample_simd_reg_enabled here I would perhaps extend
> perf_sample_regs_abi. The current abi word is woefully underused.
> 

Yes. Now I think the abi is used like a version number. I guess I can
add PERF_SAMPLE_REGS_ABI_SIMD and change it to a bitmap.
There should be no impact on the existing tool, since version and bitmap
are the same for 1 and 2.
 enum perf_sample_regs_abi {
-       PERF_SAMPLE_REGS_ABI_NONE               = 0,
-       PERF_SAMPLE_REGS_ABI_32                 = 1,
-       PERF_SAMPLE_REGS_ABI_64                 = 2,
+       PERF_SAMPLE_REGS_ABI_NONE               = 0x0,
+       PERF_SAMPLE_REGS_ABI_32                 = 0x1,
+       PERF_SAMPLE_REGS_ABI_64                 = 0x2,
+       PERF_SAMPLE_REGS_ABI_SIMD               = 0x4,
 };

> Also, realistically, what you want to look at here is:
> 
>   sample_simd_{pred,vec}_reg_user;
> 
> If those are empty, there will be no registers.

Sure. But I will still keep the sample_simd_reg_enabled, since it can
explicitly tell if the new format is used.

Thanks,
Kan

> 
>> +	 *	} && PERF_SAMPLE_REGS_USER
>>  	 *
>>  	 *	{ u64			size;
>>  	 *	  char			data[size];
> 

