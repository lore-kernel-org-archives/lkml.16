Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF5D212FAB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745485975; cv=none; b=MkdtWh7D+7nyY5W9ypGGmKXUMtQzqujEp8MjivxDiLBYEFvaBaf17QCCkNoeWFYCc+YFg/5o8s1vh1rW39d9ADtJVYWJ9+m6lCD3fuzjSkHMsk2Y5KmAJZVgWsMDAOy1FIPhxoKln+5OrV4ZynHju9u/AICzsVemPvlt1Z6TNgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745485975; c=relaxed/simple;
	bh=3bRYCicdizzfdiRvG/V3XEgTpVdC0hGna9CbSuLmPo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cf+iT29LjgJVa2dLG6YNU4mIdYuMHGKf5/s5RRBX3LySPXl0ltx3dbR8nQHttShuRav6QHyaNR79MhUtFBfc+Ijq7QfWTY+MxWVq6g47JVBq+zhmDNr6Kluj4xwbqTDAzQbHI/T5oICqYgkaDxI2XyK6nlVJrbLJwfE9IIw89K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC98D1063;
	Thu, 24 Apr 2025 02:12:46 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07B213F66E;
	Thu, 24 Apr 2025 02:12:47 -0700 (PDT)
Message-ID: <aa3594fa-2fd6-432f-8ae4-b4e472639e37@arm.com>
Date: Thu, 24 Apr 2025 10:12:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/21] x86/resctrl: Remove the limit on the number of
 CLOSID
To: x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
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
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-3-james.morse@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250411164229.23413-3-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello!

On 11/04/2025 17:42, James Morse wrote:
> From: Amit Singh Tomar <amitsinght@marvell.com>
> 
> Resctrl allocates and finds free CLOSID values using the bits of a u32.
> This restricts the number of control groups that can be created by
> user-space.
> 
> MPAM has an architectural limit of 2^16 CLOSID values, Intel x86 could
> be extended beyond 32 values. There is at least one MPAM platform which
> supports more than 32 CLOSID values.
> 
> Replace the fixed size bitmap with calls to the bitmap API to allocate
> an array of a sufficient size.
> 
> ffs() returns '1' for bit 0, hence the existing code subtracts 1 from
> the index to get the CLOSID value. find_first_bit() returns the bit
> number which does not need adjusting.

> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 776c8e347654..4e0308040c6e 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c

> @@ -152,20 +152,31 @@ int closids_supported(void)
>  	return closid_free_map_len;
>  }
>  
> -static void closid_init(void)
> +static int closid_init(void)
>  {
>  	struct resctrl_schema *s;
> -	u32 rdt_min_closid = 32;
> +	u32 rdt_min_closid = ~0;
>  
>  	/* Compute rdt_min_closid across all resources */
>  	list_for_each_entry(s, &resctrl_schema_all, list)
>  		rdt_min_closid = min(rdt_min_closid, s->num_closid);

Platforms that don't have any controls - only monitors - will still call closid_init().
Previously this initialised the fixed-sized bitmap, which was harmless as helpers like
closid_alloc() are never called.

With this change, rdt_min_closid keeps its dummy initialisation value of ~0, meaning this:

> -	closid_free_map = BIT_MASK(rdt_min_closid) - 1;
> +	closid_free_map = bitmap_alloc(rdt_min_closid, GFP_KERNEL);

Blows up with a greater than 'max order' error.

I've added a list_empty() check to the top of the function:
|       /* Monitor only platforms still call closid_init() */
|       if (list_empty(&resctrl_schema_all))
|               return 0;

(list-empty as its clearer what goes wrong without the check).
I reckon this is minor, so I'll keep the existing tags.


I'm not aware of anyone building a monitor-only MPAM platform - I configured one by
accident with one of the software models!


Thanks,

James
