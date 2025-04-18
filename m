Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376E621ADD3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996443; cv=none; b=P+1G0+7loY7hsHSXy6Hc1fxc8MkpdbGO8l8RESSqEPsAbXptIf9J30EvsDE2f5pGvHy40N2MTiUq3Xac5PczL0dWfSQ1ae5DugF5u7QugtreIRUkolblGKLiWm75TKRVycqapBi+Q1ZwYX96Uu5u4ECJapgKOKuC++0+dcbvSBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996443; c=relaxed/simple;
	bh=IQ7shti0hALgVdiAlZdiEITXvNKwzygSDDaW2FuJunA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P/UIQKIaa3DbL3XmBfcFrArr0fjNykgYP4DRJemjJEhk0j4APdkirfIKbk76PHSZsO/Oovwc+zl+EzGh6x57PxITtLW8Uyq4w83bI9Nz2tJOPaFh3FroS+yWNkhUUX8IgfeAeU1SSd1lD8YR4AnVliTbgMz3DB9mFx3wY3YKU5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKFpz6vl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKFpz6vl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF197C4CEF4;
	Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744996442;
	bh=IQ7shti0hALgVdiAlZdiEITXvNKwzygSDDaW2FuJunA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SKFpz6vlWHDadYnaxK+Re7dm7YlPStPBrxJkYb/3/VBdq7712tMSpE96LyXXt54DM
	 pwCbVaERoM9pyLigW4iRZnpgR0ZhJ/OVM9nqkOTKtoDCNuBys/OpNZaail6r5PMkr3
	 VXtuvYY4g5syeb87+EVibjpLcFX2CD7OIFNwqrPbJdOID/v+lRQ8ussz9x9hapBIlU
	 GbUJzpy7Nmj55xWcxn1hJcLngZtRbj35xoAx0L3vOzqGQnWvyJ9876VqweZI0FHqIY
	 qXqFhmBj/58J9bDOHgUaes4JOJPL8SXHv7x7ymvNveNegaUrx+hiywZ4XIjRAqZ+qu
	 tZbihHINFTLtA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 02D5ECE17BC; Fri, 18 Apr 2025 10:14:02 -0700 (PDT)
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
Subject: [PATCH v2 ratelimit 12/14] ratelimit: Don't flush misses counter if RATELIMIT_MSG_ON_RELEASE
Date: Fri, 18 Apr 2025 10:13:57 -0700
Message-Id: <20250418171359.1187719-12-paulmck@kernel.org>
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

Restore the previous semantics where the misses counter is unchanged if
the RATELIMIT_MSG_ON_RELEASE flag is set.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 lib/ratelimit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 6c639ab6489d5..b306e230c56bb 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -87,9 +87,9 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
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

