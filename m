Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D974D29B216
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561174; cv=none; b=Hfu0jpYyalM8PN6EVsmfUlUlCfXeQ23wJqw/LoPA060by/SpXawOM6Y6b8ZSQLMwwzuwd1C/U7QdktOlCW1ya5eB02KbSWjx/yAwPIEn5YRXhNkdiOBim9Zdky0uLCV6vWDxGvavbLCUO91YoVxSdwR5catAb+tuUsH74NHKd5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561174; c=relaxed/simple;
	bh=g2hxjQIwU4XI9nVj4pbjHKw5DlPbghUsMwq8TZIMC2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aB5UNYiUkceGglTkjVIZEOj5Ugjsmx3dKx6QfEmaB9ggZ6fhVKSePvBIlQJpp06SVdZHtYDiumk3gYipsc958ajGGndr0PtKqez1iUPL5K6R/6DfWk8IiBXynCdoh4FrKWbXAafX5n3a7ZoxsXI8/E642043o96JJkR/xdgf4GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V+vb77v1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V+vb77v1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749561171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lW5Zu8Mwjs06+WvYwa96tsCt+Qd1PG+1Iig01KCwGYs=;
	b=V+vb77v1jTNqX16G1DrF9vimeLrUIEqoTNCVAr8cCoa1YBWo5ccDgP73CjaHpbjG9Q+/Xy
	ZjTABgEUnI5+1YCnjff0Ac1B47y5Qm9S83xlzbr9Ht4m/yMK0hxybix3UHWPY7uGsAkOAn
	XB1ocxd0VzFXuSrEEQS73Wufpjl3Va8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-QbN4M5OvMH2kfiW8pKjBfg-1; Tue, 10 Jun 2025 09:12:50 -0400
X-MC-Unique: QbN4M5OvMH2kfiW8pKjBfg-1
X-Mimecast-MFC-AGG-ID: QbN4M5OvMH2kfiW8pKjBfg_1749561170
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6facb96d553so90985056d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561170; x=1750165970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lW5Zu8Mwjs06+WvYwa96tsCt+Qd1PG+1Iig01KCwGYs=;
        b=qQ2Z83YsLBBPzv9RBYVQYneVF/UixLZPjwf60ZymmN8i6efS4OCf1pQ2RmZoNYFhp2
         8Nbt/82aU1bNGHuKNC+ZhHlX0th+a1VDwMDK3CZb0E1t+aOKPY7vKIR2U6DMZPKkrCDJ
         UZ3viIOZlx7wHiIic0o1FRL9pdcMvpX/X0LxRPJibNC3xWPcokAuEiYnGgvC1JXt9F9T
         /jNP8P2RoefpuUCT2sMj3xzy8S6Ve8guY4JISDk2riIII31wzFhOQw3ykz8xbqowlWW1
         oxl06vT7bWbBS/xzm8Bmm/AAbzPctThJkYiaiY1/k4420ywccZctgbB023qv0o5pG3o/
         gfkg==
X-Forwarded-Encrypted: i=1; AJvYcCX4Jq8vPDs1lrAYKIMdEfQK5VOD5J+VDuI4EC7+XVI+P2WboH4+rMZB+XlbWfvItj66bY4YmJ2HIvLvFas=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5bxJA7RL4Fs5km8Au98RAeUpfkKCAJpzl83MjgyOcpI1Zwk4B
	TMzG49mDUaDEcRt5if10x+hXNmpZ/3RMR0SYiBH/LoX8SJg+MRG7n4rxiLp+QNT0kPBWGzczwMX
	pt5F/5sRCeWM2V9Lre1o7acLI02NuePwjmn6TIPrH6hTWLkP3fkQw3N07yk1xdm1EWA==
X-Gm-Gg: ASbGncv/FBdKh91084kqtrpuFGFGXvPi5cnVyLbTAjI1oR07yTFCvpo9Pt88phld+Qz
	6OXv2fNBmrdznDJxlcPoc7vsmog2xvUfD313WecZ3HSHpcQdDjOT9NzbW3EEbvCAvqwtWHtse4R
	pxtmjm5KmagSdPLSonBUDzsusauLK5K36lxvWhMOo3j90MnB0yWmqLL5PArlPbT+dS/n7qGChBg
	xkYGlYK6UhC6NQKFsDj4ysoP12uxjy4wpxuX6ToZMgn/2XGF9lHWfvavzuwTR4IQVcxsnzQDBxp
	1Mbpj6bBwW/HWw5SQE383KcFOsGASyhn6wzjVz/7hwrcvBSXtqzPPQ==
X-Received: by 2002:a05:6214:19e7:b0:6fb:265:a2c5 with SMTP id 6a1803df08f44-6fb23985764mr50853016d6.17.1749561170084;
        Tue, 10 Jun 2025 06:12:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWpUl5UmfIgKGDaJZjXVnPslFU8IB+su1QpZ8kf5RQSpb3U7fmC4kUy6BTQuOtse6w0v5xhg==
X-Received: by 2002:a05:6214:19e7:b0:6fb:265:a2c5 with SMTP id 6a1803df08f44-6fb23985764mr50852596d6.17.1749561169668;
        Tue, 10 Jun 2025 06:12:49 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25170615bsm696832285a.9.2025.06.10.06.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:12:49 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com
Cc: mripard@kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v4 2/3] dma-buf: heaps: Parameterize heap name in __add_cma_heap()
Date: Tue, 10 Jun 2025 06:12:30 -0700
Message-ID: <20250610131231.1724627-3-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610131231.1724627-1-jkangas@redhat.com>
References: <20250610131231.1724627-1-jkangas@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare for the introduction of a fixed-name CMA heap by replacing the
unused void pointer parameter in __add_cma_heap() with the heap name.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 9512d050563a9..e998d8ccd1dc6 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -366,17 +366,17 @@ static const struct dma_heap_ops cma_heap_ops = {
 	.allocate = cma_heap_allocate,
 };
 
-static int __init __add_cma_heap(struct cma *cma, void *data)
+static int __init __add_cma_heap(struct cma *cma, const char *name)
 {
-	struct cma_heap *cma_heap;
 	struct dma_heap_export_info exp_info;
+	struct cma_heap *cma_heap;
 
 	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
 	if (!cma_heap)
 		return -ENOMEM;
 	cma_heap->cma = cma;
 
-	exp_info.name = cma_get_name(cma);
+	exp_info.name = name;
 	exp_info.ops = &cma_heap_ops;
 	exp_info.priv = cma_heap;
 
@@ -394,12 +394,16 @@ static int __init __add_cma_heap(struct cma *cma, void *data)
 static int __init add_default_cma_heap(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
-	int ret = 0;
+	int ret;
 
-	if (default_cma)
-		ret = __add_cma_heap(default_cma, NULL);
+	if (!default_cma)
+		return 0;
 
-	return ret;
+	ret = __add_cma_heap(default_cma, cma_get_name(default_cma));
+	if (ret)
+		return ret;
+
+	return 0;
 }
 module_init(add_default_cma_heap);
 MODULE_DESCRIPTION("DMA-BUF CMA Heap");
-- 
2.49.0

