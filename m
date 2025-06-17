Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6A92E7191
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168339; cv=none; b=a6KG6SAOv3FDF4N/V+LJdqCP2nDAxv14ihWqUc2q2zUIRjDN92xgbrngIUmj+b4iX8eYd0ocl+odOAXRwPUEmTKE0TxoZQ6jXMwFM1jXWyBRC7ZrgdoZcYP2wrajm2tKY/zHw3MTufZJ6aaKw3+1sILgW13WVp5pS3h+hBtf60Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168339; c=relaxed/simple;
	bh=wS3Way8dfKpc3WnEiOR/twvvaJyIadif8idx8FeygdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=svPHivsRm9TqvCuWHYaPH3R+My520kLrhNE0yUQsyS+AhzxmFX4E4JPyA8Ie7OVjFLZfWR9POunB6G8CnO5hTyNavtl8YeazG4HFv62J0bBrqRt4TAAa/k9BEBYmOil/HEe6JQTZVR/0HKf/TyJCICMi7p6mGiXxORZCLhD/7TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M0jhyHqt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M0jhyHqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750168338; x=1781704338;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wS3Way8dfKpc3WnEiOR/twvvaJyIadif8idx8FeygdY=;
  b=M0jhyHqtDVsu3Ik7GxP0upKy8awcV+HjDET18eKXWwBQ/SJRNL39uCQU
   8nvcMChzF9B/vD7wGaC1UNnN3UxcktpdhJ/oS4PcBL/ogKb5Nswh1BJBD
   /30PSIVo4DFIhZHyMPYmuodRzO//33ovpXzDwB2ZeXXBuY1M/qDZcVCEY
   miXVfVWLzej0ww7cR+SMW5ormXYi5FEL2L24FPOYOryEGbp7Q+CAuvQty
   vsqsS9IzgvoCMJWAK7j9mAwAMFYEXSAT1FtHFoy6mtZIldhM9Y12uSNXy
   EjvQuBjsfEuAxVs4m3VYPFCeL03JqEbFq1ipYyiSXn4Nanw/2Sj4kGTNg
   w==;
X-CSE-ConnectionGUID: cPl1k4SxQVCcgsvTPZsVYQ==
X-CSE-MsgGUID: OAnd5RP2Qg6RZSeM0BJwmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52429400"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="52429400"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 06:52:17 -0700
X-CSE-ConnectionGUID: 0zJGT28ZRP+wbZntFT0yqw==
X-CSE-MsgGUID: +veJ0aeDTreKItFE7tHGag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="172029479"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 06:52:16 -0700
Received: from [10.246.136.52] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id AB45F20B58A2;
	Tue, 17 Jun 2025 06:52:13 -0700 (PDT)
Message-ID: <60c18595-c6a8-4c39-98fe-0822755fbdb7@linux.intel.com>
Date: Tue, 17 Jun 2025 09:52:12 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/12] Support vector and more extended registers in
 perf
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 tglx@linutronix.de, dave.hansen@linux.intel.com, irogers@google.com,
 adrian.hunter@intel.com, jolsa@kernel.org,
 alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
 dapeng1.mi@linux.intel.com, ak@linux.intel.com, zide.chen@intel.com
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250617082423.GK1613376@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20250617082423.GK1613376@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-06-17 4:24 a.m., Peter Zijlstra wrote:
> On Fri, Jun 13, 2025 at 06:49:31AM -0700, kan.liang@linux.intel.com wrote:
>> From: Kan Liang <kan.liang@linux.intel.com>
>>
>> Starting from the Intel Ice Lake, the XMM registers can be collected in
>> a PEBS record. More registers, e.g., YMM, ZMM, OPMASK, SPP and APX, will
>> be added in the upcoming Architecture PEBS as well. But it requires the
>> hardware support.
>>
>> The patch set provides a software solution to mitigate the hardware
>> requirement. It utilizes the XSAVES command to retrieve the requested
>> registers in the overflow handler. The feature isn't limited to the PEBS
>> event or specific platforms anymore.
>> The hardware solution (if available) is still preferred, since it has
>> low overhead (especially with the large PEBS) and is more accurate.
>>
>> In theory, the solution should work for all X86 platforms. But I only
>> have newer Inter platforms to test. The patch set only enable the
>> feature for Intel Ice Lake and later platforms.
>>
>> Open:
>> The new registers include YMM, ZMM, OPMASK, SSP, and APX.
>> The sample_regs_user/intr has run out. A new field in the
>> struct perf_event_attr is required for the registers.
>> There could be several options as below for the new field.
>>
>> - Follow a similar format to XSAVES. Introduce the below fields to store
>>   the bitmap of the registers.
>>   struct perf_event_attr {
>>         ...
>>         __u64   sample_ext_regs_intr[2];
>>         __u64   sample_ext_regs_user[2];
>>         ...
>>   }
>>   Includes YMMH (16 bits), APX (16 bits), OPMASK (8 bits),
>>            ZMMH0-15 (16 bits), H16ZMM (16 bits), SSP
>>   For example, if a user wants YMM8, the perf tool needs to set the
>>   corresponding bits of XMM8 and YMMH8, and reconstruct the result.
>>   The method is similar to the existing method for
>>   sample_regs_user/intr, and match the XSAVES format.
>>   The kernel doesn't need to do extra configuration and reconstruction.
>>   It's implemented in the patch set.
>>
>> - Similar to the above method. But the fields are the bitmap of the
>>   complete registers, E.g., YMM (16 bits), APX (16 bits),
>>   OPMASK (8 bits), ZMM (32 bits), SSP.
>>   The kernel needs to do extra configuration and reconstruction,
>>   which may brings extra overhead.
>>
>> - Combine the XMM, YMM, and ZMM. So all the registers can be put into
>>   one u64 field.
>>         ...
>>         union {
>>                 __u64 sample_ext_regs_intr;   //sample_ext_regs_user is simiar
>>                 struct {
>>                         __u32 vector_bitmap;
>>                         __u32 vector_type   : 3, //0b001 XMM 0b010 YMM 0b100 ZMM
>>                               apx_bitmap    : 16,
>>                               opmask_bitmap : 8,
>>                               ssp_bitmap    : 1,
>>                               reserved      : 4,
>>
>>                 };
>>         ...
>>   For example, if the YMM8-15 is required,
>>   vector_bitmap: 0x0000ff00
>>   vector_type: 0x2
>>   This method can save two __u64 in the struct perf_event_attr.
>>   But it's not straightforward since it mixes the type and bitmap.
>>   The kernel also needs to do extra configuration and reconstruction.
>>
>> Please let me know if there are more ideas.
> 
> https://lkml.kernel.org/r/20250416155327.GD17910@noisy.programming.kicks-ass.net
>

It's similar to the third method, but using the words to replace the
type. Also there are more space left in case we add more SIMDs in future.
I will implement it in the V2.
> comes to mind. Combine that with a rule that reclaims the XMM register
> space from perf_event_x86_regs when sample_simd_reg_words != 0, and then
> we can put APX and SPP there.

OK. So the sample_simd_reg_words actually has another meaning now. It's
used as a flag to tell whether utilizing the old format.

If so, I think it may be better to have a dedicate sample_simd_reg_flag
field.

For example,

#define SAMPLE_SIMD_FLAGS_FORMAT_LEGACY		0x0
#define SAMPLE_SIMD_FLAGS_FORMAT_WORDS		0x1

	__u8 sample_simd_reg_flags;
	__u8 sample_simd_reg_words;
	__u64 sample_simd_reg_intr;
	__u64 sample_simd_reg_user;

If (sample_simd_reg_flags != 0) reclaims the XMM space for APX and SPP.

Does it make sense?

Thanks,
Kan


