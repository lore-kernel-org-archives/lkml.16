Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAB91AF0BB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743481652; cv=none; b=GitwE7qydxXyW67oOTAYA+tdnCcPdKCzu+ceLSDtCcJdyto0sgCTGI9UQWPHJPuPbvStfhhdZ5hgq6H6YBOQCP8Itz+zhvRFsLaY1I/lZkvhFSpNVegFRFCAdJo7UPJwOVctQRCv74fqWd9Saelyh5H+3bBCMQYIFvuOyEoFuJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743481652; c=relaxed/simple;
	bh=7RjqPboHQASJpceG4THLuaASsoA3mFeOFyDYIbAxa4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bypj+p5QddAvAHEHXPpex5L4hnnl2r9ntN5uZ2zwNnAT2BLKcSav4a6G8xp6m7T0PPQiYJZVMk2AXnzfqiSBQScIceKujDhrgwWwlnGx/8d51ex+fAPt3OqDV4kV73xKuQm/qBoic15NUTKyZBLSw3Rajp1VTOO+AEEiU1BK1dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kX0hD9pt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kX0hD9pt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD69C4CEEF;
	Tue,  1 Apr 2025 04:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743481651;
	bh=7RjqPboHQASJpceG4THLuaASsoA3mFeOFyDYIbAxa4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kX0hD9pt8+VLhl38eaZvLBMtdoIE6apl8snjs3NckBu946tlaOL6b5AfYTph3a1b+
	 dfyi70NQq2j3UO3vHD5W9baLyDuvXmYnM6J2SxLAr3nMJlK5luN2oz2G44E+F5edd4
	 lISwVgJ5E58QlRJlBdiWiIQfIEkALEwafX/x0vvl5O5Ha6dA14D9OYaJ4ywh9lkFq3
	 Oa+j4dRF37y/KEjZdd+5FpzGtvV8KtFZvnwQAd3z8hO7TbMWLC5kRNZAb9CJi/q/mm
	 eb8T5Ze9F9Gr4J2fbJzm6TlqXbF3C3nhFDNM+hew3VvUWECu5UQPYUApVGkGbPH6g+
	 tysRXLDHwdX3w==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 02/11] objtool: Ignore end-of-section jumps for KCOV/GCOV
Date: Mon, 31 Mar 2025 21:26:37 -0700
Message-ID: <08fbe7d7e1e20612206f1df253077b94f178d93e.1743481539.git.jpoimboe@kernel.org>
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

When KCOV or GCOV is enabled, dead code can be left behind, in which
case objtool silences unreachable and undefined behavior (fallthrough)
warnings.

Fallthrough warnings, and their variant "end of section" warnings, were
silenced with the following commit:

  6b023c784204 ("objtool: Silence more KCOV warnings")

Another variant of a fallthrough warning is a jump to the end of a
function.  If that function happens to be at the end of a section, the
jump destination doesn't actually exist.

Normally that would be a fatal objtool error, but for KCOV/GCOV it's
just another undefined behavior fallthrough.  Silence it like the
others.

Fixes the following warning:

  drivers/iommu/dma-iommu.o: warning: objtool: iommu_dma_sw_msi+0x92: can't find jump dest instruction at .text+0x54d5

Fixes: 6b023c784204 ("objtool: Silence more KCOV warnings")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/314f8809-cd59-479b-97d7-49356bf1c8d1@infradead.org/
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index fff9d7a2947a..e6c4eefe295b 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1488,6 +1488,8 @@ static int add_jump_destinations(struct objtool_file *file)
 	int ret;
 
 	for_each_insn(file, insn) {
+		struct symbol *func = insn_func(insn);
+
 		if (insn->jump_dest) {
 			/*
 			 * handle_group_alt() may have previously set
@@ -1513,7 +1515,7 @@ static int add_jump_destinations(struct objtool_file *file)
 		} else if (reloc->sym->return_thunk) {
 			add_return_call(file, insn, true);
 			continue;
-		} else if (insn_func(insn)) {
+		} else if (func) {
 			/*
 			 * External sibling call or internal sibling call with
 			 * STT_FUNC reloc.
@@ -1548,6 +1550,15 @@ static int add_jump_destinations(struct objtool_file *file)
 				continue;
 			}
 
+			/*
+			 * GCOV/KCOV dead code can jump to the end of the
+			 * function/section.
+			 */
+			if (file->ignore_unreachables && func &&
+			    dest_sec == insn->sec &&
+			    dest_off == func->offset + func->len)
+				continue;
+
 			WARN_INSN(insn, "can't find jump dest instruction at %s+0x%lx",
 				  dest_sec->name, dest_off);
 			return -1;
@@ -1574,8 +1585,7 @@ static int add_jump_destinations(struct objtool_file *file)
 		/*
 		 * Cross-function jump.
 		 */
-		if (insn_func(insn) && insn_func(jump_dest) &&
-		    insn_func(insn) != insn_func(jump_dest)) {
+		if (func && insn_func(jump_dest) && func != insn_func(jump_dest)) {
 
 			/*
 			 * For GCC 8+, create parent/child links for any cold
@@ -1592,10 +1602,10 @@ static int add_jump_destinations(struct objtool_file *file)
 			 * case where the parent function's only reference to a
 			 * subfunction is through a jump table.
 			 */
-			if (!strstr(insn_func(insn)->name, ".cold") &&
+			if (!strstr(func->name, ".cold") &&
 			    strstr(insn_func(jump_dest)->name, ".cold")) {
-				insn_func(insn)->cfunc = insn_func(jump_dest);
-				insn_func(jump_dest)->pfunc = insn_func(insn);
+				func->cfunc = insn_func(jump_dest);
+				insn_func(jump_dest)->pfunc = func;
 			}
 		}
 
-- 
2.48.1

