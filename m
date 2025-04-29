Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2202AC2D1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944926; cv=none; b=lWegcq9o/LEClXCRxixBgTIrc/xiL82SlrBc1mIiXuN1aar3EFSr5thT2rFHj5gHEcgNCfpvfv06D/0OlpdKgLeUznaoOek5wDFEe/UhlKCLx4hB4UHgW3wzVuCcc04xa9aM2Dbawmu1zdX8X0RyXr47VY79xTAvkaDvd9p3jYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944926; c=relaxed/simple;
	bh=4FapI5GWwfTMxpOHlavkqJc0M5bK6kbP1R9Cojk1uVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=GHw47+fc8s56V/or76dR8vTr6FKI1fpBfQVBxP7Mbx3Aru9NwTmctq5UHqTmCsJJufghu/md1I4kmnvyJuUegv6dJsrdVxMYw5htvs70fchXYZpLMPp3Pgl7vaKwkKuFPZeeYYc54D3Qvxbg4Mlg33Z7gdSo/0N1r/i/V5avSaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=FL01CmGB; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="FL01CmGB"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22438c356c8so68979685ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745944924; x=1746549724; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pefWEaJR58I1DW6Re5R2IZ2WUpQtpoC66+IL5oaI87A=;
        b=FL01CmGBd3X1gLwL5gTneqW6mGisB3VvKBylmWK6vUq8D+Fbb74O+m24fPNG16/MkL
         3Pi0MryqP2K39wCn80ITvBVwpBj2e5Aq19g8Pxl36SK+cG7URcS7v/eogAH0MYOaJ83G
         de+dFV8ECos/Tpq/iMHKZf5seM35MgXKVD+4g69WABbR/7ct9sh37T/AVd1fFJHTHK7e
         yGrMCm+sAYoXT5JsOiyd6vOO2+ox21Ed1r2YUy1hHchG6GwyVRDM5tR/ELu7ZBcundq/
         3URnMUcaTiFKh7FoB8VYUtE26Xi4rkOJpNTA5U0jnkUKU0DRiZAI855KdDKFITiXN7pI
         cKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745944924; x=1746549724;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pefWEaJR58I1DW6Re5R2IZ2WUpQtpoC66+IL5oaI87A=;
        b=tj1T02AIUuqgQr9JWied1sn/Tvo07xjisKZ9hovKDCWkmSno2JTkG2MTa8LEvABwpc
         oCnWqDduxzVTcg/5kEoEoAa9nzC9QIoNWbIQzTCAm5oij8lsnScmI3kWDsr50zJtm59C
         cF3LQwIhJCVT7JvfbC8Yi25lq9labLN0flA1nRYpktxY0Ued5mVoBgpVWFqWpo+unMOa
         DI79b8Bau//mOT0CFlUQMVY6mmot797gS3OXfTqPuROoYU1VeVp1T5m/dGk2lzGO6fkP
         +5it02QcVUlWPUiwJOLIveV95Nw3wXmLd7CCZOV9A/AGox6u3EsyAkQBIRDuzoIXm9W6
         hX3A==
X-Forwarded-Encrypted: i=1; AJvYcCUnvQc/so5AdCxzjcjtz5Kutj20e1RhjOvxYUPHXkdkisT3M++kUOCVFY2opXd9lmzs11p/zwgydiX+z2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJJP/2qt+CO+ps31NeQi3aCJ3xgoYws3wyNa2t1n10w+TI5b4S
	JZYskODrhunbOHZGbUPYwl6UgHXFWCDGoBRFXFUvN/9Z5GGPIZMWQ1pxc6JTfCk=
X-Gm-Gg: ASbGncvh0nL4DPK+VpSmqqeWKtBCf4n+7esnAZSftH+Wp+p8D2cuACcCZsuy2WlNlNH
	cxi59paGRXJMxt788jOzh/sE8clYlSLuRhN7svdbZ3MKiWBtrqEVc2fNLST48GCCPh6jOzt/nkW
	tCwVv31SKR+sSOCElAJn8sbwElsVW20sH/s4e3hjf7WE9hW+/WR5urKSnVuPAgIfc0+RpLh2sbl
	IJZTYp7WWuTDN+GEiWmG01ioJrkRmn5UlGPzLpqjjolmNy06tXHQuQ++C4VP+EHRz/GR2PP2WlE
	WPAeY+LkfSnTmAYV44ohl916E9vECn3X5G4iljk58lcnuBHwB/l26Z380CA=
X-Google-Smtp-Source: AGHT+IH5o/i8TupfS+vCAy3e6IA5VnC+eiF2cN/N7PwRE+z9CtiQxWbE4TRVt6/wO5YLJSkO1vmKSQ==
X-Received: by 2002:a17:902:ce10:b0:22d:e57a:27b9 with SMTP id d9443c01a7336-22df34ebcd8mr1106525ad.22.1745944924349;
        Tue, 29 Apr 2025 09:42:04 -0700 (PDT)
Received: from purestorage.com ([208.88.159.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216930sm105123485ad.236.2025.04.29.09.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 09:42:03 -0700 (PDT)
Date: Tue, 29 Apr 2025 10:42:01 -0600
From: Michael Liang <mliang@purestorage.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: Michael Liang <mliang@purestorage.com>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/1] nvme-tcp: fix possible data corruption caused by
 premature queue removal and I/O failover
Message-ID: <20250429164201.cmrhsz5p45q4ceca@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250429163944.tvyrxt7z6c55abk2@purestorage.com>

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

Fixes: 3f2304f8c6d6 ("nvme-tcp: add NVMe over TCP host driver")

Reviewed-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Randy Jennings <randyj@purestorage.com>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Signed-off-by: Michael Liang <mliang@purestorage.com>
---
 drivers/nvme/host/tcp.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 72d260201d8c..aba365f97cf6 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1946,7 +1946,7 @@ static void __nvme_tcp_stop_queue(struct nvme_tcp_queue *queue)
 	cancel_work_sync(&queue->io_work);
 }
 
-static void nvme_tcp_stop_queue(struct nvme_ctrl *nctrl, int qid)
+static void nvme_tcp_stop_queue_nowait(struct nvme_ctrl *nctrl, int qid)
 {
 	struct nvme_tcp_ctrl *ctrl = to_tcp_ctrl(nctrl);
 	struct nvme_tcp_queue *queue = &ctrl->queues[qid];
@@ -1965,6 +1965,31 @@ static void nvme_tcp_stop_queue(struct nvme_ctrl *nctrl, int qid)
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
@@ -2032,7 +2057,9 @@ static void nvme_tcp_stop_io_queues(struct nvme_ctrl *ctrl)
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

