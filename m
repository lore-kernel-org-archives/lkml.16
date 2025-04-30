Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DC717C77
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975127; cv=none; b=ciZpi67MpnCu87m4Iu5X9ZYo4k3wskWp9vVuvripItmTtpsoi3hPK2D+l57ZhSWyc23AGow8VBejtYI9UvDe+c4remJFZ/ANfo0aNUbP82Vmhb2BY6vXo+hbolXpmaiTZepEwuyKgMJfy2UcNFn6B33TUYcaeX/qWep7+Lfn/OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975127; c=relaxed/simple;
	bh=ntY2Sw3SfTBZAtAeM3adbzynb7JDNJCcwtct5/GAXqc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mh4UT1uOhRAsn6PXxvqEVWHrVSigBkATJR7jJtOO1EGSKdjBo/fMyMcHAUfeJPjfcbTCSHZ6pGG/WAWAFRNxl34i5n69q/cfl6F7wcm6B3RATNIInt3LkiW7xhz25WA24SAvpC3gMPl3g8Rc6q2ClK2zTAjIjCc4q0kzMdcQhUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkBGKBlH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkBGKBlH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D77C4CEED;
	Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745975127;
	bh=ntY2Sw3SfTBZAtAeM3adbzynb7JDNJCcwtct5/GAXqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XkBGKBlHwR6pN+H09J8wazqbf5d+JPrS/+9xwhoAAvpL7nY7xPDmZSwD28eiNsgGi
	 aadFusgQHmZuMX1yIi42v+zzoQilitGoSSoxak6lAmWGl1be31uD8TUE5h9ZPKrzF1
	 ql/55/fWyncn9PvLD7kCHKFOxL1If4u+feMaFqelxzQlCIuoPTDyMCa87qIuhXrun6
	 0zIJyhPaZgcFGGC26NnsqtwkThJJBtHnni0kaJfNHM8ZlZBrM4QnGd6nn4bBrvdd7M
	 J4KPuC1g1R3Giw9f8nke84tIS1nNUAvyJs/MwKFldYU/MHcGcIq1mVJym9v+Ni1tww
	 d5y2zlvfAd07Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 93526CE0F53; Tue, 29 Apr 2025 18:05:25 -0700 (PDT)
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
Subject: [PATCH v4 09/20] ratelimit: Reduce ___ratelimit() false-positive rate limiting
Date: Tue, 29 Apr 2025 18:05:13 -0700
Message-Id: <20250430010524.3614408-9-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <b0883f20-c337-40bb-b564-c535a162bf54@paulmck-laptop>
References: <b0883f20-c337-40bb-b564-c535a162bf54@paulmck-laptop>
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

