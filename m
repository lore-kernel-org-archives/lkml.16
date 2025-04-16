Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8186A236457
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794367; cv=none; b=smEOuaVy66uCwSLD2fru/lgJdD8B+iazo7cregeBRjykybW7b8FxKsZaXmYVFot+ufQe+l24pqmJv0GrBQL9jEJJKFyacbvVZwyBGsLEzwW9HyHdTeFlW4K4mmEPb2QCkv3nQixlLaJcWIxYZMbgzEGg764Xnv8BWkBEV5RhLKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794367; c=relaxed/simple;
	bh=HdLzKuYcdDeHADM5H7NT05YiMZQ7qvWwjpUhyXy8+Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BZRQ+ja68ciSuX0NV5Bu0D/os4wI3FqmIKWasNaTa/xfUFJF17BReM3yAhvPKHhAkp/7Oj+I5qSYT+eqHinqZt4syfqNwW3LzAHKjqE5T2Cl6uk0bOaQf+2jRqp64YsK76ZocYn/kelonrBW51FXXl+Vo1SwYcq8Ej0b36CPfYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZuMZvR2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZuMZvR2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A551FC4CEEE;
	Wed, 16 Apr 2025 09:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744794367;
	bh=HdLzKuYcdDeHADM5H7NT05YiMZQ7qvWwjpUhyXy8+Ew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MZuMZvR2GbsY9SbzjnksS4idllZgBukz2hM5V7YPh3vVdUDUiBZHtetse99IXJeI9
	 bdM6RdHU7erjmaVP2yQXrY2Qig7Latc8usYOeItJ0N0o3VJ7wqWeMo5rvl2WdzLnlE
	 zmESj5JkRBV0nIq9jiHYGtL+YWhvwx0W7GKdy0AhNXUOi8YfcSLT3SkejuSS9SaTeW
	 G8qUA9kroaN8skYUohOVW7bep+gIpE9ow8EvUmUKpy1VzVC9ElFfkKsSm9saRBOQ1s
	 4wMP4EIBl9IEQRcm5Pd0+J92qFnjh5wrXGqYpAvT8XmPu5Gt7+jEZmtw5XDRqpfwoi
	 MzLrH/RIftZpg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 07/10] treewide, timers: Rename __init_timer() => __timer_init()
Date: Wed, 16 Apr 2025 11:05:41 +0200
Message-ID: <20250416090544.3311613-8-mingo@kernel.org>
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

Move this API to the canonical __timer_*() namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 include/linux/timer.h     | 6 +++---
 include/linux/workqueue.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index b8e0cf18327c..5fcfeecfbcb2 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -88,7 +88,7 @@ static inline void timer_init_key_on_stack(struct timer_list *timer,
 #endif
 
 #ifdef CONFIG_LOCKDEP
-#define __init_timer(_timer, _fn, _flags)				\
+#define __timer_init(_timer, _fn, _flags)				\
 	do {								\
 		static struct lock_class_key __key;			\
 		timer_init_key((_timer), (_fn), (_flags), #_timer, &__key);\
@@ -101,7 +101,7 @@ static inline void timer_init_key_on_stack(struct timer_list *timer,
 					#_timer, &__key);		 \
 	} while (0)
 #else
-#define __init_timer(_timer, _fn, _flags)				\
+#define __timer_init(_timer, _fn, _flags)				\
 	timer_init_key((_timer), (_fn), (_flags), NULL, NULL)
 #define __init_timer_on_stack(_timer, _fn, _flags)			\
 	timer_init_key_on_stack((_timer), (_fn), (_flags), NULL, NULL)
@@ -118,7 +118,7 @@ static inline void timer_init_key_on_stack(struct timer_list *timer,
  * be used and must be balanced with a call to timer_destroy_on_stack().
  */
 #define timer_setup(timer, callback, flags)			\
-	__init_timer((timer), (callback), (flags))
+	__timer_init((timer), (callback), (flags))
 
 #define timer_setup_on_stack(timer, callback, flags)		\
 	__init_timer_on_stack((timer), (callback), (flags))
diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index b0dc957c3e56..985f69f8fb99 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -316,7 +316,7 @@ static inline unsigned int work_static(struct work_struct *work) { return 0; }
 #define __INIT_DELAYED_WORK(_work, _func, _tflags)			\
 	do {								\
 		INIT_WORK(&(_work)->work, (_func));			\
-		__init_timer(&(_work)->timer,				\
+		__timer_init(&(_work)->timer,				\
 			     delayed_work_timer_fn,			\
 			     (_tflags) | TIMER_IRQSAFE);		\
 	} while (0)
-- 
2.45.2

