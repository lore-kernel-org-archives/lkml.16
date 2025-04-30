Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB04C1428E7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975129; cv=none; b=mZkEBZwW+j0UrBmPONKgIJpKRdnfx1UeI4vmApVNB0y6e5+H11hIKEYdLzukD3/RNV7Dn+G+FVYCl06xGQ4yrx/FeINQkKfqJeANygUvkyby2N4qqx+SIKC4i8Je/ObyDCm3QcvLAwsi/YYo5pwyu1mvfvwJC6N9VU/Ee9F1gw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975129; c=relaxed/simple;
	bh=JP4VCGxb2YnnLFOMJL/zztqr+/zmTsrBpCccs3bYkwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=swQ06uYJZcjyOqIJEH1hKyWeIfdPWqdNduD6YF+TlRcP0z9xo46cfizgbZJGJSvMH1FSuXU1lAzV0WviUIhXXllN7kwbswg0mcMYNpEPaLHwudFGbjqkUptmG0xyDh6PB0K+t6Kuct4p8qLVG2st3YaPZqXw1TTmAKDydCG/ouI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czv3lorS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czv3lorS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8296EC4AF09;
	Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745975127;
	bh=JP4VCGxb2YnnLFOMJL/zztqr+/zmTsrBpCccs3bYkwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=czv3lorSzyIcEuTPMQ9N19WesE6W4jVrEFhcPB+bgSTQMffEM3H3R2TMJnNPBnox/
	 W+2qwMfirqyDRLtYuYhmRLrXsDrkPQVScoQGvMDmghz5uTjCinYCR5n7vaDBY9b+sA
	 SiSD51GY+V3kzp8VNW+IvkofW8kHuIRsoKUgjX5MQAy4ORg9/PDQSqaUxVHWzQiV1O
	 HuXb/Ey60YvS0LeS7tam0ON5GeUyb2Ln/uJJ7fEXFk/KuWGMxYmynYd48OWLtmwujW
	 4RUCnjvQeF8DvHToqgnhjVNZDyCF7VAXrSiviVCLhxPPdejOKv9Nlybvya4+mMyqdS
	 0M/jbaYwu2GrQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E0505CE122D; Tue, 29 Apr 2025 18:05:25 -0700 (PDT)
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
Subject: [PATCH v4 20/20] ratelimit: Drop redundant accesses to burst
Date: Tue, 29 Apr 2025 18:05:24 -0700
Message-Id: <20250430010524.3614408-20-paulmck@kernel.org>
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

Now that there is the "burst <= 0" fastpath, for all later code, burst
must be strictly greater than zero.  Therefore, drop the redundant checks
of this local variable.

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
 lib/ratelimit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index dcc063af195eb..859c251b23ce2 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -58,7 +58,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	 * the current lock owner is just about to reset it.
 	 */
 	if (!raw_spin_trylock_irqsave(&rs->lock, flags)) {
-		if (READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED && burst &&
+		if (READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED &&
 		    atomic_read(&rs->rs_n_left) > 0 && atomic_dec_return(&rs->rs_n_left) >= 0)
 			ret = 1;
 		goto nolock_ret;
@@ -90,7 +90,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	}
 
 	/* Note that the burst might be taken by a parallel call. */
-	if (burst && atomic_read(&rs->rs_n_left) > 0 && atomic_dec_return(&rs->rs_n_left) >= 0)
+	if (atomic_read(&rs->rs_n_left) > 0 && atomic_dec_return(&rs->rs_n_left) >= 0)
 		ret = 1;
 
 unlock_ret:
-- 
2.40.1

