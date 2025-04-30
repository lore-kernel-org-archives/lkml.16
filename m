Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872002C1A2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975127; cv=none; b=Xkm33ZS/fUQqnUCJUZleqRDBcHAIQqWkTY8c6k+Y3IarDSV6lVH+r/DYkVUTRAYdYBzJsBcidIJJWX1rQtvpZ43goZGAfks983IDnmmOlsL9pu9AkDdvlX+v7suAY2mivFxEfYbN4tisMbhWaQv4CdtpeXe3y+8WH8s55FdE0Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975127; c=relaxed/simple;
	bh=F8T2xxbMxQXl7LOrVaC3+b+nco6tPLr/P6VQcN8CUaQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RjFFr6xt4FSDttiLq0VMK+r23W7EwJmdbk6X0dcXujIpXCvcwbVyY4doN6Sa9kpb751PaScv1yvwkbUWvxcMMnS+HLPiZsvYVEErbAcsfTEo50LDCbGAuwgyaTuXL5fZIjeLxhBXp6QcSLeW5mBGNNgFSBpOjCdy8qpS2PPNKTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGfe98lD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGfe98lD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E6FC4CEF8;
	Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745975127;
	bh=F8T2xxbMxQXl7LOrVaC3+b+nco6tPLr/P6VQcN8CUaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JGfe98lD74Q2P4ub0kckHKJcw4S5ECp15JpVhSbVU7sAk/gujtu8Rd9DIE16J1nUe
	 DAgJXMJPdtZUHX7XFHClXFzSQLhZZK2WqAtzMEKchl/5Oona4G/RO3vmYvmNnMpi9E
	 uNbb3xMpIpmrQSGupPG9eOumrgolZVA/go0QgQb+KZMuhpUhvx/ORtEvR1tmeWLpv3
	 8rkW12SHexULmdjT9p/BbPyNq8y/MfqyE9YGeGmUnA1nHGHeLwYpG2hzaE9uO/3q8R
	 hCK7NXqdzzv23tYvA2tVPGm2iSSNvgYUO2LH08DsfN/8cOMH2Qbfpue/N6hEaJZRs5
	 qVoQliR2MJtXw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D440BCE077B; Tue, 29 Apr 2025 18:05:25 -0700 (PDT)
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
Subject: [PATCH v4 16/20] ratelimit: Simplify common-case exit path
Date: Tue, 29 Apr 2025 18:05:20 -0700
Message-Id: <20250430010524.3614408-16-paulmck@kernel.org>
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

