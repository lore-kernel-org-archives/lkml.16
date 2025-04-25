Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A2512B73
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=oOGNlwwg+LX0NMvKPEz1oKAaFVZoC8qqPXaQ5YjlOPK7i1EhXFJaXBqYDqQz41vvdJIKE69hlgpM4wkkGNhnBHE+Bb37aQ4DVAYy3n45H1Gm25l4k6D9IXgt908wV/1MGvwLDZwkYAugJlyGY0FC9aUlbIL1P6fNc/iDeXIucFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=H2D4D6IQ7yrq730aQGyFTZLBuKA8C3doOQvQHAGQRq0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dj0/BFf5v5UwlDd6ATeW2mvXrWIKoWyKQOawX1T38Bb0AH6Eeto9VBU3V03hMgWTzUtzNiBI4MbTKstRzfY8+fEyfafyfNlyaSP7J4p4qMjtD1b0j334yLv4ePm/bGOSB+gt+P8nqKhZnNnAm/Ciy9FCTme+3H4X26fANQOM+s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r6xHsbS3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6xHsbS3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31951C4CEF0;
	Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540908;
	bh=H2D4D6IQ7yrq730aQGyFTZLBuKA8C3doOQvQHAGQRq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r6xHsbS3HsBver9iSUtLh3TLp6Gkft2LutEyYuFCs2H6puSMAnElDH3NLzyG9/P2G
	 TSCkaKIcLzbs9e8YelZbvGvUMq9YdiNsDEGxyh7RdyQI+qjUi4YdwyRwvUd5Ux/1q8
	 XNHSs+JA5z9FD1fimvkHSqHHoWTG7afORbzYG+EiSPfnY1m2c0olbazyIIjwi+8p6+
	 81PJn9twPtZBtcLf7Ml4pJY5S+XWhJ8tgUY1oSOsT9O/B7YuaDUWp6vybog/1eybyv
	 Jgg7vY/9/OacpcT9d5iuaQnlxmtUWaBnYtNGAa/WGIVmVXAeBPWTl4A//ELxEfDajF
	 qtpK98TAH7BcQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4D564CE1DC0; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
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
Subject: [PATCH v3 16/20] ratelimit: Simplify common-case exit path
Date: Thu, 24 Apr 2025 17:28:22 -0700
Message-Id: <20250425002826.3431914-16-paulmck@kernel.org>
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

By making "ret" always be initialized, and moving the final call to
ratelimit_state_inc_miss() out from under the lock, we save a goto and
a couple lines of code.  This also saves a couple of lines of code from
the unconditional enable/disable slowpath.

Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 lib/ratelimit.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 63efb1191d71a..7511f737dc1e2 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -33,7 +33,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	int interval = READ_ONCE(rs->interval);
 	int burst = READ_ONCE(rs->burst);
 	unsigned long flags;
-	int ret;
+	int ret = 0;
 
 	/*
 	 * Zero interval says never limit, otherwise, non-positive burst
@@ -51,8 +51,6 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 
 		/* Force re-initialization once re-enabled. */
 		rs->flags &= ~RATELIMIT_INITIALIZED;
-		if (!ret)
-			ratelimit_state_inc_miss(rs);
 		goto unlock_ret;
 	}
 
@@ -110,19 +108,17 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 
 		if (n_left > 0) {
 			n_left = atomic_dec_return(&rs->rs_n_left);
-			if (n_left >= 0) {
+			if (n_left >= 0)
 				ret = 1;
-				goto unlock_ret;
-			}
 		}
 	}
 
-	ratelimit_state_inc_miss(rs);
-	ret = 0;
-
 unlock_ret:
 	raw_spin_unlock_irqrestore(&rs->lock, flags);
 
+	if (!ret)
+		ratelimit_state_inc_miss(rs);
+
 	return ret;
 }
 EXPORT_SYMBOL(___ratelimit);
-- 
2.40.1

