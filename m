Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC43828DF2D
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746640434; cv=none; b=aoT+LD5ZpOZZIEYquN9uRw70kQPazPsHoWsi9Fyk8freP2qDfKL1iZ8W/2NqcjJYWnG3yYAFDMofc2ItIFRNqaDB8lFWMHYCA/QScJtpKlgcrVcGUdkWGeltsxV7Hy6Tdf6Cg3BSyaDWy3JS5CetKObnfCuu/KxWkhXeCQkfNQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746640434; c=relaxed/simple;
	bh=xvTwSpO9mtwbO7NdIjbnbBCvodmkZvbJ+4H0t47CdAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sgc1bMAOjCWmZ4+SM5jT2jMrl0lkg8v1/Z9dSgP1Pmz+rJxZ8cpgx5PkIb/S1TTejbdF1Tw6QQabZuKFKuhylGL8pdj6SoyQiAVGtaSHTumjEN9laISFPyldxEPmKoMoqmdc+nazoyQzACdRJNShEkcroe4PH7Bdl4NBuB59o3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kP3fTOrm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kP3fTOrm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4D2C4CEF0;
	Wed,  7 May 2025 17:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746640434;
	bh=xvTwSpO9mtwbO7NdIjbnbBCvodmkZvbJ+4H0t47CdAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kP3fTOrm5TiFtStQb+USdKZO9ds+NzsZYKbbLsd/BZz4BCQGUjPI/fYfbnfPBDSA9
	 sdrg9fw2VA8UZqVS1i8l9ChuwP1hNd5oO6CHyOCs9EjdXCIBlmE+EDXgw8t5F2uHqC
	 blh1lYL1TfqWSljxDNysgGXB3hD8DcbZqJfqqzow2azgTMJ/R/2d0hj9+VzPB/1Dj8
	 e2BDJIoAMa7AXvvl2jC54Bdzc1Hgl3mNpmMXnOtu5xi4yQc6GfQGynFGjWcf1m3zs/
	 FFqJWolvoekwqXjBjBeWNC5e8XY+BQ9DKe7QWFycugj/6CzPMPsE909K9gWLb4Jk72
	 s6j4OekNTYFqg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 04/10] timers: Rename __init_timer() => __timer_init()
Date: Wed,  7 May 2025 19:53:32 +0200
Message-ID: <20250507175338.672442-5-mingo@kernel.org>
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
index 31127e8de010..11e1fac18f0e 100644
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
  * be used and must be balanced with a call to destroy_timer_on_stack().
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

