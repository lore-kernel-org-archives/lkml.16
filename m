Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF9B19AD5C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636510; cv=none; b=LB5lVdLpvmNRps46uCtCmbAm7ms9xX7KM3JXXWPMb3eV2L+yMywQxQDH00D/z8uJdkVwIrglMYNxlX6pCmdt2vJ/TBGL0rcfRAa3hu5iug0Bc6N8GICxpnmGM2z6YuHkz1gdw4H3EYD8e4ihLqSNCsW0lj+O6M1OW4mfc6rZZ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636510; c=relaxed/simple;
	bh=Q9l4N/dz0N9/6adUXHS1EHL2qpU1oF7OKtxhtsRFyj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jdX9+T3U+HjZEuJm35ZbrRYm/nH4PdW9shR0TxBcZm1Qsa2ZocEJpsdc+oo0b+Y7q6gMBzPnzoej9tbWoHn4jOgt9XB3UKtpLrBAi+xLq0tnWkPXivL9JzTJTd6PLb1lT5G1ZIy+gClqXMLuRbRIGnGjhq/Av/GLKRYiRumeBjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C90B16F2;
	Wed,  7 May 2025 09:48:18 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A8593F58B;
	Wed,  7 May 2025 09:48:22 -0700 (PDT)
Message-ID: <28fb6da2-2d89-49c8-a8e7-d5527d8da000@arm.com>
Date: Wed, 7 May 2025 17:48:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/27] x86/resctrl: Fix types in
 resctrl_arch_mon_ctx_alloc() and free stubs
To: Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-15-james.morse@arm.com>
 <b29fdd2e-56a2-45ed-a82c-1a154b02846d@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <b29fdd2e-56a2-45ed-a82c-1a154b02846d@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 01/05/2025 18:27, Reinette Chatre wrote:
> The shortlog sounds like the stubs themselves are being free'd. How about
>     x86/resctrl: Fix types in resctrl_arch_mon_ctx_{alloc,free}() stubs

Sure,


> On 4/25/25 10:37 AM, James Morse wrote:
>> resctrl_arch_mon_ctx_alloc() and resctrl_arch_mon_ctx_free() take an enum
>> resctrl_event_id. This in turn requires the enum to be defined in
>> resctrl_types.h so that it is accessible to asm/resctrl.h.
> 
> I found the "This in turn requires ..." to indicate that this dependency
> still needs to be met. How about:
> 
>  resctrl_arch_mon_ctx_alloc() and resctrl_arch_mon_ctx_free() take an enum
>  resctrl_event_id that is already defined in resctrl_types.h to be accessible
>  to asm/resctrl.h.

Done,


>> The x86 stubs take an int. Fix that.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> ---
> 
> 
> 
>> diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
>> index 7a39728b0743..bd149c37551c 100644
>> --- a/arch/x86/include/asm/resctrl.h
>> +++ b/arch/x86/include/asm/resctrl.h
>> @@ -194,13 +194,15 @@ static inline u32 resctrl_arch_rmid_idx_encode(u32 ignored, u32 rmid)
>>  
>>  /* x86 can always read an rmid, nothing needs allocating */
>>  struct rdt_resource;
>> -static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, int evtid)
>> +static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
>> +					       enum resctrl_event_id evtid)
>>  {
>>  	might_sleep();
>>  	return NULL;
>>  };
> 
> I missed this stray ";" sneaking in ...
> 
>>  
>> -static inline void resctrl_arch_mon_ctx_free(struct rdt_resource *r, int evtid,
>> +static inline void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
>> +					     enum resctrl_event_id evtid,
>>  					     void *ctx) { };
>>  
> ... and this one.


Both removed - not sure how that happened!


Thanks,

James
