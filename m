Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE16230272
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747217; cv=none; b=E6zU1kET8yTv9CJi/6DQAmJLc8QNf14btRFRUbaN8eNI6vzO/R/XfHtxlDfcebR0bAJYMi6wGkBwIlSvb9KFdHT1YwWvgg5/EUIlZL++ubDkVT2NFAL+ntqhQ6COfNJwcuvk5cWBO8zivu6xCQQb3R6fn882e2pfQwVRRiqS4yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747217; c=relaxed/simple;
	bh=x6kgo4O9hta9sDmEsHUTl1Ls9HFDrMxc1Cr1vGjF/bo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RzGoDNGSWDwsLwCrX1Vz7IOJtjYZb2YJjIi1EZ2RrjbJImJrc7KHZH+yWL13a3G2r1gPUBQWX9mL+ukIGf+9hAzZFoN77eZ4B/Ln1HlGZps/zgJxePyCDegOxhYrWtNe3+HfXrzQxjmATENx8p91rCZSlIld2BJY9ZvgGJVpNVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ctcw4eHz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ctcw4eHz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384FBC4CEF0;
	Thu,  8 May 2025 23:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747217;
	bh=x6kgo4O9hta9sDmEsHUTl1Ls9HFDrMxc1Cr1vGjF/bo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ctcw4eHz3yC8z4dT0dBFf8dozjkSA1RYzWyYRMLqdtD+NUodKLEf81guFtr1epPlZ
	 lAUpnVZl0bkQur7InS6ah/+ICj00eT5KFK/HS6qWYrdBDpcC8DdPpLmQvsjpLK1KN7
	 ockfg5LCW8SG3dfd5wxYHrYDouKkWtDdiWFbbGA++EbpZnqCwcCaCSCt6MqDQZGUk/
	 8iEDlRYOanXU7/48QZKD+gGVScj0GDKGhiEXBHDj8v7Au62360Md6lQ1ox4r/FfDFR
	 WW4P/nL3S6IpZBYuhNqln1uw69UT3BJVWwjY8mEp87dsnMblrchZbwXJ1OprlowtOl
	 QEz1ov++o8UtQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7AFB7CE130E; Thu,  8 May 2025 16:33:36 -0700 (PDT)
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
Subject: [PATCH v5 11/21] ratelimit: Don't flush misses counter if RATELIMIT_MSG_ON_RELEASE
Date: Thu,  8 May 2025 16:33:25 -0700
Message-Id: <20250508233335.1996059-11-paulmck@kernel.org>
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

Restore the previous semantics where the misses counter is unchanged if
the RATELIMIT_MSG_ON_RELEASE flag is set.

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
 lib/ratelimit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 7d4f4e241213e..4e520d029d28f 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -92,9 +92,9 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 		atomic_set(&rs->rs_n_left, rs->burst);
 		rs->begin = jiffies;
 
-		m = ratelimit_state_reset_miss(rs);
-		if (m) {
-			if (!(rs->flags & RATELIMIT_MSG_ON_RELEASE)) {
+		if (!(rs->flags & RATELIMIT_MSG_ON_RELEASE)) {
+			m = ratelimit_state_reset_miss(rs);
+			if (m) {
 				printk_deferred(KERN_WARNING
 						"%s: %d callbacks suppressed\n", func, m);
 			}
-- 
2.40.1

