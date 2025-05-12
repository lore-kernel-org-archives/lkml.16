Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4240E264FB9
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747045377; cv=none; b=RqSW7MI5r7QlfJsYpWm+u3RLuAPkuUzdjer7tqFch1tXOTPjVxVrRTnfR4SDn3WtXpVK7cT2A+65JwNcu6eO4XJ1nnXLoHab0bIjTQU1sdqdj1haWPG/+Y4rRPhTUmHNxHKAhD00VDgDb7+c+cYWvRGUfZ8AWULY4j/MHue5vFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747045377; c=relaxed/simple;
	bh=IcscS5J/JFjr+j2IZmxv4ZVsrp9aZk2gu9rwc/Em9q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TMrZo/9xDsU37VRUig/4FrsQEKFOLs6kkypgWk+KP5L/NFoHTl/YFUJqzipj+fl2SHTOv0mZ6NkeB+QZ4XhfUZzP5PnKD368QzebI0A279IZpjqIVcvEZ4o7axozp3yVaHKnYajKyHoQ54BToD7Xk19BD25B5gQCsQL7zpYI1XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F05D150C;
	Mon, 12 May 2025 03:22:43 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5014F3F673;
	Mon, 12 May 2025 03:22:52 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
Subject: [PATCH] arm64/mm: Disable barrier batching in interrupt contexts
Date: Mon, 12 May 2025 11:22:40 +0100
Message-ID: <20250512102242.4156463-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel
mappings") enabled arm64 kernels to track "lazy mmu mode" using TIF
flags in order to defer barriers until exiting the mode. At the same
time, it added warnings to check that pte manipulations were never
performed in interrupt context, because the tracking implementation
could not deal with nesting.

But it turns out that some debug features (e.g. KFENCE, DEBUG_PAGEALLOC)
do manipulate ptes in softirq context, which triggered the warnings.

So let's take the simplest and safest route and disable the batching
optimization in interrupt contexts. This makes these users no worse off
than prior to the optimization. Additionally the known offenders are
debug features that only manipulate a single PTE, so there is no
performance gain anyway.

There may be some obscure case of encrypted/decrypted DMA with the
dma_free_coherent called from an interrupt context, but again, this is
no worse off than prior to the commit.

Some options for supporting nesting were considered, but there is a
difficult to solve problem if any code manipulates ptes within interrupt
context but *outside of* a lazy mmu region. If this case exists, the
code would expect the updates to be immediate, but because the task
context may have already been in lazy mmu mode, the updates would be
deferred, which could cause incorrect behaviour. This problem is avoided
by always ensuring updates within interrupt context are immediate.

Fixes: 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel mappings")
Reported-by: syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-arm-kernel/681f2a09.050a0220.f2294.0006.GAE@google.com/
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---

Hi Will,

I've tested before and after with KFENCE enabled and it solves the issue. I've
also run all the mm-selftests which all continue to pass.

Catalin suggested a Fixes patch targetting the SHA as it is in for-next/mm was
the preferred approach, but shout if you want something different. I'm hoping
that with this fix we can still make it for this cycle, subject to not finding
any more issues.

Thanks,
Ryan


 arch/arm64/include/asm/pgtable.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index ab4a1b19e596..e65083ec35cb 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -64,7 +64,11 @@ static inline void queue_pte_barriers(void)
 {
 	unsigned long flags;

-	VM_WARN_ON(in_interrupt());
+	if (in_interrupt()) {
+		emit_pte_barriers();
+		return;
+	}
+
 	flags = read_thread_flags();

 	if (flags & BIT(TIF_LAZY_MMU)) {
@@ -79,7 +83,9 @@ static inline void queue_pte_barriers(void)
 #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 static inline void arch_enter_lazy_mmu_mode(void)
 {
-	VM_WARN_ON(in_interrupt());
+	if (in_interrupt())
+		return;
+
 	VM_WARN_ON(test_thread_flag(TIF_LAZY_MMU));

 	set_thread_flag(TIF_LAZY_MMU);
@@ -87,12 +93,18 @@ static inline void arch_enter_lazy_mmu_mode(void)

 static inline void arch_flush_lazy_mmu_mode(void)
 {
+	if (in_interrupt())
+		return;
+
 	if (test_and_clear_thread_flag(TIF_LAZY_MMU_PENDING))
 		emit_pte_barriers();
 }

 static inline void arch_leave_lazy_mmu_mode(void)
 {
+	if (in_interrupt())
+		return;
+
 	arch_flush_lazy_mmu_mode();
 	clear_thread_flag(TIF_LAZY_MMU);
 }
--
2.43.0

