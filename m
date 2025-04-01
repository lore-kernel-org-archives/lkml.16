Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28DC1C84D2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743481652; cv=none; b=dNDYkDs3TSJLskgDYM1q8K/UmCnyowwewuavLXXBn0AX+PlOrg59+n3evyGMdDWlnHalVsqaOTwwXAAI94XPBVw59bFfMRxNSEM1HL1h7SCQf/gZR2x8f5fLkDqd7EvcrMXURkPL/3slfFKwOOWLYwQ6OI/5jXCOUmdfro2GLMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743481652; c=relaxed/simple;
	bh=bCx7geUMIOM3KKzXlGKmU1tmG38ls8IrUrBTI29be+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RWxPGFi45kr4YPUJhAXEJuo8F1U8VsyDL1EoYxUOoHjfibysg+qXwVwKeQbMXa2FIGlMO2u3gqHHQonKPkII9cwICwoajmR7DI06guUNRu7+OyR0nS2Au/1/bzur4DRT0mBTKdnUfROROqk9MVHzdIwuN0H3mri53FXcBXjpd+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9KjLaaa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9KjLaaa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66103C4CEEB;
	Tue,  1 Apr 2025 04:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743481652;
	bh=bCx7geUMIOM3KKzXlGKmU1tmG38ls8IrUrBTI29be+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A9KjLaaa9zmYt5ogUVCXxfbXwJjrrkCo62IEGRGpD2CaRKlm4OjAep8aZKUVntO3T
	 hZAlWtxJFcUbiVAkLDzDbnH/67g4oDvMSZyB7H2ApC01xaiKMplLItagVRhjTGMAwL
	 M+5Z+kqz3ArF32FcLzIP2146Jt2ryPtlvPOtj1FNZJgKvhYGerKtmXgWQLbQpP+5rb
	 K9lRZXbdFXJpl0dDHcVCH4GN6ZN7XBwtAcu08SlMjZYiVg5th5u2JHDQsQd47yjxzA
	 DoAyEBUm+sFm2wx8PJEVKAfI4JRyCqbcpqUzWzP0Wz5Xevz/uFEA6Dhj6Rp/q8Eo4c
	 XqHYb3kSXkulA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 04/11] Revert "objtool: Increase per-function WARN_FUNC() rate limit"
Date: Mon, 31 Mar 2025 21:26:39 -0700
Message-ID: <e5abe5e858acf1a9207a5dfa0f37d17ac9dca872.1743481539.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1743481539.git.jpoimboe@kernel.org>
References: <cover.1743481539.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 0a7fb6f07e3ad497d31ae9a2082d2cacab43d54a.

The "skipping duplicate warnings" warning is technically not an actual
warning, which can cause confusion.  This feature isn't all that useful
anyway.  It's exceedingly rare for a function to have more than one
unrelated warning.

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c                |  4 ++--
 tools/objtool/include/objtool/elf.h  |  2 +-
 tools/objtool/include/objtool/warn.h | 14 +++-----------
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index bd0c78bfe90c..c8b3c8e7090c 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3545,7 +3545,7 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 
 			WARN("%s() falls through to next function %s()",
 			     func->name, insn_func(insn)->name);
-			func->warnings++;
+			func->warned = 1;
 
 			return 1;
 		}
@@ -4576,7 +4576,7 @@ static void disas_warned_funcs(struct objtool_file *file)
 	char *funcs = NULL, *tmp;
 
 	for_each_sym(file, sym) {
-		if (sym->warnings) {
+		if (sym->warned) {
 			if (!funcs) {
 				funcs = malloc(strlen(sym->name) + 1);
 				if (!funcs) {
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index eba04392c6fd..c7c4e87ebe88 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -65,11 +65,11 @@ struct symbol {
 	u8 return_thunk      : 1;
 	u8 fentry            : 1;
 	u8 profiling_func    : 1;
+	u8 warned	     : 1;
 	u8 embedded_insn     : 1;
 	u8 local_label       : 1;
 	u8 frame_pointer     : 1;
 	u8 ignore	     : 1;
-	u8 warnings	     : 2;
 	struct list_head pv_target;
 	struct reloc *relocs;
 };
diff --git a/tools/objtool/include/objtool/warn.h b/tools/objtool/include/objtool/warn.h
index b29ac144e4f5..e3ad9b2caf87 100644
--- a/tools/objtool/include/objtool/warn.h
+++ b/tools/objtool/include/objtool/warn.h
@@ -57,22 +57,14 @@ static inline char *offstr(struct section *sec, unsigned long offset)
 	free(_str);					\
 })
 
-#define WARN_LIMIT 2
-
 #define WARN_INSN(insn, format, ...)					\
 ({									\
 	struct instruction *_insn = (insn);				\
-	BUILD_BUG_ON(WARN_LIMIT > 2);					\
-	if (!_insn->sym || _insn->sym->warnings < WARN_LIMIT) {		\
+	if (!_insn->sym || !_insn->sym->warned)				\
 		WARN_FUNC(format, _insn->sec, _insn->offset,		\
 			  ##__VA_ARGS__);				\
-		if (_insn->sym)						\
-			_insn->sym->warnings++;				\
-	} else if (_insn->sym && _insn->sym->warnings == WARN_LIMIT) {	\
-		WARN_FUNC("skipping duplicate warning(s)",		\
-			  _insn->sec, _insn->offset);			\
-		_insn->sym->warnings++;					\
-	}								\
+	if (_insn->sym)							\
+		_insn->sym->warned = 1;					\
 })
 
 #define BT_INSN(insn, format, ...)				\
-- 
2.48.1

