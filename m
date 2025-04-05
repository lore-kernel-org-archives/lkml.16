Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807632E62B0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 05:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743832145; cv=none; b=H3zbzITyM5GIjee5y1hDzInMfwvF9fBxmGrzybcus/xfQZH+8PSO+P1SmPd+IFol9AUlLBwbk84KYGPUH+4/6LOXEMG9mnWWqklNRJFAoJ5TlF1Q6ogHjkZbig+vU/OOTh8CNdKixo1o4Lq5w81h4wgumkssezZFvc3uwiqGnZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743832145; c=relaxed/simple;
	bh=z8RTvjawnGTEHyIZBz4FrhjLiT2GoRRi+ucde51ywu4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=jRRevl3WrMTt86qb4TrNqSwi1SNI+DMNXQMHzJL4ViHH3p+4cAJMfkYYlVW2SAMQwZdisB1vaIpWL2zCmJMeVjdSbnrnnGqsODILDXdK0Uu55LueCQ9S2aG90SpQSh7r8C37Utw5cvcKcdmYWEX236G+0tR6Lgmvi0fbzjiilNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=aCK0QmyE; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="aCK0QmyE"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso2317898a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 22:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1743832143; x=1744436943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z9okLDTgArbJRsWAIomNX+0oF72yzuEPIm4Cyepbc2s=;
        b=aCK0QmyExmw7/J95YNhlWA05I83YOWdSAdtr9EvfYhCOfAn2bUgRQmBEewrk5Bl6i4
         M5mv1MgD7aHOOJ5gUoOjPowj4TdKhAuu8KXFLfCymJojvubaPhMDAewjc7CrTwYCa0jj
         /4fftMuzh2VIDA9nqUTx6vno8JeTTCQqNEnP3zf1OYXfJXy0/3mVyUfWIXe/GFS8HDkc
         8Fu05hq6gGyKWpPVB/WsaCr3Eg1s519RirtQS2vlzV/NZmt1mOjTUWIWnx9e6ERl/TZO
         1RJeh/OrPIQEWktDwNQayW5Ga78weOWrEPDPFFt6qOcqMEhtqtkTIYkyQswpyCPpNrPo
         LKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743832143; x=1744436943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9okLDTgArbJRsWAIomNX+0oF72yzuEPIm4Cyepbc2s=;
        b=Mj92fEEqhdza5CXY34SQWAnBPraVB5FNYd4SgNNbzHfnwb0nz4xm1rn7FFg3qcq3y2
         REPRKqtmTg92EkEdlAF2RvGiLwjITsO/I94ttGgr3hMvhlVwPTAE+SMY+mltcPxRYsHM
         gwJWdQfonrtfQEjRpk++gDBAD0ozSoSeKAhSFhlOCBSBb4mDTErWJcuhpPjWHJBLholA
         k4qwetl8BW0a/0EXREnle8EIPTZ/5zKgWjVzGiEQxV8UoW5Dohjk/RQFny/HJ/6PFEkt
         eL1CKryUUJbuyQ1m1HsP6+wlroWW6P7ERiCWLmuwND05cEKIQ3KN7W7UHxfFd5dnhfPr
         OQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7MxTHoybq27hEiscTkw46esewLyjlgeKOhma3fJVQlh6lSd4L+mdgXWrzBsY7zxGKvMcGrwm56j+H2Do=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLzlAa1Soe75FDNqpTcK/0qFZX603Xvcdkq52ish4bkG2PWfUu
	WRjd123odUiJXCoZ50MO9tEI21aFaV/xUCHaxRvuX40yMkimzjzQHIUHzZ0GXcs=
X-Gm-Gg: ASbGncugIDLkQ3VnjXsCpXyfPEI0rK+6EI9AmIxw4Iskh/vSoSEu5TLYiRaBF3t8afQ
	9yhEObFoYLfN8GfBxG0Dq2hlKHGVmINzNi29z6vprfJ4iMewK33gVbDgUBkhEdHIrWdWslHHfae
	O6qT6YS+ornPgBM2uR4JBhn0HqL77/c930EMXHSKSd8jALDCjEbmvEsiWasmtBGMaBS/wJ7llE6
	7HtLptIILJ4w9nNFVZ44WATUROLidP7qDvFhsLf25T9evtkNdisFZIoiG66HHT16GKS0/4lpsZ1
	Hm9v/CqLaMhaqZQgL7abLNzjB8e3sNbqRMoC36QvU7OEIn2mWrdR5oontwT+4lBbkcLwbjs8iyF
	D/JFFowA=
X-Google-Smtp-Source: AGHT+IHFlL8yAtLJIGh/nZnzxRPL2dsvOXC7sATN3B9Az7sYa4+SKAV2ggejLCCXPe1erV8dkaxOew==
X-Received: by 2002:a17:90b:2804:b0:2ee:cded:9ac7 with SMTP id 98e67ed59e1d1-306a61659c2mr6677747a91.20.1743832142622;
        Fri, 04 Apr 2025 22:49:02 -0700 (PDT)
Received: from dev-mliang.dev.purestorage.com ([208.88.159.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3058494ab14sm4591129a91.17.2025.04.04.22.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 22:49:02 -0700 (PDT)
From: Michael Liang <mliang@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Michael Liang <mliang@purestorage.com>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nvme-tcp: wait socket wmem to drain in queue stop
Date: Fri,  4 Apr 2025 23:48:48 -0600
Message-Id: <20250405054848.3773471-1-mliang@purestorage.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
fully completed from host's perspective before returning from queue stop.
This aligns with the behavior of queue stopping in other NVMe fabric transports.

Reviewed-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Randy Jennings <randyj@purestorage.com>
Signed-off-by: Michael Liang <mliang@purestorage.com>
---
 drivers/nvme/host/tcp.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 26c459f0198d..837684918aa1 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1944,10 +1944,26 @@ static void __nvme_tcp_stop_queue(struct nvme_tcp_queue *queue)
 	cancel_work_sync(&queue->io_work);
 }
 
+static void nvme_tcp_stop_queue_wait(struct nvme_tcp_queue *queue)
+{
+	int timeout = 100;
+
+	while (timeout > 0) {
+		if (!sk_wmem_alloc_get(queue->sock->sk))
+			return;
+		msleep(2);
+		timeout -= 2;
+	}
+	dev_warn(queue->ctrl->ctrl.device,
+		 "qid %d: wait draining sock wmem allocation timeout\n",
+		 nvme_tcp_queue_id(queue));
+}
+
 static void nvme_tcp_stop_queue(struct nvme_ctrl *nctrl, int qid)
 {
 	struct nvme_tcp_ctrl *ctrl = to_tcp_ctrl(nctrl);
 	struct nvme_tcp_queue *queue = &ctrl->queues[qid];
+	bool was_alive = false;
 
 	if (!test_bit(NVME_TCP_Q_ALLOCATED, &queue->flags))
 		return;
@@ -1956,11 +1972,14 @@ static void nvme_tcp_stop_queue(struct nvme_ctrl *nctrl, int qid)
 		atomic_dec(&nvme_tcp_cpu_queues[queue->io_cpu]);
 
 	mutex_lock(&queue->queue_lock);
-	if (test_and_clear_bit(NVME_TCP_Q_LIVE, &queue->flags))
+	was_alive = test_and_clear_bit(NVME_TCP_Q_LIVE, &queue->flags);
+	if (was_alive)
 		__nvme_tcp_stop_queue(queue);
 	/* Stopping the queue will disable TLS */
 	queue->tls_enabled = false;
 	mutex_unlock(&queue->queue_lock);
+	if (was_alive)
+		nvme_tcp_stop_queue_wait(queue);
 }
 
 static void nvme_tcp_setup_sock_ops(struct nvme_tcp_queue *queue)
-- 
2.34.1

