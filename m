Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9C72153ED
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747217; cv=none; b=NnvevZbXHNH4cDLLu3VCCmGnVY+uYm+y7uuXqQlpc3yAUOek+DWeoBeeLH84mGmGHDCGn0NkyyvuDw1vNxvxXQ+5vbzcsfx4NrpE7hBwlqsAvvYEjzElTIx/EnaoBfH40v5v0zXWSg3iqn/z6zQp4aj1QBNhV+ZwUBe5zZRy3nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747217; c=relaxed/simple;
	bh=ntY2Sw3SfTBZAtAeM3adbzynb7JDNJCcwtct5/GAXqc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C44J0UiqGJCF0XgXAeIFsGPU1FrSFEII7fgQxVD6ko+YrRsGj+jMsRx7TIO3tjoMxhATHdjl55J+ubb+HWCjIoTGKPxt1JRSZReXrURE9MKkEWUtasOMxUemfyYRwzYPcr7/g/Bvntuiw5kWqRMBvj5FhH6lAy5UJ0F9+zOf7Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TIqmAPuO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIqmAPuO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5AAC4CEF5;
	Thu,  8 May 2025 23:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747217;
	bh=ntY2Sw3SfTBZAtAeM3adbzynb7JDNJCcwtct5/GAXqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TIqmAPuOGY5ijLqa8wv4PirHncJn45vXFlOTP2x4xA0WYF38LRQC/tSOhA280zvxr
	 z/IJyafDxJuOejRkZvQ3klQVjKGKM2sQvZHMOP9/sz3ap7E9xOnKhq8O45KfNpbUYe
	 dfQEFCAUYnt4gXONCZDynsxNcnju8yosUWkMBCJ0/T8JmbElTbRZ2V4pb1/8ys+9y5
	 kAZMltQdO4lX/yLiCBzGNkBO4792XZoOxLbk4gPeN1M7YTAEwtZ7CP5c5/k42o6/Ex
	 k2OcwR+VkroBWyJSHeq58KlBJGGsBeSBUZSIL/RXY4n7OhS2t0o1lfG2eXzvYVj77+
	 n60H9Vcl91EZA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 71E6BCE12A6; Thu,  8 May 2025 16:33:36 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: [PATCH v5 08/21] ratelimit: Reduce ___ratelimit() false-positive rate limiting
Date: Thu,  8 May 2025 16:33:22 -0700
Message-Id: <20250508233335.1996059-8-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <1bcf7d5e-b89c-4118-b872-c8896bdbdc19@paulmck-laptop>
References: <1bcf7d5e-b89c-4118-b872-c8896bdbdc19@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Petr Mladek <pmladek@suse.com>

Retain the locked design, but check rate-limiting even when the lock
could not be acquired.

Link: https://lore.kernel.org/all/Z_VRo63o2UsVoxLG@pathway.suse.cz/
Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
Signed-off-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/linux/ratelimit.h       |  2 +-
 include/linux/ratelimit_types.h |  2 +-
 lib/ratelimit.c                 | 51 ++++++++++++++++++++++++---------
 3 files changed, 40 insertions(+), 15 deletions(-)

diff --git a/include/linux/ratelimit.h b/include/linux/ratelimit.h
index adfec24061d16..7aaad158ee373 100644
--- a/include/linux/ratelimit.h
+++ b/include/linux/ratelimit.h
@@ -44,7 +44,7 @@ static inline void ratelimit_state_reset_interval(struct ratelimit_state *rs, in
 	raw_spin_lock_irqsave(&rs->lock, flags);
 	rs->interval = interval_init;
 	rs->flags &= ~RATELIMIT_INITIALIZED;
-	rs->printed = 0;
+	atomic_set(&rs->rs_n_left, rs->burst);
 	ratelimit_state_reset_miss(rs);
 	raw_spin_unlock_irqrestore(&rs->lock, flags);
 }
diff --git a/include/linux/ratelimit_types.h b/include/linux/ratelimit_types.h
index ef6711b6b229f..b19c4354540ab 100644
--- a/include/linux/ratelimit_types.h
+++ b/include/linux/ratelimit_types.h
@@ -18,7 +18,7 @@ struct ratelimit_state {
 
 	int		interval;
 	int		burst;
-	int		printed;
+	atomic_t	rs_n_left;
 	atomic_t	missed;
 	unsigned int	flags;
 	unsigned long	begin;
diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index bd6e3b429e333..90c9fe57eb422 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -39,12 +39,22 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 		return 1;
 
 	/*
-	 * If we contend on this state's lock then almost
-	 * by definition we are too busy to print a message,
-	 * in addition to the one that will be printed by
-	 * the entity that is holding the lock already:
+	 * If we contend on this state's lock then just check if
+	 * the current burst is used or not. It might cause
+	 * false positive when we are past the interval and
+	 * the current lock owner is just about to reset it.
 	 */
 	if (!raw_spin_trylock_irqsave(&rs->lock, flags)) {
+		unsigned int rs_flags = READ_ONCE(rs->flags);
+
+		if (rs_flags & RATELIMIT_INITIALIZED && burst) {
+			int n_left;
+
+			n_left = atomic_dec_return(&rs->rs_n_left);
+			if (n_left >= 0)
+				return 1;
+		}
+
 		ratelimit_state_inc_miss(rs);
 		return 0;
 	}
@@ -52,27 +62,42 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	if (!(rs->flags & RATELIMIT_INITIALIZED)) {
 		rs->begin = jiffies;
 		rs->flags |= RATELIMIT_INITIALIZED;
+		atomic_set(&rs->rs_n_left, rs->burst);
 	}
 
 	if (time_is_before_jiffies(rs->begin + interval)) {
-		int m = ratelimit_state_reset_miss(rs);
+		int m;
+
+		/*
+		 * Reset rs_n_left ASAP to reduce false positives
+		 * in parallel calls, see above.
+		 */
+		atomic_set(&rs->rs_n_left, rs->burst);
+		rs->begin = jiffies;
 
+		m = ratelimit_state_reset_miss(rs);
 		if (m) {
 			if (!(rs->flags & RATELIMIT_MSG_ON_RELEASE)) {
 				printk_deferred(KERN_WARNING
 						"%s: %d callbacks suppressed\n", func, m);
 			}
 		}
-		rs->begin   = jiffies;
-		rs->printed = 0;
 	}
-	if (burst && burst > rs->printed) {
-		rs->printed++;
-		ret = 1;
-	} else {
-		ratelimit_state_inc_miss(rs);
-		ret = 0;
+	if (burst) {
+		int n_left;
+
+		/* The burst might have been taken by a parallel call. */
+		n_left = atomic_dec_return(&rs->rs_n_left);
+		if (n_left >= 0) {
+			ret = 1;
+			goto unlock_ret;
+		}
 	}
+
+	ratelimit_state_inc_miss(rs);
+	ret = 0;
+
+unlock_ret:
 	raw_spin_unlock_irqrestore(&rs->lock, flags);
 
 	return ret;
-- 
2.40.1

