Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B961F2BAF9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744635817; cv=none; b=YHUkoxdmwFToVYSbg+Vi+JvTSEZTFWZ77Vmgj1bsi+UorghM+A49XALMYNQrtmRVtL7/e7OaPotawmgxGC2hFH3AAocYkLfQce7nN/EWyUOicVbxxbKq2buseli6IpfpifN1N6rWepfdLCGgEQbb5o7lijP4Z7OyotC9thudxMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744635817; c=relaxed/simple;
	bh=suoCueQ/UBH6cbO7/ecRJRmkx8HG1xGcqpcDgNpN2Bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n59k5qH9O9bx/0xpFb/8YO7M32qG09mxh5p5hwp9U57RIZwEGL+PeDT8Gji7yJoAKcetyhbu51nHawZFOFgRzdW9Pv54oexVNvJcnFL6DKJXiPo7W/4HIvOy0AZVh6q8FJzjwYHGYY+7XWzh/lGSWmVGzSn5lU2vZECWeIKyBu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2A381007;
	Mon, 14 Apr 2025 06:03:32 -0700 (PDT)
Received: from [10.57.86.225] (unknown [10.57.86.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A69103F66E;
	Mon, 14 Apr 2025 06:03:32 -0700 (PDT)
Message-ID: <5c6d9706-7684-4288-b630-c60b3766b13f@arm.com>
Date: Mon, 14 Apr 2025 14:03:31 +0100
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
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <3750d3f8-17c6-4bb8-8107-215d442e4ec3@os.amperecomputing.com>
 <2fb974bb-1470-4a5f-90d5-97456140c98f@arm.com>
 <22b53cff-00db-48f1-b1e8-b11a54ebb147@os.amperecomputing.com>
 <4794885d-2e17-4bd8-bdf3-8ac37047e8ee@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <4794885d-2e17-4bd8-bdf3-8ac37047e8ee@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/04/2025 23:00, Yang Shi wrote:
> Hi Ryan,
> 
> I know you may have a lot of things to follow up after LSF/MM. Just gently ping,
> hopefully we can resume the review soon.

Hi, I'm out on holiday at the moment, returning on the 22nd April. But I'm very
keen to move this series forward so will come back to you next week. (although
TBH, I thought I was waiting for you to respond to me... :-| )

FWIW, having thought about it a bit more, I think some of the suggestions I
previously made may not have been quite right, but I'll elaborate next week. I'm
keen to build a pgtable splitting primitive here that we can reuse with vmalloc
as well to enable huge mappings by default with vmalloc too.

Thanks,
Ryan

> 
> Thanks,
> Yang
> 
> 
> On 3/13/25 10:40 AM, Yang Shi wrote:
>>
>>
>> On 3/13/25 10:36 AM, Ryan Roberts wrote:
>>> On 13/03/2025 17:28, Yang Shi wrote:
>>>> Hi Ryan,
>>>>
>>>> I saw Miko posted a new spin of his patches. There are some slight changes that
>>>> have impact to my patches (basically check the new boot parameter). Do you
>>>> prefer I rebase my patches on top of his new spin right now then restart review
>>>> from the new spin or review the current patches then solve the new review
>>>> comments and rebase to Miko's new spin together?
>>> Hi Yang,
>>>
>>> Sorry I haven't got to reviewing this version yet, it's in my queue!
>>>
>>> I'm happy to review against v3 as it is. I'm familiar with Miko's series and am
>>> not too bothered about the integration with that; I think it's pretty straight
>>> forward. I'm more interested in how you are handling the splitting, which I
>>> think is the bulk of the effort.
>>
>> Yeah, sure, thank you.
>>
>>>
>>> I'm hoping to get to this next week before heading out to LSF/MM the following
>>> week (might I see you there?)
>>
>> Unfortunately I can't make it this year. Have a fun!
>>
>> Thanks,
>> Yang
>>
>>>
>>> Thanks,
>>> Ryan
>>>
>>>
>>>> Thanks,
>>>> Yang
>>>>
>>>>
>>>> On 3/4/25 2:19 PM, Yang Shi wrote:
>>>>> Changelog
>>>>> =========
>>>>> v3:
>>>>>     * Rebased to v6.14-rc4.
>>>>>     * Based on Miko's BBML2 cpufeature patch (https://lore.kernel.org/linux-
>>>>> arm-kernel/20250228182403.6269-3-miko.lenczewski@arm.com/).
>>>>>       Also included in this series in order to have the complete patchset.
>>>>>     * Enhanced __create_pgd_mapping() to handle split as well per Ryan.
>>>>>     * Supported CONT mappings per Ryan.
>>>>>     * Supported asymmetric system by splitting kernel linear mapping if such
>>>>>       system is detected per Ryan. I don't have such system to test, so the
>>>>>       testing is done by hacking kernel to call linear mapping repainting
>>>>>       unconditionally. The linear mapping doesn't have any block and cont
>>>>>       mappings after booting.
>>>>>
>>>>> RFC v2:
>>>>>     * Used allowlist to advertise BBM lv2 on the CPUs which can handle TLB
>>>>>       conflict gracefully per Will Deacon
>>>>>     * Rebased onto v6.13-rc5
>>>>>     * https://lore.kernel.org/linux-arm-kernel/20250103011822.1257189-1-
>>>>> yang@os.amperecomputing.com/
>>>>>
>>>>> RFC v1: https://lore.kernel.org/lkml/20241118181711.962576-1-
>>>>> yang@os.amperecomputing.com/
>>>>>
>>>>> Description
>>>>> ===========
>>>>> When rodata=full kernel linear mapping is mapped by PTE due to arm's
>>>>> break-before-make rule.
>>>>>
>>>>> A number of performance issues arise when the kernel linear map is using
>>>>> PTE entries due to arm's break-before-make rule:
>>>>>     - performance degradation
>>>>>     - more TLB pressure
>>>>>     - memory waste for kernel page table
>>>>>
>>>>> These issues can be avoided by specifying rodata=on the kernel command
>>>>> line but this disables the alias checks on page table permissions and
>>>>> therefore compromises security somewhat.
>>>>>
>>>>> With FEAT_BBM level 2 support it is no longer necessary to invalidate the
>>>>> page table entry when changing page sizes.  This allows the kernel to
>>>>> split large mappings after boot is complete.
>>>>>
>>>>> This patch adds support for splitting large mappings when FEAT_BBM level 2
>>>>> is available and rodata=full is used. This functionality will be used
>>>>> when modifying page permissions for individual page frames.
>>>>>
>>>>> Without FEAT_BBM level 2 we will keep the kernel linear map using PTEs
>>>>> only.
>>>>>
>>>>> If the system is asymmetric, the kernel linear mapping may be repainted once
>>>>> the BBML2 capability is finalized on all CPUs.  See patch #6 for more details.
>>>>>
>>>>> We saw significant performance increases in some benchmarks with
>>>>> rodata=full without compromising the security features of the kernel.
>>>>>
>>>>> Testing
>>>>> =======
>>>>> The test was done on AmpereOne machine (192 cores, 1P) with 256GB memory and
>>>>> 4K page size + 48 bit VA.
>>>>>
>>>>> Function test (4K/16K/64K page size)
>>>>>     - Kernel boot.  Kernel needs change kernel linear mapping permission at
>>>>>       boot stage, if the patch didn't work, kernel typically didn't boot.
>>>>>     - Module stress from stress-ng. Kernel module load change permission for
>>>>>       linear mapping.
>>>>>     - A test kernel module which allocates 80% of total memory via vmalloc(),
>>>>>       then change the vmalloc area permission to RO, this also change linear
>>>>>       mapping permission to RO, then change it back before vfree(). Then
>>>>> launch
>>>>>       a VM which consumes almost all physical memory.
>>>>>     - VM with the patchset applied in guest kernel too.
>>>>>     - Kernel build in VM with guest kernel which has this series applied.
>>>>>     - rodata=on. Make sure other rodata mode is not broken.
>>>>>     - Boot on the machine which doesn't support BBML2.
>>>>>
>>>>> Performance
>>>>> ===========
>>>>> Memory consumption
>>>>> Before:
>>>>> MemTotal:       258988984 kB
>>>>> MemFree:        254821700 kB
>>>>>
>>>>> After:
>>>>> MemTotal:       259505132 kB
>>>>> MemFree:        255410264 kB
>>>>>
>>>>> Around 500MB more memory are free to use.  The larger the machine, the
>>>>> more memory saved.
>>>>>
>>>>> Performance benchmarking
>>>>> * Memcached
>>>>> We saw performance degradation when running Memcached benchmark with
>>>>> rodata=full vs rodata=on.  Our profiling pointed to kernel TLB pressure.
>>>>> With this patchset we saw ops/sec is increased by around 3.5%, P99
>>>>> latency is reduced by around 9.6%.
>>>>> The gain mainly came from reduced kernel TLB misses.  The kernel TLB
>>>>> MPKI is reduced by 28.5%.
>>>>>
>>>>> The benchmark data is now on par with rodata=on too.
>>>>>
>>>>> * Disk encryption (dm-crypt) benchmark
>>>>> Ran fio benchmark with the below command on a 128G ramdisk (ext4) with disk
>>>>> encryption (by dm-crypt).
>>>>> fio --directory=/data --random_generator=lfsr --norandommap --randrepeat 1 \
>>>>>       --status-interval=999 --rw=write --bs=4k --loops=1 --ioengine=sync \
>>>>>       --iodepth=1 --numjobs=1 --fsync_on_close=1 --group_reporting --thread \
>>>>>       --name=iops-test-job --eta-newline=1 --size 100G
>>>>>
>>>>> The IOPS is increased by 90% - 150% (the variance is high, but the worst
>>>>> number of good case is around 90% more than the best number of bad case).
>>>>> The bandwidth is increased and the avg clat is reduced proportionally.
>>>>>
>>>>> * Sequential file read
>>>>> Read 100G file sequentially on XFS (xfs_io read with page cache populated).
>>>>> The bandwidth is increased by 150%.
>>>>>
>>>>>
>>>>> Mikołaj Lenczewski (1):
>>>>>         arm64: Add BBM Level 2 cpu feature
>>>>>
>>>>> Yang Shi (5):
>>>>>         arm64: cpufeature: add AmpereOne to BBML2 allow list
>>>>>         arm64: mm: make __create_pgd_mapping() and helpers non-void
>>>>>         arm64: mm: support large block mapping when rodata=full
>>>>>         arm64: mm: support split CONT mappings
>>>>>         arm64: mm: split linear mapping if BBML2 is not supported on secondary
>>>>> CPUs
>>>>>
>>>>>    arch/arm64/Kconfig                  |  11 +++++
>>>>>    arch/arm64/include/asm/cpucaps.h    |   2 +
>>>>>    arch/arm64/include/asm/cpufeature.h |  15 ++++++
>>>>>    arch/arm64/include/asm/mmu.h        |   4 ++
>>>>>    arch/arm64/include/asm/pgtable.h    |  12 ++++-
>>>>>    arch/arm64/kernel/cpufeature.c      |  95 ++++++++++++++++++++++++++++++
>>>>> +++++++
>>>>>    arch/arm64/mm/mmu.c                 | 397 ++++++++++++++++++++++++++++++
>>>>> ++++
>>>>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>> ++++++++++++++++++++++-------------------
>>>>>    arch/arm64/mm/pageattr.c            |  37 ++++++++++++---
>>>>>    arch/arm64/tools/cpucaps            |   1 +
>>>>>    9 files changed, 518 insertions(+), 56 deletions(-)
>>>>>
>>>>>
>>
> 

