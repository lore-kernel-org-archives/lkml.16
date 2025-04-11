Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532C721A451
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744390504; cv=none; b=tZjMjLp0TfxXgVW7u8FIfee2401qhm57Sa4v46JKBEgdNnwIblTzuPlU3g016h2yyabTbGUKfhvQJqdBNy85X6W/puG92ua/8/0Nf4/KlvfxjtFGlqEUS1b0WLFhiPl9VnOpGY/JnHLuKhwf6Js9vztiujhyKB3JPrRejEYrzyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744390504; c=relaxed/simple;
	bh=eQUbKB5MlOrjoSK4E9qLGEKlAJfBrbmh04JyjJb8mTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PcrIIiR+9zfXdbeS3UpYpxPeHH9NrrJJhUKm/mQDfLHN7HAmfPX/MOdylJA77UlwYvk850BoowC9fObnGvT7M4VMUueZqvY1GsR/Rr0c/sHPTWNfgn5aJ/pQF4U77r/Pok8COTVvyvQbSCM/MldL5c/f7Z0mzBnsIsFq4yrXXqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cX9Hd4p3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cX9Hd4p3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744390501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KBcgGdLhrEqsLmtx1ScSEvmWJKw+htq0uliyA+SEq3w=;
	b=cX9Hd4p3j+4DtcN3ytx60HMMvcNNd9mv1UCVgKGins6BZRgRtGxEMrN4LwCyviPoe6lTsU
	XNvIjwOTCLFA7s/q9Pst5Ba5WuUySUgURMbS8ChDiOkzQi6JVTdCof6jACvHqaeJMxem1Y
	4MOfeZJOb3TSu06Kj7IJb+IDGtE9Q+Q=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-675-3xMtwCtPNjumNzDnoeQkHQ-1; Fri,
 11 Apr 2025 12:54:57 -0400
X-MC-Unique: 3xMtwCtPNjumNzDnoeQkHQ-1
X-Mimecast-MFC-AGG-ID: 3xMtwCtPNjumNzDnoeQkHQ_1744390497
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DB57D1956087;
	Fri, 11 Apr 2025 16:54:56 +0000 (UTC)
Received: from f39.redhat.com (unknown [10.44.32.127])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F2DDF180175D;
	Fri, 11 Apr 2025 16:54:54 +0000 (UTC)
From: Eder Zulian <ezulian@redhat.com>
To: Basavaraj.Natikar@amd.com,
	vkoul@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Eder Zulian <ezulian@redhat.com>
Subject: [PATCH] dmaengine: ptdma: Remove dead code from pt_dmaengine_register()
Date: Fri, 11 Apr 2025 18:54:51 +0200
Message-ID: <20250411165451.240830-1-ezulian@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

devm_kasprintf() is used to allocate and format a string and the
returned pointer is assigned to 'cmd_cache_name'. However, the variable
'cmd_cache_name' is not effectively used.

Remove the dead code.

Signed-off-by: Eder Zulian <ezulian@redhat.com>
---
 drivers/dma/amd/ptdma/ptdma-dmaengine.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/dma/amd/ptdma/ptdma-dmaengine.c b/drivers/dma/amd/ptdma/ptdma-dmaengine.c
index 715ac3ae067b..3a8014fb9cb4 100644
--- a/drivers/dma/amd/ptdma/ptdma-dmaengine.c
+++ b/drivers/dma/amd/ptdma/ptdma-dmaengine.c
@@ -565,7 +565,6 @@ int pt_dmaengine_register(struct pt_device *pt)
 	struct ae4_device *ae4 = NULL;
 	struct pt_dma_chan *chan;
 	char *desc_cache_name;
-	char *cmd_cache_name;
 	int ret, i;
 
 	if (pt->ver == AE4_DMA_VERSION)
@@ -581,12 +580,6 @@ int pt_dmaengine_register(struct pt_device *pt)
 	if (!pt->pt_dma_chan)
 		return -ENOMEM;
 
-	cmd_cache_name = devm_kasprintf(pt->dev, GFP_KERNEL,
-					"%s-dmaengine-cmd-cache",
-					dev_name(pt->dev));
-	if (!cmd_cache_name)
-		return -ENOMEM;
-
 	desc_cache_name = devm_kasprintf(pt->dev, GFP_KERNEL,
 					 "%s-dmaengine-desc-cache",
 					 dev_name(pt->dev));
-- 
2.49.0

