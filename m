Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D18A22301
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745549269; cv=none; b=EFCIgtTQVnm2n9kS49+sQbZ7GybtN2yIxVgRpyvuQx+kpo7zLEj8iWl07M/EPDWKESjAoDrAElz6gqCT5VyN6F6XuoxK8VF6dk1qwe+XI5AofUvPa9SDoJzwfpx1RNt2KNrlMUp+biYBP5jNtA7fDqnVvbv3AVl798sSZ8MZiKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745549269; c=relaxed/simple;
	bh=b3EDeG/OJiHYURM6f12B1qR3ZvFT+UBlcOLiHvMArdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zzi65XxyaPtoVFL3WH0xz0iECQVmuQSccQV6CjrkCWQvwbvhJ/grTeJJz01TUdreJVwsxhZ1sWQezIbNMa+93Kk4sy+694zA3huEGBj/Rgo44kTBVVo1qIccvWJOcGJwTBFBadudQ0dcnA/s7ui1MPVHKQ5/YKzl9pcz8EcpWdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [124.127.64.69])
	by gateway (Coremail) with SMTP id _____8CxyuDI9wpoZszFAA--.480S3;
	Fri, 25 Apr 2025 10:47:36 +0800 (CST)
Received: from [192.168.196.221] (unknown [124.127.64.69])
	by front1 (Coremail) with SMTP id qMiowMDxDce89wpofHaUAA--.43251S2;
	Fri, 25 Apr 2025 10:47:26 +0800 (CST)
Message-ID: <b8fe05f1-23c2-423f-88cc-310996c6aad5@loongson.cn>
Date: Fri, 25 Apr 2025 10:47:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: LoongArch: Return NULL from huge_pte_offset()
 for none PMD
To: Peter Xu <peterx@redhat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 Hongchen Zhang <zhanghongchen@loongson.cn>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, lixuefeng@loongson.cn, gaojuxin@loongson.cn,
 chenhuacai@loongson.cn
References: <20250424083037.2226732-1-wangming01@loongson.cn>
 <aAqHkdXt50van31B@x1.local>
Content-Language: en-US
From: Ming Wang <wangming01@loongson.cn>
In-Reply-To: <aAqHkdXt50van31B@x1.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxDce89wpofHaUAA--.43251S2
X-CM-SenderInfo: 5zdqwzxlqjiio6or00hjvr0hdfq/1tbiAgEDEmgKxeYEAAAAsX
X-Coremail-Antispam: 1Uk129KBj93XoW3WrWfAryktF1xGFyfCF1UXFc_yoWxZF4DpF
	93K3sYvr1kGrykWan7tw4vqFn5Zws3Wa1UGF98GrW5AwnxX347XryUK3yaga4ru395Gw4a
	vFWjqFZrJa1jy3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Kb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20x
	vEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
	4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
	WUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
	wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
	k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j
	6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4L0eDUUUU

Hi Peter Xu,

Thanks for taking a look and raising these important points!

On 4/25/25 02:48, Peter Xu wrote:
> On Thu, Apr 24, 2025 at 04:30:37PM +0800, Ming Wang wrote:
>> LoongArch's huge_pte_offset() currently returns a pointer to a PMD slot
>> even if the underlying entry points to invalid_pte_table (indicating no
>> mapping). Callers like smaps_hugetlb_range() fetch this invalid entry
>> value (the address of invalid_pte_table) via this pointer.
> 
> So it's in smaps_hugetlb_range() context, then..
The root cause involves several steps:
1. When the hugetlbfs file is mapped (MAP_PRIVATE), the initial PMD
   (or relevant level) entry is often populated by the kernel during mmap()
   with a non-present entry pointing to the architecture's invalid_pte_table
   On the affected LoongArch system, this address was observed to
   be 0x90000000031e4000.
2. The smaps walker (walk_hugetlb_range -> smaps_hugetlb_range) reads
   this entry.
3. The generic is_swap_pte() macro checks `!pte_present() && !pte_none()`.
   The entry (invalid_pte_table address) is not present. Crucially,
   the generic pte_none() check (`!(pte_val(pte) & ~_PAGE_GLOBAL)`)
   returns false because the invalid_pte_table address is non-zero.
   Therefore, is_swap_pte() incorrectly returns true.
4. The code enters the `else if (is_swap_pte(...))` block.
5. Inside this block, it checks `is_pfn_swap_entry()`. Due to a bit
   pattern coincidence in the invalid_pte_table address on LoongArch,
   the embedded generic `is_migration_entry()` check happens to return
   true (misinterpreting parts of the address as a migration type).
6. This leads to a call to pfn_swap_entry_to_page() with the bogus
   swap entry derived from the invalid table address.
7. pfn_swap_entry_to_page() extracts a meaningless PFN, finds an
   unrelated struct page, checks its lock status (unlocked), and hits
   the `BUG_ON(is_migration_entry(entry) && !PageLocked(p))` assertion.
> 
>>
>> The generic is_swap_pte() check then incorrectly identifies this address
>> as a swap entry on LoongArch, because it satisfies the !pte_present()
>> && !pte_none() conditions. This misinterpretation, combined with a
>> coincidental match by is_migration_entry() on the address bits, leads
>> to kernel crashes in pfn_swap_entry_to_page().
> 
> .. you mentioned !pte_none() is checked.  Could you explain why it's
> pte_none() rather than huge_pte_none()?  As I saw loongarch has exactly
> this..
> 
> static inline int huge_pte_none(pte_t pte)
> {
> 	unsigned long val = pte_val(pte) & ~_PAGE_GLOBAL;
> 	return !val || (val == (unsigned long)invalid_pte_table);
> }
> 
> I'm not familiar with loongarch's invalid_pte_table, but I would expect at
> least for now in hugetlb specific paths it should be reported as none even
> without this patch.
> 
> One more thing to mention is the kernel (AFAIU) is trying to moving away
> from hugetlb specific pgtable parsing to generic pgtable walkers.  It means
> it could happen at some point where the kernel walks the hugetlb pgtables
> using normal pgtable APIs.  I'm not yet sure what would happen then, but
> maybe at some point the invalid_pte_table check is needed in pte_none() too
> for loongarch.
> 
> Thanks,

You asked why the check involves pte_none() rather than huge_pte_none(), given that LoongArch
provides the latter which correctly identifies the invalid_pte_table address.

That's a great question, and the crux seems to be in how the generic code path works. The crash
originates within smaps_hugetlb_range() after the generic `is_swap_pte(ptent)` macro returns true.
Looking at the definition of `is_swap_pte()` (in include/linux/mm.h or similar), it typically
expands to `!pte_present(pte) && !pte_none(pte)`.

Critically, even though `smaps_hugetlb_range()` deals with HugeTLB entries (often PMDs cast to pte_t),
the generic `is_swap_pte()` macro itself, when expanded, calls the **generic `pte_none()` macro**, not
the specialized `huge_pte_none()`.

LoongArch's generic `pte_none()` macro is defined as:
`#define pte_none(pte) (!(pte_val(pte) & ~_PAGE_GLOBAL))`
This definition does *not* check for the `invalid_pte_table` address and thus returns false for it, 
leading to `is_swap_pte()` incorrectly returning true.

So, while LoongArch does provide `huge_pte_none()` which *could* correctly identify the state, it's not
actually invoked in the code path triggered by `is_swap_pte()` within `smaps_hugetlb_range()`.

This is why modifying `huge_pte_offset()` seems necessary and appropriate at the architecture level.
By returning NULL when the underlying PMD entry is none (checked using the correct `pmd_none()`, which *does*
check for invalid_pte_table on LoongArch), we prevent the invalid pointer and its problematic value from reaching
`smaps_hugetlb_range()` and subsequently fooling the generic `is_swap_pte()` check that uses the generic `pte_none()`.

Regarding your point about generic page table walkers possibly needing `pte_none()` itself to handle `invalid_pte_table`
in the future – I understand the concern. That might indeed be a separate, future enhancement needed for LoongArch's
generic page table support. However, the current patch addresses the immediate crash within the existing hugetlb-specific
walker (`smaps_hugetlb_range`) by stopping the problematic value at the source (`huge_pte_offset`), which seems like a
necessary and correct fix for the present issue.

Does this explanation clarify the interaction between the generic macros and the arch-specific helpers in this context?

Thanks,
Ming
> 
>>
>> Fix this at the architecture level by modifying huge_pte_offset() to
>> check the PMD entry's content using pmd_none() before returning. If the
>> entry is none (i.e., it points to invalid_pte_table), return NULL
>> instead of the pointer to the slot.
>>
>> Co-developed-by: Hongchen Zhang <zhanghongchen@loongson.cn>
>> Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>> Signed-off-by: Ming Wang <wangming01@loongson.cn>
>> ---
>>  arch/loongarch/mm/hugetlbpage.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/loongarch/mm/hugetlbpage.c b/arch/loongarch/mm/hugetlbpage.c
>> index e4068906143b..cea84d7f2b91 100644
>> --- a/arch/loongarch/mm/hugetlbpage.c
>> +++ b/arch/loongarch/mm/hugetlbpage.c
>> @@ -47,7 +47,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr,
>>  				pmd = pmd_offset(pud, addr);
>>  		}
>>  	}
>> -	return (pte_t *) pmd;
>> +	return pmd_none(pmdp_get(pmd)) ? NULL : (pte_t *) pmd;
>>  }
>>  
>>  uint64_t pmd_to_entrylo(unsigned long pmd_val)
>> -- 
>> 2.43.0
>>
> 

