Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7C826A0C7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745844733; cv=none; b=Ad9Zkqxrtj1jAG3FAyPCIpctDf0VRR62D3GkKcpfZMQfBfsA3EINgBiHGDTQwXYPanXDL0X7u22RvSqC+bK1K5Tq70S8oyLPf3AYbZxjp0KIih1m1N8Id0EHJ9C1I9PZCsmqR9MYVD+cULAffTtaHmblyNO/SCcH1KmI8W6CY4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745844733; c=relaxed/simple;
	bh=tS9gBtlQAJ+wmgXscJ7SZZqo4CjovXoIb4pNEH4cLhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZ9vuoltSofCiTf/6kJwewyMaMaYU8OboljB+scsiN7EqBLRn/FNBwSVN4h3f5NB5lzBZvNUup1zYpHWQ3ZAJIJAASbuH2w581hbvDoy0zSAEdjut2Q3uuckWRv3lzazdl7tRY+KvmZVldwMta1/ds7hOL9K+ZvUXfNudfNbkr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E44D01516;
	Mon, 28 Apr 2025 05:52:04 -0700 (PDT)
Received: from [10.163.78.210] (unknown [10.163.78.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 680863F673;
	Mon, 28 Apr 2025 05:52:03 -0700 (PDT)
Message-ID: <72b0be04-73d5-49e3-8e35-c8999e37fd58@arm.com>
Date: Mon, 28 Apr 2025 18:22:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Optimize mprotect for large folios
To: akpm@linux-foundation.org
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
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250428120414.12101-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/04/25 5:34 pm, Dev Jain wrote:
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

Messed up the denominator, I mean ((7.9 - 2.1) / 7.9) * 100 = 73%.

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

