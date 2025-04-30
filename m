Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ECE134CB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975127; cv=none; b=iMXspUzqlTrL8XuF1SCGbDff2C/mliCHijTm0arSXhAOBRd1IgchB0HzWDAP0nyLgq5eDJfF4It69kky+Qo6DM3m337bvqhXeXBVkq1okeFz+R6Zmk2KhUqizSXgO8fhWE4ome4hFZr//LbZ4/vrwc6hx4rMMiEtXWZ2qINd7QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975127; c=relaxed/simple;
	bh=drIhZlz6qjJXl6CfFVToJFT9tX9Y5dyNfzQrE+P3u7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TvymNZ79VCtwKK3JOIAauBJZmCfO2gzJH4SM+H/nDbuC+IqRY2ItGalxGhdNBgI/kM4cW/sVUV9/3j3VjdD+03hvu41D8kR0CX/J/YwVNb8WxxK4sGiAOJ+/hsRzLbTBqlhyU95/GvMKx5mtUAbtVZDUpEVBlzrDhG9C33MX9hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYO3AJC6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYO3AJC6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF39C4CEE3;
	Wed, 30 Apr 2025 01:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745975126;
	bh=drIhZlz6qjJXl6CfFVToJFT9tX9Y5dyNfzQrE+P3u7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZYO3AJC6RXPJeaS+caIxQrzhTeKEi94FbgC1Uc0iLBoCA9Zlwz2uW+qGjfMy23MoH
	 d/FukNP/1PD10TRwKVeS3SJ0FrP0lDcjL/M3fNSZ80DhXg7Amzv3aW8oEi52P7Musl
	 8vJ1mBpFZ3ZP2gBr/1SE8Gxbc/XEmn0ac4fpCFd3k4YDkYoLUTIrBefLx4xmPGRXHf
	 wwaZ5gVACPV+52BuXVgLfFBeQzJS41F+c5lhjTn/98IUwFJ6uPUbKRdm7baj3vNpcA
	 4UDh7yJAbIG2288Fz9h2fSgCbDbCAHDzwUYVKHrCQsrHJEcRjrRDyaTHN7shzllQcW
	 qSbbWYc511zPQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7B7DDCE0E61; Tue, 29 Apr 2025 18:05:25 -0700 (PDT)
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
Subject: [PATCH v4 07/20] ratelimit: Count misses due to lock contention
Date: Tue, 29 Apr 2025 18:05:11 -0700
Message-Id: <20250430010524.3614408-7-paulmck@kernel.org>
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

The ___ratelimit() function simply returns zero ("do ratelimiting")
if the trylock fails, but does not adjust the ->missed field.  This
means that the resulting dropped printk()s are dropped silently, which
could seriously confuse people trying to do console-log-based debugging.
Therefore, increment the ->missed field upon trylock failure.

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
 lib/ratelimit.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 18703f92d73e7..19ad3cdbd1711 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -44,8 +44,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	 * in addition to the one that will be printed by
 	 * the entity that is holding the lock already:
 	 */
-	if (!raw_spin_trylock_irqsave(&rs->lock, flags))
+	if (!raw_spin_trylock_irqsave(&rs->lock, flags)) {
+		ratelimit_state_inc_miss(rs);
 		return 0;
+	}
 
 	if (!rs->begin)
 		rs->begin = jiffies;
-- 
2.40.1

