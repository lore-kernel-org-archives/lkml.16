Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AAB29A5
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 00:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750208243; cv=none; b=FZ/MVwZCCZWyCHF/0uCQdsmhC3N05PQ/vbP99VOSF2khhMzpjfPZVy+4IXLzLg8mhifOwiP6uLUjCR8d8no6oYSt83ftMp/ijxv0w2rflUgbPvx8849G4g0/p/Ch0SSKM6Iaeq4iezvrGcu7CXqLhRAXLN/MpozSIpemoiG9z/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750208243; c=relaxed/simple;
	bh=/U983oidABPBKid+50MSlmLfbJYindpPjJ9Zn9q7y6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TY3zsO8wovsbNH8/xc9YFCQzLkwYoM7L3D4lzIX65fnHqV795pMO0kZF/ULVwcwpuNhXHssZHs5zCLYIRxnii8vkIdkL6cfypG3psShYrUbocvn/i3e8PLwZJAhQtvCsWZkcRRRQxeYtcL4C/Yy64tu3kSlWoKdSMiOnd2JAlL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3dTvJ8b; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3dTvJ8b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750208242; x=1781744242;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/U983oidABPBKid+50MSlmLfbJYindpPjJ9Zn9q7y6w=;
  b=I3dTvJ8bJ8I9+S39lDuCrqVUaY+QWM08OCLc4A6F7EfuB10OCCGSkjJA
   D5Al9qCshV5xz8s+ais5c8kWXMdw1sG4KvaVPya+ICc9TvmWWwf52ShGE
   8fEpVaQhUejYWk7fa3FlTaMb3klnQ8vCnoNVvnyyMMBSN/Ldfn9Ubvm+o
   EnH8ill1JLBIFK+xcqVWhs22OHZaGtEqJi/aR/LiOd87b3dg3mq0KqMue
   LADmuUraIIs3fzB7BnNiC7FOGxNval+jlCPU0HxS5HR5wAij+G4vHtjOH
   DJK2stnbv+Y4z9FaeOVy0jnPRmCHOvQxmyrtcvGEsLViEp7ePzj9ztuR0
   Q==;
X-CSE-ConnectionGUID: paaDtOE0Rrq+9wB2+UX7OA==
X-CSE-MsgGUID: rPY0IkH3RSqgBdwzkpjUKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63446910"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="63446910"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 17:57:22 -0700
X-CSE-ConnectionGUID: LKk0lz66SeSbvbDn4w5amw==
X-CSE-MsgGUID: SBmqepk7SEqbcvqynfphFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="186345646"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.144]) ([10.124.245.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 17:57:18 -0700
Message-ID: <1121293d-777e-4c21-b1ad-d34516d2cd3a@linux.intel.com>
Date: Wed, 18 Jun 2025 08:57:15 +0800
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
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <893f1888-b8cb-4976-a0d6-606460438d73@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 6/17/2025 11:23 PM, Liang, Kan wrote:
>
> On 2025-06-17 10:29 a.m., Peter Zijlstra wrote:
>> On Tue, Jun 17, 2025 at 09:52:12AM -0400, Liang, Kan wrote:
>>
>>> OK. So the sample_simd_reg_words actually has another meaning now.
>> Well, any simd field being non-zero means userspace knows about it. Sort
>> of an implicit flag.
> Yes, but the tool probably wouldn't to touch any simd fields if user
> doesn't ask for simd registers
>
>>> It's used as a flag to tell whether utilizing the old format.
>>>
>>> If so, I think it may be better to have a dedicate sample_simd_reg_flag
>>> field.
>>>
>>> For example,
>>>
>>> #define SAMPLE_SIMD_FLAGS_FORMAT_LEGACY		0x0
>>> #define SAMPLE_SIMD_FLAGS_FORMAT_WORDS		0x1
>>>
>>> 	__u8 sample_simd_reg_flags;
>>> 	__u8 sample_simd_reg_words;
>>> 	__u64 sample_simd_reg_intr;
>>> 	__u64 sample_simd_reg_user;
>>>
>>> If (sample_simd_reg_flags != 0) reclaims the XMM space for APX and SPP.
>>>
>>> Does it make sense?

Not sure if I missed some discussion, but are these fields only intended
for SIMD regs? What about the APX extended GPRs? Suppose APX eGPRs can
reuse the legacy XMM bitmaps in sample_regs_user/intr[47:32], but we need
an extra flag to distinguish it's XMM regs or APX eGPRs, maybe add an extra
bit sample_egpr_reg : 1 in sample_simd_reg_words, but the *simd* word in
the name would become ambiguous.


>> Not sure, it eats up a whole byte. Dapeng seemed to favour separate
>> intr/user vector width (although I'm not quite sure what the use would
>> be).

The reason that I prefer to add 2 separate "words" item is that user could
sample interrupt and user space SIMD regs (but with different bit-width)
simultaneously in theory, like "--intr-regs=YMM0, --user-regs=XMM0". 


>>
>> If you want an explicit bit, we might as well use one from __reserved_1,
>> we still have some left.
> OK. I may add a sample_simd_reg : 1 to explicitly tell kernel to utilize
> the sample_simd_reg_XXX.
>
> Thanks,
> Kan
