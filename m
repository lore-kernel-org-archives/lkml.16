Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3122949F0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745340147; cv=none; b=Izak0wXJ7dQmxB+/7GE0HVn7uC4nOPDCYmNYmULXyNNgiBU0Lb+udWK7/Ptaux2cZ/NeDxaWX4X1dLRxleDPPGVNg578eiwGYgfSFFk/qCSHqAf+UOOdpAd2fof3AG1J0AN8dbwjGRn6enO1Naa3tZkZxE9FMUrBG1YkGMu8+84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745340147; c=relaxed/simple;
	bh=VM06un6R4IE2G9FmNC/1gf+872pzwD+CPRTaFlma6MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jmir101OFQYX3svZdmF7CSOBJukrGIxMnWM14LzYQyINLDEseiQzXk7g3AsPFVTRqhmltfM/rkBluJY50yLmOrwf/i8FzLx3s3Dzi2yCH5seu4j+piHIkUFNRryd7XGR7kVg3/PlwC/EKZkoH/3/XM6GRyV3LquWPeCRuCOJi9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MqbOsSas; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MqbOsSas"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745340144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Tmv3l4usOA2nic8/HFVk1c3fkYkDEF/+Vvfj6a/0Hk=;
	b=MqbOsSasZQChmEmB5EmacxHSX+Ve2e4FbXS2jZeQGjbMT9e56quHKL1DxbVbTfZ52v1yR7
	fDXX8hFA89UbMmga35XlG704TcA2RwqNExrrd9/2288ZCq7ec6kmPioGx16E+5gYVpb8Gc
	zx8q2dbjnY6DMosmV9VvdqeHqNPaklU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-N7oQWFarN1mF5KXVQ_C2FQ-1; Tue, 22 Apr 2025 12:42:23 -0400
X-MC-Unique: N7oQWFarN1mF5KXVQ_C2FQ-1
X-Mimecast-MFC-AGG-ID: N7oQWFarN1mF5KXVQ_C2FQ_1745340143
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5c9abdbd3so488504685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745340142; x=1745944942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Tmv3l4usOA2nic8/HFVk1c3fkYkDEF/+Vvfj6a/0Hk=;
        b=E2QU9L39m2bE8s5jhtkFldE2RUkoI6JkOEJi5VjkKkzKdQZG/P7dWq4r+Wq+dTQbs+
         I9UYIotCkhAFvrn5XN7iMqpg2ml8td6HzZuuZGSgaaEt3vqxrcXrS4T8zN8P1ycj61es
         KYe6EgT5x38kYES3HNPgJD/RuIEUn1Zp9clyplsTdYLQByjvnZ4NKntHjP+txo5WYqJO
         NkSOVYPLv2i2YT3ClgUbLrrWm75s5pHj6To+4iKVJxTUd/IpfrjPPCg6GuNkgu4THT4F
         mnh3TA+tF+GFCp5KoOV5dnElUF5J1DwesxR6ZVLqOUhpclMPDOym4J1j+MdEoJZHkO2j
         B1ug==
X-Forwarded-Encrypted: i=1; AJvYcCVTeJhy/LqPXXVDYC3r6iTQP06A8KUVAeeh6S1yJ7R2paJizAEIWOqdC8BkHmTEtIpwWpvvuKi9KW5m/N8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlitL17c6D6oNrUATo1I/CNawo2ryJMgtesNksoPkTfThpS3Pc
	v4ON+tj1vOTMfx2sRTiyQkULNlRivHQmUdyVjOtfr7LLK9Rs4Ae6idaiiINNUXSdC/JjyRvxin+
	AuO3HuTqcbXFUijguhbqcwwWjZBCIJ6NWOspnh8hQKBmdsWrB+oLPpyAL++Vg/olgL8jqWg==
X-Gm-Gg: ASbGncsYkwn3vIYKG1f9zpwk86iQcsztXh0TcBuoz8oO9BvwWtqHmGenmvF2x+6AOv7
	+k5PuqWeQpMCJa6j7VctZM/jLH983ehszqu+eHrL8UfSX414FPgH8zMeFKdRPYViRSyDIKhW9K5
	r/n4RYPIUa5dkRvHqsN3xITSU8NcSiFRYe40dO9NiKoiL0JR3tgOXC4m/0yB91ZPYacteSJGNTj
	55rG2O27EP+n4FSddb9KLadosfgJ6ZGJ5t4hBsVyoWY5Fzcz8cKx4cWOxSniZvbdcGO5e7Y1WEa
	Yee669lYzCBD4ccHAxbT+0Gbi7umnF8lFV4X6LDdTtE=
X-Received: by 2002:a05:6214:c2f:b0:6ea:d604:9e49 with SMTP id 6a1803df08f44-6f2c464071amr310346406d6.34.1745340142534;
        Tue, 22 Apr 2025 09:42:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+ZRP1lhsHeFU6VqIk73sz8A2RHJZCwagmzI5I0mu0qrXjlrLozmeOZJ/CtBIvPj+DfegBnA==
X-Received: by 2002:a05:6214:c2f:b0:6ea:d604:9e49 with SMTP id 6a1803df08f44-6f2c464071amr310346026d6.34.1745340142119;
        Tue, 22 Apr 2025 09:42:22 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfd182sm59451376d6.80.2025.04.22.09.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:42:21 -0700 (PDT)
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
Subject: [PATCH 2/2] dma-buf: heaps: Give default CMA heap a fixed name
Date: Tue, 22 Apr 2025 09:41:48 -0700
Message-ID: <20250422164148.547798-3-jkangas@redhat.com>
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

The CMA heap's name in devtmpfs can vary depending on how the heap is
defined. Its name defaults to "reserved", but if a CMA area is defined
in the devicetree, the heap takes on the devicetree node's name, such as
"default-pool" or "linux,cma". To simplify naming, just name it
"default_cma", and keep a legacy node in place backed by the same
underlying structure for backwards compatibility.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 11 +++++++----
 drivers/dma-buf/heaps/Kconfig                 | 10 ++++++++++
 drivers/dma-buf/heaps/cma_heap.c              | 14 +++++++++++++-
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 535f49047ce64..577de813ba461 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -19,7 +19,10 @@ following heaps:
  - The ``cma`` heap allocates physically contiguous, cacheable,
    buffers. Only present if a CMA region is present. Such a region is
    usually created either through the kernel commandline through the
-   `cma` parameter, a memory region Device-Tree node with the
-   `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
-   `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
-   might be called ``reserved``, ``linux,cma``, or ``default-pool``.
+   ``cma`` parameter, a memory region Device-Tree node with the
+   ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`` or
+   ``CMA_SIZE_PERCENTAGE`` Kconfig options. The heap's name in devtmpfs is
+   ``default_cma``. For backwards compatibility, when the
+   ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
+   created following legacy naming conventions; the legacy name might be
+   ``reserved``, ``linux,cma``, or ``default-pool``.
diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c42264..83f3770fa820a 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -12,3 +12,13 @@ config DMABUF_HEAPS_CMA
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
+
+config DMABUF_HEAPS_CMA_LEGACY
+	bool "DMA-BUF CMA Heap"
+	default y
+	depends on DMABUF_HEAPS_CMA
+	help
+	  Add a duplicate CMA-backed dma-buf heap with legacy naming derived
+	  from the CMA area's devicetree node, or "reserved" if the area is not
+	  defined in the devicetree. This uses the same underlying allocator as
+	  CONFIG_DMABUF_HEAPS_CMA.
diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index e998d8ccd1dc6..5533420d566b0 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
+#define DEFAULT_CMA_NAME "default_cma"
 
 struct cma_heap {
 	struct dma_heap *heap;
@@ -394,15 +395,26 @@ static int __init __add_cma_heap(struct cma *cma, const char *name)
 static int __init add_default_cma_heap(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
+	const char *legacy_cma_name;
 	int ret;
 
 	if (!default_cma)
 		return 0;
 
-	ret = __add_cma_heap(default_cma, cma_get_name(default_cma));
+	ret = __add_cma_heap(default_cma, DEFAULT_CMA_NAME);
 	if (ret)
 		return ret;
 
+	legacy_cma_name = cma_get_name(default_cma);
+
+	if (IS_ENABLED(CONFIG_DMABUF_HEAPS_CMA_LEGACY) &&
+	    strcmp(legacy_cma_name, DEFAULT_CMA_NAME)) {
+		ret = __add_cma_heap(default_cma, legacy_cma_name);
+		if (ret)
+			pr_warn("cma_heap: failed to add legacy heap: %pe\n",
+			        ERR_PTR(-ret));
+	}
+
 	return 0;
 }
 module_init(add_default_cma_heap);
-- 
2.49.0

