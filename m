Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893E319DF4A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 08:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748852552; cv=none; b=eSe84GDAGnPKQ+MCkC2vbe8ZzMLx3CDx1iJmDBg+Wby9NsWzri0hMR30+xRuCU9J+F3Xu7K78yFLPF3wM7liKhozCnRBuaqQM0GlcYCCWENmYY3ZIxbsg8z/KDW6I8yx/1vxFJaBrfl0WLvk4wGYFo3CA/xDCdk9LK7KiHaMlA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748852552; c=relaxed/simple;
	bh=y1j6MgfUV7skCqVqjGpBKy2eh5JDvcAEDEyStgasCAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iv+ROUhsNsUj7cXaoxgHeqHbEpEJMLBsu0I1MBJ3RhiZq+6xadHTnD6TIMHgvWRzP31aheJqyZoj42LKoAtnrePMJnfpFwZz3nKXFXr5ruZE36Guks2B7/699P7Hm+S1Y5Iwntg86yQ3I9iR5U7VnNFE3DMykOIJ6KaAd3Wdvfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 252D01424;
	Mon,  2 Jun 2025 01:22:12 -0700 (PDT)
Received: from [10.57.95.206] (unknown [10.57.95.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5928D3F59E;
	Mon,  2 Jun 2025 01:22:27 -0700 (PDT)
Message-ID: <5edca678-b335-45b7-8a41-243115806daf@arm.com>
Date: Mon, 2 Jun 2025 09:22:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64/mm: Close theoretical race where stale TLB entry
 remains valid
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Barry Song <baohua@kernel.org>, Yicong Yang <yangyicong@hisilicon.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250530152445.2430295-1-ryan.roberts@arm.com>
 <7b71c574-0c52-440c-a83f-1e7d5dcd68b0@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <7b71c574-0c52-440c-a83f-1e7d5dcd68b0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/06/2025 05:59, Dev Jain wrote:
> 
> On 30/05/25 8:53 pm, Ryan Roberts wrote:
>> Commit 3ea277194daa ("mm, mprotect: flush TLB if potentially racing with
>> a parallel reclaim leaving stale TLB entries") describes a race that,
>> prior to the commit, could occur between reclaim and operations such as
>> mprotect() when using reclaim's tlbbatch mechanism. See that commit for
>> details but the summary is:
>>
>> """
>> Nadav Amit identified a theoritical race between page reclaim and
>> mprotect due to TLB flushes being batched outside of the PTL being held.
>>
>> He described the race as follows:
>>
>>     CPU0                CPU1
>>     ----                ----
>>                     user accesses memory using RW PTE
>>                     [PTE now cached in TLB]
>>     try_to_unmap_one()
>>     ==> ptep_get_and_clear()
>>     ==> set_tlb_ubc_flush_pending()
>>                     mprotect(addr, PROT_READ)
>>                     ==> change_pte_range()
>>                     ==> [ PTE non-present - no flush ]
>>
>>                     user writes using cached RW PTE
>>     ...
>>
>>     try_to_unmap_flush()
>> """
>>
>> The solution was to insert flush_tlb_batched_pending() in mprotect() and
>> friends to explcitly drain any pending reclaim TLB flushes. In the
>> modern version of this solution, arch_flush_tlb_batched_pending() is
>> called to do that synchronisation.
>>
>> arm64's tlbbatch implementation simply issues TLBIs at queue-time
>> (arch_tlbbatch_add_pending()), eliding the trailing dsb(ish). The
>> trailing dsb(ish) is finally issued in arch_tlbbatch_flush() at the end
>> of the batch to wait for all the issued TLBIs to complete.
>>
>> Now, the Arm ARM states:
>>
>> """
>> The completion of the TLB maintenance instruction is guaranteed only by
>> the execution of a DSB by the observer that performed the TLB
>> maintenance instruction. The execution of a DSB by a different observer
>> does not have this effect, even if the DSB is known to be executed after
>> the TLB maintenance instruction is observed by that different observer.
>> """
>>
>> arch_tlbbatch_add_pending() and arch_tlbbatch_flush() conform to this
>> requirement because they are called from the same task (either kswapd or
>> caller of madvise(MADV_PAGEOUT)), so either they are on the same CPU or
>> if the task was migrated, __switch_to() contains an extra dsb(ish).
>>
>> HOWEVER, arm64's arch_flush_tlb_batched_pending() is also implemented as
>> a dsb(ish). But this may be running on a CPU remote from the one that
>> issued the outstanding TLBIs. So there is no architectural gurantee of
>> synchonization. Therefore we are still vulnerable to the theoretical
>> race described in Commit 3ea277194daa ("mm, mprotect: flush TLB if
>> potentially racing with a parallel reclaim leaving stale TLB entries").
>>
>> Fix this by flushing the entire mm in arch_flush_tlb_batched_pending().
>> This aligns with what the other arches that implement the tlbbatch
>> feature do.
>>
>> Fixes: 43b3dfdd0455 ("arm64: support batched/deferred tlb shootdown during
>> page reclamation/migration")
> 
> Do we need Cc stable?

Yeah, good point. Assuming I haven't missed something critical that means this
isn't an issue in practice...

> 
> The patch logic looks good to me, but again, will leave it to the experts : )
> 
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>   arch/arm64/include/asm/tlbflush.h | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/
>> tlbflush.h
>> index eba1a98657f1..7d564c2a126f 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -323,13 +323,14 @@ static inline bool arch_tlbbatch_should_defer(struct
>> mm_struct *mm)
>>   }
>>
>>   /*
>> - * If mprotect/munmap/etc occurs during TLB batched flushing, we need to
>> - * synchronise all the TLBI issued with a DSB to avoid the race mentioned in
>> - * flush_tlb_batched_pending().
>> + * If mprotect/munmap/etc occurs during TLB batched flushing, we need to ensure
>> + * all the previously issued TLBIs targeting mm have completed. But since we
>> + * can be executing on a remote CPU, a DSB cannot guarrantee this like it can
>> + * for arch_tlbbatch_flush(). Our only option is to flush the entire mm.
>>    */
>>   static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
>>   {
>> -    dsb(ish);
>> +    flush_tlb_mm(mm);
>>   }
>>
>>   /*
>> -- 
>> 2.43.0
>>
>>

