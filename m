Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545301DEFE7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750849762; cv=none; b=qUksxBXU1FiC8We8P5gh2xyq/nOx3f5QpaEzbawU3h6QehdXqW3L9S9QoTvBlVtbTsf/cs1dH1maRgw5KMitMAIt02Yiq1JKnLeDwfq27Le0f9Crv0qUxBzL6GGv6nzdmVmSno5UHwQSnJeQXP42FgGe3hBLlR6ATQXt3CwD+oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750849762; c=relaxed/simple;
	bh=nZSDw6MlZa6wcmNAFJjZXW9YvlRkz13vt4FUwhedu/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hj+WfyEcKd4Flyl6d338AL4Qw7LTHjWz+JUvOEZxbEKM6NbQv2L5dXEmEcs2PdhRmRbZs8oTJ8/ShIgunTiJat1YZZJ+XroYLMQ2v40sfG6tZ80lHmUnHIZ7JwPYU4b2TIMwNItn9qJx3aPIo3fALf8K/ApOdGsXcvC5rD8iqwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23FB8106F;
	Wed, 25 Jun 2025 04:09:01 -0700 (PDT)
Received: from [10.57.84.221] (unknown [10.57.84.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 043DD3F58B;
	Wed, 25 Jun 2025 04:09:09 -0700 (PDT)
Message-ID: <400b6d4e-bf10-4b89-bcbe-2375b1972220@arm.com>
Date: Wed, 25 Jun 2025 12:08:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: pageattr: Enable huge-vmalloc permission
 change
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
 catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, anshuman.khandual@arm.com
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-3-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250613134352.65994-3-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/06/2025 14:43, Dev Jain wrote:
> Commit fcf8dda8cc48 ("arm64: pageattr: Explicitly bail out when changing
> permissions for vmalloc_huge mappings") disallowed changing permissions
> for vmalloc-huge mappings. The motivation of this was to enforce an API
> requirement and explicitly tell the caller that it is unsafe to change
> permissions for block mappings since splitting may be required, which
> cannot be handled safely on an arm64 system in absence of BBML2.
> 
> This patch effectively partially reverts this commit, since patch 1
> will now enable permission changes on kernel block mappings, thus,
> through change_memory_common(), enable permission changes for vmalloc-huge
> mappings. Any caller "misusing" the API, in the sense, calling it for
> a partial block mapping, will receive an error code of -EINVAL via
> the pagewalk callbacks, thus reverting to the behaviour of the API
> itself returning -EINVAL, through apply_to_page_range returning -EINVAL
> in case of block mappings, the difference now being, the -EINVAL is
> restricted to playing permission games on partial block mappings
> courtesy of patch 1.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/mm/pageattr.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index cfc5279f27a2..66676f7f432a 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -195,8 +195,6 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	 * we are operating on does not result in such splitting.
>  	 *
>  	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
> -	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
> -	 * mappings are updated and splitting is never needed.
>  	 *
>  	 * So check whether the [addr, addr + size) interval is entirely
>  	 * covered by precisely one VM area that has the VM_ALLOC flag set.
> @@ -204,7 +202,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	area = find_vm_area((void *)addr);
>  	if (!area ||
>  	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
> -	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
> +	    !(area->flags & VM_ALLOC))
>  		return -EINVAL;
>  
>  	if (!numpages)

I'd be inclined to leave this restriction in place for now. It is not useful
until we have context of the full vmalloc-huge-by-default series, I don't think?
