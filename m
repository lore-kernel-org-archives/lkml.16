Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74A82ECD2F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249704; cv=none; b=pJ2IXFYZB3+AP6xLRYtBFutI3h0fYZbPkLEd95Xi/1tb+2MoLOgV1D7XzU8T4pIoYunhwHaQHI4Cf0vhWVo629RJIvva46rfR72SvbR/QLg6Vk9SOoU25bqGaUI987Kl25ejUu41p/y7s7B2NRrf73vSW6eWmRcv9gPMcsTp1o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249704; c=relaxed/simple;
	bh=o2BAxnLL85SwkNZZccfFz/jka1ibKBF3wkCMKckG9SY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tku7TwqM7I18QZKS184dk3sf1C+QQKuTYSJ7lGWCZtcVcKA+mL7O1UO8P66Qug2nTHVLA1tBS4DXozY2iyULqLqyviy0YcChK5PRYeorrqWyORdhT1sD9cT68Z8kUt/cpzQJI9UGJ3fK4Gw0csQfz006S+0uK5C3peP0ibjH/cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5msOofS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5msOofS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750249700; x=1781785700;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o2BAxnLL85SwkNZZccfFz/jka1ibKBF3wkCMKckG9SY=;
  b=I5msOofStO1gZ4zRWM0jZ4XZp1fVkESSMxbEmlXuQos7Bdr9ta3HSglV
   +6Gc7pD1meVBa+CKhwkhaqFDsWM0sYnHYvBiVCDdlklo2X85DgcxQj4Q8
   lcdxmuMOaWqEV2yvh+WQ1t8Mfn59SxasMGByP1vBcg3wveD2C16f+SUq3
   z66wsKWvcOvf7tm5eiFKHUaj988vAfuNcQKYZiuo1DopHJTr6M85Zwhx3
   af6Zb7C9J3rFGbt3VymZEJDBDyJ9jXB1KzBv/KKykRRz4qoQWYqISY5Tu
   TRkxkekwXHMEEcgjTMGYbEbqC36zPxpOOBWErPoygVLYLdGwvrE9XPnSv
   A==;
X-CSE-ConnectionGUID: QqxsnID+Rumji5Z4G9aalQ==
X-CSE-MsgGUID: UJrKRNcuTJikEdeWhPTfpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52605130"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52605130"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 05:28:18 -0700
X-CSE-ConnectionGUID: YIBtymIoQ0itpNAzmObZMg==
X-CSE-MsgGUID: 4hMdmeScQUO8Hp5SDfUZPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="150043895"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.144]) ([10.124.245.144])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 05:28:13 -0700
Message-ID: <4d4d1ca5-aab6-45be-9485-43c39b30fd62@linux.intel.com>
Date: Wed, 18 Jun 2025 20:28:11 +0800
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
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <a116761e-30bc-49bf-a1f8-9cc0ec1faae2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 6/18/2025 6:47 PM, Liang, Kan wrote:
>
> On 2025-06-17 8:57 p.m., Mi, Dapeng wrote:
>> On 6/17/2025 11:23 PM, Liang, Kan wrote:
>>> On 2025-06-17 10:29 a.m., Peter Zijlstra wrote:
>>>> On Tue, Jun 17, 2025 at 09:52:12AM -0400, Liang, Kan wrote:
>>>>
>>>>> OK. So the sample_simd_reg_words actually has another meaning now.
>>>> Well, any simd field being non-zero means userspace knows about it. Sort
>>>> of an implicit flag.
>>> Yes, but the tool probably wouldn't to touch any simd fields if user
>>> doesn't ask for simd registers
>>>
>>>>> It's used as a flag to tell whether utilizing the old format.
>>>>>
>>>>> If so, I think it may be better to have a dedicate sample_simd_reg_flag
>>>>> field.
>>>>>
>>>>> For example,
>>>>>
>>>>> #define SAMPLE_SIMD_FLAGS_FORMAT_LEGACY		0x0
>>>>> #define SAMPLE_SIMD_FLAGS_FORMAT_WORDS		0x1
>>>>>
>>>>> 	__u8 sample_simd_reg_flags;
>>>>> 	__u8 sample_simd_reg_words;
>>>>> 	__u64 sample_simd_reg_intr;
>>>>> 	__u64 sample_simd_reg_user;
>>>>>
>>>>> If (sample_simd_reg_flags != 0) reclaims the XMM space for APX and SPP.
>>>>>
>>>>> Does it make sense?
>> Not sure if I missed some discussion, but are these fields only intended
>> for SIMD regs? What about the APX extended GPRs? Suppose APX eGPRs can
>> reuse the legacy XMM bitmaps in sample_regs_user/intr[47:32], but we need
>> an extra flag to distinguish it's XMM regs or APX eGPRs, maybe add an extra
>> bit sample_egpr_reg : 1 in sample_simd_reg_words, but the *simd* word in
>> the name would become ambiguous.
> It can be used to explicitly tell the kernel that a new format is
> expected. The new format means
> - Put APX and SPP into sample_regs_user/intr[47:32]
> - Use the sample_simd_reg_*
>
> Alternatively, as Peter suggested, we can use the sample_simd_reg_words
> to imply the new format.
> If so, I will make it an union, for example.
> 	union {
> 		__u16 sample_reg_flags;
> 		__u16 sample_simd_reg_words;
> 	};
>
> The first thing the tool does should be to set sample_reg_flags = 1,
> regardless of whether simd is requested.

So just double check, as long as the sample_reg_flags
(sample_simd_reg_words) > 0, the below new format would be used.

    sample_regs_user/intr[31:0] bits unchanged, still represent the
original GPRs.

    sample_regs_user/intr[47:32] bits represents APX eGPRs R31 - R16.

    As for the SIMD regs including XMM regs, they are represented by the
dedicated SIMD regs structure ( or regs bitmap and regs word length) .

If sample_reg_flags (sample_simd_reg_words) == 0, then it falls back to
current format.

    sample_regs_user/intr[31:0] bits represent the original GPRs.

    sample_regs_user/intr[63:32] bits represent XMM regs.

If so, I think it's fine. The new format looks more reasonable than current
one.


>
>>
>>>> Not sure, it eats up a whole byte. Dapeng seemed to favour separate
>>>> intr/user vector width (although I'm not quite sure what the use would
>>>> be).
>> The reason that I prefer to add 2 separate "words" item is that user could
>> sample interrupt and user space SIMD regs (but with different bit-width)
>> simultaneously in theory, like "--intr-regs=YMM0, --user-regs=XMM0".
> I'm not sure why the user wants a different bit-width. The
> --user-regs=XMM0" doesn't seem to provide more useful information.
>
> Anyway, I believe the tool can handle this case. The tool can always ask
> YMM0 for both --intr-regs and --user-regs, but only output the XMM0 for
> --user-regs. The only drawback is that the kernel may dump extra
> information for the --user-regs. I don't think it's a big problem.
If we intent to handle it in user space tools, I'm not sure if user space
tool can easily know which records are from user space and filter out the
SIMD regs from kernel space and how complicated would the change be. IMO,
adding an extra u16 "words" would be much easier and won't consume too much
memory.


>
> Thanks,
> Kan 
>>
>>>> If you want an explicit bit, we might as well use one from __reserved_1,
>>>> we still have some left.
>>> OK. I may add a sample_simd_reg : 1 to explicitly tell kernel to utilize
>>> the sample_simd_reg_XXX.
>>>
>>> Thanks,
>>> Kan
