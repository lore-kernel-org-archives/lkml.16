Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169BB7DA8C
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917692; cv=none; b=QFIEcEOvsm9j7xZyUo1Fae34v0OABYJsOwNT0bg1p2S4GSlDq8+F2df4mCByXw9CVFePmEXdBJz1BzByzkrhERiUltEMJj+pwCdOy/UXtH54hbChUceFjGRJmjjNbg6jYwptAis+x31Pyrir1NsRBH7ZwwnYoOMIzvpTbqi/kiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917692; c=relaxed/simple;
	bh=rA/hJ9ZH5vUSfyk8MgnRZZLD+mKzVmJhBoAsz26oAC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ohd1HwAxMZaff7b0YKtbWYGPpMufAWObrchaURMNpfMZA98tX2TWKGJ5Txc7eBmVtzijzoyVb7cp0/XdSiBzOlVQlMTfXdQpD24tDESzAtf8cfULB2I9GK+ls6DNIM/mR/rlWWxw4AOgD8ZDxJChiYfFDmxou/xe4AVJj5ER+9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 602831063;
	Fri,  7 Feb 2025 00:41:52 -0800 (PST)
Received: from [10.162.16.89] (a077893.blr.arm.com [10.162.16.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68CBC3F5A1;
	Fri,  7 Feb 2025 00:41:24 -0800 (PST)
Message-ID: <3bbae070-1ae3-4f5d-86ab-b3221425a1cb@arm.com>
Date: Fri, 7 Feb 2025 14:11:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/16] mm/vmalloc: Warn on improper use of
 vunmap_range()
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Steve Capper <steve.capper@linaro.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250205151003.88959-1-ryan.roberts@arm.com>
 <20250205151003.88959-11-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250205151003.88959-11-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/5/25 20:39, Ryan Roberts wrote:
> A call to vmalloc_huge() may cause memory blocks to be mapped at pmd or
> pud level. But it is possible to subsquently call vunmap_range() on a

s/subsquently/subsequently

> sub-range of the mapped memory, which partially overlaps a pmd or pud.
> In this case, vmalloc unmaps the entire pmd or pud so that the
> no-overlapping portion is also unmapped. Clearly that would have a bad
> outcome, but it's not something that any callers do today as far as I
> can tell. So I guess it's jsut expected that callers will not do this.

s/jsut/just

> 
> However, it would be useful to know if this happened in future; let's
> add a warning to cover the eventuality.

This is a reasonable check to prevent bad outcomes later.

> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  mm/vmalloc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index a6e7acebe9ad..fcdf67d5177a 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -374,8 +374,10 @@ static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
>  		if (cleared || pmd_bad(*pmd))
>  			*mask |= PGTBL_PMD_MODIFIED;
>  
> -		if (cleared)
> +		if (cleared) {
> +			WARN_ON(next - addr < PMD_SIZE);
>  			continue;
> +		}
>  		if (pmd_none_or_clear_bad(pmd))
>  			continue;
>  		vunmap_pte_range(pmd, addr, next, mask);
> @@ -399,8 +401,10 @@ static void vunmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
>  		if (cleared || pud_bad(*pud))
>  			*mask |= PGTBL_PUD_MODIFIED;
>  
> -		if (cleared)
> +		if (cleared) {
> +			WARN_ON(next - addr < PUD_SIZE);
>  			continue;
> +		}
>  		if (pud_none_or_clear_bad(pud))
>  			continue;
>  		vunmap_pmd_range(pud, addr, next, mask);
Why not also include such checks in vunmap_p4d_range() and __vunmap_range_noflush()
for corresponding P4D and PGD levels as well ?
