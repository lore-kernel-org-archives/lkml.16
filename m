Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCE723185B
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747217; cv=none; b=RUWVi5bqPOx7nMomlqmr6R76VWSeAiF0s83wfx14e/VuDkBjBXQD3L3exrFPVd2IXNnxbwD2HtMdZ/Gd5yUsdiaWVPeTUZrvZujr1+3bl5dkkTSwdIPwTx5RQvc57SLyj/7bG1SGNzVnE9GM/q72fNsvj800I/jKnTHFa3s4+eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747217; c=relaxed/simple;
	bh=F8T2xxbMxQXl7LOrVaC3+b+nco6tPLr/P6VQcN8CUaQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YGTWgT9OYN3JuyGlhVHo+dA1uh7ZMGsAO9xyFLT5QJnjlvX2twSDD9xZdiWUfhj/RtjdckOj38/sTXsGFLCRJ4M818gsQLZnydX2qh5bOpWUTbZcHUVi9iOXIBW6zQcWHbhrnmivp0HT389c0oYjDNDYvckApot7Y2Yg6mWRF1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1k4bXHL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1k4bXHL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644B1C4CEE7;
	Thu,  8 May 2025 23:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747217;
	bh=F8T2xxbMxQXl7LOrVaC3+b+nco6tPLr/P6VQcN8CUaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o1k4bXHLdsGiEDYCbOugw4t3HlUtxJbb+gLDFgjtD9XYnY3HJyU29NtFfKs8qg9Ui
	 GQA/7Jk2blh1+PMJbDwzVE6XOyvduoy5ZxcfPZmO839Yk+Rk5o09j215E4gRwj6MZp
	 ENVQ9D2cflyIec9lxQC/bqyXOXApZLoGtxOho+ZX9+YPG+QVAckfJwFfIsj+cwCbF/
	 XUUiIA1c6LaWcXqf8b7nBMaefJyHaaEeSViFql0AA9dmNPrR29cy+MHMtqeCXn8OrR
	 nwSzcONWNAKIdQ2TgtzENfN8V92RGc2GLARe8Q4/pSBTKJ7YbRPxg7N5sJOqw9H+7Z
	 Zd3c8MIyPUO6A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 87689CE13C4; Thu,  8 May 2025 16:33:36 -0700 (PDT)
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
Subject: [PATCH v5 15/21] ratelimit: Simplify common-case exit path
Date: Thu,  8 May 2025 16:33:29 -0700
Message-Id: <20250508233335.1996059-15-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <1bcf7d5e-b89c-4118-b872-c8896bdbdc19@paulmck-laptop>
References: <1bcf7d5e-b89c-4118-b872-c8896bdbdc19@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By making "ret" always be initialized, and moving the final call to
ratelimit_state_inc_miss() out from under the lock, we save a goto and
a couple lines of code.  This also saves a couple of lines of code from
the unconditional enable/disable slowpath.

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
 lib/ratelimit.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 6a5cb05413013..7c6e864306db2 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -33,7 +33,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	int interval = READ_ONCE(rs->interval);
 	int burst = READ_ONCE(rs->burst);
 	unsigned long flags;
-	int ret;
+	int ret = 0;
 
 	/*
 	 * Zero interval says never limit, otherwise, non-positive burst
@@ -51,8 +51,6 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 
 		/* Force re-initialization once re-enabled. */
 		rs->flags &= ~RATELIMIT_INITIALIZED;
-		if (!ret)
-			ratelimit_state_inc_miss(rs);
 		goto unlock_ret;
 	}
 
@@ -110,19 +108,17 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 
 		if (n_left > 0) {
 			n_left = atomic_dec_return(&rs->rs_n_left);
-			if (n_left >= 0) {
+			if (n_left >= 0)
 				ret = 1;
-				goto unlock_ret;
-			}
 		}
 	}
 
-	ratelimit_state_inc_miss(rs);
-	ret = 0;
-
 unlock_ret:
 	raw_spin_unlock_irqrestore(&rs->lock, flags);
 
+	if (!ret)
+		ratelimit_state_inc_miss(rs);
+
 	return ret;
 }
 EXPORT_SYMBOL(___ratelimit);
-- 
2.40.1

