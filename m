Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE1E17996
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=CYtxQT0Jvce2J+3yMP06oXDC/dU78Bq5kAVTUyEwGqIi71ym2z9KW9dQDU0igKCoDtaygo0PctU1+SP9r7G3t8/MQNrNY4kydCfXux/CsdX5ImAV65gJkxAee0G+d7grLgihrGsHBAZvw6/0uP/7PugvEaUfO5aBISjQicj17CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=8cTvVKTeuWpMcuW3WL4deHfNOV5vogrrQdWXKu7sF0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XX6Axm/632UjYEU1/n+ifaId13IwxnIKvJdgbsUSQrQkKOEhFzGU8vWFn0ITvGFhIedW2qxQ5LPrO7DhiAmqu/yEvBvWw3P9xu1vwnrLe+40PDcyCUpOAxLtmbTHjydiOMf8NXa+bKK8m4ydZsUwMMneyqrkt7i3Q8RVbz14Xbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6WckSQT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6WckSQT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB547C4CEF7;
	Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540907;
	bh=8cTvVKTeuWpMcuW3WL4deHfNOV5vogrrQdWXKu7sF0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n6WckSQTxxMvMA3BQm8m37ZDY9olSKrO6uP8MMy8bVO4NlMgO9Ht6Be2LzkuEIqnN
	 BVZ4g3lirqiSCdszPPF7+ItkYEiO18kJgrWqyzhvhI85kK0POUum53NeqYTdswU8Mb
	 IrvnS9e7S030lk1XF7RbIkazM540FdSTH/tgutMfwj8hgNOEejEXNz4pfs6oF10bkh
	 QDaOIN/yxF0tvmcBwrqeNHU1c/hwGhcv002Avfd8vSU+wXIeQg75l5bNTTpuZvK4Ud
	 +SqB0QQ8/wLqCXvar1CfADvFqkPZt2xwYYnOgU3SDBg9dIbNVc0C9GjB5QnCWW7h/d
	 PBhoVQiNRI8Qw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 3C949CE1C3D; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
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
Subject: [PATCH v3 10/20] ratelimit: Allow zero ->burst to disable ratelimiting
Date: Thu, 24 Apr 2025 17:28:16 -0700
Message-Id: <20250425002826.3431914-10-paulmck@kernel.org>
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

If ->interval is zero, then rate-limiting will be disabled.
Alternatively, if interval is greater than zero and ->burst is zero,
then rate-limiting will be applied unconditionally.

Therefore, make this classification be lockless.

Note that although negative ->interval and ->burst happen to be treated
as if they were zero, this is an accident of the current implementation.
The semantics of negative values for these fields is subject to change
without notice.  Especially given that Bert Karwatzki determined that
current calls to ___ratelimit() currently never have negative values
for these fields.

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
Cc: Petr Mladek <pmladek@suse.com>
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

