Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44428226CFE
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751102579; cv=none; b=NT/AGUUj+jjYcbpEYriu6hOnu3sbvvEyHHE7WdjBtEKLLvg31LUhlSE0LVlgng7PVmAUeCcS2XNigEjF3tOEd8RE+3xqW3v950pC2CpHsvulygn/JJVGLBLFSNE1EZA3XonAMeNZUR43qQW+dzYgGgNufCOf1xUszvUZJ9vf2P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751102579; c=relaxed/simple;
	bh=URabXHkWw3ucLyowMEU/s+xBJejFz+0erLMzfXXaWb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKlB5jPX6b18WR5/6t2tI3naFPOo/LPc1hbXScSglf26zeAMULL02ddk7bv5byEfSE/6ObMwelGOSPqvXE+M0tfPK4C99IGSKseIo/PY5UmNxt6bdJe6anP/3QZBV91G7agXRpDP0XGdWN2AsS5EPDNDu9zY8XGgLcWBzblkwZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Pd9XYtPe; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Pd9XYtPe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=693MlWJ61uxijMUbnkYXkKhrPyrAVHlch5h6TgPEw7k=; b=Pd9XYtPev3giPO2txZwtfE5rcH
	S90bIBFEbJYcB1iitQjDqzlLMevzgkU/wrFSDN+nPPxyfjmpiAOpNZsXrPKEQ9IXB8sb+Q3l6sHTB
	F+ZjjQN13QPswQeeEzIXDSN63gSoPdqsFHqMKv+jK049ePp9miiv8x77MZ74Xb64diECW7BqJhF77
	Y1eoLBhaIi+H8toiw/m0Hf4inJuN68LBYIaA5Tg0hI8bw+tXn2XoudyB0nGjJ7a7L+SUWrTlHjVX4
	db35uI6AsYNAM+/COP6cm57BMdOa82aQ0n21hnx/QguoSkuWbn3hfA9AP9HtZQitB+Rk7qdMBDDPV
	b5y0VdsA==;
Received: from 106-64-168-26.adsl.fetnet.net ([106.64.168.26] helo=[192.168.238.43])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uVRlc-009iHY-Sk; Sat, 28 Jun 2025 11:22:37 +0200
Message-ID: <e8287af7-08bd-491c-bca8-70af107e0fea@igalia.com>
Date: Sat, 28 Jun 2025 17:22:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] mm,hugetlb: Change mechanism to detect a COW on
 private mapping
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Muchun Song
 <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250627102904.107202-1-osalvador@suse.de>
 <20250627102904.107202-2-osalvador@suse.de>
Content-Language: en-US
From: Gavin Guo <gavinguo@igalia.com>
In-Reply-To: <20250627102904.107202-2-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oscar,

On 6/27/25 18:29, Oscar Salvador wrote:
> hugetlb_wp() checks whether the process is trying to COW on a private mapping
> in order to know whether the reservation for that address was already consumed
> or not.
> If it was consumed and we are the ownner of the mapping, the folio will have to
> be unmapped from the other processes.
> 
> Currently, that check is done by looking up the folio in the pagecache and
> compare it to the folio which is mapped in our pagetables.
> If it differs, it means we already mapped it privately before, consuming a
> reservation on the way.
> All we are interested in is whether the mapped folio is anonymous, so we can
> simplify and check for that instead.
> 
> Also, we transition from a trylock to a folio_lock, since the former was only
> needed when hugetlb_fault() had to lock both folios, in order to avoid deadlock.
> 
> Fixes: 40549ba8f8e0 ("hugetlb: use new vma_lock for pmd sharing synchronization")
> Reported-by: Gavin Guo <gavinguo@igalia.com>
> Closes: https://lore.kernel.org/lkml/20250513093448.592150-1-gavinguo@igalia.com/
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Suggested-by: Peter Xu <peterx@redhat.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---
>   mm/hugetlb.c | 82 +++++++++++++++-------------------------------------
>   1 file changed, 24 insertions(+), 58 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 8746ed2fec13..87f2d8acdc8a 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6152,8 +6152,7 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
>    * cannot race with other handlers or page migration.
>    * Keep the pte_same checks anyway to make transition from the mutex easier.
>    */
> -static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
> -		       struct vm_fault *vmf)
> +static vm_fault_t hugetlb_wp(struct vm_fault *vmf)
>   {
>   	struct vm_area_struct *vma = vmf->vma;
>   	struct mm_struct *mm = vma->vm_mm;
> @@ -6215,16 +6214,17 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
>   		       PageAnonExclusive(&old_folio->page), &old_folio->page);
>   
>   	/*
> -	 * If the process that created a MAP_PRIVATE mapping is about to
> -	 * perform a COW due to a shared page count, attempt to satisfy
> -	 * the allocation without using the existing reserves. The pagecache
> -	 * page is used to determine if the reserve at this address was
> -	 * consumed or not. If reserves were used, a partial faulted mapping
> -	 * at the time of fork() could consume its reserves on COW instead
> -	 * of the full address range.
> +	 * If the process that created a MAP_PRIVATE mapping is about to perform
> +	 * a COW due to a shared page count, attempt to satisfy the allocation
> +	 * without using the existing reserves.
> +	 * In order to determine where this is a COW on a MAP_PRIVATE mapping it
> +	 * is enough to check whether the old_folio is anonymous. This means that
> +	 * the reserve for this address was consumed. If reserves were used, a
> +	 * partial faulted mapping at the fime of fork() could consume its reserves
> +	 * on COW instead of the full address range.
>   	 */
>   	if (is_vma_resv_set(vma, HPAGE_RESV_OWNER) &&
> -			old_folio != pagecache_folio)
> +	    folio_test_anon(old_folio))
>   		cow_from_owner = true;
>   
>   	folio_get(old_folio);
> @@ -6603,7 +6603,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
>   	hugetlb_count_add(pages_per_huge_page(h), mm);
>   	if ((vmf->flags & FAULT_FLAG_WRITE) && !(vma->vm_flags & VM_SHARED)) {
>   		/* Optimization, do the COW without a second fault */
> -		ret = hugetlb_wp(folio, vmf);
> +		ret = hugetlb_wp(vmf);
>   	}
>   
>   	spin_unlock(vmf->ptl);
> @@ -6671,10 +6671,8 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>   	vm_fault_t ret;
>   	u32 hash;
>   	struct folio *folio = NULL;
> -	struct folio *pagecache_folio = NULL;
>   	struct hstate *h = hstate_vma(vma);
>   	struct address_space *mapping;
> -	int need_wait_lock = 0;
>   	struct vm_fault vmf = {
>   		.vma = vma,
>   		.address = address & huge_page_mask(h),
> @@ -6769,8 +6767,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>   	 * If we are going to COW/unshare the mapping later, we examine the
>   	 * pending reservations for this page now. This will ensure that any
>   	 * allocations necessary to record that reservation occur outside the
> -	 * spinlock. Also lookup the pagecache page now as it is used to
> -	 * determine if a reservation has been consumed.
> +	 * spinlock.
>   	 */
>   	if ((flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) &&
>   	    !(vma->vm_flags & VM_MAYSHARE) && !huge_pte_write(vmf.orig_pte)) {
> @@ -6780,11 +6777,6 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>   		}
>   		/* Just decrements count, does not deallocate */
>   		vma_end_reservation(h, vma, vmf.address);
> -
> -		pagecache_folio = filemap_lock_hugetlb_folio(h, mapping,
> -							     vmf.pgoff);
> -		if (IS_ERR(pagecache_folio))
> -			pagecache_folio = NULL;
>   	}
>   
>   	vmf.ptl = huge_pte_lock(h, mm, vmf.pte);
> @@ -6798,10 +6790,6 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>   	    (flags & FAULT_FLAG_WRITE) && !huge_pte_write(vmf.orig_pte)) {
>   		if (!userfaultfd_wp_async(vma)) {
>   			spin_unlock(vmf.ptl);
> -			if (pagecache_folio) {
> -				folio_unlock(pagecache_folio);
> -				folio_put(pagecache_folio);
> -			}
>   			hugetlb_vma_unlock_read(vma);
>   			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
>   			return handle_userfault(&vmf, VM_UFFD_WP);
> @@ -6813,24 +6801,20 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>   		/* Fallthrough to CoW */
>   	}
>   
> -	/*
> -	 * hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) and
> -	 * pagecache_folio, so here we need take the former one
> -	 * when folio != pagecache_folio or !pagecache_folio.
> -	 */
> -	folio = page_folio(pte_page(vmf.orig_pte));
> -	if (folio != pagecache_folio)
> -		if (!folio_trylock(folio)) {
> -			need_wait_lock = 1;
> -			goto out_ptl;
> -		}
> -
> -	folio_get(folio);
> -
>   	if (flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
>   		if (!huge_pte_write(vmf.orig_pte)) {
> -			ret = hugetlb_wp(pagecache_folio, &vmf);
> -			goto out_put_page;
> +			/* hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) */
> +			folio = page_folio(pte_page(vmf.orig_pte));
> +			folio_get(folio);
> +			spin_unlock(vmf.ptl);
> +			folio_lock(folio);
> +			spin_lock(vmf.ptl);
> +			if (likely(pte_same(vmf.orig_pte,
> +				      huge_ptep_get(mm, vmf.address, vmf.pte))))
> +				ret = hugetlb_wp(&vmf);
> +			folio_unlock(folio);
> +			folio_put(folio);
> +			goto out_ptl;
>   		} else if (likely(flags & FAULT_FLAG_WRITE)) {
>   			vmf.orig_pte = huge_pte_mkdirty(vmf.orig_pte);
>   		}
> @@ -6839,17 +6823,8 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>   	if (huge_ptep_set_access_flags(vma, vmf.address, vmf.pte, vmf.orig_pte,
>   						flags & FAULT_FLAG_WRITE))
>   		update_mmu_cache(vma, vmf.address, vmf.pte);
> -out_put_page:
> -	if (folio != pagecache_folio)
> -		folio_unlock(folio);
> -	folio_put(folio);
>   out_ptl:
>   	spin_unlock(vmf.ptl);
> -
> -	if (pagecache_folio) {
> -		folio_unlock(pagecache_folio);
> -		folio_put(pagecache_folio);
> -	}
>   out_mutex:
>   	hugetlb_vma_unlock_read(vma);
>   
> @@ -6861,15 +6836,6 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>   		vma_end_read(vma);
>   
>   	mutex_unlock(&hugetlb_fault_mutex_table[hash]);
> -	/*
> -	 * Generally it's safe to hold refcount during waiting page lock. But
> -	 * here we just wait to defer the next page fault to avoid busy loop and
> -	 * the page is not used after unlocked before returning from the current
> -	 * page fault. So we are safe from accessing freed page, even if we wait
> -	 * here without taking refcount.
> -	 */
> -	if (need_wait_lock)
> -		folio_wait_locked(folio);
>   	return ret;
>   }
>   

Sorry for the late response. I've changed to a different project and 
won't have time to work on this bug anymore. But, finally, I find time 
on the weekend to conduct the testing. It appears that the ABBA deadlock 
still exists. Please refer to the log:

https://drive.google.com/file/d/1xep11ULPoB8Ttv0C0VxDoL7FPdOOccR7/view

The reproducer is here:
https://drive.google.com/file/d/1DVRnIW-vSayU5J1re9Ct_br3jJQU6Vpb/view?usp=drive_link

This callstack is particularly suspicious:
[  858.623348][   T34] INFO: task repro_20250402_:6302 blocked for more 
than 143 seconds.
[  858.624082][   T34]       Not tainted 6.16.0-rc3+ #37
[  858.624546][   T34] "echo 0 > 
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  858.625308][   T34] task:repro_20250402_ state:D stack:28288 pid:6302 
  tgid:6272  ppid:3494   task_flags:0x400040 flags:0x00004006
[  858.626361][   T34] Call Trace:
[  858.626660][   T34]  <TASK>
[  858.626932][   T34]  __schedule+0x17ac/0x4f90
[  858.627347][   T34]  ? lockdep_unlock+0x74/0x100
[  858.627807][   T34]  ? schedule+0x158/0x330
[  858.628211][   T34]  ? __pfx___schedule+0x10/0x10
[  858.628660][   T34]  ? lock_acquire+0xf5/0x290
[  858.629104][   T34]  ? schedule+0x96/0x330
[  858.629500][   T34]  schedule+0x158/0x330
[  858.629899][   T34]  io_schedule+0x92/0x110
[  858.630294][   T34]  folio_wait_bit_common+0x69a/0xba0
[  858.630792][   T34]  ? __pfx_folio_wait_bit_common+0x10/0x10
[  858.631337][   T34]  ? __pfx_wake_page_function+0x10/0x10
[  858.631837][   T34]  ? do_raw_spin_lock+0x126/0x2a0
[  858.632291][   T34]  ? lock_acquire+0xf5/0x290
[  858.632711][   T34]  ? __pfx_do_raw_spin_lock+0x10/0x10
[  858.633225][   T34]  hugetlb_fault+0x204e/0x2b40
[  858.633705][   T34]  ? __pfx_hugetlb_fault+0x10/0x10
[  858.634203][   T34]  handle_mm_fault+0x17b3/0x1c80
[  858.634658][   T34]  ? handle_mm_fault+0xdb/0x1c80
[  858.635102][   T34]  ? lock_vma_under_rcu+0xfe/0x770
[  858.635573][   T34]  ? lock_vma_under_rcu+0x6d7/0x770
[  858.636046][   T34]  ? __pfx_handle_mm_fault+0x10/0x10
[  858.636524][   T34]  ? __pfx_lock_vma_under_rcu+0x10/0x10
[  858.637042][   T34]  do_user_addr_fault+0xace/0x1490
[  858.637517][   T34]  ? __pfx_do_user_addr_fault+0x10/0x10
[  858.638033][   T34]  ? trace_page_fault_user+0xb9/0x260
[  858.638525][   T34]  exc_page_fault+0x75/0xe0
[  858.638943][   T34]  asm_exc_page_fault+0x26/0x30

I've a quick glance at the point in hugetlb_fault:
$ addr2line hugetlb_fault+0x204e/0x2b40 -e vmlinux -f -i
spin_lock
/home/gavin/os/work_kernel/./include/linux/spinlock.h:351
hugetlb_fault
/home/gavin/os/work_kernel/mm/hugetlb.c:6801

6787         if (flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
6788                 if (!huge_pte_write(vmf.orig_pte)) {
6789                         /*
6790                          * Anonymous folios need to be lock since 
hugetlb_wp()
6791                          * checks whether we can re-use the folio 
exclusively
6792                          * for us in case we are the only user of it.
6793                          */
6794                         folio = page_folio(pte_page(vmf.orig_pte));
6795                         folio_get(folio);
6796                         if (!folio_test_anon(folio))
6797                                 goto lock_unneeded;
6798
6799                         spin_unlock(vmf.ptl);
6800                         folio_lock(folio);
6801                         spin_lock(vmf.ptl);
6802                         if (unlikely(!pte_same(vmf.orig_pte, 
huge_ptep_get(mm,
6803                                                vmf.address, vmf.pte))))
6804                                 goto unlock_folio;
6805 lock_unneeded:
6806                         ret = hugetlb_wp(&vmf);
6807 unlock_folio:
6808                         if (folio_test_anon(folio))
6809                                 folio_unlock(folio);
6810                         folio_put(folio);
6811                         goto out_ptl;

It appears that folio_lock is the culprit and interplays with the 
mutex_lock:

[  858.533925][   T34] INFO: task repro_20250402_:6273 blocked for more 
than 143 seconds.
[  858.535565][   T34]       Not tainted 6.16.0-rc3+ #37
[  858.536520][   T34] "echo 0 > 
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  858.538045][   T34] task:repro_20250402_ state:D stack:25856 pid:6273 
  tgid:6272  ppid:3494   task_flags:0x400040 flags:0x00004006
[  858.540214][   T34] Call Trace:
[  858.540857][   T34]  <TASK>
[  858.541413][   T34]  __schedule+0x17ac/0x4f90
[  858.542298][   T34]  ? schedule+0x158/0x330
[  858.543116][   T34]  ? __pfx___schedule+0x10/0x10
[  858.544970][   T34]  ? lock_acquire+0xf5/0x290
[  858.545864][   T34]  ? schedule+0x96/0x330
[  858.546652][   T34]  ? schedule+0x96/0x330
[  858.547466][   T34]  schedule+0x158/0x330
[  858.548258][   T34]  schedule_preempt_disabled+0x15/0x30
[  858.549258][   T34]  __mutex_lock+0x61d/0xdb0
[  858.550099][   T34]  ? __mutex_lock+0x417/0xdb0
[  858.550988][   T34]  ? hugetlb_wp+0xfe2/0x3220
[  858.551829][   T34]  ? __pfx___mutex_lock+0x10/0x10
[  858.552754][   T34]  ? up_write+0x132/0x420
[  858.553555][   T34]  ? vma_interval_tree_iter_next+0x1a4/0x300
[  858.554751][   T34]  hugetlb_wp+0xfe2/0x3220
[  858.555650][   T34]  ? __pfx_hugetlb_wp+0x10/0x10
[  858.556542][   T34]  ? do_raw_spin_lock+0x126/0x2a0
[  858.557456][   T34]  ? lock_acquire+0xf5/0x290
[  858.558317][   T34]  ? __pfx_do_raw_spin_lock+0x10/0x10
[  858.559321][   T34]  hugetlb_fault+0x20b6/0x2b40
[  858.560245][   T34]  ? __pfx_hugetlb_fault+0x10/0x10
[  858.561225][   T34]  ? mt_find+0x15a/0x5f0
[  858.562026][   T34]  handle_mm_fault+0x17b3/0x1c80


