Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9718A2E62D6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743714917; cv=none; b=MSoiVXDkP0kDnsIzpCFTsSWy1FRouP6F4QXoFz7YzmG+BzTmbwpSonVquePeh7m4yl5fNMxJfy6iEdyMcgy1LtOmK3L8w/O6meFaNs/3OJpkO9IJg0+Neh320KxN2tBsu8cZG+uDFDta1Zgtr8UljGkDCCm4ISjsuBgFjcoHofE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743714917; c=relaxed/simple;
	bh=S4zyoINK/k1VihcBkWzpPYAZOrOLyaqIzhpOR3LrUaE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sHz03L4MNvbLpxwgRGBxOaI11nSGDUqm2KyBQlFW+x+mjXYPdUMAiozlPVYQp69+vqR4b5gw20ncfEq5diZ3IG5uM2BjnUmmgZJZJhOPMWp7MaKYfplCfWeZi+ImGwGjldZ1rSa7gQjjhF3upRmxmQ+3EGa2vpcbWwrcLv5hfCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzGkuS9w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzGkuS9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4848CC4CEED;
	Thu,  3 Apr 2025 21:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743714917;
	bh=S4zyoINK/k1VihcBkWzpPYAZOrOLyaqIzhpOR3LrUaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jzGkuS9wkwuXNU0HP1n82gg1nGdKKcZtluT+XU4GMZER+yj+0gccV574vGinpC8F5
	 LUQ2zcKjc7BY+WS/T7P8DeJJP2unu1hZzKz/Sv0MRdGr2asq/IuUed8czpODtGlxNW
	 WPG4pTfMxg6GN6eZWflC4eGVkr6wxWnnYo9vSCFq2bjdO/6IVonUl5z7k8jMEIIqLO
	 qbiw4itjVhh7bCB5CSMQzqaiwxKuwCAL/UkNCTvh2Fi0Z7LC4fb17gwvFTKLdR5jwx
	 IRRw+bYXVSC/PgGLSR0lec3KC/DIH0q0nOlDAZKH3TGu2iKD7Lf8+z8yYgRT/P39cV
	 gm0aLWHmvR+oQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A2F7FCE0EDF; Thu,  3 Apr 2025 14:15:15 -0700 (PDT)
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
Subject: [PATCH RFC 6/9] ratelimit: Count misses due to lock contention
Date: Thu,  3 Apr 2025 14:15:11 -0700
Message-Id: <20250403211514.985900-6-paulmck@kernel.org>
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

The ___ratelimit() function simply returns zero ("do ratelimiting")
if the trylock fails, but does not adjust the ->missed field.  This
means that the resulting dropped printk()s are dropped silently, which
could seriously confuse people trying to do console-log-based debugging.
Therefore, increment the ->missed field upon trylock failure.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 lib/ratelimit.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 18703f92d73e7..19ad3cdbd1711 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -44,8 +44,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	 * in addition to the one that will be printed by
 	 * the entity that is holding the lock already:
 	 */
-	if (!raw_spin_trylock_irqsave(&rs->lock, flags))
+	if (!raw_spin_trylock_irqsave(&rs->lock, flags)) {
+		ratelimit_state_inc_miss(rs);
 		return 0;
+	}
 
 	if (!rs->begin)
 		rs->begin = jiffies;
-- 
2.40.1

