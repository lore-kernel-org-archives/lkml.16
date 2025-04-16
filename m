Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B951D236A6B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794365; cv=none; b=sZb+G8X2b7INxE7nZff9mvmph/SWInM8jdPV8jR2eluqTgpf/eFJPziSjzqR0kHhACePbv3MqY2oJ+/6tnzc3CHxYcwZartgu0puCw7aroQgCfwxNTaO2Rft5J1JexrjGe5Wu/M2rcrb22jIGHFjAF3wWeSgCrjmX0k5teasyb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794365; c=relaxed/simple;
	bh=oVfkdKUT0UKQB+59iYKlJlwyrdrWMex6fKA6BLLAWeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pgX8Xpl6g3Y1Ye5hqjy0s8irm4y0N9MR+tUB8uf01uelScg5y5Um7ETcNDjXu3YWEVP9+bJ/gak+QQR+mGan9YeNBcldh1nvrD3kNZVzlOVHS1+o/m89+gMy0wLHTxa08xbzQvsh9mGDvlUIaIxEzEIR0t1AO816SQ7kP35NLCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kr6Gc13G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kr6Gc13G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EEC1C4CEE2;
	Wed, 16 Apr 2025 09:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744794365;
	bh=oVfkdKUT0UKQB+59iYKlJlwyrdrWMex6fKA6BLLAWeI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kr6Gc13Gp5LkbSv4IkUaMT9fQoU+s5Lnqpwu3itF1XRJmEYv804iCaOvPOi4/Py7G
	 moPt4D68ngC9JjQKrKcybBhxMVOA2PAV8UzwNPvZ3nxkbCrgjVOaaKG0qoaxBsiAxA
	 853+cUUEByp3A4Ffl5YEqnXcKP1ONegZAFv+BiqFr+9Wbkd3S9U/0q/McS5TAcmG26
	 4PdY6oSpLEEN3O0VQvLtcg8kEOkL44+Jg6Pu83w/FsnbphWT36Y6xyzosIwNcKqHRF
	 0+4ZoLJbONNE8jX4cV1CXvIYkLLaVi+DpcAiUQnJIGgBGTbQzCv6UCy6uNi6TfNmJ4
	 a0QJEvGzyg0zA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 06/10] treewide, timers: Rename init_timer_on_stack_key() => timer_init_key_on_stack()
Date: Wed, 16 Apr 2025 11:05:40 +0200
Message-ID: <20250416090544.3311613-7-mingo@kernel.org>
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
 kernel/time/timer.c   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index 4aeaf43b0d9e..b8e0cf18327c 100644
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
index f11c37f3a687..9d918c8b4990 100644
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
 
 void timer_destroy_on_stack(struct timer_list *timer)
 {
-- 
2.45.2

