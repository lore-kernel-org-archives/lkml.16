Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9B413C9B3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996443; cv=none; b=ngonoPFPM9AY15py5lqPiZ5ksT+GRT2PIiL0FsEO3HQpIQvf7X6OkV4616Nlr+eqgP5nz6rKmJevJ2Fq7Mq9Q/a6kBAeESQ3HmG2axSMQvSyjVA/8c4LCjKLmDPbdjRLuocLw/zQznDIzqnSxWu5bcgY2TKQPlE+Zdqi2xRIMBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996443; c=relaxed/simple;
	bh=jd1ecwHmwX3hXRj3osnvOTAoWV78DHR0Q0S6/Pu/47c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OC2PHHVkstr+O66FSP/xCX2NRSHD/hH9SInZzt5Gp1/fGbO/G5pD3+dF6aG2hArHFbck17TCjDCK/SDGRG7BdTfLxZpxpIrFYRcpaVE08YYZHw4mckGZredRsHwpEnxByJixvE0F/C1JI//cw1Bacrx1gNttvDZrBdGQ6isaf5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7wbL9gs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7wbL9gs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B728AC4CEEF;
	Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744996442;
	bh=jd1ecwHmwX3hXRj3osnvOTAoWV78DHR0Q0S6/Pu/47c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D7wbL9gslBrISR3VcgHEe9xQkYw3Ws/9JZ42ZQO3O+XQQHB/LQYXGkjLTCOAJa350
	 JMQLMPDCvH0sW2qG/IYnGVuWvPRf7DiXxklZ4oAGChr5LqlOB/q57bFge4AP+n/kBc
	 6SiJ78rDcPKgv5fJ4Hzzs4mUZ6NrYPT/Q2y/NHW6QST6DYXBqGtnfnvOxWNG64mc9a
	 QKFWNLQ7BVFST/vRTbZ14uApbi6Hn7ZxYRKlDKOUlplaXZ6/GE/rrq4PU5wriLU3uZ
	 PG2u2LSm+35e6gp6JQgrX8pa7SiknxqJgSZiYK5JRnTmwoyeFzBUs7wdUXB+6RgohF
	 lYY+WJspIdOJA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id F158CCE176A; Fri, 18 Apr 2025 10:14:01 -0700 (PDT)
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
Subject: [PATCH v2 ratelimit 10/14] ratelimit: Allow zero ->burst to disable ratelimiting
Date: Fri, 18 Apr 2025 10:13:55 -0700
Message-Id: <20250418171359.1187719-10-paulmck@kernel.org>
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

If ->burst is zero, rate-limiting will be applied unconditionally.
Therefore, make it low overhead.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 lib/ratelimit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 90c9fe57eb422..04f16b8e24575 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -35,7 +35,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	unsigned long flags;
 	int ret;
 
-	if (!interval)
+	if (!interval || !burst)
 		return 1;
 
 	/*
-- 
2.40.1

