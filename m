Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659AD2116F6
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 11:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746186721; cv=none; b=YI/HT/yVTaV5oXYfMKmfANAjLcqFG4ZeqOtdv2FI+bA0aoWsQ5vgVWX5TUYcT+8aMFE/cpPczyWB4jB6Poh3Iz/rbdRp6mK4gc9SVlTvKfuoVqk2Wozi5M9fYYjo0gEj9tlb4fzU4Eqzy5bqwGLBbM6G1qhutBiMTMdhYKefdxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746186721; c=relaxed/simple;
	bh=hVNqzctfPfpGZwGZ7YOr1XZ/YVIyy4tCqdQcpZn4LJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nidYSHH5I+2EwBlttDFp4GafIHVH+qphDP+ITa1/u3O7AME3ooSKq1O+8sXXHQff3BwW9oI/aJtFm04xEimVA8/wkNrvA5uqUnGX71gUs+cCZeJweIy8NFZild3QzshV0d3CaiOp1rMct2DYhnEA7jRajL+ERjpVCEbsZRifBck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCE7A1688;
	Fri,  2 May 2025 04:51:48 -0700 (PDT)
Received: from [10.57.93.118] (unknown [10.57.93.118])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 055023F673;
	Fri,  2 May 2025 04:51:53 -0700 (PDT)
Message-ID: <912c3126-8ba7-4c3a-b168-438f92e89217@arm.com>
Date: Fri, 2 May 2025 12:51:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dev Jain <dev.jain@arm.com>
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <3750d3f8-17c6-4bb8-8107-215d442e4ec3@os.amperecomputing.com>
 <2fb974bb-1470-4a5f-90d5-97456140c98f@arm.com>
 <22b53cff-00db-48f1-b1e8-b11a54ebb147@os.amperecomputing.com>
 <4794885d-2e17-4bd8-bdf3-8ac37047e8ee@os.amperecomputing.com>
 <5c6d9706-7684-4288-b630-c60b3766b13f@arm.com>
 <4d02978c-03c0-48fe-84eb-0f3fa0c54fea@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <4d02978c-03c0-48fe-84eb-0f3fa0c54fea@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/04/2025 22:24, Yang Shi wrote:
> 
> 
> On 4/14/25 6:03 AM, Ryan Roberts wrote:
>> On 10/04/2025 23:00, Yang Shi wrote:
>>> Hi Ryan,
>>>
>>> I know you may have a lot of things to follow up after LSF/MM. Just gently ping,
>>> hopefully we can resume the review soon.
>> Hi, I'm out on holiday at the moment, returning on the 22nd April. But I'm very
>> keen to move this series forward so will come back to you next week. (although
>> TBH, I thought I was waiting for you to respond to me... :-| )
>>
>> FWIW, having thought about it a bit more, I think some of the suggestions I
>> previously made may not have been quite right, but I'll elaborate next week. I'm
>> keen to build a pgtable splitting primitive here that we can reuse with vmalloc
>> as well to enable huge mappings by default with vmalloc too.
> 
> Sounds good. I think the patches can support splitting vmalloc page table too.
> Anyway we can discuss more after you are back. Enjoy your holiday.

Hi Yang,

Sorry I've taken so long to get back to you. Here's what I'm currently thinking:
I'd eventually like to get to the point where the linear map and most vmalloc
memory is mapped using the largest possible mapping granularity (i.e. block
mappings at PUD/PMD, and contiguous mappings at PMD/PTE level).

vmalloc has history with trying to do huge mappings by default; it ended up
having to be turned into an opt-in feature (instead of the original opt-out
approach) because there were problems with some parts of the kernel expecting
page mappings. I think we might be able to overcome those issues on arm64 with
BBML2.

arm64 can already support vmalloc PUD and PMD block mappings, and I have a
series (that should make v6.16) that enables contiguous PTE mappings in vmalloc
too. But these are currently limited to when VM_ALLOW_HUGE is specified. To be
able to use that by default, we need to be able to change permissions on
sub-regions of an allocation, which is where BBML2 and your series come in.
(there may be other things we need to solve as well; TBD).

I think the key thing we need is a function that can take a page-aligned kernel
VA, will walk to the leaf entry for that VA and if the VA is in the middle of
the leaf entry, it will split it so that the VA is now on a boundary. This will
work for PUD/PMD block entries and contiguous-PMD/contiguous-PTE entries. The
function can assume BBML2 is present. And it will return 0 on success, -EINVAL
if the VA is not mapped or -ENOMEM if it couldn't allocate a pgtable to perform
the split.

Then we can use that primitive on the start and end address of any range for
which we need exact mapping boundaries (e.g. when changing permissions on part
of linear map or vmalloc allocation, when freeing part of a vmalloc allocation,
etc). This way we only split enough to ensure the boundaries are precise, and
keep larger mappings inside the range.

Next we need to reimplement __change_memory_common() to not use
apply_to_page_range(), because that assumes page mappings only. Dev Jain has
been working on a series that converts this to use walk_page_range_novma() so
that we can change permissions on the block/contig entries too. That's not
posted publicly yet, but it's not huge so I'll ask if he is comfortable with
posting an RFC early next week.

You'll still need to repaint the whole linear map with page mappings for the
case !BBML2 case, but I'm hoping __create_pgd_mapping_locked() (potentially with
minor modifications?) can do that repainting on the live mappings; similar to
how you are doing it in v3.

Miko's BBML2 series should hopefully get imminently queued for v6.16.

So in summary, what I'm asking for your large block mapping the linear map
series is:
  - Paint linear map using blocks/contig if boot CPU supports BBML2
  - Repaint linear map using page mappings if secondary CPUs don't support BBML2
  - Integrate Dev's __change_memory_common() series
  - Create primitive to ensure mapping entry boundary at a given page-aligned VA
  - Use primitive when changing permissions on linear map region

This will be mergable on its own, but will also provide a great starting base
for adding huge-vmalloc-by-default.

What do you think?

Thanks,
Ryan


> 
> Thanks,
> Yang
> 
>>
>> Thanks,
>> Ryan
>>
>>> Thanks,
>>> Yang
>>>
>>>
>>> On 3/13/25 10:40 AM, Yang Shi wrote:
>>>>
>>>> On 3/13/25 10:36 AM, Ryan Roberts wrote:
>>>>> On 13/03/2025 17:28, Yang Shi wrote:
>>>>>> Hi Ryan,
>>>>>>
>>>>>> I saw Miko posted a new spin of his patches. There are some slight changes
>>>>>> that
>>>>>> have impact to my patches (basically check the new boot parameter). Do you
>>>>>> prefer I rebase my patches on top of his new spin right now then restart
>>>>>> review
>>>>>> from the new spin or review the current patches then solve the new review
>>>>>> comments and rebase to Miko's new spin together?
>>>>> Hi Yang,
>>>>>
>>>>> Sorry I haven't got to reviewing this version yet, it's in my queue!
>>>>>
>>>>> I'm happy to review against v3 as it is. I'm familiar with Miko's series
>>>>> and am
>>>>> not too bothered about the integration with that; I think it's pretty straight
>>>>> forward. I'm more interested in how you are handling the splitting, which I
>>>>> think is the bulk of the effort.
>>>> Yeah, sure, thank you.
>>>>
>>>>> I'm hoping to get to this next week before heading out to LSF/MM the following
>>>>> week (might I see you there?)
>>>> Unfortunately I can't make it this year. Have a fun!
>>>>
>>>> Thanks,
>>>> Yang
>>>>
>>>>> Thanks,
>>>>> Ryan
>>>>>
>>>>>
>>>>>> Thanks,
>>>>>> Yang
>>>>>>
>>>>>>
>>>>>> On 3/4/25 2:19 PM, Yang Shi wrote:
>>>>>>> Changelog
>>>>>>> =========
>>>>>>> v3:
>>>>>>>      * Rebased to v6.14-rc4.
>>>>>>>      * Based on Miko's BBML2 cpufeature patch (https://lore.kernel.org/
>>>>>>> linux-
>>>>>>> arm-kernel/20250228182403.6269-3-miko.lenczewski@arm.com/).
>>>>>>>        Also included in this series in order to have the complete patchset.
>>>>>>>      * Enhanced __create_pgd_mapping() to handle split as well per Ryan.
>>>>>>>      * Supported CONT mappings per Ryan.
>>>>>>>      * Supported asymmetric system by splitting kernel linear mapping if
>>>>>>> such
>>>>>>>        system is detected per Ryan. I don't have such system to test, so the
>>>>>>>        testing is done by hacking kernel to call linear mapping repainting
>>>>>>>        unconditionally. The linear mapping doesn't have any block and cont
>>>>>>>        mappings after booting.
>>>>>>>
>>>>>>> RFC v2:
>>>>>>>      * Used allowlist to advertise BBM lv2 on the CPUs which can handle TLB
>>>>>>>        conflict gracefully per Will Deacon
>>>>>>>      * Rebased onto v6.13-rc5
>>>>>>>      * https://lore.kernel.org/linux-arm-kernel/20250103011822.1257189-1-
>>>>>>> yang@os.amperecomputing.com/
>>>>>>>
>>>>>>> RFC v1: https://lore.kernel.org/lkml/20241118181711.962576-1-
>>>>>>> yang@os.amperecomputing.com/
>>>>>>>
>>>>>>> Description
>>>>>>> ===========
>>>>>>> When rodata=full kernel linear mapping is mapped by PTE due to arm's
>>>>>>> break-before-make rule.
>>>>>>>
>>>>>>> A number of performance issues arise when the kernel linear map is using
>>>>>>> PTE entries due to arm's break-before-make rule:
>>>>>>>      - performance degradation
>>>>>>>      - more TLB pressure
>>>>>>>      - memory waste for kernel page table
>>>>>>>
>>>>>>> These issues can be avoided by specifying rodata=on the kernel command
>>>>>>> line but this disables the alias checks on page table permissions and
>>>>>>> therefore compromises security somewhat.
>>>>>>>
>>>>>>> With FEAT_BBM level 2 support it is no longer necessary to invalidate the
>>>>>>> page table entry when changing page sizes.  This allows the kernel to
>>>>>>> split large mappings after boot is complete.
>>>>>>>
>>>>>>> This patch adds support for splitting large mappings when FEAT_BBM level 2
>>>>>>> is available and rodata=full is used. This functionality will be used
>>>>>>> when modifying page permissions for individual page frames.
>>>>>>>
>>>>>>> Without FEAT_BBM level 2 we will keep the kernel linear map using PTEs
>>>>>>> only.
>>>>>>>
>>>>>>> If the system is asymmetric, the kernel linear mapping may be repainted once
>>>>>>> the BBML2 capability is finalized on all CPUs.  See patch #6 for more
>>>>>>> details.
>>>>>>>
>>>>>>> We saw significant performance increases in some benchmarks with
>>>>>>> rodata=full without compromising the security features of the kernel.
>>>>>>>
>>>>>>> Testing
>>>>>>> =======
>>>>>>> The test was done on AmpereOne machine (192 cores, 1P) with 256GB memory and
>>>>>>> 4K page size + 48 bit VA.
>>>>>>>
>>>>>>> Function test (4K/16K/64K page size)
>>>>>>>      - Kernel boot.  Kernel needs change kernel linear mapping permission at
>>>>>>>        boot stage, if the patch didn't work, kernel typically didn't boot.
>>>>>>>      - Module stress from stress-ng. Kernel module load change permission
>>>>>>> for
>>>>>>>        linear mapping.
>>>>>>>      - A test kernel module which allocates 80% of total memory via
>>>>>>> vmalloc(),
>>>>>>>        then change the vmalloc area permission to RO, this also change
>>>>>>> linear
>>>>>>>        mapping permission to RO, then change it back before vfree(). Then
>>>>>>> launch
>>>>>>>        a VM which consumes almost all physical memory.
>>>>>>>      - VM with the patchset applied in guest kernel too.
>>>>>>>      - Kernel build in VM with guest kernel which has this series applied.
>>>>>>>      - rodata=on. Make sure other rodata mode is not broken.
>>>>>>>      - Boot on the machine which doesn't support BBML2.
>>>>>>>
>>>>>>> Performance
>>>>>>> ===========
>>>>>>> Memory consumption
>>>>>>> Before:
>>>>>>> MemTotal:       258988984 kB
>>>>>>> MemFree:        254821700 kB
>>>>>>>
>>>>>>> After:
>>>>>>> MemTotal:       259505132 kB
>>>>>>> MemFree:        255410264 kB
>>>>>>>
>>>>>>> Around 500MB more memory are free to use.  The larger the machine, the
>>>>>>> more memory saved.
>>>>>>>
>>>>>>> Performance benchmarking
>>>>>>> * Memcached
>>>>>>> We saw performance degradation when running Memcached benchmark with
>>>>>>> rodata=full vs rodata=on.  Our profiling pointed to kernel TLB pressure.
>>>>>>> With this patchset we saw ops/sec is increased by around 3.5%, P99
>>>>>>> latency is reduced by around 9.6%.
>>>>>>> The gain mainly came from reduced kernel TLB misses.  The kernel TLB
>>>>>>> MPKI is reduced by 28.5%.
>>>>>>>
>>>>>>> The benchmark data is now on par with rodata=on too.
>>>>>>>
>>>>>>> * Disk encryption (dm-crypt) benchmark
>>>>>>> Ran fio benchmark with the below command on a 128G ramdisk (ext4) with disk
>>>>>>> encryption (by dm-crypt).
>>>>>>> fio --directory=/data --random_generator=lfsr --norandommap --randrepeat 1 \
>>>>>>>        --status-interval=999 --rw=write --bs=4k --loops=1 --ioengine=sync \
>>>>>>>        --iodepth=1 --numjobs=1 --fsync_on_close=1 --group_reporting --
>>>>>>> thread \
>>>>>>>        --name=iops-test-job --eta-newline=1 --size 100G
>>>>>>>
>>>>>>> The IOPS is increased by 90% - 150% (the variance is high, but the worst
>>>>>>> number of good case is around 90% more than the best number of bad case).
>>>>>>> The bandwidth is increased and the avg clat is reduced proportionally.
>>>>>>>
>>>>>>> * Sequential file read
>>>>>>> Read 100G file sequentially on XFS (xfs_io read with page cache populated).
>>>>>>> The bandwidth is increased by 150%.
>>>>>>>
>>>>>>>
>>>>>>> Mikołaj Lenczewski (1):
>>>>>>>          arm64: Add BBM Level 2 cpu feature
>>>>>>>
>>>>>>> Yang Shi (5):
>>>>>>>          arm64: cpufeature: add AmpereOne to BBML2 allow list
>>>>>>>          arm64: mm: make __create_pgd_mapping() and helpers non-void
>>>>>>>          arm64: mm: support large block mapping when rodata=full
>>>>>>>          arm64: mm: support split CONT mappings
>>>>>>>          arm64: mm: split linear mapping if BBML2 is not supported on
>>>>>>> secondary
>>>>>>> CPUs
>>>>>>>
>>>>>>>     arch/arm64/Kconfig                  |  11 +++++
>>>>>>>     arch/arm64/include/asm/cpucaps.h    |   2 +
>>>>>>>     arch/arm64/include/asm/cpufeature.h |  15 ++++++
>>>>>>>     arch/arm64/include/asm/mmu.h        |   4 ++
>>>>>>>     arch/arm64/include/asm/pgtable.h    |  12 ++++-
>>>>>>>     arch/arm64/kernel/cpufeature.c      |  95 ++++++++++++++++++++++++++++++
>>>>>>> +++++++
>>>>>>>     arch/arm64/mm/mmu.c                 | 397 ++++++++++++++++++++++++++++++
>>>>>>> ++++
>>>>>>> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>> +++++
>>>>>>> ++++++++++++++++++++++-------------------
>>>>>>>     arch/arm64/mm/pageattr.c            |  37 ++++++++++++---
>>>>>>>     arch/arm64/tools/cpucaps            |   1 +
>>>>>>>     9 files changed, 518 insertions(+), 56 deletions(-)
>>>>>>>
>>>>>>>
> 

