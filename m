Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E8C1991CD
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750064956; cv=none; b=DfRbl+wmVQUoVdF8lU37gkEmghOkFVzOv5ioQAMcM8chDGp8PGC+mwq0PuUQyQ+A/tHRA8zGjrqdYt1vEEOpA1veQtOlyGVndoUhovrPfAT0sqNADEZ0c2OjTgPNoVU5rxeMZUosyr/Mq9029h1a+0YvnTY5Ejr7urdsAXLYXCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750064956; c=relaxed/simple;
	bh=zT73XYobToycpwXDErF+Wmjj06h1ZgWA81Y4XST7Cpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MITdiYrus8fhKdPt1ZcUHNxrDpX35ZJ0IXlElwXx58JEDhzlpiv2q9/fGJZX4lwUlFC/euPfrqN86xOO4JBLk4ZyOzkngfdCLmXzitEFgDTV0Nf9BleGIpL6pEkaNFhDwpsjLscgNMWrHaQKngO6SwVXSw3oYQB/6xeHODaLTpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80EA2150C;
	Mon, 16 Jun 2025 02:08:51 -0700 (PDT)
Received: from [10.57.84.117] (unknown [10.57.84.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A98F83F673;
	Mon, 16 Jun 2025 02:09:11 -0700 (PDT)
Message-ID: <5491098f-5508-4665-a8dc-b91a950bbc02@arm.com>
Date: Mon, 16 Jun 2025 10:09:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 PATCH 0/4] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com, dev.jain@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250531024545.1101304-1-yang@os.amperecomputing.com>
 <47adeebf-9997-45fa-8607-67e219c2ed17@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <47adeebf-9997-45fa-8607-67e219c2ed17@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/06/2025 18:21, Yang Shi wrote:
> Hi Ryan,
> 
> Gently ping... any comments for this version?

Hi Yang, yes sorry for slow response - It's been in my queue. I'm going to start
looking at it now and plan to get you some feedback in the next couple of days.

> 
> It looks Dev's series is getting stable except some nits. I went through his
> patches and all the call sites for changing page permission. They are:
>   1. change_memory_common(): called by set_memory_{ro|rw|x|nx}. It iterates
> every single page mapped in the vm area then change permission on page basis. It
> depends on whether the vm area is block mapped or not if we want to change
>      permission on block mapping.
>   2. set_memory_valid(): it looks it assumes the [addr, addr + size) range is
> mapped contiguously, but it depends on the callers pass in block size (nr > 1).
> There are two sub cases:
>      2.a kfence and debugalloc just work for PTE mapping, so they pass in single
> page.
>      2.b The execmem passes in large page on x86, arm64 has not supported huge
> execmem cache yet, so it should still pass in singe page for the time being. But
> my series + Dev's series can handle both single page mapping and block mapping well
>          for this case. So changing permission for block mapping can be
> supported automatically once arm64 supports huge execmem cache.
>   3. set_direct_map_{invalid|default}_noflush(): it looks they are page basis.
> So Dev's series has no change to them.
>   4. realm: if I remember correctly, realm forces PTE mapping for linear address
> space all the time, so no impact.

Yes for realm, we currently force PTE mapping - that's because we need page
granularity for sharing certain portions back to the host. But with this work I
think we will be able to do the splitting on the fly and map using big blocks
even for realms.

> 
> So it looks like just #1 may need some extra work. But it seems simple. I should
> just need advance the address range in (1 << vm's order) stride. So there should
> be just some minor changes when I rebase my patches on top of Dev's, mainly
> context changes. It has no impact to the split primitive and repainting linear
> mapping.

I haven't looked at your series yet, but I had assumed that the most convenient
(and only) integration point would be to call your split primitive from dev's
___change_memory_common() (note 3 underscores at beginning). Something like this:

___change_memory_common(unsigned long start, unsigned long size, ...)
{
	// This will need to return error for case where splitting would have
	// been required but system does not support BBML2_NOABORT
	ret = split_mapping_granularity(start, start + size)
	if (ret)
		return ret;

	...
}

> 
> Thanks,
> Yang
> 
> 
> On 5/30/25 7:41 PM, Yang Shi wrote:
>> Changelog
>> =========
>> v4:
>>    * Rebased to v6.15-rc4.
>>    * Based on Miko's latest BBML2 cpufeature patch (https://lore.kernel.org/
>> linux-arm-kernel/20250428153514.55772-4-miko.lenczewski@arm.com/).
>>    * Keep block mappings rather than splitting to PTEs if it is fully contained
>>      per Ryan.
>>    * Return -EINVAL if page table allocation failed instead of BUG_ON per Ryan.
>>    * When page table allocation failed, return -1 instead of 0 per Ryan.
>>    * Allocate page table with GFP_ATOMIC for repainting per Ryan.
>>    * Use idmap to wait for repainting is done per Ryan.
>>    * Some minor fixes per the discussion for v3.
>>    * Some clean up to reduce redundant code.
>>
>> v3:
>>    * Rebased to v6.14-rc4.
>>    * Based on Miko's BBML2 cpufeature patch (https://lore.kernel.org/linux-
>> arm-kernel/20250228182403.6269-3-miko.lenczewski@arm.com/).
>>      Also included in this series in order to have the complete patchset.
>>    * Enhanced __create_pgd_mapping() to handle split as well per Ryan.
>>    * Supported CONT mappings per Ryan.
>>    * Supported asymmetric system by splitting kernel linear mapping if such
>>      system is detected per Ryan. I don't have such system to test, so the
>>      testing is done by hacking kernel to call linear mapping repainting
>>      unconditionally. The linear mapping doesn't have any block and cont
>>      mappings after booting.
>>
>> RFC v2:
>>    * Used allowlist to advertise BBM lv2 on the CPUs which can handle TLB
>>      conflict gracefully per Will Deacon
>>    * Rebased onto v6.13-rc5
>>    * https://lore.kernel.org/linux-arm-kernel/20250103011822.1257189-1-
>> yang@os.amperecomputing.com/
>>
>> v3: https://lore.kernel.org/linux-arm-kernel/20250304222018.615808-1-
>> yang@os.amperecomputing.com/
>> RFC v2: https://lore.kernel.org/linux-arm-kernel/20250103011822.1257189-1-
>> yang@os.amperecomputing.com/
>> RFC v1: https://lore.kernel.org/lkml/20241118181711.962576-1-
>> yang@os.amperecomputing.com/
>>
>> Description
>> ===========
>> When rodata=full kernel linear mapping is mapped by PTE due to arm's
>> break-before-make rule.
>>
>> A number of performance issues arise when the kernel linear map is using
>> PTE entries due to arm's break-before-make rule:
>>    - performance degradation
>>    - more TLB pressure
>>    - memory waste for kernel page table
>>
>> These issues can be avoided by specifying rodata=on the kernel command
>> line but this disables the alias checks on page table permissions and
>> therefore compromises security somewhat.
>>
>> With FEAT_BBM level 2 support it is no longer necessary to invalidate the
>> page table entry when changing page sizes.  This allows the kernel to
>> split large mappings after boot is complete.
>>
>> This patch adds support for splitting large mappings when FEAT_BBM level 2
>> is available and rodata=full is used. This functionality will be used
>> when modifying page permissions for individual page frames.
>>
>> Without FEAT_BBM level 2 we will keep the kernel linear map using PTEs
>> only.
>>
>> If the system is asymmetric, the kernel linear mapping may be repainted once
>> the BBML2 capability is finalized on all CPUs.  See patch #4 for more details.
>>
>> We saw significant performance increases in some benchmarks with
>> rodata=full without compromising the security features of the kernel.
>>
>> Testing
>> =======
>> The test was done on AmpereOne machine (192 cores, 1P) with 256GB memory and
>> 4K page size + 48 bit VA.
>>
>> Function test (4K/16K/64K page size)
>>    - Kernel boot.  Kernel needs change kernel linear mapping permission at
>>      boot stage, if the patch didn't work, kernel typically didn't boot.
>>    - Module stress from stress-ng. Kernel module load change permission for
>>      linear mapping.
>>    - A test kernel module which allocates 80% of total memory via vmalloc(),
>>      then change the vmalloc area permission to RO, this also change linear
>>      mapping permission to RO, then change it back before vfree(). Then launch
>>      a VM which consumes almost all physical memory.
>>    - VM with the patchset applied in guest kernel too.
>>    - Kernel build in VM with guest kernel which has this series applied.
>>    - rodata=on. Make sure other rodata mode is not broken.
>>    - Boot on the machine which doesn't support BBML2.
>>
>> Performance
>> ===========
>> Memory consumption
>> Before:
>> MemTotal:       258988984 kB
>> MemFree:        254821700 kB
>>
>> After:
>> MemTotal:       259505132 kB
>> MemFree:        255410264 kB
>>
>> Around 500MB more memory are free to use.  The larger the machine, the
>> more memory saved.
>>
>> Performance benchmarking
>> * Memcached
>> We saw performance degradation when running Memcached benchmark with
>> rodata=full vs rodata=on.  Our profiling pointed to kernel TLB pressure.
>> With this patchset we saw ops/sec is increased by around 3.5%, P99
>> latency is reduced by around 9.6%.
>> The gain mainly came from reduced kernel TLB misses.  The kernel TLB
>> MPKI is reduced by 28.5%.
>>
>> The benchmark data is now on par with rodata=on too.
>>
>> * Disk encryption (dm-crypt) benchmark
>> Ran fio benchmark with the below command on a 128G ramdisk (ext4) with disk
>> encryption (by dm-crypt with no read/write workqueue).
>> fio --directory=/data --random_generator=lfsr --norandommap --randrepeat 1 \
>>      --status-interval=999 --rw=write --bs=4k --loops=1 --ioengine=sync \
>>      --iodepth=1 --numjobs=1 --fsync_on_close=1 --group_reporting --thread \
>>      --name=iops-test-job --eta-newline=1 --size 100G
>>
>> The IOPS is increased by 90% - 150% (the variance is high, but the worst
>> number of good case is around 90% more than the best number of bad case).
>> The bandwidth is increased and the avg clat is reduced proportionally.
>>
>> * Sequential file read
>> Read 100G file sequentially on XFS (xfs_io read with page cache populated).
>> The bandwidth is increased by 150%.
>>
>>
>> Yang Shi (4):
>>        arm64: cpufeature: add AmpereOne to BBML2 allow list
>>        arm64: mm: make __create_pgd_mapping() and helpers non-void
>>        arm64: mm: support large block mapping when rodata=full
>>        arm64: mm: split linear mapping if BBML2 is not supported on secondary
>> CPUs
>>
>>   arch/arm64/include/asm/cpufeature.h |  26 +++++++
>>   arch/arm64/include/asm/mmu.h        |   4 +
>>   arch/arm64/include/asm/pgtable.h    |  12 ++-
>>   arch/arm64/kernel/cpufeature.c      |  30 ++++++--
>>   arch/arm64/mm/mmu.c                 | 505 ++++++++++++++++++++++++++++++++++
>> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>> +---------------
>>   arch/arm64/mm/pageattr.c            |  37 +++++++--
>>   arch/arm64/mm/proc.S                |  41 ++++++++++
>>   7 files changed, 585 insertions(+), 70 deletions(-)
>>
> 

