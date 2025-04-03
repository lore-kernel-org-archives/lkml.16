Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508902E62CF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743714917; cv=none; b=pAsx3LNFoaQL6+3KO0IajZP10R+gR5z55Vxg2LWrfTrb2LMuKE+Ng1+M9d5pp3V3zuUlydHyz8eedTQjsXKUQLjtR4kAfizrRpza56FTujYEP+IReqbUPj7165a3lY2tR3BtAcfKOtiwVFdnSFdwSVg53p5TMaQUsomkuSt+NWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743714917; c=relaxed/simple;
	bh=3Bpfo4DQatNfIY3c7/fgBWsBW3JwZ3D48DIMz6i5ZiU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L33tnEfnaSX+tDJEC7BdwZBnY4IijUfJtunV466RP1QM4a62gCMCOd0R1Efd/vwd5+OgHiHnGBFiWnY+fjkrXlFmSWUG2uAldIXktdnthUOBaK6Ew4fiwVOHzW3rvC6COc57Q0uWzAre5bSm9rdOCT88Q+8xE8+7NU1c7wz2e3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HMjcpgg4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMjcpgg4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE46AC4CEE9;
	Thu,  3 Apr 2025 21:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743714916;
	bh=3Bpfo4DQatNfIY3c7/fgBWsBW3JwZ3D48DIMz6i5ZiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HMjcpgg4+AfjLbVddSBj4VXPxD7c5aGFlx9cTWdwIHGE+f8FNHnFPwDp52SnRS6QV
	 LcNeCHdstJjSaEyBiYek1SY94nmJnhjHTdiIbbjXuuTj52aQJqdkbq964ri4SF8glQ
	 tBF9CARNTTK23JUuxjsNVgri27MzjqM7/YZRxRKb6thWAxaUEls+9hmNaqx84IGILK
	 22kknmtS5LUEaRoddmitDqhYoJBiWfTi2YxPHOlppFzXKsXmsUF+dbgakn62oRyViY
	 QJo6SMPIi0asmz/ABIaRiVDE18sMyk6toH0iot1agRk3D6Sw4YUh5hZ6t6cQYSLoBa
	 215djR7qKemtQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 98DE9CE09BE; Thu,  3 Apr 2025 14:15:15 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"Theodore Ts'o" <tytso@mit.edu>
Subject: [PATCH RFC 2/9] random: Avoid open-coded use of ratelimit_state structure's ->missed field
Date: Thu,  3 Apr 2025 14:15:07 -0700
Message-Id: <20250403211514.985900-2-paulmck@kernel.org>
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
index 2581186fa61b7..cbd1692bf3f50 100644
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

