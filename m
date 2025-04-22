Received: from mail-io1-f98.google.com (mail-io1-f98.google.com [209.85.166.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94118290BC4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338816; cv=none; b=e4/87E2b0INk3d7LpKg6GAo5gfgqcK6Zd2J77bpfRlNB8PUOM5CS/wm+zhTdWi8aEPitqtT2oT1zPpSVhQLXmrAoG3cptpvBB6RFTOb4WjIZG3UsfNyiwPBMMs9ORS6VUrGszpHFxZxoOUgjEJXeq0GAAb1Wb342Qp3B/LVyX+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338816; c=relaxed/simple;
	bh=X7h8ChQP3LmT/meMOjg2saJHYMnHOow+2TjJc/89OWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mlXPikcYOfN5pO9r3JtkRoU/Bs/101tVAxaK1yc6Wi3DXYadQ+mQqENJgaaEdeh8yjnQTJ6FGbZB4udL4ZBsZS0wkpJcvGtiamiJ6kw6K9G0BOiAbfyrQ7ZOGJkyJzRlqHnZA9HDolJipXYyONUDN4PzAHFE0Y5ao6k0gwf7dW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Nc8feuUr; arc=none smtp.client-ip=209.85.166.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Nc8feuUr"
Received: by mail-io1-f98.google.com with SMTP id ca18e2360f4ac-85df142374bso15267839f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745338813; x=1745943613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3tB0h9RksPJEIyvjsBpowsXLr2+CyDhWSQ1RmiUmY8=;
        b=Nc8feuUr2tbsMuWTahltblUyeN2UtG7juu54AwuQUKNvYw6j/keWZ68Daqt5ptZVW2
         dwjJcwcPMnkVtBPLu5xF9URz+lqplxMwxhwSwAxEkONzniLPGuEBcILreZT1EZQ24Saq
         4ORl0LxjOzizmQeoikPdCx9REcXXzdLaDkYgw5shRGiklE9NQRW8nuRz574wm4uqFcql
         LoFeCQWWV/brSr+zrocBEHF0nukKdQFpCqp71Yq6/WflRWjn6dX2SjmTIXlODxzuB6Tt
         Z7/h5Z82TdbPs1laLTmo275CljmDA5CcpusqeFbYvAX3ZoOWTrjdcpOX7Ku0ufZgeRwF
         kgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745338813; x=1745943613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3tB0h9RksPJEIyvjsBpowsXLr2+CyDhWSQ1RmiUmY8=;
        b=XxMEslqMgUM3NgsNeJ3+GAK3lS2+v3yYNKB+NiYvsiTy1y337JYbBrvA6ZcqsPAhA8
         U9ZwMBneQHz1sQUTfQ2NdoeltLW1ut/pshYBpM9LiwF4IPkKsxNYk8YWKGcgbs14RZD3
         d5xRzbVw5AjcYW3sEQrT8WZJ0pDV4hzCyXWtCBzGcTSSSdprXEdeC5ix+S5kZEy0Qmdl
         BMrVUBp4cMDWUkJtW+u2tdbhey8IIKrzTuw+WePpeY8feoN68ibckaxmvZkEOJ4f9oZz
         wUCPZn30SWxAyzeXHv2LcFAnQJXvJ7TzV+C4S/lZKk2IkuVyX9B34/cXpnK4SfXEuLk8
         2Dgg==
X-Forwarded-Encrypted: i=1; AJvYcCWW60P0BYlvr/7lWLktyk7oTBTci9aR6kxpn75t6WQj6mzyGlLn0kCm8063N14X+OHgjLUeotpi7CizIBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJs2IvkJRXE2hzX2pYis9UapKkzkArio/o6hFaoIdpmA1Q2GRO
	ZXpmQTDcUZPaEuASpOgFB1CR0e/JQWTn9SuPKbT814psiODGTYYdZE9ACUfR+C40nlSyct+xxi3
	Mi4K4c2bwIzsHj+Z0ESzNix7ZxlE0r1JI
X-Gm-Gg: ASbGnctJNfZGf1WSBTmdK7i1uhpRGY6Bv1BSDK1+NXYSJJrEzeruwavQXcuiV+vfPGf
	wugsJ1ug4OrdVVQ21V+LUhCSIDF+GwGhOjoG/V397bUI3hZnORxdMmHCPsDUAWthUq/bw0rYrCH
	W8vxWO8MT98iiUYHt6/EYU90DRJjOwnhaUmIgDkVk+KXTtDUdWfHo9RpCExJXxUD+qLqS1/Ut8v
	XlsXu5yj4tcKoNVGsi+1ijH7u4x5qS1Nw2nBBQD3J/EJnaqXxmrghnQscokZ/bseGUnZjyTbQ5C
	P1mpzcwwdTMly/KvV3Bf8mXVJ02Ffo3pEzSoihmyeoVG
X-Google-Smtp-Source: AGHT+IFOuBh78/Arra/8VT8CFCwZ10+p/3FjWjMAdwvGeQ6A51CGkqMAbb3nYKQwFscJ/2uEL6kvG5FRiJiU
X-Received: by 2002:a05:6602:150d:b0:85a:fe80:cdd1 with SMTP id ca18e2360f4ac-861dbc66cccmr448575239f.0.1745338813592;
        Tue, 22 Apr 2025 09:20:13 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id ca18e2360f4ac-861d9603fe4sm39101339f.2.2025.04.22.09.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:20:13 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id F2964340363;
	Tue, 22 Apr 2025 10:20:12 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id EFFB3E41D06; Tue, 22 Apr 2025 10:20:12 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Kanchan Joshi <joshi.k@samsung.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v4 1/2] nvme/pci: factor out nvme_init_hctx() helper
Date: Tue, 22 Apr 2025 10:19:58 -0600
Message-ID: <20250422161959.1958205-2-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250422161959.1958205-1-csander@purestorage.com>
References: <20250422161959.1958205-1-csander@purestorage.com>
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

