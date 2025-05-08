Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DB7230D14
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747217; cv=none; b=adB9wXJdDetBaBDub0RDbzt93tYmbGiHYkPM/C0/f1fpvQJ4n9r3WymV34mt3DD4XDejosfxdyHmPfLqPhiyICCF2T2DTzcBVTYRRozTMgvF2ZbgawMlVp6+3+39fz6kCwnEPX4JfZFsaJ0LzAWvXtaJmBz0yK5ndXWWNKId7GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747217; c=relaxed/simple;
	bh=jzDjoHtGux5M6uZMIriVC2B2N8Be8eXXJtqGq6UGj3E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ptsUqs60G4wffXYSNWg6RFdNvok50O14NtZhgvZhytv29pQO9ooKKDuArXjY0q6IrsW6N7wOQ1C9h/m9wu2ocwHZ/2N4WtIOm/dqIBEEkYXqg1BzHnEsbCz/w8gY7SHxQ/DHXo4c1pIos+PMPkKORqaQzITr4uyXVq5WEb1yur4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hub5LdvX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hub5LdvX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3074DC4CEF6;
	Thu,  8 May 2025 23:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747217;
	bh=jzDjoHtGux5M6uZMIriVC2B2N8Be8eXXJtqGq6UGj3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hub5LdvXIykLunoGjodidtxd+/ESsmnK0SAS+KqdmQWvNneA1NOyhB9ywN0lTIzMy
	 J4leEsZV8P26ou4Y5YC7tBCDhC4EFEWoQszuw5zngqhj5pxZuamKLxWjxDhXWDavIo
	 Ca/WlBxXyRS4XLEckj8B3DZ6a60Q7QyID70RZCI2eV9HbAF8Hs/+PpakoUVSF+L313
	 /PDboHq5W0FOQz7WfkX+aYO7UXjH7aF5nc6TnXIiuZL0EJqLrt8Prbjt5HpiNftq99
	 zQ+0/02L9wVxVwSy9+yTmA8y9/lLoEw0Pgp02byWJdnh7LVLOJmAgwXYqb4cusrmN5
	 XYj8kqxGlnRhQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 780D4CE12D2; Thu,  8 May 2025 16:33:36 -0700 (PDT)
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
Subject: [PATCH v5 10/21] ratelimit: Force re-initialization when rate-limiting re-enabled
Date: Thu,  8 May 2025 16:33:24 -0700
Message-Id: <20250508233335.1996059-10-paulmck@kernel.org>
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

Currently, if rate limiting is disabled, ___ratelimit() does an immediate
early return with no state changes.  This can result in false-positive
drops when re-enabling rate limiting.  Therefore, mark the ratelimit_state
structure "uninitialized" when rate limiting is disabled.

[ paulmck: Apply Petr Mladek feedback. ]

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
 lib/ratelimit.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 7a7ba4835639f..7d4f4e241213e 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -35,11 +35,24 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	unsigned long flags;
 	int ret;
 
+	/*
+	 * Zero interval says never limit, otherwise, non-positive burst
+	 * says always limit.
+	 */
 	if (interval <= 0 || burst <= 0) {
 		ret = interval == 0 || burst > 0;
+		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) || (!interval && !burst) ||
+		    !raw_spin_trylock_irqsave(&rs->lock, flags)) {
+			if (!ret)
+				ratelimit_state_inc_miss(rs);
+			return ret;
+		}
+
+		/* Force re-initialization once re-enabled. */
+		rs->flags &= ~RATELIMIT_INITIALIZED;
 		if (!ret)
 			ratelimit_state_inc_miss(rs);
-		return ret;
+		goto unlock_ret;
 	}
 
 	/*
-- 
2.40.1

