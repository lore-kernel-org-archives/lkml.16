Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972052E62D8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743714917; cv=none; b=Td8gOF42A1vgTW0PoFEL6MNhvs5GpGvRFBsWfa27Kl/KpnES93AhU/z/B87MXRqGU86e6qxsTOKWapOg/RprHW+/wZvD0tZeVmapGQVy3/RPRUiLCRg2qaArVcOrQYAn6NeXWRLToTvEJPFk0GgmxnCcOpLCeK5PLrnPQTB1hmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743714917; c=relaxed/simple;
	bh=j3yOGdgZ8xMCRP8ceU9TeIiJqrWt+5iLiJJkl91b5wM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QttjNB5LH/8RNNi1JYeK+jLonSOvUCIdkY3jFqZZLTVqWSOjdnC1rXBJKzqZSCkp9bNJ9HoeILrKu7acoV6NAN0+pkbDV5dkE6Q6z+Xi5/H05x+wEHNayV8R6ep42wQlYUnxL8U4Tc4Ahh5hB3k8Dbn/dGcTMsKT5To+0ehkauA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqCoqiCz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqCoqiCz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4933CC4CEEF;
	Thu,  3 Apr 2025 21:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743714917;
	bh=j3yOGdgZ8xMCRP8ceU9TeIiJqrWt+5iLiJJkl91b5wM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZqCoqiCzpSef5aNYZrCvriPM8cciyqsIFMRZEnahuDwafH1WAOCHQQwxJWiGHFTnL
	 A2W+m1FE6tnWGKnXHv98X3aRXNbdq8SehoGxVAPqh9lFUvVqeSIttkTogwX4yCN26K
	 wsh3b7jXKVersPIKJsgmFap+aG4mwnha5LxdPmbiI8w6OUZFTZLVxI/OZX3r561DH9
	 GAgeJBMUFjkaOW5zxlHWeHny3JM8/9W56z6U4WBu06pPZI4ImAhSQrVEhEQ98a8som
	 DaljLmHesjNLZlc6XlhhvRv5aQPo9pY25j2/a+LjBxbV8bh96uBABixYMOwu22b4R5
	 uysLdpIbVLVqg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A5858CE0F64; Thu,  3 Apr 2025 14:15:15 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH RFC 7/9] ratelimit: Avoid jiffies=0 special case
Date: Thu,  3 Apr 2025 14:15:12 -0700
Message-Id: <20250403211514.985900-7-paulmck@kernel.org>
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

The ___ratelimit() function special-cases the jiffies-counter value of zero
as "uninitialized".  This works well on 64-bit systems, where the jiffies
counter is not going to return to zero for more than half a billion years
on systems with HZ=1000, but similar 32-bit systems take less than 50 days
to wrap the jiffies counter.  And although the consequences of wrapping the
jiffies counter seem to be limited to minor confusion on the duration of
the rate-limiting interval that happens to end at time zero, it is almost
no work to avoid this confusion.

Therefore, introduce a RATELIMIT_INITIALIZED bit to the ratelimit_state
structure's ->flags field so that a ->begin value of zero is no longer
special.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/linux/ratelimit.h       | 2 +-
 include/linux/ratelimit_types.h | 1 +
 lib/ratelimit.c                 | 4 +++-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/ratelimit.h b/include/linux/ratelimit.h
index c78b92b3e5cd8..adfec24061d16 100644
--- a/include/linux/ratelimit.h
+++ b/include/linux/ratelimit.h
@@ -43,7 +43,7 @@ static inline void ratelimit_state_reset_interval(struct ratelimit_state *rs, in
 
 	raw_spin_lock_irqsave(&rs->lock, flags);
 	rs->interval = interval_init;
-	rs->begin = 0;
+	rs->flags &= ~RATELIMIT_INITIALIZED;
 	rs->printed = 0;
 	ratelimit_state_reset_miss(rs);
 	raw_spin_unlock_irqrestore(&rs->lock, flags);
diff --git a/include/linux/ratelimit_types.h b/include/linux/ratelimit_types.h
index d21fe82b67f67..ef6711b6b229f 100644
--- a/include/linux/ratelimit_types.h
+++ b/include/linux/ratelimit_types.h
@@ -11,6 +11,7 @@
 
 /* issue num suppressed message on exit */
 #define RATELIMIT_MSG_ON_RELEASE	BIT(0)
+#define RATELIMIT_INITIALIZED		BIT(1)
 
 struct ratelimit_state {
 	raw_spinlock_t	lock;		/* protect the state */
diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 19ad3cdbd1711..bd6e3b429e333 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -49,8 +49,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 		return 0;
 	}
 
-	if (!rs->begin)
+	if (!(rs->flags & RATELIMIT_INITIALIZED)) {
 		rs->begin = jiffies;
+		rs->flags |= RATELIMIT_INITIALIZED;
+	}
 
 	if (time_is_before_jiffies(rs->begin + interval)) {
 		int m = ratelimit_state_reset_miss(rs);
-- 
2.40.1

