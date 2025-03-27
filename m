Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39722210F4A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071409; cv=none; b=WO2iacSOeroDoAuACpW36y3Q6Bf/PpX5WoxQMy9jRvSXul80c5NzK3Tcdcv8CYJ4Qrpz7vZhWa2Buf1FkodNnn5KAOphEr9Retbcxx2enk+tN3EW0sXtSb6trIvUHRfBCddMeW4AV4jyate28ColMTX/ZR/nDJowfrJvR/eUF74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071409; c=relaxed/simple;
	bh=3aJ6T4I0hOstaWRJQ16Hr5v+WsyZZUl5P2e65fi6MxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BY766NuKCmiwEwOq0Gv1kGnNGgb90n7yEvxg8XdPk568Rz0gB/PWOWv5Xkq9lfYX/rQpj2ozwl3GG+YxDjmfr1GsQIhDihCnOuGUkJRa8k+nuAgBN2NEdb525SjtycieYzNvb0ONXUBW8BY7r5KriL783bNQUu3JZaopLNvGLW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDA3hMvW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDA3hMvW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74220C4CEEA;
	Thu, 27 Mar 2025 10:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743071408;
	bh=3aJ6T4I0hOstaWRJQ16Hr5v+WsyZZUl5P2e65fi6MxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lDA3hMvWEnJ0W5ZTeCfKDG6TL4P6UUUKFAwHfIigGseQCJaqfV25bzloCTGyJbqfm
	 aN+YRVHaGutZhtQ66IUdJ0NOQu1ncgjKWJblsUqKEM0BqIZqmvYNPG979lweT6i3wG
	 On4KXXGXpVyIrLZIfcYmjW3rGzEKsuw8NMKo6sYA0JLvcZqHHlf7hX+qxZ/lMLs18M
	 mNv9ohQL3FS7irbZ2ZzR/FVrOdLyb06SpJQdd/5aYU/5RqZ05aXmfyrWhY4/zF1mES
	 ZrAGpPaxm78NqEuIWUucd4eZ/AfUz689x9C6Tly6dqW+J12a+zSzAe6NRcXS0vBFbc
	 dNPXOv94AXG+g==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 04/14] bugs/x86: Augment warnings output by concatenating 'cond_str' with the regular __FILE__ string in _BUG_FLAGS()
Date: Thu, 27 Mar 2025 11:29:43 +0100
Message-ID: <20250327102953.813608-5-mingo@kernel.org>
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

This allows the reuse of the UD2 based 'struct bug_entry' low-overhead
_BUG_FLAGS() implementation and string-printing backend, without
having to add a new field.

An example:

If we have the following WARN_ON_ONCE() in kernel/sched/core.c:

	WARN_ON_ONCE(idx < 0 && ptr);

Then previously _BUG_FLAGS() would store this string in bug_entry::file:

	"kernel/sched/core.c"

After this patch, it would store and print:

	"[idx < 0 && ptr] kernel/sched/core.c"

Which is an extended string that will be printed in warnings.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: <linux-arch@vger.kernel.org>
---
 arch/x86/include/asm/bug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index aff1c6b7a7f3..e966199c8ef7 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -50,7 +50,7 @@ do {									\
 		     "\t.org 2b+%c3\n"					\
 		     ".popsection\n"					\
 		     extra						\
-		     : : "i" (__FILE__), "i" (__LINE__),		\
+		     : : "i" (cond_str __FILE__), "i" (__LINE__),		\
 			 "i" (flags),					\
 			 "i" (sizeof(struct bug_entry)));		\
 } while (0)
-- 
2.45.2

