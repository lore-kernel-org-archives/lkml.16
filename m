Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A3314EC46
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 00:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751849076; cv=none; b=RXyD+zG68++shPAQNbkWqqEfVozIZKaJzSQAZYvKNZgy6vM1Lepdcg0yuGplj59FcYxryjrkZJCKqM1WvxEN4CG0pFzo9pBPuKKm+OeGaPir0P42LgJw+8PSowwjw99JGLp6RKJ1Kl9UbSvvGWpuV2+hYdS5XcZIxK0aNyIfEek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751849076; c=relaxed/simple;
	bh=7j7Au54BtQAEHrdlPdEyzzCHFbDOkAX3ZDaUoA+7t8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPljuA0hwbRQSZSymLXKVMYdEB1qjU1f/EMQHv7vcfmTjTXp5dd7fBzMd0tk5XKLoxM4nj+L3oRIzfT6reYvWkISliYqGkOlTDjG4WUXFfLr+ybas2ozOpyHbfV1fTIxQUrLyfeISPaOcxhOChiYaFiTrcolhUIIembVm1M9U90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E1DC4CEED;
	Mon,  7 Jul 2025 00:44:25 +0000 (UTC)
Date: Sun, 6 Jul 2025 19:44:23 -0500
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: will@kernel.org, anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
	ryan.roberts@arm.com, kevin.brodsky@arm.com,
	yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com
Subject: Re: [PATCH v4] arm64: Enable vmalloc-huge with ptdump
Message-ID: <aGsYZ7W0yunbeqQV@arm.com>
References: <20250626052524.332-1-dev.jain@arm.com>
 <aGe5XjWKhgjzcw7L@arm.com>
 <bc201f93-7743-4d9d-a62e-3c8ea22e2cfd@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc201f93-7743-4d9d-a62e-3c8ea22e2cfd@arm.com>
X-TUID: Ld5c6jqIQp3G

On Fri, Jul 04, 2025 at 05:12:13PM +0530, Dev Jain wrote:
> On 04/07/25 4:52 pm, Catalin Marinas wrote:
> > On Thu, Jun 26, 2025 at 10:55:24AM +0530, Dev Jain wrote:
> > > @@ -1301,16 +1314,39 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
> > >   	}
> > >   	table = pmd_offset(pudp, addr);
> > > +	/*
> > > +	 * Isolate the PMD table; in case of race with ptdump, this helps
> > > +	 * us to avoid taking the lock in __pmd_free_pte_page().
> > > +	 *
> > > +	 * Static key logic:
> > > +	 *
> > > +	 * Case 1: If ptdump does static_branch_enable(), and after that we
> > > +	 * execute the if block, then this patches in the read lock, ptdump has
> > > +	 * the write lock patched in, therefore ptdump will never read from
> > > +	 * a potentially freed PMD table.
> > > +	 *
> > > +	 * Case 2: If the if block starts executing before ptdump's
> > > +	 * static_branch_enable(), then no locking synchronization
> > > +	 * will be done. However, pud_clear() + the dsb() in
> > > +	 * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
[...]
> > I don't get case 2. You want to ensure pud_clear() is observed by the
> > ptdump code before the pmd_free(). The DSB in the TLB flushing code
> > ensures some ordering between the pud_clear() and presumably something
> > that the ptdump code can observe as well. Would that be the mmap
> > semaphore? However, the read_lock would only be attempted if this code
> > is seeing the static branch update, which is not guaranteed. I don't
> > think it even matters since the lock may be released anyway before the
> > write_lock in ptdump.
> > 
> > For example, you do a pud_clear() above, skip the whole static branch.
> > The ptdump comes along on another CPU but does not observe the
> > pud_clear() since there's no synchronisation. It goes ahead and
> > dereferences it while this CPU does a pmd_free().
> 
> The objective is: ptdump must not dereference a freed pagetable.
> So for your example, if the static branch is not observed by
> pud_free_pmd_page, this means that ptdump will take the write lock
> after the execution of flush_tlb_kernel_pagetable completes (for if ptdump takes
> the write lock before execution of flush_tlb_kernel_pagetable completes, we have
> executed static_branch_enable(), contradiction).

I don't see why the write lock matters since pud_free_pmd_page() doesn't
take the read lock in the second scenario. What we need is acquire
semantics after the static branch update on the ptdump path but we get
it before we even attempt the write lock.

For simplicity, ignoring the observability of instruction writes and
considering the static branch a variable, if pud_free_pmd_page() did not
observe the static branch update, is the ptdump guaranteed to see the
cleared pud subsequently?

With initial state pud=1 (non-zero), stb=0 (static branch):

P0 (pud_free_pmd_page)		P1 (ptdump)

    W_pud=0			   W_stb=1
    DSB				   barrier/acq
    R_stb=0			   R_pud=?

The write to the static branch on P1 will be ordered after the read of
the branch on P0, so the pud will be seen as 0. It's not even worth
mentioning the semaphore here as the static branch update has enough
barriers for cache flushing and kick_all_cpus_sync().


The other scenario is P0 (pud_free_pmd_page) observing the write to the
static branch (that's case 1 in your comment). This doesn't say anything
about whether P1 (ptdump) sees a clear or valid pud. What we do know is
that P0 will try to acquire (and release) the lock. If P1 already
acquired the write lock, P0 will wait and the state of the pud is
irrelevant (no freeing). Similarly if P1 already completed by the time
P0 takes the lock.

If P0 takes the lock first, the lock release guarantees that the
pud_clear() is seen by the ptdump code _after_ it acquired the lock.


W.r.t. the visibility of the branch update vs pud access, the
combinations of DSB+ISB (part of the TLB flushing) on P0 and cache
maintenance to PoU together with kick_all_cpus_sync() on P1 should
suffice.

I think the logic works (though I'm heavily jetlagged and writing from a
plane) but the comments need to be improved. As described above, case 1
has two sub-cases depending on when P0 runs in relation to the write
lock (before or during/after). And the write lock doesn't matter for
case 2.

> > And I can't get my head around memory ordering, it doesn't look sound.
> > static_branch_enable() I don't think has acquire semantics, at least not
> > in relation to the actual branch update. The static_branch_unlikely()
> > test, again, not sure what guarantees it has (I don't think it has any
> > in relation to memory loads). Maybe you have worked it all out and is
> > fine but it needs a better explanation and ideally some simple formal
> > model. Show it's correct with a global variable first and then we can
> > optimise with static branches.
> 
> What do you suggest? As in what do you mean by showing its correct with
> a global variable first...and, for the formal model thingy, do you
> want mathematical rigor similar to what you explain in [1] :P, because unfortunately
> (and quite embarrassingly) I didn't have formal methods in college : )

Neither did I ;) (mostly analogue electronics). I was thinking something
like our cat/herd tools where you can write some simple assembly. It's a
good investment if you want to give it a try.

-- 
Catalin
