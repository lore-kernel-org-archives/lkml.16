Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8722B2D023
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975127; cv=none; b=h82lifHC1Lx6OYDyHsx73pdI3hC1hhqjFXByeqvxBh7sDKqrFe1g2YlgI59lcCG+kcdyPlWfK9y6ZBUqaF9Jx/A7lXSYCGJlTcYMmiEC+htFFgH9EpoPlquka3bNZIHE1oO2R+MGidCUvNGIIxqUfhcee0xBZyxyrgaGzR865g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975127; c=relaxed/simple;
	bh=IXjNK7JRbzJgmjpzWE0gJOfavJOhfRMhhLqkx9ULkFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pfzrHl5m5DWvoXQK6ckFNyvpUctiJwCvdecZBpOCMKHwttS9w9s1dEzhCrChXq8tx0irt4CgIkTF2tFGs3T6lHufQ7+WvkAzvMFUQ6Sdde65cUtUQj71j1bItbRgJCp7ApR39Xxp9SuVOpDPGcEexLrnR6ETpaEZ2uprgTWe7Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIcblsI2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIcblsI2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63381C4CEFB;
	Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745975127;
	bh=IXjNK7JRbzJgmjpzWE0gJOfavJOhfRMhhLqkx9ULkFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KIcblsI2Thiw3KwUc4uQV9D+bH31MxD4Q/fy/cyDIjHqUH4UivV8acnosJCs6svyT
	 aQxQjHCLrM9N6BGdUHHazFIy6CD8PcLwdGOO02MCZGRLdsBkN2u3I78nGq/fwl5eKg
	 4d93AxvDzXmxlBzmYbI4UaekIpvHe8JXtkQMcESfiAV8CifItH5ZilVHRhXpWjX8oC
	 3wSLgIQ8LYMQQg7y18IKFzM1lB0YwoKVxG47giUBt0+cgCJKQbrxSUkel9XW4Bh09e
	 P4N8ARg1neePR1SNbYtLWLUhyGZvonKUOb14hxVqPNkOwCpBrCakSdtK0BQMxDSS/d
	 +f1DHBJj8ALpA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id DA53ACE11CD; Tue, 29 Apr 2025 18:05:25 -0700 (PDT)
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
Subject: [PATCH v4 18/20] ratelimit: Use nolock_ret label to collapse lock-failure code
Date: Tue, 29 Apr 2025 18:05:22 -0700
Message-Id: <20250430010524.3614408-18-paulmck@kernel.org>
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

Now that we have a nolock_ret label that handles ->missed correctly
based on the value of ret, we can eliminate a local variable and collapse
several "if" statements on the lock-acquisition-failure code path.

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
 lib/ratelimit.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index e7101a79c6973..bcda7c61fc6ff 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -58,20 +58,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	 * the current lock owner is just about to reset it.
 	 */
 	if (!raw_spin_trylock_irqsave(&rs->lock, flags)) {
-		unsigned int rs_flags = READ_ONCE(rs->flags);
-
-		if (rs_flags & RATELIMIT_INITIALIZED && burst) {
-			int n_left = atomic_read(&rs->rs_n_left);
-
-			if (n_left <= 0)
-				return 0;
-			n_left = atomic_dec_return(&rs->rs_n_left);
-			if (n_left >= 0)
-				return 1;
-		}
-
-		ratelimit_state_inc_miss(rs);
-		return 0;
+		if (READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED && burst &&
+		    atomic_read(&rs->rs_n_left) > 0 && atomic_dec_return(&rs->rs_n_left) >= 0)
+			ret = 1;
+		goto nolock_ret;
 	}
 
 	if (!(rs->flags & RATELIMIT_INITIALIZED)) {
-- 
2.40.1

