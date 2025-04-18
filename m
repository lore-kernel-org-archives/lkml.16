Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C69121ABC5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996443; cv=none; b=rKrZ8qw7k3ivqxUXr433E54ZIWkOe8h7xv4XuUak2T/lHJJeIfYg/mIm/i5RBgqxllJjy9Hzy4zm12qKgPPmF9nqJBFFyFwYuH9M6SMgdWVmm/CnU5dF+rziQfPd1CVfOYanLcUiunSykn+G8lXtivf4NrZ/oDYt8sbWHi4fKh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996443; c=relaxed/simple;
	bh=S4zyoINK/k1VihcBkWzpPYAZOrOLyaqIzhpOR3LrUaE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I1zdEoq6QkQsI5rkJt40biDnRsQI6IzL/HkJh5qQqJnF1cS0VnmFBROLhPV5v0Hr33ZWMyddIZn5CiPDMTKil+KLWUxZG63jizPmPMkTtcw/JrAr5FDWvziQvhZXUJu/MRTghYGD5Vi5pM4VdbLcxf+JSVi4wzhliqJ/qWRfv5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdcG821q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdcG821q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C26C4CEF8;
	Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744996442;
	bh=S4zyoINK/k1VihcBkWzpPYAZOrOLyaqIzhpOR3LrUaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MdcG821qLrET2cEAZCIKLuK1FnCxCXBc+mjC8dSRjVN9MHz7T2t+73rsyAaDtb8SN
	 ACfWopbYL4woQUB8s6FM3GEUp1SiFfxQgp2F7bYvxD+MpJCx3XdjZP2k7tMVXL4xpW
	 A0+JldJ32zs9bW5ZiIgIa3ZdNl1jx15IKlfd4MSbn8X+vBVuahfjpGZIwgL97cJvIY
	 VIS+S+sF9Kox9RJYKW+oZwHcqmwG57mdbcbB1qZYTO18zW5kXgY4RiULSmRPkki2qe
	 d4Rv9bjDShSAYNlxmPHNd/XPoS9Tk16t6hq+SyQ0RYudiBWeELQDIsZKWApFptmKUD
	 58zLhuuzaynTg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E8699CE13D2; Fri, 18 Apr 2025 10:14:01 -0700 (PDT)
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
Subject: [PATCH v2 ratelimit 07/14] ratelimit: Count misses due to lock contention
Date: Fri, 18 Apr 2025 10:13:52 -0700
Message-Id: <20250418171359.1187719-7-paulmck@kernel.org>
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

The ___ratelimit() function simply returns zero ("do ratelimiting")
if the trylock fails, but does not adjust the ->missed field.  This
means that the resulting dropped printk()s are dropped silently, which
could seriously confuse people trying to do console-log-based debugging.
Therefore, increment the ->missed field upon trylock failure.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>
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

