Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A6C2EA736
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750254739; cv=none; b=UOJ4T5xgFB4ycW5X8SYzT9iGsu87xOirVxcGmRkF9+dbZIunvI7LNsPATGZoE3T2Da61K4VCyTaxdIfsSQPbMmAEQK5dzzACR1s+wj7Y9Fh7a7g58iWEBqs3B7O0KptC361faEQsvkUHG7wTNNYPOjtrkBGLKJV4dTHV7HKUfSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750254739; c=relaxed/simple;
	bh=YcQczEigCA+00/Vfn5RgoirKqglbhdy79e75P6T2DMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXrxTaCPMtH7b4yFUDMDdtKsE4nO3Slb5xb+e6FVdFCUyKa0lx3rz4ZJ/nB5WKDrE9VK3rnlmJN0l+2CTpnxNF4+flWB4/CEdIdrnGap8Nu28Tqhc/hYTb43lmKFNeUaEiTCC6YIQYJuewRbIFFX8pmBlxLqdIGlor6KOqgULWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4Bbd5nC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4Bbd5nC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750254738; x=1781790738;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YcQczEigCA+00/Vfn5RgoirKqglbhdy79e75P6T2DMk=;
  b=O4Bbd5nCq4zFBMEUR5dr6/iR+MJw9YXPJXF80l6KjeO/WNffvQk4Y3hH
   EPnrnmWyVjFnTM7wNBMYF8vnCRAOYbRLGHECBGs+MzJxVTonQcMB+ohNv
   nMTnArjIaWaFk58aJUBa7wmEjVkLo0rGhFg8lsLSQN1EA0Dv0Q/lboJJA
   wmoNKZ2fe1BOWsvPklLfobUfg4lVDa8Rqn3RYJr/PCMly3a0pp2XUtmhz
   ehsd1ubXEQRFSfiNXGPIFT0ZIQs0jvcToJX43wF4DCt/r5b2XE791oAT/
   xRAEud9lQyzjqxFB2lE5cEx0RuAQBifaGK16Nsj3o7NxTBWLws+AoLLT9
   w==;
X-CSE-ConnectionGUID: 9cdTGWNGRdG/+YCBBDqV0g==
X-CSE-MsgGUID: +PnxSfj1Q0aDhHkaeuuqMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52450050"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52450050"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 06:52:16 -0700
X-CSE-ConnectionGUID: h8itLsj1T+a/n09iqSTyaQ==
X-CSE-MsgGUID: seNFEsYhRvenjoLMIhz7EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="150312292"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 06:52:16 -0700
Received: from [10.246.136.52] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 7DB6720B5736;
	Wed, 18 Jun 2025 06:52:13 -0700 (PDT)
Message-ID: <99087e26-192f-4fa6-b43b-0c6a39c45b38@linux.intel.com>
Date: Wed, 18 Jun 2025 09:52:12 -0400
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
References: <20250617102813.GS1613376@noisy.programming.kicks-ass.net>
 <dc084dac-170d-434e-9d8c-ba11cbc8e008@linux.intel.com>
 <20250617133333.GU1613376@noisy.programming.kicks-ass.net>
 <20250617140617.GC1613633@noisy.programming.kicks-ass.net>
 <aFF6gdxVyp36ADOi@J2N7QTR9R3>
 <20250617144416.GY1613376@noisy.programming.kicks-ass.net>
 <aFGBxBVFLnkmg3CP@J2N7QTR9R3>
 <be13b2ce-a8c1-4aa7-9ddf-9ae8daee0ae1@linux.intel.com>
 <20250618093500.GH1613376@noisy.programming.kicks-ass.net>
 <0782de41-c8c4-4077-8498-651fb9a10ef5@linux.intel.com>
 <20250618133003.GC1613200@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20250618133003.GC1613200@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-06-18 9:30 a.m., Peter Zijlstra wrote:
> On Wed, Jun 18, 2025 at 06:10:20AM -0400, Liang, Kan wrote:
> 
>> Maybe we should use a mask to replace the nr_vectors.
>> Because Dave mentioned that the XSAVES may fail.
> 
> XSAVE is a pain in the arse :/
> 
>> PERF_SAMPLE_SIMD_REGS := {
>> 	u64 vectors_mask;
>> 	u16 vector_length;
>> 	u64 pred_mask;
>> 	u16 pred_length;
> 
> That is not u64 aligned...

I didn't know we have the alignment requirement for the output.
If so,

PERF_SAMPLE_SIMD_REGS := {
	u64 vectors_mask;
	u64 pred_mask;
	u64 vector_length:16,
	    pred_length:16,
	    reserved:32;
	u64 data[];
}

Thanks,
Kan>
>> 	u64 data[];
>> }

