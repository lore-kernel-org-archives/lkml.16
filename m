Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD6A2FEE03
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750267171; cv=none; b=RCNsFIC3BzHkPj8XYErGgbAJfy4jCwkpBhHgvfrFAbMQNrmnwaq7PjQij9tdkvYdxGl18BsDN9DuKIycJ0TvjsoGtXkWAWPPZYOkIzBfAMSGhUfUHRpnibwQmhuAh/tbOwg1yQahW09uo5xtAlPlwygIM2/y9xak93Zih4YBlec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750267171; c=relaxed/simple;
	bh=nUGiUUynl+sNOQJCkHEjn5jGhqAKwlYMEfKw7xWAX0E=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMD8M0i2mCKKTMIdOQ7IhCfgQdy/wIj7hJ0hhRcYfLwbp7PUAlbzQ0ymfjaP9zIj3EHZOMlRRFmMuY9qq8HzeDqfaM4NJkvWUro0+miQxoTh/1AUUxrfu+5zevnlGtXtK8bngTtYD4NyS0y9HCH6S9LdPPxbO9ac0doVcZoWR/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLVo5ZBv; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLVo5ZBv"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32b2f5d91c8so57600831fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750267167; x=1750871967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WpR+OcTrcx45Fz6S03n2ctoKcqhnRovsqGceCO+AYd8=;
        b=hLVo5ZBv5h45Gld/+G5Cmgiyv4eGgUtMT6K8DmEEWkQEbYJHVv320mTpJy4gNm4+dX
         Ka/mnE1zgUJagcE3//XQupU+1VZX28Wcspcgr6QnaUgtgX9PBk19lFdleI6uaa91FjhO
         QPzqRz/qt8EuRDDhyKP1CYppc9BM7bGO2qZSezawxD5gZCq1rT9DXkDSRQM1y8iVJKxQ
         Gw2ZAnbQDg1Bsm2gV1Y/2EXCjUQHwFXcOnYmcaCsvEyjzaYHlynbwtPmDOjP6yQBXSkT
         J3WTdY91KYwWtrdHLN6w3TyEksXhLNyPFx2f6B/tHN+TwwN/XL2c4w1slSl58ZNOOulK
         LTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750267167; x=1750871967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpR+OcTrcx45Fz6S03n2ctoKcqhnRovsqGceCO+AYd8=;
        b=U/nJPafBrnrbQ3fhS7daMZtOznZGwqqbzXGhQdstse8yOHET9+hRPM8le2hsccZBCB
         PiRuP0kwXhB+sIuzhooVD6FdvIAKPMaTFMgKWzxBk3UHKT9QrA/9qFxhxDBllMgfQI23
         Rjr4GYOiGUChsaIUNLmeT3k9No2rAdT3QMmW1dDptRuUN55Oxl0YmukQetOhbzFa9ap+
         kL5NcZaZjYTXcwig/SjJsDB+vYRAJl54bCyLflR4SnPxK2M46yR2Mtv0nPCTOOyt6kuO
         ZXmhe9P7om9+GUO8rGqaaOmX10vyBVR5hFMonVGsNZ/GLCqBKlBq+PH8SksBCEmgriOj
         CghA==
X-Forwarded-Encrypted: i=1; AJvYcCUePEoIoQl5acls8IeWitqJVk4nQV+/6Qd28P/JxcY92oDhyTV61Q84hqWeDx61WXIRmze5hF/8jBMzFis=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCWmzKGdyK3zn4+PHbT2agtfjNdqcpqImMcAEj/XmKDnqbde2h
	tiTBPem4GDNjze+t6pMtrW5dxfu6y8t4TXMxXZ3DcxIZaoPO1M0hxOtM
X-Gm-Gg: ASbGncvx3GpW3kesNcjj5dSSbQ8vIMV5btZs4G0N/4LlO4OXKZkbpT6uOi8kmup1vN9
	I+8xiF34BrQCm/tJMbb0zMu5FhO37eB/6AyKoczLqWsee//lLnjxXLRP/uCZ8d9alSF1JAZFlUM
	ezELvMmjVd1Y0Dm+/4pAzYBD1RO072CIXDQGIyHzDKLT72t4/uHKJU/BZPM/AA95oLTNmwLW6b2
	6IYaTMntsniAtqlE4kgmT7u8t/TQpWhb5WBrk3RVtFgS7w6sUPo768763zl3zaTabOemGrJo6/R
	EmQWEAds783v0StPMR9L+WCdJNeACItInHmkMVWPCiOQrCUZGTU7xbpGUDT5WumXLWtipGaBBN0
	DBAEqi9Z16Wo=
X-Google-Smtp-Source: AGHT+IExY1E59LPFVKc5mfbs10Pk0s2C7jJwO65JR1+JB9tmKwmJ0N0+EA/E0W1886bcGtXU24Ygvg==
X-Received: by 2002:a05:651c:2203:b0:32b:47be:e1bd with SMTP id 38308e7fff4ca-32b4a2d7388mr57877351fa.6.1750267166759;
        Wed, 18 Jun 2025 10:19:26 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3307aebcsm23376581fa.40.2025.06.18.10.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:19:25 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 18 Jun 2025 19:19:23 +0200
To: Dev Jain <dev.jain@arm.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
	will@kernel.org, anshuman.khandual@arm.com,
	quic_zhenhuah@quicinc.com, kevin.brodsky@arm.com,
	yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
Message-ID: <aFL1G91dDtDtMMon@pc636>
References: <20250616103310.17625-1-dev.jain@arm.com>
 <d0b17ac1-32e1-4086-97ec-1d70c1ac62e6@arm.com>
 <ed2df0cc-e02c-4376-af7a-7deac6efa9b4@arm.com>
 <aFFWw4O2PjOScWld@pc636>
 <910e8622-2755-4aca-b17e-0ec8a18a7f1a@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <910e8622-2755-4aca-b17e-0ec8a18a7f1a@arm.com>

On Wed, Jun 18, 2025 at 08:41:36AM +0530, Dev Jain wrote:
> 
> On 17/06/25 5:21 pm, Uladzislau Rezki wrote:
> > On Mon, Jun 16, 2025 at 10:20:29PM +0100, Ryan Roberts wrote:
> > > On 16/06/2025 19:07, Ryan Roberts wrote:
> > > > On 16/06/2025 11:33, Dev Jain wrote:
> > > > > arm64 disables vmalloc-huge when kernel page table dumping is enabled,
> > > > > because an intermediate table may be removed, potentially causing the
> > > > > ptdump code to dereference an invalid address. We want to be able to
> > > > > analyze block vs page mappings for kernel mappings with ptdump, so to
> > > > > enable vmalloc-huge with ptdump, synchronize between page table removal in
> > > > > pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
> > > > > use mmap_read_lock and not write lock because we don't need to synchronize
> > > > > between two different vm_structs; two vmalloc objects running this same
> > > > > code path will point to different page tables, hence there is no race.
> > > > > 
> > > > > For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
> > > > > 512 times again via pmd_free_pte_page().
> > > > > 
> > > > > We implement the locking mechanism using static keys, since the chance
> > > > > of a race is very small. Observe that the synchronization is needed
> > > > > to avoid the following race:
> > > > > 
> > > > > CPU1							CPU2
> > > > > 						take reference of PMD table
> > > > > pud_clear()
> > > > > pte_free_kernel()
> > > > > 						walk freed PMD table
> > > > > 
> > > > > and similar race between pmd_free_pte_page and ptdump_walk_pgd.
> > > > > 
> > > > > Therefore, there are two cases: if ptdump sees the cleared PUD, then
> > > > > we are safe. If not, then the patched-in read and write locks help us
> > > > > avoid the race.
> > > > > 
> > > > > To implement the mechanism, we need the static key access from mmu.c and
> > > > > ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
> > > > > target in the Makefile, therefore we cannot initialize the key there, as
> > > > > is being done, for example, in the static key implementation of
> > > > > hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
> > > > > the jump_label mechanism. Declare the key there and define the key to false
> > > > > in mmu.c.
> > > > > 
> > > > > No issues were observed with mm-selftests. No issues were observed while
> > > > > parallelly running test_vmalloc.sh and dumping the kernel pagetable through
> > > > > sysfs in a loop.
> > > > > 
> > > > > v2->v3:
> > > > >   - Use static key mechanism
> > > > > 
> > > > > v1->v2:
> > > > >   - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
> > > > >   - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
> > > > >     the lock 512 times again via pmd_free_pte_page()
> > > > > 
> > > > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > > > ---
> > > > >   arch/arm64/include/asm/cpufeature.h |  1 +
> > > > >   arch/arm64/mm/mmu.c                 | 51 ++++++++++++++++++++++++++---
> > > > >   arch/arm64/mm/ptdump.c              |  5 +++
> > > > >   3 files changed, 53 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> > > > > index c4326f1cb917..3e386563b587 100644
> > > > > --- a/arch/arm64/include/asm/cpufeature.h
> > > > > +++ b/arch/arm64/include/asm/cpufeature.h
> > > > > @@ -26,6 +26,7 @@
> > > > >   #include <linux/kernel.h>
> > > > >   #include <linux/cpumask.h>
> > > > > +DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
> > > > >   /*
> > > > >    * CPU feature register tracking
> > > > >    *
> > > > > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > > > > index 8fcf59ba39db..e242ba428820 100644
> > > > > --- a/arch/arm64/mm/mmu.c
> > > > > +++ b/arch/arm64/mm/mmu.c
> > > > > @@ -41,11 +41,14 @@
> > > > >   #include <asm/tlbflush.h>
> > > > >   #include <asm/pgalloc.h>
> > > > >   #include <asm/kfence.h>
> > > > > +#include <asm/cpufeature.h>
> > > > >   #define NO_BLOCK_MAPPINGS	BIT(0)
> > > > >   #define NO_CONT_MAPPINGS	BIT(1)
> > > > >   #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
> > > > > +DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
> > > > > +
> > > > >   enum pgtable_type {
> > > > >   	TABLE_PTE,
> > > > >   	TABLE_PMD,
> > > > > @@ -1267,8 +1270,9 @@ int pmd_clear_huge(pmd_t *pmdp)
> > > > >   	return 1;
> > > > >   }
> > > > > -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> > > > > +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
> > > > >   {
> > > > > +	bool lock_taken = false;
> > > > >   	pte_t *table;
> > > > >   	pmd_t pmd;
> > > > > @@ -1279,15 +1283,29 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> > > > >   		return 1;
> > > > >   	}
> > > > > +	/* See comment in pud_free_pmd_page for static key logic */
> > > > >   	table = pte_offset_kernel(pmdp, addr);
> > > > >   	pmd_clear(pmdp);
> > > > >   	__flush_tlb_kernel_pgtable(addr);
> > > > > +	if (static_branch_unlikely(&ptdump_lock_key) && lock) {
> > > > > +		mmap_read_lock(&init_mm);
> > > > > +		lock_taken = true;
> > > > > +	}
> > > > > +	if (unlikely(lock_taken))
> > > > > +		mmap_read_unlock(&init_mm);
> > > > > +
> > > > >   	pte_free_kernel(NULL, table);
> > > > >   	return 1;
> > > > >   }
> > > > > +int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> > > > > +{
> > > > > +	return __pmd_free_pte_page(pmdp, addr, true);
> > > > > +}
> > > > > +
> > > > >   int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
> > > > >   {
> > > > > +	bool lock_taken = false;
> > > > >   	pmd_t *table;
> > > > >   	pmd_t *pmdp;
> > > > >   	pud_t pud;
> > > > > @@ -1301,15 +1319,40 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
> > > > >   	}
> > > > >   	table = pmd_offset(pudp, addr);
> > > > > +	/*
> > > > > +	 * Isolate the PMD table; in case of race with ptdump, this helps
> > > > > +	 * us to avoid taking the lock in __pmd_free_pte_page().
> > > > > +	 *
> > > > > +	 * Static key logic:
> > > > > +	 *
> > > > > +	 * Case 1: If ptdump does static_branch_enable(), and after that we
> > > > > +	 * execute the if block, then this patches in the read lock, ptdump has
> > > > > +	 * the write lock patched in, therefore ptdump will never read from
> > > > > +	 * a potentially freed PMD table.
> > > > > +	 *
> > > > > +	 * Case 2: If the if block starts executing before ptdump's
> > > > > +	 * static_branch_enable(), then no locking synchronization
> > > > > +	 * will be done. However, pud_clear() + the dsb() in
> > > > > +	 * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
> > > > > +	 * empty PUD. Thus, it will never walk over a potentially freed
> > > > > +	 * PMD table.
> > > > > +	 */
> > > > > +	pud_clear(pudp);
> > > > How can this possibly be correct; you're clearing the pud without any
> > > > synchronisation. So you could have this situation:
> > > > 
> > > > CPU1 (vmalloc)			CPU2 (ptdump)
> > > > 
> > > > 				static_branch_enable()
> > > > 				  mmap_write_lock()
> > > > 				    pud = pudp_get()
> > > > pud_free_pmd_page()
> > > >    pud_clear()
> > > > 				    access the table pointed to by pud
> > > > 				    BANG!
> > > > 
> > > > Surely the logic needs to be:
> > > > 
> > > > 	if (static_branch_unlikely(&ptdump_lock_key)) {
> > > > 		mmap_read_lock(&init_mm);
> > > > 		lock_taken = true;
> > > > 	}
> > > > 	pud_clear(pudp);
> > > > 	if (unlikely(lock_taken))
> > > > 		mmap_read_unlock(&init_mm);
> > > > 
> > > > That fixes your first case, I think? But doesn't fix your second case. You could
> > > > still have:
> > > > 
> > > > CPU1 (vmalloc)			CPU2 (ptdump)
> > > > 
> > > > pud_free_pmd_page()
> > > >    <ptdump_lock_key=FALSE>
> > > > 				static_branch_enable()
> > > > 				  mmap_write_lock()
> > > > 				    pud = pudp_get()
> > > >    pud_clear()
> > > > 				    access the table pointed to by pud
> > > > 				    BANG!
> > > > 
> > > > I think what you need is some sort of RCU read-size critical section in the
> > > > vmalloc side that you can then synchonize on in the ptdump side. But you would
> > > > need to be in the read side critical section when you sample the static key, but
> > > > you can't sleep waiting for the mmap lock while in the critical section. This
> > > > feels solvable, and there is almost certainly a well-used pattern, but I'm not
> > > > quite sure what the answer is. Perhaps others can help...
> > > Just taking a step back here, I found the "percpu rw semaphore". From the
> > > documentation:
> > > 
> > > """
> > > Percpu rw semaphores is a new read-write semaphore design that is
> > > optimized for locking for reading.
> > > 
> > > The problem with traditional read-write semaphores is that when multiple
> > > cores take the lock for reading, the cache line containing the semaphore
> > > is bouncing between L1 caches of the cores, causing performance
> > > degradation.
> > > 
> > > Locking for reading is very fast, it uses RCU and it avoids any atomic
> > > instruction in the lock and unlock path. On the other hand, locking for
> > > writing is very expensive, it calls synchronize_rcu() that can take
> > > hundreds of milliseconds.
> > > """
> > > 
> > > Perhaps this provides the properties we are looking for? Could just define one
> > > of these and lock it in read mode around pXd_clear() on the vmalloc side. Then
> > > lock it in write mode around ptdump_walk_pgd() on the ptdump side. No need for
> > > static key or other hoops. Given its a dedicated lock, there is no risk of
> > > accidental contention because no other code is using it.
> > > 
> > Write-lock indeed is super expensive, as you noted it blocks on
> > synchronize_rcu(). If that write-lock interferes with a critical
> > vmalloc fast path, where a read-lock could be injected, then it
> > is definitely a problem.
> 
> I have a question - is this pmd_free_pte_page/pud_free_pmd_page part of
> a fast path?
>
<snip>
vmalloc()
__vmalloc_node_range_noprof()
  __vmalloc_area_node()
    vmap_pages_range();
      vmap_pages_range_noflush()
        __vmap_pages_range_noflush()
          vmap_range_noflush()
            vmap_p4d_range()
              vmap_try_huge_p4d()
	            if (p4d_present(*p4d) && !p4d_free_pud_page(p4d, addr))
<snip>

The point is, we would like to avoid any long-sleeping primitive or
introduce any new bottle-necks which makes the vmalloc less scalable
or slower.

I reacted on the synchronize_rcu() and rw-semaphores because it makes
the current context to enter into sleeping state, i.e. waiting on the
wait_for_completion(). Also, we would like to exclude any sleeping if
possible at all, for example GFP_ATOMIC and GFP_NOWAIT flags support,
where i look at currently.

--
Uladzislau Rezki
