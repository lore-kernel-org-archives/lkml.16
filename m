Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1AA14D428
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745847127; cv=none; b=PTe27g92t/fJ0RFIMoDSGpvmr0WMTvSxZgGXhUtgaROJJh6wmzBWJIRh+e1imz6kVYKY7IX18wiv8NkzaJfrW/njo9dSAMvUPlMt5YkMecpaoigruOcgA/SfoDV0nJOWqjc0Q2qjeKBxyIXDfglSflek2m+i8iZLcLHXICjqC90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745847127; c=relaxed/simple;
	bh=nc8yTK5dhGO8d5YTqBVW17EzO8s7NYoklwiD8kavJa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aofDQ7LMwNae7sN0zPIcNcV8gzL7YK1DvJ8aHF8BWK8BxYYlWpxTXbcg2Wiaq6xT7wvjmKuodbJytM4661JngFAGBHsskDHgcfkQyimbBaGQY5W5JsMGHjViqcW8Vh7xemT//8uj5aBrur/aUH4K2logaqM4MR6ZSuxbRi13Cng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Lf9J4TLd; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Lf9J4TLd"
Message-ID: <2c70d515-f02e-477a-afc5-d3a25f6c9c0d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745847120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1I1m/NMRedzmoEPaCinaZP4GnU/mr3udTbmFVWL9GKc=;
	b=Lf9J4TLdsEL7qv8tRkyxqwiS2Mw9EzoicQ9mUKrPz/9krGq7uE4l+FoLo/dfhvmzEJc7fM
	QtCdib57F8JZyzFQz9LA46XNFAA9ff00znw8ix8cwaIvQEZ9a98oRTz79TZeqPNdii253h
	UhnJw+hpU0rcz3+blGmfL5Wg0DM6Tyg=
Date: Mon, 28 Apr 2025 21:31:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/7] Optimize mprotect for large folios
Content-Language: en-US
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
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
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20250428120414.12101-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

I'm hitting the following compilation errors after applying this patch
series:

In file included from ./include/linux/kasan.h:37,
                  from ./include/linux/slab.h:260,
                  from ./include/linux/crypto.h:19,
                  from arch/x86/kernel/asm-offsets.c:9:
./include/linux/pgtable.h: In function ‘modify_prot_start_ptes’:
./include/linux/pgtable.h:905:15: error: implicit declaration of 
function ‘ptep_modify_prot_start’ [-Werror=implicit-function-declaration]
   905 |         pte = ptep_modify_prot_start(vma, addr, ptep);
       |               ^~~~~~~~~~~~~~~~~~~~~~
./include/linux/pgtable.h:905:15: error: incompatible types when 
assigning to type ‘pte_t’ from type ‘int’
./include/linux/pgtable.h:909:27: error: incompatible types when 
assigning to type ‘pte_t’ from type ‘int’
   909 |                 tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
       |                           ^~~~~~~~~~~~~~~~~~~~~~
./include/linux/pgtable.h: In function ‘modify_prot_commit_ptes’:
./include/linux/pgtable.h:925:17: error: implicit declaration of 
function ‘ptep_modify_prot_commit’ [-Werror=implicit-function-declaration]
   925 |                 ptep_modify_prot_commit(vma, addr, ptep, 
old_pte, pte);
       |                 ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/pgtable.h: At top level:
./include/linux/pgtable.h:1360:21: error: conflicting types for 
‘ptep_modify_prot_start’; have ‘pte_t(struct vm_area_struct *, long 
unsigned int,  pte_t *)’
  1360 | static inline pte_t ptep_modify_prot_start(struct 
vm_area_struct *vma,
       |                     ^~~~~~~~~~~~~~~~~~~~~~
./include/linux/pgtable.h:905:15: note: previous implicit declaration of 
‘ptep_modify_prot_start’ with type ‘int()’
   905 |         pte = ptep_modify_prot_start(vma, addr, ptep);
       |               ^~~~~~~~~~~~~~~~~~~~~~
./include/linux/pgtable.h:1371:20: warning: conflicting types for 
‘ptep_modify_prot_commit’; have ‘void(struct vm_area_struct *, long 
unsigned int,  pte_t *, pte_t,  pte_t)’
  1371 | static inline void ptep_modify_prot_commit(struct 
vm_area_struct *vma,
       |                    ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/pgtable.h:1371:20: error: static declaration of 
‘ptep_modify_prot_commit’ follows non-static declaration
./include/linux/pgtable.h:925:17: note: previous implicit declaration of 
‘ptep_modify_prot_commit’ with type ‘void(struct vm_area_struct *, long 
unsigned int,  pte_t *, pte_t,  pte_t)’
   925 |                 ptep_modify_prot_commit(vma, addr, ptep, 
old_pte, pte);
       |                 ^~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[2]: *** [scripts/Makefile.build:98: arch/x86/kernel/asm-offsets.s] 
Error 1
make[1]: *** 
[/home/runner/work/mm-test-robot/mm-test-robot/linux/Makefile:1280: 
prepare0] Error 2
make: *** [Makefile:248: __sub-make] Error 2

Based on:

mm-unstable b18dec6a6ad3d051dadc3c16fb838e4abddf8d3c ("mm/numa: remove 
unnecessary local variable in alloc_node_data()")


Thanks,
Lance



On 2025/4/28 20:04, Dev Jain wrote:
> This patchset optimizes the mprotect() system call for large folios
> by PTE-batching.
> 
> We use the following test cases to measure performance, mprotect()'ing
> the mapped memory to read-only then read-write 40 times:
> 
> Test case 1: Mapping 1G of memory, touching it to get PMD-THPs, then
> pte-mapping those THPs
> Test case 2: Mapping 1G of memory with 64K mTHPs
> Test case 3: Mapping 1G of memory with 4K pages
> 
> Average execution time on arm64, Apple M3:
> Before the patchset:
> T1: 7.9 seconds   T2: 7.9 seconds   T3: 4.2 seconds
> 
> After the patchset:
> T1: 2.1 seconds   T2: 2.2 seconds   T3: 4.2 seconds
> 
> Observing T1/T2 and T3 before the patchset, we also remove the regression
> introduced by ptep_get() on a contpte block. And, for large folios we get
> an almost 276% performance improvement.
> 
> Dev Jain (7):
>    mm: Refactor code in mprotect
>    mm: Optimize mprotect() by batch-skipping PTEs
>    mm: Add batched versions of ptep_modify_prot_start/commit
>    arm64: Add batched version of ptep_modify_prot_start
>    arm64: Add batched version of ptep_modify_prot_commit
>    mm: Batch around can_change_pte_writable()
>    mm: Optimize mprotect() through PTE-batching
> 
>   arch/arm64/include/asm/pgtable.h |  10 ++
>   arch/arm64/mm/mmu.c              |  21 +++-
>   include/linux/mm.h               |   4 +-
>   include/linux/pgtable.h          |  42 ++++++++
>   mm/gup.c                         |   2 +-
>   mm/huge_memory.c                 |   4 +-
>   mm/memory.c                      |   6 +-
>   mm/mprotect.c                    | 163 +++++++++++++++++++++----------
>   mm/pgtable-generic.c             |  16 ++-
>   9 files changed, 198 insertions(+), 70 deletions(-)
> 

