Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com [99.78.197.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A904F1BD9C1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744152100; cv=none; b=ap9n9RWzVTw5fOF4VuvGDLUDFFN97bl0OvvMJRf6oYBjUWhS/SkcJM7WdkZCwcbcVU01ZzmYJOIi87tqnYwF+mj0MyxIa/b7fMZx5CDXOBY/H3q8zE1DMqKzYS/6Ht1n/74fet8GqqjV1o7l7YeC/4opapW/RvPpPXDWPGBD+ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744152100; c=relaxed/simple;
	bh=lFugHM2fYSBv2yxNLU8QtJ9rbP/44joCYKE8Eg/7XqY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZMPSB76YJVyhkglVV5KBs3nh/zjcb/V35wkTnwz3BLe7PGL1jb7PNad8uRdJ9qUhGSJ90HEVZeek3oqyXYYiK3jzL4BLRL8BoMQdjMauCrrBUAPBF1ZPJI8jqKmC6+z8wnP8paM4DDqrGMTQdkBYY/5qHBBrYi6kktN4je/L3mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=rlsllmRs; arc=none smtp.client-ip=99.78.197.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="rlsllmRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1744152098; x=1775688098;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HeUzgINLSTNqzHLJeO36JJlCLs5/j5o0fs3XgBEV6S8=;
  b=rlsllmRsYCDa0NAh3mBRZXOs+gtjM7y7Vu6Q5e6HI596mUMWsFzv8AUX
   3yVPI58NlnU+BGJ2XwrBK77jlOlAzL3quC8KCnOKG6gR8IIqorps0NxBn
   QQbWKsXGXitfsYL+Rvaz5sGr1OsqHxzHqCwZm8Bw65ywgRMDtC/PFFLZB
   A=;
X-IronPort-AV: E=Sophos;i="6.15,199,1739836800"; 
   d="scan'208";a="185724054"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80008.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 22:41:37 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.21.151:24873]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.47.159:2525] with esmtp (Farcaster)
 id 2db7eea8-f5e1-4a6b-8bde-c7eba5f29475; Tue, 8 Apr 2025 22:41:36 +0000 (UTC)
X-Farcaster-Flow-ID: 2db7eea8-f5e1-4a6b-8bde-c7eba5f29475
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Tue, 8 Apr 2025 22:41:36 +0000
Received: from 6c7e67bfbae3.amazon.com (10.106.100.5) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Tue, 8 Apr 2025 22:41:33 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, "Christoph
 Hellwig" <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
CC: Peijie Shao <shaopeijie@cestc.cn>, Kuniyuki Iwashima <kuniyu@amazon.com>,
	Kuniyuki Iwashima <kuni1840@gmail.com>, <linux-nvme@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] nvme-tcp: Fix use-after-free of netns by kernel TCP socket.
Date: Tue, 8 Apr 2025 15:40:54 -0700
Message-ID: <20250408224105.2344-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D041UWB003.ant.amazon.com (10.13.139.176) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)

Commit 1be52169c348 ("nvme-tcp: fix selinux denied when calling
sock_sendmsg") converted sock_create() in nvme_tcp_alloc_queue()
to sock_create_kern().

sock_create_kern() creates a kernel socket, which does not hold
a reference to netns.  If the code does not manage the netns
lifetime properly, use-after-free could happen.

Also, TCP kernel socket with sk_net_refcnt 0 has a socket leak
problem: it remains FIN_WAIT_1 if it misses FIN after close()
because tcp_close() stops all timers.

To fix such problems, let's hold netns ref by sk_net_refcnt_upgrade().

We had the same issue in CIFS, SMC, etc, and applied the same
solution, see commit ef7134c7fc48 ("smb: client: Fix use-after-free
of network namespace.") and commit 9744d2bf1976 ("smc: Fix
use-after-free in tcp_write_timer_handler().").

Fixes: 1be52169c348 ("nvme-tcp: fix selinux denied when calling sock_sendmsg")
Signed-off-by: Kuniyuki Iwashima <kuniyu@amazon.com>
---
 drivers/nvme/host/tcp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 26c459f0198d..72d260201d8c 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1803,6 +1803,8 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 		ret = PTR_ERR(sock_file);
 		goto err_destroy_mutex;
 	}
+
+	sk_net_refcnt_upgrade(queue->sock->sk);
 	nvme_tcp_reclassify_socket(queue->sock);
 
 	/* Single syn retry */
-- 
2.49.0

