Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F1421ADD4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996443; cv=none; b=kBwsFZ0KPGymbt1OmcNr5xfsyNX+HPITGmhPFpxFqWBm2slfEUQSSnEuNjyUHI9XHyHan2lhgRb7hoBAegeQQhLXN0AXREFaqMSEU3E08OuqoDRyZL/Lg2Od3uGDNTeJyO7GFncCxDG/e1uQ1oA4JOPKVv8j4J3tB78O+p1HZsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996443; c=relaxed/simple;
	bh=QpNmSHZ6zOV2xliYb2s0bcKUdg+nsbgy4+hhnPQCF5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f2PnzeIdYtVD8on9IQ9Ea+DlzkmB7UR3xbf0kbD6RK8fUcan1mN50XEgxOC3QrnY9TZ8+0KkIv+nqfilFm95ksZwbFNO5iPQMsg7ImF7Xk0VyHxsylzZlp+XzPUTQyS7FqGN8RBIePC37dMcRDO2+fOci/zOH2ysacX1efj10U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bM5g9CtS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bM5g9CtS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8ABC4CEFD;
	Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744996442;
	bh=QpNmSHZ6zOV2xliYb2s0bcKUdg+nsbgy4+hhnPQCF5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bM5g9CtSMSqgD81sUPdDjdO705u+XTFj1OkxT3RUClOqWXP+siP7znER3q8ZXaUMp
	 KQjmEkNmaV8JSUoY9TJ1Q4XDx87pHxSJzBVk83v4V8256JFv9qXjRHwUKQiTSa3/km
	 wSbpRZCn1PuR3mrBekR0Z94+MTTnf6jF563iplJHpV9IuGZWnVpOxLovduDmNnPS75
	 BcGCp1BDUHzMA39JbmVD2BqHgWKPLwMtX+19GoeZ2vrKdZ9qlr4z0XBpRaV8ynyxDm
	 Z8OmivOTIxTg3k9FOoKAy+ij0DUdcUUQvy78RzAeTbhCZKl8MjWd0LVbdyke6ieGAE
	 4a49K/4tZ8T/g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 05A94CE18B1; Fri, 18 Apr 2025 10:14:02 -0700 (PDT)
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
Subject: [PATCH v2 ratelimit 13/14] ratelimit: Avoid atomic decrement if already rate-limited
Date: Fri, 18 Apr 2025 10:13:58 -0700
Message-Id: <20250418171359.1187719-13-paulmck@kernel.org>
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

Currently, if the lock could not be acquired, the code unconditionally
does an atomic decrement on ->rs_n_left, even if that atomic operation
is guaranteed to return a limit-rate verdict.  This incurs needless
overhead and also raises the spectre of counter wrap.

Therefore, do the atomic decrement only if there is some chance that
rates won't be limited.

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
index b306e230c56bb..2048f20561f31 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -60,8 +60,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
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

