Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F63BC8CE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=VmGU02LB50SO0S7Qs5BEVoGRbbOEVuv+CdTwMGyvZm16l0ZeXv2EKcussYyBf4fbz3u2TAbESge0ksWGGwJX6vdoHkjq0pkbFaC49cS90iYJP5YDOwIXAGDpMw9cu00MIDPVefzUWinN0zLnt2QebhtbScgObFmojEgswOoGPpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=ntY2Sw3SfTBZAtAeM3adbzynb7JDNJCcwtct5/GAXqc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nKIDCul6rq28Rjg0R/k/XyB0zCCQzOKHaewBN9eb3uJoiMoX9KlUTGnBmjAp+rF8dNtV4XdFwoj8eoN4gzfNNqT7KTtSFOQwNEFwx5XKIu+fQ79QBKt6uyDmTY1yFl7QDJ3AGEh9msKGgxGgF3qhSb7kHTGt3MIQg/a14Hp21ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sEYXuQtc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sEYXuQtc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE88C4CEF5;
	Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540907;
	bh=ntY2Sw3SfTBZAtAeM3adbzynb7JDNJCcwtct5/GAXqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sEYXuQtc6cxADaqxZ0iJF2b6DGkZFeSpKnTOcdU+6/KhQfCy6TNpcY2m4lYmGK6Jr
	 xT/ejiG+E9hB0qInY9hDb6AKSunjLu16hw7BHtPbmaTDfAl+96vFqhtXETOOlYBUKj
	 LPcTEvbXe3uECYeyxDQaqeyaSj28q2ozBfYve9q304sPOC2bqVzYF/PG+c0PR448H+
	 ULcb0gnNkLWEUU5Q4eZR3Gtco6GY32nZiIL+38ekqbET9FQpcqZQAfxGZvawgwc9XA
	 LY9l1LBB4XBmYLqF0lt0CFB6UC0sIyUuvSbJPpqpxK8y00m5kJi289TzPA8WKXl4bo
	 gaCvIlKaAB9vQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 39B1FCE1B79; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
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
Subject: [PATCH v3 09/20] ratelimit: Reduce ___ratelimit() false-positive rate limiting
Date: Thu, 24 Apr 2025 17:28:15 -0700
Message-Id: <20250425002826.3431914-9-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
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

