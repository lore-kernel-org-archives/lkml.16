Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3057A2566CB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744198837; cv=none; b=qcttL66sP9quo7BKUr4gw4XlZ37va4ja6ZojdAl3ypOlNpMncWIHVEPtirXsPSj+VIiJhaDxm/fRzDJkqkYDbndOwfxXA2H12XK3fU/Ywj73nyRded2x3bYYit7RMa9F08V396bKOT6FoLBwVMDzT3gdk8SucSM1kk/kocpWSEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744198837; c=relaxed/simple;
	bh=D1baVT2feSX1Er3+kGpb+OJGmiYzuo+g9ncKFVOLPvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y690cuhX1brshzvW7Dn7omTWOoBEI8rv5waQzzQFycor/mk/Fif7w8/C6rNcjRBMaNeH4N1F99I89vn/PLwoPP0u7n93aYzQfBw0+iYlYw6dvqI4KeuuM5RTL3oFhofWrxeAnuZHr2nIWDM89t4lmDiRiRqdku9hL73O42JcAXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hI8z9orv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hI8z9orv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744198834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NDGqQlp6vdT92i39nxBBA+m8Gk2WrTTGk7njr1zr+XA=;
	b=hI8z9orvigT94nQJfV5hAG8LOIsMwO4PZwo1jdDOt/cb9Y1gp0g7LTFf7aJEB3w5ttwO9g
	6/tgwWtwjkwjlpr2EfbRkJ/0Wh5t7O5LqUMUY8yAql1a8EQIYL+UZmHCEQyp5AWRJ72Cjy
	erXSr+7tsabBQuckHmJWTbRGCjkyipI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-360-C_kpjkuYNIWr8O6Am3WJfw-1; Wed,
 09 Apr 2025 07:40:32 -0400
X-MC-Unique: C_kpjkuYNIWr8O6Am3WJfw-1
X-Mimecast-MFC-AGG-ID: C_kpjkuYNIWr8O6Am3WJfw_1744198831
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 841F7180025A;
	Wed,  9 Apr 2025 11:40:31 +0000 (UTC)
Received: from f39.redhat.com (unknown [10.45.225.54])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DCC0A1955BEF;
	Wed,  9 Apr 2025 11:40:29 +0000 (UTC)
From: Eder Zulian <ezulian@redhat.com>
To: Basavaraj.Natikar@amd.com,
	vkoul@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Eder Zulian <ezulian@redhat.com>
Subject: [PATCH] dmaengine: ptdma: Remove unused pointer dma_cmd_cache
Date: Wed,  9 Apr 2025 13:40:19 +0200
Message-ID: <20250409114019.42026-1-ezulian@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

The pointer 'struct kmem_cache *dma_cmd_cache' was introduced in commit
b0b4a6b10577 ("dmaengine: ptdma: register PTDMA controller as a DMA
resource") but it was never used.

Signed-off-by: Eder Zulian <ezulian@redhat.com>
---
 drivers/dma/amd/ptdma/ptdma-dmaengine.c | 3 ---
 drivers/dma/amd/ptdma/ptdma.h           | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/dma/amd/ptdma/ptdma-dmaengine.c b/drivers/dma/amd/ptdma/ptdma-dmaengine.c
index 715ac3ae067b..3f7f6da05142 100644
--- a/drivers/dma/amd/ptdma/ptdma-dmaengine.c
+++ b/drivers/dma/amd/ptdma/ptdma-dmaengine.c
@@ -656,8 +656,6 @@ int pt_dmaengine_register(struct pt_device *pt)
 	kmem_cache_destroy(pt->dma_desc_cache);
 
 err_cache:
-	kmem_cache_destroy(pt->dma_cmd_cache);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(pt_dmaengine_register);
@@ -669,5 +667,4 @@ void pt_dmaengine_unregister(struct pt_device *pt)
 	dma_async_device_unregister(dma_dev);
 
 	kmem_cache_destroy(pt->dma_desc_cache);
-	kmem_cache_destroy(pt->dma_cmd_cache);
 }
diff --git a/drivers/dma/amd/ptdma/ptdma.h b/drivers/dma/amd/ptdma/ptdma.h
index 0a7939105e51..ef3f55632107 100644
--- a/drivers/dma/amd/ptdma/ptdma.h
+++ b/drivers/dma/amd/ptdma/ptdma.h
@@ -254,7 +254,6 @@ struct pt_device {
 	/* Support for the DMA Engine capabilities */
 	struct dma_device dma_dev;
 	struct pt_dma_chan *pt_dma_chan;
-	struct kmem_cache *dma_cmd_cache;
 	struct kmem_cache *dma_desc_cache;
 
 	wait_queue_head_t lsb_queue;
-- 
2.49.0

