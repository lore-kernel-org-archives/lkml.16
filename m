Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5C9268FF6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626220; cv=none; b=AGwv61OKLuTNdlwzlInoxk/LIgJ9TWL+UGJpfvwB4k8uR0qKa67fVbjp6IYtGPzlJyRoYvuewOLYwaPqcP7lb0SMmEpMgAFnqvnjdNHhPAbQ0dMaoqwdO0UnqVOf4AEAHIdII2mwaUs8piBiTW8uWKDnwN3tVmEkgi9EO36MLd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626220; c=relaxed/simple;
	bh=kheNL3Ix3N4OoJROR/OjifKOim1S0gy8nFBUEETt1vI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sYWnjiY9ZYslFoSqQtm0r6J8D0N3uf6+7w0Y+yTVYPcIShZ6kezpGFbRCspqydJckC9nQKzMqS1N44CGp6NVJAqu05tMK7uM1hHym5ix20AtxoTx3gbXeCe2K2WWHuKCWXiYLbQM1H+/tq9c/jLD5rl4vzJjMvrVAdISd301/Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmKT7+EO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmKT7+EO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CEEC4CEE2;
	Mon, 14 Apr 2025 10:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744626220;
	bh=kheNL3Ix3N4OoJROR/OjifKOim1S0gy8nFBUEETt1vI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QmKT7+EO9ayFEP/rHXCxv8Inl8YT+Nz8eJ48SoRawdpeAVS1xrCSIbPQWER0JG6R9
	 UKaX8ZWIXjpwvOA6zB+vEmJuz7qHUn8dyyGyevKGL/GHwqGcGmXUs7ARAE7nE0hqaR
	 PN9v2jnuJmYB+Pmh8GL9l7N2xAn0qh1kXz0JMb82ym7uzVwuS9qOxujbhK6zVA21w+
	 othSbFPbEVG84O1/pYWghUaGs/Ftg6ORv8/xFxVW3Y3sbg8gOdWovnMnBr5Gi6CF5d
	 vJM/Y0+paXeZWLRB8YtGzCFl9PrPiL/TspO0Il46QEwbMb69qmZcRlZD1mlOKfidBd
	 iXhTUGtCEdh+w==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 14/17] treewide, timers: Rename __init_timer() => __timer_init()
Date: Mon, 14 Apr 2025 12:22:48 +0200
Message-ID: <20250414102301.332225-15-mingo@kernel.org>
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
index 33dbd670820e..149dfb1f75fa 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -88,7 +88,7 @@ static inline void timer_init_on_stack_key(struct timer_list *timer,
 #endif
 
 #ifdef CONFIG_LOCKDEP
-#define __init_timer(_timer, _fn, _flags)				\
+#define __timer_init(_timer, _fn, _flags)				\
 	do {								\
 		static struct lock_class_key __key;			\
 		timer_init_key((_timer), (_fn), (_flags), #_timer, &__key);\
@@ -101,7 +101,7 @@ static inline void timer_init_on_stack_key(struct timer_list *timer,
 					#_timer, &__key);		 \
 	} while (0)
 #else
-#define __init_timer(_timer, _fn, _flags)				\
+#define __timer_init(_timer, _fn, _flags)				\
 	timer_init_key((_timer), (_fn), (_flags), NULL, NULL)
 #define __init_timer_on_stack(_timer, _fn, _flags)			\
 	timer_init_on_stack_key((_timer), (_fn), (_flags), NULL, NULL)
@@ -118,7 +118,7 @@ static inline void timer_init_on_stack_key(struct timer_list *timer,
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

