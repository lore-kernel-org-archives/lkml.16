Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEB6136349
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744676874; cv=none; b=GdUF3yxlJlkzpcKn8TWR2dkrEVogeHMShSUTYKQSFjmEfPKqO7TMeumYHUsPJCv1lv/ZIikywdjtgArZuaGec1usuDgjLNOS/OGyKAAUcM+I9uC7740lFLyYg/A+ZsjkbECgAJxqlTRe+K+vfMvMAJ03dxcz3V1ue21qjfBsUm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744676874; c=relaxed/simple;
	bh=XWLkhco6umLuH8PzFShaC/DeyU9+7tRVfN0zupNCKZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gKjUe/PDcDWgV/sncc0EVmQ5GhrzxnX/QaOceyZADjqEdFTgAXOcT6u+wk4GdrQ/U+1QURX2s190sYFhlQGIBGQKLExIxQKZaKpUfsUD5cUe+ibqb19QnqfzSWexjHjTD5UbkjqAKvZzOg+tyhJG7y/IEiJwSJ6XvRe2gVfTc/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDWwCTKC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDWwCTKC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660A1C4CEE2;
	Tue, 15 Apr 2025 00:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744676874;
	bh=XWLkhco6umLuH8PzFShaC/DeyU9+7tRVfN0zupNCKZ4=;
	h=From:To:Cc:Subject:Date:From;
	b=eDWwCTKCI6QBe/Fd1CJklcTS5G2yi0VcbPdmUJIuoU5xJ+09Jyhum5DR5WLqHDZui
	 CQX+Zh4+NW4MJr6Nvtp3cB+pLKZej5gXEF88SQ44T9ZPt/T3LqlpOmsu8i2ECNRUon
	 ta5c7LCtKC5gFXrqcCK8sRpfvnQ4VxFTr2de0g2mDyhgnxS2YUmUBQsjl6JNt8VwuY
	 lbNGYbNzR5/AP3kQGKXbQKvFfRjUC0bjXcDWvecDguHTIoko636KIi7KZV58trQjxA
	 RKkTUHIWIH93wO5HXGLMEVwsoPlc+l7g4crcb+nUKo0Oa05ao6pRWL9xfgw7uE0r4l
	 +NqOdLqkwO89A==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Uros Bizjak <ubizjak@gmail.com>
Subject: [PATCH v2] noinstr: Use asm_inline() in instrumentation_{begin,end}()
Date: Mon, 14 Apr 2025 17:27:11 -0700
Message-ID: <165d2a0b882050f3f6cc0315af66cd2d16e5925b.1744676674.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use asm_inline() in the instrumentation begin/end macros to prevent the
compiler from making poor inlining decisions based on the length of the
objtool annotations.

Without the objtool annotations, each macro resolves to a single NOP.
Using inline_asm() seems obviously correct here as it accurately
communicates the actual code size to the compiler.

These macros are used by WARN() and lockdep, so this change can affect a
lot of functions.

For a defconfig kernel built with GCC 14.2.1, bloat-o-meter reports a
0.17% increase in text size:

  add/remove: 74/352 grow/shrink: 914/353 up/down: 80747/-47120 (33627)
  Total: Before=19460272, After=19493899, chg +0.17%

The text growth is presumably due to increased inlining.  A net total of
278 functions were removed (+74 / -352).  Each of the removed functions
is likely inlined at multiple sites which explains the somewhat
significant code growth.

One example from Uros:

    $ grep "<encode_string>"  objdump.old
   
    00000000004506e0 <encode_string>:
     45113c:       e8 9f f5 ff ff          call   4506e0 <encode_string>
     452bcb:       e9 10 db ff ff          jmp    4506e0 <encode_string>
     453d33:       e8 a8 c9 ff ff          call   4506e0 <encode_string>
     453ef7:       e8 e4 c7 ff ff          call   4506e0 <encode_string>
     45549f:       e8 3c b2 ff ff          call   4506e0 <encode_string>
     455843:       e8 98 ae ff ff          call   4506e0 <encode_string>
     455b37:       e8 a4 ab ff ff          call   4506e0 <encode_string>
     455b47:       e8 94 ab ff ff          call   4506e0 <encode_string>
     4564fa:       e8 e1 a1 ff ff          call   4506e0 <encode_string>
     456669:       e8 72 a0 ff ff          call   4506e0 <encode_string>
     456691:       e8 4a a0 ff ff          call   4506e0 <encode_string>
     4566a0:       e8 3b a0 ff ff          call   4506e0 <encode_string>
     4569aa:       e8 31 9d ff ff          call   4506e0 <encode_string>
     456e79:       e9 62 98 ff ff          jmp    4506e0 <encode_string>
     456efe:       e9 dd 97 ff ff          jmp    4506e0 <encode_string>
   
    All these are calls now inline:
   
    encode_string                                 58       -     -58
   
    ... where for example encode_putfh() grows by:
   
    encode_putfh                                  70     118     +48

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
v2:
- improve patch description
- extract from https://lore.kernel.org/cover.1744098446.git.jpoimboe@kernel.org

 include/linux/instrumentation.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/instrumentation.h b/include/linux/instrumentation.h
index bf675a8aef8a..b1007407d272 100644
--- a/include/linux/instrumentation.h
+++ b/include/linux/instrumentation.h
@@ -9,7 +9,7 @@
 
 /* Begin/end of an instrumentation safe region */
 #define __instrumentation_begin(c) ({					\
-	asm volatile(__stringify(c) ": nop\n\t"				\
+	asm_inline volatile(__stringify(c) ": nop\n\t"			\
 		     ANNOTATE_INSTR_BEGIN(__ASM_BREF(c))		\
 		     : : "i" (c));					\
 })
@@ -47,7 +47,7 @@
  * part of the condition block and does not escape.
  */
 #define __instrumentation_end(c) ({					\
-	asm volatile(__stringify(c) ": nop\n\t"				\
+	asm_inline volatile(__stringify(c) ": nop\n\t"			\
 		     ANNOTATE_INSTR_END(__ASM_BREF(c))			\
 		     : : "i" (c));					\
 })
-- 
2.49.0

