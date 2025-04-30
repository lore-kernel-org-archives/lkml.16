Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7613D544
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975127; cv=none; b=XEY6771Jw6wQ9h34HzbUzUCFX3KTq0+HGC6CoPiJw2KO2e//vu1z/J2WzhDfiFNKPCrlZpBtFEOpxJxx7tbewWm710bHUpb9EM3EZytpUOpMckdSQBwxZZBxfxKYuUsTasJGmGRLMVPaKsmaMJ0v2ay1Wc7tFkkMXBXpR1oNRGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975127; c=relaxed/simple;
	bh=QuXY/enqInz7nSkzplVvspsi9vNMNEEbLePY/x4Nq0g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L30i4SNIcvgXW3gQRcl+UKXXWLqWWLztdGYr2uxS7kkVo8Fwh2MNWzQtcyOYwgL9C1acpCPx2f1F3wLTwnsQrR8W2k4cFwbbPpRnwT2zSA8aWqp+AxlsYER44ILVJFEHh8lskTx9ah1U50AH6vAhCGyl5ifgJdY+NNMihdg9LqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvrHcO7/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvrHcO7/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73DB3C4CEF9;
	Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745975127;
	bh=QuXY/enqInz7nSkzplVvspsi9vNMNEEbLePY/x4Nq0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lvrHcO7/TTN5nyU5mDMLJprXQdjbgmn6s7zsEQYoLwSPdbT7wWG7dCHXSdIzFrplJ
	 n7fM7tpae4Ekl+k5+w0ChQl+2qv/bSpb9hYRSSsxQH4t7/B1MM/weQD3VjwqVPWJ8j
	 tPCv5WP8QeOEy42Toyc4QX4oAW757pj8z9aIde/sBlvna1Br0vMVewUkKsqRp3/XnG
	 oztNRiWVoW+TwU1SQirDUQ24PZH46VT/rTLiLxl0pfnD9AhBu5RKSyJkSCudplzUDy
	 N020hTcQLkxQpYmBBoJMqg+IGiJMCxO7dfinx8MWkbcUYqAJCwyVi//blaI2m94aVs
	 u18E1gIlWdiVQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id DD2F7CE1216; Tue, 29 Apr 2025 18:05:25 -0700 (PDT)
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
Subject: [PATCH v4 19/20] ratelimit: Use nolock_ret restructuring to collapse common case code
Date: Tue, 29 Apr 2025 18:05:23 -0700
Message-Id: <20250430010524.3614408-19-paulmck@kernel.org>
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

Now that unlock_ret releases the lock, then falls into nolock_ret, which
handles ->missed based on the value of ret, the common-case lock-held
code can be collapsed into a single "if" statement with a single-statement
"then" clause.

Yes, we could go further and just assign the "if" condition to ret,
but in the immortal words of MSDOS, "Are you sure?".

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
 lib/ratelimit.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index bcda7c61fc6ff..dcc063af195eb 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -88,17 +88,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 			}
 		}
 	}
-	if (burst) {
-		int n_left = atomic_read(&rs->rs_n_left);
 
-		/* The burst might have been taken by a parallel call. */
-
-		if (n_left > 0) {
-			n_left = atomic_dec_return(&rs->rs_n_left);
-			if (n_left >= 0)
-				ret = 1;
-		}
-	}
+	/* Note that the burst might be taken by a parallel call. */
+	if (burst && atomic_read(&rs->rs_n_left) > 0 && atomic_dec_return(&rs->rs_n_left) >= 0)
+		ret = 1;
 
 unlock_ret:
 	raw_spin_unlock_irqrestore(&rs->lock, flags);
-- 
2.40.1

