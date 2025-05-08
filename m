Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D91233129
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747217; cv=none; b=mxnlyACVWVLEmz8iL5XmRoUSthgCfslVdHteLO1K92t0vhs3f/leh7GFCKtW6j2LU8VyaB9H7NrSagjK0iQzguVdXa5B9c/7UVGg10OiYZhYK49J4wf7MNwa0r0x/+lhJTg1A024ACmsUAfZopTEvK6TUj3iZCAb4FmyI1jAyAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747217; c=relaxed/simple;
	bh=pXpLtvkklfQw6NZrHmnRsqa8G0gH1/KimuwtRPQx/mI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T2+eBVb6m2a8tpqX6KWIjZe5/sTeKBMsf7+WKlb08IODkvhTSNTjNoZO+NYJsuK8pqmTmwJET4mKhB2aWzKuPuxTEGJU3JE13+CQIDGrhOtFY8oAP63xjYGziL4egi3/+M+VKKbF8+45SWBKEGgQQteHzxPyw5dq1suU3FZdDVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsPvAK9i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsPvAK9i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5459DC4CEFD;
	Thu,  8 May 2025 23:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747217;
	bh=pXpLtvkklfQw6NZrHmnRsqa8G0gH1/KimuwtRPQx/mI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YsPvAK9iRkOD1S12R1g2HzUxdXewdcXng89ZMLPoHeMHjn8N3VUZWzcPklcR19Thq
	 PWNDWUbPZbGPjGc/AheDESYW3hCYOHfimzM7N5ooV93uRI0utIUmqoBFUzrgcFjtP8
	 JDif6BH+5hRVYgzURE9q3nrm6HAxyiDK/pf1bEcGMoMWNkQoKFbftd2jZSjIVMWotj
	 MP1h+hzOyLkgh3bzdabnBS2LJhnQhlL63RcMnkOJ9l5PV9jl6cWPhiA8ynmwTAT/xI
	 OqUiXBiUWkwL3wq2OyZ7tdEI6G6AZbOrQn5NwDyxHzLwGAgMBmb/vy1yDFzso2LRqj
	 fqAPVASrIcYZw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 845D0CE13C2; Thu,  8 May 2025 16:33:36 -0700 (PDT)
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
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: [PATCH v5 14/21] ratelimit: Warn if ->interval or ->burst are negative
Date: Thu,  8 May 2025 16:33:28 -0700
Message-Id: <20250508233335.1996059-14-paulmck@kernel.org>
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

From: Petr Mladek <pmladek@suse.com>

Currently, ___ratelimit() treats a negative ->interval or ->burst as
if it was zero, but this is an accident of the current implementation.
Therefore, splat in this case, which might have the benefit of detecting
use of uninitialized ratelimit_state structures on the one hand or easing
addition of new features on the other.

Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
Signed-off-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 lib/ratelimit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index ab8472edeb1d2..6a5cb05413013 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -40,6 +40,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	 * says always limit.
 	 */
 	if (interval <= 0 || burst <= 0) {
+		WARN_ONCE(interval < 0 || burst < 0, "Negative interval (%d) or burst (%d): Uninitialized ratelimit_state structure?\n", interval, burst);
 		ret = interval == 0 || burst > 0;
 		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) || (!interval && !burst) ||
 		    !raw_spin_trylock_irqsave(&rs->lock, flags)) {
-- 
2.40.1

