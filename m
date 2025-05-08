Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3358B21FF2C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747217; cv=none; b=Z0029Ibmpn1+lc2hMVWdFJ9RYbJ0yqg6Mb7Na3qN0Yxmp7s2dCM9rCfVIHLiZVgYae/H0zLUf7xFxe2c2zIlSoT0Ci/Km9iOHzsl4vR6IlNCoxSgl6QCEAHEca6vtSPze12WCI/DEle4tHt+LiSu+fG51CgE5RZGs1YV+9hYnpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747217; c=relaxed/simple;
	bh=oqGQLaAZjOiJlIyJmpFkRKe1yhFE6Ac++q3VgQmENoU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KnjB6kSWqmD3Vosem0jcitqkIQZuGHv9ovjdEXTvT6/2VKFsUNu9btlyKf97TINfwfvH3WedBt19GpJSdim+3z98IOO3NgR8Puij4fiStMcAW2k1ktqiLBQdujK8/lmE4qAvmUnDpz/kydDUr3H+XZCdesZvnAhSYA7iu8qjLtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hkb+QpFo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hkb+QpFo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3056C4CEEE;
	Thu,  8 May 2025 23:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747216;
	bh=oqGQLaAZjOiJlIyJmpFkRKe1yhFE6Ac++q3VgQmENoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hkb+QpFodxpTBhVQFXoHfsb2N9sd9thqmGh0oXpcAE6huLUJdj6DIWk6GDbIWAEg7
	 AqQdStKpiLBxlYJlMroKNJ0ZGIxtPMzMdCaqCXbATivXcTVm+7z5r1GXqZxPv+A3s5
	 v/LsmlVYGOTHmWiM8EVyNCvPfYFo+CMFHz5Gz3LngxBpMxgc/V7xWuxeYxLQNITF/i
	 eNMpZGJZMgkEGNXuTi2px2Ge2lwpskdEcpUzxRwTLfaYz8JYTg70UY00RUx1prrlgP
	 VPTYVAJMrLrGNMTFpZzyod50yzg0HWc7WvU9odoEunZ3iDUYbcoWev8wDqRSp+Znp/
	 4x96IXUZXll/Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 68F04CE122F; Thu,  8 May 2025 16:33:36 -0700 (PDT)
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
Subject: [PATCH v5 05/21] ratelimit: Convert the ->missed field to atomic_t
Date: Thu,  8 May 2025 16:33:19 -0700
Message-Id: <20250508233335.1996059-5-paulmck@kernel.org>
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

The ratelimit_state structure's ->missed field is sometimes incremented
locklessly, and it would be good to avoid lost counts.  This is also
needed to count the number of misses due to trylock failure.  Therefore,
convert the ratelimit_state structure's ->missed field to atomic_t.

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

