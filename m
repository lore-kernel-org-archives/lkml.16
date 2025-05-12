Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7289443
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747062227; cv=none; b=VckBfm9y5SKXKa+gqZih/sdLAS378VWoPYbN/mNqWyPAT9zyqugfBPPTmmJqXUef5a+ykY0BRTRdkaXf837TiUA3D77AwmvLV2JdpsJ/yNa/9ZLX47mQriYTbGcDcJt/r3OG+mqoLBrtYSLWkAisnWkHm9sj8FO5zw55Jy6r9Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747062227; c=relaxed/simple;
	bh=9Wfop2MOPQSAsOyl90xelaA+Bw0b5Yzsd2BXlyKjbP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=douVPVHyVn/H0YGQDMH4CKBFlgtphJa+v1W1HsCevD1GsnYARI8esJj3h8mymb5i2KGUOHmuTkhu3DQG6rVNHVopwiVTWDKsGMMHzjX/moJfzVAGh8+jk5+NHiSHultFnS3jT4jj1E+HWsSrcj53CpuC1A1Mh85eYy7TaS0rqjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01C1814BF;
	Mon, 12 May 2025 08:03:34 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 147DB3F63F;
	Mon, 12 May 2025 08:03:42 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Permit lazy_mmu_mode to be nested
Date: Mon, 12 May 2025 16:03:31 +0100
Message-ID: <20250512150333.5589-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lazy_mmu_mode is not supposed to permit nesting. But in practice this
does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation inside
a lazy_mmu_mode section (such as zap_pte_range()) will change
permissions on the linear map with apply_to_page_range(), which
re-enters lazy_mmu_mode (see stack trace below).

The warning checking that nesting was not happening was previously being
triggered due to this. So let's relax by removing the warning and
tolerate nesting in the arm64 implementation. The first (inner) call to
arch_leave_lazy_mmu_mode() will flush and clear the flag such that the
remainder of the work in the outer nest behaves as if outside of lazy
mmu mode. This is safe and keeps tracking simple.

Code review suggests powerpc deals with this issue in the same way.

------------[ cut here ]------------
WARNING: CPU: 6 PID: 1 at arch/arm64/include/asm/pgtable.h:89 __apply_to_page_range+0x85c/0x9f8
Modules linked in: ip_tables x_tables ipv6
CPU: 6 UID: 0 PID: 1 Comm: systemd Not tainted 6.15.0-rc5-00075-g676795fe9cf6 #1 PREEMPT
Hardware name: QEMU KVM Virtual Machine, BIOS 2024.08-4 10/25/2024
pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __apply_to_page_range+0x85c/0x9f8
lr : __apply_to_page_range+0x2b4/0x9f8
sp : ffff80008009b3c0
x29: ffff80008009b460 x28: ffff0000c43a3000 x27: ffff0001ff62b108
x26: ffff0000c43a4000 x25: 0000000000000001 x24: 0010000000000001
x23: ffffbf24c9c209c0 x22: ffff80008009b4d0 x21: ffffbf24c74a3b20
x20: ffff0000c43a3000 x19: ffff0001ff609d18 x18: 0000000000000001
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000003
x14: 0000000000000028 x13: ffffbf24c97c1000 x12: ffff0000c43a3fff
x11: ffffbf24cacc9a70 x10: ffff0000c43a3fff x9 : ffff0001fffff018
x8 : 0000000000000012 x7 : ffff0000c43a4000 x6 : ffff0000c43a4000
x5 : ffffbf24c9c209c0 x4 : ffff0000c43a3fff x3 : ffff0001ff609000
x2 : 0000000000000d18 x1 : ffff0000c03e8000 x0 : 0000000080000000
Call trace:
 __apply_to_page_range+0x85c/0x9f8 (P)
 apply_to_page_range+0x14/0x20
 set_memory_valid+0x5c/0xd8
 __kernel_map_pages+0x84/0xc0
 get_page_from_freelist+0x1110/0x1340
 __alloc_frozen_pages_noprof+0x114/0x1178
 alloc_pages_mpol+0xb8/0x1d0
 alloc_frozen_pages_noprof+0x48/0xc0
 alloc_pages_noprof+0x10/0x60
 get_free_pages_noprof+0x14/0x90
 __tlb_remove_folio_pages_size.isra.0+0xe4/0x140
 __tlb_remove_folio_pages+0x10/0x20
 unmap_page_range+0xa1c/0x14c0
 unmap_single_vma.isra.0+0x48/0x90
 unmap_vmas+0xe0/0x200
 vms_clear_ptes+0xf4/0x140
 vms_complete_munmap_vmas+0x7c/0x208
 do_vmi_align_munmap+0x180/0x1a8
 do_vmi_munmap+0xac/0x188
 __vm_munmap+0xe0/0x1e0
 __arm64_sys_munmap+0x20/0x38
 invoke_syscall+0x48/0x104
 el0_svc_common.constprop.0+0x40/0xe0
 do_el0_svc+0x1c/0x28
 el0_svc+0x4c/0x16c
 el0t_64_sync_handler+0x10c/0x140
 el0t_64_sync+0x198/0x19c
irq event stamp: 281312
hardirqs last  enabled at (281311): [<ffffbf24c780fd04>] bad_range+0x164/0x1c0
hardirqs last disabled at (281312): [<ffffbf24c89c4550>] el1_dbg+0x24/0x98
softirqs last  enabled at (281054): [<ffffbf24c752d99c>] handle_softirqs+0x4cc/0x518
softirqs last disabled at (281019): [<ffffbf24c7450694>] __do_softirq+0x14/0x20
---[ end trace 0000000000000000 ]---

Fixes: 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel mappings")
Reported-by: Catalin Marinas <catalin.marinas@arm.com>
Closes: https://lore.kernel.org/linux-arm-kernel/aCH0TLRQslXHin5Q@arm.com/
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---

Hi Will,

I'm sending this as an additional fix to the one I provided this morning. They
are both required for correct operation. This one goes on top of the first.

Sorry again for all the hassle here. At least I now have 2 new debug KConfigs in
my test setup.

Thanks,
Ryan

 arch/arm64/include/asm/pgtable.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index e65083ec35cb..43457940a388 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -83,11 +83,21 @@ static inline void queue_pte_barriers(void)
 #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 static inline void arch_enter_lazy_mmu_mode(void)
 {
+	/*
+	 * lazy_mmu_mode is not supposed to permit nesting. But in practice this
+	 * does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation
+	 * inside a lazy_mmu_mode section (such as zap_pte_range()) will change
+	 * permissions on the linear map with apply_to_page_range(), which
+	 * re-enters lazy_mmu_mode. So we tolerate nesting in our
+	 * implementation. The first call to arch_leave_lazy_mmu_mode() will
+	 * flush and clear the flag such that the remainder of the work in the
+	 * outer nest behaves as if outside of lazy mmu mode. This is safe and
+	 * keeps tracking simple.
+	 */
+
 	if (in_interrupt())
 		return;

-	VM_WARN_ON(test_thread_flag(TIF_LAZY_MMU));
-
 	set_thread_flag(TIF_LAZY_MMU);
 }

--
2.43.0

