Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBE92877F9
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843775; cv=none; b=Uaq389SsjIWLt6AjKscfEFkdrPBB/kWkhzNrLdjk5nr3oso8iON4aHCaVaBR876aRxZJGwwqCBGDRYG8C6IKO+XaIyGTdll6xFLwzQKx5PclTJhiz2a67LLV+sdEojyXGXpEVV58IwbIoLw7pVPG0W+N0XUWZzJjLf3U7pEgJQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843775; c=relaxed/simple;
	bh=bh2roadnC8OnepH/S+46D6k7MIgXg7gYhiZQFo2MUOc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cUShE6XOHpUKXvdJ14k9f+2EK4gfRPFfEJe62S6SJpk15ne/ZVgO7g+TIPIeM2566tgTATooCYoorgJh+Jc7LlyIzJY1QurcSPTCJyaG1skMCjgVXfhdJ1tmKc9HIciqIZo9cIUrgZqR53Xwe05czWFRzKeWuUBCS6h9lcB7jFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QfWaEPgL; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QfWaEPgL"
Message-ID: <87f7a9fa-d66e-47ba-b511-a8ffb7e5e057@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750843769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5+hfwvWC996r2MUYJpb8A4wnft6Q/V6aycecydJia7U=;
	b=QfWaEPgLZqoluDZbnVOQJdlxb4l2AandwHyP8Yk+Wte6nX7+dMyPVvU1BClhpV3r9u2Sc0
	DlxnnH3UZzTG8Vfv/zt1HhMMHicBQEj++Pi1SPk+EZyWL7x9PfMYuYwO+urQViqTihPKqk
	g+4Fksb2sqRasmtmBRhkskN9SiZZiMk=
Date: Wed, 25 Jun 2025 17:29:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
To: David Hildenbrand <david@redhat.com>
Cc: 21cnbao@gmail.com, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
References: <a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com>
 <20250624152654.38145-1-ioworker0@gmail.com>
 <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <bf9e4e2b-0c85-437a-880a-8ca6659c74e1@linux.dev>
In-Reply-To: <bf9e4e2b-0c85-437a-880a-8ca6659c74e1@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/25 16:44, Lance Yang wrote:
> 
> 
> On 2025/6/24 23:34, David Hildenbrand wrote:
>> On 24.06.25 17:26, Lance Yang wrote:
>>> On 2025/6/24 20:55, David Hildenbrand wrote:
>>>> On 14.02.25 10:30, Barry Song wrote:
>>>>> From: Barry Song <v-songbaohua@oppo.com>
>>> [...]
>>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>>> index 89e51a7a9509..8786704bd466 100644
>>>>> --- a/mm/rmap.c
>>>>> +++ b/mm/rmap.c
>>>>> @@ -1781,6 +1781,25 @@ void folio_remove_rmap_pud(struct folio *folio,
>>>>> struct page *page,
>>>>>    #endif
>>>>>    }
>>>>> +/* We support batch unmapping of PTEs for lazyfree large folios */
>>>>> +static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>>>>> +            struct folio *folio, pte_t *ptep)
>>>>> +{
>>>>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>>> +    int max_nr = folio_nr_pages(folio);
>>>>
>>>> Let's assume we have the first page of a folio mapped at the last page
>>>> table entry in our page table.
>>>
>>> Good point. I'm curious if it is something we've seen in practice ;)
>>
>> I challenge you to write a reproducer :P I assume it might be doable 
>> through simple mremap().
> 
> Yes! The scenario is indeed reproducible from userspace ;p
> 
> First, I get a 64KB folio by allocating a large anonymous mapping and
> advising the kernel with madvise(MADV_HUGEPAGE). After faulting in the
> pages, /proc/self/pagemap confirms the PFNs are contiguous.
> 
> Then, the key is to use mremap() with MREMAP_FIXED to move the folio to
> a virtual address that crosses a PMD boundary. Doing so ensures the
> physically contiguous folio is mapped by PTEs from two different page
> tables.

Forgot to add:

The mTHP split counters didn't change during the mremap, which confirms
the large folio was only remapped, not split.

Thanks,
Lance

> 
> The C reproducer is attached. It was tested on a system with 64KB mTHP
> enabled (in madvise mode). Please correct me if I'm wrong ;)
> 
> 
> ```
> #define _GNU_SOURCE
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> #include <stdint.h>
> #include <unistd.h>
> #include <fcntl.h>
> #include <errno.h>
> #include <sys/mman.h>
> #include <stdbool.h>
> 
> #define PAGE_SIZE ((size_t)sysconf(_SC_PAGESIZE))
> #define FOLIO_SIZE (64 * 1024)
> #define NUM_PAGES_IN_FOLIO (FOLIO_SIZE / PAGE_SIZE)
> #define PMD_SIZE (2 * 1024 * 1024)
> 
> int get_pagemap_entry(uint64_t *entry, int pagemap_fd, uintptr_t vaddr) {
>      size_t offset = (vaddr / PAGE_SIZE) * sizeof(uint64_t);
>      if (pread(pagemap_fd, entry, sizeof(uint64_t), offset) != 
> sizeof(uint64_t)) {
>          perror("pread pagemap");
>          return -1;
>      }
>      return 0;
> }
> 
> int is_page_present(uint64_t entry) { return (entry >> 63) & 1; }
> uint64_t get_pfn(uint64_t entry) { return entry & ((1ULL << 55) - 1); }
> 
> bool verify_contiguity(int pagemap_fd, uintptr_t vaddr, size_t size, 
> const char *label) {
>      printf("\n--- Verifying Contiguity for: %s at 0x%lx ---\n", label, 
> vaddr);
>      printf("Page |      Virtual Address      | Present |   PFN 
> (Physical)   | Contiguous?\n");
> 
> printf("-----+---------------------------+---------+-------------------- 
> +-------------\n");
> 
>      uint64_t first_pfn = 0;
>      bool is_contiguous = true;
>      int num_pages = size / PAGE_SIZE;
> 
>      for (int i = 0; i < num_pages; ++i) {
>          uintptr_t current_vaddr = vaddr + i * PAGE_SIZE;
>          uint64_t pagemap_entry;
> 
>          if (get_pagemap_entry(&pagemap_entry, pagemap_fd, 
> current_vaddr) != 0) {
>              is_contiguous = false;
>              break;
>          }
> 
>          if (!is_page_present(pagemap_entry)) {
>              printf(" %2d  | 0x%016lx |    No   |        N/A         | 
> Error\n", i, current_vaddr);
>              is_contiguous = false;
>              continue;
>          }
> 
>          uint64_t pfn = get_pfn(pagemap_entry);
>          char contiguous_str[4] = "Yes";
> 
>          if (i == 0) {
>              first_pfn = pfn;
>          } else {
>              if (pfn != first_pfn + i) {
>                  strcpy(contiguous_str, "No!");
>                  is_contiguous = false;
>              }
>          }
> 
>          printf(" %2d  | 0x%016lx |   Yes   | 0x%-16lx |     %s\n", i, 
> current_vaddr, pfn, contiguous_str);
>      }
> 
>      if (is_contiguous) {
>          printf("Verification PASSED: PFNs are contiguous for %s.\n", 
> label);
>      } else {
>          printf("Verification FAILED: PFNs are NOT contiguous for %s. 
> \n", label);
>      }
>      return is_contiguous;
> }
> 
> 
> int main(void) {
>      printf("--- Folio-across-PMD-boundary reproducer ---\n");
>      printf("Page size: %zu KB, Folio size: %zu KB, PMD coverage: %zu 
> MB\n",
>             PAGE_SIZE / 1024, FOLIO_SIZE / 1024, PMD_SIZE / (1024 * 1024));
> 
>      size_t source_size = 4 * 1024 * 1024;
>      void *source_addr = mmap(NULL, source_size, PROT_READ | PROT_WRITE,
>                               MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>      if (source_addr == MAP_FAILED) {
>          perror("mmap source"); exit(EXIT_FAILURE);
>      }
>      printf("\n1. Source memory mapped at: %p\n", source_addr);
> 
>      if (madvise(source_addr, source_size, MADV_HUGEPAGE) != 0) {
>          perror("madvise MADV_HUGEPAGE");
>      }
>      printf("2. Advised kernel to use large folios (MADV_HUGEPAGE).\n");
> 
>      memset(source_addr, 'A', source_size);
>      printf("3. Faulted in source pages.\n");
> 
>      int pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
>      if (pagemap_fd < 0) {
>          perror("open /proc/self/pagemap");
>          exit(EXIT_FAILURE);
>      }
> 
>      if (!verify_contiguity(pagemap_fd, (uintptr_t)source_addr, 
> FOLIO_SIZE, "Source Address (pre-mremap)")) {
>          fprintf(stderr, "\nInitial folio allocation failed. Cannot 
> proceed.\n");
>          close(pagemap_fd);
>          munmap(source_addr, source_size);
>          exit(EXIT_FAILURE);
>      }
> 
>      uintptr_t search_base = 0x10000000000UL;
>      uintptr_t pmd_boundary = (search_base + PMD_SIZE) & ~(PMD_SIZE - 1);
>      uintptr_t target_vaddr = pmd_boundary - PAGE_SIZE;
>      printf("\n5. Calculated target address to be 0x%lx\n", target_vaddr);
> 
>      munmap((void *)target_vaddr, FOLIO_SIZE);
>      void *new_addr = mremap(source_addr, FOLIO_SIZE, FOLIO_SIZE, 
> MREMAP_MAYMOVE | MREMAP_FIXED, (void *)target_vaddr);
>      if (new_addr == MAP_FAILED) {
>          perror("mremap");
>          close(pagemap_fd);
>          exit(EXIT_FAILURE);
>      }
>      printf("6. Successfully mremap'd %zu KB to 0x%lx.\n", FOLIO_SIZE / 
> 1024, (uintptr_t)new_addr);
> 
>      bool final_success = verify_contiguity(pagemap_fd, 
> (uintptr_t)new_addr, FOLIO_SIZE, "Target Address (post-mremap)");
> 
>      printf("\n--- Final Conclusion ---\n");
>      if (final_success) {
>          printf("✅ SUCCESS: The folio's pages remained physically 
> contiguous after remapping to a PMD-crossing virtual address.\n");
>          printf("   The reproducer successfully created the desired 
> edge-case memory layout.\n");
>      } else {
>          printf("❌ UNEXPECTED FAILURE: The pages were not contiguous 
> after mremap.\n");
>      }
> 
>      close(pagemap_fd);
>      munmap(new_addr, FOLIO_SIZE);
> 
>      return 0;
> }
> ```
> 
> $ a.out
> 
> ```
> --- Folio-across-PMD-boundary reproducer ---
> Page size: 4 KB, Folio size: 64 KB, PMD coverage: 2 MB
> 
> 1. Source memory mapped at: 0x7f2e41200000
> 2. Advised kernel to use large folios (MADV_HUGEPAGE).
> 3. Faulted in source pages.
> 
> --- Verifying Contiguity for: Source Address (pre-mremap) at 
> 0x7f2e41200000 ---
> Page |      Virtual Address      | Present |   PFN (Physical)   | 
> Contiguous?
> -----+---------------------------+---------+-------------------- 
> +-------------
>    0  | 0x00007f2e41200000 |   Yes   | 0x113aa0           |     Yes
>    1  | 0x00007f2e41201000 |   Yes   | 0x113aa1           |     Yes
>    2  | 0x00007f2e41202000 |   Yes   | 0x113aa2           |     Yes
>    3  | 0x00007f2e41203000 |   Yes   | 0x113aa3           |     Yes
>    4  | 0x00007f2e41204000 |   Yes   | 0x113aa4           |     Yes
>    5  | 0x00007f2e41205000 |   Yes   | 0x113aa5           |     Yes
>    6  | 0x00007f2e41206000 |   Yes   | 0x113aa6           |     Yes
>    7  | 0x00007f2e41207000 |   Yes   | 0x113aa7           |     Yes
>    8  | 0x00007f2e41208000 |   Yes   | 0x113aa8           |     Yes
>    9  | 0x00007f2e41209000 |   Yes   | 0x113aa9           |     Yes
>   10  | 0x00007f2e4120a000 |   Yes   | 0x113aaa           |     Yes
>   11  | 0x00007f2e4120b000 |   Yes   | 0x113aab           |     Yes
>   12  | 0x00007f2e4120c000 |   Yes   | 0x113aac           |     Yes
>   13  | 0x00007f2e4120d000 |   Yes   | 0x113aad           |     Yes
>   14  | 0x00007f2e4120e000 |   Yes   | 0x113aae           |     Yes
>   15  | 0x00007f2e4120f000 |   Yes   | 0x113aaf           |     Yes
> Verification PASSED: PFNs are contiguous for Source Address (pre-mremap).
> 
> 5. Calculated target address to be 0x100001ff000
> 6. Successfully mremap'd 64 KB to 0x100001ff000.
> 
> --- Verifying Contiguity for: Target Address (post-mremap) at 
> 0x100001ff000 ---
> Page |      Virtual Address      | Present |   PFN (Physical)   | 
> Contiguous?
> -----+---------------------------+---------+-------------------- 
> +-------------
>    0  | 0x00000100001ff000 |   Yes   | 0x113aa0           |     Yes
>    1  | 0x0000010000200000 |   Yes   | 0x113aa1           |     Yes
>    2  | 0x0000010000201000 |   Yes   | 0x113aa2           |     Yes
>    3  | 0x0000010000202000 |   Yes   | 0x113aa3           |     Yes
>    4  | 0x0000010000203000 |   Yes   | 0x113aa4           |     Yes
>    5  | 0x0000010000204000 |   Yes   | 0x113aa5           |     Yes
>    6  | 0x0000010000205000 |   Yes   | 0x113aa6           |     Yes
>    7  | 0x0000010000206000 |   Yes   | 0x113aa7           |     Yes
>    8  | 0x0000010000207000 |   Yes   | 0x113aa8           |     Yes
>    9  | 0x0000010000208000 |   Yes   | 0x113aa9           |     Yes
>   10  | 0x0000010000209000 |   Yes   | 0x113aaa           |     Yes
>   11  | 0x000001000020a000 |   Yes   | 0x113aab           |     Yes
>   12  | 0x000001000020b000 |   Yes   | 0x113aac           |     Yes
>   13  | 0x000001000020c000 |   Yes   | 0x113aad           |     Yes
>   14  | 0x000001000020d000 |   Yes   | 0x113aae           |     Yes
>   15  | 0x000001000020e000 |   Yes   | 0x113aaf           |     Yes
> Verification PASSED: PFNs are contiguous for Target Address (post-mremap).
> 
> --- Final Conclusion ---
> ✅ SUCCESS: The folio's pages remained physically contiguous after 
> remapping to a PMD-crossing virtual address.
>     The reproducer successfully created the desired edge-case memory 
> layout.
> ```
> Thanks,
> Lance
> 
>>
>>>
>>>>
>>>> What prevents folio_pte_batch() from reading outside the page table?
>>>
>>> Assuming such a scenario is possible, to prevent any chance of an
>>> out-of-bounds read, how about this change:
>>>
>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>> index fb63d9256f09..9aeae811a38b 100644
>>> --- a/mm/rmap.c
>>> +++ b/mm/rmap.c
>>> @@ -1852,6 +1852,25 @@ static inline bool 
>>> can_batch_unmap_folio_ptes(unsigned long addr,
>>>       const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>       int max_nr = folio_nr_pages(folio);
>>>       pte_t pte = ptep_get(ptep);
>>> +    unsigned long end_addr;
>>> +
>>> +    /*
>>> +     * To batch unmap, the entire folio's PTEs must be contiguous
>>> +     * and mapped within the same PTE page table, which corresponds to
>>> +     * a single PMD entry. Before calling folio_pte_batch(), which does
>>> +     * not perform boundary checks itself, we must verify that the
>>> +     * address range covered by the folio does not cross a PMD 
>>> boundary.
>>> +     */
>>> +    end_addr = addr + (max_nr * PAGE_SIZE) - 1;
>>> +
>>> +    /*
>>> +     * A fast way to check for a PMD boundary cross is to align both
>>> +     * the start and end addresses to the PMD boundary and see if they
>>> +     * are different. If they are, the range spans across at least two
>>> +     * different PMD-managed regions.
>>> +     */
>>> +    if ((addr & PMD_MASK) != (end_addr & PMD_MASK))
>>> +        return false;
>>
>> You should not be messing with max_nr = folio_nr_pages(folio) here at 
>> all. folio_pte_batch() takes care of that.
>>
>> Also, way too many comments ;)
>>
>> You may only batch within a single VMA and within a single page table.
>>
>> So simply align the addr up to the next PMD, and make sure it does not 
>> exceed the vma end.
>>
>> ALIGN and friends can help avoiding excessive comments.
>>
> 

