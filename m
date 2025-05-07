Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE51328DEE7
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746640429; cv=none; b=ErZhxPJeeNw9a8U2Sw9DzBYqm5WtOIfPDjMMFRXyyknPaTt73zo8NzUHHxpPxvRSVAmXtpGwfCnuK5Mb8uH2Ev/zP/tukMGG3P9e3Ns+C+/kTEbSIoS5mW2r2A15sGYA2PqmqZ0/WwXSuuWclW+khEvFWADpgGiH0F7n3NWMLa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746640429; c=relaxed/simple;
	bh=yawpsgf4AcoNrFmhTyEAPH3qmjLOn5QMAlUYzIns/rU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iGU1PhzqM+QsMyO6ZtKwb/dVMi6lI3UtEESNqL50Q6mNEiNNAQm4Tq/WUZyTcHo7MlBBi+lqFIzmjJPjNX71HtTPDJAaa63RbRw5qWxhix4/Gi+iiUfh4e6wZ1Dq+oNqB29MlYFESfrIoUu7ya9ByTvnZIYZJxz7Vlsyd30/RhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaZmkDVB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaZmkDVB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7948C4CEEB;
	Wed,  7 May 2025 17:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746640429;
	bh=yawpsgf4AcoNrFmhTyEAPH3qmjLOn5QMAlUYzIns/rU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BaZmkDVB5OPit3XHmrWG3B7k1PJGrFLKG+CkuR4qkV4Lq5v6K1wK7feQWq85hh08b
	 8NbwcctSMGuR343jbQZXGca6i2yLqAQ7bdiDhaM1gs3LfM9yiazrmltkOCOpU2umSC
	 VOfyvXKvak6epSOIUNTzTGmg1/0FsY2hOq5atgJLvb8SF7KjVSH/sgtN0En9ZslDXx
	 cvTLCmm9DYd7hXqoII829sYK4UP+ay3cCFlOWoTB2nk5MLXQ7KJ90aBJ1fXI4Ic6cg
	 3RKT7qXUImbJgQEcEP0zK1KOMPaZ3aH64csX13rEVfV+11/8knuOA3X5DKr8U9k1Ii
	 pFVTlXWKnm3ZQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 02/10] timers: Rename init_timer_key() => timer_init_key()
Date: Wed,  7 May 2025 19:53:30 +0200
Message-ID: <20250507175338.672442-3-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250507175338.672442-1-mingo@kernel.org>
References: <20250507175338.672442-1-mingo@kernel.org>
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
index 10596d7c3a34..0c1c3aa723e5 100644
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
index 4d915c0a263c..5efed361409c 100644
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

