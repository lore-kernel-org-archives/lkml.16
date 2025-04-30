Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DB34685
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746022576; cv=none; b=T6e48bjb010vp/T7AvRj/gMLmzCYGdECYX2j3+quKVjNKB2kvrVmomSQitSiibYM2rlL3GlmmdAoiPoyBUB9gZOW9X1OLpEpH+Skt+K822ND0vx+r1zMvN3mCgnk2vgn6fwmuQbmeXfSYDGDXp+ary4+wLaV4MgMXkPAbY4j3BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746022576; c=relaxed/simple;
	bh=YybGeKxAC01pT+Xiq36AdAKWA4Uaix6hmQqE1y7YXe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UX6XjaUwqPlycU1BP+CWUIZj0hU3Hx0dOk2JReNJaUfIpDC/gioyUZSYpfG9ddfz12DF6K5tPH1686eRzKsAkAco41xL7Tw1pmezTLMwRPG+odN8LDHfZuDjxOiJXzXO/9afYjGNJAACMNxXcHrm3tzbDAzo846wtqShZAPaI9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 035EB106F;
	Wed, 30 Apr 2025 07:16:07 -0700 (PDT)
Received: from [10.57.84.121] (unknown [10.57.84.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C5B03F673;
	Wed, 30 Apr 2025 07:16:09 -0700 (PDT)
Message-ID: <71cb77b8-c4b8-4d63-8b59-105440527c15@arm.com>
Date: Wed, 30 Apr 2025 15:16:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] mm: Add batched versions of
 ptep_modify_prot_start/commit
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-4-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250429052336.18912-4-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2025 06:23, Dev Jain wrote:
> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
> Architecture can override these helpers.

I would suggest merging this with patch #7 since that's where they actually get
used. Then you can add a single patch after that to specialize them for arm64,
which will give a performance win.

Thanks,
Ryan

> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  include/linux/pgtable.h | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index b50447ef1c92..ed287289335f 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -891,6 +891,44 @@ static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
>  }
>  #endif
>  
> +/* See the comment for ptep_modify_prot_start */
> +#ifndef modify_prot_start_ptes
> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
> +		unsigned long addr, pte_t *ptep, unsigned int nr)
> +{
> +	pte_t pte, tmp_pte;
> +
> +	pte = ptep_modify_prot_start(vma, addr, ptep);
> +	while (--nr) {
> +		ptep++;
> +		addr += PAGE_SIZE;
> +		tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
> +		if (pte_dirty(tmp_pte))
> +			pte = pte_mkdirty(pte);
> +		if (pte_young(tmp_pte))
> +			pte = pte_mkyoung(pte);
> +	}
> +	return pte;
> +}
> +#endif
> +
> +/* See the comment for ptep_modify_prot_commit */
> +#ifndef modify_prot_commit_ptes
> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
> +		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
> +{
> +	for (;;) {
> +		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> +		if (--nr == 0)
> +			break;
> +		ptep++;
> +		addr += PAGE_SIZE;
> +		old_pte = pte_next_pfn(old_pte);
> +		pte = pte_next_pfn(pte);
> +	}
> +}
> +#endif
> +
>  /*
>   * On some architectures hardware does not set page access bit when accessing
>   * memory page, it is responsibility of software setting this bit. It brings

