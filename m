Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4722EF2AE
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750260176; cv=none; b=h9Bla78Sd4jWWvFqv+jwQ0ITvqxo5XfvIvqE1pKy+w+ktsWL2HfQ+gkGRNGhh3KmqgSlSplgnXRhF7ZBpKP9CF/IyVUMB47N9s4JrfgZxu/e4/Ouwq6kf4vjY/+Ne4Ihn1QJZ+3NsC2PveF7wpBPb+abnTORwDrpoBJBDouPNwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750260176; c=relaxed/simple;
	bh=s7Q/jo6lw2NXu3jvqDEp4oeMIpbrrPjBrhRL9F76kbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VF3zb/fAGk5k0b3s2DVClctvgc1Q6t0qLYKTA1NrBPXcnldlfZ5t+h+OVfsy5xRaYbd7zTa19buwJIUOLSs7nJPD0dqMOnyZmbUc6rqfPjfAh0GTDoPMnw+3+v2Yp2MkJObKoM8rDy4NQNw4koCaCiO1ZL4cvFqG2TIULOaQfkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XeTZJ0SQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XeTZJ0SQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750260175; x=1781796175;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=s7Q/jo6lw2NXu3jvqDEp4oeMIpbrrPjBrhRL9F76kbg=;
  b=XeTZJ0SQEbghjIodAJG+wdcP3zgRHYKnzoKV9EB1hKewh82qHQnq6HXd
   a78A6XIBILYgfpPEZ0vUtLH484X4ZjF1HKtHrzdcKaZPW9/RxdIht+Y3z
   cHfY0bJWGHRP+nJ+xGjPMm8cik5JxH/3KGWqiq88PGOla13ii6xWNHsx/
   V948iUTN5IZGRJpFw9wKNiM4G8GmIzcVoR3qi3++OKY3SXsX/K3PIQdsu
   81E6OgYkd027hQTixFDYfUGkalEwFLHWxmTW3a2ASgOhA7Zyz2/HC9CgB
   RdYT80nv/lR9j7GP26SpqcrqNcaggqZehJWRef96bToJjQqjgYrdwBxrn
   g==;
X-CSE-ConnectionGUID: CnIwILYNROOG2C8sq8HZ4Q==
X-CSE-MsgGUID: isTmDR/bR/2PxK/mUWHDSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52407067"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52407067"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 08:22:54 -0700
X-CSE-ConnectionGUID: s+21155eQhKgTz1GWKayTQ==
X-CSE-MsgGUID: 6VrcT5KZTCqXiBAkJZrjRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="150371729"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 08:22:53 -0700
Received: from [10.246.136.52] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id C029C20B5736;
	Wed, 18 Jun 2025 08:21:00 -0700 (PDT)
Message-ID: <0d131415-4921-45ac-bcd9-cedff17f34f5@linux.intel.com>
Date: Wed, 18 Jun 2025 11:22:50 -0400
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
References: <20250617133333.GU1613376@noisy.programming.kicks-ass.net>
 <20250617140617.GC1613633@noisy.programming.kicks-ass.net>
 <aFF6gdxVyp36ADOi@J2N7QTR9R3>
 <20250617144416.GY1613376@noisy.programming.kicks-ass.net>
 <aFGBxBVFLnkmg3CP@J2N7QTR9R3>
 <be13b2ce-a8c1-4aa7-9ddf-9ae8daee0ae1@linux.intel.com>
 <20250618093500.GH1613376@noisy.programming.kicks-ass.net>
 <0782de41-c8c4-4077-8498-651fb9a10ef5@linux.intel.com>
 <20250618133003.GC1613200@noisy.programming.kicks-ass.net>
 <99087e26-192f-4fa6-b43b-0c6a39c45b38@linux.intel.com>
 <20250618144545.GD1613200@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20250618144545.GD1613200@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-06-18 10:45 a.m., Peter Zijlstra wrote:
> On Wed, Jun 18, 2025 at 09:52:12AM -0400, Liang, Kan wrote:
> 
>> I didn't know we have the alignment requirement for the output.
> 
> Perf buffer is in u64 units.

Sure.

> 
>> If so,
>>
>> PERF_SAMPLE_SIMD_REGS := {
>> 	u64 vectors_mask;
>> 	u64 pred_mask;
>> 	u64 vector_length:16,
>> 	    pred_length:16,
>> 	    reserved:32;
>> 	u64 data[];
>> }
> 
> I really don't think we need this complication; XSAVE is a real pain in
> the arse, but I think we have enough bits in XSTATE_BV to tell what is
> what.

I just realized that XSAVE takes the vector as a whole.
It's impossible that XMM0 can be retrieved but XMM1 fails via XSAVE.
I will use the suggested output format.

PERF_SAMPLE_SIMD_REGS := {
	u16 nr_vectors;
	u16 vector_length;
	u16 nr_pred;
	u16 pred_length;
	u64 data[];
}

Thanks,
Kan

