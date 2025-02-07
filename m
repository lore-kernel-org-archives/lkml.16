Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F251F8918
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931323; cv=none; b=K6d6pH2Bfswj3oJXGfloPU13Y/Kbv/BwDYAMLoi9fZEqRCI0MILCcIbTbd8WHsytqfiuzTMcP3JKh6HQe3w0oGG8B2NPZDQcl0KMCDFZ/y84NyO9MiOEhr15lKT4l6dp4JEutM3VXscM/AsTw6AGwyHA971yw6JP7at3OKf4oAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931323; c=relaxed/simple;
	bh=BdRShRuIoqsgS68j9Muq3hOau2UecWNNuUq5IdIQaKw=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=o4vH3nxjSi5vfx0OnwlTF2/QyikCUHIe/pSuMkX50WJKeVe2cKO8JPePlQ0KJLfiAt6HXc9mFCbSlQbjXaNV+xJ3HHq/2prqXZz9F6PtnlcjvTrctB79MZ0aGL2N4fD9UXvIAWur27HRdr395sR6hSmkuSYt9Edhl2LFZbMbXCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XPl6HgrX; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XPl6HgrX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=q6LpPIzm96aet4wmhQh2mb7wqpAhvniRSOi7gL2hIfI=; b=XPl6HgrXbMuHQSSmFQU/kjGg+U
	LPO6jXWy95cLk/ntI34apvLkYM/0lFUXKdcO7/WNbKzg3bIU01dysvKk7GhRX9CGoJcGVUghOind7
	THUHxQCTnkDwzsTsOQACKJ/4amp0S03UY1X9mrl9/K91Vm0Nr+VCljBKr9oKVyQQ8e5qTXK7V9K1R
	PZqUSPHM6S0RMwztk/mmgZFw5NLIWLo7emIytdM/DMawgPEYYJn4LOW8MhZGoc+flucfJFK9sk/rg
	8tAFBoCMNk4PIe7x1w/RRzoDuIjEZ/hATIJ9Jr+AK5WuSUdrngFp/UOat8Y8oPqLc7MvXPboRtPsT
	W9cDcngw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNT8-0000000HAed-3HSo;
	Fri, 07 Feb 2025 12:28:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 36313302E7A; Fri,  7 Feb 2025 13:28:25 +0100 (CET)
Message-ID: <20250207122546.617187089@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 07 Feb 2025 13:15:35 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 alyssa.milburn@intel.com,
 scott.d.constable@intel.com,
 joao@overdrivepizza.com,
 andrew.cooper3@citrix.com,
 jpoimboe@kernel.org,
 jose.marchesi@oracle.com,
 hjl.tools@gmail.com,
 ndesaulniers@google.com,
 samitolvanen@google.com,
 nathan@kernel.org,
 ojeda@kernel.org,
 kees@kernel.org,
 alexei.starovoitov@gmail.com,
 mhiramat@kernel.org
Subject: [PATCH 06/11] x86/alternative: Simplify callthunk patching
References: <20250207121529.222723073@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Now that paravirt call patching is implemented using alternatives, it
is possible to avoid having to patch the alternative sites by
including the altinstr_replacement calls in the call_sites list.

This means we're now stacking relative adjustments like so:

  callthunks_patch_builtin_calls():
    patches all function calls to target: func() -> func()-10
    since the CALL accounting lives in the CALL_PADDING.

    This explicitly includes .altinstr_replacement

  alt_replace_call():
    patches: x86_BUG() -> target()

    this patching is done in a relative manner, and will preserve
    the above adjustment, meaning that with calldepth patching it
    will do: x86_BUG()-10 -> target()-10

  apply_relocation():
    does code relocation, and adjusts all RIP-relative instructions
    to the new location, also in a relative manner.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/include/asm/alternative.h |    1 -
 arch/x86/kernel/alternative.c      |    8 ++++----
 arch/x86/kernel/callthunks.c       |   13 -------------
 arch/x86/kernel/module.c           |   17 ++++++-----------
 tools/objtool/arch/x86/decode.c    |    1 +
 tools/objtool/check.c              |   12 ++----------
 6 files changed, 13 insertions(+), 39 deletions(-)

--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -100,7 +100,6 @@ struct module;
 
 struct callthunk_sites {
 	s32				*call_start, *call_end;
-	struct alt_instr		*alt_start, *alt_end;
 };
 
 #ifdef CONFIG_CALL_THUNKS
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1697,14 +1697,14 @@ void __init alternative_instructions(voi
 	apply_retpolines(__retpoline_sites, __retpoline_sites_end);
 	apply_returns(__return_sites, __return_sites_end);
 
-	apply_alternatives(__alt_instructions, __alt_instructions_end);
-
 	/*
-	 * Now all calls are established. Apply the call thunks if
-	 * required.
+	 * Adjust all CALL instructions to point to func()-10, including
+	 * those in .altinstr_replacement.
 	 */
 	callthunks_patch_builtin_calls();
 
+	apply_alternatives(__alt_instructions, __alt_instructions_end);
+
 	/*
 	 * Seal all functions that do not have their address taken.
 	 */
--- a/arch/x86/kernel/callthunks.c
+++ b/arch/x86/kernel/callthunks.c
@@ -240,21 +240,10 @@ patch_call_sites(s32 *start, s32 *end, c
 }
 
 static __init_or_module void
-patch_alt_call_sites(struct alt_instr *start, struct alt_instr *end,
-		     const struct core_text *ct)
-{
-	struct alt_instr *a;
-
-	for (a = start; a < end; a++)
-		patch_call((void *)&a->instr_offset + a->instr_offset, ct);
-}
-
-static __init_or_module void
 callthunks_setup(struct callthunk_sites *cs, const struct core_text *ct)
 {
 	prdbg("Patching call sites %s\n", ct->name);
 	patch_call_sites(cs->call_start, cs->call_end, ct);
-	patch_alt_call_sites(cs->alt_start, cs->alt_end, ct);
 	prdbg("Patching call sites done%s\n", ct->name);
 }
 
@@ -263,8 +252,6 @@ void __init callthunks_patch_builtin_cal
 	struct callthunk_sites cs = {
 		.call_start	= __call_sites,
 		.call_end	= __call_sites_end,
-		.alt_start	= __alt_instructions,
-		.alt_end	= __alt_instructions_end
 	};
 
 	if (!cpu_feature_enabled(X86_FEATURE_CALL_DEPTH))
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -275,12 +275,7 @@ int module_finalize(const Elf_Ehdr *hdr,
 		void *rseg = (void *)returns->sh_addr;
 		apply_returns(rseg, rseg + returns->sh_size);
 	}
-	if (alt) {
-		/* patch .altinstructions */
-		void *aseg = (void *)alt->sh_addr;
-		apply_alternatives(aseg, aseg + alt->sh_size);
-	}
-	if (calls || alt) {
+	if (calls) {
 		struct callthunk_sites cs = {};
 
 		if (calls) {
@@ -288,13 +283,13 @@ int module_finalize(const Elf_Ehdr *hdr,
 			cs.call_end = (void *)calls->sh_addr + calls->sh_size;
 		}
 
-		if (alt) {
-			cs.alt_start = (void *)alt->sh_addr;
-			cs.alt_end = (void *)alt->sh_addr + alt->sh_size;
-		}
-
 		callthunks_patch_module_calls(&cs, me);
 	}
+	if (alt) {
+		/* patch .altinstructions */
+		void *aseg = (void *)alt->sh_addr;
+		apply_alternatives(aseg, aseg + alt->sh_size);
+	}
 	if (ibt_endbr) {
 		void *iseg = (void *)ibt_endbr->sh_addr;
 		apply_seal_endbr(iseg, iseg + ibt_endbr->sh_size);
--- a/tools/objtool/arch/x86/decode.c
+++ b/tools/objtool/arch/x86/decode.c
@@ -850,5 +850,6 @@ bool arch_is_rethunk(struct symbol *sym)
 bool arch_is_embedded_insn(struct symbol *sym)
 {
 	return !strcmp(sym->name, "retbleed_return_thunk") ||
+	       !strcmp(sym->name, "srso_alias_safe_ret") ||
 	       !strcmp(sym->name, "srso_safe_ret");
 }
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1283,15 +1283,6 @@ static void annotate_call_site(struct ob
 	if (!sym)
 		sym = reloc->sym;
 
-	/*
-	 * Alternative replacement code is just template code which is
-	 * sometimes copied to the original instruction. For now, don't
-	 * annotate it. (In the future we might consider annotating the
-	 * original instruction if/when it ever makes sense to do so.)
-	 */
-	if (!strcmp(insn->sec->name, ".altinstr_replacement"))
-		return;
-
 	if (sym->static_call_tramp) {
 		list_add_tail(&insn->call_node, &file->static_call_list);
 		return;
@@ -1349,7 +1340,8 @@ static void annotate_call_site(struct ob
 		return;
 	}
 
-	if (insn->type == INSN_CALL && !insn->sec->init)
+	if (insn->type == INSN_CALL && !insn->sec->init &&
+	    !insn->_call_dest->embedded_insn)
 		list_add_tail(&insn->call_node, &file->call_list);
 
 	if (!sibling && dead_end_function(file, sym))


