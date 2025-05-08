Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942DC231C8D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747217; cv=none; b=sGAyWWiRz/k5x6txcA6Jc4GrIcIGelj1McJxf4AuiMzPHA74cfMlUzpMHyrsE6CXeaO1xI56SXaZhODvedPiTliVA+5+AO7Qqn+JmHxJKycBGicij2Jz27G1fbCqOg63GlWXUfONMVU86YMWeBCQMcRkTMJ+yuCrSAM/ZQ2x9pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747217; c=relaxed/simple;
	bh=NCii0AygsQ7t/hzmWNQsffMOxKXMFGYLlumd3Gn7O9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JHX/OXGt6OAgVsatTvsYO4YQV+SW7+DoaEpQp+sxA1o0J1pHoX4/n/RKBLgzzzFd3VlZrBc6xwRnME4THyvTb8cfsswoabqoAPyLSrj6wEvynUsNvAzgblNYRw/1MuEl1/HEgtDPflpSKkfbye+njM4a/nLD6Oz87b+2derdIxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qxSkAWVE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qxSkAWVE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1B5C4CEFA;
	Thu,  8 May 2025 23:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747217;
	bh=NCii0AygsQ7t/hzmWNQsffMOxKXMFGYLlumd3Gn7O9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qxSkAWVEy5g66fnp1h0GrnYMF26QiEwV8l2E35tRCZsPWbMh2fFmMCMC14Ff5vlmh
	 dDBZtTY+9IKax9yw7C6bc0rkP5wzA+BA0YX8jEb9h7NoWcdxpRKooaPlmhirRkuXr4
	 MsO6bhtX5eTL7aHCN/2kaigMW+Gdnk+7yCPjLVj0+TdAvWluXcimIls3rfQDiFBdye
	 RL7baUK3w1fJA+QLh0MDLdROVphBFYhTOva7X8CrivtRMcymWVbCZTBAuyXGKjcMuy
	 IFN6PL5uV2p0RGlM25EQtaeIv/8It58lO1GROb/X46BIsFOcT3LtJhEMGXEXueyqPl
	 0VI8bhODEZh5g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 811A4CE13B4; Thu,  8 May 2025 16:33:36 -0700 (PDT)
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
Subject: [PATCH v5 13/21] ratelimit: Avoid atomic decrement under lock if already rate-limited
Date: Thu,  8 May 2025 16:33:27 -0700
Message-Id: <20250508233335.1996059-13-paulmck@kernel.org>
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

