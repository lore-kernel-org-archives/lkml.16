Received: from mail-io1-f97.google.com (mail-io1-f97.google.com [209.85.166.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B8322F76E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745359807; cv=none; b=fNFfCY0z0VjGHu+PtRVMmoiwvOlIQDvBa02vPVdN90N0L7cO0PTJB7CKn72wmygXr+S3sRjfkhXFjh0zuhlmg4MZBwXEIl/cqz+P3uSObMr4iFbXOAhMAFlG3I9P2qcZwhO4jSLMxY+5w8+t9lvHOSFqkW2QL5USQe87E3I2y3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745359807; c=relaxed/simple;
	bh=MHtLifVsYG6FahThsbmSVCAD6P7ntFp2e7KBM04eh5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RyGBFeWQAQ3B6FxS0gqj3/VhMyfVOPcghh/fqRhrWkMGuEia3LPxwySwzKycDWmE4+vHdWFUNNx7ljX/forz/KkAjEsArbIh/aI1h10D6m350/H+GJdFkV01p3gyPowRVQ5M0lNhUHFaifGmWAemBV885/TMv68rzcERI9M+0+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=erH1H8Nf; arc=none smtp.client-ip=209.85.166.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="erH1H8Nf"
Received: by mail-io1-f97.google.com with SMTP id ca18e2360f4ac-85dc6dd9c5fso18747739f.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745359805; x=1745964605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5ll9KUN256iJ21I+GFr1dexXL900a9tJZDKmP40gJo=;
        b=erH1H8Nfbz8pAJqFA0LrL3DbYF+lZR69sw+Yhox7Z+HsmFuYABKToK+PgAVZv3wjwE
         +3b3n3ZlODvFrGyVM+9DecYMki50WnmKVDq2sFN2BQHdtnoCHReR2WjUTCHQRxfWkomB
         nxbJhsfwCeaMSQS42gphuXnajnkFjZc0awbaw5T8CZZb3tHmx8ixgg+Q3sLl9DAiAlXt
         zBMygNnvLaup6txzNlJ/GDtEFKc7AidsqQSKP6KW7qDHQj/30UDmjO1jBk6St8oSvqdv
         Z1EGuHbo8+rWV/douIzB/jdHFzMQI6UhbFzSkXyjWgEE+CdlRzloliGwvzFrcZJJym1t
         2zXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359805; x=1745964605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5ll9KUN256iJ21I+GFr1dexXL900a9tJZDKmP40gJo=;
        b=kOSBP5lY0cFUgFCUE0GZAnV15abZ3nk0R+BuyQ9joK1IKtJ/pnD10jz1KJIdVZ5E8r
         IfuLzHRZnD9lR/gTHuX+zBsjpN2R5BIxAjpDKhKEqNdOh7KbnNNi1xmULsLwZirR7vDc
         cE86+BzlqyzM9n9k0EokK+54LS01LjMn7y9dnGKTaTN4GDKu8FYcxmb1BcKFuvIm/Kmq
         RvqUFSWjRiN5AQECDyTqw26k6nskph7MYQa3JsH8xIMkxCQ1RWkdPx+ch6r2fZ4Dxl+5
         QR6evdTC4M0niwrg0wfhr0M8e7NXsoEFs75sRkb4I5P06yz/h0c/wC0oExTyYjFb2DH/
         fMsA==
X-Forwarded-Encrypted: i=1; AJvYcCWgaQS2Y/ugTy8o/afpkewYEeNz+YwiKbz/wPZDpfQH+rYWts7GU1GH9mWGavezSjlVZ1bs2Ytro0YvGgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTtDXYgIe632mmJBLcfuSn1MACUuY0NbfWZZhR7XcAf8vvXfdA
	jkwQNOVz00fdFVbjlyXYcs50VPKWZEEwD5DrlRFhHv6H77CvLwFKLWOoyHGVakxxTY8IJ78W8A0
	2RQs67VhDEvsdinqCUMT6pakyU/wosmz3
X-Gm-Gg: ASbGncuw8o3kIOexZQj4YxUilzXBMJ7By6HFGGk+ZPpzGNz8653KYyfo7xafcPnPQBB
	eOMgyP3URYrL+QvroO7g+fWRsP1SFGNtTRcgM4hubP9fO1QbRRH2WDs1pmu6jkAvbd8h9QWYZNG
	BR4pSuJvfB1DaZxrgcMD8MXMu2WdXxGKSc4fw9U7Kmov8hN3AY6eHWozVOVU2hkEONk8essQ47y
	XQnWGiPj6sVtOM9cK9TNpEE3+K3bsl3sid1MtjdeTu4XmuFw0tkvNSY3d4pHTYHzx6DHM9H1sZU
	WIYju0CSCfGSEx9RoEop7EbJ/3YZs8fGhhkLnrowfXae
X-Google-Smtp-Source: AGHT+IFCxmBnf+7bB+8snSPZXOEPm4CxZ2zCnH5FCszcDPwSNWzfbpsF/Z45o37K/MtwkopN3C+v+VzcppIo
X-Received: by 2002:a05:6602:6b06:b0:85a:e406:5836 with SMTP id ca18e2360f4ac-86443b6e18emr25784139f.5.1745359804831;
        Tue, 22 Apr 2025 15:10:04 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id ca18e2360f4ac-86444829859sm1350339f.31.2025.04.22.15.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:10:04 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 7E813340159;
	Tue, 22 Apr 2025 16:10:04 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 7B817E41D69; Tue, 22 Apr 2025 16:10:04 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kanchan Joshi <joshi.k@samsung.com>,
	linux-nvme@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v5 2/3] nvme/pci: factor out nvme_init_hctx() helper
Date: Tue, 22 Apr 2025 16:09:51 -0600
Message-ID: <20250422220952.2111584-3-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250422220952.2111584-1-csander@purestorage.com>
References: <20250422220952.2111584-1-csander@purestorage.com>
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
Reviewed-by: Kanchan Joshi <joshi.k@samsung.com>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Reviewed-by: Keith Busch <kbusch@kernel.org>
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

