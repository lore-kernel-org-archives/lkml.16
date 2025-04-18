Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED1C21ABD3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996443; cv=none; b=irsAqOnbmWWN7JnMqPItd59n/EbZKuRKXjOqBg144GBSmNzdb2NuXk4RKl/SOtOmBipwaabuVwcQ3QRlEBFGP8Ejl8ZWcg97YKHdvdMckn27n51okOISMVv+6qpUwIYC3/9d2y2vrLOV5uPE0Hpvb8QA1dtG07qU3awzU3vrj2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996443; c=relaxed/simple;
	bh=2+F1hfYyUSHp5XVoCnxowVa/HEh8lIGm36K9Ci3o8eA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VACAfeAGTZf37HzPLcr6WqIfIaiT91KzAa5dC4tPp4qhosGvjcdOTXdHeZWgZCH8/kj5PKcvVqrV3lpq+KyRFOCaKjoLs3nt3eetKQdL8Hv3de+Xb6Ns7g7HPDNuTYR/dJEgPNAetnywHvxJfMrJneBzlQ74VwsJJd58Et9litQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aoNU6frj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aoNU6frj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E088C4CEEA;
	Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744996442;
	bh=2+F1hfYyUSHp5XVoCnxowVa/HEh8lIGm36K9Ci3o8eA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aoNU6frj2WE120Ndw7h2iG6FRjCpgbKe8e3JLHP/TY1Q3ipHenjulLe1TTF+/n9TX
	 xL2bOvj2kNOITWCaKxLOIqQ+R3yInnB7cO1342E9TuwkvC9vc2C69/nMpSnGEFPnsr
	 FuJjxpMr/gwEK4ntH+7v0O7uUqFNZ/E3+6WfUhFT8EPEHfFAhEoCGUAc5+Bs09ZNS4
	 qMVwcmTT4vpwha0LJBEwTlqFFiMbS5m7Kxp5Q1HHvh88f9bxNJnYO65BIMaAVulyNf
	 moSozCaO/at5VqT5oCiyqu6Iuv1e+Is9RZg+0aKmLsPD5eK2s65K5Ra2tgxUqW76vS
	 mexV0Fb12lfog==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E58AECE1219; Fri, 18 Apr 2025 10:14:01 -0700 (PDT)
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
Subject: [PATCH v2 ratelimit 06/14] ratelimit: Convert the ->missed field to atomic_t
Date: Fri, 18 Apr 2025 10:13:51 -0700
Message-Id: <20250418171359.1187719-6-paulmck@kernel.org>
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

