Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5B021ABD5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996443; cv=none; b=oZnk6Rlm8CZCwheJHKzYUKIYUP9sBqyno+iXZcC6awmI56LZyUrxOo+9xuPwDG0fFgS3i5Cejjvs5M5arsIpzMYFoIV1OlKPZnN/Uzmh1SEtL74Irn1FkE0SC9rmNtlDKDVB05AirIvo6pF4uidSgUfsmGdQxThTkOZ88TWAwbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996443; c=relaxed/simple;
	bh=j3yOGdgZ8xMCRP8ceU9TeIiJqrWt+5iLiJJkl91b5wM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Du+R53CwttvfgVFJzhVZk2T2icRmwbCM2AQdK302lmfgKki4H7p5me0DfkYHg/WDHQGV6Ol+G4kkXS1lpvsVsQOcGsg7Y4UZBAKTx54Tqjxf4JFsFAy4DcYqQ0sp8we8gDKwjUy/qiPbPnIYe0Cqo9Z74Hc/TZj2Z7/9cqV7Aog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T0H4QZbK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T0H4QZbK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23FBC4CEF6;
	Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744996442;
	bh=j3yOGdgZ8xMCRP8ceU9TeIiJqrWt+5iLiJJkl91b5wM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T0H4QZbKjj/gmEjetwEZ6xC9nh3RWCOG3hsnLpb7JYodxYMdIatFqUg4Fp5XY9Pmj
	 ot4ca4uAEPFAh29wVdMxp5F+MAdP4/P25mzISbUXrPARuxuLmKxdLaLL3HtKkfRtvf
	 p3WP7KqywW28PQN8Ebyxne8FdsUe58nQhQBYfLsT+2wGbfpYUYLroMZZuyGJ21SP+K
	 etUwMpSBh1KN4u2hPhtHByHKB3NDeYjnX29OMbWhcnWp2hnP3FZbdQc/pzm9MGY22B
	 ZCU+xDFepaV8dhfljfOFbmUqtBu7xZFd3BDOQUs5JZpR532x7MFLHdLcMizS4yabZj
	 wxI6WKD7T8e+w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id EB9FBCE1680; Fri, 18 Apr 2025 10:14:01 -0700 (PDT)
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
Subject: [PATCH v2 ratelimit 08/14] ratelimit: Avoid jiffies=0 special case
Date: Fri, 18 Apr 2025 10:13:53 -0700
Message-Id: <20250418171359.1187719-8-paulmck@kernel.org>
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

The ___ratelimit() function special-cases the jiffies-counter value of zero
as "uninitialized".  This works well on 64-bit systems, where the jiffies
counter is not going to return to zero for more than half a billion years
on systems with HZ=1000, but similar 32-bit systems take less than 50 days
to wrap the jiffies counter.  And although the consequences of wrapping the
jiffies counter seem to be limited to minor confusion on the duration of
the rate-limiting interval that happens to end at time zero, it is almost
no work to avoid this confusion.

Therefore, introduce a RATELIMIT_INITIALIZED bit to the ratelimit_state
structure's ->flags field so that a ->begin value of zero is no longer
special.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/linux/ratelimit.h       | 2 +-
 include/linux/ratelimit_types.h | 1 +
 lib/ratelimit.c                 | 4 +++-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/ratelimit.h b/include/linux/ratelimit.h
index c78b92b3e5cd8..adfec24061d16 100644
--- a/include/linux/ratelimit.h
+++ b/include/linux/ratelimit.h
@@ -43,7 +43,7 @@ static inline void ratelimit_state_reset_interval(struct ratelimit_state *rs, in
 
 	raw_spin_lock_irqsave(&rs->lock, flags);
 	rs->interval = interval_init;
-	rs->begin = 0;
+	rs->flags &= ~RATELIMIT_INITIALIZED;
 	rs->printed = 0;
 	ratelimit_state_reset_miss(rs);
 	raw_spin_unlock_irqrestore(&rs->lock, flags);
diff --git a/include/linux/ratelimit_types.h b/include/linux/ratelimit_types.h
index d21fe82b67f67..ef6711b6b229f 100644
--- a/include/linux/ratelimit_types.h
+++ b/include/linux/ratelimit_types.h
@@ -11,6 +11,7 @@
 
 /* issue num suppressed message on exit */
 #define RATELIMIT_MSG_ON_RELEASE	BIT(0)
+#define RATELIMIT_INITIALIZED		BIT(1)
 
 struct ratelimit_state {
 	raw_spinlock_t	lock;		/* protect the state */
diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 19ad3cdbd1711..bd6e3b429e333 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -49,8 +49,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 		return 0;
 	}
 
-	if (!rs->begin)
+	if (!(rs->flags & RATELIMIT_INITIALIZED)) {
 		rs->begin = jiffies;
+		rs->flags |= RATELIMIT_INITIALIZED;
+	}
 
 	if (time_is_before_jiffies(rs->begin + interval)) {
 		int m = ratelimit_state_reset_miss(rs);
-- 
2.40.1

