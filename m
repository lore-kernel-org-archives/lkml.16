Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044E3278165
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626223; cv=none; b=MYK6sdOAB5WI3XGi0uqX7FwDZv1Rj0kJWO5pFBkCJqVPI9GDifJFg+shmp1jrnjVu2zLbDrUGB19c405tWK+FjPYrAVysQNrR8bZAiImcws4Sx5HG25x/lZUA1LTwdYcg6k3pzACU6ZXrgb+PlCBCVP/WERYBYqRO2Jq9p7FWkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626223; c=relaxed/simple;
	bh=o8M0/A8AvxWDS8j1F4FvUKl6Grrqf/vddZK9l03Lncg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XCxTnFNd7t9Lz2y1h6vbyNGXnfMKIJibI6S9YrmUDnprZMy499cPNWoC78iG/y7vZw1GssQpxgxAHwFGMhFYXjWDW1JIRVaaeY4xckCXWu9vXfcP69Arp0MIYD3kaul07pP3Wjwu/52mnosKENFAvbKsdW1RDa8jQNe/T9D/8Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AF0Tv+gm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AF0Tv+gm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFA9C4CEE5;
	Mon, 14 Apr 2025 10:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744626222;
	bh=o8M0/A8AvxWDS8j1F4FvUKl6Grrqf/vddZK9l03Lncg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AF0Tv+gmuASCT/LV2j3/CVgKxmZYPiAVmvJlwxxNH4Uk6eTnkMMCq7AyWSmprvg0Z
	 mIHBahis1d70AP7+MxJzOs6FxJcaP1YCh9TaJSy/5Fy/RdmIITDJD2Lc2Fdrk6Owf9
	 3Sz6r2NhRpassNvynasgTYh9WjTxMbfwoVYT0DOzWZAz2jvtfPe09iD3x5GfOYl0cb
	 R2b+kH0N+ZmKlKcRTui8GqsUtHxe6prYFwVHQAuEFiJgOozGM9tbZAaU8q/ueZmBIQ
	 q1L4i0xp7I4PVHQ+IPMBdBC/weiVVhgtG50KCWA014uUToRIyrVrQk7Ao3cnbs9hKV
	 iK0CouMKW5eVw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 15/17] treewide, timers: Rename __init_timer_on_stack() => __timer_init_on_stack()
Date: Mon, 14 Apr 2025 12:22:49 +0200
Message-ID: <20250414102301.332225-16-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414102301.332225-1-mingo@kernel.org>
References: <20250414102301.332225-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move this API to the canonical __timer_*() namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 include/linux/timer.h     | 6 +++---
 include/linux/workqueue.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index 149dfb1f75fa..0f0531e827c4 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -94,7 +94,7 @@ static inline void timer_init_on_stack_key(struct timer_list *timer,
 		timer_init_key((_timer), (_fn), (_flags), #_timer, &__key);\
 	} while (0)
 
-#define __init_timer_on_stack(_timer, _fn, _flags)			\
+#define __timer_init_on_stack(_timer, _fn, _flags)			\
 	do {								\
 		static struct lock_class_key __key;			\
 		timer_init_on_stack_key((_timer), (_fn), (_flags),	\
@@ -103,7 +103,7 @@ static inline void timer_init_on_stack_key(struct timer_list *timer,
 #else
 #define __timer_init(_timer, _fn, _flags)				\
 	timer_init_key((_timer), (_fn), (_flags), NULL, NULL)
-#define __init_timer_on_stack(_timer, _fn, _flags)			\
+#define __timer_init_on_stack(_timer, _fn, _flags)			\
 	timer_init_on_stack_key((_timer), (_fn), (_flags), NULL, NULL)
 #endif
 
@@ -121,7 +121,7 @@ static inline void timer_init_on_stack_key(struct timer_list *timer,
 	__timer_init((timer), (callback), (flags))
 
 #define timer_setup_on_stack(timer, callback, flags)		\
-	__init_timer_on_stack((timer), (callback), (flags))
+	__timer_init_on_stack((timer), (callback), (flags))
 
 #ifdef CONFIG_DEBUG_OBJECTS_TIMERS
 extern void timer_destroy_on_stack(struct timer_list *timer);
diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index 985f69f8fb99..c84da78878d9 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -324,7 +324,7 @@ static inline unsigned int work_static(struct work_struct *work) { return 0; }
 #define __INIT_DELAYED_WORK_ONSTACK(_work, _func, _tflags)		\
 	do {								\
 		INIT_WORK_ONSTACK(&(_work)->work, (_func));		\
-		__init_timer_on_stack(&(_work)->timer,			\
+		__timer_init_on_stack(&(_work)->timer,			\
 				      delayed_work_timer_fn,		\
 				      (_tflags) | TIMER_IRQSAFE);	\
 	} while (0)
-- 
2.45.2

