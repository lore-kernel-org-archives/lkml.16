Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970401EEE0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745901640; cv=none; b=qKhE6tkuKGl08/jg6urRzwrWNo0aPc/BshzSSYvrjmu0/C5AbFNUuN/3weLDXLfBP4GrNpDtZWPt3HNVMb4cGlNqoGWnnYMpIbawaPOnuTW2WBUJLzfFRgGGzYa6pT+CDu4oBdXgBmmChtnQ+kIIONt8MnfvTTO0Gcm52iN5wgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745901640; c=relaxed/simple;
	bh=tqo3K8EOZCZ80SSV7GclaBkSWb/nj7Zj5u+SzSelJGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otR/+dcFYs+U8trmcyBv5/7LlJwulqLbHNI0Wf9SHUaJYEO/w8nb/AJ+3p+/gwlyUwoqD0rmKASlo+czUoWJels7TVYGVx77OFbMiXQWLg9LtXcbFYVnv+Lc5oqnoWLhXckpiWtFt6sDDVTuqSv9Efs4DF/JU98XWlT2bQXCuRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F32A01515;
	Mon, 28 Apr 2025 21:40:30 -0700 (PDT)
Received: from [10.163.78.253] (unknown [10.163.78.253])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 460203F66E;
	Mon, 28 Apr 2025 21:40:27 -0700 (PDT)
Message-ID: <1bf29e9d-2e85-46ce-b8bf-d2ca5ec6bddd@arm.com>
Date: Tue, 29 Apr 2025 10:10:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Optimize mprotect for large folios
To: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250428120414.12101-1-dev.jain@arm.com>
 <2c70d515-f02e-477a-afc5-d3a25f6c9c0d@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <2c70d515-f02e-477a-afc5-d3a25f6c9c0d@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28/04/25 7:01 pm, Lance Yang wrote:
> I'm hitting the following compilation errors after applying this patch
> series:

Not sure why is that. I cherry-picked my commits onto 
6ebffe676fcf8d259e3fb5d5fbf1a8227f22182c and the kernel builds for me.
Let me send a v2 rebased onto this.

> 
> In file included from ./include/linux/kasan.h:37,
>                   from ./include/linux/slab.h:260,
>                   from ./include/linux/crypto.h:19,
>                   from arch/x86/kernel/asm-offsets.c:9:
> ./include/linux/pgtable.h: In function ‘modify_prot_start_ptes’:
> ./include/linux/pgtable.h:905:15: error: implicit declaration of 
> function ‘ptep_modify_prot_start’ [-Werror=implicit-function-declaration]
>    905 |         pte = ptep_modify_prot_start(vma, addr, ptep);
>        |               ^~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/pgtable.h:905:15: error: incompatible types when 
> assigning to type ‘pte_t’ from type ‘int’
> ./include/linux/pgtable.h:909:27: error: incompatible types when 
> assigning to type ‘pte_t’ from type ‘int’
>    909 |                 tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
>        |                           ^~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/pgtable.h: In function ‘modify_prot_commit_ptes’:
> ./include/linux/pgtable.h:925:17: error: implicit declaration of 
> function ‘ptep_modify_prot_commit’ [-Werror=implicit-function-declaration]
>    925 |                 ptep_modify_prot_commit(vma, addr, ptep, 
> old_pte, pte);
>        |                 ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/pgtable.h: At top level:
> ./include/linux/pgtable.h:1360:21: error: conflicting types for 
> ‘ptep_modify_prot_start’; have ‘pte_t(struct vm_area_struct *, long 
> unsigned int,  pte_t *)’
>   1360 | static inline pte_t ptep_modify_prot_start(struct 
> vm_area_struct *vma,
>        |                     ^~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/pgtable.h:905:15: note: previous implicit declaration of 
> ‘ptep_modify_prot_start’ with type ‘int()’
>    905 |         pte = ptep_modify_prot_start(vma, addr, ptep);
>        |               ^~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/pgtable.h:1371:20: warning: conflicting types for 
> ‘ptep_modify_prot_commit’; have ‘void(struct vm_area_struct *, long 
> unsigned int,  pte_t *, pte_t,  pte_t)’
>   1371 | static inline void ptep_modify_prot_commit(struct 
> vm_area_struct *vma,
>        |                    ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/pgtable.h:1371:20: error: static declaration of 
> ‘ptep_modify_prot_commit’ follows non-static declaration
> ./include/linux/pgtable.h:925:17: note: previous implicit declaration of 
> ‘ptep_modify_prot_commit’ with type ‘void(struct vm_area_struct *, long 
> unsigned int,  pte_t *, pte_t,  pte_t)’
>    925 |                 ptep_modify_prot_commit(vma, addr, ptep, 
> old_pte, pte);
>        |                 ^~~~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[2]: *** [scripts/Makefile.build:98: arch/x86/kernel/asm-offsets.s] 
> Error 1
> make[1]: *** [/home/runner/work/mm-test-robot/mm-test-robot/linux/ 
> Makefile:1280: prepare0] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> Based on:
> 
> mm-unstable b18dec6a6ad3d051dadc3c16fb838e4abddf8d3c ("mm/numa: remove 
> unnecessary local variable in alloc_node_data()")
> 
> 
> Thanks,
> Lance
> 
> 
> 
> On 2025/4/28 20:04, Dev Jain wrote:
>> This patchset optimizes the mprotect() system call for large folios
>> by PTE-batching.
>>
>> We use the following test cases to measure performance, mprotect()'ing
>> the mapped memory to read-only then read-write 40 times:
>>
>> Test case 1: Mapping 1G of memory, touching it to get PMD-THPs, then
>> pte-mapping those THPs
>> Test case 2: Mapping 1G of memory with 64K mTHPs
>> Test case 3: Mapping 1G of memory with 4K pages
>>
>> Average execution time on arm64, Apple M3:
>> Before the patchset:
>> T1: 7.9 seconds   T2: 7.9 seconds   T3: 4.2 seconds
>>
>> After the patchset:
>> T1: 2.1 seconds   T2: 2.2 seconds   T3: 4.2 seconds
>>
>> Observing T1/T2 and T3 before the patchset, we also remove the regression
>> introduced by ptep_get() on a contpte block. And, for large folios we get
>> an almost 276% performance improvement.
>>
>> Dev Jain (7):
>>    mm: Refactor code in mprotect
>>    mm: Optimize mprotect() by batch-skipping PTEs
>>    mm: Add batched versions of ptep_modify_prot_start/commit
>>    arm64: Add batched version of ptep_modify_prot_start
>>    arm64: Add batched version of ptep_modify_prot_commit
>>    mm: Batch around can_change_pte_writable()
>>    mm: Optimize mprotect() through PTE-batching
>>
>>   arch/arm64/include/asm/pgtable.h |  10 ++
>>   arch/arm64/mm/mmu.c              |  21 +++-
>>   include/linux/mm.h               |   4 +-
>>   include/linux/pgtable.h          |  42 ++++++++
>>   mm/gup.c                         |   2 +-
>>   mm/huge_memory.c                 |   4 +-
>>   mm/memory.c                      |   6 +-
>>   mm/mprotect.c                    | 163 +++++++++++++++++++++----------
>>   mm/pgtable-generic.c             |  16 ++-
>>   9 files changed, 198 insertions(+), 70 deletions(-)
>>
> 
> 

