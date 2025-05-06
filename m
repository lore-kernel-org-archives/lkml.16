Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752E321CA05
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522662; cv=none; b=Z3ONfuRy+01/i7fMKsh+FnZc9EScTaWSe0n5ypy4zDv+11lO1Fy/IlDHfHAab/hTAaUIb8hS1PORcjoSbVHvt3OFMDJSip4tSck+/fFYPyfUgcd11ciySysP7GbpXjDTh0/qNw4oQ46VtYwjlNCgXl7YyQHzdKOdtz0BCjJF9QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522662; c=relaxed/simple;
	bh=/uIAYW5ti1w9nVLiO7DKGul+p7+eEMse2IJbhsA44b4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h92LXItGNTex+oxXZ7Sm2diAgnHUHGwzyRL+UqgIHHSIeNDWjr5t9+90RgrBqdSXyaAGka2O6JBO8fueXrn5VPoxmtynKEp01iWE9w7W/mU+zBvp9qaJiJJ24cvmBm24ojaIi89plA8JtZ6faEAezPZL5v9viWdsBXuiLfJkTdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D13B6113E;
	Tue,  6 May 2025 02:10:49 -0700 (PDT)
Received: from [10.163.54.208] (unknown [10.163.54.208])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5C7F3F5A1;
	Tue,  6 May 2025 02:10:50 -0700 (PDT)
Message-ID: <f960f7c2-465f-4b18-b0b6-3db4a12104d2@arm.com>
Date: Tue, 6 May 2025 14:40:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mm: Add generic helper to hint a large folio
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
 ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
 maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com
References: <20250506050056.59250-1-dev.jain@arm.com>
 <20250506050056.59250-3-dev.jain@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250506050056.59250-3-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/6/25 10:30, Dev Jain wrote:
> To use PTE batching, we want to determine whether the folio mapped by
> the PTE is large, thus requiring the use of vm_normal_folio(). We want
> to avoid the cost of vm_normal_folio() if the code path doesn't already
> require the folio. For arm64, pte_batch_hint() does the job. To generalize
> this hint, add a helper which will determine whether two consecutive PTEs
> point to consecutive PFNs, in which case there is a high probability that
> the underlying folio is large.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  include/linux/pgtable.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index b50447ef1c92..28e21fcc7837 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -369,6 +369,22 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
>  }
>  #endif
>  
> +/* Caller must ensure that ptep + 1 exists */
> +static inline bool maybe_contiguous_pte_pfns(pte_t *ptep, pte_t pte)
> +{
> +	pte_t *next_ptep, next_pte;
> +
> +	if (pte_batch_hint(ptep, pte) != 1)
> +		return true;
> +
> +	next_ptep = ptep + 1;
> +	next_pte = ptep_get(next_ptep);
> +	if (!pte_present(next_pte))
> +		return false;
> +
> +	return unlikely(pte_pfn(next_pte) - pte_pfn(pte) == PAGE_SIZE);
> +}
> +
>  #ifndef __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
>  static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
>  					    unsigned long address,

As mentioned earlier, this new helper maybe_contiguous_pte_pfns() does not
have a proposed caller. Hence please do consider folding this forward with
the next patch where move_ptes() starts using the helper. Besides, it is
also difficult to review this patch without a proper caller context.
