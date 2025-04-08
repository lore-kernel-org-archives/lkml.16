Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCB1263F38
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100487; cv=none; b=hUYDmGXgYpCNRpvPWGLOHsUIj563CA6QnD+KHtjqtrHQU0MghamA5ikkCjIG81PnZkde5VhONsSd434lYNSMBg3a9nQ8nwKpQd8psIz/h68pobj3gz9MSYUDQ2uSFPBTJ6Nb9BOHvjtg+J/XtBmpS43lD3mjQ+x0yBTJ3efDT94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100487; c=relaxed/simple;
	bh=3nrms8bo08+6NLT3VdtL3YMYoYdpkWo2StUc6gHDXkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H38iu98mbCGSqvCH/+S2dM3lsSw9YY8oAg101AwPgWwdHECqeROISTAUEGdVmpLlJjcczk+OD4Wn25RdufWbGNq1w3Te+ICk2krNX7zFp52OofrsJpRz66+YUElPNb3+5vXTBvHPhZgV9i+ty1CxM5DnCHf59DeRhn44rU6pdqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tCHB6NR4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tCHB6NR4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0314AC4CEE9;
	Tue,  8 Apr 2025 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744100487;
	bh=3nrms8bo08+6NLT3VdtL3YMYoYdpkWo2StUc6gHDXkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tCHB6NR45bM0ZKk9lkFfxdfhjHfcHzzJo+mP/2EyiqzNS0QJ8xE8E+q9DZvPkYvP6
	 6Q7qa5aYhK9xWBJyBheF1YPiemHIgjXPkWhagaCvfyFi4ITAO8TCEZVz7mOrOvy2OC
	 I2kXAT796//CVcqQhG+HNiNOFE6QU4A6LXuyQ1dtNUkeJS18xOCw3LSXWD75FMOqB3
	 Vs+yORslLOvJMYb8sWGc5zjVATaXrguNDzgFnLZzsOfxbGw5kyGQTvBd11JaQYgPD8
	 GFRUYWx8Gea4MOEmUPK6GYsfUpBOnzZXNh9+HmPHbb1Qw9/NDy0JkeLU+NYVsdxLLF
	 Zn6Pi819oC/tw==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC 1/5] objtool: Remove ANNOTATE_IGNORE_ALTERNATIVE from CLAC/STAC
Date: Tue,  8 Apr 2025 01:21:14 -0700
Message-ID: <fc972ba4995d826fcfb8d02733a14be8d670900b.1744098446.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744098446.git.jpoimboe@kernel.org>
References: <cover.1744098446.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ANNOTATE_IGNORE_ALTERNATIVE adds additional noise to the code generated
by CLAC/STAC alternatives, hurting readability for those whose read
uaccess-related code generation on a regular basis.

Remove the annotation specifically for the "NOP patched with CLAC/STAC"
case in favor of a manual check.

Leave the other uses of that annotation in place as they're less common
and more difficult to detect.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/include/asm/smap.h | 12 ++++++------
 tools/objtool/check.c       | 30 +++++++++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/smap.h b/arch/x86/include/asm/smap.h
index 55a5e656e4b9..4f84d421d1cf 100644
--- a/arch/x86/include/asm/smap.h
+++ b/arch/x86/include/asm/smap.h
@@ -16,23 +16,23 @@
 #ifdef __ASSEMBLER__
 
 #define ASM_CLAC \
-	ALTERNATIVE __stringify(ANNOTATE_IGNORE_ALTERNATIVE), "clac", X86_FEATURE_SMAP
+	ALTERNATIVE "", "clac", X86_FEATURE_SMAP
 
 #define ASM_STAC \
-	ALTERNATIVE __stringify(ANNOTATE_IGNORE_ALTERNATIVE), "stac", X86_FEATURE_SMAP
+	ALTERNATIVE "", "stac", X86_FEATURE_SMAP
 
 #else /* __ASSEMBLER__ */
 
 static __always_inline void clac(void)
 {
 	/* Note: a barrier is implicit in alternative() */
-	alternative(ANNOTATE_IGNORE_ALTERNATIVE "", "clac", X86_FEATURE_SMAP);
+	alternative("", "clac", X86_FEATURE_SMAP);
 }
 
 static __always_inline void stac(void)
 {
 	/* Note: a barrier is implicit in alternative() */
-	alternative(ANNOTATE_IGNORE_ALTERNATIVE "", "stac", X86_FEATURE_SMAP);
+	alternative("", "stac", X86_FEATURE_SMAP);
 }
 
 static __always_inline unsigned long smap_save(void)
@@ -59,9 +59,9 @@ static __always_inline void smap_restore(unsigned long flags)
 
 /* These macros can be used in asm() statements */
 #define ASM_CLAC \
-	ALTERNATIVE(ANNOTATE_IGNORE_ALTERNATIVE "", "clac", X86_FEATURE_SMAP)
+	ALTERNATIVE("", "clac", X86_FEATURE_SMAP)
 #define ASM_STAC \
-	ALTERNATIVE(ANNOTATE_IGNORE_ALTERNATIVE "", "stac", X86_FEATURE_SMAP)
+	ALTERNATIVE("", "stac", X86_FEATURE_SMAP)
 
 #define ASM_CLAC_UNSAFE \
 	ALTERNATIVE("", ANNOTATE_IGNORE_ALTERNATIVE "clac", X86_FEATURE_SMAP)
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 69f94bc47499..b649049b6a11 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3505,6 +3505,34 @@ static struct instruction *next_insn_to_validate(struct objtool_file *file,
 	return next_insn_same_sec(file, alt_group->orig_group->last_insn);
 }
 
+static bool skip_alt_group(struct instruction *insn)
+{
+	struct instruction *alt_insn = insn->alts ? insn->alts->insn : NULL;
+
+	/* ANNOTATE_IGNORE_ALTERNATIVE */
+	if (insn->alt_group && insn->alt_group->ignore)
+		return true;
+
+	/*
+	 * For NOP patched with CLAC/STAC, only follow the latter to avoid
+	 * impossible code paths combining patched CLAC with unpatched STAC
+	 * or vice versa.
+	 *
+	 * ANNOTATE_IGNORE_ALTERNATIVE could have been used here, but Linus
+	 * requested not to do that to avoid hurting .s file readability
+	 * around CLAC/STAC alternative sites.
+	 */
+
+	if (!alt_insn)
+		return false;
+
+	/* Don't override ASM_{CLAC,STAC}_UNSAFE */
+	if (alt_insn->alt_group && alt_insn->alt_group->ignore)
+		return false;
+
+	return alt_insn->type == INSN_CLAC || alt_insn->type == INSN_STAC;
+}
+
 /*
  * Follow the branch starting at the given instruction, and recursively follow
  * any other branches (jumps).  Meanwhile, track the frame pointer state at
@@ -3625,7 +3653,7 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 			}
 		}
 
-		if (insn->alt_group && insn->alt_group->ignore)
+		if (skip_alt_group(insn))
 			return 0;
 
 		if (handle_insn_ops(insn, next_insn, &state))
-- 
2.49.0

