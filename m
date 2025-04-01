Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com [52.119.213.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A7A1F0E56
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743511089; cv=none; b=e7ECiD4AySpHbbxxxxLgnvq9D7Pw91QiDzB/9GeFkpAEmq9UVwx+SK/IjIppl8LHnNu230o20gWLHnrI+uXGxVY6+SyCEozI8png2GcfizMyb4BgtwXnnao62VbyLrH8V9XQMfRRYV7Cs7ZvTfXKPwXxdO7s4yxwytZ/pz9S3FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743511089; c=relaxed/simple;
	bh=45sC2gcuHThVf7Lu+ibrQa9rcY+HgmdLqpO4yCcHX4w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CrTjIbFb4IaL8DBzw/0Hrg6QtpbJtbnE9mTYUeXdiOOls9xVWjBVwtoq4Hci6x3u7lydQWZIvpK119u/E0+Ny6Z9sogAWA6IorxF5gOoLLfoTHdLQ1PN4fS4fu/02pJXlRa/57nQwWJXaFcLWXeAQyprfG57tXlAUeolmi8iWCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=m5NzIIG/; arc=none smtp.client-ip=52.119.213.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="m5NzIIG/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1743511088; x=1775047088;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=992z0ct1nxTDIKPASmURv6lsKbYXxMWUzH4MZUc64H8=;
  b=m5NzIIG/eTn8o+WuO3JP1Xs/YDsPmT9HYxE2GHKxZN9kDgFVBt8xZ+/o
   6bm5vGSiTY2mhfhGRPxGKJE8YHZ37d5J8VuETJKYzRchJoK1HP5yZG/sp
   8IEt/mrOW+Uwe/SSuw3l4B2buiGeDg2WyqVIakWth6NU31RLlYLM4k9WQ
   A=;
X-IronPort-AV: E=Sophos;i="6.14,293,1736812800"; 
   d="scan'208";a="731802818"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52005.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 12:38:04 +0000
Received: from EX19MTAEUC001.ant.amazon.com [10.0.17.79:27630]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.0.201:2525] with esmtp (Farcaster)
 id 458f0c32-c36c-4765-b972-66f827eb722d; Tue, 1 Apr 2025 12:38:02 +0000 (UTC)
X-Farcaster-Flow-ID: 458f0c32-c36c-4765-b972-66f827eb722d
Received: from EX19D003EUB001.ant.amazon.com (10.252.51.97) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Tue, 1 Apr 2025 12:38:02 +0000
Received: from u5934974a1cdd59.ant.amazon.com (10.1.212.23) by
 EX19D003EUB001.ant.amazon.com (10.252.51.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Tue, 1 Apr 2025 12:37:58 +0000
From: Fernand Sieber <sieberf@amazon.com>
To: <sieberf@amazon.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
	<peterz@infradead.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<linux-kernel@vger.kernel.org>, <nh-open-source@amazon.com>
Subject: [PATCH] sched/fair: Only increment deadline once on yield
Date: Tue, 1 Apr 2025 14:36:20 +0200
Message-ID: <20250401123622.584018-1-sieberf@amazon.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D003EUB001.ant.amazon.com (10.252.51.97)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If a task yields, the scheduler may decide to pick it again. The task in
turn may decide to yield immediately or shortly after, leading to a tight
loop of yields.

If there's another runnable task as this point, the deadline will be
increased by the slice at each loop. This can cause the deadline to runaway
pretty quickly, and subsequent elevated run delays later on as the task
doesn't get picked again. The reason the scheduler can pick the same task
again and again despite its deadline increasing is because it may be the
only eligible task at that point.

Fix this by updating the deadline only to one slice ahead.

Note, we might want to consider iterating on the implementation of yield as
follow up:
* the yielding task could be forfeiting its remaining slice by
  incrementing its vruntime correspondingly
* in case of yield_to the yielding task could be donating its remaining
  slice to the target task

Signed-off-by: Fernand Sieber <sieberf@amazon.com>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e43993a4e580..c1eff68d8ffc 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9024,7 +9024,7 @@ static void yield_task_fair(struct rq *rq)
 	 */
 	rq_clock_skip_update(rq);

-	se->deadline += calc_delta_fair(se->slice, se);
+	se->deadline = se->vruntime + calc_delta_fair(se->slice, se);
 }

 static bool yield_to_task_fair(struct rq *rq, struct task_struct *p)
--
2.47.1




Amazon Development Centre (South Africa) (Proprietary) Limited
29 Gogosoa Street, Observatory, Cape Town, Western Cape, 7925, South Africa
Registration Number: 2004 / 034463 / 07

