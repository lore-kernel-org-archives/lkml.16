Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966AD2E11B5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749835037; cv=none; b=e5ECNsTme1vBrzy+TY5f2p1YAUOaOxSna80uP33fhU7NAIn9Y8XPfiovcSXLQG3o/ACQD/uWdt1Lrn6zmPWetdCr0MenTm+iVuji2UPcVHqRb1BzmpRfStZpAx0ElbQxBEb58+FCC5fteyJjhXRHpS2IGShl728W6hKwQn7mhyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749835037; c=relaxed/simple;
	bh=Gj36E+PdLr277lawY7j4IlULScK9vZb1GqdyaVVM6dI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R18o1M3EYTnYxu59xZ0RYtAstHlDGMj2WpdscEm7kzJFssrMOasouRnGdTaAd6BASP/UgPx65X4sQyAJmtFa9pDbbq0UzoJVtMeczy4DiQH6InJ4e2ZQvN3nFvNSE4K/GfJ90BY1/zpfm0GzD6f3U8JYm9NR+F3aUy6znPKIsdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DoZfMHlu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DoZfMHlu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749835036; x=1781371036;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Gj36E+PdLr277lawY7j4IlULScK9vZb1GqdyaVVM6dI=;
  b=DoZfMHluOKdSqiWzCb4LSOJnlivude54V6/biPM9CunwFa7eAhnXbwxZ
   jPvXkSa+JcZYQ22dDP4yTAWjsP+3uz7bC1+lPu5boqeUtj8BKOUrRE6ng
   Dx/vOt/DwOxmTGwUHvs3FVXcPbkKAYlQkjf67N6PSNK5P5KeSEqz6seI1
   ffpXrF6Pfy8og5uPBB3eFwIYleP52khaAGbKBDqFzBr330KOiXEdq+AyJ
   dxSsjZyNjbx64hjNb1tOgXnn0S1FM+OwJUmf4slFx77mn+iLD1+ZBGexQ
   G04cem/RmTBm/sum1TlWXdNA7t/Ighsz3YqwVWNNEEEe8oFDtAR8DQy0y
   A==;
X-CSE-ConnectionGUID: /XBuAgEOR9Oaq9w9lFjyUQ==
X-CSE-MsgGUID: pLqtZufXRjyTnwfGXJCg2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="51937051"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="51937051"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 10:17:15 -0700
X-CSE-ConnectionGUID: ZcKY4dv5RFG8CRa3k9c0RA==
X-CSE-MsgGUID: VL9LkWWoTHyaT35PV4xfdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="148248380"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 10:17:14 -0700
Received: from [10.246.136.52] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 0DA3720B5736;
	Fri, 13 Jun 2025 10:17:11 -0700 (PDT)
Message-ID: <5c239831-a83e-4a70-9670-77986c689a9d@linux.intel.com>
Date: Fri, 13 Jun 2025 13:17:10 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/12] perf/x86: Add APX in extended regs
To: Dave Hansen <dave.hansen@intel.com>, peterz@infradead.org,
 mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
 dave.hansen@linux.intel.com, irogers@google.com, adrian.hunter@intel.com,
 jolsa@kernel.org, alexander.shishkin@linux.intel.com,
 linux-kernel@vger.kernel.org
Cc: dapeng1.mi@linux.intel.com, ak@linux.intel.com, zide.chen@intel.com
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250613134943.3186517-9-kan.liang@linux.intel.com>
 <9624b098-f3ab-4db7-8811-cab2c5cce351@intel.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <9624b098-f3ab-4db7-8811-cab2c5cce351@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-06-13 12:02 p.m., Dave Hansen wrote:
> On 6/13/25 06:49, kan.liang@linux.intel.com wrote:
>> +#define __x86_pmu_get_regs(_mask, _regs, _size)		\
>> +do {							\
>> +	if (mask & _mask && xcomp_bv & _mask) {		\
>> +		_regs = xsave;				\
>> +		xsave += _size;				\
>> +	}						\
>> +} while (0)
> 
> Ewww.
> 
> First of all, this doesn't work generally because of the previously
> mentioned alignment. Second, it's using xcomp_bv which doesn't tell you
> if XSAVES wrote the data.
> 
> Last, this attempts to reimplement get_xsave_addr().
> 
> I'd do something like this:
> 
> 	for (xfeature_nr in mask) {
> 		void *src = get_xsave_addr(xsave, xfeature_nr);
> 		void *dst = ... a function to map XFEATURE_MASK_APX
> 				to perf_regs->apx_regs,
> 		int size  = xstate_sizes(xfeature_nr);
> 
> 		if (!src)
> 			continue;
> 
> 		memcpy(dst, src, size);

The data will eventually be copied to a buffer which shared with the
user-space tool. I probably have to avoid the memcpy and do it later
when outputting the sample.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/events/core.c#n7389

> 	}
> 
> That should handle *all* of the nastiness. The alignment, the init
> optimization. *Please* use get_xsave_addr() or one of the other helpers.

Thanks, I will try to reuse the existing fpu functions as much as I can.

Thanks,
Kan

