Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CBB262A6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975127; cv=none; b=d8LbDjZ3Vtj9tgEjbNt6v6O0twntWsFnalEeHtdhMMlEQxvOR5dVLknADjeecR+KgoL0Ifc39SBiUSgPLO6HHtTPe/x9vVvu9Zu+UNJqVTUEsIdLG+pHQn97IsblrHbaA+ix9kouAgNOJjBTSnD+XIHfjmwF2hn0V1CgI3vV0DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975127; c=relaxed/simple;
	bh=x6kgo4O9hta9sDmEsHUTl1Ls9HFDrMxc1Cr1vGjF/bo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dBnpFqVKY9IOUbdGTyUMo/663O9hPBM9DLH4jnZKURvL87og3U/EePIi5B5Rmdg/yVwiLeyWnl4iH4ktjFUzLrZyyOb+JfULG6CTfWeaRtfgJBP7QckjB05STCyOik92v+2W+2fMa2zUPnVj3q9ovRNPZQPJ1dZQkTtp1rjPpGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NT2J/2tG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NT2J/2tG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E885C4CEF1;
	Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745975127;
	bh=x6kgo4O9hta9sDmEsHUTl1Ls9HFDrMxc1Cr1vGjF/bo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NT2J/2tGCdqUGnNFOcq7QiBa1f382Z5ZT5ZbxoAAJwcpp8RX2566VuOwZsl5yKuUV
	 hUOlSXKpkJRJ2sObAOiip7fAEwnAl0mqp/E2Me6U7hk/SADxNrZEDSXjMggWCWyDmB
	 YInif51EnfnZXymtBSYWMGpgteZtTQ9LtOd2eVldIAMRGt17X/2mIuW0U2fnZlxLKI
	 R4YkyNzejtwYEGRzt1HYMMCah6vsivkuPlgZtgJEuEsSuWfHsYUx5mwkHlZ2+bce/+
	 kho5qTPlT6lGdTtQg6LCO8S8kBWssGTnzGh2duFzVDdHEyGVgR4YFEU/i5tsMIJE49
	 Pu9ynIufxD7Hg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BBA5FCE10F4; Tue, 29 Apr 2025 18:05:25 -0700 (PDT)
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
Subject: [PATCH v4 12/20] ratelimit: Don't flush misses counter if RATELIMIT_MSG_ON_RELEASE
Date: Tue, 29 Apr 2025 18:05:16 -0700
Message-Id: <20250430010524.3614408-12-paulmck@kernel.org>
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

