Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D532A347A2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743672678; cv=none; b=SoWzeRm6hqJo56ET/wLjcQ9J7TR2a7K89NorVJR1c7S486pKiNTpSxwfyW3oRJ5hmkisq6u8lqrsqHjF9M6LPqkjlASa0KBxMLpwwiezJY86emtDOF8RoW82d5Q2gKsrRMBs5Odv6l8NB3u63GdKiB23AmHYrBWxAII66JQWfzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743672678; c=relaxed/simple;
	bh=Zd6AJnU2BMeaWm/0mQRVGARbnLs5KgKjE7/uIfO6BS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V2JlidP5ttdGv4qqK2+LkuQytkk4vry/vvKqFUJEI4qMoxt2NFv0NTdFubRynoWgqZVn2IUS0HH6nuwFjfxUrQHAfSjUYRkuEtgVKfnvw/wDR0Sl6yUNc+Rp5WVisZ+oOsGkZoCbWffLLVVxfoEoYnyKG5ZC0+RKywDNRraJxJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9718C106F;
	Thu,  3 Apr 2025 02:31:17 -0700 (PDT)
Received: from [10.163.48.25] (unknown [10.163.48.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F60E3F63F;
	Thu,  3 Apr 2025 02:31:07 -0700 (PDT)
Message-ID: <36dcb5e3-4406-4763-87f1-8054c2246264@arm.com>
Date: Thu, 3 Apr 2025 15:01:03 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: gshan@redhat.com, rppt@kernel.org, steven.price@arm.com,
 suzuki.poulose@arm.com, tianyaxiong@kylinos.cn, ardb@kernel.org,
 david@redhat.com, ryan.roberts@arm.com, urezki@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250403052844.61818-1-dev.jain@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250403052844.61818-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/3/25 10:58, Dev Jain wrote:
> arm64 uses apply_to_page_range to change permissions for kernel vmalloc mappings,
> which does not support changing permissions for block mappings. This function
> will change permissions until it encounters a block mapping, and will bail
> out with a warning. Since there are no reports of this triggering, it
> implies that there are currently no cases of code doing a vmalloc_huge()
> followed by partial permission change. But this is a footgun waiting to
> go off, so let's detect it early and avoid the possibility of permissions
> in an intermediate state. So,  explicitly disallow changing permissions
> for VM_ALLOW_HUGE_VMAP mappings.
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> v1->v2:
>  - Improve changelog, keep mention of page mappings in comment
> 
>  arch/arm64/mm/pageattr.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 39fd1f7ff02a..04d4a8f676db 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -96,8 +96,8 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	 * we are operating on does not result in such splitting.
>  	 *
>  	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
> -	 * Those are guaranteed to consist entirely of page mappings, and
> -	 * splitting is never needed.
> +	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
> +	 * mappings are updated and splitting is never needed.
>  	 *
>  	 * So check whether the [addr, addr + size) interval is entirely
>  	 * covered by precisely one VM area that has the VM_ALLOC flag set.
> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	area = find_vm_area((void *)addr);
>  	if (!area ||
>  	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
> -	    !(area->flags & VM_ALLOC))
> +	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>  		return -EINVAL;
>  
>  	if (!numpages)

LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
