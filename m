Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4605D237708
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743587173; cv=none; b=YTSC4i5JjoA1gyJymy0Z8uqt4OUX1IdvnzFgCQplOslaPW7zduAVGmq2kOtclZ25lS+zFLtP6HXSnsaaMRQCk+xPOtuMJkjJyOMpj3SeVVHAPH1Gjv7vwkNt+edrINYQFBMlCZwiZeHpfx4QKECAekpdyBx+SDRzA8FCT7VAinM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743587173; c=relaxed/simple;
	bh=LzxZ5sTf9IdjgunuzNLwa+CdQ18YCsx3f6grbp1Qr2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJDF2AGpDHBsRThDMHMcRTSjVy14qs7BxFKTsfG00wp1JzFFaTB4FQWnTYiKp72iM80tlzTaBTzXRx5h7iA4wxQ1Dq46z9QWOJYxK9O0gMQCickEU4E4d9dodfmw1TerIDqdErVnvSPX0eN/rv863UrpCjaBcmtUn1xpcPkZB2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOXJYfP8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOXJYfP8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73293C4CEE9;
	Wed,  2 Apr 2025 09:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743587172;
	bh=LzxZ5sTf9IdjgunuzNLwa+CdQ18YCsx3f6grbp1Qr2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aOXJYfP8mVe3bJEhjjipQ1pTDIQx/L43ogVwl1d/uImHcukCS7i38pXw7Bq7GhIz5
	 /wem1Ax0i+drhDJuhrIKxWDecr3BUgb8EIB5A80syJWHtxeYoqmEu0AxF6KT41i94R
	 2dZlcuWELRQeH4yjR5RP744p0LKoHn3r+38DorfbyU+vBf7tL8KzOTSdggVkEwB8Yp
	 HfrNADwFQPlWxKbkKvaWL0p/OgUY5n/tqM2rYaOx3tnBUt4YtXjbiluk0UOtroy3EG
	 Jh0EaPO0988W+N2uqEHqj0CbeB7+gTmsfqSal6zcDm1QXjMFfqW68SLWDPdSf304Zb
	 WYf+HHxCNW6pg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 5/7] x86/mm: Allow temporary MMs when IRQs are on
Date: Wed,  2 Apr 2025 11:45:38 +0200
Message-ID: <20250402094540.3586683-6-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250402094540.3586683-1-mingo@kernel.org>
References: <20250402094540.3586683-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Lutomirski <luto@kernel.org>

EFI runtime services should use temporary MMs, but EFI runtime services
want IRQs on.  Preemption must still be disabled in a temporary MM context.

At some point, the entirely temporary MM mechanism should be moved out of
arch code.

Signed-off-by: Andy Lutomirski <luto@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Link: https://lore.kernel.org/r/20241119163035.758732080@infradead.org
---
 arch/x86/mm/tlb.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index e672508ca158..8e4818ce04a5 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -978,18 +978,23 @@ void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
  * that override the kernel memory protections (e.g., W^X), without exposing the
  * temporary page-table mappings that are required for these write operations to
  * other CPUs. Using a temporary mm also allows to avoid TLB shootdowns when the
- * mapping is torn down.
+ * mapping is torn down.  Temporary mms can also be used for EFI runtime service
+ * calls or similar functionality.
  *
- * Context: The temporary mm needs to be used exclusively by a single core. To
- *          harden security IRQs must be disabled while the temporary mm is
- *          loaded, thereby preventing interrupt handler bugs from overriding
- *          the kernel memory protection.
+ * It is illegal to schedule while using a temporary mm -- the context switch
+ * code is unaware of the temporary mm and does not know how to context switch.
+ * Use a real (non-temporary) mm in a kernel thread if you need to sleep.
+ *
+ * Note: For sensitive memory writes, the temporary mm needs to be used
+ *       exclusively by a single core, and IRQs should be disabled while the
+ *       temporary mm is loaded, thereby preventing interrupt handler bugs from
+ *       overriding the kernel memory protection.
  */
 struct mm_struct *use_temporary_mm(struct mm_struct *temp_mm)
 {
 	struct mm_struct *prev_mm;
 
-	lockdep_assert_irqs_disabled();
+	lockdep_assert_preemption_disabled();
 
 	/*
 	 * Make sure not to be in TLB lazy mode, as otherwise we'll end up
@@ -1021,7 +1026,7 @@ struct mm_struct *use_temporary_mm(struct mm_struct *temp_mm)
 
 void unuse_temporary_mm(struct mm_struct *prev_mm)
 {
-	lockdep_assert_irqs_disabled();
+	lockdep_assert_preemption_disabled();
 
 	/* Clear the cpumask, to indicate no TLB flushing is needed anywhere */
 	cpumask_clear_cpu(smp_processor_id(), mm_cpumask(this_cpu_read(cpu_tlbstate.loaded_mm)));
-- 
2.45.2

