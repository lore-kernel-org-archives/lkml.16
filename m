Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA71288CB5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153761; cv=none; b=gSzx2jXEQWLHsFxPs9WF7jx1eG3luyKo3hExDCf66kX/zFBetI1HkZ/FwC4Kc4e9AT8XXENjFpEKqrZEubhGsbKOjGSeKHYItu2OxUQVCDLe4zTYrpRumUKONPFiMi/p0hHo68MVjf9UCmDxOnqNS6bt2zii8enVfWgoDRjEdxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153761; c=relaxed/simple;
	bh=lcy6Nyp8xoMfm2JWsY50hjiwKyJB182JTXIeeE5Yte8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VxsAYDa521z/qOyyiRNkrVvkfqCtivXpsLLM9RG/LWq/ULKTNgaGCuzxsUmog3CMdoUApj9aJodnDfTZCnWJZSkUBhcjya05TT9WL0HV/XLvCmPbpzcYHmKbdNuMOg/B2esVYTsHAXkO8+evMbaUObPLGQM2t/e6V+086lkWodA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BxsjjVIS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxsjjVIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750153760; x=1781689760;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lcy6Nyp8xoMfm2JWsY50hjiwKyJB182JTXIeeE5Yte8=;
  b=BxsjjVISuVlwfcjbug4bEX5HXHulctKn6Z6Fb/aQF6mJYNEQfxMsaHME
   J7pSIkwVD6PVnRueZflA1oGTLYva0CYswaoVf9Lkb02Ssc07JQHsYjhWE
   hnuz9Ec2DQU3frpej5x1jNucUm8f+SdNTCZcVBsXywOpll10YowbCKgZp
   dF+VVo1t9B6FSMaBOXbnCqjbXAt6laQv11AWoewmQ5HEIXIzp5xf18D8f
   RFxi0IdnA4ZhQ8tWyuxf/qTxnpCZBnBiqF3z346no1Bc30Hlv+zzv7wiZ
   z/tZBy4N+lARz0Km53zV52Zaa0Re0h+B/kZm0QIlouSPcReSPHpXlAAr5
   w==;
X-CSE-ConnectionGUID: F/m3YrOGQCyXxBBG1KASwQ==
X-CSE-MsgGUID: d3g7xANSSt+8bgQXB7FO4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51433633"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="51433633"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 02:49:19 -0700
X-CSE-ConnectionGUID: GVAnqXMVSZ+YhJAxAR/89A==
X-CSE-MsgGUID: HNT2DnsyT1qIiTJln5BASw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="153616521"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.144]) ([10.124.245.144])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 02:49:15 -0700
Message-ID: <8fbf7fc5-2e38-4882-8835-49869b6dd47f@linux.intel.com>
Date: Tue, 17 Jun 2025 17:49:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/12] perf: Support extension of sample_regs
To: Peter Zijlstra <peterz@infradead.org>, kan.liang@linux.intel.com
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 tglx@linutronix.de, dave.hansen@linux.intel.com, irogers@google.com,
 adrian.hunter@intel.com, jolsa@kernel.org,
 alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
 ak@linux.intel.com, zide.chen@intel.com
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250613134943.3186517-7-kan.liang@linux.intel.com>
 <20250617081458.GI1613376@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20250617081458.GI1613376@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 6/17/2025 4:14 PM, Peter Zijlstra wrote:
> On Fri, Jun 13, 2025 at 06:49:37AM -0700, kan.liang@linux.intel.com wrote:
>> From: Kan Liang <kan.liang@linux.intel.com>
>>
>> More regs may be required in a sample, e.g., the vector registers. The
>> current sample_regs_XXX has run out of space.
>>
>> Add sample_ext_regs_intr/user[2] in the struct perf_event_attr. It's used
>> as a bitmap for the extension regs. There will be more than 64 registers
>> added.
>> Add a new flag PERF_PMU_CAP_EXTENDED_REGS2 to indicate the PMU which
>> supports sample_ext_regs_intr/user.
>>
>> Extend the perf_reg_validate() to support the validation of the
>> extension regs.
>>
>> Extend the perf_reg_value() to retrieve the extension regs. The regs may
>> be larger than u64. Add two parameters to store the pointer and size.
>> Add a dedicated perf_output_sample_ext_regs() to dump the extension
>> regs.
>>
>> This is just a generic support for the extension regs. Any attempts to
>> manipulate the extension regs will error out, until the driver-specific
>> supports are implemented, which will be done in the following patch.
>>
>> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
>> index 78a362b80027..e22ba72efcdb 100644
>> --- a/include/uapi/linux/perf_event.h
>> +++ b/include/uapi/linux/perf_event.h
>> @@ -382,6 +382,10 @@ enum perf_event_read_format {
>>  #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
>>  #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
>>  #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
>> +#define PERF_ATTR_SIZE_VER9			168	/* Add: sample_ext_regs_intr */
>> +							/* Add: sample_ext_regs_user */
>> +
>> +#define PERF_ATTR_EXT_REGS_SIZE			2
>>  
>>  /*
>>   * 'struct perf_event_attr' contains various attributes that define
>> @@ -543,6 +547,10 @@ struct perf_event_attr {
>>  	__u64	sig_data;
>>  
>>  	__u64	config3; /* extension of config2 */
>> +
>> +	/* extension of sample_regs_XXX */
>> +	__u64	sample_ext_regs_intr[PERF_ATTR_EXT_REGS_SIZE];
>> +	__u64	sample_ext_regs_user[PERF_ATTR_EXT_REGS_SIZE];
>>  };
> Did anybody read this email?
>
>   https://lkml.kernel.org/r/20250416155327.GD17910@noisy.programming.kicks-ass.net
>
> The current regs interface really was designed for regular registers,
> and trying to squish SIMD registers into it is a trainwreck.
>
> Not to mention that AAAARGHH64 and Risc-V have vector widths up to 2048
> bit.

Yes, we followed this discussion. In sample_ext_regs_intr/user[], each bit
represents an extended register regardless of how much bits does the
register have.  At the beginning we added a item "sample_simd_reg_words" to
represent the bit-width of the corresponding extended register, but we
found it's unnecessary since the regs bitmap is fixed for a specific arch
and the arch-specific code would know how many bits for the certain regs,
e.g., on x86 platform, the bit 0 would represent YMMH0 in this patchset ,
then the x86 specific perf code would know its bit-wdith is 128bits.

The reason that we define an array with 2 u64 words is that we plan to
support YMM (16 bits) + APX (16 bits) + OPMASK (8 bits) + ZMM (32 bits) +
SSP (1 bit) regs which needs 73 bits and one u64 word is not enough.


>
>
>
