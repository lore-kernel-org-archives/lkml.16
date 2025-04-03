Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507D62E62A6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743714917; cv=none; b=eaOETgYlgYXTYPIyz8KkBSDx64guqAe9Wm2/31SqT0nLTJKrAxIcxnUy/yYA5OZlmeueapavnPLgJ/h6s7KHJKSfIGKtevsJD10yZcFtiBKa/kB3bVAITrFdgYnXP0CHLK9FvhLCnVt2iqTDgjQhM1crMUWq6+JEM5koy6nyxV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743714917; c=relaxed/simple;
	bh=2+F1hfYyUSHp5XVoCnxowVa/HEh8lIGm36K9Ci3o8eA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uuSu6hg9QN7nzznn+llDcgeSXE5nxFG/4TloVMaF4ktSjDU6eA39fsiO66jddY9ghEdM5ThGWqJIUP3SYKduMKc9vr5pyf3u33OhRjPeuL49T1zSRkdW+11ageMEL/ez5lu+WKYZSnO9Cy16s/wGOAS7JSk2w+R/hqVytUodFu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEsFRuxJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEsFRuxJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36D2C4CEEC;
	Thu,  3 Apr 2025 21:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743714916;
	bh=2+F1hfYyUSHp5XVoCnxowVa/HEh8lIGm36K9Ci3o8eA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GEsFRuxJ2g+ODHiYzgee+wmWVyg5jvCMneFQXWaNH8lW4vRjAeGN+xu8h3CjLb1qQ
	 XMXeKVk4QcA86ika5NDwRuO8GiXDPNJH7KJL5ThHWBb/RytpMi5cw+VjkAEOWtV16m
	 zGIpvhI0sqw+F0lDCtW/B7Qape8QzY8bO9OWXqVofptEb09lEGgoRebsEpdA2sHGNR
	 KZZ87qa45hLxmL2gmYUjW0UiinrE5HeYr6ZtrMKzslvkkHkDyjfl+FsQLtpVORJ8Rk
	 mNMzxP6SDp7lNCUVtVfWzbtZaptWL11V+2GQTY4d1zxvyqqTFRCfO+2fnTwk4EiDGw
	 otXvCol7BVxYw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A0382CE0CF0; Thu,  3 Apr 2025 14:15:15 -0700 (PDT)
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
Subject: [PATCH RFC 5/9] ratelimit: Convert the ->missed field to atomic_t
Date: Thu,  3 Apr 2025 14:15:10 -0700
Message-Id: <20250403211514.985900-5-paulmck@kernel.org>
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

The ratelimit_state structure's ->missed field is sometimes incremented
locklessly, and it would be good to avoid lost counts.  This is also
needed to count the number of misses due to try-lock failure.  Therefore,
convert the rratelimit_state structure's ->missed field to atomic_t.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/linux/ratelimit.h       | 9 +++------
 include/linux/ratelimit_types.h | 2 +-
 lib/ratelimit.c                 | 2 +-
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/include/linux/ratelimit.h b/include/linux/ratelimit.h
index 8400c5356c187..c78b92b3e5cd8 100644
--- a/include/linux/ratelimit.h
+++ b/include/linux/ratelimit.h
@@ -24,20 +24,17 @@ static inline void ratelimit_default_init(struct ratelimit_state *rs)
 
 static inline void ratelimit_state_inc_miss(struct ratelimit_state *rs)
 {
-	rs->missed++;
+	atomic_inc(&rs->missed);
 }
 
 static inline int ratelimit_state_get_miss(struct ratelimit_state *rs)
 {
-	return rs->missed;
+	return atomic_read(&rs->missed);
 }
 
 static inline int ratelimit_state_reset_miss(struct ratelimit_state *rs)
 {
-	int ret = rs->missed;
-
-	rs->missed = 0;
-	return ret;
+	return atomic_xchg_relaxed(&rs->missed, 0);
 }
 
 static inline void ratelimit_state_reset_interval(struct ratelimit_state *rs, int interval_init)
diff --git a/include/linux/ratelimit_types.h b/include/linux/ratelimit_types.h
index 765232ce0b5e9..d21fe82b67f67 100644
--- a/include/linux/ratelimit_types.h
+++ b/include/linux/ratelimit_types.h
@@ -18,7 +18,7 @@ struct ratelimit_state {
 	int		interval;
 	int		burst;
 	int		printed;
-	int		missed;
+	atomic_t	missed;
 	unsigned int	flags;
 	unsigned long	begin;
 };
diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 85e22f00180c5..18703f92d73e7 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -66,7 +66,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 		rs->printed++;
 		ret = 1;
 	} else {
-		rs->missed++;
+		ratelimit_state_inc_miss(rs);
 		ret = 0;
 	}
 	raw_spin_unlock_irqrestore(&rs->lock, flags);
-- 
2.40.1

