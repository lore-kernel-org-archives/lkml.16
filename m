Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9E5235368
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794363; cv=none; b=K1CCZakUxubz42MKnHrKl3hUJs/pyFPu9hcBnA3AvfFI500/6xu4+Voq3Vv0OERlt5ip76Jynp/lv7xcHXDcHiQQc3A8eTtZmZBKxp0p/1ZR1iECnQEmmtWr9o42w0/8iIH2yfyjzCeKGiNhPV31dSfytdXOzuudb6SALn8m+e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794363; c=relaxed/simple;
	bh=1/LU6RkrbkXBWJ585w8Lrq3wRVcCXySSyaFfgKoamXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uzhtgy1ZNYcb/yuE447e5gT5/oyztBMBeLoqJeAdztsMMLEQ4phbJwICWglDJPJO/cXdKlbcLyP8+MejbRJjys5BOFk/7CjhqL853PHGIFIai2s0X5YKMq7sbCeU/JJRiC88+qfB0sT1tZ2fJ7Cq+I0GBpzhWxdTC61XlcPSEIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HMVrggqx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMVrggqx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE09C4CEE9;
	Wed, 16 Apr 2025 09:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744794363;
	bh=1/LU6RkrbkXBWJ585w8Lrq3wRVcCXySSyaFfgKoamXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HMVrggqxpTyUqVNPlQANB46qb2jR6o4p7rzokh0Vyd6gvK1n6uAQeZll/iHkGw+G8
	 NklS4XD3Na5c5XB+b8oTEwAgcTo8375kkHShJITrtgUH7aLM9ChrHZsTKJZvC6w6wa
	 kRAnHEAgvjd+yxozY8FoXjfzjidTCCBwDZDaICodaK9ShfdMt1E6agTMLK5iT8W8OQ
	 7PrjA5wzEPWgBNStkI0f9BYZl6M6FfD1QO0eKe1HLa1N4gtL46UdYSLtp4xR1BnXWe
	 qMcLkLvLygdBH0FAesI+GS9oJjfwr/BarwVjSPj9gly3glRhw20CMo7Fhn7V8luMl0
	 +xGod1kUwENqQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 05/10] treewide, timers: Rename init_timer_key() => timer_init_key()
Date: Wed, 16 Apr 2025 11:05:39 +0200
Message-ID: <20250416090544.3311613-6-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250416090544.3311613-1-mingo@kernel.org>
References: <20250416090544.3311613-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move this API to the canonical timer_*() namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 include/linux/timer.h | 8 ++++----
 kernel/time/timer.c   | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index 30552f4a0bcc..4aeaf43b0d9e 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -67,7 +67,7 @@
 /*
  * LOCKDEP and DEBUG timer interfaces.
  */
-void init_timer_key(struct timer_list *timer,
+void timer_init_key(struct timer_list *timer,
 		    void (*func)(struct timer_list *), unsigned int flags,
 		    const char *name, struct lock_class_key *key);
 
@@ -83,7 +83,7 @@ static inline void init_timer_on_stack_key(struct timer_list *timer,
 					   const char *name,
 					   struct lock_class_key *key)
 {
-	init_timer_key(timer, func, flags, name, key);
+	timer_init_key(timer, func, flags, name, key);
 }
 #endif
 
@@ -91,7 +91,7 @@ static inline void init_timer_on_stack_key(struct timer_list *timer,
 #define __init_timer(_timer, _fn, _flags)				\
 	do {								\
 		static struct lock_class_key __key;			\
-		init_timer_key((_timer), (_fn), (_flags), #_timer, &__key);\
+		timer_init_key((_timer), (_fn), (_flags), #_timer, &__key);\
 	} while (0)
 
 #define __init_timer_on_stack(_timer, _fn, _flags)			\
@@ -102,7 +102,7 @@ static inline void init_timer_on_stack_key(struct timer_list *timer,
 	} while (0)
 #else
 #define __init_timer(_timer, _fn, _flags)				\
-	init_timer_key((_timer), (_fn), (_flags), NULL, NULL)
+	timer_init_key((_timer), (_fn), (_flags), NULL, NULL)
 #define __init_timer_on_stack(_timer, _fn, _flags)			\
 	init_timer_on_stack_key((_timer), (_fn), (_flags), NULL, NULL)
 #endif
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index f4758fef8bf9..f11c37f3a687 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -904,7 +904,7 @@ static void do_init_timer(struct timer_list *timer,
 }
 
 /**
- * init_timer_key - initialize a timer
+ * timer_init_key - initialize a timer
  * @timer: the timer to be initialized
  * @func: timer callback function
  * @flags: timer flags
@@ -912,17 +912,17 @@ static void do_init_timer(struct timer_list *timer,
  * @key: lockdep class key of the fake lock used for tracking timer
  *       sync lock dependencies
  *
- * init_timer_key() must be done to a timer prior to calling *any* of the
+ * timer_init_key() must be done to a timer prior to calling *any* of the
  * other timer functions.
  */
-void init_timer_key(struct timer_list *timer,
+void timer_init_key(struct timer_list *timer,
 		    void (*func)(struct timer_list *), unsigned int flags,
 		    const char *name, struct lock_class_key *key)
 {
 	debug_init(timer);
 	do_init_timer(timer, func, flags, name, key);
 }
-EXPORT_SYMBOL(init_timer_key);
+EXPORT_SYMBOL(timer_init_key);
 
 static inline void detach_timer(struct timer_list *timer, bool clear_pending)
 {
-- 
2.45.2

