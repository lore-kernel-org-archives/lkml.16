Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1141A2BD5B7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350194; cv=none; b=XLXfDUO7XHp1wkw5EwwwQDwCuAegvidAXQbOsSZKRs1jfMq4VwcuO8blxxorN+VXjjfoedJnRxrrXI+dtJbp0QJDjpxlfF1aJh3xNr5ASZXBcP8P0hvrzdIo1HpM6a9/mtBq/JPFeFB6LMy0HI+cMtNo8mDUglq3h8yP+XeCdjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350194; c=relaxed/simple;
	bh=badTX7FT8IohDN00i2VjzI29ky2TF4awZx5U6VyzMFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OMX0uecMIxv9gQBk58o3LC+Rpq9XrkUUs3nPAWYTHY4tY48OduOotcDUIp7kIw8d7ahe4yqGgKFg66cSsgMnGptINB97tQ2D6tQQ6P0LslNNYZIfyhBOXhVuRUJuEMAqAcOb+KHHObd4jkEP774uuasUbNB88JBXG8e3uvXYjcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HcDO9Pch; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HcDO9Pch"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7D3C4CEE5;
	Fri, 11 Apr 2025 05:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350193;
	bh=badTX7FT8IohDN00i2VjzI29ky2TF4awZx5U6VyzMFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HcDO9PchsMf0EyHUg2b6ZODqgZPR8tFsEH+t8nw9rKERrxjjIlc2mor7xizqOtaCz
	 zr4WwKDYzfgFiVhNRwkOSXRbrKAC77UKqy2lzAGHw6PAfTatEDAPMN255VgaIHo3vD
	 yYidC/znKIv7N6gw4DljjJbuXZkuABc8j4+JJGO8q5rQf+HUxuROqxzaRUZKdzvLEn
	 s4DFe0QvRQ9SZKvDUC7EjwJT1U7nDaXzn1zTXrlPn/Q4lH3M7FX9iITMN6rsY81hLW
	 gVNgu7mc7/qPZqSknRd/a9VT8OV0sQRk2wCCNbtFjveK5lalwFPHMJQKsiSlDdM5Rs
	 KBHzpo5pe6NTA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 51/53] x86/alternatives: Rename 'apply_relocation()' to 'text_poke_apply_relocation()'
Date: Fri, 11 Apr 2025 07:41:03 +0200
Message-ID: <20250411054105.2341982-52-mingo@kernel.org>
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

Join the text_poke_*() API namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/text-patching.h | 2 +-
 arch/x86/kernel/alternative.c        | 6 +++---
 arch/x86/kernel/callthunks.c         | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index a45ac8a223f3..5337f1be18f6 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -15,7 +15,7 @@
 
 extern void text_poke_early(void *addr, const void *opcode, size_t len);
 
-extern void apply_relocation(u8 *buf, const u8 * const instr, size_t instrlen, u8 *repl, size_t repl_len);
+extern void text_poke_apply_relocation(u8 *buf, const u8 * const instr, size_t instrlen, u8 *repl, size_t repl_len);
 
 /*
  * Clear and restore the kernel write-protection flag on the local CPU.
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 9ee6f879bce5..231b2acbe360 100644
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
index d86d7d6e750c..a951333c5995 100644
--- a/arch/x86/kernel/callthunks.c
+++ b/arch/x86/kernel/callthunks.c
@@ -185,7 +185,7 @@ static void *patch_dest(void *dest, bool direct)
 	u8 *pad = dest - tsize;
 
 	memcpy(insn_buff, skl_call_thunk_template, tsize);
-	apply_relocation(insn_buff, pad, tsize, skl_call_thunk_template, tsize);
+	text_poke_apply_relocation(insn_buff, pad, tsize, skl_call_thunk_template, tsize);
 
 	/* Already patched? */
 	if (!bcmp(pad, insn_buff, tsize))
@@ -294,7 +294,7 @@ static bool is_callthunk(void *addr)
 	pad = (void *)(dest - tmpl_size);
 
 	memcpy(insn_buff, skl_call_thunk_template, tmpl_size);
-	apply_relocation(insn_buff, pad, tmpl_size, skl_call_thunk_template, tmpl_size);
+	text_poke_apply_relocation(insn_buff, pad, tmpl_size, skl_call_thunk_template, tmpl_size);
 
 	return !bcmp(pad, insn_buff, tmpl_size);
 }
@@ -312,7 +312,7 @@ int x86_call_depth_emit_accounting(u8 **pprog, void *func, void *ip)
 		return 0;
 
 	memcpy(insn_buff, skl_call_thunk_template, tmpl_size);
-	apply_relocation(insn_buff, ip, tmpl_size, skl_call_thunk_template, tmpl_size);
+	text_poke_apply_relocation(insn_buff, ip, tmpl_size, skl_call_thunk_template, tmpl_size);
 
 	memcpy(*pprog, insn_buff, tmpl_size);
 	*pprog += tmpl_size;
-- 
2.45.2

