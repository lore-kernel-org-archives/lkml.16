Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42726263F49
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100488; cv=none; b=pjA7GBybTwiuW4aphgXZZgfojVpp61R9sLhupQgDPm7SzD/AL9lua3gB7/7xV4UnOZaco9QfF38mG9b7+erfDKV60JyFLTvNdCDoNFYUQ79gXJtO9xcHS6ikEwSP+0wzyA6SnsDPvwxl1IPIBkOK4qwk+EhOcn9n3P9BaRvc3l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100488; c=relaxed/simple;
	bh=k6bnnSwlEHgFA+riTMEYB1mSt8DFIyiepASBiJ7AxcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YcLBQSakMoc2R/575qq2K1JEu6317gllWlwzS2Tch/s3u1Mbadc0IDkTDiVV0pr6TmJwut/c6dudAvxfdMrY+2c8UiCaTjvdCkIzylLEthTSzxCQcseIaTc3JeilJP51GeNmhQDp8eG/J2hGyU5w56IwjkotvaycPzN8Y6aE8J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QjILnKe9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QjILnKe9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B801DC4CEEA;
	Tue,  8 Apr 2025 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744100488;
	bh=k6bnnSwlEHgFA+riTMEYB1mSt8DFIyiepASBiJ7AxcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QjILnKe9EtX4PjZMFZ71m3m72cHJcRAUn8jsGof/0oGnjjEGczY8KcsjulTpNBFNy
	 H4YYdNuYYj35gmgF5ISnUCVSEsJfPUWw7CeYsUWxqZ/HexjNJC517SXh7ip/w0QMBk
	 XMli3oO824wplaKuZne9woPRqQgakDGrerD+dsWyIYuVMa1NqaaYI1NRdhL8DS6YKR
	 RJEThCViB4tfyT73hclew+akX1aJOO6ByGuyLjOVZ83Tp/EtS/+hUeh/afCbvrjWGM
	 mqXwh8AA1LFxzq0EWgS7hW5nE2AsccXYT+qPsXEATFBV9uulr47Bp2Ymo90kdS76dJ
	 ENSJAXEExtr4w==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC 3/5] noinstr: Use asm_inline() in instrumentation_{begin,end}()
Date: Tue,  8 Apr 2025 01:21:16 -0700
Message-ID: <7cb41fe7e87a003fc925164d5cc18efd8e95fcc0.1744098446.git.jpoimboe@kernel.org>
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

Use asm_inline() to prevent the compiler from making poor inlining
decisions based on the length of the objtool annotations.

For a defconfig kernel built with GCC 14.2.1, bloat-o-meter reports a
0.18% text size increase:

  add/remove: 88/433 grow/shrink: 967/487 up/down: 87579/-52630 (34949)
  Total: Before=19448407, After=19483356, chg +0.18%

Presumably the text growth is due to increased inlining.  A net total of
345 functions were removed.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
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

