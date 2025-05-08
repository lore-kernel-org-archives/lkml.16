Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D45230BD9
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747217; cv=none; b=cTd5en1cCNjlMX0+GBsI59E0XwBa08HPyowVza5KHc63AgYTVFrBn7s6ASJDkVTMfEDU9FI+W1O/kSGNuxER8Fhj2z2i7+dIT8ETmaTJEl8iRInk/w+dJOs+VhAHVNU7s9RCsyBT/O6EFLrPHynpS7FI3Txt8+Gv8L8Sy9tbs9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747217; c=relaxed/simple;
	bh=xVs4QemZgCqU8+2ERmMbebq38vqQbBEp640MidYy624=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qKTkXjVIXdBNnu279smdwqQO/ynw0BRIpY8SxeRhlqX2Qk0s9VufUXcaFQURE4sE06jZtnHY5jD/fazh/o9G7KPX6Bld9EUqwxgfl9yMh29TjsuocjGX/5BUPPJWynAep1giVDCX4Ze+1kAilJAwLY3lEJaxujT5O+/UZUDuUvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9zpcKZD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9zpcKZD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276EFC4CEF1;
	Thu,  8 May 2025 23:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747217;
	bh=xVs4QemZgCqU8+2ERmMbebq38vqQbBEp640MidYy624=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V9zpcKZD0TJEm5y2u9JHNyO3f1q92s7Bv2EMx91UW655NUBBllttnLL2/PY757ihO
	 UUno1wXb1ljnZyCrEDqC4h7OW/mjTkUYbWJTLROQdHyzxyCmjSGChLr3p4YtSuFahK
	 lZw9M9Yxhz+Yr87YdSSY7el+eNgQoyum/oVTSwt15tAy44sjB7SHQuQnOVUJzGo3B7
	 uxh/VBpvlyK6rr7ek5e5nVaVpCW2U1V2nfhT0lvcbKxICubexyaCCFFnFlN5CKj1BK
	 QQ/H5n8DXCyXdELSY2gPRvOX6xKwaXThXe/IdMhJmws+r4E3OjL9vzBemw7z/XM8Rp
	 0QPVgbEWrr5PA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 750B4CE12BF; Thu,  8 May 2025 16:33:36 -0700 (PDT)
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
Subject: [PATCH v5 09/21] ratelimit: Allow zero ->burst to disable ratelimiting
Date: Thu,  8 May 2025 16:33:23 -0700
Message-Id: <20250508233335.1996059-9-paulmck@kernel.org>
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

