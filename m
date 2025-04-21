Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467521E2613
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 16:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745254556; cv=none; b=khggJr+1FqiJOvsR0SB8keG7W4mM7pASUwgDw4BYusF9IIeGHxz6FlYOsxx3gR3yVEAtdR+rdAoK2cs9j9gKBKp4IMUQjlCl3YJEkgfv4O2CcSc9WYjraU2jS13vzgfopYC7iRDhibMEuCwkJyxS0yVn57zXaUb1W7g5kpKR5gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745254556; c=relaxed/simple;
	bh=Q2BBs4sgBC+rV3+H3rPoTA6kzcY/ni/Xy190be33v9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sMLi3ydGpe2s/pxGe+eUm2YtdMWN3QlC3axgN3Bt+PkUnDk8ubdvBUZP6NO3yrjNr6/eOzF3euZ/gTLNQUnok2Id/toHN+hkNRfcOrrz/fPKuTZJHqMzGMGq5UeXTrJ8iJ/q5qDzh93BZrzvMTjSyskWEBo1YZOlzSnutiP++Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=drK+nGSc; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="drK+nGSc"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2241c95619eso9812455ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745254553; x=1745859353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMEgWb5Zpf4MCf6w3ykJFs0Ob9U5wFpE+oGVVEOi8uc=;
        b=drK+nGScZEP3jbAN6n0Qw/FzQnBcC3n1YOfHpuLhFHY2FOSj88o7pMVmE91eGQ0e4V
         earafBlqcabDAK1dyhQYQK6Jz88VTlzEoHOlzT4OFduiZ45ke80PmTNdq7iFMxPKOvGi
         DC9BD/iG3sK0vdyJ0qjsZ1lEStIHRtOdiBq8tYW46Bl3NJVUKZ/LrlzstA0vA9+jqw7m
         y5Yz7l+EG7iPFrIzg3P/MfgHF5wUz92ZtNMWoUJ4GJcdsuKuNXK3dOv41h18mIt5x6GI
         d6qdEBzDTsXbNRwkOOmQJ8hlIoCuZcR3fwAeQ1lmqkp6tts15fezPLBNSho5005bFpM4
         m1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745254553; x=1745859353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMEgWb5Zpf4MCf6w3ykJFs0Ob9U5wFpE+oGVVEOi8uc=;
        b=SYUXf1YYsK1jgbrvpQPOkQ0l3eaYdjXJW8giZVWnTbAzH4QnxO4l6w+vsG9ad1xLqv
         W3qdypxYtnvwoLYhS/9DIq9F9fXQ1h1AnZTE9XOR6COCKBE3d7odmGS/1m9xv3b8rmzB
         r0kU+qO4FteN5x3Ks0ru5mmx+EmdGgcX+5R7+vV4OhQGbXIp1R7KEP5y0ai9ac7EDHew
         8cEmxzBphy7rDXq6h0cDtECQaoAP4QtgUBJQureMt96ZWPojHS8hGGHrqYxIK+XoOyMG
         cmibQbF0fR+mzlZZSAkpGE5cnGnXBtzYvRbt6LhGhw2kRdYcEFN8PhcZUmuCkDFCqcAF
         xjKA==
X-Forwarded-Encrypted: i=1; AJvYcCV8DtUN0dZs5Kx/Gt6BmoOzDoOzuMpgeXHLyPRxj8mI3hp3y1oq6FZIvEONmDfltknfJFUFP6DmIwPkQb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXXG6weGxZQLUsp4BJcYA1QVwkgo9fcQ4lTgYCmwpDn/85Ues4
	t0q0HWLJkPXmCQkGVjF1rMBshg5YLtZlrutz1G58cL6+s5TK2wZ1VZHFQRbLdbSl6sK7LYI4bO8
	9THelT8GrW3P1bNt6mwO3U7pg2pJGBAb2
X-Gm-Gg: ASbGncsRJNjmojoYy7+gHcFqOzou/LJr7HopHdDlYAuq9hInsRC08fbu6HlyExAXAkj
	OCRMoCQV9yZmCPhryrrqVmztQAYpaIJx4Nny+pWl98g39H1sNHdU7IWOJfdNGv1HoX+kXyFk5hP
	8R+zBFIsZEpCS61eXvfJBPcNtlD7w7xB68wiUGYMpbfHTTcYpFox+kGU5tGKCMRpzNvkZyTndOB
	wRhj4BJ1jQPtIXnFG7MmHsmRvzKXgSgg0nicXF7+QZb2kkUAw6db6jwBCZaRd5Gfg+txheJkecL
	Hhkl7lEpoG6PSwpZYQUz++/mhd4/XfhPxNY57l7NA/+8
X-Google-Smtp-Source: AGHT+IEtnQbE0lKY4qlJspwVfxkPFz2/gOrPkE/mbdSfxR4HhHAAe9jfFIEZfKONBd7m1NYuLvIjpOYLcRVS
X-Received: by 2002:a17:903:2d0:b0:22a:bbea:6ab8 with SMTP id d9443c01a7336-22c53622bb9mr71534915ad.12.1745254553330;
        Mon, 21 Apr 2025 09:55:53 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-22c50cf1ebdsm3798865ad.60.2025.04.21.09.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:55:53 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 9CEEE3406E9;
	Mon, 21 Apr 2025 10:55:52 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 9AEACE4151A; Mon, 21 Apr 2025 10:55:52 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Kanchan Joshi <joshi.k@samsung.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v3 1/2] nvme/pci: factor out nvme_init_hctx() helper
Date: Mon, 21 Apr 2025 10:55:24 -0600
Message-ID: <20250421165525.1618434-2-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250421165525.1618434-1-csander@purestorage.com>
References: <20250421165525.1618434-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvme_init_hctx() and nvme_admin_init_hctx() are very similar. In
preparation for adding more logic, factor out a nvme_init_hctx() helper.
Rename the old nvme_init_hctx() to nvme_io_init_hctx().

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/nvme/host/pci.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index b178d52eac1b..642890ddada5 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -395,32 +395,33 @@ static int nvme_pci_npages_prp(void)
 	unsigned max_bytes = (NVME_MAX_KB_SZ * 1024) + NVME_CTRL_PAGE_SIZE;
 	unsigned nprps = DIV_ROUND_UP(max_bytes, NVME_CTRL_PAGE_SIZE);
 	return DIV_ROUND_UP(8 * nprps, NVME_CTRL_PAGE_SIZE - 8);
 }
 
-static int nvme_admin_init_hctx(struct blk_mq_hw_ctx *hctx, void *data,
-				unsigned int hctx_idx)
+static int nvme_init_hctx(struct blk_mq_hw_ctx *hctx, void *data, unsigned qid)
 {
 	struct nvme_dev *dev = to_nvme_dev(data);
-	struct nvme_queue *nvmeq = &dev->queues[0];
-
-	WARN_ON(hctx_idx != 0);
-	WARN_ON(dev->admin_tagset.tags[0] != hctx->tags);
+	struct nvme_queue *nvmeq = &dev->queues[qid];
+	struct blk_mq_tags *tags;
 
+	tags = qid ? dev->tagset.tags[qid - 1] : dev->admin_tagset.tags[0];
+	WARN_ON(tags != hctx->tags);
 	hctx->driver_data = nvmeq;
 	return 0;
 }
 
-static int nvme_init_hctx(struct blk_mq_hw_ctx *hctx, void *data,
-			  unsigned int hctx_idx)
+static int nvme_admin_init_hctx(struct blk_mq_hw_ctx *hctx, void *data,
+				unsigned int hctx_idx)
 {
-	struct nvme_dev *dev = to_nvme_dev(data);
-	struct nvme_queue *nvmeq = &dev->queues[hctx_idx + 1];
+	WARN_ON(hctx_idx != 0);
+	return nvme_init_hctx(hctx, data, 0);
+}
 
-	WARN_ON(dev->tagset.tags[hctx_idx] != hctx->tags);
-	hctx->driver_data = nvmeq;
-	return 0;
+static int nvme_io_init_hctx(struct blk_mq_hw_ctx *hctx, void *data,
+			     unsigned int hctx_idx)
+{
+	return nvme_init_hctx(hctx, data, hctx_idx + 1);
 }
 
 static int nvme_pci_init_request(struct blk_mq_tag_set *set,
 		struct request *req, unsigned int hctx_idx,
 		unsigned int numa_node)
@@ -1813,11 +1814,11 @@ static const struct blk_mq_ops nvme_mq_admin_ops = {
 static const struct blk_mq_ops nvme_mq_ops = {
 	.queue_rq	= nvme_queue_rq,
 	.queue_rqs	= nvme_queue_rqs,
 	.complete	= nvme_pci_complete_rq,
 	.commit_rqs	= nvme_commit_rqs,
-	.init_hctx	= nvme_init_hctx,
+	.init_hctx	= nvme_io_init_hctx,
 	.init_request	= nvme_pci_init_request,
 	.map_queues	= nvme_pci_map_queues,
 	.timeout	= nvme_timeout,
 	.poll		= nvme_poll,
 };
-- 
2.45.2

