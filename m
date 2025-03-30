Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7BF29A0
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 15:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743346851; cv=none; b=IocHE7hTjG/3MIk3MDfaHTuo+csH+GooljJpZ9JpNtltFk8LrVa9TxVhz3VlQ6+FLYiMTORmAN1OHHV7ODvqnaiQNaeVWrkEDc4osvrVsnK2OMfa7jl03H/1oonky6DQkFsrigDDqCyjI4f3ASUju/nPVtv+wyBwtTc3Ozf51vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743346851; c=relaxed/simple;
	bh=Nwi4ImU2MVNtb7j9ol9HYpFJLXfnLPMCg7n7LWeNybc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEKYuoBxR6lAmOs0/yR9xDZKP/XMO7mpyR16ljDuIHgnIoFGJAmCCSCAdRn/0hUt1FflaLl5FScga+fHUa8Q6DiBy0LEDP8lMyOvYWETvii6UcnY7OcX7cMQ9aQzoSfxm7T21Trt89veooZeKtcK8MAJECLjkOGgs4w21zZNKHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWdoTCut; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWdoTCut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743346849; x=1774882849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nwi4ImU2MVNtb7j9ol9HYpFJLXfnLPMCg7n7LWeNybc=;
  b=jWdoTCutL06/BDt/rOZpdWFcvdwLe3DkydKOCbOviudxZecrVccPCdp4
   ZzuZ7Hmt9NKRKFpOBmBxpcN8XyNIuFIy0w8X53+TRe+ZjGbnkNivxbJpr
   EVfxUlkRKDGgmZInNVcLHDn00u6OPrMjy8edEAOPl8Ht0Slj2M2muX4Rs
   TNf1uQMniGHHl84DFRhfcnJPxZJveV8RRV/PoiMZQz3tO825R4uj/mncM
   aHtslSk3LUnAbKmo8tHYDclQq74HreamR599S7mhjljvp7t2O8zjV4+3b
   zyeBJVjICFBLBqPibraTYvh/SIgYc+mspeBBSaw1sWJiMXwZCcieO0h0w
   A==;
X-CSE-ConnectionGUID: XfBS93U4RkiSjbxK8oyzFw==
X-CSE-MsgGUID: qLx6ke4ySfGpZynYODoYtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="62042468"
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="62042468"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 08:00:49 -0700
X-CSE-ConnectionGUID: Imzo2GppT6ej3tSffhQfww==
X-CSE-MsgGUID: nO/SJjepRnK8Wi4mHMzwkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="130588446"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.161.23])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 08:00:46 -0700
Date: Sun, 30 Mar 2025 23:01:16 +0800
From: "Lai, Yi" <yi1.lai@linux.intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Harry Yoo <harry.yoo@oracle.com>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Oliver Sang <oliver.sang@intel.com>, yi1.lai@intel.com
Subject: Re: [PATCH v3 4/7] mm/mremap: initial refactor of move_vma()
Message-ID: <Z+lcvEIHMLiKVR1i@ly-workstation>
References: <cover.1741639347.git.lorenzo.stoakes@oracle.com>
 <ab611d6efae11bddab2db2b8bb3925b1d1954c7d.1741639347.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab611d6efae11bddab2db2b8bb3925b1d1954c7d.1741639347.git.lorenzo.stoakes@oracle.com>

On Mon, Mar 10, 2025 at 08:50:37PM +0000, Lorenzo Stoakes wrote:
> Update move_vma() to use the threaded VRM object, de-duplicate code and
> separate into smaller functions to aid readability and debug-ability.
> 
> This in turn allows further simplification of expand_vma() as we can
> simply thread VRM through the function.
> 
> We also take the opportunity to abstract the account charging page count
> into the VRM in order that we can correctly thread this through the
> operation.
> 
> We additionally do the same for tracking mm statistics - exec_vm,
> stack_vm, data_vm, and locked_vm.
> 
> As part of this change, we slightly modify when locked pages statistics
> are counted for in mm_struct statistics.  However this should cause no
> issues, as there is no chance of underflow, nor will any rlimit failures
> occur as a result.
> 
> This is an intermediate step before a further refactoring of move_vma() in
> order to aid review.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>  mm/mremap.c | 186 ++++++++++++++++++++++++++++++++++------------------
>  1 file changed, 122 insertions(+), 64 deletions(-)
> 
> diff --git a/mm/mremap.c b/mm/mremap.c
> index af022e3b89e2..6305cb9a86f6 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -68,6 +68,7 @@ struct vma_remap_struct {
>  	bool mlocked;			/* Was the VMA mlock()'d? */
>  	enum mremap_type remap_type;	/* expand, shrink, etc. */
>  	bool mmap_locked;		/* Is mm currently write-locked? */
> +	unsigned long charged;		/* If VM_ACCOUNT, # pages to account. */
>  };
>  
>  static pud_t *get_old_pud(struct mm_struct *mm, unsigned long addr)
> @@ -816,35 +817,88 @@ static unsigned long vrm_set_new_addr(struct vma_remap_struct *vrm)
>  	return 0;
>  }
>  
> -static unsigned long move_vma(struct vm_area_struct *vma,
> -		unsigned long old_addr, unsigned long old_len,
> -		unsigned long new_len, unsigned long new_addr,
> -		bool *mlocked, unsigned long flags,
> -		struct vm_userfaultfd_ctx *uf, struct list_head *uf_unmap)
> +/*
> + * Keep track of pages which have been added to the memory mapping. If the VMA
> + * is accounted, also check to see if there is sufficient memory.
> + *
> + * Returns true on success, false if insufficient memory to charge.
> + */
> +static bool vrm_charge(struct vma_remap_struct *vrm)
>  {
> -	long to_account = new_len - old_len;
> -	struct mm_struct *mm = vma->vm_mm;
> -	struct vm_area_struct *new_vma;
> -	unsigned long vm_flags = vma->vm_flags;
> -	unsigned long new_pgoff;
> -	unsigned long moved_len;
> -	bool account_start = false;
> -	bool account_end = false;
> -	unsigned long hiwater_vm;
> -	int err = 0;
> -	bool need_rmap_locks;
> -	struct vma_iterator vmi;
> +	unsigned long charged;
> +
> +	if (!(vrm->vma->vm_flags & VM_ACCOUNT))
> +		return true;
> +
> +	/*
> +	 * If we don't unmap the old mapping, then we account the entirety of
> +	 * the length of the new one. Otherwise it's just the delta in size.
> +	 */
> +	if (vrm->flags & MREMAP_DONTUNMAP)
> +		charged = vrm->new_len >> PAGE_SHIFT;
> +	else
> +		charged = vrm->delta >> PAGE_SHIFT;
> +
> +
> +	/* This accounts 'charged' pages of memory. */
> +	if (security_vm_enough_memory_mm(current->mm, charged))
> +		return false;
> +
> +	vrm->charged = charged;
> +	return true;
> +}
> +
> +/*
> + * an error has occurred so we will not be using vrm->charged memory. Unaccount
> + * this memory if the VMA is accounted.
> + */
> +static void vrm_uncharge(struct vma_remap_struct *vrm)
> +{
> +	if (!(vrm->vma->vm_flags & VM_ACCOUNT))
> +		return;
> +
> +	vm_unacct_memory(vrm->charged);
> +	vrm->charged = 0;
> +}
> +
> +/*
> + * Update mm exec_vm, stack_vm, data_vm, and locked_vm fields as needed to
> + * account for 'bytes' memory used, and if locked, indicate this in the VRM so
> + * we can handle this correctly later.
> + */
> +static void vrm_stat_account(struct vma_remap_struct *vrm,
> +			     unsigned long bytes)
> +{
> +	unsigned long pages = bytes >> PAGE_SHIFT;
> +	struct mm_struct *mm = current->mm;
> +	struct vm_area_struct *vma = vrm->vma;
> +
> +	vm_stat_account(mm, vma->vm_flags, pages);
> +	if (vma->vm_flags & VM_LOCKED) {
> +		mm->locked_vm += pages;
> +		vrm->mlocked = true;
> +	}
> +}
> +
> +/*
> + * Perform checks before attempting to write a VMA prior to it being
> + * moved.
> + */
> +static unsigned long prep_move_vma(struct vma_remap_struct *vrm,
> +				   unsigned long *vm_flags_ptr)
> +{
> +	unsigned long err = 0;
> +	struct vm_area_struct *vma = vrm->vma;
> +	unsigned long old_addr = vrm->addr;
> +	unsigned long old_len = vrm->old_len;
>  
>  	/*
>  	 * We'd prefer to avoid failure later on in do_munmap:
>  	 * which may split one vma into three before unmapping.
>  	 */
> -	if (mm->map_count >= sysctl_max_map_count - 3)
> +	if (current->mm->map_count >= sysctl_max_map_count - 3)
>  		return -ENOMEM;
>  
> -	if (unlikely(flags & MREMAP_DONTUNMAP))
> -		to_account = new_len;
> -
>  	if (vma->vm_ops && vma->vm_ops->may_split) {
>  		if (vma->vm_start != old_addr)
>  			err = vma->vm_ops->may_split(vma, old_addr);
> @@ -862,22 +916,46 @@ static unsigned long move_vma(struct vm_area_struct *vma,
>  	 * so KSM can come around to merge on vma and new_vma afterwards.
>  	 */
>  	err = ksm_madvise(vma, old_addr, old_addr + old_len,
> -						MADV_UNMERGEABLE, &vm_flags);
> +			  MADV_UNMERGEABLE, vm_flags_ptr);
>  	if (err)
>  		return err;
>  
> -	if (vm_flags & VM_ACCOUNT) {
> -		if (security_vm_enough_memory_mm(mm, to_account >> PAGE_SHIFT))
> -			return -ENOMEM;
> -	}
> +	return 0;
> +}
> +
> +static unsigned long move_vma(struct vma_remap_struct *vrm)
> +{
> +	struct mm_struct *mm = current->mm;
> +	struct vm_area_struct *vma = vrm->vma;
> +	struct vm_area_struct *new_vma;
> +	unsigned long vm_flags = vma->vm_flags;
> +	unsigned long old_addr = vrm->addr, new_addr = vrm->new_addr;
> +	unsigned long old_len = vrm->old_len, new_len = vrm->new_len;
> +	unsigned long new_pgoff;
> +	unsigned long moved_len;
> +	unsigned long account_start = false;
> +	unsigned long account_end = false;
> +	unsigned long hiwater_vm;
> +	int err;
> +	bool need_rmap_locks;
> +	struct vma_iterator vmi;
> +
> +	err = prep_move_vma(vrm, &vm_flags);
> +	if (err)
> +		return err;
> +
> +	/* If accounted, charge the number of bytes the operation will use. */
> +	if (!vrm_charge(vrm))
> +		return -ENOMEM;
>  
>  	vma_start_write(vma);
>  	new_pgoff = vma->vm_pgoff + ((old_addr - vma->vm_start) >> PAGE_SHIFT);
> -	new_vma = copy_vma(&vma, new_addr, new_len, new_pgoff,
> +	new_vma = copy_vma(&vrm->vma, new_addr, new_len, new_pgoff,
>  			   &need_rmap_locks);
> +	/* This may have been updated. */
> +	vma = vrm->vma;
>  	if (!new_vma) {
> -		if (vm_flags & VM_ACCOUNT)
> -			vm_unacct_memory(to_account >> PAGE_SHIFT);
> +		vrm_uncharge(vrm);
>  		return -ENOMEM;
>  	}
>  
> @@ -902,7 +980,7 @@ static unsigned long move_vma(struct vm_area_struct *vma,
>  		old_addr = new_addr;
>  		new_addr = err;
>  	} else {
> -		mremap_userfaultfd_prep(new_vma, uf);
> +		mremap_userfaultfd_prep(new_vma, vrm->uf);
>  	}
>  
>  	if (is_vm_hugetlb_page(vma)) {
> @@ -910,7 +988,7 @@ static unsigned long move_vma(struct vm_area_struct *vma,
>  	}
>  
>  	/* Conceal VM_ACCOUNT so old reservation is not undone */
> -	if (vm_flags & VM_ACCOUNT && !(flags & MREMAP_DONTUNMAP)) {
> +	if (vm_flags & VM_ACCOUNT && !(vrm->flags & MREMAP_DONTUNMAP)) {
>  		vm_flags_clear(vma, VM_ACCOUNT);
>  		if (vma->vm_start < old_addr)
>  			account_start = true;
> @@ -928,13 +1006,12 @@ static unsigned long move_vma(struct vm_area_struct *vma,
>  	 * If this were a serious issue, we'd add a flag to do_munmap().
>  	 */
>  	hiwater_vm = mm->hiwater_vm;
> -	vm_stat_account(mm, vma->vm_flags, new_len >> PAGE_SHIFT);
>  
>  	/* Tell pfnmap has moved from this vma */
>  	if (unlikely(vma->vm_flags & VM_PFNMAP))
>  		untrack_pfn_clear(vma);
>  
> -	if (unlikely(!err && (flags & MREMAP_DONTUNMAP))) {
> +	if (unlikely(!err && (vrm->flags & MREMAP_DONTUNMAP))) {
>  		/* We always clear VM_LOCKED[ONFAULT] on the old vma */
>  		vm_flags_clear(vma, VM_LOCKED_MASK);
>  
> @@ -947,22 +1024,20 @@ static unsigned long move_vma(struct vm_area_struct *vma,
>  			unlink_anon_vmas(vma);
>  
>  		/* Because we won't unmap we don't need to touch locked_vm */
> +		vrm_stat_account(vrm, new_len);
>  		return new_addr;
>  	}
>  
> +	vrm_stat_account(vrm, new_len);
> +
>  	vma_iter_init(&vmi, mm, old_addr);
> -	if (do_vmi_munmap(&vmi, mm, old_addr, old_len, uf_unmap, false) < 0) {
> +	if (do_vmi_munmap(&vmi, mm, old_addr, old_len, vrm->uf_unmap, false) < 0) {
>  		/* OOM: unable to split vma, just get accounts right */
> -		if (vm_flags & VM_ACCOUNT && !(flags & MREMAP_DONTUNMAP))
> +		if (vm_flags & VM_ACCOUNT && !(vrm->flags & MREMAP_DONTUNMAP))
>  			vm_acct_memory(old_len >> PAGE_SHIFT);
>  		account_start = account_end = false;
>  	}
>  
> -	if (vm_flags & VM_LOCKED) {
> -		mm->locked_vm += new_len >> PAGE_SHIFT;
> -		*mlocked = true;
> -	}
> -
>  	mm->hiwater_vm = hiwater_vm;
>  
>  	/* Restore VM_ACCOUNT if one or two pieces of vma left */
> @@ -1141,9 +1216,7 @@ static unsigned long mremap_to(struct vma_remap_struct *vrm)
>  	if (err)
>  		return err;
>  
> -	return move_vma(vrm->vma, vrm->addr, vrm->old_len, vrm->new_len,
> -			vrm->new_addr, &vrm->mlocked, vrm->flags,
> -			vrm->uf, vrm->uf_unmap);
> +	return move_vma(vrm);
>  }
>  
>  static int vma_expandable(struct vm_area_struct *vma, unsigned long delta)
> @@ -1248,17 +1321,11 @@ static unsigned long check_mremap_params(struct vma_remap_struct *vrm)
>  static unsigned long expand_vma_in_place(struct vma_remap_struct *vrm)
>  {
>  	struct mm_struct *mm = current->mm;
> -	long pages = vrm->delta >> PAGE_SHIFT;
>  	struct vm_area_struct *vma = vrm->vma;
>  	VMA_ITERATOR(vmi, mm, vma->vm_end);
> -	long charged = 0;
> -
> -	if (vma->vm_flags & VM_ACCOUNT) {
> -		if (security_vm_enough_memory_mm(mm, pages))
> -			return -ENOMEM;
>  
> -		charged = pages;
> -	}
> +	if (!vrm_charge(vrm))
> +		return -ENOMEM;
>  
>  	/*
>  	 * Function vma_merge_extend() is called on the
> @@ -1271,15 +1338,11 @@ static unsigned long expand_vma_in_place(struct vma_remap_struct *vrm)
>  	 */
>  	vma = vrm->vma = vma_merge_extend(&vmi, vma, vrm->delta);
>  	if (!vma) {
> -		vm_unacct_memory(charged);
> +		vrm_uncharge(vrm);
>  		return -ENOMEM;
>  	}
>  
> -	vm_stat_account(mm, vma->vm_flags, pages);
> -	if (vma->vm_flags & VM_LOCKED) {
> -		mm->locked_vm += pages;
> -		vrm->mlocked = true;
> -	}
> +	vrm_stat_account(vrm, vrm->delta);
>  
>  	return 0;
>  }
> @@ -1319,11 +1382,7 @@ static bool align_hugetlb(struct vma_remap_struct *vrm)
>  static unsigned long expand_vma(struct vma_remap_struct *vrm)
>  {
>  	unsigned long err;
> -	struct vm_area_struct *vma = vrm->vma;
>  	unsigned long addr = vrm->addr;
> -	unsigned long old_len = vrm->old_len;
> -	unsigned long new_len = vrm->new_len;
> -	unsigned long flags = vrm->flags;
>  
>  	err = resize_is_valid(vrm);
>  	if (err)
> @@ -1356,7 +1415,7 @@ static unsigned long expand_vma(struct vma_remap_struct *vrm)
>  	 */
>  
>  	/* We're not allowed to move the VMA, so error out. */
> -	if (!(flags & MREMAP_MAYMOVE))
> +	if (!(vrm->flags & MREMAP_MAYMOVE))
>  		return -ENOMEM;
>  
>  	/* Find a new location to move the VMA to. */
> @@ -1364,8 +1423,7 @@ static unsigned long expand_vma(struct vma_remap_struct *vrm)
>  	if (err)
>  		return err;
>  
> -	return move_vma(vma, addr, old_len, new_len, vrm->new_addr,
> -			&vrm->mlocked, flags, vrm->uf, vrm->uf_unmap);
> +	return move_vma(vrm);
>  }
>  
>  /*
> -- 
> 2.48.1
>

Hi Lorenzo Stoakes,

Greetings!

I used Syzkaller and found that there is general protection fault in mremap in linux-next tag - next-20250325.

After bisection and the first bad commit is:
"
d5c8aec0542e mm/mremap: initial refactor of move_vma()
"

The deadlock can still be reproduced. You could try following reproduction binary.

All detailed into can be found at:
https://github.com/laifryiee/syzkaller_logs/tree/main/250329_061207_mremap
Syzkaller repro code:
https://github.com/laifryiee/syzkaller_logs/tree/main/250329_061207_mremap/repro.c
Syzkaller repro syscall steps:
https://github.com/laifryiee/syzkaller_logs/tree/main/250329_061207_mremap/repro.prog
Syzkaller report:
https://github.com/laifryiee/syzkaller_logs/tree/main/250329_061207_mremap/repro.report
Kconfig(make olddefconfig):
https://github.com/laifryiee/syzkaller_logs/tree/main/250329_061207_mremap/kconfig_origin
Bisect info:
https://github.com/laifryiee/syzkaller_logs/tree/main/250329_061207_mremap/bisect_info.log
bzImage:
https://github.com/laifryiee/syzkaller_logs/raw/refs/heads/main/250329_061207_mremap/bzImage_eb4bc4b07f66f01618d9cb1aa4eaef59b1188415
Issue dmesg:
https://github.com/laifryiee/syzkaller_logs/blob/main/250329_061207_mremap/eb4bc4b07f66f01618d9cb1aa4eaef59b1188415_dmesg.log

"
[   43.795673] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] SMP KASI
[   43.797814] KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
[   43.799835] CPU: 1 UID: 0 PID: 665 Comm: repro Not tainted 6.14.0-next-20250325-eb4bc4b07f66 #1 PREEMPT(voluntary)
[   43.800338] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org4
[   43.800911] RIP: 0010:__do_sys_mremap+0x13a9/0x15d0
[   43.801188] Code: e8 ac 57 a8 ff 48 8b 85 30 fe ff ff 48 89 83 70 ff ff ff 49 89 c5 e9 2b f2 ff ff e8 91 57 a8 ff 485
[   43.802152] RSP: 0018:ffff88801aa67ce8 EFLAGS: 00010293
[   43.802432] RAX: dffffc0000000004 RBX: ffff88801aa67eb0 RCX: ffffffff81e42e5a
[   43.802791] RDX: ffff888011e6ca80 RSI: ffffffff81df64cf RDI: 0000000000000007
[   43.803172] RBP: ffff88801aa67ed8 R08: 0000000000000000 R09: ffffed10023cd950
[   43.803558] R10: 0000000010000000 R11: ffff888011e6d8d8 R12: ffff888020fe5000
[   43.803943] R13: ffff88801f8f2780 R14: ffff888020fe5170 R15: 0000000000000000
[   43.804324] FS:  00007f8f5ae81600(0000) GS:ffff8880e3684000(0000) knlGS:0000000000000000
[   43.804749] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   43.805069] CR2: 00007f8f5ac57910 CR3: 0000000021690001 CR4: 0000000000770ef0
[   43.805442] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   43.805796] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
[   43.806173] PKRU: 55555554
[   43.806345] Call Trace:
[   43.806558]  <TASK>
[   43.806700]  ? show_regs+0x6d/0x80
[   43.807345]  ? die_addr+0x45/0xb0
[   43.807768]  ? exc_general_protection+0x1ad/0x340
[   43.808360]  ? asm_exc_general_protection+0x2b/0x30
[   43.808939]  ? vma_merge_new_range+0x16a/0x930
[   43.809499]  ? __do_sys_mremap+0x139f/0x15d0
[   43.810012]  ? __do_sys_mremap+0x13a9/0x15d0
[   43.810528]  ? __do_sys_mremap+0x139f/0x15d0
[   43.811043]  ? __pfx___do_sys_mremap+0x10/0x10
[   43.811587]  ? __this_cpu_preempt_check+0x21/0x30
[   43.812177]  __x64_sys_mremap+0xc7/0x150
[   43.812652]  ? syscall_trace_enter+0x14d/0x280
[   43.813201]  x64_sys_call+0x1933/0x2150
[   43.813658]  do_syscall_64+0x6d/0x150
[   43.814101]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   43.814686] RIP: 0033:0x7f8f5ac3ee5d
[   43.815125] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d8
[   43.817168] RSP: 002b:00007fff14f19058 EFLAGS: 00000217 ORIG_RAX: 0000000000000019
[   43.818037] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f8f5ac3ee5d
[   43.818430] RDX: 0000000000004000 RSI: 0000000000002000 RDI: 0000000020ffd000
[   43.818793] RBP: 00007fff14f19070 R08: 0000000020ffc000 R09: 0000000000000800
[   43.819160] R10: 0000000000000000 R11: 0000000000000217 R12: 00007fff14f19188
[   43.819540] R13: 0000000000401126 R14: 0000000000403e08 R15: 00007f8f5aeca000
[   43.819945]  </TASK>
[   43.820066] Modules linked in:
[   43.820308] ---[ end trace 0000000000000000 ]---
[   43.820587] RIP: 0010:__do_sys_mremap+0x13a9/0x15d0
[   43.820874] Code: e8 ac 57 a8 ff 48 8b 85 30 fe ff ff 48 89 83 70 ff ff ff 49 89 c5 e9 2b f2 ff ff e8 91 57 a8 ff 485
[   43.821855] RSP: 0018:ffff88801aa67ce8 EFLAGS: 00010293
[   43.822150] RAX: dffffc0000000004 RBX: ffff88801aa67eb0 RCX: ffffffff81e42e5a
[   43.822543] RDX: ffff888011e6ca80 RSI: ffffffff81df64cf RDI: 0000000000000007
[   43.822928] RBP: ffff88801aa67ed8 R08: 0000000000000000 R09: ffffed10023cd950
[   43.823347] R10: 0000000010000000 R11: ffff888011e6d8d8 R12: ffff888020fe5000
[   43.823757] R13: ffff88801f8f2780 R14: ffff888020fe5170 R15: 0000000000000000
[   43.824156] FS:  00007f8f5ae81600(0000) GS:ffff8880e3684000(0000) knlGS:0000000000000000
[   43.824627] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   43.824959] CR2: 00007f8f5ac57910 CR3: 0000000021690001 CR4: 0000000000770ef0
[   43.825350] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   43.825757] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
[   43.826154] PKRU: 55555554
"

Hope this cound be insightful to you.

Regards,
Yi Lai

---

If you don't need the following environment to reproduce the problem or if you
already have one reproduced environment, please ignore the following information.

How to reproduce:
git clone https://gitlab.com/xupengfe/repro_vm_env.git
cd repro_vm_env
tar -xvf repro_vm_env.tar.gz
cd repro_vm_env; ./start3.sh  // it needs qemu-system-x86_64 and I used v7.1.0
  // start3.sh will load bzImage_2241ab53cbb5cdb08a6b2d4688feb13971058f65 v6.2-rc5 kernel
  // You could change the bzImage_xxx as you want
  // Maybe you need to remove line "-drive if=pflash,format=raw,readonly=on,file=./OVMF_CODE.fd \" for different qemu version
You could use below command to log in, there is no password for root.
ssh -p 10023 root@localhost

After login vm(virtual machine) successfully, you could transfer reproduced
binary to the vm by below way, and reproduce the problem in vm:
gcc -pthread -o repro repro.c
scp -P 10023 repro root@localhost:/root/

Get the bzImage for target kernel:
Please use target kconfig and copy it to kernel_src/.config
make olddefconfig
make -jx bzImage           //x should equal or less than cpu num your pc has

Fill the bzImage file into above start3.sh to load the target kernel in vm.


Tips:
If you already have qemu-system-x86_64, please ignore below info.
If you want to install qemu v7.1.0 version:
git clone https://github.com/qemu/qemu.git
cd qemu
git checkout -f v7.1.0
mkdir build
cd build
yum install -y ninja-build.x86_64
yum -y install libslirp-devel.x86_64
../configure --target-list=x86_64-softmmu --enable-kvm --enable-vnc --enable-gtk --enable-sdl --enable-usb-redir --enable-slirp
make
make install 


