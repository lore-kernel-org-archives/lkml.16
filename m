Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5072CFBF0
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 15:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748618697; cv=none; b=QNeSUcaPIFI51J4EDg20vEymMT0H5abI2UOtE5LnhrThlwmcS1tlyJSTYu5Tceu2MS8zcKP5CIqRRO8GPzemy2ojxBABRUs6bhf+b/8QPsI94Utg9N6fA1oEAdwF9qAdjWeNqPpcznGaJCxPqmtz/eAgOqkxW4qL7PM2FYMz4LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748618697; c=relaxed/simple;
	bh=dG4Lw/r5IhvL9lwihBKU+13gnzXCUFKWX5w6yEB7yYo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J8qevxVRC+w/29F8AxCGGtnlWTojg8YElgRZ7FkNU+Ha6D2OVCbNLLke4bky259Ne9emGUeYS+AWJJmG9WQnFQWR+9eC3QYoHzV7EPj3VWoGF5bED2fMtmrrqYaZhGp30EcwDWDprHrG6XZknoyUVlaAZiiE8aYoNGZ8DpRWWHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADDE41692;
	Fri, 30 May 2025 08:24:37 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E68E13F5A1;
	Fri, 30 May 2025 08:24:52 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Barry Song <baohua@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64/mm: Close theoretical race where stale TLB entry remains valid
Date: Fri, 30 May 2025 16:23:47 +0100
Message-ID: <20250530152445.2430295-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 3ea277194daa ("mm, mprotect: flush TLB if potentially racing with
a parallel reclaim leaving stale TLB entries") describes a race that,
prior to the commit, could occur between reclaim and operations such as
mprotect() when using reclaim's tlbbatch mechanism. See that commit for
details but the summary is:

"""
Nadav Amit identified a theoritical race between page reclaim and
mprotect due to TLB flushes being batched outside of the PTL being held.

He described the race as follows:

	CPU0				CPU1
	----				----
					user accesses memory using RW PTE
					[PTE now cached in TLB]
	try_to_unmap_one()
	==> ptep_get_and_clear()
	==> set_tlb_ubc_flush_pending()
					mprotect(addr, PROT_READ)
					==> change_pte_range()
					==> [ PTE non-present - no flush ]

					user writes using cached RW PTE
	...

	try_to_unmap_flush()
"""

The solution was to insert flush_tlb_batched_pending() in mprotect() and
friends to explcitly drain any pending reclaim TLB flushes. In the
modern version of this solution, arch_flush_tlb_batched_pending() is
called to do that synchronisation.

arm64's tlbbatch implementation simply issues TLBIs at queue-time
(arch_tlbbatch_add_pending()), eliding the trailing dsb(ish). The
trailing dsb(ish) is finally issued in arch_tlbbatch_flush() at the end
of the batch to wait for all the issued TLBIs to complete.

Now, the Arm ARM states:

"""
The completion of the TLB maintenance instruction is guaranteed only by
the execution of a DSB by the observer that performed the TLB
maintenance instruction. The execution of a DSB by a different observer
does not have this effect, even if the DSB is known to be executed after
the TLB maintenance instruction is observed by that different observer.
"""

arch_tlbbatch_add_pending() and arch_tlbbatch_flush() conform to this
requirement because they are called from the same task (either kswapd or
caller of madvise(MADV_PAGEOUT)), so either they are on the same CPU or
if the task was migrated, __switch_to() contains an extra dsb(ish).

HOWEVER, arm64's arch_flush_tlb_batched_pending() is also implemented as
a dsb(ish). But this may be running on a CPU remote from the one that
issued the outstanding TLBIs. So there is no architectural gurantee of
synchonization. Therefore we are still vulnerable to the theoretical
race described in Commit 3ea277194daa ("mm, mprotect: flush TLB if
potentially racing with a parallel reclaim leaving stale TLB entries").

Fix this by flushing the entire mm in arch_flush_tlb_batched_pending().
This aligns with what the other arches that implement the tlbbatch
feature do.

Fixes: 43b3dfdd0455 ("arm64: support batched/deferred tlb shootdown during page reclamation/migration")
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index eba1a98657f1..7d564c2a126f 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -323,13 +323,14 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
 }

 /*
- * If mprotect/munmap/etc occurs during TLB batched flushing, we need to
- * synchronise all the TLBI issued with a DSB to avoid the race mentioned in
- * flush_tlb_batched_pending().
+ * If mprotect/munmap/etc occurs during TLB batched flushing, we need to ensure
+ * all the previously issued TLBIs targeting mm have completed. But since we
+ * can be executing on a remote CPU, a DSB cannot guarrantee this like it can
+ * for arch_tlbbatch_flush(). Our only option is to flush the entire mm.
  */
 static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
 {
-	dsb(ish);
+	flush_tlb_mm(mm);
 }

 /*
--
2.43.0

