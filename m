Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315FE1EDA0B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 12:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748865648; cv=none; b=Y+e7VaW1Qhl77DYgS7+4n2qHX8ktrZzt3Z7j8wfM1VUaBi287qzM1R2yFVw6D9LgYY1W9dZvYx1Ilqo/IQbbLmxcszS8lnITI9zHengtHH4c7E+zLCgtla2+QL+1W2Lc+iM191ZyQ22AcLvmGAuDWdeI+UPNMk1Kv7NF0prl7OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748865648; c=relaxed/simple;
	bh=REd3vAZDGWbEM2oAxUFtW2OPMm/SFCgdjgUeoy/uMrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhddsAmZIQG6Vqe2t3/ta4nj0VaaOtP6zFYxobohVVVuMsHWXUKptGGKzy+GXxS2LYXh3nkhO4/s6Sw5Uy7ZxBQoufuDMvh9a3wJVboAp9ToexN7Jr/izuRNgely9ilkwPyEuuxiy3uDCs3LDKMR6J2YtL7aEIzclxYcqCtFg0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YszuxWwh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YszuxWwh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DEE9C4CEEB;
	Mon,  2 Jun 2025 12:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748865647;
	bh=REd3vAZDGWbEM2oAxUFtW2OPMm/SFCgdjgUeoy/uMrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YszuxWwhUjdEQtlyCKREgAR2z49sjnuuRwXwNgzY8E4ijsIkxuianWTmx806I9Hkn
	 53y9vFEnRx+s76MYFk5TSgQV3nuCSPJYTFNYm2VdoP6esgTAhhj+npAkVRdhhj+LgY
	 TEr+PJh5HVzuICi51U6bYtwUgIjZnMYzLtBUuJaz5HFWd5HuNMjsG0LaXYCzKpGSQT
	 MNaKEmwoQqHYn8wsMlIKJPDO3JhTpBenXDHYDL5AhWHNTCXMWN3H0cOdIxBtjpy/aJ
	 gANXq6WqyEjvc67Qr3Ozrpu3wlux8N8S7+4xOydalj1pmuGQF6SmEkVs4b2IAH9ccU
	 iqAJUB3AiWxaA==
Date: Mon, 2 Jun 2025 13:00:43 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Barry Song <baohua@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64/mm: Close theoretical race where stale TLB
 entry remains valid
Message-ID: <20250602120042.GB1227@willie-the-truck>
References: <20250530152445.2430295-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530152445.2430295-1-ryan.roberts@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, May 30, 2025 at 04:23:47PM +0100, Ryan Roberts wrote:
> Commit 3ea277194daa ("mm, mprotect: flush TLB if potentially racing with
> a parallel reclaim leaving stale TLB entries") describes a race that,
> prior to the commit, could occur between reclaim and operations such as
> mprotect() when using reclaim's tlbbatch mechanism. See that commit for
> details but the summary is:
> 
> """
> Nadav Amit identified a theoritical race between page reclaim and
> mprotect due to TLB flushes being batched outside of the PTL being held.
> 
> He described the race as follows:
> 
> 	CPU0				CPU1
> 	----				----
> 					user accesses memory using RW PTE
> 					[PTE now cached in TLB]
> 	try_to_unmap_one()
> 	==> ptep_get_and_clear()
> 	==> set_tlb_ubc_flush_pending()
> 					mprotect(addr, PROT_READ)
> 					==> change_pte_range()
> 					==> [ PTE non-present - no flush ]
> 
> 					user writes using cached RW PTE
> 	...
> 
> 	try_to_unmap_flush()
> """
> 
> The solution was to insert flush_tlb_batched_pending() in mprotect() and
> friends to explcitly drain any pending reclaim TLB flushes. In the
> modern version of this solution, arch_flush_tlb_batched_pending() is
> called to do that synchronisation.
> 
> arm64's tlbbatch implementation simply issues TLBIs at queue-time
> (arch_tlbbatch_add_pending()), eliding the trailing dsb(ish). The
> trailing dsb(ish) is finally issued in arch_tlbbatch_flush() at the end
> of the batch to wait for all the issued TLBIs to complete.
> 
> Now, the Arm ARM states:
> 
> """
> The completion of the TLB maintenance instruction is guaranteed only by
> the execution of a DSB by the observer that performed the TLB
> maintenance instruction. The execution of a DSB by a different observer
> does not have this effect, even if the DSB is known to be executed after
> the TLB maintenance instruction is observed by that different observer.
> """
> 
> arch_tlbbatch_add_pending() and arch_tlbbatch_flush() conform to this
> requirement because they are called from the same task (either kswapd or
> caller of madvise(MADV_PAGEOUT)), so either they are on the same CPU or
> if the task was migrated, __switch_to() contains an extra dsb(ish).
> 
> HOWEVER, arm64's arch_flush_tlb_batched_pending() is also implemented as
> a dsb(ish). But this may be running on a CPU remote from the one that
> issued the outstanding TLBIs. So there is no architectural gurantee of
> synchonization. Therefore we are still vulnerable to the theoretical
> race described in Commit 3ea277194daa ("mm, mprotect: flush TLB if
> potentially racing with a parallel reclaim leaving stale TLB entries").
> 
> Fix this by flushing the entire mm in arch_flush_tlb_batched_pending().
> This aligns with what the other arches that implement the tlbbatch
> feature do.
> 
> Fixes: 43b3dfdd0455 ("arm64: support batched/deferred tlb shootdown during page reclamation/migration")

Barry -- it would be great if you could re-run some of the benchmarks
from that commit with this fix applied.

> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index eba1a98657f1..7d564c2a126f 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -323,13 +323,14 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>  }
> 
>  /*
> - * If mprotect/munmap/etc occurs during TLB batched flushing, we need to
> - * synchronise all the TLBI issued with a DSB to avoid the race mentioned in
> - * flush_tlb_batched_pending().
> + * If mprotect/munmap/etc occurs during TLB batched flushing, we need to ensure
> + * all the previously issued TLBIs targeting mm have completed. But since we
> + * can be executing on a remote CPU, a DSB cannot guarrantee this like it can
> + * for arch_tlbbatch_flush(). Our only option is to flush the entire mm.
>   */
>  static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
>  {
> -	dsb(ish);
> +	flush_tlb_mm(mm);
>  }

Thanks, Ryan. I'll pick this as a fix, but perhaps the core code should
do this given that all the architectures selecting
ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH now have an identical implementation
of arch_flush_tlb_batched_pending()?

Will
