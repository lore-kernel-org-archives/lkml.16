Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8EB26F45E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626216; cv=none; b=BbeyiCcDlbbzD4W+NMrkOMGHxp+WaNDhzhS48dIquEFMPvjHUqE2yu2nlY0jFllc8XVtnGoZeAuAihLy1X/Mk+zJBUTVg4frN/EiaLS2CAVX2TOpkKpflsI8GaPpxeAUXUa44KynIBn8QZNMIc7CSMT2cXzqWya1HKf0E9JReVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626216; c=relaxed/simple;
	bh=Tg1a+R4Q7I2Ibmtiok31M1ngflMO/4qY1BRJt8l11Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o3NkGlJYJDwMcjTaJ41cuoCpBawRFmle0xGoId6tD1nAL3msX2/U5qw508WoZI/dGb4KDDaOpT5YMpg2QlBf3KOYvoSqN1mjdoYX0FfZPR04s5ng8PPpY8f/YPr3bhLjmY5hwauQ1QF1wrd4EZUPEYYftoKpK1XnCD62GcFoHHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IX8tXnx8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IX8tXnx8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E3DC4CEEF;
	Mon, 14 Apr 2025 10:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744626216;
	bh=Tg1a+R4Q7I2Ibmtiok31M1ngflMO/4qY1BRJt8l11Dk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IX8tXnx8V9fNcJm4d6/YE5wbz3M/+OTL2eD/hknIzGKH0VpjRhyVFHRc8XdpBGgJA
	 pShkMgmtY17ZmVzuyU09ATE9M2Qb3Ra67TAmqdbDZXhLRgHcDVvOB4+3M3J4zCAknB
	 k9qS8VPxDMiYi1ywXkwTr21Lri0c8Jmu8w+iTxIBpvCBuvKEnztpHiUQMwEWrlFSoJ
	 BcLzceG1qMOSl4ZzubJ3RMcSlvv5NLNoKfZDJqEbvQ0ZeeTcp9tpRSwCcjPxNTi7Rl
	 4vTalsu8xbdDOMub71MedfYoefzylB9redwvDlbxWsrT5Je2ck6pYYySnEzfK9VSp4
	 4On7Yl+V/Tmxw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 12/17] treewide, timers: Rename init_timer_key() => timer_init_key()
Date: Mon, 14 Apr 2025 12:22:46 +0200
Message-ID: <20250414102301.332225-13-mingo@kernel.org>
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

Move this API to the canonical timer_*() namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 include/linux/timer.h | 8 ++++----
 kernel/time/timer.c   | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index ae00a9f618ad..18c5afa293e7 100644
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
index 08780e06c7cf..013173fee6c6 100644
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

