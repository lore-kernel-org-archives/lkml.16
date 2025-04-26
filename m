Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794371E492D
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 02:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745633280; cv=none; b=gVosjXnE/syc4qjlZ5giN+qEHIThpFEms+EhuwpdaDwkPDS2SxxpZrW0i8GnkY8nGLgTo78VrGg458CXsAzkmaMtk0I2UWSsD9WTv+kGjuCLfbV2rtKzUuvg3fhcZD99HX0j/PAZ8xo27C+a9guLdTirIh+t3UHJWiX8YjBfjLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745633280; c=relaxed/simple;
	bh=AG+F4FD3+gjOxZbs+B+zZMhk35jf+Em8KiZhK4YH074=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WynHTpwMjGc9KcG2+OEhsR3ch0gVPps/MjIFEw8x64qXDMNFH4F8Fw4MUCHftR8zlvsFTYB80yWNpa9WNk4Jue5XAyf3C9Y59AWHedx1ZcvztiMMle6EQ4BC/h/M/n/x5yaxH1jUCgINoFiCvpcG38lqWqMDApC7eKkVP7MYhKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Q3EZYsqe; arc=none smtp.client-ip=209.85.128.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Q3EZYsqe"
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-6ff5696f99dso1143387b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745633277; x=1746238077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wVUCLEe+0hKn6q/c+4Hvm6QrjTginZMMcE5JFRhMDE=;
        b=Q3EZYsqeD9LGERD3725jYxhaaikmNCO0sMRmOFQu1oBEDqnbg8ttU+PozJctcqq5hU
         JtiioXwTvplZ/rtD6lWwfBCPhBIdJK9Zo0jr88YXikPifWo/qFHfmye5WUe9InV93JiR
         sbA21eUaxiR2rI6BCIzPz6L/bCpsWN6bFy/lpq6RYaGMzrDNPHt/5qZ0qP2ELcHDez74
         cu+oXL1PTciQaYYUUbTZ6DTxS5lIGAL5dQBUm2GSKCZ5ijpt14BEUrVDRvj+Z4zdqeg2
         vJeZ6oNnyb48MdeGGUV2w/0s1tCq4tMBOWlFW240xX8prJU6D6jXkABtjEGXIHSqiThK
         o6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745633277; x=1746238077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wVUCLEe+0hKn6q/c+4Hvm6QrjTginZMMcE5JFRhMDE=;
        b=qrNIu+JskyUNJyVsHlHWz4PMRjb7LiCdnTuM38IyUcaGceimMqjAYY6IxYz6B7GFAF
         wXkKzwci6siNRf2h8325o+p385Vyjs7KDUfr3TpziDMoUrLuocVuIkZckHf6a3wYvHtc
         Y3BLP9x2Xm4g0xv5gHHPa3hsS+xC7Ch97XH5AIrPEfyCEyS4xCT5ZnRNox5EckgIHtBC
         ZGtlUzy/uNXnx1B+6xu7+gCKkA/BTAxKQMzZmNnHPQJqpbyw0V4ZUcSYz4WqeUUBahdT
         //cCxCrwC46AWaJppbVypF6cXhB3w6Henxb0r65c7FnqA0yAsGf35kRoadDc6lg4D7ps
         DPwA==
X-Forwarded-Encrypted: i=1; AJvYcCW4ObPEm9wA6vPfMQukkc3EUfLwflfkxNcNUoeoSjEXof6oIAMojoZ9PNDfKm/knidIcYjN+MxGgKGxkJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv4LOz0YEGjW6BOYRCrLpil9KSKZH//FeyzSoB+aGH70LummaA
	CKnqVffwD8wCvR93pfZu4sk7lqqKt4X951f9nO71iMjz1uWHIPjTyiooV36hT7rWBk/D49ZdXp+
	gpH/OYnNvOcgQj5BneTw/vrt1Mo++OzCkiAYx9E436AOqXqkA
X-Gm-Gg: ASbGncujshgMZ7+hQ7qRKen7ONEhHq02zaAZ9g7mz24OrtEXk8DGC4Yzazb17fS+OVL
	gRcaI4XlOMXk6D+KVWOMed/tR1tumzpkQ+ymoJLZEnAYV8uWmrs/EDS0y5zhcB9o9bgyfGmOslO
	0b0tTgTBub+kGFMlFOLf2rIke9Acd0IXlgvMSYkpap/cFqr/bHoJZqahZa67a5qcAF58SXgKXKq
	l0z1j2N3uYh858kIKb5vIB6up5ybFC/FL3Nc5o7QggeuOy8IsWPQhB6Bf+B6Gy/1gZojyonorEx
	CGMcPB5kEGX6YTJdUaiOm3BUDT1aOg==
X-Google-Smtp-Source: AGHT+IEOm9b947bh8wKZJPV8BjTdH67+qjOLV0pvz9iI2xoiPw02tnrnJGVgx5zAiKMvH1se85vcy5rkCyEq
X-Received: by 2002:a05:690c:10c:b0:703:b507:de77 with SMTP id 00721157ae682-708540e3d7amr28404067b3.3.1745633277254;
        Fri, 25 Apr 2025 19:07:57 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7084195d63fsm2366547b3.17.2025.04.25.19.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 19:07:57 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id A07E7340269;
	Fri, 25 Apr 2025 20:07:56 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 9E77BE41C66; Fri, 25 Apr 2025 20:07:56 -0600 (MDT)
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
Subject: [PATCH v6 2/3] nvme/pci: factor out nvme_init_hctx() helper
Date: Fri, 25 Apr 2025 20:06:35 -0600
Message-ID: <20250426020636.34355-3-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250426020636.34355-1-csander@purestorage.com>
References: <20250426020636.34355-1-csander@purestorage.com>
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
Reviewed-by: Jens Axboe <axboe@kernel.dk>
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

