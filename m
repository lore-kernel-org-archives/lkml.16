Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B454819E7F9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745511476; cv=none; b=d6acWm/jzMkWRFWThYPg0bBsUBP/pX0sJx4cttbrEyV5sCkzliezspejXMMzxubWanUkFLgbCpbXUDhxtHBG1QxQ2KBbFKu6vKRwryjrN9HAtwEEJRsZb1AqOuaK4KULbBo9uCBaX6goXiZRc5F9vclrClF1ljJ/zAXzcKgoUbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745511476; c=relaxed/simple;
	bh=xMTWVg2SpKNf1lWvZOxw4RbC0NuDpRr8jQy2iknFZkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=PJS6X95u6F6kokDMEoNP44WjJu6VAnxNyrvdVLCCxwQTNgu8aPl84PZqww9r4fz56eojCJmzu0n6i/moGOlfVXPjPLBDvr6u8VIJL1ZV7UH25aFumPg/n8Y+OF929Zw6KSaWr8NPXbNue4qQWsk+gOEimp1dYqo845HEzTKzddc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=S7Y2chgk; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="S7Y2chgk"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d57143ee39so11190695ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745511474; x=1746116274; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R/7AYuRR+q7ueuQXa9Sr3f8IB4dxGhH9BIYTobpJ9no=;
        b=S7Y2chgk6uT3brQUv97fM9rSuVvlLkXBX5t42VjihkHQiX7w3M23znqUY4iBOyLSFP
         70IU8kX8+Q3np0ONQ1ZfYohL0IhtuEwXcooUrGBR5AQtOwxjex/786zCCJhuPZVkBnUe
         FMLMZ+MyYwxEP7gV46GMWMn8MULNIKvv0iRpHlzt0aOZ+oS/nsuSNVOtfzgqlycPqg18
         v9octIqBtKzp4ybMbUQ8GPRrNRWNi4FKB990+KxFvZ5iCwEXh7svXNkrFK63UtlQ5ZG+
         PbWZb27YwXZQi1rhJ+UAXqWKvVJ/qtEOm6j8BWX7eiPVxCQV2Qm3MsRj+zEj+Atwd9VU
         lHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745511474; x=1746116274;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R/7AYuRR+q7ueuQXa9Sr3f8IB4dxGhH9BIYTobpJ9no=;
        b=N9oVxDeTPHyVa20WUZEBo1Tnd3sHyw5LtWjf/OShWx5a9THLZojiTqGCTsOY4rRqpC
         sCyEv0FLKWnyN5s2iA2nEicM78Ki6lWMq7AO2mqraWkGS/0w4jyl0OC31S6hCWKCqYMB
         BjXvnE1M1nFnOEhZ9IoylXKiE9NV98wTebbsgozEIiaed73Wf5578cRqRdkjRQ1o0E3h
         x7qa9HZScxGMYjtQobugCFKufaXAgTvB6ZeuZkBwgdKY7cpC1Ni3UjJQ7Cf+PuwLJtpX
         jmWZq/z27Z8zVQ7iAqvQv9m+hjWTFgdoRB1klGQSImJh1PaozB0fGSxtajEMxqcNbmfz
         +SDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjd3c5/UYzRFlc7ikve3Q8T7J/ntIYglacEBGOGq/DJ+y8DNC3pGC16CzMjRprUatBKNJ8YpgyveQjq+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbiMGZJXMtVN/t0+1ciYAtcCkTFReMIIsS/cv8TTI4MO9MV7qw
	j+wwRyqGkcfmPiBFBBgWsZ/IUfikKrR4fSc1ESZw8Vy2kRhvXwuqdMWbIfSAMD0=
X-Gm-Gg: ASbGncs/j99PcdZdrbV+vpOPptho9B9+OjTfxyFjgWxypV55/RlJJBBoA1M0Kgrrle9
	6yENhhuPtFqg/UWySHSEqBOKimIKwMDqxCLkJyjZCWduQd4U7InFUX+t4rvbdoNl/xM0tTnsRTT
	s7se3iEOGP2jQBsgODqkYFFjdiKBrKInVMyChxnqZxshbmqembPRBL03efMLX7w0+L3E2PWIjyo
	SZnA8pJ8ryMqo2dFoO1j3ChwNvHahfFJxt9m5ERb9bjfayRSy7r0JMzfTNwIX1P/2YRdEKWsLZ9
	SdA50+jJ286zPQ0iSd0xGfFjszB5bv2yZIpF3x9zOSGTN3ZDxsWv9mgXbFU=
X-Google-Smtp-Source: AGHT+IH5lFXS8TrXDVnponeZrwD3UcLQ62ckiic4gVobD0/PCNSTdxDkJvhE1do9gg+6+ORYPJX8Jw==
X-Received: by 2002:a05:6e02:1c02:b0:3d9:24a7:db17 with SMTP id e9e14a558f8ab-3d938e56cdfmr1558875ab.7.1745511473719;
        Thu, 24 Apr 2025 09:17:53 -0700 (PDT)
Received: from purestorage.com ([208.88.159.128])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f824bc4fa5sm327427173.136.2025.04.24.09.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:17:53 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:17:50 -0600
From: Michael Liang <mliang@purestorage.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: Michael Liang <mliang@purestorage.com>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/1] nvme-tcp: wait socket wmem to drain in queue stop
Message-ID: <20250424161750.jwbdohybrqftuioe@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424161438.g2fyo4ozvburf2rh@purestorage.com>

This patch addresses a data corruption issue observed in nvme-tcp during
testing.

Issue description:
In an NVMe native multipath setup, when an I/O timeout occurs, all inflight
I/Os are canceled almost immediately after the kernel socket is shut down.
These canceled I/Os are reported as host path errors, triggering a failover
that succeeds on a different path.

However, at this point, the original I/O may still be outstanding in the
host's network transmission path (e.g., the NIC’s TX queue). From the
user-space app's perspective, the buffer associated with the I/O is considered
completed since they're acked on the different path and may be reused for new
I/O requests.

Because nvme-tcp enables zero-copy by default in the transmission path,
this can lead to corrupted data being sent to the original target, ultimately
causing data corruption.

We can reproduce this data corruption by injecting delay on one path and
triggering i/o timeout.

To prevent this issue, this change ensures that all inflight transmissions are
fully completed from host's perspective before returning from queue
stop. To handle concurrent I/O timeout from multiple namespaces under
the same controller, always wait in queue stop regardless of queue's state.

This aligns with the behavior of queue stopping in other NVMe fabric transports.

Reviewed-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Randy Jennings <randyj@purestorage.com>
Signed-off-by: Michael Liang <mliang@purestorage.com>
---
 drivers/nvme/host/tcp.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 26c459f0198d..8571bb7c029d 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1944,7 +1944,7 @@ static void __nvme_tcp_stop_queue(struct nvme_tcp_queue *queue)
 	cancel_work_sync(&queue->io_work);
 }
 
-static void nvme_tcp_stop_queue(struct nvme_ctrl *nctrl, int qid)
+static void nvme_tcp_stop_queue_nowait(struct nvme_ctrl *nctrl, int qid)
 {
 	struct nvme_tcp_ctrl *ctrl = to_tcp_ctrl(nctrl);
 	struct nvme_tcp_queue *queue = &ctrl->queues[qid];
@@ -1963,6 +1963,31 @@ static void nvme_tcp_stop_queue(struct nvme_ctrl *nctrl, int qid)
 	mutex_unlock(&queue->queue_lock);
 }
 
+static void nvme_tcp_wait_queue(struct nvme_ctrl *nctrl, int qid)
+{
+	struct nvme_tcp_ctrl *ctrl = to_tcp_ctrl(nctrl);
+	struct nvme_tcp_queue *queue = &ctrl->queues[qid];
+	int timeout = 100;
+
+	while (timeout > 0) {
+		if (!test_bit(NVME_TCP_Q_ALLOCATED, &queue->flags) ||
+		    !sk_wmem_alloc_get(queue->sock->sk))
+			return;
+		msleep(2);
+		timeout -= 2;
+	}
+	dev_warn(nctrl->device,
+		 "qid %d: timeout draining sock wmem allocation expired\n",
+		 qid);
+}
+
+static void nvme_tcp_stop_queue(struct nvme_ctrl *nctrl, int qid)
+{
+	nvme_tcp_stop_queue_nowait(nctrl, qid);
+	nvme_tcp_wait_queue(nctrl, qid);
+}
+
+
 static void nvme_tcp_setup_sock_ops(struct nvme_tcp_queue *queue)
 {
 	write_lock_bh(&queue->sock->sk->sk_callback_lock);
@@ -2030,7 +2055,9 @@ static void nvme_tcp_stop_io_queues(struct nvme_ctrl *ctrl)
 	int i;
 
 	for (i = 1; i < ctrl->queue_count; i++)
-		nvme_tcp_stop_queue(ctrl, i);
+		nvme_tcp_stop_queue_nowait(ctrl, i);
+	for (i = 1; i < ctrl->queue_count; i++)
+		nvme_tcp_wait_queue(ctrl, i);
 }
 
 static int nvme_tcp_start_io_queues(struct nvme_ctrl *ctrl,
-- 
2.34.1

