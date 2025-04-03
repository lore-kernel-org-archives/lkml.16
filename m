Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508332E62CD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743714917; cv=none; b=PYpRe6neiONGUuS6mrgsJLW/Y02uxb6vz54VWCzHFXcH4YHX7rcBaxXBGtBVDLpaOshKtYpjNyeSmBCUIdcDpgBPJps/mZa5dpvXSlpvzwIOJX7NS+VPLLJx+Vy57qLdyvUxuUMJFtE1SaVMI7QUTl5ww4JOz8isXeq+oVyL610=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743714917; c=relaxed/simple;
	bh=OW4XttqWZSi/Drj8Nfcb9nRfI0qLGHAcFUjx8HdvV4A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XiPflhQwt3w2LoynLD9iZ2niTYBSCM/sRjlhoT2wgQMa2doThVWecKf375mNtQsv2eQZwbe/+L1hT1Ly2DblpU3vCZ0j+BQnH0hh9xGKPWhw5VNt/KqGmhCYimnJazedO5lDG34B2zS5aB6ip879qosr9RnmFOERx8xZxk2aOqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hjbi1ZNY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hjbi1ZNY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEC5C4CEE3;
	Thu,  3 Apr 2025 21:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743714916;
	bh=OW4XttqWZSi/Drj8Nfcb9nRfI0qLGHAcFUjx8HdvV4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hjbi1ZNYculHh5SMK5Q/HDA7ENHNgtVcvanSBRChWUcYPYkYkpFxjkq5GybYSxaAU
	 qrzJmKIV+LxoG4uK+Nk+4f8pvUI5tjG+aACsGTqKNB4wi1ll/KUM9vT4nLv2FYu+0g
	 L/QY42Co4juZbu0f87DJqj6wvMeRyOibNmKJp8wY5+8msn2jSOAfZY5TDD5u9sM2Uk
	 KElgs61KcyDeJFrC17JZZOer2MbyYJbP8YjMvwNOfvuBHFMWvpvMSn3EIlCQjATk/K
	 XHo+V/ZX44dChaE2j1Z7hOonTlOQgVxhOOT8K2kOVoM2U4+eHkvDSvVbgRHLfWgToP
	 C8PtIWe88z99g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 96BE9CE0799; Thu,  3 Apr 2025 14:15:15 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH RFC 1/9] ratelimit: Create functions to handle ratelimit_state internals
Date: Thu,  3 Apr 2025 14:15:06 -0700
Message-Id: <20250403211514.985900-1-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
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

