Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC3D1D61B1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108852; cv=none; b=Lfincnhp1gVfSz9Jynmfoa+Isic0WNwuWSUfmi9ZB7loTzsos6R6wvRtThv5S4SxwTmM1MU1wsqmLKbOXe2qB26riCPvWP+bIwghtL21And6/Z9SW2Odh8ORA87aXYh+px1TZY+6lf3QfXulcdA0sV3awqqOnnGcT6BD/Z5CXW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108852; c=relaxed/simple;
	bh=11k590VP3/2pKNqreW1J4GJIFV7KwjrehK3Zi7KY10c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UoQbrO2B0E6s4ovrVPfKu0ib1FNddhC2F64ivXgyaoMDIfwDMyDrQnYPkIZFzjqx99bfNumD3XzgYjat/V6ZeglSsag3KDaorKk1VP9lY5VKEoGMVaXL/Syybzhjbpqdhngy10bfWYbx21uax0kqoa9rfLS8zlrDVP0ZGnA0gT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzRQvrmt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzRQvrmt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C150CC4CEE8;
	Thu, 27 Mar 2025 20:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108852;
	bh=11k590VP3/2pKNqreW1J4GJIFV7KwjrehK3Zi7KY10c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pzRQvrmtri109Bvka24iIEl7D/vO4qnVzizHUqCgAd16z8LpJ9/KpOFMpaVFHylX9
	 ckCzsdtjiMHdL3J/p/i5S3IZ5jk+HBjy5fNKEQzxd4KlmOczVARkddMZTXzMM1sRfZ
	 ZUAgZCu9wqbtVS5Q5Ou2vZXgoGoxjjxI0uSZ/cx7IY7C5gsQOZXJpnGM3GeymlkoGT
	 HNf8aE37H2q4xkQu78Sc1UxSd2fPTHBLvXu/gE6VOYSdemVTrVErqfaUXb8bGfCUs6
	 BJp1WwETYOizrqFsLW0dBaBpNII1+/01WLwQoNJGZ9fOSZBx0+lEoGUksmwsDsrUGs
	 4h0JomTByg2KQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 05/41] x86/alternatives: Rename 'poke_int3_handler()' to 'text_poke_int3_handler()'
Date: Thu, 27 Mar 2025 21:53:18 +0100
Message-ID: <20250327205355.378659-6-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327205355.378659-1-mingo@kernel.org>
References: <20250327205355.378659-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All related functions in this subsystem already have a
text_poke_int3_ prefix - add it to the trap handler
as well.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/text-patching.h | 2 +-
 arch/x86/kernel/alternative.c        | 2 +-
 arch/x86/kernel/traps.c              | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index 944b2aad4351..fbca0bd725b6 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -38,7 +38,7 @@ extern void *text_poke_copy(void *addr, const void *opcode, size_t len);
 #define text_poke_copy text_poke_copy
 extern void *text_poke_copy_locked(void *addr, const void *opcode, size_t len, bool core_ok);
 extern void *text_poke_set(void *addr, int c, size_t len);
-extern int poke_int3_handler(struct pt_regs *regs);
+extern int text_poke_int3_handler(struct pt_regs *regs);
 extern void text_poke_int3(void *addr, const void *opcode, size_t len, const void *emulate);
 
 extern void text_poke_queue(void *addr, const void *opcode, size_t len, const void *emulate);
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 661cb6b1fbc3..5d410c97d451 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2515,7 +2515,7 @@ static __always_inline int patch_cmp(const void *key, const void *elt)
 	return 0;
 }
 
-noinstr int poke_int3_handler(struct pt_regs *regs)
+noinstr int text_poke_int3_handler(struct pt_regs *regs)
 {
 	struct int3_patching_desc *desc;
 	struct text_poke_loc *tp;
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 9f88b8a78e50..b4c7bfb06ea1 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -882,16 +882,16 @@ static void do_int3_user(struct pt_regs *regs)
 DEFINE_IDTENTRY_RAW(exc_int3)
 {
 	/*
-	 * poke_int3_handler() is completely self contained code; it does (and
+	 * text_poke_int3_handler() is completely self contained code; it does (and
 	 * must) *NOT* call out to anything, lest it hits upon yet another
 	 * INT3.
 	 */
-	if (poke_int3_handler(regs))
+	if (text_poke_int3_handler(regs))
 		return;
 
 	/*
 	 * irqentry_enter_from_user_mode() uses static_branch_{,un}likely()
-	 * and therefore can trigger INT3, hence poke_int3_handler() must
+	 * and therefore can trigger INT3, hence text_poke_int3_handler() must
 	 * be done before. If the entry came from kernel mode, then use
 	 * nmi_enter() because the INT3 could have been hit in any context
 	 * including NMI.
-- 
2.45.2

