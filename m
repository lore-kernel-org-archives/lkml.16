Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3A922612
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975127; cv=none; b=BUwBKq7UtApbDVdJjQqj0kB7yQi+/NhUpeC9u6Elo7pXKydJxOjZb2mWWosR30DogutkiiBMWfCryEDZFLTbhH+FuvwPVTF+/2DC5qppyhNrRkFeApRuLyn8ct+/LJcHVQAel9LvWsT2MEuBfD0Lj6C6ZTjgZXeL5R2niHx5cl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975127; c=relaxed/simple;
	bh=/+i4NOmtNmiJBCyQ4d45E7T91BkwFjUY+T60jMduKPo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IXTb3Y0eYZqbdKS/Xh28IOl4OvyQkqFInAhSLCM7DTY23kwcMka71LTR9koGuKj/qzcZ2eLXY6bJXhRhZl5Xel+Ub1RrgYG0qCOW8akOf5Hd24F/R7dzUWndn1xwAJQZhogq9ZBnrCvIR3QxJmBYlsGc0AyUwNsefaUPByTSpro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BRuqRK2R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRuqRK2R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA500C4CEF4;
	Wed, 30 Apr 2025 01:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745975127;
	bh=/+i4NOmtNmiJBCyQ4d45E7T91BkwFjUY+T60jMduKPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BRuqRK2RVomGeEtSOnh1tFi1dDiseR0kIrpbeMfHXrOW66HJ+s1o7R6OELVGpx61f
	 xvos93VuzHGEWkB99HHZAKQ699eisrlfrynzFYZvH0womii0ikyf9qDXq3niyeui6b
	 DU/95FHywTsIKI24cm3vs12fdRc3BDm/2KazWniYFYnz1R+YkxIIVDYMZDNNpCdFKH
	 tCiAslazyXdpKnVWChAKJUqJ5NBEL07KNQ3uAn4FaQClQpTmfd7Cz53+2NyO9++eNy
	 auMIgCvarf7gtui4DeFqsmwbNAKGhUwO+vX73RDftlm3FoNZg/3irfKOtzfnrN1OXr
	 jRM6OmF6XFexQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 87287CE0F4E; Tue, 29 Apr 2025 18:05:25 -0700 (PDT)
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
Subject: [PATCH v4 08/20] ratelimit: Avoid jiffies=0 special case
Date: Tue, 29 Apr 2025 18:05:12 -0700
Message-Id: <20250430010524.3614408-8-paulmck@kernel.org>
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

