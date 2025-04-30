Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F0241AAC
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975127; cv=none; b=cpASn1Qe3/cMOC05fR4/QEhpZWII9CO7r1fNG3CO94o2u4KuGmfvzDLIcH69CrA+votal7vEtNinBPeILYaU3Xb5NBzmb/pTwrtfG4MNigW5G1Gxz4pdFpttMgW+/AeDPAEDAYwN18aWumGEjChv+K5XluLJ8Zg/dGD6I5SHMBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975127; c=relaxed/simple;
	bh=NCii0AygsQ7t/hzmWNQsffMOxKXMFGYLlumd3Gn7O9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lpmF6Uuqr/c1Nk00frBKN4LYBx2V/2IAhovjAQT//LOhMm+WPIDUli/fIyZJniXLCJ1ggkXAhB4GNHrgD1RMASB6pr67QRkNuLYgGR2P25sfa521nG2At4ss8JiwWa0X7K2uVAcSy9HH30HY8oB4CAbeDW4S/N0m1KzCXWhrdqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q27b/DA2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q27b/DA2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D876C4CEF2;
	Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745975127;
	bh=NCii0AygsQ7t/hzmWNQsffMOxKXMFGYLlumd3Gn7O9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q27b/DA2L68ZFp80NHX0Cpuf7QxNXmW6PXrwrGwXEdQ4pReA+bU2TTG9GH4gRtCS3
	 lozfkTEW+zrY6C4oyPDbsxU5+5khX7JRt85tODrQBP5SXyv17vO7P/jGmrSNWcKzFK
	 Xw2+g1qsnssvOy7RAaD5kQAvJhlck3l41K5TxogSPUI+NwBsaTh+1pRlucmMxLShik
	 dBmMYRQwVuypD4+oun+TswTyHxz6VAnxC9deMUBrxeCK6UWLkp6NIV6M70uMZA7OVf
	 zcSF7zs/aS4BSGKft9O2XvyV1U0l/5H51w1WeLjzxlb5HGd0ILKCUbf5+s/xdh3Qo2
	 lCSMl1v+SoTqQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id CE475CE112C; Tue, 29 Apr 2025 18:05:25 -0700 (PDT)
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
Subject: [PATCH v4 14/20] ratelimit: Avoid atomic decrement under lock if already rate-limited
Date: Tue, 29 Apr 2025 18:05:18 -0700
Message-Id: <20250430010524.3614408-14-paulmck@kernel.org>
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

Currently, if the lock is acquired, the code unconditionally does
an atomic decrement on ->rs_n_left, even if that atomic operation is
guaranteed to return a limit-rate verdict.  A limit-rate verdict will
in fact be the common case when something is spewing into a rate limit.
This unconditional atomic operation incurs needless overhead and also
raises the spectre of counter wrap.

Therefore, do the atomic decrement only if there is some chance that
rates won't be limited.

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
 lib/ratelimit.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index a7aaebb7a7189..ab8472edeb1d2 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -103,13 +103,16 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 		}
 	}
 	if (burst) {
-		int n_left;
+		int n_left = atomic_read(&rs->rs_n_left);
 
 		/* The burst might have been taken by a parallel call. */
-		n_left = atomic_dec_return(&rs->rs_n_left);
-		if (n_left >= 0) {
-			ret = 1;
-			goto unlock_ret;
+
+		if (n_left > 0) {
+			n_left = atomic_dec_return(&rs->rs_n_left);
+			if (n_left >= 0) {
+				ret = 1;
+				goto unlock_ret;
+			}
 		}
 	}
 
-- 
2.40.1

