Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034A663CF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=ImCzObPYdj68vJ6bQrOhGCFZHrSqKIOly8S+rn8kL4eAIPf7C2/nj175kDQ6cKFytyXKM3PYFKAHMBENqAkDmD2nlvomtIhS68RLH8u2VnPqC2MvA4p0NIUwGww8TFC5bm4W9h1OxazGZa71lpw5ROK3U0zbeIfcCzh+ew7SFoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=4wqrZS8w8y2/rj1FFojJ0UAmC8rCc5qzsJcrtlx4m+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jSZ972FgYEai42vkgjVh9RbkviCpUb4+otR9PrQ2y5qqflCKXJMSX28xDAwCMHSqXzjhs1tI69iXPJBH0eY/3LMwwHIyXZyqedXgESOdS/mh21wm1x2iWyl/zzG4dy0SV9Dx9UWPl6t9/18ynSpF+PJRd6G9SSb2/7IgnOS43ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dq9Ij3tC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dq9Ij3tC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5AB7C4CEF3;
	Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540907;
	bh=4wqrZS8w8y2/rj1FFojJ0UAmC8rCc5qzsJcrtlx4m+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dq9Ij3tCC+LdKkmjVzyS6GOA3/i+t1JBs/ajvrmahgbynTFpPFLXUjo369R54Z1yf
	 0CLziiLcGq7xl5vG6KE3XCZoi1b+YDAlBYD6M2APjp/1iFU1LW6UQtsv0B6ERPcm2N
	 FJlcLcB6TWjiilMDeEy99x+3dLVu2lkXDBih5Bbi2+ahgg06mt3Q/VsPqdxPlRLNqV
	 QZm/FeSVvp34lwTZNBqahzbaYj9JG0BBTMk2/d5lZaPIdI6tUow93YYIh2wbfqjjLv
	 UCgORPSipuwBaN5yzVoBUPvHODyOiW4dO8tj73Si+RJPsG9Ssc9t130pkE139QUfFE
	 uBXsaKhyxntMQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 319E5CE19CE; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
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
Subject: [PATCH v3 06/20] ratelimit: Convert the ->missed field to atomic_t
Date: Thu, 24 Apr 2025 17:28:12 -0700
Message-Id: <20250425002826.3431914-6-paulmck@kernel.org>
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

The ratelimit_state structure's ->missed field is sometimes incremented
locklessly, and it would be good to avoid lost counts.  This is also
needed to count the number of misses due to try-lock failure.  Therefore,
convert the rratelimit_state structure's ->missed field to atomic_t.

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

