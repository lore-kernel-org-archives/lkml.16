Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3FF4685
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975127; cv=none; b=qzj1vkqg39uy2IzvtcfFyXL2lubCJtZmne4yC57dt97LpRYKoZYDn9cCut2ShC+Tb7iXebgug+OyYURBxoTGaiB1LW7XVKB814lwk8FzCWvQq1yX3b+O+PR0pjTdQo5SoEo5oF5UzFtbU1M7Feg8UCdinVtp7n5qcbxJw7xq9ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975127; c=relaxed/simple;
	bh=eAuW+1XsPwY9rkuRnnnWelC3ErbYzxH9EQx5wYh1v9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bTuT5p+c4TMhOT6srpCaAFV4SWYJ9ICiupJA2ZnAlDEjyqa4Y1B1fUM5HkVui5F6ZIg5s3P2IKQGa6ceDAEN2i2mimHlJwU7EpY8uuPCMlUKAYb/U1LFwYrb+DRwDON15BunjlLPBAyrR0Zfbvj+H9KzJ0I6/aBxhLsr+jnsQ8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6YjAchR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6YjAchR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE6FC4CEE3;
	Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745975127;
	bh=eAuW+1XsPwY9rkuRnnnWelC3ErbYzxH9EQx5wYh1v9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m6YjAchRtZqVp0QpuGrQ3iIeQ8+iNXWcIIRSPu3ybnzFq9IzTdYSLuLhAT8CKN3sO
	 jRgSpG3qV43dpCf7Zhiv8BX6M0nEhg85M+Yh8DoEPBOMurXHW6cmv/ab8R9TDqbb3T
	 MOntnXqmiUsX6olHGor6fgBqPSqCiCU/BJ6PfpNVv1YVLa4q91KrDlas8BDajepSkx
	 SutAPiSulHipwFl3MKVnXj6nCt1LszSzz2OOGq6OETLIc6M8df4obi83ZMkR8MbgxT
	 HuSIDhaEQORKbR31K/dcIYN0wwwa3LQJH1A3iEYTUZpzaMOlDHO+pKg2qWYxekVhGr
	 FdYZzrVU+ntdw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id AF0C0CE10DB; Tue, 29 Apr 2025 18:05:25 -0700 (PDT)
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
Subject: [PATCH v4 11/20] ratelimit: Force re-initialization when rate-limiting re-enabled
Date: Tue, 29 Apr 2025 18:05:15 -0700
Message-Id: <20250430010524.3614408-11-paulmck@kernel.org>
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

Currently, if rate limiting is disabled, ___ratelimit() does an immediate
early return with no state changes.  This can result in false-positive
drops when re-enabling rate limiting.  Therefore, mark the ratelimit_state
structure "uninitialized" when rate limiting is disabled.

[ paulmck: Apply Petr Mladek feedback. ]

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
 lib/ratelimit.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 7a7ba4835639f..7d4f4e241213e 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -35,11 +35,24 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	unsigned long flags;
 	int ret;
 
+	/*
+	 * Zero interval says never limit, otherwise, non-positive burst
+	 * says always limit.
+	 */
 	if (interval <= 0 || burst <= 0) {
 		ret = interval == 0 || burst > 0;
+		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) || (!interval && !burst) ||
+		    !raw_spin_trylock_irqsave(&rs->lock, flags)) {
+			if (!ret)
+				ratelimit_state_inc_miss(rs);
+			return ret;
+		}
+
+		/* Force re-initialization once re-enabled. */
+		rs->flags &= ~RATELIMIT_INITIALIZED;
 		if (!ret)
 			ratelimit_state_inc_miss(rs);
-		return ret;
+		goto unlock_ret;
 	}
 
 	/*
-- 
2.40.1

