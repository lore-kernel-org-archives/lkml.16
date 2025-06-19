Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF3917555
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750293701; cv=none; b=eWjGIyVscnC5oL0ATo6JlO390tuYHZN3FwHw6Yq13cWl1lZptoNLBl00OBr/0IpJeZiXbZXli9/YDO5sgPnz/L4IgnwVm4WdmkCzY/BQzcWYGC29dL2IwTnkXU7AhiLkg0HK7woCcFprkHQsesXte8v3pCF5gGor9TgFbbqb8P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750293701; c=relaxed/simple;
	bh=LleIrN8MZyzl9RFR1RSUc12aKr0LN0C3UZ3CdhO3x54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1iTK+SN7t56FG5pe0Iq6drZX2ofdNF5N6tQVZu6RVd+Dvp79XB3+ZPntCTwU4WmEohj5Ztdpe8k6e1Qx5n3+muEt2RGE5GdErfJ36fExdsvmS2kb/3zO3EtXmmMdzZjH81a1gfNBXNZ0/NWAGA1jNvLNj4pp4dj3oOQqoA3qmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iY9RjalE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iY9RjalE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750293699; x=1781829699;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LleIrN8MZyzl9RFR1RSUc12aKr0LN0C3UZ3CdhO3x54=;
  b=iY9RjalEcHau+frkBAi7q26oiIVdhVsv+9M5QZKpjBhgXuqmLHXCRPy2
   upLqOm+T8b5spZQFOrAoHR7ybpDnDOHo2GKWQKjX7xqpDnQGnijQGT/dg
   911YQPQouy1dEbEHr27IaO51itwKjZSK0tb2Ie7TWItH4wU5d9wnoWNiO
   J3BPh3OJsuwMziqlbAc0yHL7Z29gUD4lOwlwb5HHxEUCTJPOBM5KeOQW3
   tRN6tXle5fCI99ezU9eQxTb7qgETjEsuOrp9ubafYt4S1I9sDPgWYnFko
   SWVGQ+ZGnoHuLPFPOAbLLjshl6ImhYUuBlEaKn4CYO3AWLH9zmNbdKVyE
   w==;
X-CSE-ConnectionGUID: cKam+HgESAmhF6Q87hqt0A==
X-CSE-MsgGUID: J4ZJIiEKSGuc25taUv4zxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63891733"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="63891733"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 17:41:36 -0700
X-CSE-ConnectionGUID: yRKdkERLTBavUvJPAb9d2Q==
X-CSE-MsgGUID: ACQmw2l7RSKyL5jYmbiTAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="149903235"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.144]) ([10.124.245.144])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 17:41:33 -0700
Message-ID: <1bc9de32-2599-483f-8c6a-6da59f8d9549@linux.intel.com>
Date: Thu, 19 Jun 2025 08:41:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/12] Support vector and more extended registers in
 perf
To: "Liang, Kan" <kan.liang@linux.intel.com>,
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
 <a116761e-30bc-49bf-a1f8-9cc0ec1faae2@linux.intel.com>
 <4d4d1ca5-aab6-45be-9485-43c39b30fd62@linux.intel.com>
 <5aabcb15-0def-4f73-b4dd-03c958192d67@linux.intel.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <5aabcb15-0def-4f73-b4dd-03c958192d67@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 6/18/2025 9:15 PM, Liang, Kan wrote:
>
> On 2025-06-18 8:28 a.m., Mi, Dapeng wrote:
>>>>>> Not sure, it eats up a whole byte. Dapeng seemed to favour separate
>>>>>> intr/user vector width (although I'm not quite sure what the use would
>>>>>> be).
>>>> The reason that I prefer to add 2 separate "words" item is that user could
>>>> sample interrupt and user space SIMD regs (but with different bit-width)
>>>> simultaneously in theory, like "--intr-regs=YMM0, --user-regs=XMM0".
>>> I'm not sure why the user wants a different bit-width. The
>>> --user-regs=XMM0" doesn't seem to provide more useful information.
>>>
>>> Anyway, I believe the tool can handle this case. The tool can always ask
>>> YMM0 for both --intr-regs and --user-regs, but only output the XMM0 for
>>> --user-regs. The only drawback is that the kernel may dump extra
>>> information for the --user-regs. I don't think it's a big problem.
>> If we intent to handle it in user space tools, I'm not sure if user space
>> tool can easily know which records are from user space and filter out the
>> SIMD regs from kernel space and how complicated would the change be. IMO,
>> adding an extra u16 "words" would be much easier and won't consume too much
>> memory.
> The filter is always done in kernel for --user-regs. The only difference
> is that the YMM (after filter) will be dumped to the perf.data. The tool
> just show the XMM registers to the end user.

Ok. But there could be another case, user may want to sample some APX eGPRs
in user space and sample SIMD regs in interrupt, like "--intr-regs=YMM0,
--user-regs=R16", then we have to define 2 separate "words" fields.

Anyway, it looks we would define a SIMD_REGS structure like below, and I
suppose we would create 2 instances, one is for interrupt, the other is for
user space. It's enough.

PERF_SAMPLE_SIMD_REGS := {
	u16 nr_vectors;
	u16 vector_length;
	u16 nr_pred;
	u16 pred_length;
	u64 data[];
}


>
> Thanks,
> Kan
>
>
