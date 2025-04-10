Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62041EE00B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744307601; cv=none; b=aw0zQaq6lU7ytpjdIJgLpJrv3b72cMnX/l1kXenbwVBWTPBWjC/yrvR/ZGgo5+VR5/lT0IHkyHyHCO40GnhpVntIAz71LQIOSlZejpEoUScWnl9EHywVomKZnwSgEcUiiKipBXeo599QfsMJjSY9S5oSKq2lRN6SAgWDgyofhAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744307601; c=relaxed/simple;
	bh=gxva1rAebWfVRSrf0nVdivA/MjHnHfG8k1OxwX+d3XQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ItkvczHNbHd7zQSW48Kuy7SN9wIuHhY8ITJ2+qxiGAhS5cVSVVSel4LNcWPgvmaEf8gr4GL59N7oeoPswr6RFiouzy3p91J6yUia6EaiXGhl3xsJDLoAHKUYRbGpn724MPWVb7d4T4bYjTi7BfufYNZSfEDPnydFclBUnrESksQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=YbfuYgnM; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="YbfuYgnM"
Received: from [192.168.7.202] ([71.202.166.45])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53AHquZq030148
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 10 Apr 2025 10:52:57 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53AHquZq030148
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1744307577;
	bh=RRfvNtGDt5dpjtAj1MBCir97SoCz2V+949l3EWxyUYU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YbfuYgnMWA/lFJ7FLQFOGGsCfoBRboxMPV9HYnvTXH97F2AuXGcNaUWATrbDdljFH
	 e6001ZMEHWw7DuIaaTHQw5anmJAW9KZMCYAazGUb6GG4C6wSd7poSK+xIY3UDxRL4s
	 3x29jT+gF3NqDDVsxftQDL/inYMWGAf38r8QqwDYMDID4P/XU3C1NBg254+EvZIHOY
	 JkclQD8QP3pHFr2xCsf3z9UHtf2FrGJXWeVeRLGkbBAKjfr8sxsxQiRlr1M/vYUyrT
	 e4K5J8osn/uxUNX0knRlHaMRPiA6fJlgaLgZ3Jg9yH1b7KH1XtwetyTuftjRxtMZrF
	 uDsGjfQ9J1ANA==
Message-ID: <4dc7b54a-463c-4801-9c68-a6ff6edf9ad2@zytor.com>
Date: Thu, 10 Apr 2025 10:52:56 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpufeatures: Clean up formatting
To: Borislav Petkov <bp@alien8.de>
Cc: Borislav Petkov <bp@kernel.org>, X86 ML <x86@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20250410165434.20648-1-bp@kernel.org>
 <a8782d3a-9c22-48c3-916f-29babc58db5f@zytor.com>
 <20250410172514.GFZ_f--kaKKxF-Y6WZ@fat_crate.local>
Content-Language: en-US
From: Xin Li <xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <20250410172514.GFZ_f--kaKKxF-Y6WZ@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/2025 10:25 AM, Borislav Petkov wrote:
> On Thu, Apr 10, 2025 at 10:11:56AM -0700, Xin Li wrote:
>> On 4/10/2025 9:54 AM, Borislav Petkov wrote:
>>> @@ -477,10 +477,10 @@
>>>    #define X86_FEATURE_BHI_CTRL		(21*32+ 2) /* BHI_DIS_S HW control available */
>>>    #define X86_FEATURE_CLEAR_BHB_HW	(21*32+ 3) /* BHI_DIS_S HW control enabled */
>>>    #define X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT (21*32+ 4) /* Clear branch history at vmexit using SW loop */
>>> -#define X86_FEATURE_AMD_FAST_CPPC	(21*32 + 5) /* Fast CPPC */
>>> -#define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneous Core Topology */
>>> -#define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classification */
>>> -#define X86_FEATURE_PREFER_YMM		(21*32 + 8) /* Avoid ZMM registers due to downclocking */
>>> +#define X86_FEATURE_AMD_FAST_CPPC	(21*32+ 5) /* Fast CPPC */
>>> +#define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32+ 6) /* Heterogeneous Core Topology */
>>> +#define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32+ 7) /* Workload Classification */
>>> +#define X86_FEATURE_PREFER_YMM		(21*32+ 8) /* Avoid ZMM registers due to downclocking */
>>
>> Ha, I did a similar cleanup with adding the immediate MSR instruction
>> support (you asked to use scattered):
>>
>> https://lore.kernel.org/lkml/20250331082251.3171276-9-xin@zytor.com/
> 
> Except you're moving the numbers one column to the right while the other
> columns remain at that indentation.
> 
> Instead of re-tabulating that whole file, I think we should simply shorten
> those
> 
> X86_FEATURE_AMD_HETEROGENEOUS_CORES and X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT
> 
> straddlers.

Good idea.

I ever had a patch in which the last column of the same type macros are
not aligned and tglx asked me to make them aligned.  But that didn't
need any name shortened.

Thanks!
     Xin
