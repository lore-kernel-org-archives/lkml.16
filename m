Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16482147E3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233127; cv=none; b=iGfaRYD59fXWcDr99C7rzeEnS6AG+AwLQTLjcRWD8M4ES2q4xyYEDK1knYH2EvgKepCT4WATOnSI/FTT7wJZz1GXrwx1nYnxaXe8Fo4zWyEQSdR/n+GIIlGOkslqxRYcWRtG/THJgwRsCLxq0vO3RqBXR2u4HQauaZBNSX0auSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233127; c=relaxed/simple;
	bh=KyxwRkCpc0W3aXEsLcSVXCo0y6WnzNVBnEHVFD/JCvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cbs6ArWHrjqrDU0WhxoUrvzE6UVnFVYH0VSizFZzjD+WmLOoFuYKCUV5dAY1bzvtnUNlmhg1PPFt/jT4/tWLn8TN52O9qU/OUQWD3WU3eUiZBt9vO9gymrqUc1+DKVISFZnsFYfHah0IFoXJ0exrk9/4tv/KEvgmIpm+bkQZEnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1KD3/g0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1KD3/g0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84ED5C4CEE9;
	Wed,  9 Apr 2025 21:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744233126;
	bh=KyxwRkCpc0W3aXEsLcSVXCo0y6WnzNVBnEHVFD/JCvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H1KD3/g04K6xRjD6iZt64mse9KSCnND6c2vS995TLgo1wPT4YQxMxWnuFo1ig7NWn
	 G+0MWIkgRiOdwjyDDUdxuvOAtSABF4fhmYwf+LT/z0JS/+AVfSB4kV/yO+ZvJex1AP
	 g81CtR/JiP8c8cPQjrSMoKDwxkfk3Og2RMw3x+XBKsZz8wK1Vqw0V9Vdfq2ZXVi5Kb
	 lUSLmf0ebmhOvCEVnlRGuUj83USJ9Kr5uZIvj6cvq+J3P1rMf0RswndCjssUD014t+
	 CRiwHXcYHOoTp8ZgDczCVDvjiryvujJTC9evWnpj78bIQqdaLkoUXfGMMQhgYg17zY
	 xwSY1GAgtKErg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>,
	Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 8/8] x86/fpu: Use 'fpstate' variable names consistently
Date: Wed,  9 Apr 2025 23:11:27 +0200
Message-ID: <20250409211127.3544993-9-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211127.3544993-1-mingo@kernel.org>
References: <20250409211127.3544993-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few uses of 'fps' snuck in, which is rather confusing
(to me) as it suggests frames-per-second. ;-)

Rename them to the canonical 'fpstate' name.

No change in functionality.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/fpu/api.h |  2 +-
 arch/x86/kernel/fpu/core.c     | 14 +++++++-------
 arch/x86/kernel/fpu/xstate.c   |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/fpu/api.h b/arch/x86/include/asm/fpu/api.h
index f42de5f05e7e..8e6848f55dcd 100644
--- a/arch/x86/include/asm/fpu/api.h
+++ b/arch/x86/include/asm/fpu/api.h
@@ -136,7 +136,7 @@ static inline void fpstate_free(struct fpu *fpu) { }
 #endif
 
 /* fpstate-related functions which are exported to KVM */
-extern void fpstate_clear_xstate_component(struct fpstate *fps, unsigned int xfeature);
+extern void fpstate_clear_xstate_component(struct fpstate *fpstate, unsigned int xfeature);
 
 extern u64 xstate_get_guest_group_perm(void);
 
diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index 4d1a205b7ce2..d0a45f6492cb 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -273,16 +273,16 @@ EXPORT_SYMBOL_GPL(fpu_alloc_guest_fpstate);
 
 void fpu_free_guest_fpstate(struct fpu_guest *gfpu)
 {
-	struct fpstate *fps = gfpu->fpstate;
+	struct fpstate *fpstate = gfpu->fpstate;
 
-	if (!fps)
+	if (!fpstate)
 		return;
 
-	if (WARN_ON_ONCE(!fps->is_valloc || !fps->is_guest || fps->in_use))
+	if (WARN_ON_ONCE(!fpstate->is_valloc || !fpstate->is_guest || fpstate->in_use))
 		return;
 
 	gfpu->fpstate = NULL;
-	vfree(fps);
+	vfree(fpstate);
 }
 EXPORT_SYMBOL_GPL(fpu_free_guest_fpstate);
 
@@ -333,12 +333,12 @@ EXPORT_SYMBOL_GPL(fpu_update_guest_xfd);
  */
 void fpu_sync_guest_vmexit_xfd_state(void)
 {
-	struct fpstate *fps = x86_task_fpu(current)->fpstate;
+	struct fpstate *fpstate = x86_task_fpu(current)->fpstate;
 
 	lockdep_assert_irqs_disabled();
 	if (fpu_state_size_dynamic()) {
-		rdmsrl(MSR_IA32_XFD, fps->xfd);
-		__this_cpu_write(xfd_state, fps->xfd);
+		rdmsrl(MSR_IA32_XFD, fpstate->xfd);
+		__this_cpu_write(xfd_state, fpstate->xfd);
 	}
 }
 EXPORT_SYMBOL_GPL(fpu_sync_guest_vmexit_xfd_state);
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 00e87afa876d..79ad768647f8 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -1395,9 +1395,9 @@ void xrstors(struct xregs_state *xstate, u64 mask)
 }
 
 #if IS_ENABLED(CONFIG_KVM)
-void fpstate_clear_xstate_component(struct fpstate *fps, unsigned int xfeature)
+void fpstate_clear_xstate_component(struct fpstate *fpstate, unsigned int xfeature)
 {
-	void *addr = get_xsave_addr(&fps->regs.xsave, xfeature);
+	void *addr = get_xsave_addr(&fpstate->regs.xsave, xfeature);
 
 	if (addr)
 		memset(addr, 0, xstate_sizes[xfeature]);
-- 
2.45.2

