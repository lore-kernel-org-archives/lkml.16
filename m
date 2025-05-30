Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE3F13A244
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748596050; cv=none; b=cLEYfclYVuapPg2zHA+EawxZVX4FRkkqTaDuwpGB2nNHXskZXyfG/pR59zc7S9KBK1PZr15lqeknsEOlJlsehl05yQENnJgTQE98n2/9MP5RQYuKeiypI5D72jcnpPb4Bh2hFdOxl0SNqzwJth6chapYSlA3GTH3XM2PJjgWccU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748596050; c=relaxed/simple;
	bh=GuRI26xNCcNPO1aRKK1gzVgzkDvatC1ZjerHF3sx7CU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ljGtLbQLANdAQeKSGbslfM4SjyB2611Fy0Syi7qQRwbLsxeZ+EJm9wC77shOOJHXnepfzk44BnwztXNFtj1F8qZqINGW2LSExl++PKhBW1dAhd3gbVkhZ/2+On/kzWjb8NIaZdlG507tSiPagT3iv+XSwwPcROvfOFwKsNr6eWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63F6F16F2;
	Fri, 30 May 2025 02:07:11 -0700 (PDT)
Received: from [10.164.18.46] (a077893.blr.arm.com [10.164.18.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AC7B3F5A1;
	Fri, 30 May 2025 02:07:24 -0700 (PDT)
Message-ID: <9b605943-cac0-447f-9cd0-286a45a937c4@arm.com>
Date: Fri, 30 May 2025 14:37:20 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Enable vmalloc-huge with ptdump
To: Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 catalin.marinas@arm.com, will@kernel.org
Cc: quic_zhenhuah@quicinc.com, kevin.brodsky@arm.com,
 yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250530082021.18182-1-dev.jain@arm.com>
 <d2b63b97-232e-4d2e-816b-71fd5b0ffcfa@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <d2b63b97-232e-4d2e-816b-71fd5b0ffcfa@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/30/25 14:10, Ryan Roberts wrote:
> On 30/05/2025 09:20, Dev Jain wrote:
>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>> because an intermediate table may be removed, potentially causing the
>> ptdump code to dereference an invalid address. We want to be able to
>> analyze block vs page mappings for kernel mappings with ptdump, so to
>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>> use mmap_read_lock and not write lock because we don't need to synchronize
>> between two different vm_structs; two vmalloc objects running this same
>> code path will point to different page tables, hence there is no race. 
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>  arch/arm64/include/asm/vmalloc.h | 6 ++----
>>  arch/arm64/mm/mmu.c              | 7 +++++++
>>  2 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
>> index 38fafffe699f..28b7173d8693 100644
>> --- a/arch/arm64/include/asm/vmalloc.h
>> +++ b/arch/arm64/include/asm/vmalloc.h
>> @@ -12,15 +12,13 @@ static inline bool arch_vmap_pud_supported(pgprot_t prot)
>>  	/*
>>  	 * SW table walks can't handle removal of intermediate entries.
>>  	 */
>> -	return pud_sect_supported() &&
>> -	       !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>> +	return pud_sect_supported();
>>  }
>>  
>>  #define arch_vmap_pmd_supported arch_vmap_pmd_supported
>>  static inline bool arch_vmap_pmd_supported(pgprot_t prot)
>>  {
>> -	/* See arch_vmap_pud_supported() */
>> -	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>> +	return true;
>>  }
>>  
>>  #endif
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index ea6695d53fb9..798cebd9e147 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1261,7 +1261,11 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>  	}
>>  
>>  	table = pte_offset_kernel(pmdp, addr);
>> +
>> +	/* Synchronize against ptdump_walk_pgd() */
>> +	mmap_read_lock(&init_mm);
>>  	pmd_clear(pmdp);
>> +	mmap_read_unlock(&init_mm);
> 
> So this works because ptdump_walk_pgd() takes the write_lock (which is mutually
> exclusive with any read_lock holders) for the duration of the table walk, so it
> will either consistently see the pgtables before or after this removal. It will
> never disappear during the walk, correct?

Agreed.

> 
> I guess there is a risk of this showing up as contention with other init_mm
> write_lock holders. But I expect that pmd_free_pte_page()/pud_free_pmd_page()
> are called sufficiently rarely that the risk is very small. Let's fix any perf
> problem if/when we see it.

Checking against CONFIG_PTDUMP_DEBUGFS being enabled is simple enough without much
cost. So why not make this conditional only for scenarios, where this read lock is
really required. Something like

--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1293,11 +1293,15 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
                pmd_free_pte_page(pmdp, next);
        } while (pmdp++, next += PMD_SIZE, next != end);
 
-       /* Synchronize against ptdump_walk_pgd() */
-       mmap_read_lock(&init_mm);
-       pud_clear(pudp);
-       mmap_read_unlock(&init_mm);
        __flush_tlb_kernel_pgtable(addr);
+       if (IS_ENABLED(CONFIG_PTDUMP_DEBUGFS)) {
+               /* Synchronize against ptdump_walk_pgd() */
+               mmap_read_lock(&init_mm);
+               pud_clear(pudp);
+               mmap_read_unlock(&init_mm);
+       } else {
+               pud_clear(pudp);
+       }
        pmd_free(NULL, table);
        return 1;
 }

> 
>>  	__flush_tlb_kernel_pgtable(addr);
> 
> And the tlbi doesn't need to be serialized because there is no security issue.
> The walker can be trusted to only dereference memory that it sees as it walks
> the pgtable (obviously).

Agreed.

> 
>>  	pte_free_kernel(NULL, table);
>>  	return 1;
>> @@ -1289,7 +1293,10 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>  		pmd_free_pte_page(pmdp, next);
>>  	} while (pmdp++, next += PMD_SIZE, next != end);
>>  
>> +	/* Synchronize against ptdump_walk_pgd() */
>> +	mmap_read_lock(&init_mm);
>>  	pud_clear(pudp);
>> +	mmap_read_unlock(&init_mm);
> 
> Hmm, so pud_free_pmd_page() is now going to cause us to acquire and release the
> (upto) lock 513 times (for a 4K kernel). I wonder if there is an argument for
> clearing the pud first (under the lock), then the pmds can all be cleared
> without a lock, since the walker won't be able to see the pmds once the pud is
> cleared.

Makes sense if pud_free_pmd_page() would have been the only caller but seems like
vmap_try_huge_pmd() calls pmd_free_pte_page() directly as well.

> 
> Thanks,
> Ryan
> 
>>  	__flush_tlb_kernel_pgtable(addr);
>>  	pmd_free(NULL, table);
>>  	return 1;
> 
