Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B15C18E1F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749052965; cv=none; b=gN7jrBIE0GOvUjWRShbFIxWXyEhbwB6/YLSqylTkqrNHe/f/m3dLlfaw34y2CwMF3AeVDQ6Y16gLwC2ruUUrp8QaIUOMuJSYWO2swzPuvY8zSJ/1rp6pWKwtVA5weu8K+X8bkGVprSUPY2ZFqLlNmvDBUtOAX8z/btfcLsuy+GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749052965; c=relaxed/simple;
	bh=qZ5EHjmyeg2ocp1XLPS7/1rjthqw9EnH529CqoWDidU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uq8sle432mZwqrrth0FE1vqpDCoLygmB8qm3TVa6gvER2Lbs6Hbo7PjzKuDav9egEuucKTNqVvwwihCFIkIPmLW09FhekeX7fz/xE8d+5R8vpZAKv+Or/zU6bSoaIb3cmgEL4nazArCf7YS6JbKknv/8g4Ulkp7JrgElD39xSVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E52251758;
	Wed,  4 Jun 2025 09:02:25 -0700 (PDT)
Received: from [10.1.27.175] (XHFQ2J9959.cambridge.arm.com [10.1.27.175])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5CF73F5A1;
	Wed,  4 Jun 2025 09:02:40 -0700 (PDT)
Message-ID: <99a0a2c8-d98e-4c81-9207-c55c72c00872@arm.com>
Date: Wed, 4 Jun 2025 17:02:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] arm64/mm: Optimize loop to reduce redundant operations
 of contpte_ptep_get
Content-Language: en-GB
To: Xavier Xia <xavier_qy@163.com>, 21cnbao@gmail.com, dev.jain@arm.com,
 ioworker0@gmail.com
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, david@redhat.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org,
 ziy@nvidia.com, Barry Song <baohua@kernel.org>
References: <20250510125948.2383778-1-xavier_qy@163.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250510125948.2383778-1-xavier_qy@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2025 13:59, Xavier Xia wrote:
> This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockless
> function by adding early termination logic. It checks if the dirty and
> young bits of orig_pte are already set and skips redundant bit-setting
> operations during the loop. This reduces unnecessary iterations and
> improves performance.
> 
> In order to verify the optimization performance, a test function has been
> designed. The function's execution time and instruction statistics have
> been traced using perf, and the following are the operation results on a
> certain Qualcomm mobile phone chip:
> 
> Test Code:

nit: It would have been good to include the source for the whole program,
including #includes and the main() function to make it quicker for others to get
up and running.

> 
> 	#define PAGE_SIZE 4096
> 	#define CONT_PTES 16
> 	#define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
> 	#define YOUNG_BIT 8
> 	void rwdata(char *buf)
> 	{
> 		for (size_t i = 0; i < TEST_SIZE; i += PAGE_SIZE) {
> 			buf[i] = 'a';
> 			volatile char c = buf[i];
> 		}
> 	}
> 	void clear_young_dirty(char *buf)
> 	{
> 		if (madvise(buf, TEST_SIZE, MADV_FREE) == -1) {
> 			perror("madvise free failed");
> 			free(buf);
> 			exit(EXIT_FAILURE);
> 		}
> 		if (madvise(buf, TEST_SIZE, MADV_COLD) == -1) {
> 			perror("madvise free failed");
> 			free(buf);
> 			exit(EXIT_FAILURE);
> 		}

nit: MADV_FREE clears both young and dirty so I don't think MADV_COLD is
required? (MADV_COLD only clears young I think?)

> 	}
> 	void set_one_young(char *buf)
> 	{
> 		for (size_t i = 0; i < TEST_SIZE; i += CONT_PTES * PAGE_SIZE) {
> 			volatile char c = buf[i + YOUNG_BIT * PAGE_SIZE];
> 		}
> 	}
> 
> 	void test_contpte_perf() {
> 		char *buf;
> 		int ret = posix_memalign((void **)&buf, CONT_PTES * PAGE_SIZE,
> 				TEST_SIZE);
> 		if ((ret != 0) || ((unsigned long)buf % CONT_PTES * PAGE_SIZE)) {
> 			perror("posix_memalign failed");
> 			exit(EXIT_FAILURE);
> 		}
> 
> 		rwdata(buf);
> 	#if TEST_CASE2 || TEST_CASE3
> 		clear_young_dirty(buf);
> 	#endif
> 	#if TEST_CASE2
> 		set_one_young(buf);
> 	#endif
> 
> 		for (int j = 0; j < 500; j++) {
> 			mlock(buf, TEST_SIZE);
> 
> 			munlock(buf, TEST_SIZE);
> 		}
> 		free(buf);
> 	}
> 
> 	Descriptions of three test scenarios
> 
> Scenario 1
> 	The data of all 16 PTEs are both dirty and young.
> 	#define TEST_CASE2 0
> 	#define TEST_CASE3 0
> 
> Scenario 2
> 	Among the 16 PTEs, only the 8th one is young, and there are no dirty ones.
> 	#define TEST_CASE2 1
> 	#define TEST_CASE3 0
> 
> Scenario 3
> 	Among the 16 PTEs, there are neither young nor dirty ones.
> 	#define TEST_CASE2 0
> 	#define TEST_CASE3 1
> 
> Test results
> 
> |Scenario 1         |       Original|       Optimized|
> |-------------------|---------------|----------------|
> |instructions       |    37912436160|     18731580031|
> |test time          |         4.2797|          2.2949|
> |overhead of        |               |                |
> |contpte_ptep_get() |         21.31%|           4.80%|
> 
> |Scenario 2         |       Original|       Optimized|
> |-------------------|---------------|----------------|
> |instructions       |    36701270862|     36115790086|
> |test time          |         3.2335|          3.0874|
> |Overhead of        |               |                |
> |contpte_ptep_get() |         32.26%|          33.57%|
> 
> |Scenario 3         |       Original|       Optimized|
> |-------------------|---------------|----------------|
> |instructions       |    36706279735|     36750881878|
> |test time          |         3.2008|          3.1249|
> |Overhead of        |               |                |
> |contpte_ptep_get() |         31.94%|          34.59%|
> 
> For Scenario 1, optimized code can achieve an instruction benefit of 50.59%
> and a time benefit of 46.38%.
> For Scenario 2, optimized code can achieve an instruction count benefit of
> 1.6% and a time benefit of 4.5%.
> For Scenario 3, since all the PTEs have neither the young nor the dirty
> flag, the branches taken by optimized code should be the same as those of
> the original code. In fact, the test results of optimized code seem to be
> closer to those of the original code.

I re-ran these tests on Apple M2 with 4K base pages + 64K mTHP.

Scenario 1: reduced to 56% of baseline execution time
Scenario 2: reduced to 89% of baseline execution time
Scenario 3: reduced to 91% of baseline execution time

I'm pretty amazed that scenario 3 got faster given it is doing the same number
of loops.

> 
> It can be proven through test function that the optimization for
> contpte_ptep_get is effective. Since the logic of contpte_ptep_get_lockless
> is similar to that of contpte_ptep_get, the same optimization scheme is
> also adopted for it.
> 
> Reviewed-by: Barry Song <baohua@kernel.org>
> Signed-off-by: Xavier Xia <xavier_qy@163.com>

I don't love the extra complexity, but this version is much tidier. While the
micro-benchmark is clearly contrived, it shows that there will be cases where it
will be faster and there are no cases where it is slower. This will probably be
more valuable for 16K kernels because the number of PTEs in a contpte block is
128 there:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Tested-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
> Changes in v6:
> - Move prot = pte_pgprot(pte_mkold(pte_mkclean(pte))) into the contpte_is_consistent(),
>   as suggested by Barry.
> - Link to v5: https://lore.kernel.org/all/20250509122728.2379466-1-xavier_qy@163.com/
> 
> Changes in v5:
> - Replace macro CHECK_CONTPTE_CONSISTENCY with inline function contpte_is_consistent
>   for improved readability and clarity, as suggested by Barry.
> - Link to v4: https://lore.kernel.org/all/20250508070353.2370826-1-xavier_qy@163.com/
> 
> Changes in v4:
> - Convert macro CHECK_CONTPTE_FLAG to an internal loop for better readability.
> - Refactor contpte_ptep_get_lockless using the same optimization logic, as suggested by Ryan.
> - Link to v3: https://lore.kernel.org/all/3d338f91.8c71.1965cd8b1b8.Coremail.xavier_qy@163.com/
> ---
>  arch/arm64/mm/contpte.c | 74 +++++++++++++++++++++++++++++++++++------
>  1 file changed, 64 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index bcac4f55f9c1..71efe7dff0ad 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -169,17 +169,46 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>  	for (i = 0; i < CONT_PTES; i++, ptep++) {
>  		pte = __ptep_get(ptep);
>  
> -		if (pte_dirty(pte))
> +		if (pte_dirty(pte)) {
>  			orig_pte = pte_mkdirty(orig_pte);
> -
> -		if (pte_young(pte))
> +			for (; i < CONT_PTES; i++, ptep++) {
> +				pte = __ptep_get(ptep);
> +				if (pte_young(pte)) {
> +					orig_pte = pte_mkyoung(orig_pte);
> +					break;
> +				}
> +			}
> +			break;
> +		}
> +
> +		if (pte_young(pte)) {
>  			orig_pte = pte_mkyoung(orig_pte);
> +			i++;
> +			ptep++;
> +			for (; i < CONT_PTES; i++, ptep++) {
> +				pte = __ptep_get(ptep);
> +				if (pte_dirty(pte)) {
> +					orig_pte = pte_mkdirty(orig_pte);
> +					break;
> +				}
> +			}
> +			break;
> +		}
>  	}
>  
>  	return orig_pte;
>  }
>  EXPORT_SYMBOL_GPL(contpte_ptep_get);
>  
> +static inline bool contpte_is_consistent(pte_t pte, unsigned long pfn,
> +					pgprot_t orig_prot)
> +{
> +	pgprot_t prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
> +
> +	return pte_valid_cont(pte) && pte_pfn(pte) == pfn &&
> +			pgprot_val(prot) == pgprot_val(orig_prot);
> +}
> +
>  pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
>  {
>  	/*
> @@ -202,7 +231,6 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
>  	pgprot_t orig_prot;
>  	unsigned long pfn;
>  	pte_t orig_pte;
> -	pgprot_t prot;
>  	pte_t *ptep;
>  	pte_t pte;
>  	int i;
> @@ -219,18 +247,44 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
>  
>  	for (i = 0; i < CONT_PTES; i++, ptep++, pfn++) {
>  		pte = __ptep_get(ptep);
> -		prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
>  
> -		if (!pte_valid_cont(pte) ||
> -		   pte_pfn(pte) != pfn ||
> -		   pgprot_val(prot) != pgprot_val(orig_prot))
> +		if (!contpte_is_consistent(pte, pfn, orig_prot))
>  			goto retry;
>  
> -		if (pte_dirty(pte))
> +		if (pte_dirty(pte)) {
>  			orig_pte = pte_mkdirty(orig_pte);
> +			for (; i < CONT_PTES; i++, ptep++, pfn++) {
> +				pte = __ptep_get(ptep);
> +
> +				if (!contpte_is_consistent(pte, pfn, orig_prot))
> +					goto retry;
> +
> +				if (pte_young(pte)) {
> +					orig_pte = pte_mkyoung(orig_pte);
> +					break;
> +				}
> +			}
> +			break;

I considered for a while whether it is safe for contpte_ptep_get_lockless() to
exit early having not seen every PTE in the contpte block and confirmed that
they are all consistent. I eventually concluded that it is, as long as all the
PTEs that it does check are consistent I believe this is fine.

> +		}
>  
> -		if (pte_young(pte))
> +		if (pte_young(pte)) {
>  			orig_pte = pte_mkyoung(orig_pte);
> +			i++;
> +			ptep++;
> +			pfn++;
> +			for (; i < CONT_PTES; i++, ptep++, pfn++) {
> +				pte = __ptep_get(ptep);
> +
> +				if (!contpte_is_consistent(pte, pfn, orig_prot))
> +					goto retry;
> +
> +				if (pte_dirty(pte)) {
> +					orig_pte = pte_mkdirty(orig_pte);
> +					break;
> +				}
> +			}
> +			break;
> +		}
>  	}
>  
>  	return orig_pte;

