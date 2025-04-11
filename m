Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB5627F4D5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350089; cv=none; b=NI35HSw4z80KGnV2AatPU4Mh51qQs7a81HE0Foci2QAKFC+eGOXtJUAqIdmaDg/NJIxkV9AkAaYIwfuRfzzPHSvrOzxGGpskvb6nj3Qz8nhiqdHQojzhm4zkzYMzoidV6zBvZmLynrgKsqzSJD6Agjc0f4VFIVw2u9oP09myPDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350089; c=relaxed/simple;
	bh=yGn827/rRWfL186zZgfsLQuLGVHOWwaC+FBYsTpnot0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aoT24nASFAuHu8cJQ64ooOrZtPLxLUmVz0YtbdZfLe7OMZlxJReK1HK67uh6PF79wU7DsDqOaBaH0TrHUTprf7aj1Tp2PrETU9BQQdc09ggQh5pcD/jujKB/xubd+pVoWNuZ+oYnmxWrqLrXpDRSgz/U+o8mdTdY6rKxhvK3eD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O90H+I/2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O90H+I/2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B29C4CEEB;
	Fri, 11 Apr 2025 05:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350089;
	bh=yGn827/rRWfL186zZgfsLQuLGVHOWwaC+FBYsTpnot0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O90H+I/2h0hLqsdCO8Ngb65mNFtNg8eMxw4d+Qkm9K/qnYT659hBc1MPNk/zLtV8/
	 xS74lUUg2J6ryOeWBGG9r/dUofHP3yRCCIv5FE9KslpIpEI53xJX2gq1LI8Wb15pDC
	 SvOPClLyoedEgfWl8yPEAd+uIBwlaLxBqJbyxO3jLtPe6AHamMamL2kqKX/Iurik2j
	 5/d3eNnoZwYCLfgyn8B6mBiTOI9BuLUis2BtPVeu/2ji+OxE99YRw1XDk6iuGJ21L6
	 kxe5aiWE2CMgxQqMwbwYB+N1wqEdtjC0B88ASQ7BTsZ2LLkoS/dv0FzMbn2lWYiHxI
	 m1a6rTqsgoaew==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 07/53] x86/alternatives: Rename 'poke_int3_handler()' to 'smp_text_poke_int3_handler()'
Date: Fri, 11 Apr 2025 07:40:19 +0200
Message-ID: <20250411054105.2341982-8-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411054105.2341982-1-mingo@kernel.org>
References: <20250411054105.2341982-1-mingo@kernel.org>
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
index 5189188b5e49..93a6b7bc78bd 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -38,7 +38,7 @@ extern void *text_poke_copy(void *addr, const void *opcode, size_t len);
 #define text_poke_copy text_poke_copy
 extern void *text_poke_copy_locked(void *addr, const void *opcode, size_t len, bool core_ok);
 extern void *text_poke_set(void *addr, int c, size_t len);
-extern int poke_int3_handler(struct pt_regs *regs);
+extern int smp_text_poke_int3_handler(struct pt_regs *regs);
 extern void smp_text_poke_single(void *addr, const void *opcode, size_t len, const void *emulate);
 
 extern void text_poke_queue(void *addr, const void *opcode, size_t len, const void *emulate);
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 826c389b22eb..44269d8bf492 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2515,7 +2515,7 @@ static __always_inline int patch_cmp(const void *key, const void *elt)
 	return 0;
 }
 
-noinstr int poke_int3_handler(struct pt_regs *regs)
+noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 {
 	struct int3_patching_desc *desc;
 	struct text_poke_loc *tp;
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 9f88b8a78e50..d67407c623f3 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -882,16 +882,16 @@ static void do_int3_user(struct pt_regs *regs)
 DEFINE_IDTENTRY_RAW(exc_int3)
 {
 	/*
-	 * poke_int3_handler() is completely self contained code; it does (and
+	 * smp_text_poke_int3_handler() is completely self contained code; it does (and
 	 * must) *NOT* call out to anything, lest it hits upon yet another
 	 * INT3.
 	 */
-	if (poke_int3_handler(regs))
+	if (smp_text_poke_int3_handler(regs))
 		return;
 
 	/*
 	 * irqentry_enter_from_user_mode() uses static_branch_{,un}likely()
-	 * and therefore can trigger INT3, hence poke_int3_handler() must
+	 * and therefore can trigger INT3, hence smp_text_poke_int3_handler() must
 	 * be done before. If the entry came from kernel mode, then use
 	 * nmi_enter() because the INT3 could have been hit in any context
 	 * including NMI.
-- 
2.45.2

