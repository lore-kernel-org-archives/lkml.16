Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A92617597
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=LDYCov3SGQ9MBvaekit75ADfrCyvYCU3co0ovpypcrC57JGzmkCGTtc/VGm1tT70tPF8ykAbKk2yAbFtDaddWYfxvz7uX95BNQgdLsQqXaoUr9oLUb52dOWuSOKBE42NJtyvG7gG7JlH8FM+RpsxniltV+5qa9Y49S0grwen2/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=/+i4NOmtNmiJBCyQ4d45E7T91BkwFjUY+T60jMduKPo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=au9vsQT2Bli1q3Gm2AjL3rWR2b78YiK8+JFnk/ojE/o4LjwGjaam2NMxE7qw5Fupofp38cwHP5vMJ+VEoQ3sHY6sE0QOx8x5Q6RgOyYBiCB2BeCEWpXrbnoPvjd3eM4LCsmPG1ux5whqXxRo8VOBBLJ9bDp9u1E8+pFKWHJftRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2qL+vXI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2qL+vXI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D947FC4CEF6;
	Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540907;
	bh=/+i4NOmtNmiJBCyQ4d45E7T91BkwFjUY+T60jMduKPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z2qL+vXIXow+wxoO/vk6EgtsdREl+e2/77IIYXVhkrWjKqHGiXfskafvtnuV1tUvL
	 BmHPqtD9v5aXudi0VsV8EfhktOKVu73xtQY4rWavVpiXWtdoIO+bqTbe0voyrDV1FT
	 9PZiUNnpmEpu9bFUZ2ikzNtI0JgUGYqgPw6UdngsEbUHOIeJ93nae/cvqvkMK1LJtn
	 PTCZL2FNNcijrUbeRnYTtqoPOVuCR9ioKPHsgT+ZYDAKesquwihIiZOoRDuJVR9gAh
	 sZopHNPp3omKflo9H+ru/p067dTEgMrIxfq3f6XhxZw5YBkY/x48xWrHaxzVVrpbIm
	 CoFLpnEyBFF6Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 373A6CE1A47; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
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
Subject: [PATCH v3 08/20] ratelimit: Avoid jiffies=0 special case
Date: Thu, 24 Apr 2025 17:28:14 -0700
Message-Id: <20250425002826.3431914-8-paulmck@kernel.org>
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

