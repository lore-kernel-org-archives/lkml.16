Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765DD1F3B83
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749838452; cv=none; b=B5mWWkApf1ZIHf4FBZC8mB/7DRQmnHQGmVtDwhVwcjkQxPFsKwJIG21l1u1XA7a34imUZ0OFg8kYrH41csWi8ogQGxouKd7QKPXD9LJXL985nWemMww05HjxF1641ZcI7lszXWjJM/293Gd2LUGpEDnNzw6zicVHc+qiYaqobRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749838452; c=relaxed/simple;
	bh=pHIhBgCbxbw/wEXaEwfr43QBMvmKgvIYdQnGS+UjHQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mzAI4zY/UuKZwNAg13+TocV3KMqDCBY32+uYbNjX30pdJ74Pym9syWesfyUJyhENZr3zFSLX9dO1ELWrwOoiVgpR4uCb0XX6EJocCHKMg4e9SiAJKqMYz1ojG0Egv8BUBjN6H7w2UM5EVf6aIm1JPDogNbA9TcuaBOFO5dOHxdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlsijBi4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlsijBi4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749838450; x=1781374450;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pHIhBgCbxbw/wEXaEwfr43QBMvmKgvIYdQnGS+UjHQ4=;
  b=BlsijBi4Y7uejLfacpDZX5KSfTmh7MFnz5k40/BMan58y3PkFqTqNZK5
   9EptlxZmPDTKVSi3Y+J4P863Qvid9mdy7LVAycokPO+bVA5mFa4htPe0x
   17wMxXsMQwbsW10o5NKx1ICZl2q7+9jO4fxpI9R6IoVikF3mheFKEyJba
   n/YJg5HK6nLE4fZgLrvxPVSDS6X/LG7alb5cxg21XRsbSvvgEbqyt+gaw
   JQqYnaq2pZZZXLpmdGODPunRIQaQ5iohLsz73MOq49PCzJMbF+iSkpWC4
   MWlMS2Dn3EFnY87UJrVXyPphKrX68sldDnRcnVJSpjiRjgNK4V+u9dbT2
   A==;
X-CSE-ConnectionGUID: 55rKjbwlQQO4+j3tgfM2ZA==
X-CSE-MsgGUID: USNu6Cz+RzO+1/Bi2KleGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52159415"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="52159415"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 11:14:09 -0700
X-CSE-ConnectionGUID: ET1ejHN3TSmOXldNjbfPqg==
X-CSE-MsgGUID: Y5kKJ9lMTG20hLZ8siEUqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="148363399"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 11:14:08 -0700
Received: from [10.246.136.52] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id CE84D20B5736;
	Fri, 13 Jun 2025 11:14:06 -0700 (PDT)
Message-ID: <067e0923-d904-4382-bf49-34083f9927e7@linux.intel.com>
Date: Fri, 13 Jun 2025 14:14:05 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/12] perf/x86: Support XMM register for non-PEBS and
 REGS_USER
To: Dave Hansen <dave.hansen@intel.com>, peterz@infradead.org,
 mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
 dave.hansen@linux.intel.com, irogers@google.com, adrian.hunter@intel.com,
 jolsa@kernel.org, alexander.shishkin@linux.intel.com,
 linux-kernel@vger.kernel.org
Cc: dapeng1.mi@linux.intel.com, ak@linux.intel.com, zide.chen@intel.com
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250613134943.3186517-6-kan.liang@linux.intel.com>
 <9054bf0d-85db-4bd4-9f67-7c71d7866e6a@intel.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <9054bf0d-85db-4bd4-9f67-7c71d7866e6a@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2025-06-13 11:34 a.m., Dave Hansen wrote:
> On 6/13/25 06:49, kan.liang@linux.intel.com wrote:
>> +static void x86_pmu_get_ext_regs(struct x86_perf_regs *perf_regs, u64 mask)
>> +{
>> +	void *xsave = (void *)ALIGN((unsigned long)per_cpu(ext_regs_buf, smp_processor_id()), 64);
>> +	struct xregs_state *xregs_xsave = xsave;
>> +	u64 xcomp_bv;
>> +
>> +	if (WARN_ON_ONCE(!xsave))
>> +		return;
>> +
>> +	xsaves_nmi(xsave, mask);
>> +
>> +	xcomp_bv = xregs_xsave->header.xcomp_bv;
>> +	if (mask & XFEATURE_MASK_SSE && xcomp_bv & XFEATURE_SSE)
>> +		perf_regs->xmm_regs = (u64 *)xregs_xsave->i387.xmm_space;
>> +}
> 
> Now that I'm thinking about the init optimization... This is buggy.
> 
> Isn't XSAVE fun?
> 
> Here's a little primer:
> 
> 	xcomp_bv - tells you what the format of the buffer is.
> 		   Which states are where.
> 	xstate_bv - (aka. xfeatures) tells you which things XSAVES
> 		    wrote to the buffer.

I got the definitions of the two reversed. :(

> 
> It's totally valid to have a feature set in xcomp_bv but not xstate_bv.
> 
> xcomp_bv is actually pretty boring:
> 
> 	The XSAVES instructions sets bit 63 of the XCOMP_BV field of the
> 	XSAVE header while writing RFBM[62:0] to XCOMP_BV[62:0]
> 
> Since you know the RFBM, you also know xstate_bv. You don't need to read
> it out of the buffer even.
> 
> Oh, and what's with the:
> 
> 	xcomp_bv & XFEATURE_SSE
> 
> ? xcomp_bv is a bitmap, just like 'mask'
> 
> So, what do you do when
> 
> 	if (!(xregs_xsave->header.xfeatures & XFEATURE_MASK_SSE))
> 		... here?
> 
> The "XSAVE-Enabled Registers Group" docs say:
> 
> 	The first eight bytes include the XSAVES instruction’s XSTATE_BV
> 	bit vector (reflecting INIT optimization). This field
> 	is in XCR0 format.
> 
> So the PEBS parsing code has to know how to deal with this situation too
> and not copy the xmm_regs out to users.

Now, perf will copy all 0 to users if !perf_regs->xmm_regs. But 0 should
be a valid value for the xmm_regs. Perf probably need to dump a bitmap
which indicates what regs are really collected. It may be slightly
different from the requested bitmap because of the above case.

Thanks,
Kan

