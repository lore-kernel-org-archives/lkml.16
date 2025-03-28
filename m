Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7AF2356A3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168563; cv=none; b=AZKMba5SGrpMOlJiwvaRQdn6woOZVu26VxrqGX/CPaV45Cs34lKfR6hvu//gqabxz6Vv6bIUXm5CvH4SXJCENmkK9woLhZVbKhpCBJUIjPLeQjhh88zElRbiPpeP1OzM1k1TV7y2m85qxx5g7lgTcBKku4BoNfHYykdGMhrn8CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168563; c=relaxed/simple;
	bh=WpqYCmjDIdupb8yXwuJg+5H+hsNUqhDNiN1/6wHf950=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AhULqFuI3PtCFmOj219PqRFkWf7CrzmWurN25wo9etuJSt5Fd8RQQIejW2fE4p0NwUkOE6q3OFkJNq7Xkp2obnPsBsmTtCHA4gcWkncNrxbohYGW0bIhsMKip6NH+lGi2xvfQkNb3pJdWMHw9nCLsoIv+3a5huUCbHSBN2dkcUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSEpKWhc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSEpKWhc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581AAC4CEE4;
	Fri, 28 Mar 2025 13:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168563;
	bh=WpqYCmjDIdupb8yXwuJg+5H+hsNUqhDNiN1/6wHf950=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tSEpKWhcFRzT4Luj28SgY5cuzp0xj2CDZ/pD8RxTQvVetsWemdGsMUBrCnIOW0rwY
	 CXXYqrAwxU4KbYhN8Ntjw2G4m4aI+kCQ18GqWUXRmkWkZ4aSbX7pNlFRFh3ftsgTK0
	 1klPu8GJDk0KZLhyGlbUy6NVVcAs9kSi2KSXampCSRoOpu7NzMFj1XtKMeY1QMVwZe
	 GirZNvfh0g963hknGLW9PCCcnuyd+4yPQ43QGm16qdzkvSt1Xn88jYqaaeYa/ciblI
	 SfdF67C/bUlQ0cVWcI8sy2c04kVHRgzCp0cXx4z3twPSMv8EhVyErIkZS3rw/6/zkm
	 cc318XdkvUc4w==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 49/49] x86/alternatives: Rename 'apply_relocation()' to 'text_poke_apply_relocation()'
Date: Fri, 28 Mar 2025 14:27:04 +0100
Message-ID: <20250328132704.1901674-50-mingo@kernel.org>
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

Join the text_poke_*() API namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/text-patching.h | 2 +-
 arch/x86/kernel/alternative.c        | 6 +++---
 arch/x86/kernel/callthunks.c         | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index 53ac94743e5d..335f88b54ed0 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -15,7 +15,7 @@
 
 extern void text_poke_early(void *addr, const void *opcode, size_t len);
 
-extern void apply_relocation(u8 *buf, const u8 * const instr, size_t instrlen, u8 *repl, size_t repl_len);
+extern void text_poke_apply_relocation(u8 *buf, const u8 * const instr, size_t instrlen, u8 *repl, size_t repl_len);
 
 /*
  * Clear and restore the kernel write-protection flag on the local CPU.
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index a855db342c6a..cd5b69b6eff8 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -340,7 +340,7 @@ static void __apply_relocation(u8 *buf, const u8 * const instr, size_t instrlen,
 	}
 }
 
-void apply_relocation(u8 *buf, const u8 * const instr, size_t instrlen, u8 *repl, size_t repl_len)
+void text_poke_apply_relocation(u8 *buf, const u8 * const instr, size_t instrlen, u8 *repl, size_t repl_len)
 {
 	__apply_relocation(buf, instr, instrlen, repl, repl_len);
 	optimize_nops(instr, buf, instrlen);
@@ -496,7 +496,7 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 		for (; insn_buff_sz < a->instrlen; insn_buff_sz++)
 			insn_buff[insn_buff_sz] = 0x90;
 
-		apply_relocation(insn_buff, instr, a->instrlen, replacement, a->replacementlen);
+		text_poke_apply_relocation(insn_buff, instr, a->instrlen, replacement, a->replacementlen);
 
 		DUMP_BYTES(ALT, instr, a->instrlen, "%px:   old_insn: ", instr);
 		DUMP_BYTES(ALT, replacement, a->replacementlen, "%px:   rpl_insn: ", replacement);
@@ -1981,7 +1981,7 @@ __visible noinline void __init __alt_reloc_selftest(void *arg)
 static noinline void __init alt_reloc_selftest(void)
 {
 	/*
-	 * Tests apply_relocation().
+	 * Tests text_poke_apply_relocation().
 	 *
 	 * This has a relative immediate (CALL) in a place other than the first
 	 * instruction and additionally on x86_64 we get a RIP-relative LEA:
diff --git a/arch/x86/kernel/callthunks.c b/arch/x86/kernel/callthunks.c
index 25ae54250112..e016c5780d42 100644
--- a/arch/x86/kernel/callthunks.c
+++ b/arch/x86/kernel/callthunks.c
@@ -186,7 +186,7 @@ static void *patch_dest(void *dest, bool direct)
 	u8 *pad = dest - tsize;
 
 	memcpy(insn_buff, skl_call_thunk_template, tsize);
-	apply_relocation(insn_buff, pad, tsize, skl_call_thunk_template, tsize);
+	text_poke_apply_relocation(insn_buff, pad, tsize, skl_call_thunk_template, tsize);
 
 	/* Already patched? */
 	if (!bcmp(pad, insn_buff, tsize))
@@ -295,7 +295,7 @@ static bool is_callthunk(void *addr)
 	pad = (void *)(dest - tmpl_size);
 
 	memcpy(insn_buff, skl_call_thunk_template, tmpl_size);
-	apply_relocation(insn_buff, pad, tmpl_size, skl_call_thunk_template, tmpl_size);
+	text_poke_apply_relocation(insn_buff, pad, tmpl_size, skl_call_thunk_template, tmpl_size);
 
 	return !bcmp(pad, insn_buff, tmpl_size);
 }
@@ -313,7 +313,7 @@ int x86_call_depth_emit_accounting(u8 **pprog, void *func, void *ip)
 		return 0;
 
 	memcpy(insn_buff, skl_call_thunk_template, tmpl_size);
-	apply_relocation(insn_buff, ip, tmpl_size, skl_call_thunk_template, tmpl_size);
+	text_poke_apply_relocation(insn_buff, ip, tmpl_size, skl_call_thunk_template, tmpl_size);
 
 	memcpy(*pprog, insn_buff, tmpl_size);
 	*pprog += tmpl_size;
-- 
2.45.2

