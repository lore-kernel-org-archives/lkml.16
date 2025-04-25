Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763B21BC2A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=dMk7UbwQbHekqKk1YEGo3eFVu4iJTEfCgFD0z3GhNfv3z64Q6SA4rJvxim4J2e/Evs2jjrlMJGFdTCLcjsegvvx7Q0otP7YiCDkcucdvFivOYaDuHl3Jui4ts2VTtI4gN5klYsAb8vBpSFw7yYUP2jNX8SbFaI+3fTyeZgIPGzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=SIvxBFCy/LA8Y/l0yUDYKluYB2RGP/ro5bfWDL0VDk0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cv4fzsz6CNvYxVI7dE3DszAQuikP4X2oP3IPx2GBmBYBX+JTp194y3y3pXJPrBTeh2Aaa5/GNVH+a27dH7rll1Yd8kfz08MvjLVc00P8rZhY4/VpszeYcxzESuaVUr7dhr5uXfh1nnDvexC1L1NuEe+jVYUjAlFnZUs4nsaKzfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKRbhdhP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKRbhdhP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CEDC4CEED;
	Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540908;
	bh=SIvxBFCy/LA8Y/l0yUDYKluYB2RGP/ro5bfWDL0VDk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SKRbhdhPjMOtC96ULiPNTkdJuMeScESKDqxTTu6sMGSCwQPrtcG70cBKJrVZaY7S9
	 0LkXRrblWVjVf9mN/267xWRX9azCWh+4ml8UuRA8SikW/ptuuDO0AC5tC9d26HO5a6
	 QWbo4YelrfYQfbWlAtd2nZYHI+Fb3ixsBLH/noJTbrkKgiH12jUAehpcR3HYatPuCy
	 uedXaeSJAlAMoBqCXr58L+nMQ/iqrIVOtmEVT1US1MUSs1oUEAXMy3vOzcauiY9Eh4
	 5+r8LfG72ALEh6kYQ5vYkreCRuazK5M9dZcA6pU2vjc+kRz7zEIgFvvGLi0+A/Q7x/
	 VL55LxAxlC5Qw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 58870CE1DE2; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
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
Subject: [PATCH v3 20/20] ratelimit: Drop redundant accesses to burst
Date: Thu, 24 Apr 2025 17:28:26 -0700
Message-Id: <20250425002826.3431914-20-paulmck@kernel.org>
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

Now that there is the "burst <= 0" fastpath, for all later code, burst
must be strictly greater than zero.  Therefore, drop the redundant checks
of this local variable.

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
 lib/ratelimit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 768f26790ea9a..626f04cabb727 100644
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

