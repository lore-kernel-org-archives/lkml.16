Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11442C9D;
	Wed, 29 Jan 2025 19:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738178344; cv=none; b=Mx/CcTe4y7I3nTnRZVS7c+BwaMfyll88HNPIjpP72927UVCA0qpBi6t8Tu4u9IacfMf4OI0Yl4TIHJNxYtMs0fRBIQOhZ3zV3qjuoEQeGWwFt5XEwApp9/k/m5QSXw1lo2a2oH7t8J5Im9LyOBU6SFDM2Kop+PTUA/EhgvgtDak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738178344; c=relaxed/simple;
	bh=kEAcD5m2zjhok4dm/uT0Bj264vRGlMqI6QSE4IT6r7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhdJL/TTZWCdJtkcZ6kCWQjeJfCVCPzAsT1IykDQFlJJX+8qJbL9PhfI5Py7863wgoZ4Tw55KsWttKsPUfKs5o/GStmfFDLPri8QibV62mFH4Iw+JG8fpudMoa+T5lHg6KEx2l3G2fOvKzDKLFPO8YTPXIzxdAxOPpEm7DjjCjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKsPRtl+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKsPRtl+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD48C4CED1;
	Wed, 29 Jan 2025 19:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738178343;
	bh=kEAcD5m2zjhok4dm/uT0Bj264vRGlMqI6QSE4IT6r7g=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=RKsPRtl+xB8BruC3OQJF3jHlqAYBxXqfR2vpAEUcMkxVmeyxfueVUmR4RunL9MxYO
	 gHxPoFnsv0ETZrHHvo/Ifi7kVdFoxs1jMYBcUabec0ysVmSQ+WavZSiEsBg9hTcfRP
	 56UxBmTX/9deqVXeSM4Ak7LiOCfIMJg+dV1VmRisCHvEEmAYtA375cxEnSPmd3Toku
	 HIGYNLLDMus3JtfDK+afQnC9uudcs0y98mRAOEUkrmn/FNhWhAL4+NlrpxnIuZ2mUG
	 TRgoL8tYi3R66TNpbFHkVyf8WV1Vhj66IVKhOGOTGi2awoIV30Nt6i8imHAVOj17WK
	 x3hnHtEGhXTJA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7A356CE12CA; Wed, 29 Jan 2025 11:19:02 -0800 (PST)
Date: Wed, 29 Jan 2025 11:19:02 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Rik van Riel <riel@surriel.com>, Matthew Wilcox <willy@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Rientjes <rientjes@google.com>,
	Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Mel Gorman <mgorman@suse.de>, Muchun Song <muchun.song@linux.dev>,
	Peter Xu <peterx@redhat.com>, Will Deacon <will@kernel.org>,
	Zach O'Keefe <zokeefe@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
Subject: Re: [linus:master] [x86] 4817f70c25: stress-ng.mmapaddr.ops_per_sec
 63.0% regression
Message-ID: <b14a36da-ff29-4796-8f36-64704924232b@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <8b661116-0a85-4928-91ed-3c01ebbf8d39@bytedance.com>
 <2212111cad3180948cf388a7e5c8689df0fdda08.camel@surriel.com>
 <14159fb4-0c59-4653-9265-73f415e70063@bytedance.com>
 <20250129105920.7a4bffa1@fangorn>
 <Z5pTZ0XLFzfM5dic@casper.infradead.org>
 <488401565cac6b5f9e3232d0ca481055876c919b.camel@surriel.com>
 <05da0ae9-073e-4578-b65c-f837c28eead8@paulmck-laptop>
 <20250129115320.1334ad5f@fangorn>
 <96f55f36-5cb7-4226-a8ea-374a7891ecff@bytedance.com>
 <92fe6c2b-ef8d-4ed4-bf96-27f0760329b7@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92fe6c2b-ef8d-4ed4-bf96-27f0760329b7@bytedance.com>

On Thu, Jan 30, 2025 at 01:53:06AM +0800, Qi Zheng wrote:
> 
> 
> On 2025/1/30 01:33, Qi Zheng wrote:
> > 
> > 
> > On 2025/1/30 00:53, Rik van Riel wrote:
> > > On Wed, 29 Jan 2025 08:36:12 -0800
> > > "Paul E. McKenney" <paulmck@kernel.org> wrote:
> > > > On Wed, Jan 29, 2025 at 11:14:29AM -0500, Rik van Riel wrote:
> > > 
> > > > > Paul, does this look like it could do the trick,
> > > > > or do we need something else to make RCU freeing
> > > > > happy again?
> > > > 
> > > > I don't claim to fully understand the issue, but this would prevent
> > > > any RCU grace periods starting subsequently from completing.  It would
> > > > not prevent RCU callbacks from being invoked for RCU grace periods that
> > > > started earlier.
> > > > 
> > > > So it won't prevent RCU callbacks from being invoked.
> > > 
> > > That makes things clear! I guess we need a different approach.
> > > 
> > > Qi, does the patch below resolve the regression for you?
> > > 
> > > ---8<---
> > > 
> > >  From 5de4fa686fca15678a7e0a186852f921166854a3 Mon Sep 17 00:00:00 2001
> > > From: Rik van Riel <riel@surriel.com>
> > > Date: Wed, 29 Jan 2025 10:51:51 -0500
> > > Subject: [PATCH 2/2] mm,rcu: prevent RCU callbacks from running with
> > > pcp lock
> > >   held
> > > 
> > > Enabling MMU_GATHER_RCU_TABLE_FREE can create contention on the
> > > zone->lock.  This turns out to be because in some configurations
> > > RCU callbacks are called when IRQs are re-enabled inside
> > > rmqueue_bulk, while the CPU is still holding the per-cpu pages lock.
> > > 
> > > That results in the RCU callbacks being unable to grab the
> > > PCP lock, and taking the slow path with the zone->lock for
> > > each item freed.
> > > 
> > > Speed things up by blocking RCU callbacks while holding the
> > > PCP lock.
> > > 
> > > Signed-off-by: Rik van Riel <riel@surriel.com>
> > > Suggested-by: Paul McKenney <paulmck@kernel.org>
> > > Reported-by: Qi Zheng <zhengqi.arch@bytedance.com>
> > > ---
> > >   mm/page_alloc.c | 10 +++++++---
> > >   1 file changed, 7 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > > index 6e469c7ef9a4..73e334f403fd 100644
> > > --- a/mm/page_alloc.c
> > > +++ b/mm/page_alloc.c
> > > @@ -94,11 +94,15 @@ static DEFINE_MUTEX(pcp_batch_high_lock);
> > >   #if defined(CONFIG_SMP) || defined(CONFIG_PREEMPT_RT)
> > >   /*
> > > - * On SMP, spin_trylock is sufficient protection.
> > > + * On SMP, spin_trylock is sufficient protection against recursion.
> > >    * On PREEMPT_RT, spin_trylock is equivalent on both SMP and UP.
> > > + *
> > > + * Block softirq execution to prevent RCU frees from running in softirq
> > > + * context while this CPU holds the PCP lock, which could result in
> > > a whole
> > > + * bunch of frees contending on the zone->lock.
> > >    */
> > > -#define pcp_trylock_prepare(flags)    do { } while (0)
> > > -#define pcp_trylock_finish(flag)    do { } while (0)
> > > +#define pcp_trylock_prepare(flags)    local_bh_disable()
> > > +#define pcp_trylock_finish(flag)    local_bh_enable()
> > 
> > I just tested this, and it doesn't seem to improve much:
> > 
> > root@debian:~# stress-ng --timeout 60 --times --verify --metrics
> > --no-rand-seed --mmapaddr 64
> > stress-ng: info:  [671] dispatching hogs: 64 mmapaddr
> > stress-ng: info:  [671] successful run completed in 60.07s (1 min, 0.07
> > secs)
> > stress-ng: info:  [671] stressor       bogo ops real time  usr time  sys
> > time   bogo ops/s   bogo ops/s
> > stress-ng: info:  [671]                           (secs)    (secs)
> > (secs)   (real time) (usr+sys time)
> > stress-ng: info:  [671] mmapaddr       19803127     60.01    235.20
> > 1146.76    330007.29     14329.74
> > stress-ng: info:  [671] for a 60.07s run time:
> > stress-ng: info:  [671]    1441.59s available CPU time
> > stress-ng: info:  [671]     235.57s user time   ( 16.34%)
> > stress-ng: info:  [671]    1147.20s system time ( 79.58%)
> > stress-ng: info:  [671]    1382.77s total time  ( 95.92%)
> > stress-ng: info:  [671] load average: 41.42 11.91 4.10
> > 
> > The _raw_spin_unlock_irqrestore hotspot still exists:
> > 
> >    15.87%  [kernel]  [k] _raw_spin_unlock_irqrestore
> >     9.18%  [kernel]  [k] clear_page_rep
> >     7.03%  [kernel]  [k] do_syscall_64
> >     3.67%  [kernel]  [k] _raw_spin_lock
> >     3.28%  [kernel]  [k] __slab_free
> >     2.03%  [kernel]  [k] rcu_cblist_dequeue
> >     1.98%  [kernel]  [k] flush_tlb_mm_range
> >     1.88%  [kernel]  [k] lruvec_stat_mod_folio.part.131
> >     1.85%  [kernel]  [k] get_page_from_freelist
> >     1.64%  [kernel]  [k] kmem_cache_alloc_noprof
> >     1.61%  [kernel]  [k] tlb_remove_table_rcu
> >     1.39%  [kernel]  [k] mtree_range_walk
> >     1.36%  [kernel]  [k] __alloc_frozen_pages_noprof
> >     1.27%  [kernel]  [k] pmd_install
> >     1.24%  [kernel]  [k] memcpy_orig
> >     1.23%  [kernel]  [k] __call_rcu_common.constprop.77
> >     1.17%  [kernel]  [k] free_pgd_range
> >     1.15%  [kernel]  [k] pte_alloc_one
> > 
> > The call stack is as follows:
> > 
> > bpftrace -e 'k:_raw_spin_unlock_irqrestore {@[kstack,comm]=count();}
> > interval:s:1 {exit();}'
> > 
> > @[
> >      _raw_spin_unlock_irqrestore+5
> >      hrtimer_interrupt+289
> >      __sysvec_apic_timer_interrupt+85
> >      sysvec_apic_timer_interrupt+108
> >      asm_sysvec_apic_timer_interrupt+26
> >      tlb_remove_table_rcu+48
> >      rcu_do_batch+424
> >      rcu_core+401
> >      handle_softirqs+204
> >      irq_exit_rcu+208
> >      sysvec_apic_timer_interrupt+61
> >      asm_sysvec_apic_timer_interrupt+26
> > , stress-ng-mmapa]: 8
> > 
> > The tlb_remove_table_rcu() is called very rarely, so I guess the
> > PCP cache is basically empty at this time, resulting in the following
> > call stack:
> 
> But I think this may be just an extreme test scenario, because my test
> machine has no other load at this time. Under normal workload, page
> table pages should only occupy a small part of the PCP cache, and
> delayed freeing should not have much impact on the PCP cache.

It might well be extreme, but it might also be well worth looking at
for people in environments where one in a million is the common case.  ;-)

							Thanx, Paul
