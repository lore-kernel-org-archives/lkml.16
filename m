Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2266A27FB31
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750849456; cv=none; b=L3l5fc7riOLTyj+Pbe1E1XmbX1pD5IjctaDK6JWkBmpWgjeNUWC7qt0m+IM/GCPXUQjQKMPUL8omF44X4t0KEbSG2hRbv1Z09VQazODQ0bHXnUaGS0LVE653ivaVuqWimZhdIa7eo4oQ5QXx/aeMdM76In5BAyWlBTJwSmajxQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750849456; c=relaxed/simple;
	bh=ag22uG28h+O57NGii3vA1MicGGZ/ef7YItgruBjSBwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q6/LNYlMIZ1xl8vH5H6v95wlAvXNkl1mtLsMbX32ga6qDnzKlfhypU9/GAPN7Thw7T9pRq8K4w179Qxg14lSpTYkSB88h8NFCs38H1Jr+K8zHPcIpaRQgxNR5PRmGJ3jckOsvYokHlXNGPoKEwFIk4l4XgdmPQoMfktIeBp3pGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E40AB106F;
	Wed, 25 Jun 2025 04:03:55 -0700 (PDT)
Received: from [10.57.84.221] (unknown [10.57.84.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DED9C3F58B;
	Wed, 25 Jun 2025 04:04:10 -0700 (PDT)
Message-ID: <956f6ebe-606f-4575-a0a5-7841c95b5371@arm.com>
Date: Wed, 25 Jun 2025 12:04:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change memory
 permissions
Content-Language: en-GB
To: Mike Rapoport <rppt@kernel.org>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, anshuman.khandual@arm.com
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com> <aE53Jp7ZGgTxtxwG@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aE53Jp7ZGgTxtxwG@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/06/2025 08:32, Mike Rapoport wrote:
> On Fri, Jun 13, 2025 at 07:13:51PM +0530, Dev Jain wrote:
>> -/*
>> - * This function assumes that the range is mapped with PAGE_SIZE pages.
>> - */
>> -static int __change_memory_common(unsigned long start, unsigned long size,
>> +static int ___change_memory_common(unsigned long start, unsigned long size,
>>  				pgprot_t set_mask, pgprot_t clear_mask)
>>  {
>>  	struct page_change_data data;
>> @@ -61,9 +140,28 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>>  	data.set_mask = set_mask;
>>  	data.clear_mask = clear_mask;
>>  
>> -	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
>> -					&data);
>> +	arch_enter_lazy_mmu_mode();
>> +
>> +	/*
>> +	 * The caller must ensure that the range we are operating on does not
>> +	 * partially overlap a block mapping. Any such case should either not
>> +	 * exist, or must be eliminated by splitting the mapping - which for
>> +	 * kernel mappings can be done only on BBML2 systems.
>> +	 *
>> +	 */
>> +	ret = walk_kernel_page_table_range_lockless(start, start + size,
>> +						    &pageattr_ops, NULL, &data);
> 
> x86 has a cpa_lock for set_memory/set_direct_map to ensure that there's on
> concurrency in kernel page table updates. I think arm64 has to have such
> lock as well.

We don't have a lock today, using apply_to_page_range(); we are expecting that
the caller has exclusive ownership of the portion of virtual memory - i.e. the
vmalloc region or linear map. So I don't think this patch changes that requirement?

Where it does get a bit more hairy is when we introduce the support for
splitting. In that case, 2 non-overlapping areas of virtual memory may share a
large leaf mapping that needs to be split. But I've been discussing that with
Yang Shi at [1] and I think we can handle that locklessly too.

Perhaps I'm misunderstanding something?

[1] https://lore.kernel.org/all/f036acea-1bd1-48a7-8600-75ddd504b8db@arm.com/

Thanks,
Ryan

> 
>> +	arch_leave_lazy_mmu_mode();
>> +
>> +	return ret;
>> +}
> 

