Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF535219E8C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996442; cv=none; b=PPTjSpPi5AtPqLDqDWF2446YHMFaKTS5Ya10OVdJGELBUdoG3LchzbpJ9Z0tCr38++ndVW8ci6AGa031HZuNBmdv+avOW6MP181Jlzj1LflvRBuaxj1qBAWhHNiGlpwyT9vsTy2F8lAMLzWAD3o9fv8XiWyAUBLl4eeYlZZVs2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996442; c=relaxed/simple;
	bh=OW4XttqWZSi/Drj8Nfcb9nRfI0qLGHAcFUjx8HdvV4A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r4OSsNz6WgDHBDFmw8ys1EHIprl8bN4j8A2iGHBHbAtfcpHQswcLgd37xRE6q6nrlJKwLD0RR+6Uy2VD3UwvopCQVZYKOjSI1xS/hZPo0MzkBDbCaUGFS/3mnFH+raHGMGSL2NqrUKiJVp+oh/yacarHgZrZX3kQHYQ5DoQJGvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNaxnuxZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNaxnuxZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF6DC4CEEC;
	Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744996442;
	bh=OW4XttqWZSi/Drj8Nfcb9nRfI0qLGHAcFUjx8HdvV4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JNaxnuxZLJJORZDXiT7yqI1fVhzALaHOrSTXDuyJErE61IU7BAAOHmcsAAfbtiCKk
	 M0owU/hpKTPIiFGzo1RptjCrdD/ZR9o85bpBCEBpfU8q8jY8qGtbC9YwoqUzgNp2+f
	 aoiYDxeqi4fMQ94BwKEpy4+VS8hCOIBQEgvnGZ2RWS1Sz5B5iXK0b3z5wQJnyAnMxi
	 4vW1aZi2v5MIRIREp6MDQGyX3FqVVoTnQF9hX5QTyL52S//FwOvNkeeRcFKbILhRw1
	 pAfgLTGrf4mCLRKYbscpIZEEdSqu3iKHL+IROoR7ZMzGMwEFd0dXMNvN4ZhkbnVSCM
	 hZZxUmXZ0sqpg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D9224CE09FA; Fri, 18 Apr 2025 10:14:01 -0700 (PDT)
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
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH v2 ratelimit 02/14] ratelimit: Create functions to handle ratelimit_state internals
Date: Fri, 18 Apr 2025 10:13:47 -0700
Message-Id: <20250418171359.1187719-2-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
References: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A number of ratelimit uses do open-coded access to the ratelimit_state
structure's ->missed field.  This works, but is a bit messy and makes
it more annoying to make changes to this field.

Therefore, provide a ratelimit_state_inc_miss() function that increments
out the ->missed field ratelimit_state_get_miss() function that reads
out the ->missed field of the specified ratelimit_state structure,
and a ratelimit_state_reset_miss() function that reads out that field,
but that also resets its value to zero.  These functions will replace
client-code open-coded uses of ->miss.

In addition, a new ratelimit_state_reset_interval() encapsulates what
was previously open-coded lock acquisition and resetting.

[ paulmck: Apply kernel test robot feedback. ]

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/linux/ratelimit.h | 40 ++++++++++++++++++++++++++++++++++-----
 lib/ratelimit.c           |  8 ++++----
 2 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/include/linux/ratelimit.h b/include/linux/ratelimit.h
index b17e0cd0a30cf..8400c5356c187 100644
--- a/include/linux/ratelimit.h
+++ b/include/linux/ratelimit.h
@@ -22,16 +22,46 @@ static inline void ratelimit_default_init(struct ratelimit_state *rs)
 					DEFAULT_RATELIMIT_BURST);
 }
 
+static inline void ratelimit_state_inc_miss(struct ratelimit_state *rs)
+{
+	rs->missed++;
+}
+
+static inline int ratelimit_state_get_miss(struct ratelimit_state *rs)
+{
+	return rs->missed;
+}
+
+static inline int ratelimit_state_reset_miss(struct ratelimit_state *rs)
+{
+	int ret = rs->missed;
+
+	rs->missed = 0;
+	return ret;
+}
+
+static inline void ratelimit_state_reset_interval(struct ratelimit_state *rs, int interval_init)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&rs->lock, flags);
+	rs->interval = interval_init;
+	rs->begin = 0;
+	rs->printed = 0;
+	ratelimit_state_reset_miss(rs);
+	raw_spin_unlock_irqrestore(&rs->lock, flags);
+}
+
 static inline void ratelimit_state_exit(struct ratelimit_state *rs)
 {
+	int m;
+
 	if (!(rs->flags & RATELIMIT_MSG_ON_RELEASE))
 		return;
 
-	if (rs->missed) {
-		pr_warn("%s: %d output lines suppressed due to ratelimiting\n",
-			current->comm, rs->missed);
-		rs->missed = 0;
-	}
+	m = ratelimit_state_reset_miss(rs);
+	if (m)
+		pr_warn("%s: %d output lines suppressed due to ratelimiting\n", current->comm, m);
 }
 
 static inline void
diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index ce945c17980b9..85e22f00180c5 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -51,12 +51,12 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 		rs->begin = jiffies;
 
 	if (time_is_before_jiffies(rs->begin + interval)) {
-		if (rs->missed) {
+		int m = ratelimit_state_reset_miss(rs);
+
+		if (m) {
 			if (!(rs->flags & RATELIMIT_MSG_ON_RELEASE)) {
 				printk_deferred(KERN_WARNING
-						"%s: %d callbacks suppressed\n",
-						func, rs->missed);
-				rs->missed = 0;
+						"%s: %d callbacks suppressed\n", func, m);
 			}
 		}
 		rs->begin   = jiffies;
-- 
2.40.1

