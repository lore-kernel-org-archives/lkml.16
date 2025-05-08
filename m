Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6014A33
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746696138; cv=none; b=PynluSdbY8ZPDUAQegavgo/6P9sjd6FznQmo1KF0+cHqVLt+BluWqI6davd31L96YjLetMTHvDBRvV6/D99KhW79HUwr+WX3zKTofvjBO4oIwit4wzvHKaNZamDjPpic7RpHapEvw6MPboj6LcyT6dpYyRmCae2yyhL/rOPjojg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746696138; c=relaxed/simple;
	bh=hD0kNKuwUatNmuW9DjNzyddcomhcH3SN2UXmXieN4qM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJHvdDbMysHqw3+FWS97RFGORhMAgS6cNIBmlZc+FckgfywZSESW68t1/OEphAZg7V1PHAmnZyfDOdDMMaEA9HMceii9lXwl2QxqvLMRbB7vfrbOZUbmAjqoZfGecSzEKJjU1HfD3IB0Eltz6Vi4LYJM+RObAwXvv/iGYE3wWfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30F5E106F;
	Thu,  8 May 2025 02:22:06 -0700 (PDT)
Received: from [10.57.90.222] (unknown [10.57.90.222])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE0FB3F673;
	Thu,  8 May 2025 02:22:14 -0700 (PDT)
Message-ID: <0c6455f1-5a7b-4ae3-b7f8-7f163b6abc9a@arm.com>
Date: Thu, 8 May 2025 10:22:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: mm: Drop redundant check in pmd_trans_huge()
Content-Language: en-GB
To: Gavin Shan <gshan@redhat.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 anshuman.khandual@arm.com, dev.jain@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, yangyicong@hisilicon.com, shan.gavin@gmail.com
References: <20250508085251.204282-1-gshan@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250508085251.204282-1-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/05/2025 09:52, Gavin Shan wrote:
> pmd_val(pmd) is redundant because a positive pmd_present(pmd) ensures
> a positive pmd_val(pmd) according to their definitions like below.
> 
>   #define pmd_val(x)       ((x).pmd)
>   #define pmd_present(pmd) pte_present(pmd_pte(pmd))
>   #define pte_present(pte) (pte_valid(pte) || pte_present_invalid(pte))
>   #define pte_valid(pte)   (!!(pte_val(pte) & PTE_VALID))
>   #define pte_present_invalid(pte) \
>           ((pte_val(pte) & (PTE_VALID | PTE_PRESENT_INVALID)) == PTE_PRESENT_INVALID)
> 
> pte_present() can't be positive unless either of the flag PTE_VALID or
> PTE_PRESENT_INVALID is set. In this case, pmd_val(pmd) should be positive
> either.
> 
> So lets drop the redundant check pmd_val(pmd) and no functional changes
> intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> v1: https://lore.kernel.org/linux-arm-kernel/4e5941f8-7e61-4a63-a669-bee1601093a6@arm.com/T/#u
> v2: Improved commit log per Anshuman
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

I agree the cleanup is useful and correct, so:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>


But personally I find it maddening that we have:

#define pmd_table(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
				 PMD_TYPE_TABLE)
#define pmd_sect(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
				 PMD_TYPE_SECT)
#define pmd_leaf(pmd)		(pmd_present(pmd) && !pmd_table(pmd))

static inline int pmd_trans_huge(pmd_t pmd)
{
	/*
	 * If pmd is present-invalid, pmd_table() won't detect it
	 * as a table, so force the valid bit for the comparison.
	 */
	return pmd_val(pmd) && pmd_present(pmd) &&
	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
}

Which all do basically the same thing, but with some very subtle differences.

Surely we should really only need 2 basic functions; is it a table? is it a
leaf? Then pmd_sect() and pmd_trans_huge() should just be aliases of pmd_leaf().

I *think* pmd_sect() and pmd_leaf() are really just 2 different ways of
expressing the same thing? Which is "Is this a *VALID* leaf?"

And pmd_trans_huge() is asking "Is this either a *VALID* or *PRESENT_INVALID* leaf?"

I'm not sure if we can relax pmd_sect()/pmd_leaf() to give the same semantics as
pmd_trans_huge()? I would guess we can. In which case it would be nice to clean
this all up to a single implementation and make the others wrappers. Or better
yet, fix the callers to consistently use pmd_leaf(). And do the same for pud.

Thanks,
Ryan

