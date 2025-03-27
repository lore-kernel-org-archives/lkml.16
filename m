Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147D1212F94
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071416; cv=none; b=fuypQ1WlAtnz0rSxtbsM7WwUCsX4BEtyya44pUpeoiix07Bp5oNBzSCT1qlpuQCUhZ/0Qrw9iIkHm0nzSmijbsAClXOTP+RqAQyFdCBvHdK+LV0RVfqinKMuLKi0dqthf6XjPrnrWIvGlmrMy1+A5TpCbGqPK6/NkByTLNavoYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071416; c=relaxed/simple;
	bh=5mRPbd/my8fa7329JnbBsyhBO5PlHw3277AFB2PVQ2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKQG5KZe6Wx+U8Wwrw5re4mI+EIJ3fjhJmFRQQp+gRpmhG//fEKdx95UUTCX3+b/Gkw9AZF60l7fbkqiunkGeY0L425SPYrPyWhs4XC6vH9CWNkDKO96puQznpCWi+JNNY6xFpG92tZjkWSN1CjuePn3SArDY6lHQvOVDF7cosQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyRoPkAC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyRoPkAC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D068C4CEE8;
	Thu, 27 Mar 2025 10:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743071415;
	bh=5mRPbd/my8fa7329JnbBsyhBO5PlHw3277AFB2PVQ2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gyRoPkACBZL/HjyAxROOUtoj/sK0TE9wy0gGWW75LbsrgSsYuHLWrRQQQDZTMsXGx
	 6vGCAn5ztSN2qmlpg/ZhVU2MrWb+wofVQPXmvjyILJx3txW3y2Rwe18yIapTp64tR+
	 trzVOOHTsYppiz81JbZYWPEuUrpMAObZjNJmIcq6+SXoCwjIKaTTTsbqHBzoczXoxh
	 e0PUaZ5VV/jhXrJeh++xEygOhla4KjGgkbwFtAsQRrnscn5kqID8dnPpP1kst99Fxo
	 ueJEmfaHt3/OYNxDXXdy9Il7jE3FQ+QKnPq2QuvRGf+4frcZ1dUrgjtr/fPXjVvxM5
	 qlwLhtPXhRSsQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 08/14] bugs/LoongArch: Concatenate 'cond_str' with '__FILE__' in __BUG_ENTRY(), to extend WARN_ON/BUG_ON output
Date: Thu, 27 Mar 2025 11:29:47 +0100
Message-ID: <20250327102953.813608-9-mingo@kernel.org>
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: <linux-arch@vger.kernel.org>
---
 arch/loongarch/include/asm/bug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index 3c377984457d..305b3746c858 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -26,7 +26,7 @@
 		.pushsection __bug_table, "aw";			\
 		.align 2;					\
 	10000:	.long 10001f - .;				\
-		_BUGVERBOSE_LOCATION(__FILE__, __LINE__)	\
+		_BUGVERBOSE_LOCATION(cond_str __FILE__, __LINE__) \
 		.short flags;					\
 		.popsection;					\
 	10001:
-- 
2.45.2

