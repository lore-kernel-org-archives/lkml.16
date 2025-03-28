Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141EDEAF9
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172754; cv=none; b=VFbEP1GB6D4zk2x8P4/zKk8EnZUPv9L/tnsY4QrceKgJPe4E3FH7wiHaJBCoHbl1GrXYe1Dv0yWh7LqiGr4agk6OjZFSf9vUp+o8I8ip7D4yFoJ1fHsLPs/2DWAI3LJf+9DPJ3rEjVWGGcyKHWAFeod1N4YBeACsWL8KSH6dy1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172754; c=relaxed/simple;
	bh=lB4A7DTLlUyxu+KgYzwbW61prVXvsTUY84Tjrn8JjtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bNUdA+ad2pG+do1W6pS+yay/tXZ8gTDQzHwgFxvm2NT2Pi5trUygDH8w6fNMv5+jyhjRpkn8flBc7n9J7U7Ds7rvtjOx33gBzhP+14kw8B82Sfh4Kc3X+n/9ZF8XQwVgKu3yl7/XEpL1e5cCSIoFMNHP7UQ68vz/hyX+OSHXKYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F04B71691;
	Fri, 28 Mar 2025 07:39:16 -0700 (PDT)
Received: from [10.57.87.112] (unknown [10.57.87.112])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 137103F58B;
	Fri, 28 Mar 2025 07:39:09 -0700 (PDT)
Message-ID: <54db9fe1-7115-476e-b838-80aa68aabe7e@arm.com>
Date: Fri, 28 Mar 2025 14:39:08 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: gshan@redhat.com, rppt@kernel.org, steven.price@arm.com,
 suzuki.poulose@arm.com, tianyaxiong@kylinos.cn, ardb@kernel.org,
 david@redhat.com, urezki@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250328062103.79462-1-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250328062103.79462-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2025 02:21, Dev Jain wrote:
> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
> which does not support changing permissions for leaf mappings. This function

I think you mean "block" mappings here? A leaf mapping refers to a page table
entry that maps a piece of memory at any level in the pgtable (i.e. a present
entry that does not map a table).

A block mapping is an Arm ARM term used to mean a leaf mapping at a level other
than the last level (e.g. pmd, pud). A page mapping is an Arm ARM term used to
mean a leaf mapping at the last level (e.g. pte).

> will change permissions until it encounters a leaf mapping, and will bail

block mapping

> out. To avoid this partial change, explicitly disallow changing permissions
> for VM_ALLOW_HUGE_VMAP mappings.

It will also emit a warning. Since there are no reports of this triggering, it
implies that there are currently no cases of code doing a vmalloc_huge()
followed by partial permission change, at least on arm64 (I'm told BPF does do
this on x86 though). But this is a footgun waiting to go off, so let's detect it
early and avoid the possibility of permissions in an intermediate state. (It
might be worth wordsmithing this into the commit log).

> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>

With the commit log fixed up:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/arm64/mm/pageattr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 39fd1f7ff02a..8337c88eec69 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -96,7 +96,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	 * we are operating on does not result in such splitting.
>  	 *
>  	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
> -	 * Those are guaranteed to consist entirely of page mappings, and
> +	 * Disallow VM_ALLOW_HUGE_VMAP vmalloc mappings so that
>  	 * splitting is never needed.
>  	 *
>  	 * So check whether the [addr, addr + size) interval is entirely
> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	area = find_vm_area((void *)addr);
>  	if (!area ||
>  	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
> -	    !(area->flags & VM_ALLOC))
> +	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>  		return -EINVAL;
>  
>  	if (!numpages)

