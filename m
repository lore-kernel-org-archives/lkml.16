Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1552528DF08
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746640432; cv=none; b=eYuTG5NB6tB18jFo1H+NkHjw/KzisFPjMPK7pYaShNo0klbuy7Y+8nc5Nydzcc/M9jR5raVRT00JdmtmBITKeW3lgFtk514qYcfDGffW7ihUGVQbSyhh7obhY+9yiNOCUVARJmLXpHwzo8nHUEEUNnerkeBoRjm45xBlMSzjTtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746640432; c=relaxed/simple;
	bh=g/v4sayry7A54uxVvDYp5qi+NhzgDEFjWir+rnqQ+10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cjmuueYQn4JoFr9YRMwm/Rgzya3pSdN/COpej8qMSYtXN7bQoe2uFDFPxpIav/sS+Ud4cDHUbo5yyN2lf4BQWEWPnTXljz6jF6WIsACjmawzdE1ILNoedJAQbgpH4S1Q9WGat7+NLlSluyftw83+DZrl8YoO4ZVQo7ytyLvsREc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYCr1C21; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYCr1C21"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7D5C4CEEB;
	Wed,  7 May 2025 17:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746640431;
	bh=g/v4sayry7A54uxVvDYp5qi+NhzgDEFjWir+rnqQ+10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LYCr1C21UskyU7T1OT07hAYCO7JKPFEwkEUYhZbsE9R2Br+e6myNDofJRBKOXgMLf
	 XqBMqeV02xUBrFsV9KdJBbSjfFH+6i171uYpti/sM+hDJM+9bPiB/j2JgHi6wSUCMT
	 DLeImosGrFvtFBNDd7cwKt24cDRH0ONDOjreFSHBdqNzudADEeGec8aRT650l/UfNL
	 ZAJRJfj3sb1p0htFnxMWfRks/5piMZoOWiLiN3r7BDktEsBP9Y7J2t5zwywuHUc2QQ
	 7J2sf0NWcKo2qR2sCgt2X3ksW4IfU/YQSax7sYQdZH6USa+UO8EhiT016e/mYXeJtw
	 i/zScpjvQubgQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 03/10] timers: Rename init_timer_on_stack_key() => timer_init_key_on_stack()
Date: Wed,  7 May 2025 19:53:31 +0200
Message-ID: <20250507175338.672442-4-mingo@kernel.org>
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
 kernel/time/timer.c   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index 0c1c3aa723e5..31127e8de010 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -72,12 +72,12 @@ void timer_init_key(struct timer_list *timer,
 		    const char *name, struct lock_class_key *key);
 
 #ifdef CONFIG_DEBUG_OBJECTS_TIMERS
-extern void init_timer_on_stack_key(struct timer_list *timer,
+extern void timer_init_key_on_stack(struct timer_list *timer,
 				    void (*func)(struct timer_list *),
 				    unsigned int flags, const char *name,
 				    struct lock_class_key *key);
 #else
-static inline void init_timer_on_stack_key(struct timer_list *timer,
+static inline void timer_init_key_on_stack(struct timer_list *timer,
 					   void (*func)(struct timer_list *),
 					   unsigned int flags,
 					   const char *name,
@@ -97,14 +97,14 @@ static inline void init_timer_on_stack_key(struct timer_list *timer,
 #define __init_timer_on_stack(_timer, _fn, _flags)			\
 	do {								\
 		static struct lock_class_key __key;			\
-		init_timer_on_stack_key((_timer), (_fn), (_flags),	\
+		timer_init_key_on_stack((_timer), (_fn), (_flags),	\
 					#_timer, &__key);		 \
 	} while (0)
 #else
 #define __init_timer(_timer, _fn, _flags)				\
 	timer_init_key((_timer), (_fn), (_flags), NULL, NULL)
 #define __init_timer_on_stack(_timer, _fn, _flags)			\
-	init_timer_on_stack_key((_timer), (_fn), (_flags), NULL, NULL)
+	timer_init_key_on_stack((_timer), (_fn), (_flags), NULL, NULL)
 #endif
 
 /**
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 5efed361409c..6f520e5f548b 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -850,7 +850,7 @@ static void do_init_timer(struct timer_list *timer,
 			  unsigned int flags,
 			  const char *name, struct lock_class_key *key);
 
-void init_timer_on_stack_key(struct timer_list *timer,
+void timer_init_key_on_stack(struct timer_list *timer,
 			     void (*func)(struct timer_list *),
 			     unsigned int flags,
 			     const char *name, struct lock_class_key *key)
@@ -858,7 +858,7 @@ void init_timer_on_stack_key(struct timer_list *timer,
 	debug_object_init_on_stack(timer, &timer_debug_descr);
 	do_init_timer(timer, func, flags, name, key);
 }
-EXPORT_SYMBOL_GPL(init_timer_on_stack_key);
+EXPORT_SYMBOL_GPL(timer_init_key_on_stack);
 
 void destroy_timer_on_stack(struct timer_list *timer)
 {
-- 
2.45.2

