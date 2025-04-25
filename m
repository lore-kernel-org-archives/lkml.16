Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A588A4C6D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540907; cv=none; b=d/U4VhcidxyjuEPgtFWE1Hv/ebNpznjMg8kiZyA+3X+PyBgBd7jYElTG+57nKoqjY9Ri8yRN5xVHtXSZx78wtqOa/cQQeAgrdwKzC6DX1msGXgODldP7aYpcBFgZXo+T5I661u9eir94JRRZRzJxrJnBb7IhjW6IZ/b/+x3xe2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540907; c=relaxed/simple;
	bh=5Ba8mLvGksbAP43pJeO98GbdrAwpxttSISuXSBWKagg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sj+ZTWu1YeVQM9uV3yzAVk317EG42gMkZsqBRZQJSpMrOgt3Pp1dJiI2L1hP/AlAEIjj3egv/hQdSfVoVLj1M3qKmsO2AoVwGyyeMA19petJxe2UYjt0DEO54FTabxuhLjNlkIBOXwOgujTdww04lvpdCws0QGFrb1p1uanPsBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEHV1p9W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEHV1p9W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E594C4CEE8;
	Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540907;
	bh=5Ba8mLvGksbAP43pJeO98GbdrAwpxttSISuXSBWKagg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AEHV1p9WuhjTNiBJgM2nIm8hOM4xOl2zlsRzHFo+cOKHxWWk8+dyp7AAGhfpMOenN
	 9gyl6qtvWvGU/FBPmB+TOuLsdiu61kKPEfKtKH3+/9juR9ZSu+ZnZkyIQe4zOWXbgc
	 Etu30kO7ulC+310SjaJW4ROCiRJuBumKH+YpWs2qYuW2sROXhjPAd0grW6Ko7qGCWf
	 t5wnKsXE4ZOZW2IXgjmjVzQklD+xZjLFuK1gCIGIsyNBF97dcW5eoHMaipI8U98VoH
	 7xK1Xbhynl3IDaLAoRt+Fg/aLL2uaydeJ0bJKJGTFZqJ643PARkcUcNn7z5dEvcawo
	 L7T3TWaKem/lg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2737ECE193C; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
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
Subject: [PATCH v3 02/20] ratelimit: Create functions to handle ratelimit_state internals
Date: Thu, 24 Apr 2025 17:28:08 -0700
Message-Id: <20250425002826.3431914-2-paulmck@kernel.org>
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

A number of ratelimit uses do open-coded access to the ratelimit_state
structure's ->missed field.  This works, but is a bit messy and makes
it more annoying to make changes to this field.

Therefore, provide a ratelimit_state_inc_miss() function that increments
out the ->missed field ratelimit_state_get_miss() function that reads
out the ->missed field of the specified ratelimit_state structure,
and a ratelimit_state_reset_miss() function that reads out that field,
but that also resets its value to zero.  These functions will replace
client-code open-coded uses of ->miss.

In addition, a new ratelimit_state_reset_interval() encapsulates what
was previously open-coded lock acquisition and resetting.

[ paulmck: Apply kernel test robot feedback. ]

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
 include/linux/ratelimit.h | 40 ++++++++++++++++++++++++++++++++++-----
 lib/ratelimit.c           |  8 ++++----
 2 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/include/linux/ratelimit.h b/include/linux/ratelimit.h
index b17e0cd0a30cf..8400c5356c187 100644
--- a/include/linux/ratelimit.h
+++ b/include/linux/ratelimit.h
@@ -22,16 +22,46 @@ static inline void ratelimit_default_init(struct ratelimit_state *rs)
 					DEFAULT_RATELIMIT_BURST);
 }
 
+static inline void ratelimit_state_inc_miss(struct ratelimit_state *rs)
+{
+	rs->missed++;
+}
+
+static inline int ratelimit_state_get_miss(struct ratelimit_state *rs)
+{
+	return rs->missed;
+}
+
+static inline int ratelimit_state_reset_miss(struct ratelimit_state *rs)
+{
+	int ret = rs->missed;
+
+	rs->missed = 0;
+	return ret;
+}
+
+static inline void ratelimit_state_reset_interval(struct ratelimit_state *rs, int interval_init)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&rs->lock, flags);
+	rs->interval = interval_init;
+	rs->begin = 0;
+	rs->printed = 0;
+	ratelimit_state_reset_miss(rs);
+	raw_spin_unlock_irqrestore(&rs->lock, flags);
+}
+
 static inline void ratelimit_state_exit(struct ratelimit_state *rs)
 {
+	int m;
+
 	if (!(rs->flags & RATELIMIT_MSG_ON_RELEASE))
 		return;
 
-	if (rs->missed) {
-		pr_warn("%s: %d output lines suppressed due to ratelimiting\n",
-			current->comm, rs->missed);
-		rs->missed = 0;
-	}
+	m = ratelimit_state_reset_miss(rs);
+	if (m)
+		pr_warn("%s: %d output lines suppressed due to ratelimiting\n", current->comm, m);
 }
 
 static inline void
diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index ce945c17980b9..85e22f00180c5 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -51,12 +51,12 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 		rs->begin = jiffies;
 
 	if (time_is_before_jiffies(rs->begin + interval)) {
-		if (rs->missed) {
+		int m = ratelimit_state_reset_miss(rs);
+
+		if (m) {
 			if (!(rs->flags & RATELIMIT_MSG_ON_RELEASE)) {
 				printk_deferred(KERN_WARNING
-						"%s: %d callbacks suppressed\n",
-						func, rs->missed);
-				rs->missed = 0;
+						"%s: %d callbacks suppressed\n", func, m);
 			}
 		}
 		rs->begin   = jiffies;
-- 
2.40.1

