Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9433F231C9C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747217; cv=none; b=RdT8vb7gLG4tq2t6DmqSnOwUAfDhMeEeelOBn5LEgAUd7q/d0BVpTAZWTPYjNcJI5pH+1EBCBNycYopW3UTPQMjmRwKniYm9X4nLyaB++TXEq5zUUYCHPG3lVg/oL0sxDPCw8Eo3VwRCmXZ7mQxcgBMMHIgRr8ULs+7pxvazcc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747217; c=relaxed/simple;
	bh=QCSRO+sN3BeKZWvK+OThs6qhu1d5NNPNgRJTZ+bBQSc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ggIOaKICaL2UOsXRjFa6fvse2a7uVmS18DTtwBczJh9pdLQ0LM5O7G1H7nTtc5h+YZDF4XCiq/OKjr6a7gBVewvMmOa6SByGwE459mR4i4NuKSs2xgco3N4xRHUcMy8U8rbFjFkMeLhJ6lGcXTCznm9Y1oBqzvnzCup3hRlmPzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXjo64Uj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXjo64Uj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46037C4CEF8;
	Thu,  8 May 2025 23:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747217;
	bh=QCSRO+sN3BeKZWvK+OThs6qhu1d5NNPNgRJTZ+bBQSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nXjo64UjKkmd6b/RYf6D7M34C5NytrQDMZL71m6g2AJncbPJ1iYd0PRNyRkhyD/3a
	 SHu8xdTAELzJI7XjssHsR2erY2KyCGe7qpuLVyZF/kDxe/zV2zve41qPHpvCe84JYa
	 tYK7ILoocyEwugGmvBI80kvClm9B7un+9yIOD25D6vo6qZ4MTxA5WA2PFagDy6mg1f
	 XZYn50eODcZVnfZIy8TjIO+P4awiy6xER0/355g50FdVpze4DfW9IdCK0lX/+f7Frn
	 m8+7bIrMpzRta4FPREYh/WczU7yyGHdJQIPNLtKRGJq0LWN9CSQD7jvel7uah6Z5M2
	 sgJlAg6A/ky3A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7E2B3CE1389; Thu,  8 May 2025 16:33:36 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH v5 12/21] ratelimit: Avoid atomic decrement if already rate-limited
Date: Thu,  8 May 2025 16:33:26 -0700
Message-Id: <20250508233335.1996059-12-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <1bcf7d5e-b89c-4118-b872-c8896bdbdc19@paulmck-laptop>
References: <1bcf7d5e-b89c-4118-b872-c8896bdbdc19@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, if the lock could not be acquired, the code unconditionally
does an atomic decrement on ->rs_n_left, even if that atomic operation
is guaranteed to return a limit-rate verdict.  This incurs needless
overhead and also raises the spectre of counter wrap.

Therefore, do the atomic decrement only if there is some chance that
rates won't be limited.

Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 lib/ratelimit.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 4e520d029d28f..a7aaebb7a7189 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -65,8 +65,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 		unsigned int rs_flags = READ_ONCE(rs->flags);
 
 		if (rs_flags & RATELIMIT_INITIALIZED && burst) {
-			int n_left;
+			int n_left = atomic_read(&rs->rs_n_left);
 
+			if (n_left <= 0)
+				return 0;
 			n_left = atomic_dec_return(&rs->rs_n_left);
 			if (n_left >= 0)
 				return 1;
-- 
2.40.1

