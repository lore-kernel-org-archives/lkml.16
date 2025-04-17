Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307561A3178
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744913393; cv=none; b=VGGCVjxY9M+MCZp/KR4TGQSsbsbGjz/9oeF7bS/FBNppAQN1f47oSkhPIb5hW2/NOUqugg8ir1jfvSfmpCR7+/yeOHhsSUaAp3C06RJIef7ah7MpIuPNaUQy3nMcGNMRgvxv4kKyOZ1BSM32BhSS/qgyvkkFRq/CjEZRdoNZ0Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744913393; c=relaxed/simple;
	bh=ivlsnWVdLRNj9s4gjaI3LC0rR9TXe+bX1acPw6E18pM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HUrN0CNnOrr2HTZGWvOBdJgoJJhA1FBcvuuT2BM5zPePH6UXsrnStczAyb29V1DFdLgSHqCcBCKlZjS7V8HBQWNaRmoU70JbXNcxuxIGRLFxlAGyWj1LmVA2cZ/6YQhqj+m8+7viRmf3aRAXL0ktAfbplVBV77b3wld8hmmn91c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WFgHzqre; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WFgHzqre"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7398d70abbfso1355073b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744913391; x=1745518191; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VieRPDeOIrrtofiVIhvIFRGmHPPN8m75t7mreV4JIzU=;
        b=WFgHzqreyu53JFdl3KQCBrOw8Woe05O//FtPoUX+3sipsM6ErzUTtUh0XY9F79FsIj
         +8M3SKcec8+6yCy6Ac2RpVhkXY7cpR5dkOEgZf8wS1lEg/WdvmUGQBI9LSMzT6DUJlVz
         d6s/Mtkq4PaBjJufAP+UCkVjGJMHQqRkiR8JdFZs42FwdQPyGHc/0BSWfLH01cgbjES+
         QrIXNE0fjPpEaokjjC2Cy7Q3uhytEIoR5d+8NeXf7wcjK+Ie8PPVJupWpeVOyDnUvByI
         PjQbka2WG+84eB3CZ4MXugjUWEw+j8m6rQUOJhfpr2465K9VAGsdxZghgJZ0Q5nb8KOT
         oMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744913391; x=1745518191;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VieRPDeOIrrtofiVIhvIFRGmHPPN8m75t7mreV4JIzU=;
        b=vR2DNE++7bws7Gwi8p9qV2r2gJGrrGQ/9ml/l9mtQc7lbYelO/l7NYQXYV/RaPObdT
         uzqBqwwJyHX+XzGMeT4756FXfHlzmqHzVALxVwgdZP+J966sfzkOCdWEx0CKoiRw5fW4
         +351+xqDUIKOEp9ppNFTd/Zso5FQ7iYMrgCIaJrdKrJHhyHWLwMp1NTvk9axNicnkpuC
         403bWtDZQVfWqbQBcN6QVOgWxF917Z7fXUc4W8Qco8fD6NU7YJE5cCjljhuogBqmPMZ0
         DKJLR2fl3Zwwo1kE4JlO/4XkTlxmDI4Gdh0mqbc0R1Bb3LHVQhZ0m9fRUUMUA0wonpLP
         CMeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUyoJXB/iuNbjMpz7tc+rF4IMvg5QSQ7iB8AyHSNX24bfwLerBXqbV7OFNhRMtHVvR3FLjfCSaYLKpqc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIgzc8AfA5/xetjWmJC3Tg27mOYdHQ55LishoLW4WoKj20Tfoh
	XmaU86XHSEj8dj0B8lHByF0g9SjsOEoNJkY1Pa8snvXFanPR8fGUtSrrJWq4hOETU+1IAggaCx0
	ZX38IRFBrEYNN1A==
X-Google-Smtp-Source: AGHT+IFiEqpxdk1THB5nHvZfHtFFffV9Gz5mbaspUCw4yzGR9KYpdaO0xsj+RVnwm9NlrjGZ6uNoUIW5ZLKdM/Y=
X-Received: from pfvb12.prod.google.com ([2002:a05:6a00:ccc:b0:736:7120:dd05])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:180f:b0:736:6d4d:ffa6 with SMTP id d2e1a72fcca58-73c267e1deamr8747874b3a.15.1744913391461;
 Thu, 17 Apr 2025 11:09:51 -0700 (PDT)
Date: Thu, 17 Apr 2025 18:09:41 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250417180943.1559755-1-tjmercier@google.com>
Subject: [PATCH] dma-buf: system_heap: No separate allocation for attachment sg_tables
From: "T.J. Mercier" <tjmercier@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

struct dma_heap_attachment is a separate allocation from the struct
sg_table it contains, but there is no reason for this. Let's use the
slab allocator just once instead of twice for dma_heap_attachment.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 drivers/dma-buf/heaps/system_heap.c | 43 ++++++++++++-----------------
 1 file changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 26d5dc89ea16..bee10c400cf0 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -35,7 +35,7 @@ struct system_heap_buffer {
 
 struct dma_heap_attachment {
 	struct device *dev;
-	struct sg_table *table;
+	struct sg_table table;
 	struct list_head list;
 	bool mapped;
 };
@@ -54,29 +54,22 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
 static const unsigned int orders[] = {8, 4, 0};
 #define NUM_ORDERS ARRAY_SIZE(orders)
 
-static struct sg_table *dup_sg_table(struct sg_table *table)
+static int dup_sg_table(struct sg_table *from, struct sg_table *to)
 {
-	struct sg_table *new_table;
-	int ret, i;
 	struct scatterlist *sg, *new_sg;
+	int ret, i;
 
-	new_table = kzalloc(sizeof(*new_table), GFP_KERNEL);
-	if (!new_table)
-		return ERR_PTR(-ENOMEM);
-
-	ret = sg_alloc_table(new_table, table->orig_nents, GFP_KERNEL);
-	if (ret) {
-		kfree(new_table);
-		return ERR_PTR(-ENOMEM);
-	}
+	ret = sg_alloc_table(to, from->orig_nents, GFP_KERNEL);
+	if (ret)
+		return ret;
 
-	new_sg = new_table->sgl;
-	for_each_sgtable_sg(table, sg, i) {
+	new_sg = to->sgl;
+	for_each_sgtable_sg(from, sg, i) {
 		sg_set_page(new_sg, sg_page(sg), sg->length, sg->offset);
 		new_sg = sg_next(new_sg);
 	}
 
-	return new_table;
+	return 0;
 }
 
 static int system_heap_attach(struct dma_buf *dmabuf,
@@ -84,19 +77,18 @@ static int system_heap_attach(struct dma_buf *dmabuf,
 {
 	struct system_heap_buffer *buffer = dmabuf->priv;
 	struct dma_heap_attachment *a;
-	struct sg_table *table;
+	int ret;
 
 	a = kzalloc(sizeof(*a), GFP_KERNEL);
 	if (!a)
 		return -ENOMEM;
 
-	table = dup_sg_table(&buffer->sg_table);
-	if (IS_ERR(table)) {
+	ret = dup_sg_table(&buffer->sg_table, &a->table);
+	if (ret) {
 		kfree(a);
-		return -ENOMEM;
+		return ret;
 	}
 
-	a->table = table;
 	a->dev = attachment->dev;
 	INIT_LIST_HEAD(&a->list);
 	a->mapped = false;
@@ -120,8 +112,7 @@ static void system_heap_detach(struct dma_buf *dmabuf,
 	list_del(&a->list);
 	mutex_unlock(&buffer->lock);
 
-	sg_free_table(a->table);
-	kfree(a->table);
+	sg_free_table(&a->table);
 	kfree(a);
 }
 
@@ -129,7 +120,7 @@ static struct sg_table *system_heap_map_dma_buf(struct dma_buf_attachment *attac
 						enum dma_data_direction direction)
 {
 	struct dma_heap_attachment *a = attachment->priv;
-	struct sg_table *table = a->table;
+	struct sg_table *table = &a->table;
 	int ret;
 
 	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
@@ -164,7 +155,7 @@ static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 	list_for_each_entry(a, &buffer->attachments, list) {
 		if (!a->mapped)
 			continue;
-		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
+		dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
 	}
 	mutex_unlock(&buffer->lock);
 
@@ -185,7 +176,7 @@ static int system_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 	list_for_each_entry(a, &buffer->attachments, list) {
 		if (!a->mapped)
 			continue;
-		dma_sync_sgtable_for_device(a->dev, a->table, direction);
+		dma_sync_sgtable_for_device(a->dev, &a->table, direction);
 	}
 	mutex_unlock(&buffer->lock);
 

base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
-- 
2.49.0.805.g082f7c87e0-goog

