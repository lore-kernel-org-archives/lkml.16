Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF194293B70
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745340141; cv=none; b=C8sfFGTDfZQiV2x+UYucBF3rCHAScC8ThkG1KjvNjt7BzWC+JJ3kzznlxdVgAtSct+XyThjXPvdLZT2EpygdH8oX24Htl+pDxduOgMJB826or19ptJTK6gZEl9kPUQLaIFUEwPC8naa97D3SsqySEBG2SYuHWI/xOe6mzQhnjrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745340141; c=relaxed/simple;
	bh=sfBmd1OBbJI2abcZpauJWCnwwx49LFyiSAV6mfejFhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o5YHOXTtHsWAR+/c6Pxi0ebIHZcCaqG91ZRM2Ivwue+l8ZuNYOi9zgI7AZiwWuWwxwXsYDL1xRoh9NApE9f//gO7GCujKJy5E6PjcPkVbIdWZ2cCmPHN0l5Vnh2IwZ8aHtKU9FLODOd+25WmcuMRgpbn0XGAmyASvedOZfjFLcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nk+llupu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nk+llupu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745340138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DslNlnyYeBMO8E0a4QEwSeg6EwzYfoV0u5u9NaRMXyQ=;
	b=Nk+llupuYE2/Z1iEn+78im+9pJrLVjjxMlHiF4JtQUme0HNKPgdiNFQNLKiNo7IGN+0ZBu
	yRdOyI33BP5h2ODWmer/z4uKPQ4my/JLFo+It7Len+QeBJsWJ31TmBHy0reEUy1Uz0Gfkz
	Av1drl8YwhQ5xCV60u5wGIMII1zYR9o=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-_pBNP3nLN5yBXssSVsDG5A-1; Tue, 22 Apr 2025 12:42:17 -0400
X-MC-Unique: _pBNP3nLN5yBXssSVsDG5A-1
X-Mimecast-MFC-AGG-ID: _pBNP3nLN5yBXssSVsDG5A_1745340136
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ecfbdaaee3so95522156d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745340136; x=1745944936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DslNlnyYeBMO8E0a4QEwSeg6EwzYfoV0u5u9NaRMXyQ=;
        b=J/eZ35rs98pl5GCSA7lnoXae5ig+f2REuava4c+jlU2OhHrkjEeNeTum3BlXIvpeHR
         Db+o/VkDjH9vOIcqQwkdP/g1VizlN7K1x/NBKZcuznijqqsoZj1OwhXULYucm4euhU1Y
         dqcq9bB8l9VOkuIMvXxS7TPGU/IWIm8fM3eImm0uHH0vnhLlnjchUpSgUB/W/LQXVn02
         0qp2fy/N2g81an7ufe/DhDadiFG8hApoBJ1g6DAqbdqMtL3pb0I2zwRegXxZcPvWCXCd
         vIEYF8rq1CqcsJ+r10ttJubcO9FwxYLsydY+xJBwgI+zKVTCgpNbQBwjpF+kvx4vl6v1
         s4SA==
X-Forwarded-Encrypted: i=1; AJvYcCVFvNRbNC1CVgp1H+U/o3xWvggg3HCMiXf7B/yHqZlwwv5XttLc/WYDlUpLAA4G/AQeOK3Vmt9D97HzaCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNXmdSNVXYq9pYP0lHy7Hz080x0ZGnccstc2ZHBBCKluMDUuHg
	QfeFdTSzxmkH4gWGc23TAI/z/f/G23uD8yWuChjk3uxcVAda75o8z1i70qUd0+orX2/MLH1YFFx
	KIv7JcViM33suyX5LArJ11SOhoKsilcTMIMtoXb+e2yWxmuCz/C4Fl0N909n5Ig==
X-Gm-Gg: ASbGncuu+nVDmGH6juDSlAWOeFsAMAoiOtlUWcqG4BX/bb7UW4xFi4q8TTuXBCfG0fR
	6/lAu0nZa6renu8SENoiZ1BLaaQhuWRv6MzQVOSql3huL/Szv9+fPE+LgkTlsOvZrqAYqs8ylaG
	RtTEM2OrFM8xjM7By2BdICQYAPqY0tmlSIRrglXDM8DM9DPfyti1MHXUL3xkdaYLgihd6+toqNM
	Zsbd6HGsxc2JEIPM7k5lIb4FInUM50ai8HyC01OVXFA7z2o8o9RW6eGU/wgxF6H4r/gc9yz6rFb
	Rwv9fl1uHJYu9YOH6vJiOc0VcQVIsIj41/NM6oeh0H4=
X-Received: by 2002:ad4:5b83:0:b0:6e6:5f28:9874 with SMTP id 6a1803df08f44-6f2c45020bbmr281212096d6.2.1745340136438;
        Tue, 22 Apr 2025 09:42:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhkxVwuhOpuvq8AHrvgiI5QWqG6hL6givDMi15YOYCGirBK6AgyVMwswxh5i/TmbGi6XhlcQ==
X-Received: by 2002:ad4:5b83:0:b0:6e6:5f28:9874 with SMTP id 6a1803df08f44-6f2c45020bbmr281211806d6.2.1745340136156;
        Tue, 22 Apr 2025 09:42:16 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfd182sm59451376d6.80.2025.04.22.09.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:42:15 -0700 (PDT)
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
Subject: [PATCH 1/2] dma-buf: heaps: Parameterize heap name in __add_cma_heap()
Date: Tue, 22 Apr 2025 09:41:47 -0700
Message-ID: <20250422164148.547798-2-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422164148.547798-1-jkangas@redhat.com>
References: <20250422164148.547798-1-jkangas@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare for the introduction of a fixed-name CMA heap by replacing the
unused void pointer parameter in __add_cma_heap() with the heap name.

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

