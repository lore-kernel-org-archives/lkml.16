Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCD9233151
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747217; cv=none; b=B4OSn8y8XBAJODlSmj9NlI41YepGm86/w9vEd85InIBFabjsntvh1QFDXco8BQQRhwR789kxVSoM9EWWLISxFFRoalB+3gn8qZGfJqAB8+uHrH+PJ4FBh2L75dAdyWUArNJJBCIXVVUel/fKKBy+m5delLazfOVDz2UmntuVHfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747217; c=relaxed/simple;
	bh=YB1sT29rmVOlTPoKn0b58m/k1XM/JrnzIA5s1bpM7OE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MQotR/blEVVlPuhWT/JvR7Lz+PRPPyPCaY0J1xkcZDJLdweD1AW5PnSRajCJf/GZ3QmpFJF7uSrTFYb0OUtWT9+/xa2TP0oU8W1Tc9CUf05AXEz2SMRG9IKYysuyfSi4MgpwHJl62cgyCgwkY3d5DBhl5NPNZ4woobZHhYWTWY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXF9XZlK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXF9XZlK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1BBC4CEF7;
	Thu,  8 May 2025 23:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747217;
	bh=YB1sT29rmVOlTPoKn0b58m/k1XM/JrnzIA5s1bpM7OE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YXF9XZlKf91ukGJZqS2AMyxlIgCipDyPibNs9ccP9xuqCU7HS6MGOWTteVU/1rU/b
	 IAMRVqHkah3xrpEjlASSJVvFcjXuYJ5saq08p5s1R+A6wYNakM5F3U8sYnnRm6EWRD
	 NMMRAQU0zPjfi8+srUrCFThV0KfQexwsvI4S96WLeD5em2EaLCP9+Y/0H00tlQmCfP
	 89+7fEsEwg7PiOTb1yK9HO+CyLTVnd/bPHbzlND65HrVehVzBg25EPsHU52yjbnn2T
	 TKW+wypjXK8wqYPOVIEUQWYhiFlCjwq4OdeCzrG/aU7oXth0vF18ZlfO4rCjGal9ye
	 buaz/6X8+7vFQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9394DCE1427; Thu,  8 May 2025 16:33:36 -0700 (PDT)
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
Subject: [PATCH v5 19/21] ratelimit: Drop redundant accesses to burst
Date: Thu,  8 May 2025 16:33:33 -0700
Message-Id: <20250508233335.1996059-19-paulmck@kernel.org>
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

Now that there is the "burst <= 0" fastpath, for all later code, burst
must be strictly greater than zero.  Therefore, drop the redundant checks
of this local variable.

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
 lib/ratelimit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index dcc063af195eb..859c251b23ce2 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -58,7 +58,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	 * the current lock owner is just about to reset it.
 	 */
 	if (!raw_spin_trylock_irqsave(&rs->lock, flags)) {
-		if (READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED && burst &&
+		if (READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED &&
 		    atomic_read(&rs->rs_n_left) > 0 && atomic_dec_return(&rs->rs_n_left) >= 0)
 			ret = 1;
 		goto nolock_ret;
@@ -90,7 +90,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	}
 
 	/* Note that the burst might be taken by a parallel call. */
-	if (burst && atomic_read(&rs->rs_n_left) > 0 && atomic_dec_return(&rs->rs_n_left) >= 0)
+	if (atomic_read(&rs->rs_n_left) > 0 && atomic_dec_return(&rs->rs_n_left) >= 0)
 		ret = 1;
 
 unlock_ret:
-- 
2.40.1

