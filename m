Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C21A197A7A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747837034; cv=none; b=HMyHvvBecrkZsAYYvDH4dFn9DESlj/9+B6qkyPUnXLu0NOecZLN64pe3FkIuSkXlys39uo50PCM1Q/3meayyZeIl4DVeUauYhJlCWIzBE8ivqVVFvbtMlsQf9vzappqEbbx98ru+A+AHW3l9cVTWoNCV+MtShW5+D3lOGv9fmRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747837034; c=relaxed/simple;
	bh=OP/UNUf70Mz3dEPbGV42js0+j4b27Y7896TP6X8MsKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8xz2+e1tDnUzZTHXO9P3QFpXIDX2JWDmMtvngxgIAU253t1gLHvVZMuanwyF4i2iPgIN5C57eNR/LgxjKlKGuRrYcXfwG+jAOJD/sv+dqBvEnGX3SU8b8w5xBdHwuVvskSNW1NvnUq2DOewwZ0wSof4ftmaj3v5W3SxSV9+2Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBD9F1515;
	Wed, 21 May 2025 07:16:58 -0700 (PDT)
Received: from [10.57.94.227] (unknown [10.57.94.227])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A7823F5A1;
	Wed, 21 May 2025 07:17:08 -0700 (PDT)
Message-ID: <4d4b7d91-8ed9-4fc2-9079-267ffcbebb12@arm.com>
Date: Wed, 21 May 2025 15:17:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: Add batched version of
 ptep_modify_prot_commit
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-6-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250519074824.42909-6-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/05/2025 08:48, Dev Jain wrote:
> Override the generic definition to simply use set_ptes() to map the new
> ptes into the pagetable.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Let's squash this into the previous patch; it doesn't make sense for an arch to
implement one without the other. Otherwise, LGTM.

Thanks,
Ryan

> ---
>  arch/arm64/include/asm/pgtable.h | 5 +++++
>  arch/arm64/mm/mmu.c              | 9 ++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 8872ea5f0642..0b13ca38f80c 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1558,6 +1558,11 @@ extern pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>  				    unsigned long addr, pte_t *ptep,
>  				    unsigned int nr);
>  
> +#define modify_prot_commit_ptes modify_prot_commit_ptes
> +extern void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
> +				    pte_t *ptep, pte_t old_pte, pte_t pte,
> +				    unsigned int nr);
> +
>  #ifdef CONFIG_ARM64_CONTPTE
>  
>  /*
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index fe60be8774f4..5f04bcdcd946 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1543,10 +1543,17 @@ pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte
>  	return modify_prot_start_ptes(vma, addr, ptep, 1);
>  }
>  
> +void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
> +			     pte_t *ptep, pte_t old_pte, pte_t pte,
> +			     unsigned int nr)
> +{
> +	set_ptes(vma->vm_mm, addr, ptep, pte, nr);
> +}
> +
>  void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep,
>  			     pte_t old_pte, pte_t pte)
>  {
> -	set_pte_at(vma->vm_mm, addr, ptep, pte);
> +	modify_prot_commit_ptes(vma, addr, ptep, old_pte, pte, 1);
>  }
>  
>  /*

