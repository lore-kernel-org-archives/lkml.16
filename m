Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CCA13FEE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975127; cv=none; b=ZESAWI7wrBTEG/ZuyuIaA97lBu6IsSPqmFargr3xpdgAUhgMX3UgzAiOuwGEtxvVLF5OqdQB8+91WNGTDvBi3DZiw7+1vPn9hoD0JeoYvflkYYqSgqKsksLefWE3aw7Ldnvt94D81sMpGZ9kwy21LjeFs3HlGJ3wKVwxoovgv0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975127; c=relaxed/simple;
	bh=gdsff1ewKdQFrckg4o6Eop2RJTaYEsK2lc1udsPqdD4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bA2cIOzGgvIDakR1Fk2/JhjEzSV0ZGGIRzW7NUTFL6YALKMHmmo5gTeX/uw1P9ZvNySmdp8sPyiX7lIzWceraS/jMDAplIdaeybiB+GHaKTNi8SxfXolF8Nc8Zhw3KIIP6lBzmf64hKdcqSdSIxXPV5oktuVejZUlEVE16+UUkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGcUCjFq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGcUCjFq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A39D9C4CEEF;
	Wed, 30 Apr 2025 01:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745975126;
	bh=gdsff1ewKdQFrckg4o6Eop2RJTaYEsK2lc1udsPqdD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dGcUCjFqgqdvL2K23b0Mh9BNt68ZzzgNMwWFEus1JXO57ZaRExAwbZeie4GbN2n+y
	 O+IzQTQmJKn3l408CY0gO/8BOSl2aRaWRKHO4hwuJA9fIJMnVzPy7vzBiwX0skNMvY
	 inVEP/sThwRH2aoEQsETSZFwMbX0xv7CVeQn8GtmrAri3LamoOvHjf5ASMuOPojpUc
	 vreQPJFcE4l5hVboiFegAenRppmil13gOLQoOYEjbCfnaDxIpnkflfyKKXsHq+BZVl
	 43RGV02rGojLLcJrdOu4bciXgYlrPw3pIajA95MWq6ogSxUI82UClJZpzBTOKRdlUZ
	 qsIWU8u92FyeA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4C1DBCE08F4; Tue, 29 Apr 2025 18:05:25 -0700 (PDT)
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
Subject: [PATCH v4 03/20] random: Avoid open-coded use of ratelimit_state structure's ->missed field
Date: Tue, 29 Apr 2025 18:05:07 -0700
Message-Id: <20250430010524.3614408-3-paulmck@kernel.org>
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

The _credit_init_bits() function directly accesses the ratelimit_state
structure's ->missed field, which works, but which also makes it
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

