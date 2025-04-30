Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771A328DB3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975127; cv=none; b=CTfUIyZqAn1DbD//ZTWYPKhLKTFhYW3khiIogxyJVYuMGUfBKM4FRe204RfKynZGohl/M0QQVynwdDKWR3WtpBoTwMHiv9D0Po8+i7YIyd2D5uP0zA1ZR2EhEk3QDoTdsS1jIhcPZyYDTwRxP4ij2CtCg9ktDz6kSXvXdnt6lSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975127; c=relaxed/simple;
	bh=QCSRO+sN3BeKZWvK+OThs6qhu1d5NNPNgRJTZ+bBQSc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A0rTXvoxfkS66gbSv1q3n27X3OlGEtHTaZDb1zMum06oaoDQlutGlBlnf3i2+i1jKpKUW3BiyrIhB/a9XT6DwvIU6G5UJpNd0Jp7Ki9I+aw6/yBilD2FtWh8Hz7w1Smj8O6Du6qh1Fk2fsYr7ItIdl27yQ0mo4CVhVPlpgTJ0sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pdg9wyzo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pdg9wyzo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44259C4CEF0;
	Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745975127;
	bh=QCSRO+sN3BeKZWvK+OThs6qhu1d5NNPNgRJTZ+bBQSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pdg9wyzomGrOJ1zK/Yr8rB3YO6DRbT5FUmF9dpvL7VmFzyKaPGcRcPhPjiGpLt/a1
	 BGaHdO7i7X8K+MZJlFZZU9nTUVhJFXbkrFX117jb0ZDpszk5V75LxuLsqLiKlUI7uU
	 oFTVOEo7BEeqNN3IgZeuWKNllDHZpmZEmO2QnuOI2ElTWGIUjBy6M3qqbQZ1ZXxAxE
	 giCt3OmIdxdHSPiFbDME7n04agpmssmr2Yhb17ySe04eelbHk0i+ais0SnVkr49+FU
	 VT+KqrN8XLeXwGJKVY8nTaLJoS7DQk5HxLB1Lu7AK1aKg0YFNeKQpT+MUEc+z0L5eo
	 r8gEn9Jeu7Qqg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C6FD5CE1129; Tue, 29 Apr 2025 18:05:25 -0700 (PDT)
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
Subject: [PATCH v4 13/20] ratelimit: Avoid atomic decrement if already rate-limited
Date: Tue, 29 Apr 2025 18:05:17 -0700
Message-Id: <20250430010524.3614408-13-paulmck@kernel.org>
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

Currently, if the lock could not be acquired, the code unconditionally
does an atomic decrement on ->rs_n_left, even if that atomic operation
is guaranteed to return a limit-rate verdict.  This incurs needless
overhead and also raises the spectre of counter wrap.

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
 lib/ratelimit.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 4e520d029d28f..a7aaebb7a7189 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -65,8 +65,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 		unsigned int rs_flags = READ_ONCE(rs->flags);
 
 		if (rs_flags & RATELIMIT_INITIALIZED && burst) {
-			int n_left;
+			int n_left = atomic_read(&rs->rs_n_left);
 
+			if (n_left <= 0)
+				return 0;
 			n_left = atomic_dec_return(&rs->rs_n_left);
 			if (n_left >= 0)
 				return 1;
-- 
2.40.1

