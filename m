Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F4C267B88
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 05:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746768438; cv=none; b=JBuJiy4uD5pt8Wl3kuxCRkjyrR6VJPp/tL0gun8YsY95BRqft+bTICK0VNw2Xz/9dz+rsLrGH7gdkOLF5+ad063jCN/7EZeX/+PlbtarrnotzFYy28k6TYYe2FgcmpYwHqIkWkQ+yAJwkR26+tvMQfnalzjqr5gSk9CYy3dJACs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746768438; c=relaxed/simple;
	bh=OP+91uyP2eroydxY2AMrPk81AB9CmzRP+RSjQgTmsfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQ9JSNiYOrJ6lwy1g4iP6JSJBUujILNNGeyBbjYWJVUqm2rvT/IkE27pPIf8SHIE8Zk0FvjSmx7gFBd8APab9GNQ5uMpuJkIHEbdedSbo58o3S4S9rkiJTNFrJ4OM307sfARHtjnWB5oQtef/yKIsuy1G7dZbWKdU+637eIuKBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEE91153B;
	Thu,  8 May 2025 22:27:04 -0700 (PDT)
Received: from [10.162.43.14] (K4MQJ0H1H2.blr.arm.com [10.162.43.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8172C3F58B;
	Thu,  8 May 2025 22:27:08 -0700 (PDT)
Message-ID: <e258ac09-2338-49cd-a9d7-8e3be8045d8a@arm.com>
Date: Fri, 9 May 2025 10:57:05 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Optimize mremap() for large folios
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
 ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
 maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
 anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
 yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com, ziy@nvidia.com,
 hughd@google.com
References: <20250507060256.78278-1-dev.jain@arm.com>
 <3fe90c96-da4d-4240-bd58-0bed5fe7cf5f@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <3fe90c96-da4d-4240-bd58-0bed5fe7cf5f@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/05/25 12:05 am, Lorenzo Stoakes wrote:
> Dev - a general comment here - but let's slow things down a little please
> :)
> 
> The mprotect() version of this is still outstanding fixes and likely will
> need quite a bit of checking before we can ensure it's stabilised.
> 
> And now we have this mremap() series as well which also has had quite a few
> quite significant issues that have needed addressing.
> 
> So can we try to focus on one at a time, and really try to nail down the
> series before moving on to the next?
> 
> We also have outstanding review on the v1, which has now been split, which
> does happen sometimes but perhaps suggests that it'd work better if you
> waited a couple days or such to ensure things are settled before sending a
> new version when there's quite a bit of feedback?

Sure, I should have waited my bad, I usually do, this time I was in a 
haste with both series for no reason :( thanks for your detailed replies 
btw!

> 
> This isn't a criticism really, sorry I don't mean to sound negative or such
> - but this is more a process thing so we reviewers can keep up with things,
> keep things rolling, and ensure you get your changes merged asap :)
> 
> Thanks, Lorenzo
> 
> On Wed, May 07, 2025 at 11:32:54AM +0530, Dev Jain wrote:
>> Currently move_ptes() iterates through ptes one by one. If the underlying
>> folio mapped by the ptes is large, we can process those ptes in a batch
>> using folio_pte_batch(), thus clearing and setting the PTEs in one go.
>> For arm64 specifically, this results in a 16x reduction in the number of
>> ptep_get() calls (since on a contig block, ptep_get() on arm64 will iterate
>> through all 16 entries to collect a/d bits), and we also elide extra TLBIs
>> through get_and_clear_full_ptes, replacing ptep_get_and_clear.
>>
>> Mapping 512K of memory, memsetting it, remapping it to src + 512K, and
>> munmapping it 10,000 times, the average execution time reduces from 1.9 to
>> 1.2 seconds, giving a 37% performance optimization, on Apple M3 (arm64).
>>
>> Test program for reference:
>>
>> #define _GNU_SOURCE
>> #include <stdio.h>
>> #include <stdlib.h>
>> #include <unistd.h>
>> #include <sys/mman.h>
>> #include <string.h>
>> #include <errno.h>
>>
>> #define SIZE (1UL << 20) // 512 KB
>>
>> int main(void) {
>>      void *new_addr, *addr;
>>
>>      for (int i = 0; i < 10000; ++i) {
>>          addr = mmap((void *)(1UL << 30), SIZE, PROT_READ | PROT_WRITE,
>>                      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>>          if (addr == MAP_FAILED) {
>>                  perror("mmap");
>>                  return 1;
>>          }
>>          memset(addr, 0xAA, SIZE);
>>
>>          new_addr = mremap(addr, SIZE, SIZE, MREMAP_MAYMOVE | MREMAP_FIXED, addr + SIZE);
>>          if (new_addr != (addr + SIZE)) {
>>                  perror("mremap");
>>                  return 1;
>>          }
>>          munmap(new_addr, SIZE);
>>      }
>>
>> }
>>
>> v1->v2:
>>   - Expand patch descriptions, move pte declarations to a new line,
>>     reduce indentation in patch 2 by introducing mremap_folio_pte_batch(),
>>     fix loop iteration (Lorenzo)
>>   - Merge patch 2 and 3 (Anshuman, Lorenzo)
>>   - Fix maybe_contiguous_pte_pfns (Willy)
>>
>> Dev Jain (2):
>>    mm: Call pointers to ptes as ptep
>>    mm: Optimize mremap() by PTE batching
>>
>>   include/linux/pgtable.h | 29 ++++++++++++++++++++++
>>   mm/mremap.c             | 54 +++++++++++++++++++++++++++++------------
>>   2 files changed, 68 insertions(+), 15 deletions(-)
>>
>> --
>> 2.30.2
>>

