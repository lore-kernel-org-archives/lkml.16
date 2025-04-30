Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ECE3F9D2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975127; cv=none; b=iOXIl2Kz6HRRQgDkfI8SRCrX8N8tUEMYtU0yZR6w2O9FUire91cKvY4ft5ALaJzTDGUVkPxRlhZR+E9VLklYN9y8RCV6/o999V0pT4LMQxSTQuaAtcYI41fiKxOg2qEWtFHQH8uhj8RBSkUYBkY/5pGcCwyfDjvLck0VyTB2VH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975127; c=relaxed/simple;
	bh=xVs4QemZgCqU8+2ERmMbebq38vqQbBEp640MidYy624=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tphGnU4zV2evpqd9Ss9cWP2idVKdum4UbE0fIe15CmZ1rBh16UCd+l2HbZ5H70j9aajFMXy4DXxOl6R8gOtoiOtZbTvV0RL7Ix+aZDBmTpv883Ix4UAbi8mCD1zA9b13iyz8h25eJaiH8kP8Ebj+d16zSlj5kxjSdP+G+6bNEKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtYUznKR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtYUznKR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E119C4CEEF;
	Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745975127;
	bh=xVs4QemZgCqU8+2ERmMbebq38vqQbBEp640MidYy624=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CtYUznKR250P3dvtYOd90HMm+n+4obD6nB47wOlv3DjPO2cDbTRehpr2bxhAnILB0
	 y66Fhu/d09d8Z3JEVGGJMDRLqrWTvnqs4xbuo8DrBAi87qyF2CDlL+L8uhHlDZj/5B
	 MUPryFnD6NPnsFIZyNMz3N/7fCURAv+jKvA43sOi1kzK2l/zUf9MPdnSRIs3zxSOte
	 YkvPQqg5VITzEb7IDrdzx4YYPOUAa+rv1VnJBWoRob1wgkGYTxDcxcJPlDkNUqYlUi
	 NyqBvdaJvGE5WetC48BIgV7TdYt2vCLb94rJBVSwNA1XZKL0pNYhqSpJTwsfzqqiP3
	 oHTB5IL3FpohQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A35BECE0F7D; Tue, 29 Apr 2025 18:05:25 -0700 (PDT)
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
	"Paul E. McKenney" <paulmck@kernel.org>,
	Bert Karwatzki <spasswolf@web.de>,
	"Aithal, Srikanth" <sraithal@amd.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 10/20] ratelimit: Allow zero ->burst to disable ratelimiting
Date: Tue, 29 Apr 2025 18:05:14 -0700
Message-Id: <20250430010524.3614408-10-paulmck@kernel.org>
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

If ->interval is zero, then rate-limiting will be disabled.
Alternatively, if interval is greater than zero and ->burst is zero,
then rate-limiting will be applied unconditionally.  The point of this
distinction is to handle current users that pass zero-initialized
ratelimit_state structures to ___ratelimit(), and in such cases the
->lock field will be uninitialized.  Acquiring ->lock in this case is
clearly not a strategy to win.

Therefore, make this classification be lockless.

Note that although negative ->interval and ->burst happen to be treated
as if they were zero, this is an accident of the current implementation.
The semantics of negative values for these fields is subject to change
without notice.  Especially given that Bert Karwatzki determined that
no current calls to ___ratelimit() ever have negative values for these
fields.

This commit replaces an earlier buggy versions.

Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
Reported-by: Bert Karwatzki <spasswolf@web.de>
Reported-by: "Aithal, Srikanth" <sraithal@amd.com>
Closes: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/all/257c3b91-e30f-48be-9788-d27a4445a416@sirena.org.uk/
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Tested-by: "Aithal, Srikanth" <sraithal@amd.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 lib/ratelimit.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 90c9fe57eb422..7a7ba4835639f 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -35,8 +35,12 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	unsigned long flags;
 	int ret;
 
-	if (!interval)
-		return 1;
+	if (interval <= 0 || burst <= 0) {
+		ret = interval == 0 || burst > 0;
+		if (!ret)
+			ratelimit_state_inc_miss(rs);
+		return ret;
+	}
 
 	/*
 	 * If we contend on this state's lock then just check if
-- 
2.40.1

