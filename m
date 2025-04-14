Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A00726658F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626219; cv=none; b=iteAcB7FN816qKAvTrlA1oB9HZ7jIMowf9dV3txmWNNK1poQy9G32WixD5m7Q9NLJJfEmFpmTAegwW5QCUs7dPojtWTBgp1rL9Cf69PJJt5jKuNVI/Urtwa2c8zzf+4FtR2g/7zL1r4/7kSR/Q1iWVN+pjeBMnv1j3qE9IwRoqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626219; c=relaxed/simple;
	bh=dQJKqMkYVgvKRoKckmyWHdF3hPxpfYo2j/UmETna6YM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGR3Ho8bmQGaPsmbGwEn+gNFyjPoD/h07sUVb0Ti1MQLN3o/nYupZCKOItYK/CqawStKrR/8tGVJB+bgGiy8cMpaUQzr4cg9UTsmO8seiM1kx3jQCag9IPjILu+Nofvy+hsyczoSZc0ZNjrENGhKrPiI92t06D3chqb0bFr1hnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0TZk94W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0TZk94W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6951C4CEE5;
	Mon, 14 Apr 2025 10:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744626218;
	bh=dQJKqMkYVgvKRoKckmyWHdF3hPxpfYo2j/UmETna6YM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s0TZk94Wk2uP7jwnThpz4DVUxOBL+TzaCDFl9RfiskyDu6hq5ribKYpBDbFTeh3Po
	 qcs8Ik3qSF5e6pC+wA7HJAgzajqRR/Jupdw2CTm6wtHjYdiWp1g+hTO0T5vGMlPZoc
	 /ivgVZcOS78AdYWOrmWavEDMKQl8rEQmj2VuF+c9rkN89WhTeXCl1B9ZTBEkuM0RHu
	 CYvdmb0sTOUluLzCj+eBe+2WxCRkIC83ptDYEu0G1YrC6lDYYGuvDOde0vcZ+mp4xG
	 KliQORGy53375eB8EokirKCv28x/0pZ8XJiOgzoBm1vrGCuYxdPrdcp+J0KQeW2iyW
	 IoWf4/p4rEt7w==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 13/17] treewide, timers: Rename init_timer_on_stack_key() => timer_init_on_stack_key()
Date: Mon, 14 Apr 2025 12:22:47 +0200
Message-ID: <20250414102301.332225-14-mingo@kernel.org>
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
 kernel/time/timer.c   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index 18c5afa293e7..33dbd670820e 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -72,12 +72,12 @@ void timer_init_key(struct timer_list *timer,
 		    const char *name, struct lock_class_key *key);
 
 #ifdef CONFIG_DEBUG_OBJECTS_TIMERS
-extern void init_timer_on_stack_key(struct timer_list *timer,
+extern void timer_init_on_stack_key(struct timer_list *timer,
 				    void (*func)(struct timer_list *),
 				    unsigned int flags, const char *name,
 				    struct lock_class_key *key);
 #else
-static inline void init_timer_on_stack_key(struct timer_list *timer,
+static inline void timer_init_on_stack_key(struct timer_list *timer,
 					   void (*func)(struct timer_list *),
 					   unsigned int flags,
 					   const char *name,
@@ -97,14 +97,14 @@ static inline void init_timer_on_stack_key(struct timer_list *timer,
 #define __init_timer_on_stack(_timer, _fn, _flags)			\
 	do {								\
 		static struct lock_class_key __key;			\
-		init_timer_on_stack_key((_timer), (_fn), (_flags),	\
+		timer_init_on_stack_key((_timer), (_fn), (_flags),	\
 					#_timer, &__key);		 \
 	} while (0)
 #else
 #define __init_timer(_timer, _fn, _flags)				\
 	timer_init_key((_timer), (_fn), (_flags), NULL, NULL)
 #define __init_timer_on_stack(_timer, _fn, _flags)			\
-	init_timer_on_stack_key((_timer), (_fn), (_flags), NULL, NULL)
+	timer_init_on_stack_key((_timer), (_fn), (_flags), NULL, NULL)
 #endif
 
 /**
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 013173fee6c6..2ea735fa47fb 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -850,7 +850,7 @@ static void do_init_timer(struct timer_list *timer,
 			  unsigned int flags,
 			  const char *name, struct lock_class_key *key);
 
-void init_timer_on_stack_key(struct timer_list *timer,
+void timer_init_on_stack_key(struct timer_list *timer,
 			     void (*func)(struct timer_list *),
 			     unsigned int flags,
 			     const char *name, struct lock_class_key *key)
@@ -858,7 +858,7 @@ void init_timer_on_stack_key(struct timer_list *timer,
 	debug_object_init_on_stack(timer, &timer_debug_descr);
 	do_init_timer(timer, func, flags, name, key);
 }
-EXPORT_SYMBOL_GPL(init_timer_on_stack_key);
+EXPORT_SYMBOL_GPL(timer_init_on_stack_key);
 
 void timer_destroy_on_stack(struct timer_list *timer)
 {
-- 
2.45.2

