Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A79223A564
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270127; cv=none; b=VvwGSyqU+d4Z0Z/cKppyvYhgSzWSDdb+d11K1lc+SDVpXYr0eXqVLb/OQGyf+fM6SsyH0DZXqgoMVZL+js2gtwQTqaICSxfW1xZCUW4ZaGDTxrfIKi+B8Uc1eNCM5BIG636OQcZmC7fBQRIHdqlKXXwUIbgrHqt2skthTy88i/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270127; c=relaxed/simple;
	bh=v+qpi3Ka67tWISY7vMzRP9XKIHWv/1TJKBwFBb2M7Mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DOaBYwCBFFdHds+9fMlcjw8vZfsI8UmY+UYs6p+SDc+gUe1VdXERd/gBmLkZQX6vH33s/JKERhaeAQgO0l3z8lLc6eLk7f7jnIBqULVar9OtJ35VfEltl2h22S9f4H+HibjuApG57+epD3XX1oznVHAjoP+sXEQitSlV66IalDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C9CA15A1;
	Mon, 30 Jun 2025 00:55:09 -0700 (PDT)
Received: from [10.163.37.132] (unknown [10.163.37.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C60443F58B;
	Mon, 30 Jun 2025 00:55:19 -0700 (PDT)
Message-ID: <786c83e0-d69f-4fa3-a39c-94c4dfc08a20@arm.com>
Date: Mon, 30 Jun 2025 13:25:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Reduce race probability between migration and
 khugepaged
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250630044837.4675-1-dev.jain@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250630044837.4675-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/06/25 10:18 AM, Dev Jain wrote:
> Suppose a folio is under migration, and khugepaged is also trying to
> collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
> page cache via filemap_lock_folio(), thus taking a reference on the folio
> and sleeping on the folio lock, since the lock is held by the migration
> path. Migration will then fail in
> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
> such a race happening (leading to migration failure) by bailing out
> if we detect a PMD is marked with a migration entry.

Could the migration be re-attempted after such failure ? Seems like
the migration failure here is traded for a scan failure instead.

> 
> This fixes the migration-shared-anon-thp testcase failure on Apple M3.

Could you please provide some more context why this test case was
failing earlier and how does this change here fixes the problem ?

> 
> Note that, this is not a "fix" since it only reduces the chance of
> interference of khugepaged with migration, wherein both the kernel
> functionalities are deemed "best-effort".
> > Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> 
> This patch was part of
> https://lore.kernel.org/all/20250625055806.82645-1-dev.jain@arm.com/
> but I have sent it separately on suggestion of Lorenzo, and also because
> I plan to send the first two patches after David Hildenbrand's
> folio_pte_batch series gets merged.
> 
>  mm/khugepaged.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 1aa7ca67c756..99977bb9bf6a 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -31,6 +31,7 @@ enum scan_result {
>  	SCAN_FAIL,
>  	SCAN_SUCCEED,
>  	SCAN_PMD_NULL,
> +	SCAN_PMD_MIGRATION,
>  	SCAN_PMD_NONE,
>  	SCAN_PMD_MAPPED,
>  	SCAN_EXCEED_NONE_PTE,
> @@ -941,6 +942,8 @@ static inline int check_pmd_state(pmd_t *pmd)
>  
>  	if (pmd_none(pmde))
>  		return SCAN_PMD_NONE;
> +	if (is_pmd_migration_entry(pmde))
> +		return SCAN_PMD_MIGRATION;
>  	if (!pmd_present(pmde))
>  		return SCAN_PMD_NULL;
>  	if (pmd_trans_huge(pmde))
> @@ -1502,9 +1505,12 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>  	    !range_in_vma(vma, haddr, haddr + HPAGE_PMD_SIZE))
>  		return SCAN_VMA_CHECK;
>  
> -	/* Fast check before locking page if already PMD-mapped */
> +	/*
> +	 * Fast check before locking folio if already PMD-mapped, or if the
> +	 * folio is under migration
> +	 */
>  	result = find_pmd_or_thp_or_none(mm, haddr, &pmd);
> -	if (result == SCAN_PMD_MAPPED)
> +	if (result == SCAN_PMD_MAPPED || result == SCAN_PMD_MIGRATION)
Should mapped PMD and migrating PMD be treated equally while scanning ?

>  		return result;
>  
>  	/*
> @@ -2716,6 +2722,7 @@ static int madvise_collapse_errno(enum scan_result r)
>  	case SCAN_PAGE_LRU:
>  	case SCAN_DEL_PAGE_LRU:
>  	case SCAN_PAGE_FILLED:
> +	case SCAN_PMD_MIGRATION:
>  		return -EAGAIN;
>  	/*
>  	 * Other: Trying again likely not to succeed / error intrinsic to
> @@ -2802,6 +2809,7 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
>  			goto handle_result;
>  		/* Whitelisted set of results where continuing OK */
>  		case SCAN_PMD_NULL:
> +		case SCAN_PMD_MIGRATION:
>  		case SCAN_PTE_NON_PRESENT:
>  		case SCAN_PTE_UFFD_WP:
>  		case SCAN_PAGE_RO:
