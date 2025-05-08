Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335E7220F29
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747217; cv=none; b=Lc5GT/ee+lAIw9h72PmvIixEP3i3kjs9YEVWDAKjHkq/GlkaYVJCjlSSbu/FJvqu7StMtsR/AYOFRT8ZV+4Peeb5TqzhfQaPFH8SO7NHnN0kYv2W/anRQ1j/szJ8PTeA/M1w4BeIak9XiSCinguM89AVOX8iExz5EO6/pNd9mxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747217; c=relaxed/simple;
	bh=N3RIolT2/wwpsyp3qVL0vety09DWGenJ3HGIlVCg+P0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uDwv1GIMhJz/FjxHHvUf8++2VSFuQExVeMtiP2MP5l2PrOB/pdI+dwCOlPz/6HT0KFnWS9Lsk70uej14dka7xX++rDs1nvXaAnGx7V/+si0/geiwslQsu1HtGABXuzpjEezENByr6w/T8EbjuBESUvOyisuOVrssEWNqiDj81f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WlB6mIKG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WlB6mIKG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A941FC4CEE7;
	Thu,  8 May 2025 23:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747216;
	bh=N3RIolT2/wwpsyp3qVL0vety09DWGenJ3HGIlVCg+P0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WlB6mIKGvzzqxItE/Qxc+Zc/o/qLP12ui7/TpPLRyCC2VzuquNl1ZSzM+A+d4J7/8
	 oVOOSgB1dy5Bbkjwb2rokj9obna2LaA7J/B6Igw5gupqs5BNrS0NAUHbyOoFLddOQH
	 Xd78cioIVT64UekTNtSwtndQpOCzIqrO7F/T+C5SvuvX2obh3f8uHgxmHdZU38uJYD
	 LSTkMzE7PJrmeA7GKGy8WhjW5ZasSUuZlFPhOiskvdf+kXr4iok9ZIs6T5ipN4ngdu
	 pO5n7shSPZxtOBc+jzVd4aZtAjCmcRxP3u5k2G7iGejtc0q+g6qtdSsWMEZXsso/mJ
	 0fQEY+u+TiAwA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5BC1BCE11A4; Thu,  8 May 2025 16:33:36 -0700 (PDT)
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
Subject: [PATCH v5 01/21] ratelimit: Create functions to handle ratelimit_state internals
Date: Thu,  8 May 2025 16:33:15 -0700
Message-Id: <20250508233335.1996059-1-paulmck@kernel.org>
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

A number of ratelimit use cases do open-coded access to the
ratelimit_state structure's ->missed field.  This works, but is a bit
messy and makes it more annoying to make changes to this field.

Therefore, provide a ratelimit_state_inc_miss() function that increments
the ->missed field, a ratelimit_state_get_miss() function that reads
out the ->missed field, and a ratelimit_state_reset_miss() function
that reads out that field, but that also resets its value to zero.
These functions will replace client-code open-coded uses of ->missed.

In addition, a new ratelimit_state_reset_interval() function encapsulates
what was previously open-coded lock acquisition and direct field updates.

[ paulmck: Apply kernel test robot feedback. ]

Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
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

