Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D60C2FEE03
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750267200; cv=none; b=D+SArQZHms/TIY+xjAQk1cPXRYp/rzxWpVJ6wP0Ko1Q11cRZVobuKj6OLb4LkX567eYNFuy7IZCYkRFsL0rrt1uug1gWrwTAwdfOEs1POHfyKZc7tL+y1s5HIxx/l0F5/T70D3XCObixrbx0gCd2k5Hin3I6g+GdqzsIU0tBdR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750267200; c=relaxed/simple;
	bh=f++x1XIBxcnH3WHjkbWjPsKOkJChOobpoi4tsBVeGZ0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nuyj+x3UdwxVzhdX960OD6YsuOehvniG7qIPhm78r23gtY0CMA4HhROnaN1rZQlovZ0hLyMwEcE/AYg+rw74888F9C96pQw24uvYCJdONNkTxuSxX0xHM+eBrOpIvT1GuMiV0OTcXEA4nxZYEG8C4g2WQMmZnnZa0oLJEp7WaFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8ST4GTB; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8ST4GTB"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553b6a349ccso4847780e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750267196; x=1750871996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5fICVGUj4ZciPJ7mvCj/PmWXVkMwth4yRgzimN23W/M=;
        b=G8ST4GTByEvqgFDADIG8heLLcnOFgZFoU9W7fLO2CRbRPBtv2P+seaBe3GkrYyT5A5
         I9k+zXKqtapkQhsXO1JZjwzNBcmWYF4ecFSSgqFitwkloB7wBhAxGMW88OaJpOvhXbmb
         Jh5FFn53ucNMqfgPFtPxEOSTlgIUGA6mFmQPqPQ648MQsK9VYwStGXqRWdn5KJrH89va
         NOZt/UVPu76CPfWEeV2+dLx895NcpxDZZV/U6g2UMpAH/dtCgpkhCaQ/uGngmld77mAA
         z+WMe/20baivFZCmkHaTyzVGu7inR5zNQzN+SfCYntT+7mCVCkF86rOCeoP4MnL1B6Ux
         GrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750267196; x=1750871996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fICVGUj4ZciPJ7mvCj/PmWXVkMwth4yRgzimN23W/M=;
        b=R0FJzik/teNR+JZVkS/v7gq2xeD+RpH4apbOq7CvKjlInvqXfYuEkO5OtvHzo/ATMF
         PTsmpg4YTERVJIEZcFYqYtiWsEb5ktqEUmN+oaKgeC4rGgolh+Bvi5jby9C0HF2KGVxV
         trR3R0PTpjIwP1eTCfp3oA/t0Tq0RjCra7gCcyydmXQ9PTrxq3yPWq0fEi6ji5S/qH/U
         0FTcTjX88Lrx5agy6/kgrX8qWYDgNu9eo9BfIinyDlI0jimSibeGpANfZM9Cl6YZlCWR
         W3HShGS1FM3ybQtvDrQfft7bAM3epqu0WvqR3QcdcAD6YUx0SovEa3aBa2/R1f4xCcbX
         x4eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX60ihfOx+T49kR7l+DRJfh32/jAOK/3p5xHenXHhQYem3hRNjjTnunFd6OL5xibIMAXZ2lxVe0iUigw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDf2T4fBzYL2W+S0eN2X9tFmFotkvqK4ILyhBLnUxwYfJ77Jkq
	QNWidaq16uRPusokzAajghLHnSXdam1HlofeEWVFAUePQYOedVLE5srM
X-Gm-Gg: ASbGncvzE9PCax1g0mjqNgVCyWviQiSV5iL9F5X++573NctC4VxJmGwrEgkfdDgonx7
	7mVxL5722dSm1aV/GfbQsoAQTQeB1Ci6lbrKHxb3zGvxeYlm7vE/jfeGRUOj8hnBLyse/1bFS3b
	TwZlAkb6Bq6lec4j/mqOKDYxKJofhDnYxxKsBT+ujkA5Ej5KISWcaPZz3VhUh0XqORJlXXxPkMU
	FfcYvyuOGA6VzpXNav2yZyYMsH7AwVoofv3PvP+lXbTSI0idF33HjJ4s9OEpZxhgAeqye6DeGQX
	tmXkhk7p4noE8TYdBN6OO83ppardS2CcdY1a/3YIf6cMleestIi5nBVk99LyIYmrBC+K3s651JO
	1sl2PPai0iJ4=
X-Google-Smtp-Source: AGHT+IGeTB187BiVB/r3aWXG7/r9waMt9yZG6RIm+hM86FBPPOEg0kE3qM4eFuBD7K/DXfKECK2NXA==
X-Received: by 2002:a05:6512:3ca4:b0:553:2c92:a867 with SMTP id 2adb3069b0e04-553b6f6f32dmr4688134e87.55.1750267196026;
        Wed, 18 Jun 2025 10:19:56 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ca1a77f1sm685889e87.155.2025.06.18.10.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:19:55 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 18 Jun 2025 19:19:52 +0200
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>,
	catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
	quic_zhenhuah@quicinc.com, kevin.brodsky@arm.com,
	yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
Message-ID: <aFL1OFy3OPzW_BRk@pc636>
References: <20250616103310.17625-1-dev.jain@arm.com>
 <d0b17ac1-32e1-4086-97ec-1d70c1ac62e6@arm.com>
 <ed2df0cc-e02c-4376-af7a-7deac6efa9b4@arm.com>
 <aFFWw4O2PjOScWld@pc636>
 <351c113c-d658-4cf6-9e5c-441b1c96bf17@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <351c113c-d658-4cf6-9e5c-441b1c96bf17@arm.com>

On Wed, Jun 18, 2025 at 12:21:48PM +0100, Ryan Roberts wrote:
> On 17/06/2025 12:51, Uladzislau Rezki wrote:
> > On Mon, Jun 16, 2025 at 10:20:29PM +0100, Ryan Roberts wrote:
> >> On 16/06/2025 19:07, Ryan Roberts wrote:
> >>> On 16/06/2025 11:33, Dev Jain wrote:
> >>>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
> >>>> because an intermediate table may be removed, potentially causing the
> >>>> ptdump code to dereference an invalid address. We want to be able to
> >>>> analyze block vs page mappings for kernel mappings with ptdump, so to
> >>>> enable vmalloc-huge with ptdump, synchronize between page table removal in
> >>>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
> >>>> use mmap_read_lock and not write lock because we don't need to synchronize
> >>>> between two different vm_structs; two vmalloc objects running this same
> >>>> code path will point to different page tables, hence there is no race.
> >>>>
> >>>> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
> >>>> 512 times again via pmd_free_pte_page().
> >>>>
> >>>> We implement the locking mechanism using static keys, since the chance
> >>>> of a race is very small. Observe that the synchronization is needed
> >>>> to avoid the following race:
> >>>>
> >>>> CPU1							CPU2
> >>>> 						take reference of PMD table
> >>>> pud_clear()
> >>>> pte_free_kernel()
> >>>> 						walk freed PMD table
> >>>>
> >>>> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
> >>>>
> >>>> Therefore, there are two cases: if ptdump sees the cleared PUD, then
> >>>> we are safe. If not, then the patched-in read and write locks help us
> >>>> avoid the race.
> >>>>
> >>>> To implement the mechanism, we need the static key access from mmu.c and
> >>>> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
> >>>> target in the Makefile, therefore we cannot initialize the key there, as
> >>>> is being done, for example, in the static key implementation of
> >>>> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
> >>>> the jump_label mechanism. Declare the key there and define the key to false
> >>>> in mmu.c.
> >>>>
> >>>> No issues were observed with mm-selftests. No issues were observed while
> >>>> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
> >>>> sysfs in a loop.
> >>>>
> >>>> v2->v3:
> >>>>  - Use static key mechanism
> >>>>
> >>>> v1->v2:
> >>>>  - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
> >>>>  - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
> >>>>    the lock 512 times again via pmd_free_pte_page()
> >>>>
> >>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> >>>> ---
> >>>>  arch/arm64/include/asm/cpufeature.h |  1 +
> >>>>  arch/arm64/mm/mmu.c                 | 51 ++++++++++++++++++++++++++---
> >>>>  arch/arm64/mm/ptdump.c              |  5 +++
> >>>>  3 files changed, 53 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> >>>> index c4326f1cb917..3e386563b587 100644
> >>>> --- a/arch/arm64/include/asm/cpufeature.h
> >>>> +++ b/arch/arm64/include/asm/cpufeature.h
> >>>> @@ -26,6 +26,7 @@
> >>>>  #include <linux/kernel.h>
> >>>>  #include <linux/cpumask.h>
> >>>>  
> >>>> +DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
> >>>>  /*
> >>>>   * CPU feature register tracking
> >>>>   *
> >>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> >>>> index 8fcf59ba39db..e242ba428820 100644
> >>>> --- a/arch/arm64/mm/mmu.c
> >>>> +++ b/arch/arm64/mm/mmu.c
> >>>> @@ -41,11 +41,14 @@
> >>>>  #include <asm/tlbflush.h>
> >>>>  #include <asm/pgalloc.h>
> >>>>  #include <asm/kfence.h>
> >>>> +#include <asm/cpufeature.h>
> >>>>  
> >>>>  #define NO_BLOCK_MAPPINGS	BIT(0)
> >>>>  #define NO_CONT_MAPPINGS	BIT(1)
> >>>>  #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
> >>>>  
> >>>> +DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
> >>>> +
> >>>>  enum pgtable_type {
> >>>>  	TABLE_PTE,
> >>>>  	TABLE_PMD,
> >>>> @@ -1267,8 +1270,9 @@ int pmd_clear_huge(pmd_t *pmdp)
> >>>>  	return 1;
> >>>>  }
> >>>>  
> >>>> -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> >>>> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
> >>>>  {
> >>>> +	bool lock_taken = false;
> >>>>  	pte_t *table;
> >>>>  	pmd_t pmd;
> >>>>  
> >>>> @@ -1279,15 +1283,29 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> >>>>  		return 1;
> >>>>  	}
> >>>>  
> >>>> +	/* See comment in pud_free_pmd_page for static key logic */
> >>>>  	table = pte_offset_kernel(pmdp, addr);
> >>>>  	pmd_clear(pmdp);
> >>>>  	__flush_tlb_kernel_pgtable(addr);
> >>>> +	if (static_branch_unlikely(&ptdump_lock_key) && lock) {
> >>>> +		mmap_read_lock(&init_mm);
> >>>> +		lock_taken = true;
> >>>> +	}
> >>>> +	if (unlikely(lock_taken))
> >>>> +		mmap_read_unlock(&init_mm);
> >>>> +
> >>>>  	pte_free_kernel(NULL, table);
> >>>>  	return 1;
> >>>>  }
> >>>>  
> >>>> +int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> >>>> +{
> >>>> +	return __pmd_free_pte_page(pmdp, addr, true);
> >>>> +}
> >>>> +
> >>>>  int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
> >>>>  {
> >>>> +	bool lock_taken = false;
> >>>>  	pmd_t *table;
> >>>>  	pmd_t *pmdp;
> >>>>  	pud_t pud;
> >>>> @@ -1301,15 +1319,40 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
> >>>>  	}
> >>>>  
> >>>>  	table = pmd_offset(pudp, addr);
> >>>> +	/*
> >>>> +	 * Isolate the PMD table; in case of race with ptdump, this helps
> >>>> +	 * us to avoid taking the lock in __pmd_free_pte_page().
> >>>> +	 *
> >>>> +	 * Static key logic:
> >>>> +	 *
> >>>> +	 * Case 1: If ptdump does static_branch_enable(), and after that we
> >>>> +	 * execute the if block, then this patches in the read lock, ptdump has
> >>>> +	 * the write lock patched in, therefore ptdump will never read from
> >>>> +	 * a potentially freed PMD table.
> >>>> +	 *
> >>>> +	 * Case 2: If the if block starts executing before ptdump's
> >>>> +	 * static_branch_enable(), then no locking synchronization
> >>>> +	 * will be done. However, pud_clear() + the dsb() in
> >>>> +	 * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
> >>>> +	 * empty PUD. Thus, it will never walk over a potentially freed
> >>>> +	 * PMD table.
> >>>> +	 */
> >>>> +	pud_clear(pudp);
> >>>
> >>> How can this possibly be correct; you're clearing the pud without any
> >>> synchronisation. So you could have this situation:
> >>>
> >>> CPU1 (vmalloc)			CPU2 (ptdump)
> >>>
> >>> 				static_branch_enable()
> >>> 				  mmap_write_lock()
> >>> 				    pud = pudp_get()
> >>> pud_free_pmd_page()
> >>>   pud_clear()
> >>> 				    access the table pointed to by pud
> >>> 				    BANG!
> >>>
> >>> Surely the logic needs to be:
> >>>
> >>> 	if (static_branch_unlikely(&ptdump_lock_key)) {
> >>> 		mmap_read_lock(&init_mm);
> >>> 		lock_taken = true;
> >>> 	}
> >>> 	pud_clear(pudp);
> >>> 	if (unlikely(lock_taken))
> >>> 		mmap_read_unlock(&init_mm);
> >>>
> >>> That fixes your first case, I think? But doesn't fix your second case. You could
> >>> still have:
> >>>
> >>> CPU1 (vmalloc)			CPU2 (ptdump)
> >>>
> >>> pud_free_pmd_page()
> >>>   <ptdump_lock_key=FALSE>
> >>> 				static_branch_enable()
> >>> 				  mmap_write_lock()
> >>> 				    pud = pudp_get()
> >>>   pud_clear()
> >>> 				    access the table pointed to by pud
> >>> 				    BANG!
> >>>
> >>> I think what you need is some sort of RCU read-size critical section in the
> >>> vmalloc side that you can then synchonize on in the ptdump side. But you would
> >>> need to be in the read side critical section when you sample the static key, but
> >>> you can't sleep waiting for the mmap lock while in the critical section. This
> >>> feels solvable, and there is almost certainly a well-used pattern, but I'm not
> >>> quite sure what the answer is. Perhaps others can help...
> >>
> >> Just taking a step back here, I found the "percpu rw semaphore". From the
> >> documentation:
> >>
> >> """
> >> Percpu rw semaphores is a new read-write semaphore design that is
> >> optimized for locking for reading.
> >>
> >> The problem with traditional read-write semaphores is that when multiple
> >> cores take the lock for reading, the cache line containing the semaphore
> >> is bouncing between L1 caches of the cores, causing performance
> >> degradation.
> >>
> >> Locking for reading is very fast, it uses RCU and it avoids any atomic
> >> instruction in the lock and unlock path. On the other hand, locking for
> >> writing is very expensive, it calls synchronize_rcu() that can take
> >> hundreds of milliseconds.
> >> """
> >>
> >> Perhaps this provides the properties we are looking for? Could just define one
> >> of these and lock it in read mode around pXd_clear() on the vmalloc side. Then
> >> lock it in write mode around ptdump_walk_pgd() on the ptdump side. No need for
> >> static key or other hoops. Given its a dedicated lock, there is no risk of
> >> accidental contention because no other code is using it.
> >>
> > Write-lock indeed is super expensive, as you noted it blocks on
> > synchronize_rcu(). If that write-lock interferes with a critical
> > vmalloc fast path, where a read-lock could be injected, then it
> > is definitely a problem. 
> > 
> > I have not analysed this patch series. I need to have a look what
> > "ptdump" does.
> 
> ptdump is the kernel page table dumper. It is only invoked when a privileged
> user reads from a debugfs file. This is debug functionality only. It's
> acceptable for the write side to be slow.
> 
> Regardless, I've backtracked on my original review... I actually think Dev's
> approach with the static key is the correct approach here. It means that there
> is zero overhead for the common case of nobody actively dumping kernel page
> tables but it also makes the table removal operation safe in the presence of ptdump.
> 
OK, thank you!

--
Uladzislau Rezki
