Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640708472
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746683070; cv=none; b=C1WWqj1txXTbV3JU3riltmWHOW24LhSXmKVk86RD6cO51jpBRUro72aMlxfxdHViQ2YQii6bVTJiIP0kfHEW68s3VQn6jwNf8HCqq8AISFg7ft2KdhnjpYIWOitqjSxhsLoS2lPOJanx958mgaTjDPnaLOhHTuEta4MQDk5xGuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746683070; c=relaxed/simple;
	bh=0ePiEDjDcUm0cmeO17OxlWRoN9CVjKPQsbbioAJRyHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTb/UFX6VWYarAoU8n1+7Xpnc5vnFI3QzEOzQDIh57dx+kcvczkfy1M5x1Pd1Y4TQW6ztpPjXWK5Ov/OQiOB40VXp/wCEhGnYzL+N3QACJ0edjxCrcTSc+Cu1/nKTEMlAiXNPr4fLkXTKApBe8S5OtPAV7MtNa1YFaKFqTBCo+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AD15106F;
	Wed,  7 May 2025 22:44:17 -0700 (PDT)
Received: from [10.163.54.182] (unknown [10.163.54.182])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D35D73F673;
	Wed,  7 May 2025 22:44:23 -0700 (PDT)
Message-ID: <4e5941f8-7e61-4a63-a669-bee1601093a6@arm.com>
Date: Thu, 8 May 2025 11:14:20 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Drop duplicate check in pmd_trans_huge()
To: Gavin Shan <gshan@redhat.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 ryan.roberts@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 yangyicong@hisilicon.com, shan.gavin@gmail.com
References: <20250508035142.189726-1-gshan@redhat.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250508035142.189726-1-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/25 09:21, Gavin Shan wrote:
> pmd_val(pmd) is inclusive to pmd_present(pmd) since the PMD entry
> value isn't zero when pmd_present() returns true. Just drop the
> duplicate check done by pmd_val(pmd).

Agreed, pmd_val() is redundant here because a positive pmd_present()
also ensures a positive pmd_val().

#define pmd_present(pmd) pte_present(pmd_pte(pmd))
#define pte_present(pte) (pte_valid(pte) || pte_present_invalid(pte))

#define pte_valid(pte)           (!!(pte_val(pte) & PTE_VALID))
#define pte_present_invalid(pte) ((pte_val(pte) & (PTE_VALID |
				  PTE_PRESENT_INVALID)) == PTE_PRESENT_INVALID)

pte_present() cannot return positive here unless either of the flags
PTE_VALID or PTE_PRESENT_INVALID is set which implies pte_val() would
also return positive.

Probably it would be better to add the above details in the commit
message here as well.

The earlier commit skipped dropping pmd_val() in order to keep then
proposed change confined to just adding new pmd_table() check, even
though pmd_val() redundancy was evident as well which should have
been dropped there after.

d1770e909898 ("arm64/mm: Check pmd_table() in pmd_trans_huge()")

> 
> No functional changes intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> Found this by code inspection
> ---
>  arch/arm64/include/asm/pgtable.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index d3b538be1500..2599b9b8666f 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -739,8 +739,7 @@ static inline int pmd_trans_huge(pmd_t pmd)
>  	 * If pmd is present-invalid, pmd_table() won't detect it
>  	 * as a table, so force the valid bit for the comparison.
>  	 */
> -	return pmd_val(pmd) && pmd_present(pmd) &&
> -	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
> +	return pmd_present(pmd) && !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
>  }
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> 
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
