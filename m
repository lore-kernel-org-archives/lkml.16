Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAB8221FBB
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872818; cv=none; b=S/mOkCatudcaMyikXxX+PPDmTPpKC/SA2ucvXU4TKs8lrLtIS8m9x60D1r85zN5Umils7iGEh0gBCcN+VcDrh34eCF3V5eJKr0q2TsX4Em1eKaAwpCSOo3cvCHQblYnVvknkAvof153QpMyFuui0E1lf2nepvWxe6VuzebNJ214=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872818; c=relaxed/simple;
	bh=Z2LqJHOMAz+4JmQAA3nOPY2QlwA7PApYHjznTNl0bRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hsUqJHMMKOei6BCh5cQsNZxgoZI/5UTxK1ju+VDpY2rj/EyX+XFgRijRDxkX8Ih4QqqO4sGFnSIlrJ06N0r5cM9Q+EsRpP0Il8jpvtE8rdBocx3sKQZWw+mHnH8KQjJOYHrtXUvWPQbVdhtigePyq7Tezuuj+8VHJev+b5kiQk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 586DF12FC;
	Mon,  2 Jun 2025 06:59:58 -0700 (PDT)
Received: from [10.57.95.206] (unknown [10.57.95.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A53AD3F59E;
	Mon,  2 Jun 2025 07:00:13 -0700 (PDT)
Message-ID: <8ef5cadd-2f9b-4a19-a85c-18e17d7edfbc@arm.com>
Date: Mon, 2 Jun 2025 15:00:12 +0100
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
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Barry Song <baohua@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250530152445.2430295-1-ryan.roberts@arm.com>
 <20250602120042.GB1227@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250602120042.GB1227@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/06/2025 13:00, Will Deacon wrote:
> On Fri, May 30, 2025 at 04:23:47PM +0100, Ryan Roberts wrote:
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
>> 	CPU0				CPU1
>> 	----				----
>> 					user accesses memory using RW PTE
>> 					[PTE now cached in TLB]
>> 	try_to_unmap_one()
>> 	==> ptep_get_and_clear()
>> 	==> set_tlb_ubc_flush_pending()
>> 					mprotect(addr, PROT_READ)
>> 					==> change_pte_range()
>> 					==> [ PTE non-present - no flush ]
>>
>> 					user writes using cached RW PTE
>> 	...
>>
>> 	try_to_unmap_flush()
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
>> Fixes: 43b3dfdd0455 ("arm64: support batched/deferred tlb shootdown during page reclamation/migration")
> 
> Barry -- it would be great if you could re-run some of the benchmarks
> from that commit with this fix applied.

Worth rerunning if possible, but I would guess that those benchmarks will still
show the similar improvement because they are measuring the cost of doing the
TLB flushing. But with the fix, there is an extra cost that those benchmarks
probably won't measure; subsequent work within the target mm will have no VAs
cached in the TLB so the miss rate will be much higher.

> 
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  arch/arm64/include/asm/tlbflush.h | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>> index eba1a98657f1..7d564c2a126f 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -323,13 +323,14 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>  }
>>
>>  /*
>> - * If mprotect/munmap/etc occurs during TLB batched flushing, we need to
>> - * synchronise all the TLBI issued with a DSB to avoid the race mentioned in
>> - * flush_tlb_batched_pending().
>> + * If mprotect/munmap/etc occurs during TLB batched flushing, we need to ensure
>> + * all the previously issued TLBIs targeting mm have completed. But since we
>> + * can be executing on a remote CPU, a DSB cannot guarrantee this like it can
>> + * for arch_tlbbatch_flush(). Our only option is to flush the entire mm.
>>   */
>>  static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
>>  {
>> -	dsb(ish);
>> +	flush_tlb_mm(mm);
>>  }
> 
> Thanks, Ryan. I'll pick this as a fix, but perhaps the core code should
> do this given that all the architectures selecting
> ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH now have an identical implementation
> of arch_flush_tlb_batched_pending()?

Ha, yes... infact it looks like that's what it did prior to commit db6c1f6f236d
("mm/tlbbatch: introduce arch_flush_tlb_batched_pending()").

I'll do that tidy up once this fix appears in mm-unstable.

Thanks,
Ryan


> 
> Will

