Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDBE22FF4C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747217; cv=none; b=CNceAwUFbGkHM1FjU/7Uf7tSc19svfUfueVrLhPnd20ZeYaWqjWGprSd5cKARaOJFiEvTvBRT7zAHoAAZSBZTj5lf9rmefWqWEhRp380wQYdVmbZkMlp0lVot0DyLaXUbQVTFDTSLWTBhT+0hnVFu51NdFd5RzewqEDdbYXsgxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747217; c=relaxed/simple;
	bh=drIhZlz6qjJXl6CfFVToJFT9tX9Y5dyNfzQrE+P3u7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WZOi2BrVBew8kZlwav9R2QP14j0SFmGAEB2Y3QAcs82gS8w2f8um8Ik51c4c/L6X1o/Mh9kXutaHvrEgA44RRqUoCS+y731iFvTy6YwUIK12C+ZevKuUp9+9j0MJ125dYD48X4sPxYShegxQ3aoLKe+/WrzByBG8WDeFIVT0Vk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rLMpsOoU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rLMpsOoU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC12C4AF09;
	Thu,  8 May 2025 23:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747217;
	bh=drIhZlz6qjJXl6CfFVToJFT9tX9Y5dyNfzQrE+P3u7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rLMpsOoUnVHJIDm1kqQzIFgOosNuV5bLl6Cq2DrQKvgCR2oWbblylQ8pHauqQNCA2
	 W4PRsrpWeAeLO/bsvX8+1Rc0Qb1kS4PyCU5vDaaJK0j47GrsqwuRDYZwDSaH234vos
	 qkp+gCaeB8DrSG7wXBDDX2HkSCzq5wqLkwX9pH8clYC0WG5nhfwWyApeShG57RQjfn
	 qaefop8/a1/X7DNxMaif+NJfjU5vvPYnrF2IT1tI3XB4Iz9oXLXHnhR1QagbR23lih
	 7n+cOICeLfIPm0BkRPm8UR/3weuoWAZ9dbjnJb0/YhO7nrw+FN9/bG8juCbNWmh491
	 8h040afHDZbOw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6BF2BCE127E; Thu,  8 May 2025 16:33:36 -0700 (PDT)
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
Subject: [PATCH v5 06/21] ratelimit: Count misses due to lock contention
Date: Thu,  8 May 2025 16:33:20 -0700
Message-Id: <20250508233335.1996059-6-paulmck@kernel.org>
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

The ___ratelimit() function simply returns zero ("do ratelimiting")
if the trylock fails, but does not adjust the ->missed field.  This
means that the resulting dropped printk()s are dropped silently, which
could seriously confuse people trying to do console-log-based debugging.
Therefore, increment the ->missed field upon trylock failure.

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
index 18703f92d73e7..19ad3cdbd1711 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -44,8 +44,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	 * in addition to the one that will be printed by
 	 * the entity that is holding the lock already:
 	 */
-	if (!raw_spin_trylock_irqsave(&rs->lock, flags))
+	if (!raw_spin_trylock_irqsave(&rs->lock, flags)) {
+		ratelimit_state_inc_miss(rs);
 		return 0;
+	}
 
 	if (!rs->begin)
 		rs->begin = jiffies;
-- 
2.40.1

