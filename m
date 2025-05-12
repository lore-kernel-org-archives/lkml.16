Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D0D44C63
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747076131; cv=none; b=KoGyqcYP9mx4VrlSBLgpEppChHsuXSJ2dQdvvUYIW/kYCiYifmkovs3rDkY9JO3V99waYZ0GCZzD1IWbFyA7t8nodZLEYSzzlBoXOD1LqETNJ7aGin9QPkmFjv3uPwqxOT9N7LoxG+fgDxZRtY1hSrDsa3HcCEqcnInhxSJI22U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747076131; c=relaxed/simple;
	bh=M6ayjQd3gWz51QUvPEksazFGawUZNndcRZ17U3rlaY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKlTnOmuFvCmepRMXARAVPI+Qt8Ckdq2B1hhsxmOry7n3JGmz/kAoL69WP1hiYNlaiL0Fsq5cx8gL4zjkTC63ZHhBuMU0yng2/GZ/zNiJ1VT9aqNT+1JqRlbTMBBk5h6aqtxM8b0f33VQsayaSI0xfpWVBBG2gRrTA0HfjgpqfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98462C4CEE7;
	Mon, 12 May 2025 18:55:28 +0000 (UTC)
Date: Mon, 12 May 2025 19:55:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Permit lazy_mmu_mode to be nested
Message-ID: <aCJEHY609yrmoXvW@arm.com>
References: <20250512150333.5589-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512150333.5589-1-ryan.roberts@arm.com>

On Mon, May 12, 2025 at 04:03:31PM +0100, Ryan Roberts wrote:
> lazy_mmu_mode is not supposed to permit nesting. But in practice this
> does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation inside
> a lazy_mmu_mode section (such as zap_pte_range()) will change
> permissions on the linear map with apply_to_page_range(), which
> re-enters lazy_mmu_mode (see stack trace below).
> 
> The warning checking that nesting was not happening was previously being
> triggered due to this. So let's relax by removing the warning and
> tolerate nesting in the arm64 implementation. The first (inner) call to
> arch_leave_lazy_mmu_mode() will flush and clear the flag such that the
> remainder of the work in the outer nest behaves as if outside of lazy
> mmu mode. This is safe and keeps tracking simple.
> 
> Code review suggests powerpc deals with this issue in the same way.
> 
> ------------[ cut here ]------------
> WARNING: CPU: 6 PID: 1 at arch/arm64/include/asm/pgtable.h:89 __apply_to_page_range+0x85c/0x9f8
> Modules linked in: ip_tables x_tables ipv6
> CPU: 6 UID: 0 PID: 1 Comm: systemd Not tainted 6.15.0-rc5-00075-g676795fe9cf6 #1 PREEMPT
> Hardware name: QEMU KVM Virtual Machine, BIOS 2024.08-4 10/25/2024
> pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : __apply_to_page_range+0x85c/0x9f8
> lr : __apply_to_page_range+0x2b4/0x9f8
> sp : ffff80008009b3c0
> x29: ffff80008009b460 x28: ffff0000c43a3000 x27: ffff0001ff62b108
> x26: ffff0000c43a4000 x25: 0000000000000001 x24: 0010000000000001
> x23: ffffbf24c9c209c0 x22: ffff80008009b4d0 x21: ffffbf24c74a3b20
> x20: ffff0000c43a3000 x19: ffff0001ff609d18 x18: 0000000000000001
> x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000003
> x14: 0000000000000028 x13: ffffbf24c97c1000 x12: ffff0000c43a3fff
> x11: ffffbf24cacc9a70 x10: ffff0000c43a3fff x9 : ffff0001fffff018
> x8 : 0000000000000012 x7 : ffff0000c43a4000 x6 : ffff0000c43a4000
> x5 : ffffbf24c9c209c0 x4 : ffff0000c43a3fff x3 : ffff0001ff609000
> x2 : 0000000000000d18 x1 : ffff0000c03e8000 x0 : 0000000080000000
> Call trace:
>  __apply_to_page_range+0x85c/0x9f8 (P)
>  apply_to_page_range+0x14/0x20
>  set_memory_valid+0x5c/0xd8
>  __kernel_map_pages+0x84/0xc0
>  get_page_from_freelist+0x1110/0x1340
>  __alloc_frozen_pages_noprof+0x114/0x1178
>  alloc_pages_mpol+0xb8/0x1d0
>  alloc_frozen_pages_noprof+0x48/0xc0
>  alloc_pages_noprof+0x10/0x60
>  get_free_pages_noprof+0x14/0x90
>  __tlb_remove_folio_pages_size.isra.0+0xe4/0x140
>  __tlb_remove_folio_pages+0x10/0x20
>  unmap_page_range+0xa1c/0x14c0
>  unmap_single_vma.isra.0+0x48/0x90
>  unmap_vmas+0xe0/0x200
>  vms_clear_ptes+0xf4/0x140
>  vms_complete_munmap_vmas+0x7c/0x208
>  do_vmi_align_munmap+0x180/0x1a8
>  do_vmi_munmap+0xac/0x188
>  __vm_munmap+0xe0/0x1e0
>  __arm64_sys_munmap+0x20/0x38
>  invoke_syscall+0x48/0x104
>  el0_svc_common.constprop.0+0x40/0xe0
>  do_el0_svc+0x1c/0x28
>  el0_svc+0x4c/0x16c
>  el0t_64_sync_handler+0x10c/0x140
>  el0t_64_sync+0x198/0x19c
> irq event stamp: 281312
> hardirqs last  enabled at (281311): [<ffffbf24c780fd04>] bad_range+0x164/0x1c0
> hardirqs last disabled at (281312): [<ffffbf24c89c4550>] el1_dbg+0x24/0x98
> softirqs last  enabled at (281054): [<ffffbf24c752d99c>] handle_softirqs+0x4cc/0x518
> softirqs last disabled at (281019): [<ffffbf24c7450694>] __do_softirq+0x14/0x20
> ---[ end trace 0000000000000000 ]---
> 
> Fixes: 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel mappings")
> Reported-by: Catalin Marinas <catalin.marinas@arm.com>
> Closes: https://lore.kernel.org/linux-arm-kernel/aCH0TLRQslXHin5Q@arm.com/
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Thanks. This works, no more warnings. The comment looks fine.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
