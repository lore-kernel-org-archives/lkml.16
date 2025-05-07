Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001142B9AA
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746640438; cv=none; b=gIEIT2ma9L7RUSDeq9pH+XGi9TFmpBtfUbgiWLV0P3HdblZPne7g6gXaPBBaXhI6SRZV3PSNiSJ9NI9RDPpjTT682DZuYFpMM2d1REMTM0n0hHavylXdny/4wCsXxZ+o70CawErxbmdz4M2u+4OwbxR4M98mvSDaLCn6qumhP0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746640438; c=relaxed/simple;
	bh=/Oay1m1Lqy0o6VaIeajKiSi5MpuO3UoYueUu4BxLZ9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FBFfUBtEqNRcqdFfADY3bkLqUW77M47xkieV0JvdEMYis445NvC/KwlYGpL0tE6KHNwJ63c5dTmOkcep6Nx6p22FkomzoFTuF9CK16XI7heu6sFhRj+h9k6SwXlwiiA+ji7nktZDC5r5q+Xg6MH6DDQPSKWDZ5PApz63pf0eUOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhgKknFo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhgKknFo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C40C4CEEF;
	Wed,  7 May 2025 17:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746640436;
	bh=/Oay1m1Lqy0o6VaIeajKiSi5MpuO3UoYueUu4BxLZ9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bhgKknFoSu4AZahTtZ00B94XHqNl/uXg6Uya23tfb1pdQpFmFR7Jv06EjTvXKilIy
	 5ANihydSIVAU4DlkLJR0iaYg5QkWtdrCpLWrJwgdTjgPxLA6fSx0sm7pBOjgOQi0jI
	 DMIRj88jr2kOEPOJkFLU2kvEkpcl6cGYcSoyr9VMI8zf2Lv2t6w0zcnI3PhiFVwHab
	 3FqreKmiq+S6C4+cdW4VgLCpByRmC4a7+kkkIXD5pfjGjR/BXxSqnv883NJxyso/NN
	 J4hTsPfwQehAJEzqHBuSOEcRwcf7uflsNWJFOFXHILdk5/dyPvqev6dkCnfI52iADt
	 MA818Up51xVww==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 05/10] timers: Rename __init_timer_on_stack() => __timer_init_on_stack()
Date: Wed,  7 May 2025 19:53:33 +0200
Message-ID: <20250507175338.672442-6-mingo@kernel.org>
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

Move this API to the canonical __timer_*() namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 include/linux/timer.h     | 6 +++---
 include/linux/workqueue.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index 11e1fac18f0e..4e1237ff4b24 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -94,7 +94,7 @@ static inline void timer_init_key_on_stack(struct timer_list *timer,
 		timer_init_key((_timer), (_fn), (_flags), #_timer, &__key);\
 	} while (0)
 
-#define __init_timer_on_stack(_timer, _fn, _flags)			\
+#define __timer_init_on_stack(_timer, _fn, _flags)			\
 	do {								\
 		static struct lock_class_key __key;			\
 		timer_init_key_on_stack((_timer), (_fn), (_flags),	\
@@ -103,7 +103,7 @@ static inline void timer_init_key_on_stack(struct timer_list *timer,
 #else
 #define __timer_init(_timer, _fn, _flags)				\
 	timer_init_key((_timer), (_fn), (_flags), NULL, NULL)
-#define __init_timer_on_stack(_timer, _fn, _flags)			\
+#define __timer_init_on_stack(_timer, _fn, _flags)			\
 	timer_init_key_on_stack((_timer), (_fn), (_flags), NULL, NULL)
 #endif
 
@@ -121,7 +121,7 @@ static inline void timer_init_key_on_stack(struct timer_list *timer,
 	__timer_init((timer), (callback), (flags))
 
 #define timer_setup_on_stack(timer, callback, flags)		\
-	__init_timer_on_stack((timer), (callback), (flags))
+	__timer_init_on_stack((timer), (callback), (flags))
 
 #ifdef CONFIG_DEBUG_OBJECTS_TIMERS
 extern void destroy_timer_on_stack(struct timer_list *timer);
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

