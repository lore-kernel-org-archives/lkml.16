Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E921AD3E5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168455; cv=none; b=MvR8e4hq/6sqNfvW1qkH9tu6DIFJ/uOpJsDBL77YDopNgPyBbBY6KJ6WrYzQiob6sa3jiDBzp9djUGakWbLpbJnPEK/3ItW2iGvq8rcc8K0Jqf7DWfqDJ6Uk51lYMQIqj1oj3qFf2JM7etlCfJnSNb6im+204px+yjII8v27NgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168455; c=relaxed/simple;
	bh=8DvdvOWy2kLAuTbQliXx0Rh+mCp0ZmFREu6YLMZjsPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/CxStG0t6VkngWhRLDOvGISSP09bfpYZHtYqXdo1tetykPDjHgU8g8JhyDWXWDYH0WyIIm6j+40JeHKwTGe84xtT7dS7lSsXi0i7clf8LcSEXNHiukxDHq06QiNVZcHum7+cM2hSls3FtA02BhIDW/dvSxLHxHpJENYJCvEhDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIHZ62c5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIHZ62c5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46952C4CEE5;
	Fri, 28 Mar 2025 13:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168455;
	bh=8DvdvOWy2kLAuTbQliXx0Rh+mCp0ZmFREu6YLMZjsPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nIHZ62c5o1AZUn4vWh8rtBStwGp+TEmyccdkFJYdwBTOA8moAjrrUP8C8c6AHWG0+
	 jiHDj/CFPU6Zghmkv+0aI0a57y/Ozp8PQRqnNxvzw+prmZzCDgBvcTHnW0DIOh81LL
	 Uy4EJwUxrfBxmgfCp9DOozYT+Eyr4sYDBwd9JfSk5vucJuOcAtGX+32rALmLeDlBgA
	 4pxJ54a3wUb76mxtjNjs/kAgu0Ls1xHLCAXG7S5pW3+X211j8VyxLJkCv6e21EZchb
	 zDME/g5wpvbhekb629pfwN7549kQ4uaFepMP6r/JrFsNXFa/oCDJnZh36V5krsdaq+
	 u1PN5LDqDeznw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 05/49] x86/alternatives: Rename 'poke_int3_handler()' to 'smp_text_poke_int3_trap_handler()'
Date: Fri, 28 Mar 2025 14:26:20 +0100
Message-ID: <20250328132704.1901674-6-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328132704.1901674-1-mingo@kernel.org>
References: <20250328132704.1901674-1-mingo@kernel.org>
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
index 5189188b5e49..42eb607c8629 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -38,7 +38,7 @@ extern void *text_poke_copy(void *addr, const void *opcode, size_t len);
 #define text_poke_copy text_poke_copy
 extern void *text_poke_copy_locked(void *addr, const void *opcode, size_t len, bool core_ok);
 extern void *text_poke_set(void *addr, int c, size_t len);
-extern int poke_int3_handler(struct pt_regs *regs);
+extern int smp_text_poke_int3_trap_handler(struct pt_regs *regs);
 extern void smp_text_poke_single(void *addr, const void *opcode, size_t len, const void *emulate);
 
 extern void text_poke_queue(void *addr, const void *opcode, size_t len, const void *emulate);
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 826c389b22eb..e4c97c39eda1 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2515,7 +2515,7 @@ static __always_inline int patch_cmp(const void *key, const void *elt)
 	return 0;
 }
 
-noinstr int poke_int3_handler(struct pt_regs *regs)
+noinstr int smp_text_poke_int3_trap_handler(struct pt_regs *regs)
 {
 	struct int3_patching_desc *desc;
 	struct text_poke_loc *tp;
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 9f88b8a78e50..e84fdc39de6a 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -882,16 +882,16 @@ static void do_int3_user(struct pt_regs *regs)
 DEFINE_IDTENTRY_RAW(exc_int3)
 {
 	/*
-	 * poke_int3_handler() is completely self contained code; it does (and
+	 * smp_text_poke_int3_trap_handler() is completely self contained code; it does (and
 	 * must) *NOT* call out to anything, lest it hits upon yet another
 	 * INT3.
 	 */
-	if (poke_int3_handler(regs))
+	if (smp_text_poke_int3_trap_handler(regs))
 		return;
 
 	/*
 	 * irqentry_enter_from_user_mode() uses static_branch_{,un}likely()
-	 * and therefore can trigger INT3, hence poke_int3_handler() must
+	 * and therefore can trigger INT3, hence smp_text_poke_int3_trap_handler() must
 	 * be done before. If the entry came from kernel mode, then use
 	 * nmi_enter() because the INT3 could have been hit in any context
 	 * including NMI.
-- 
2.45.2

