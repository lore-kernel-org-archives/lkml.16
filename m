Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FBB81E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=E9/r2HQAcrY7Lj0VEjTL+kYo7V62duFvl6W6G16g48Y/erogbygou3O0+ij2mKC5LLUAQw7hmarXg8/z4ykIGYTlaWJnHzIPaWaXm/d1uBTwNw2C9JDMTLsz8gytml9pOqN5zKjy/D4WkzSgE/Gp84UA8Q0Sz2PvJdpvDzRKw6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=nTlm/ut5HpY3tz0oRqH5ZlR6CJKJ6zxtXjccQrIjy+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dK1MrTkIzm2VvAtywo2HGyZ/S7ZsduWXHF8tzoQ3vqq4KiRUbMTlWKsnfcM0X2RXwgit/KQOte7JsjVki8CUXRt4PxdxT2Gh0gkjzv6mctIfNBEdj6hy1WZjuzK7R/7PB1zZwdXLdGZYszaN2nyVsnZgTIyKfdIHW5/VtU+ulTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qFIldu+W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qFIldu+W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879FCC4CEEB;
	Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540907;
	bh=nTlm/ut5HpY3tz0oRqH5ZlR6CJKJ6zxtXjccQrIjy+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qFIldu+W5gnHVy7pPGVHMkeVF68AXZ5WWdnapOHsAf321v4Zfe9hV+CkYGb32V4KF
	 Ua3oJojWDtp5ocxC+kfV/ggKDRUIeVkremn2SrBACmV6wegLg0u/atu7Q6XQLUGMPY
	 9tPzpd8iHXVCAqX2jfy2AIAnLinGe1D2BCCbF2L/AKnV4C/+tloH2PXV0qv5VF9Yri
	 A+thWpjrqw9QY8Qf21Ylp4pt5zvmJOrwXZ2FGspK9/U28qmi5Si0M1xMM/FloWN2su
	 1GfS3lzqWvpjjG/LzwyASYtY2c6qF+YTsdRYBFC8JsK5lvXBDpLxQK+Ex84iB8SW4q
	 jhXZfCsiJ23pA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 29A14CE197A; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
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
	"Paul E. McKenney" <paulmck@kernel.org>,
	"Theodore Ts'o" <tytso@mit.edu>
Subject: [PATCH v3 03/20] random: Avoid open-coded use of ratelimit_state structure's ->missed field
Date: Thu, 24 Apr 2025 17:28:09 -0700
Message-Id: <20250425002826.3431914-3-paulmck@kernel.org>
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

The _credit_init_bits() function directly accesses the ratelimit_state
structure's ->missed field, which work, but which also makes it
more difficult to change this field.  Therefore, make use of the
ratelimit_state_get_miss() and ratelimit_state_inc_miss() functions
instead of directly accessing the ->missed field.

Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>
"Jason A. Donenfeld" <Jason@zx2c4.com>
---
 drivers/char/random.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 38f2fab29c569..416dac0ab565d 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -726,6 +726,7 @@ static void __cold _credit_init_bits(size_t bits)
 	static DECLARE_WORK(set_ready, crng_set_ready);
 	unsigned int new, orig, add;
 	unsigned long flags;
+	int m;
 
 	if (!bits)
 		return;
@@ -748,9 +749,9 @@ static void __cold _credit_init_bits(size_t bits)
 		wake_up_interruptible(&crng_init_wait);
 		kill_fasync(&fasync, SIGIO, POLL_IN);
 		pr_notice("crng init done\n");
-		if (urandom_warning.missed)
-			pr_notice("%d urandom warning(s) missed due to ratelimiting\n",
-				  urandom_warning.missed);
+		m = ratelimit_state_get_miss(&urandom_warning);
+		if (m)
+			pr_notice("%d urandom warning(s) missed due to ratelimiting\n", m);
 	} else if (orig < POOL_EARLY_BITS && new >= POOL_EARLY_BITS) {
 		spin_lock_irqsave(&base_crng.lock, flags);
 		/* Check if crng_init is CRNG_EMPTY, to avoid race with crng_reseed(). */
@@ -1466,7 +1467,7 @@ static ssize_t urandom_read_iter(struct kiocb *kiocb, struct iov_iter *iter)
 
 	if (!crng_ready()) {
 		if (!ratelimit_disable && maxwarn <= 0)
-			++urandom_warning.missed;
+			ratelimit_state_inc_miss(&urandom_warning);
 		else if (ratelimit_disable || __ratelimit(&urandom_warning)) {
 			--maxwarn;
 			pr_notice("%s: uninitialized urandom read (%zu bytes read)\n",
-- 
2.40.1

