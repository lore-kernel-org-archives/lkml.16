Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6350B18027
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=cfn/Salbuq+hD2KOUlX++YayvqZbEz8gXhJW2xEUEtdOL8aufLv1VREdgp3yPHLzvCIYmBixFOolXJ+V6rpk3U4SbNvwpLu31X8BTznLkBLEU0q6JSSbEI7De39EqxKOWINbeVJdAOieBljwdbQJJTMlIFshQDAWHwkRzD89rCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=CPkTM9i04f9X4QEWTixfTb/RCavIqHx07+QmRCayqpE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ukNi0DObKple1SgHAZlwt1IUJ/EqlG22xw3ek+1SNxkROLpfveXBAi+EEPIeEvBCc7j6Db8ArGG+oVJ3rozK0gMFZ+Hpaia9Oajx7DbD++DC+1bhXdA/RgSH4ih8AZtFpvPbm0VWy0OhIn8ghcUveRI/VOAAyZ+l7XtszdhXNUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJCUBx69; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJCUBx69"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35872C4CEF1;
	Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540908;
	bh=CPkTM9i04f9X4QEWTixfTb/RCavIqHx07+QmRCayqpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gJCUBx6954vJcoYj0FlS5qQcBQfbOQ/Uh6+abHOcsCYGpX5exh8wySrGK8qTwJwuU
	 xuXjXoLHOnB5wkQFTsIh3Prwdwje4VwR/L8FDCaEjXhOt8zNOsQOnW7gQFoCaoJW6T
	 2mbeBa0IQup1SiD8VD8hDRAIDpmtS/K7rk9NCaXakNifREKISqfLc1TA9jtU4jQ2cZ
	 MePS+gO+fpEESWTs1gropJGe71NhYmRB+TZ7EdICa2Kkku0wBkDOpYIUqUh2qPrDpZ
	 J895m+VqWCqqUYao5eu1U4+VINrbv6/OEkLuat0Hrn4cQq7HkpIfgkL6QuX5Y0UalK
	 WcHtfYCzlzyBw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 532F6CE1DCE; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
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
Subject: [PATCH v3 18/20] ratelimit: Use nolock_ret label to collapse lock-failure code
Date: Thu, 24 Apr 2025 17:28:24 -0700
Message-Id: <20250425002826.3431914-18-paulmck@kernel.org>
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

Now that we have a nolock_ret label that handles ->missed correctly
based on the value of ret, we can eliminate a local variable and collapse
several "if" statements on the lock-acquisition-failure code path.

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
 lib/ratelimit.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 7b075654e23ac..7bbc270b88e21 100644
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

