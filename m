Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D50219A8E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996442; cv=none; b=FbiCRLh9ucs2dOSYfIeLj2pFGi2EPPG3TYGAmKPbBT0XS3M8YwgepmYOTGxXTZT/rGCz1YwRJjUeF3BYbF5+wPcic+HUm6gdxehuQ6zl6RntZpqglARZ4o5Pb16QXD8ITs2vkAzi89KUkNadvWE30IfkY5g5G6XYm8ncy72bSA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996442; c=relaxed/simple;
	bh=uk1tO/t5TtzNYhuOJbhJNM7xBi6ueYHOmkiASsbNWtk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jowa9g5OzeBsSNq61nvmR78e05aIqbvra8CJaPsna7ssUIdCnc+MoH1psmdKj9v2abH/nfPHvNxQ94p3Qet4nH/9VFf+PL0GNYQnFHSBDA/ajOoI08pDvDsBSCZgucqGAwlR279SKXeYOeINyF/9XnJ8zY08Mc4qVlyBZOTr+gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MrPsiWZT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MrPsiWZT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DA5C4CEED;
	Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744996442;
	bh=uk1tO/t5TtzNYhuOJbhJNM7xBi6ueYHOmkiASsbNWtk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MrPsiWZTS+WvyGmpBMSiqk3n4svAsJ1FnaOV45EeZVZYl32kVZcJ0v536TJb6xuID
	 Bykc+bnwJykyowHt6Iz9WNWgTA5UCjn9bZ3wteNutUpOOy2Cqqk4zsZVgrkKTEnxvW
	 2AGxj8D7cjU7aB/T4u9Yv290ieHp4XW+g24H8/0x1+Kus1rHNk1V/d2XmY5Qo1aL1P
	 4rYka9eFToRlhL7xHup6PFslj5x5wtDSfRU/0MvEGKe1HKXLzEwo69eTEsppaNDNOJ
	 srHKcVPdmAUHde7HdkfBHmmBls7NMfUkM5CRy9U/ogEkL2RFpRD+o21CnDwLrLa+tT
	 e/X6S+o8APcFg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id DC249CE0A6C; Fri, 18 Apr 2025 10:14:01 -0700 (PDT)
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
Subject: [PATCH v2 ratelimit 03/14] random: Avoid open-coded use of ratelimit_state structure's ->missed field
Date: Fri, 18 Apr 2025 10:13:48 -0700
Message-Id: <20250418171359.1187719-3-paulmck@kernel.org>
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

The _credit_init_bits() function directly accesses the ratelimit_state
structure's ->missed field, which work, but which also makes it
more difficult to change this field.  Therefore, make use of the
ratelimit_state_get_miss() and ratelimit_state_inc_miss() functions
instead of directly accessing the ->missed field.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
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

