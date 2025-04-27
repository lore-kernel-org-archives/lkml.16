Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DAA1A26B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 14:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745764544; cv=none; b=oBme9DlXHiQmJg0G28QffQmGliv3MQ+rFgH3+WFnqjpOW3dpBctN4/ZXOXOuVM2FntObsCHL6l49s85IHv1HSTH6Sfp0wxW+tGyD/xkVEjMjB6vZhtHSglAK5ynUrhxKwAUo2aQ9OjuY2513BxsyzPo4gsFxc7fQXiOFz+WgTHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745764544; c=relaxed/simple;
	bh=dj8b2XvmB5C6xHo8TJIDjLPYJebUQfkh132l9bjwf4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OSPWuS3YlGV9FZA+STjFO4wRPyYYsjonppV07pvL7ufVhQD+a9HNWIED7zoEhE3MhdPT2Iz+ClkKDACG2KUrwQqdX3ETf9GWmeDPG68H4hAabxEugWi7rQ5Sv6gvvfg9JiMm6G9hwCpoXVDQ3K6S2SBue3YmH/MMv80oT3O8cJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7AD1106F;
	Sun, 27 Apr 2025 07:35:34 -0700 (PDT)
Received: from [10.163.78.169] (unknown [10.163.78.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A5AD3F66E;
	Sun, 27 Apr 2025 07:35:35 -0700 (PDT)
Message-ID: <2b8d688e-a1b2-420a-8c09-6c3a28bf892a@arm.com>
Date: Sun, 27 Apr 2025 20:05:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
To: catalin.marinas@arm.com, will@kernel.org
Cc: gshan@redhat.com, rppt@kernel.org, steven.price@arm.com,
 suzuki.poulose@arm.com, tianyaxiong@kylinos.cn, ardb@kernel.org,
 david@redhat.com, ryan.roberts@arm.com, urezki@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250403052844.61818-1-dev.jain@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250403052844.61818-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Gentle Ping

On 03/04/25 10:58 am, Dev Jain wrote:
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
>   - Improve changelog, keep mention of page mappings in comment
> 
>   arch/arm64/mm/pageattr.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 39fd1f7ff02a..04d4a8f676db 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -96,8 +96,8 @@ static int change_memory_common(unsigned long addr, int numpages,
>   	 * we are operating on does not result in such splitting.
>   	 *
>   	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
> -	 * Those are guaranteed to consist entirely of page mappings, and
> -	 * splitting is never needed.
> +	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
> +	 * mappings are updated and splitting is never needed.
>   	 *
>   	 * So check whether the [addr, addr + size) interval is entirely
>   	 * covered by precisely one VM area that has the VM_ALLOC flag set.
> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>   	area = find_vm_area((void *)addr);
>   	if (!area ||
>   	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
> -	    !(area->flags & VM_ALLOC))
> +	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>   		return -EINVAL;
>   
>   	if (!numpages)

