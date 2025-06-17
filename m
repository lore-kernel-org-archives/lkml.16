Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9782D9EF1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750162569; cv=none; b=FwKe/QYJGK7+iKhOMwuccI8eEL6dYv6GiiVgCh0Ir70fbZSRkyeoIiPSjhbiTYX8LYH6+I8v1ZVUXTRH968FhFkd4eCqw6uw/vCofis5PPY2lnUqpq2wUwxtaWq10obf0jtiJA9dj4OSCqNEfCqF9QEp/dDMBbWNnemxLtIgs1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750162569; c=relaxed/simple;
	bh=haAb8vjhlx9P8qLO52eyMxMsu3y3gYJPCc+QrlwcTMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JUGOlA36P+Wsb7/RCI6dK5XC3S1k6wVdma5STou9OFjh7ANxatprOR1sVn3C67Jz0WtyOfndOK9Z4Lw5UWuXj9l3VQaGS87dnrlzGOSFPxHX81CN5nLqB3dWSJeXcV/Fg1RBEoK7CNMj//Jl1Dc9FQgSh7+hBU4+FxecSqAUqZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WKR5r/HE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WKR5r/HE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750162568; x=1781698568;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=haAb8vjhlx9P8qLO52eyMxMsu3y3gYJPCc+QrlwcTMI=;
  b=WKR5r/HEQJNDkaWkhrbX8IugnwP8or2xpdeAdcQXvLP1hJfN+y0p60X+
   K5MyAPQ3ENjF2UqRXTx3iSjrneoMoipSMpHJbZuazo0RH8jUTOMZmqFyY
   b8n0adxfIYIzb/w9jY61jA//WEzfrU/kt2r8clp5RwZBFjXKAuNFlLUF8
   rA8aX/jSqN+zwd/K31lYz+8aYvH78Fi6mY8QnSWzORiYBFCYuSko+jevC
   P0f/SQ+dM7geDyQyRSkoPDU4i+HS6Ll9JvZ/qORsdfaq/1zsBhShlLYcL
   z4jHXqk4pTTyv15uQthBZUr+kyq6UadwlgBACbPMFyZ4qnjjvLfVsp/xf
   g==;
X-CSE-ConnectionGUID: uA/7dHNLRsizl7AQH4fUsA==
X-CSE-MsgGUID: kpTpZj42TRGw79ZkGj8wUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56146503"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="56146503"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 05:14:42 -0700
X-CSE-ConnectionGUID: lZWSTDxOSu6Ta7HroY823Q==
X-CSE-MsgGUID: Ra91IOmKTKiRBYw8PXH3hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="148617830"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.144]) ([10.124.245.144])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 05:14:39 -0700
Message-ID: <dc084dac-170d-434e-9d8c-ba11cbc8e008@linux.intel.com>
Date: Tue, 17 Jun 2025 20:14:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/12] perf: Support extension of sample_regs
To: Peter Zijlstra <peterz@infradead.org>
Cc: kan.liang@linux.intel.com, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, tglx@linutronix.de, dave.hansen@linux.intel.com,
 irogers@google.com, adrian.hunter@intel.com, jolsa@kernel.org,
 alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
 ak@linux.intel.com, zide.chen@intel.com
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250613134943.3186517-7-kan.liang@linux.intel.com>
 <20250617081458.GI1613376@noisy.programming.kicks-ass.net>
 <8fbf7fc5-2e38-4882-8835-49869b6dd47f@linux.intel.com>
 <20250617102813.GS1613376@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20250617102813.GS1613376@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 6/17/2025 6:28 PM, Peter Zijlstra wrote:
> On Tue, Jun 17, 2025 at 05:49:13PM +0800, Mi, Dapeng wrote:
>> On 6/17/2025 4:14 PM, Peter Zijlstra wrote:
>>> On Fri, Jun 13, 2025 at 06:49:37AM -0700, kan.liang@linux.intel.com wrote:
>>>> From: Kan Liang <kan.liang@linux.intel.com>
>>>>
>>>> More regs may be required in a sample, e.g., the vector registers. The
>>>> current sample_regs_XXX has run out of space.
>>>>
>>>> Add sample_ext_regs_intr/user[2] in the struct perf_event_attr. It's used
>>>> as a bitmap for the extension regs. There will be more than 64 registers
>>>> added.
>>>> Add a new flag PERF_PMU_CAP_EXTENDED_REGS2 to indicate the PMU which
>>>> supports sample_ext_regs_intr/user.
>>>>
>>>> Extend the perf_reg_validate() to support the validation of the
>>>> extension regs.
>>>>
>>>> Extend the perf_reg_value() to retrieve the extension regs. The regs may
>>>> be larger than u64. Add two parameters to store the pointer and size.
>>>> Add a dedicated perf_output_sample_ext_regs() to dump the extension
>>>> regs.
>>>>
>>>> This is just a generic support for the extension regs. Any attempts to
>>>> manipulate the extension regs will error out, until the driver-specific
>>>> supports are implemented, which will be done in the following patch.
>>>>
>>>> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
>>>> index 78a362b80027..e22ba72efcdb 100644
>>>> --- a/include/uapi/linux/perf_event.h
>>>> +++ b/include/uapi/linux/perf_event.h
>>>> @@ -382,6 +382,10 @@ enum perf_event_read_format {
>>>>  #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
>>>>  #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
>>>>  #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
>>>> +#define PERF_ATTR_SIZE_VER9			168	/* Add: sample_ext_regs_intr */
>>>> +							/* Add: sample_ext_regs_user */
>>>> +
>>>> +#define PERF_ATTR_EXT_REGS_SIZE			2
>>>>  
>>>>  /*
>>>>   * 'struct perf_event_attr' contains various attributes that define
>>>> @@ -543,6 +547,10 @@ struct perf_event_attr {
>>>>  	__u64	sig_data;
>>>>  
>>>>  	__u64	config3; /* extension of config2 */
>>>> +
>>>> +	/* extension of sample_regs_XXX */
>>>> +	__u64	sample_ext_regs_intr[PERF_ATTR_EXT_REGS_SIZE];
>>>> +	__u64	sample_ext_regs_user[PERF_ATTR_EXT_REGS_SIZE];
>>>>  };
>>> Did anybody read this email?
>>>
>>>   https://lkml.kernel.org/r/20250416155327.GD17910@noisy.programming.kicks-ass.net
>>>
>>> The current regs interface really was designed for regular registers,
>>> and trying to squish SIMD registers into it is a trainwreck.
>>>
>>> Not to mention that AAAARGHH64 and Risc-V have vector widths up to 2048
>>> bit.
>> Yes, we followed this discussion. In sample_ext_regs_intr/user[], each bit
>> represents an extended register regardless of how much bits does the
>> register have.  At the beginning we added a item "sample_simd_reg_words" to
>> represent the bit-width of the corresponding extended register, but we
>> found it's unnecessary since the regs bitmap is fixed for a specific arch
> So I disagree. Fundamentally we have only 32 SIMD registers on x86. We
> should not have more bits than that.
>
>> and the arch-specific code would know how many bits for the certain regs,
>> e.g., on x86 platform, the bit 0 would represent YMMH0 in this patchset ,
>> then the x86 specific perf code would know its bit-wdith is 128bits.
> This is nonsense; YMMH0 is not a register. It should never be in this
> array.
>
>> The reason that we define an array with 2 u64 words is that we plan to
>> support YMM (16 bits) + APX (16 bits) + OPMASK (8 bits) + ZMM (32 bits) +
>> SSP (1 bit) regs which needs 73 bits and one u64 word is not enough.
> This is insane. So now you're having 16 XMM 'regs', 16 YMMH 'regs' and
> 32 ZMMH 'regs' for a total of 64 bits that should have been just 32.
>
> Suppose we're going to be doing AVX-1024, because awesome. That means we
> need another 32 bits to denote whatever letter comes after 'Z'.
>
> So no, this idiocy stops now.
>
> We're going to do a sane SIMD register set with variable width, and
> reclaim the XMM regs from the normal set.

Ok, so we need to add two width variables like
sample_ext_regs_words_intr/user, then reuse the XMM regs bitmap to
represent the extend regs bitmap. Considering the OPMASK regs and APX
extended GPRs have same bit-width (64 bits), we may have to combine them
into a single bitmap, e.g. bits[15:0] represents R31~R16 and bits[23:16]
represents OPMASK7 ~ OPMASK0. 

Peter, is this what you expected? 


