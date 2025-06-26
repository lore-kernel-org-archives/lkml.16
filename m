Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835782BB17
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 18:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750961309; cv=none; b=rkjq3uwnfLfoDCeou2U7ga3nLQDXRdHLIyQunmVug3QPUeuOYADHxerrhO8ry5pb7W4kDFwdV1BO59/WiPG6Cvcl8qpezmdJ+q/9PmO9Rrse7kbEwdjePbjhjO0bZq0MN2gRyK7h5EhDW0bztlLZMm+7i943v0b9jbCd5/atPzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750961309; c=relaxed/simple;
	bh=PtdDERpkoNM+2CqcYAzOv4kAOMFWZGUiBdK3c4DBFho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NOLq7wj+K44Xc/65TFT3Yo2Sd8OVnfBwzLR8n6AzR9Ty5ESGo/18Lfgn0ovEm5HXABtut7DZeL++bjuQvLkOlncotJBnYEh/yD3SwhNcMaM1q+X2j4i677jyD0fTaBt/pev43ZXkVkP/w6bgkljo4ytfT0tnVNrhaEOrNQ8Giog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHzHK54Y; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHzHK54Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750961308; x=1782497308;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PtdDERpkoNM+2CqcYAzOv4kAOMFWZGUiBdK3c4DBFho=;
  b=RHzHK54YpL9pBKwNSb7rsO2Ag9YrUlXSNCkeiUc23/nEDLq4sLhjqnjN
   2hiyFck3GISIdKbRqtHPEAIYQqLuAtfFppPbTILanSg9/PKgd/mzNyeHd
   GZFH2GbjOga4B774lj3Imhe8Nu/7yIqzxTKg5Ftap1iMsNQKfFvB6geFU
   ZCYyNprJtMWeZ4GQdHZj88br+erNxUivGTOGxkWNL3KVneBzH1ANHCeG6
   rHn04CTx9V7RNbIEwlExGx6/yHDt+i9z1fLR0bR6hUkT/YwjWAH8RXFVw
   FusCUv9xfSBB3dQChIvE/ueZWpNJHQe+SyblOhE9eqOrUXIGtvwQRF12R
   Q==;
X-CSE-ConnectionGUID: H0SpQXIDReWqJ+orwdj3bA==
X-CSE-MsgGUID: 63+RNJ1fSKqwqK9h3IfqsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53234609"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53234609"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 11:08:27 -0700
X-CSE-ConnectionGUID: xX3lA2rST1ajHc3zwyYJGA==
X-CSE-MsgGUID: FY36xo+9TcKGaWkzDPBmKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156616493"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [10.125.109.44]) ([10.125.109.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 11:08:26 -0700
Message-ID: <de53f740-c662-45d4-9e00-66e06937f4c6@intel.com>
Date: Thu, 26 Jun 2025 11:08:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 0/8] Intel RAR TLB invalidation
To: Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, bp@alien8.de, x86@kernel.org, nadav.amit@gmail.com,
 seanjc@google.com, tglx@linutronix.de, mingo@kernel.org
References: <20250619200442.1694583-1-riel@surriel.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20250619200442.1694583-1-riel@surriel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/19/25 1:03 PM, Rik van Riel wrote:
> This patch series adds support for IPI-less TLB invalidation
> using Intel RAR technology.
> 
> Intel RAR differs from AMD INVLPGB in a few ways:
> - RAR goes through (emulated?) APIC writes, not instructions
> - RAR flushes go through a memory table with 64 entries
> - RAR flushes can be targeted to a cpumask
> - The RAR functionality must be set up at boot time before it can be used
> 
> The cpumask targeting has resulted in Intel RAR and AMD INVLPGB having
> slightly different rules:
> - Processes with dynamic ASIDs use IPI based shootdowns
> - INVLPGB: processes with a global ASID 
>    - always have the TLB up to date, on every CPU
>    - never need to flush the TLB at context switch time
> - RAR: processes with global ASIDs
>    - have the TLB up to date on CPUs in the mm_cpumask
>    - can skip a TLB flush at context switch time if the CPU is in the mm_cpumask
>    - need to flush the TLB when scheduled on a cpu not in the mm_cpumask,
>      in case it used to run there before and the TLB has stale entries
> 
> RAR functionality is present on Sapphire Rapids and newer CPUs.
> 
> Information about Intel RAR can be found in this whitepaper.
> 
> https://www.intel.com/content/dam/develop/external/us/en/documents/341431-remote-action-request-white-paper.pdf
> 
> This patch series is based off a 2019 patch series created by
> Intel, with patches later in the series modified to fit into
> the TLB flush code structure we have after AMD INVLPGB functionality
> was integrated.
> 
> TODO:
> - some sort of optimization to avoid sending RARs to CPUs in deeper
>   idle states when they have init_mm loaded (flush when switching to init_mm?)
> 
> v4:
> - remove chicken/egg problem that made it impossible to use RAR early
>   in bootup, now RAR can be used to flush the local TLB (but it's broken?)
> - always flush other CPUs with RAR, no more periodic flush_tlb_func
> - separate, simplified cpumask trimming code
> - attempt to use RAR to flush the local TLB, which should work
>   according to the documentation
> - add a DEBUG patch to flush the local TLB with RAR and again locally,
>   may need some help from Intel to figure out why this makes a difference
> - memory dumps of rar_payload[] suggest we are sending valid RARs
> - receiving CPUs set the status from RAR_PENDING to RAR_SUCCESS
> - unclear whether the TLB is actually flushed correctly :(

Hi Rik,
Dave Hansen has asked me to reproduce this locally. Trying to replicate your test setup. What are the steps you are using to do testing of this patch series? Thanks!

DJ

> v3:
> - move cpa_flush() change out of this patch series
> - use MSR_IA32_CORE_CAPS definition, merge first two patches together
> - move RAR initialization to early_init_intel()
> - remove single-CPU "fast path" from smp_call_rar_many
> - remove smp call table RAR entries, just do a direct call
> - cleanups suggested (Ingo, Nadav, Dave, Thomas, Borislav, Sean)
> - fix !CONFIG_SMP compile in Kconfig
> - match RAR definitions to the names & numbers in the documentation
> - the code seems to work now
> v2:
> - Cleanups suggested by Ingo and Nadav (thank you)
> - Basic RAR code seems to actually work now.
> - Kernel TLB flushes with RAR seem to work correctly.
> - User TLB flushes with RAR are still broken, with two symptoms:
>   - The !is_lazy WARN_ON in leave_mm() is tripped
>   - Random segfaults.
> 

