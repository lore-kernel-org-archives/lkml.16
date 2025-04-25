Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6291E52D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=tGmj7fdhP+1CliJetDA1/cJYYW7IBVkeKksLxAfHbhag4+6sABp9C7LY8zJnqLsiH9qj91BiPobJ/jjfncwqonYr05tSa34n+r77FzYhhwyxIDOuJimeW8uvhI7rNW3yfeg+8HNkJ9WspuFQGUGpTCHHdkLxEq5L+iOZ1h+GlmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=Ce2sLj777H7UVtPVPiiOrIAzDc+hCANvrpDCmS+t+HA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SwSsHycLsICUSXlfZkotkdmWjtEswp/To3uPgFYNyVn6uXm4ninm3XeygaTdbuJ4ePQMUD5Jk2ny2OJFBIbdEZsMARxnzSLa3+0f5bHVGIVv+4MyxR5gi221Ww6YXT4dnb6BrfDOE7IfqApW0mMKeCmAkKiPsCi6p+MZFeJR168=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tun2kNSr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tun2kNSr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D54AC4CEEC;
	Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540908;
	bh=Ce2sLj777H7UVtPVPiiOrIAzDc+hCANvrpDCmS+t+HA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tun2kNSrJaaLiGgUF954UnBGMrn6AMjNuFV+tSSRJTZMISj4HPjcKsxROb/kVfyYN
	 MmargbAp1nb8x28Bv6Bh9U8+LclSsFcxdVTMufNKPDuOzrO9h+6QkR6CxZHYt/0PyB
	 c8pz/tq2WddwRyAeqSwpS4+LPOLOz3e93gmvXfvT3IqAl9I4GgisySIOtT4vxIwhdx
	 bafmFvCZ07tQHsx8IO/nOnnkzQVgJR/hyz1/DrH22zPlYN0F6mmko4BJXHDOZ1DgX1
	 mmOj/Y/J3JVqCsRZGRcUQ09n+ho17scLK89iSJpuEbuZOnZz9iE+0FM7l1HPGTOAIn
	 fEyVZQd33RNyA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 55FFCCE1DD5; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
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
Subject: [PATCH v3 19/20] ratelimit: Use nolock_ret restructuring to collapse common case code
Date: Thu, 24 Apr 2025 17:28:25 -0700
Message-Id: <20250425002826.3431914-19-paulmck@kernel.org>
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

Now that unlock_ret releases the lock, then falls into nolock_ret, which
handles ->missed based on the value of ret, the common-case lock-held
code can be collapsed into a single "if" statement with a single-statement
"then" clause.

Yes, we could go further and just assign the "if" condition to ret,
but in the immortal words of MSDOS, "Are you sure?".

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
 lib/ratelimit.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 7bbc270b88e21..768f26790ea9a 100644
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

