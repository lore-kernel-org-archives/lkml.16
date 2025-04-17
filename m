Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954521DDA0C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874045; cv=none; b=YRMmlRHWAs56nDHx8lfTMs35C4fmvNP5T26HcRVDh9gMuUjWQAN7vFpSQollojGhq9Cqy7qpRFThW5g6UWUFE9gf4RkX2yHddd+GW995eDyK9sZL5PHaAo8T1rbgApKsOlS0oVb4zbNVrU0U/NTGEL6nGJs6gXJBMp5FaTLvzkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874045; c=relaxed/simple;
	bh=TS0xql5uEaPXwSwGzMRg6PPPdKwCITqscK4za81Obh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ieonYP4Yt6oqzlhIUOwECYet2VQj4LbFfY/6Bb4ZHNeo03m19zymewGT5QpazxSWuzTlt5HoxnBtqQRDP7fP5+GmWbHTyNbeudt2VPjOCGSnAmrM37XwDDyKY9a16QsgLLJfAX4QIjepOeLybZPr0qiSG0HpkuqZT37aXOIPcbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=AmFAUUF4; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="AmFAUUF4"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2295d78b433so4934685ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744874043; x=1745478843; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T6zcHwN1BLl5JXSNfFYDIr9I+bhl12LMPDBNHYxeHY0=;
        b=AmFAUUF4D0qRZ+cwzi574skWNf3YVnDKLxFW3OmkNs9MlqLacvZROp8T21OnW/nNl4
         YMOrNpjez1OmRchjJ0k7ctjtUiptWysNkYLU8ibbkriUSgmM3piR31junS/ipiUMhhT4
         FWCZfd0vLCTBS3D2nL6R3xDxys+x9FiVqDjP+TNzmC0pbwyTtOXU4ycmxx44z51oIWxC
         eEDcXWw/r8k3fEnqTjVcTZ7ci8ZUkwTg4EFYsnEUtGEB/6gK3fBvR993gVLMi/ZErd5z
         wuQ8clrVAxxpxQg3fMRk4UmE/PZba5Mj5+WRbQ+mRkP5+SPhbABrgKHFqScTwvfffqK5
         irLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744874043; x=1745478843;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T6zcHwN1BLl5JXSNfFYDIr9I+bhl12LMPDBNHYxeHY0=;
        b=tePlEVX4KR4yZu57uOYmYD1GR89ukbL7XWDPiyHYkQffpShx+OHXCgMUxUX+drGJUf
         x656kjGYtU86pZVCJqeSkx+1rfzdRqdm3aSK1JFtSk9OI9j41pMsJgVrZBjnGpy6IKcH
         WK3RG8hOoCmQLNOBIq0UOiYcBEvaZYQgRfV6h1YYxSAPx+QmmJ4UA2ayGr3tVGgjv5iy
         QcRksBQjmDNPrQro/LRucg05tMeAX5s2EFMXKxn3vpw1azKYjcr16hA0C2QzXIRY43gB
         DfdK0cwW4L9MhjpsNGuKN2rrg9y2P2ctU4hgkhHX6Z+bch776sq6pz0kkuc9iKbhyVBO
         YZIA==
X-Forwarded-Encrypted: i=1; AJvYcCW2v5kkKOrfRnIdOrTpPlGDE1tXPvwn63ywsG9s7eiW3w/3SQOcHQixeGyAN9Nexy4A/oSjb1hfj9f15bk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx2kanFaEjoHGF9fqzDh4wwzFWGNPEkb7/m/E5v/DM3RbjfxI2
	eg59hvoE/BaStra5+7ozlpSNtpzVKOQoW4eahw89zB2RrWTB64KVOo8rlTdER18=
X-Gm-Gg: ASbGncuk9jURLBApmIYSxp/imJ3306Tq6zfKgdExz9sM8ZgASpB0yVZl5oSRF6HPArt
	d8W/LXNWKveuPPUbxvb6YrzeIR1bMt6p0y5lM0hMcAp0ZawpXRL7IigiKaJ+gy1yiLE7PjnuRoa
	ASp0CTUnYj4ZLxkKNctIfJOwzhvTsAKUdgwr51n53CkrrtztaEEp6XeSjUNj+EqgpwD1db90glu
	DfIFgOXCTjq7BY/X7idots8dlGP8z1acJuyXOO++y5whhSmgmcKoFRlLZcCerswzg2SLNUkKLTW
	XPSe2fX4BtAQild3slDBWX35rZYQird58Le+6VJHyuwzi5+d
X-Google-Smtp-Source: AGHT+IE9WE7/IxnT6LbEplrnxfOoEfdd5gnal3tr1FUfzfXxzP7fSwcssNMYVvc33Y7AiyFP7uj+kA==
X-Received: by 2002:a17:903:2391:b0:216:6901:d588 with SMTP id d9443c01a7336-22c358ddc27mr81129245ad.15.1744874042759;
        Thu, 17 Apr 2025 00:14:02 -0700 (PDT)
Received: from purestorage.com ([208.88.159.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33f2c9e9sm26342045ad.106.2025.04.17.00.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:14:02 -0700 (PDT)
Date: Thu, 17 Apr 2025 01:13:59 -0600
From: Michael Liang <mliang@purestorage.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: Michael Liang <mliang@purestorage.com>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] nvme-tcp: wait socket wmem to drain in queue stop
Message-ID: <20250417071359.iw3fangcfcuopjza@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417071036.a7nhovuokg7w2n5r@purestorage.com>

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
 drivers/nvme/host/tcp.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 26c459f0198d..62d73684e61e 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1944,6 +1944,21 @@ static void __nvme_tcp_stop_queue(struct nvme_tcp_queue *queue)
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
@@ -1961,6 +1976,7 @@ static void nvme_tcp_stop_queue(struct nvme_ctrl *nctrl, int qid)
 	/* Stopping the queue will disable TLS */
 	queue->tls_enabled = false;
 	mutex_unlock(&queue->queue_lock);
+	nvme_tcp_stop_queue_wait(queue);
 }
 
 static void nvme_tcp_setup_sock_ops(struct nvme_tcp_queue *queue)
-- 
2.34.1

