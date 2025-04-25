Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624FF17BD3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=ppqucQSZEDDUXn7Q6mf4y0k3ETkYqG0NVpiPa8bVAwYhnrql6EtBOnI03ziwH6Dn4Edod60PnFLtOppA6JfnCDHHOFvDS8+0OqYl5PeHqn+WX98Yxl19UTM/4kIhKCTgnXtRl9O7zEk4Xk9Pi+YeM++esWZZvZUT/9hjpmC5+ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=AoiJDX1WRQ1z8ex9aR9Xj2ae6DYdYMrmnnHw0NJSU5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tlxnb0MT5xlHBqxof/ewh9S1Z5DYPcytmR/ZFNgzTJpckl+GJplKX7osM8vbYaIGg+IQz+PHaFAGkmYEQZCFb1NhPXJQjuTeYww0sg7l/ufAcFAR6/n0Labq7eYVmx7TwtORjw3bJVCthARN70Hczsu+a0Yz+wbqLmqqaBqnZoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=muomQSgc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="muomQSgc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B9BC4CEF8;
	Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540908;
	bh=AoiJDX1WRQ1z8ex9aR9Xj2ae6DYdYMrmnnHw0NJSU5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=muomQSgc9VyHupd95LHN2iYNEtZkUlBktLDUE3f6OMPUEq9XaVdYNl29/PEndLfmR
	 PUr4GULMUlSAcPpyATT9C5dPYgXZl0ilIqm6Ferk4yATFJpzmBAizaQhJc2guKP0Kc
	 RUFsBEx0Lmj6LG1xn6GawFARWI9t4vq44jd8N0NwYe7XZG/ITWnH5mbsoBGU2TjfE3
	 q2IzxUW1fyMPd9zTpI5LgoA3sAPU8UYBBXzWFAzCZ3GQZe9/0LqwoyrP0KpFQ1UHWf
	 PYpYdxwIHkz/bSypeWx+0WHwPR5FiRP0H9TBaEI/81QvfV6RsjVncPkdUpx+bEHgbf
	 qgL0fASq8mv4g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 3F245CE1CFF; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
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
Subject: [PATCH v3 11/20] ratelimit: Force re-initialization when rate-limiting re-enabled
Date: Thu, 24 Apr 2025 17:28:17 -0700
Message-Id: <20250425002826.3431914-11-paulmck@kernel.org>
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

Currently, rate limiting being disabled results in an immediate early
return with no state changes.  This can result in false-positive drops
when re-enabling rate limiting.  Therefore, mark the ratelimit_state
structure "uninitialized" when rate limiting is disabled.

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
 lib/ratelimit.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 7a7ba4835639f..52aab9229ca50 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -35,11 +35,24 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	unsigned long flags;
 	int ret;
 
+	/*
+	 * Zero interval says never limit, otherwise, non-positive burst
+	 * says always limit.
+	 */
 	if (interval <= 0 || burst <= 0) {
 		ret = interval == 0 || burst > 0;
+		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
+		    !raw_spin_trylock_irqsave(&rs->lock, flags)) {
+			if (!ret)
+				ratelimit_state_inc_miss(rs);
+			return ret;
+		}
+
+		/* Force re-initialization once re-enabled. */
+		rs->flags &= ~RATELIMIT_INITIALIZED;
 		if (!ret)
 			ratelimit_state_inc_miss(rs);
-		return ret;
+		goto unlock_ret;
 	}
 
 	/*
-- 
2.40.1

