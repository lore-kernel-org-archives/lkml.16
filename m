Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA1E21A449
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996443; cv=none; b=Bu5mAcbu2jK+NeP4dCLBfJo3DM3dgHAkI8DqQrqeMqjsw559pNQw8hznWrETB1W8VJGyVq/Zbxhfi3q75tSLCsQte33ta7b6F42DiGYGweEnC7bRoJgTzesPHyOrOgcvcscse3Jih/6/NsuFNq/kYOkXg7omOBU2KQRgLSVnkmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996443; c=relaxed/simple;
	bh=DG3QZay+IMZyRtI+nhohiglWCJq9NNdhPnvRE19TqNE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WUx3JgQeSYSG1tQUzyFujkO2huMORNpwPaOI1y0wc01l5fk0MvYcLstKV6POUp9byOunHIrtMZsEf28N/6SQlavioq9L4YvkBIaxMz7nT9It9cm5bD0icisC39sq5lKtvQpJqDj4WTq13lkh6toHxY88rhoNDGJU9jsjuCoo5jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPH/qIC+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPH/qIC+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA657C4CEF0;
	Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744996442;
	bh=DG3QZay+IMZyRtI+nhohiglWCJq9NNdhPnvRE19TqNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YPH/qIC+6ei+yRywUWxXxoI7IETm3OxqzGoBMkujLg7AYdBkxald71AETvVTz2HhL
	 gElj1P1pYT2QEzheXmRlWRI5zMah5wTQB7ieozvIeCsy0Xc5rFSs3cPFKEm6GIxT5R
	 K800ujaltD9KVrJ11z/a1FsgJ1WsiZi6uFozif4RYvGNLlx1c1BIHunfy1MbWKNy9f
	 zvcHooAq/s0mF7k2Zzzk7S3LQ3y7VgKnNusXvLnHlHssnF2rLAnZVd/92v2knIX71i
	 IQgaYJNOQ4IggtV49E9dIjPHbYQsWg4cKsEMJ1kd+GRgetfAXreyOnwrrNtW+wqEHb
	 pJezPW1EzPGAQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 00076CE1773; Fri, 18 Apr 2025 10:14:01 -0700 (PDT)
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
Subject: [PATCH v2 ratelimit 11/14] ratelimit: Force re-initialization when rate-limiting re-enabled
Date: Fri, 18 Apr 2025 10:13:56 -0700
Message-Id: <20250418171359.1187719-11-paulmck@kernel.org>
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

Currently, rate limiting being disabled results in an immediate early
return with no state changes.  This can result in false-positive drops
when re-enabling rate limiting.  Therefore, mark the ratelimit_state
structure "uninitialized" when rate limiting is disabled.

Additionally, interpret non-positive ->burst to unconditionally force
rate limiting.  When ->burst is positive, interpret non-positive interval
to unconditionally disable rate limiting.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 lib/ratelimit.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 04f16b8e24575..6c639ab6489d5 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -35,8 +35,20 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	unsigned long flags;
 	int ret;
 
-	if (!interval || !burst)
-		return 1;
+	/*
+	 * Non-positive burst says always limit, otherwise, non-positive
+	 * interval says never limit.
+	 */
+	if (interval <= 0 || burst <= 0) {
+		ret = burst > 0;
+		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
+		    !raw_spin_trylock_irqsave(&rs->lock, flags))
+			return ret;
+		
+		/* Force re-initialization once re-enabled. */
+		rs->flags &= ~RATELIMIT_INITIALIZED;
+		goto unlock_ret;
+	}
 
 	/*
 	 * If we contend on this state's lock then just check if
-- 
2.40.1

