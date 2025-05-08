Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C70231A3F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747217; cv=none; b=gVY/yY/LBe/mLW2BZo5EaYwG7XBcI/okKqWZLewm73RGqGUwZCdRbAXi9fRKzjYVtOgZuKaGEsV7QzSNy8czO86uT4QhZnI0aC+0d9lH80r4w4c6RJ5GkpV9xExt8L2hzZlyqEiEdzONiCIgkW/QkLl/tLMPv8Ff3mR+Yx+NxvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747217; c=relaxed/simple;
	bh=IXjNK7JRbzJgmjpzWE0gJOfavJOhfRMhhLqkx9ULkFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iHu9h8jsvhVwH1kT/8AI3/6quMbwWZQ+o0ucN6S4TmQVhdgydVfiZYTTqfRmJjbN1DTN2F2aS8seGt/DD1Cd1O9nhfcYYkf1fkaQj4XmuOf9br+YFHiMjIfAWFbRe+++V9muqXrWaJjYVGZXTjeSfi1nu+Ncm+aLbQzZ3/oXPJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0PTbo3P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0PTbo3P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731F7C4CEF2;
	Thu,  8 May 2025 23:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747217;
	bh=IXjNK7JRbzJgmjpzWE0gJOfavJOhfRMhhLqkx9ULkFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h0PTbo3P754zYfPGdV516KM07CqLlhVtOmlQqNhzlYMQJs84iLuudF+Bz7ePqxNEk
	 Ml+xBk5KWhx24TFb4YAx0BaWrotIwTrV1jf1WNl99LJpSCNyecUCNAT8cDk4d+WAOQ
	 DpbIMyD7c9A1MbfbxRNyyoEJFyW83Vbbra8Xlezsrb668BU5kZuoVXlMy7qi1hCw5S
	 lTI4Vc86JI/drW8QvABUJJGyHDRj8xZa21m5EHJ9b7kNPOIgYca0Fzr0TUu1pSYk90
	 AgzZ7B5/TN2tWY90N3KmLTq93Cdh/BLh8wJzot2nl5WB68uzKEygqOUVUNuACHiOIv
	 OiltNyk+MhdnA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 8D4C2CE13DF; Thu,  8 May 2025 16:33:36 -0700 (PDT)
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
Subject: [PATCH v5 17/21] ratelimit: Use nolock_ret label to collapse lock-failure code
Date: Thu,  8 May 2025 16:33:31 -0700
Message-Id: <20250508233335.1996059-17-paulmck@kernel.org>
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

