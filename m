Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E0535961
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975127; cv=none; b=RPtV2nD9Og5q9NZ1fNdERDdmsUy+Zj3P3s4YDvg1paIunFC9MnCHu3N5gpPYNrAnWYvn4CDcL8XUeLAj2Ot7o7iNennVH1wmNrGdX4jj4wWLxdIhQWbktwZWgbiRwZyr6OGOUY0pG6CDcQHKbiR2FDo39zaiM1a+dXF/R4bGLDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975127; c=relaxed/simple;
	bh=feyMWlvQ3IMm4wSDJau8dg3L1bsITx2hZGbyD38McFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pcfZ8+QgADs1jxlmk6sYQv+HxBjjkjwna6xEDN33yHsBHqypmtQCeXeR6BZzrHDukGW0dzNy3z64aFJtBsRe9w8cBCE6K3RuRa30UEP3483LfzPS8mZl+qEGWDwPLmaFhEUsGDSsuRAcjlQKWMH6Y2k/Pqmqtz5vcTH1AG3XqFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pbVXGaSG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pbVXGaSG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65943C4CEFC;
	Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745975127;
	bh=feyMWlvQ3IMm4wSDJau8dg3L1bsITx2hZGbyD38McFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pbVXGaSGz6Ox4rLxvllqzX7HwSM9A+Cx05Gao5cdkUncYgOcqDP03XkJ3IFCabkZx
	 gefF/lRFGsFj5+oJZImBMYilMl4oy4HVOb24oDczz1quTyLXzm9lRiQRhv8JfAbLTY
	 1MiENWFzCtIB7GnjscL1kcVrhN4uerVeC9JlAN1ecEer/LB4BAGu1uhWuiqNn17GtX
	 iJyQO5ZrEKJw6dnL8HYQgTAVf2hUrYGIha+9ckzGnj8ns8hVrf63dCzjzQf7bgzY1b
	 qeaqI43HUnlcs3h4N4+25gfXkIWTF0t4pvTiXArrakC/objKkfthSPgDNq7Dw5AA67
	 kkfqmq7qRsozA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D72D8CE11BC; Tue, 29 Apr 2025 18:05:25 -0700 (PDT)
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
Subject: [PATCH v4 17/20] ratelimit: Use nolock_ret label to save a couple of lines of code
Date: Tue, 29 Apr 2025 18:05:21 -0700
Message-Id: <20250430010524.3614408-17-paulmck@kernel.org>
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

Create a nolock_ret label in order to start consolidating the unlocked
return paths that conditionally invoke ratelimit_state_inc_miss().

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
 lib/ratelimit.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 7c6e864306db2..e7101a79c6973 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -43,11 +43,8 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 		WARN_ONCE(interval < 0 || burst < 0, "Negative interval (%d) or burst (%d): Uninitialized ratelimit_state structure?\n", interval, burst);
 		ret = interval == 0 || burst > 0;
 		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) || (!interval && !burst) ||
-		    !raw_spin_trylock_irqsave(&rs->lock, flags)) {
-			if (!ret)
-				ratelimit_state_inc_miss(rs);
-			return ret;
-		}
+		    !raw_spin_trylock_irqsave(&rs->lock, flags))
+			goto nolock_ret;
 
 		/* Force re-initialization once re-enabled. */
 		rs->flags &= ~RATELIMIT_INITIALIZED;
@@ -116,6 +113,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 unlock_ret:
 	raw_spin_unlock_irqrestore(&rs->lock, flags);
 
+nolock_ret:
 	if (!ret)
 		ratelimit_state_inc_miss(rs);
 
-- 
2.40.1

