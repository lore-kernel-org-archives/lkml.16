Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512D0269892
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626198; cv=none; b=p9f4ucqn1oP78rL8W3PYqGgv9tfoC+ccQavldFwTYeppyCD3dwLcVg0WS32OAhABQtxB0ost07+ITxX2kZwnwerxBCzyI0Z5ZMEZGzLR9QaMTewcwFhFOuBFReNeez7eAXBHsO+ZCArAxv1meA01X3m1VPqaw69EkkYwrGKBmeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626198; c=relaxed/simple;
	bh=uo98pLcblBGgdIKtF6v5S8Pcht00tMbyK0fxBEoCzSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G1B/AZ7qrTF87mD9lr6DkRbrouYeSLwNFzqrb2XoEg0ek9zzdHewfWLz8RCzZrMKZlVlOHW/zTnqOTEwqVSizSFLMBKIhJ0UZLuondMHzxvgSgq+ZOoc2VWFLth0ji6+GgrQJewLcHoIt/3O+KiBles11qayCzmCO3ZvEmFen2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjZc+xdf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjZc+xdf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7467AC4CEEB;
	Mon, 14 Apr 2025 10:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744626198;
	bh=uo98pLcblBGgdIKtF6v5S8Pcht00tMbyK0fxBEoCzSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EjZc+xdfNu4nHTDW9C2iyMznFyUVV9bqoz0wjYvdr0gSID2aNK0R+ZRKboR0P09Zq
	 CxxNIK9xsmL0NC0YIed56PwWzIgbzhE0L7b/Stup6QmqaxAenLiVxZBI5366rmR61W
	 fMNDuNBhNxT3lfjqjxzOPY0YnK+1uQLOuxv25Zc9A8uv4kwPQt+eIzX2wvjhuNGAHU
	 V6MVX3iHpsHQVVsVogBIS0Q1oUUQOaCJmsZK/8BFCQDdGF7mxYnU+mzIBUT0wK4Wz9
	 nbZwRRedc4KKy+U0bFmc4BaVG8b3XoT28ssodiluv55RLGJNIf/3TZkbb4RsNX14R3
	 5KHUFDxflA6UA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 04/17] treewide, timers: Rename add_timer_local() => timer_add_local()
Date: Mon, 14 Apr 2025 12:22:38 +0200
Message-ID: <20250414102301.332225-5-mingo@kernel.org>
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
 include/linux/timer.h | 2 +-
 kernel/time/timer.c   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index d35d3f27a987..5944cfb196c5 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -159,7 +159,7 @@ extern int timer_reduce(struct timer_list *timer, unsigned long expires);
 #define NEXT_TIMER_MAX_DELTA	((1UL << 30) - 1)
 
 extern void add_timer(struct timer_list *timer);
-extern void add_timer_local(struct timer_list *timer);
+extern void timer_add_local(struct timer_list *timer);
 extern void timer_add_global(struct timer_list *timer);
 
 extern int try_to_del_timer_sync(struct timer_list *timer);
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 47165b16380a..3fd0b13c0b74 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1293,21 +1293,21 @@ void add_timer(struct timer_list *timer)
 EXPORT_SYMBOL(add_timer);
 
 /**
- * add_timer_local() - Start a timer on the local CPU
+ * timer_add_local() - Start a timer on the local CPU
  * @timer:	The timer to be started
  *
  * Same as add_timer() except that the timer flag TIMER_PINNED is set.
  *
  * See add_timer() for further details.
  */
-void add_timer_local(struct timer_list *timer)
+void timer_add_local(struct timer_list *timer)
 {
 	if (WARN_ON_ONCE(timer_pending(timer)))
 		return;
 	timer->flags |= TIMER_PINNED;
 	__mod_timer(timer, timer->expires, MOD_TIMER_NOTPENDING);
 }
-EXPORT_SYMBOL(add_timer_local);
+EXPORT_SYMBOL(timer_add_local);
 
 /**
  * timer_add_global() - Start a timer without TIMER_PINNED flag set
-- 
2.45.2

