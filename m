Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A802EB5C5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750173797; cv=none; b=jDGD9FFFrO+QnMCapfOahoHGp9onNglllzbzZvJXkT6elVpm10Ud2Yuu1czVQ9vYtjEDr6L10PJWqchvGIrdR/0ugaQl/NP77OPGE6GCsXk7ec5bRxTLHLtWN/++hRBeN38ZbclgOjBE9BkRlkTlB6dsCpjzW1gPyiToraBUuRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750173797; c=relaxed/simple;
	bh=Dt+KrVSrmSNGuK3F93xJNTFZbdAD+H9jWHKFU7o21zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DbFBx1QLQMb3RVhEZNRqyO2JdHOGvdnlyGa1tBTzX2Mp1uLqyXl8JmD3kE9BQf7cie9WpPFzOS3RlrsqNb3+X8sLrBr5bUaBVI2ggO5VBPnXQ+/rXbEQyw86G0cZFWXYplIjMhZDetw7hXjTZB8WLyhPAWJcBM0hy+0tRkyO2kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVB3l8sA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVB3l8sA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750173796; x=1781709796;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Dt+KrVSrmSNGuK3F93xJNTFZbdAD+H9jWHKFU7o21zk=;
  b=dVB3l8sAIb3mvgJ3+iXNVO7VIwLBUOce8qv5rUzODyrQiVWJvTMgsYqb
   K4KbQEWX2QeYFTPtsYffRDJdtcgbk0nqerSX9K/ioDXGnDB4eBeWO2NYd
   fvZ9cR7eeozJUpQGUp2eAy6mitJkZ4be954WjlCs/4MxiPTp89SGO/g8v
   XY5UxtJaacs9ICp4e6hltT4oFae48wO9uFigpdXl2Y6Vv2f0cw3A1Mznr
   HH/GRYXvKXFoMA2O0offdDFZg/6TQtFOQz9oSZTJF+KZv8fIo7kyGyMSO
   jd06ASpVlVIqAcQcFEqX5m2mqC8UHn6UaDfxgLdFT5FooCapcLfdr7DRc
   A==;
X-CSE-ConnectionGUID: swY1I4iWTqm4qXdAe+evZA==
X-CSE-MsgGUID: f+C9QYqeQ/OU4iCjtGX0Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52494544"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="52494544"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 08:23:14 -0700
X-CSE-ConnectionGUID: o0ujCWnJRJugwWpk5HsPyg==
X-CSE-MsgGUID: fterZ6xFR++IrqU5fj6aJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="148649558"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 08:23:13 -0700
Received: from [10.246.136.52] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 3E92520B58A2;
	Tue, 17 Jun 2025 08:21:23 -0700 (PDT)
Message-ID: <893f1888-b8cb-4976-a0d6-606460438d73@linux.intel.com>
Date: Tue, 17 Jun 2025 11:23:10 -0400
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
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 tglx@linutronix.de, dave.hansen@linux.intel.com, irogers@google.com,
 adrian.hunter@intel.com, jolsa@kernel.org,
 alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
 dapeng1.mi@linux.intel.com, ak@linux.intel.com, zide.chen@intel.com
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250617082423.GK1613376@noisy.programming.kicks-ass.net>
 <60c18595-c6a8-4c39-98fe-0822755fbdb7@linux.intel.com>
 <20250617142952.GX1613376@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20250617142952.GX1613376@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-06-17 10:29 a.m., Peter Zijlstra wrote:
> On Tue, Jun 17, 2025 at 09:52:12AM -0400, Liang, Kan wrote:
> 
>> OK. So the sample_simd_reg_words actually has another meaning now.
> 
> Well, any simd field being non-zero means userspace knows about it. Sort
> of an implicit flag.

Yes, but the tool probably wouldn't to touch any simd fields if user
doesn't ask for simd registers

> 
>> It's used as a flag to tell whether utilizing the old format.
>>
>> If so, I think it may be better to have a dedicate sample_simd_reg_flag
>> field.
>>
>> For example,
>>
>> #define SAMPLE_SIMD_FLAGS_FORMAT_LEGACY		0x0
>> #define SAMPLE_SIMD_FLAGS_FORMAT_WORDS		0x1
>>
>> 	__u8 sample_simd_reg_flags;
>> 	__u8 sample_simd_reg_words;
>> 	__u64 sample_simd_reg_intr;
>> 	__u64 sample_simd_reg_user;
>>
>> If (sample_simd_reg_flags != 0) reclaims the XMM space for APX and SPP.
>>
>> Does it make sense?
> 
> Not sure, it eats up a whole byte. Dapeng seemed to favour separate
> intr/user vector width (although I'm not quite sure what the use would
> be).
> 
> If you want an explicit bit, we might as well use one from __reserved_1,
> we still have some left.

OK. I may add a sample_simd_reg : 1 to explicitly tell kernel to utilize
the sample_simd_reg_XXX.

Thanks,
Kan
