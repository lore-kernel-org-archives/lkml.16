Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C82423D2A3;
	Tue, 29 Apr 2025 16:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745942710; cv=none; b=qAq/2nMMWDRVZN1nvKe+VVfckL7FBP7CBTYbwGbrzR8NUVMqS0vYbn/9HNwFlOWgEN/3TjZ6E0asMr0JM3cGSMvDI7upbC9J7UNapgMvp+nJ4ujBdvox64loP2R2jXO0ePOQ4gp/7agHpqLoEqSAuXLT2bzIcGw2uV9RK22y0pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745942710; c=relaxed/simple;
	bh=kc4wP+JTOQYbzdxScoLeIhj26yfCcr1KXX5njmFEzCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JvM2gcQDSxx0MRmxG+Oh4GPfslDV6d/LjEvoPCSF/dn6aLnw4+iXeZCoTeSrHY8FVq//R1VnCG9MT8GWIhlJxC5Pftr0LDUaKIBNVliCw6S30/Cuk2t5cCOblG6yXcGTA4hLNHkbGLSlUQX7HpUUwRV8Df17Uyq5Znt4terXvwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghIkR8HT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghIkR8HT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745942708; x=1777478708;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kc4wP+JTOQYbzdxScoLeIhj26yfCcr1KXX5njmFEzCM=;
  b=ghIkR8HToNp1SoqLY7Z3ShmGxv8QmbFLlH7NKXXZMR6qQaUJdflFO6hL
   xyWJTt833VV4V7usGvvscbrQE2n6fhrcFETcYFPY7rgvuI6x0wzhca25f
   7gKSv/Cw7WJTFf1cV7MtHi6ipa3jBn0af0V5JbcFplokQeLnZ+FRSOSnO
   pKFeKGUExB3AdKdJrcCkAJbr4MkxLrdM3xieRY6f5RI3mqrCagMnGjR62
   +3BJyRK6ruV0EhxB8SV/B2N4d2GfV/qo2Mxsh3um9A5ta58eS0t6WcAOP
   EsHMsqPKaZGFbzaLKnRyJ2w+k+7SNOs7w3u4YqPa29ripxuymYQ3N+E1b
   A==;
X-CSE-ConnectionGUID: d2YddJCMSMCRNFKrqsHXDg==
X-CSE-MsgGUID: BL3w4CtXTZ6zNqvvr2ywAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47585024"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="47585024"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 09:05:07 -0700
X-CSE-ConnectionGUID: 4V1xIgNkRNqS84as7fjsbQ==
X-CSE-MsgGUID: qtvKug+WQZ2IK/ghsaacoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="139055434"
Received: from sramkris-mobl1.amr.corp.intel.com (HELO [10.124.223.107]) ([10.124.223.107])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 09:05:05 -0700
Message-ID: <e90b81a4-a912-4174-b6e9-46a6ddd92ee3@intel.com>
Date: Tue, 29 Apr 2025 09:05:02 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/14] x86: add KHO support
To: Mike Rapoport <rppt@kernel.org>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de,
 ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de,
 catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com,
 devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com,
 graf@amazon.com, hpa@zytor.com, jgowans@amazon.com,
 kexec@lists.infradead.org, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com,
 pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org,
 ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org,
 saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de,
 thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
References: <20250411053745.1817356-1-changyuanl@google.com>
 <20250411053745.1817356-12-changyuanl@google.com>
 <35c58191-f774-40cf-8d66-d1e2aaf11a62@intel.com>
 <aBD165pVhOIl3_by@kernel.org>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <aBD165pVhOIl3_by@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/25 08:53, Mike Rapoport wrote:
> On Mon, Apr 28, 2025 at 03:05:55PM -0700, Dave Hansen wrote:
>> On 4/10/25 22:37, Changyuan Lyu wrote:
>>> From: Alexander Graf <graf@amazon.com>
>>>
>>> +#ifdef CONFIG_KEXEC_HANDOVER
>>> +static bool process_kho_entries(unsigned long minimum, unsigned long image_size)
>>> +{
>>> +	struct kho_scratch *kho_scratch;
>>> +	struct setup_data *ptr;
>>> +	int i, nr_areas = 0;
>>
>> Do these really need actual #ifdefs or will a nice IS_ENABLED() check
>> work instead?
>>
>>> +	ptr = (struct setup_data *)(unsigned long)boot_params_ptr->hdr.setup_data;
>>
>> What's with the double cast?
> 
> The double cast is required for this to be compiled on 32 bits (just like
> in mem_avoid_overlap). The setup_data is all u64 and to cast it to a
> pointer on 32 bit it has to go via unsigned long.

Let's just make KHO depend on 64BIT, at least on x86.

>>> diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
>>> index 68530fad05f74..518635cc0876c 100644
>>> --- a/arch/x86/kernel/kexec-bzimage64.c
>>> +++ b/arch/x86/kernel/kexec-bzimage64.c
>>> @@ -233,6 +233,31 @@ setup_ima_state(const struct kimage *image, struct boot_params *params,
>>>  #endif /* CONFIG_IMA_KEXEC */
>>>  }
>>>  
>>> +static void setup_kho(const struct kimage *image, struct boot_params *params,
>>> +		      unsigned long params_load_addr,
>>> +		      unsigned int setup_data_offset)
>>> +{
>>> +#ifdef CONFIG_KEXEC_HANDOVER
>>
>> Can this #ifdef be replaced with IS_ENABLED()?
> 
> The KHO structures in kexec image are under #ifdef, so it won't compile
> with IS_ENABLED().

They shouldn't be. Define them unconditionally, please.

...
>> Please axe the #ifdef in the .c file if at all possible, just like the
>> others.
> 
> This one follows IMA, but it's easy to make it IS_ENABLED(). It's really up
> to x86 folks preference.

Last I checked, I'm listed under the big M: for "X86 ARCHITECTURE". ;)
