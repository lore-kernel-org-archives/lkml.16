Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AD8213E6D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071424; cv=none; b=Y4RqWERThoX6GE3baSATim0+R6bGQkSY3R2rzFJt8XyUR0Bhladtu6sQvr3nn76wpRQFI6quqZhWN8JkcjbLMpSGrOMzmmHAhyjh1eqJCnP8p3HE1vWL6rT0gznf5WWPgDbBys5hq24rqysI0E4CZxoBjwAfX89GHFL/VQoFqrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071424; c=relaxed/simple;
	bh=VJHlQLtEvA4VjWEipi509Ucv0vZx7zN0iSCfs2PYkT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M/3ByY4BpVZPJAkGE5h5vwqm2EiaqFzIbv4pn+pApb/vNwnL3l2lV/deajv8Bp3t+1g6/Srsv8nc+OVdxtjDZcrxLJNKlvun+6gef5htLso0LptAxrMxVONw+fUJXMZM/IyAlljxsuZ8gDhJ8w0yiGtHLvvHvc6lnKSQysLk2zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/7IUsna; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/7IUsna"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D04C4CEE8;
	Thu, 27 Mar 2025 10:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743071424;
	bh=VJHlQLtEvA4VjWEipi509Ucv0vZx7zN0iSCfs2PYkT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J/7IUsnayc7UVD3c/BAz2ScGy28LLOYt593F6fy/C8BCyxCSPlH9YiDV0+vEjH+fd
	 HQ1oa02qLo5LIQf/45kuUm1Y6i9VRbisxCzvZHQGrCsCuUi/u7p4sA23cOiEYjkQLG
	 nBMSTnekOsNFMSTK3OQwMOP7bJasl1OcYYOKcWRl2l5i6M/OvYlTimxmPc5/q5u8X9
	 9X0DRshAUWW6t+e/4UB35sSqg9OGr2Gm1TI2vg8THKnTFHVzggN4S8m0fONOS91hNZ
	 fNI0okhuPuIrISUDvVTEsRmH8Kc9O9R0nFcSaqu08OqT4gNm8lymWgb1cY8qAVVyDi
	 OJxfZwvC9NCVg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 13/14] bugs/sh: Concatenate 'cond_str' with '__FILE__' in __WARN_FLAGS(), to extend WARN_ON/BUG_ON output
Date: Thu, 27 Mar 2025 11:29:52 +0100
Message-ID: <20250327102953.813608-14-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327102953.813608-1-mingo@kernel.org>
References: <20250327102953.813608-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend WARN_ON and BUG_ON style output from:

  WARNING: CPU: 0 PID: 0 at kernel/sched/core.c:8511 sched_init+0x20/0x410

to:

  WARNING: CPU: 0 PID: 0 at [idx < 0 && ptr] kernel/sched/core.c:8511 sched_init+0x20/0x410

Note that the output will be further reorganized later in this series.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-sh@vger.kernel.org
Cc: <linux-arch@vger.kernel.org>
---
 arch/sh/include/asm/bug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 834c621ab249..20d5220bf452 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -59,7 +59,7 @@ do {							\
 		 _EMIT_BUG_ENTRY			\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
-		   "i" (__FILE__),			\
+		   "i" (cond_str __FILE__),		\
 		   "i" (__LINE__),			\
 		   "i" (BUGFLAG_WARNING|(flags)),	\
 		   "i" (sizeof(struct bug_entry)));	\
-- 
2.45.2

