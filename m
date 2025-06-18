Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F57A1F94C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257036; cv=none; b=n8K/j0i8Cx3mlAPpbjeRLJ/3GYPg+L/VDssem3M/Fo9CmRR0qpV5osJGYoCRxAbVejhmQRTiRr6x2v9ud+StAp9uootRK7kWPV5+mgLj7cILA0Y0/UDtZHg1wW1QLnWCDXRNxu99olffY3ZT2Q5R+BHDjrgFjFJcWcjMRkoKD3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257036; c=relaxed/simple;
	bh=5NUknxLU5+b47c++exHCnYk9WPmeQAIPtGvy/Kpc5nM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVEbyM3PEAKXN6PW0iKX6wSmx430IPqT03JE3M06KhKpgAANW71xnBQcyatXvmJYrIw47k2p4Xi9WgdXPWNRfrXV6wIudCTPH3P/zdfSj5dGNXtsVpnVAzUHRiql0Wh32zvQUnFaMRTk33lvvxatCyVyc9Qwsd+uEwY+BpxFNv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2JnP6d0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2JnP6d0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750257034; x=1781793034;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5NUknxLU5+b47c++exHCnYk9WPmeQAIPtGvy/Kpc5nM=;
  b=j2JnP6d0qFAuMvLJW5oWB2tD0tlN5IlnHBhmtugo5pOFjkvFIWneRBWZ
   1RJvYMqoFXgYxGeU6FQnEtUpGir1hSChcv+BoMTwf7G8XBX++uDACfU3P
   4E/B1qVHQSuvH+jWendogcHv+4bWvrdBJyHzim1BrHoSv4wfIvFu/AOMQ
   0mJsWpVnY8R6aXIWV5fEfuQF2Ci+fGah5VmTxqio/grb0Z26qWJaTN377
   P29YwiAr0hvferePpXRGO+2C63awD1eOSuj24McyIoi4D/OMe8W+yDGlP
   47JtZFqRnpabiQOqLXbhlsrUbw1v/MA3Q2FQRTPKQMeWJkrX8EfN6CRcG
   Q==;
X-CSE-ConnectionGUID: xcXW3jt0QvCezTt19nWurw==
X-CSE-MsgGUID: +AzcVl8rTWqQNg5MDZoJaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63085419"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63085419"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 07:30:33 -0700
X-CSE-ConnectionGUID: BLvFHwFCRWuA0rcFouuybA==
X-CSE-MsgGUID: u7gF2XcRTfeZXIPfloxrNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="149416637"
Received: from ldmartin-desk2.corp.intel.com (HELO [10.125.108.79]) ([10.125.108.79])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 07:30:32 -0700
Message-ID: <1ff8ed73-f766-494a-ab22-81c2076d7f07@intel.com>
Date: Wed, 18 Jun 2025 07:30:32 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/12] perf: Support extension of sample_regs
To: "Liang, Kan" <kan.liang@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>
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
 <99087e26-192f-4fa6-b43b-0c6a39c45b38@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <99087e26-192f-4fa6-b43b-0c6a39c45b38@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/18/25 06:52, Liang, Kan wrote:
> On 2025-06-18 9:30 a.m., Peter Zijlstra wrote:
>> On Wed, Jun 18, 2025 at 06:10:20AM -0400, Liang, Kan wrote:
>>
>>> Maybe we should use a mask to replace the nr_vectors.
>>> Because Dave mentioned that the XSAVES may fail.
>> XSAVE is a pain in the arse :/
>>
>>> PERF_SAMPLE_SIMD_REGS := {
>>> 	u64 vectors_mask;
>>> 	u16 vector_length;
>>> 	u64 pred_mask;
>>> 	u16 pred_length;
>> That is not u64 aligned...
> I didn't know we have the alignment requirement for the output.
> If so,
> 
> PERF_SAMPLE_SIMD_REGS := {
> 	u64 vectors_mask;
> 	u64 pred_mask;
> 	u64 vector_length:16,
> 	    pred_length:16,
> 	    reserved:32;
> 	u64 data[];
> }

There are three different in-memory register layouts that are in play:

 * The "sane" format that, for instance, packs all of the bytes of ZMM0
   in memory next to each other, like you've been talking about in the
   thread.
 * The PEBS XER Record Format. There's a 16-byte header before the real
   registers start. The registers have an XSAVE-style split where (for
   instance) ZMM0 is in three pieces.
 * The XSAVE{,C,S,OPT} format. There's a 160-byte of "x87 state" gunk at
   the beginning that's not read or written, then XMM[0-16], then 112
   bytes of space, then X{STATE,COMP}_BV, a 48 byte gap, then the AVX
   state. There's a bunch of space in the first 576 bytes.

XSAVE can't write the first two formats at *all*, although the PEBS and
XSAVE formats are the same for AVX and later.

So one of the immediate questions is whether we want to expose the XSAVE
format as part of the perf ABI. I'm _assuming_ that the PEBS format is
going to be exposed to userspace, so should we expose XSAVE or munge it
into one of the other two formats?

If software is going to munge the XSAVE format, then you don't have to
worry about alignment because you'd save it to some probably per-cpu
64-byte-aligned buffer and then munge it into the unaligned
PERF_SAMPLE_SIMD_REGS above.
