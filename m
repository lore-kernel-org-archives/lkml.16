Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7D52882BE
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749218231; cv=none; b=IYTtWUrqT3Rdcd+CNtFwfDef94GDgYPH9qrL1cJDTHoJJ+3NVIlfTQQay2UvMWR7kBbEENl5FFfCsDxedIpBWUnx3jiClI9fLzxZRcqpzjHqUW6SpzL3c6XS3BxPDlNDoJoGUUSqdiQiRCjZl48/5mMs2cU+dz98daaOVKdmTYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749218231; c=relaxed/simple;
	bh=XB/UgigNUmGAZKktVNs+Fg1uDhJkrQLmbeVDMp4Gve8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uDg4pKR1t4kpxQ0dpr6nF6xkiVNRGxpZNZIZtZY8iGsohzgo6RxPOzwhItCoQYG+kC7SU9xnXiQILE+bZ9vKdabj+a09rzuG6hSJpWEzOeNqGAtqdZetZt9+a9pa/vHQkk6JG2O4xKS4J5I/CA+Jc7UpLDs3hYGHh9BsyO4G3DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA1F9152B;
	Fri,  6 Jun 2025 06:56:44 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6CDD3F673;
	Fri,  6 Jun 2025 06:57:01 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64/mm: Ensure lazy_mmu_mode never nests
Date: Fri,  6 Jun 2025 14:56:52 +0100
Message-ID: <20250606135654.178300-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
provided a quick fix to ensure that lazy_mmu_mode continues to work when
CONFIG_DEBUG_PAGEALLOC is enabled, which can cause lazy_mmu_mode to
nest.

The solution in that patch is the make the implementation tolerant to
nesting; when the inner nest exits lazy_mmu_mode, we exit then the outer
exit becomes a nop. But this sacrifices the optimization opportunity for
the remainder of the outer user.

So let's take a different approach and simply ensure the nesting never
happens in the first place. The nesting is caused when the page
allocator calls out to __kernel_map_pages() which then eventually calls
apply_to_page_range(), which calls arch_enter_lazy_mmu_mode(). So simply
notice if we are in lazy_mmu_mode in __kernel_map_pages() and
temporarily exit.

With that approach, we can effectively revert Commit 1ef3095b1405
("arm64/mm: Permit lazy_mmu_mode to be nested"), re-enabling the VM_WARN
if we ever detect nesting in future.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---

I wonder if you might be willing to take this for v6.16? I think its a neater
solution then my first attempt - Commit 1ef3095b1405 ("arm64/mm: Permit
lazy_mmu_mode to be nested") - which is already in Linus's master.

To be clear, the current solution is safe, I just think this is much neater.

Applies on today's master branch (e271ed52b344).

Thanks,
Ryan

 arch/arm64/include/asm/pgtable.h | 22 ++++++++++------------
 arch/arm64/mm/pageattr.c         | 23 +++++++++++++++++------
 2 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 88db8a0c0b37..9f387337ccc3 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -83,21 +83,11 @@ static inline void queue_pte_barriers(void)
 #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 static inline void arch_enter_lazy_mmu_mode(void)
 {
-	/*
-	 * lazy_mmu_mode is not supposed to permit nesting. But in practice this
-	 * does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation
-	 * inside a lazy_mmu_mode section (such as zap_pte_range()) will change
-	 * permissions on the linear map with apply_to_page_range(), which
-	 * re-enters lazy_mmu_mode. So we tolerate nesting in our
-	 * implementation. The first call to arch_leave_lazy_mmu_mode() will
-	 * flush and clear the flag such that the remainder of the work in the
-	 * outer nest behaves as if outside of lazy mmu mode. This is safe and
-	 * keeps tracking simple.
-	 */
-
 	if (in_interrupt())
 		return;

+	VM_WARN_ON(test_thread_flag(TIF_LAZY_MMU));
+
 	set_thread_flag(TIF_LAZY_MMU);
 }

@@ -119,6 +109,14 @@ static inline void arch_leave_lazy_mmu_mode(void)
 	clear_thread_flag(TIF_LAZY_MMU);
 }

+static inline bool arch_in_lazy_mmu_mode(void)
+{
+	if (in_interrupt())
+		return false;
+
+	return test_thread_flag(TIF_LAZY_MMU);
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 04d4a8f676db..4da7a847d5f3 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -293,18 +293,29 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 }

 #ifdef CONFIG_DEBUG_PAGEALLOC
-/*
- * This is - apart from the return value - doing the same
- * thing as the new set_direct_map_valid_noflush() function.
- *
- * Unify? Explain the conceptual differences?
- */
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
+	bool lazy_mmu;
+
 	if (!can_set_direct_map())
 		return;

+	/*
+	 * This is called during page alloc or free, and maybe called while in
+	 * lazy mmu mode. Since set_memory_valid() may also enter lazy mmu mode,
+	 * this would cause nesting which is not supported; the inner call to
+	 * exit the mode would exit, meaning that the outer lazy mmu mode is no
+	 * longer benefiting from the optimization. So temporarily leave lazy
+	 * mmu mode for the duration of the call.
+	 */
+	lazy_mmu = arch_in_lazy_mmu_mode();
+	if (lazy_mmu)
+		arch_leave_lazy_mmu_mode();
+
 	set_memory_valid((unsigned long)page_address(page), numpages, enable);
+
+	if (lazy_mmu)
+		arch_enter_lazy_mmu_mode();
 }
 #endif /* CONFIG_DEBUG_PAGEALLOC */

--
2.43.0

