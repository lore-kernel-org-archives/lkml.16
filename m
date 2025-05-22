Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFDE29ACC0
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747941297; cv=none; b=kSpOgOPDXgcbyexgVuWbGoNv9JpG7EFYBQdBBE08H0zC6kMSYaH/Hu+hW0k2Q1VbTaVMFw/jPuBJsoE3HPPdnaTsey/PdFQ1q07FpYGxjaLxXx2pXFXi86HZA65aHkq4ZSvF/4598ibUdNtLERu/RIe2n/FY/6Od21AeJPBZl0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747941297; c=relaxed/simple;
	bh=sfBmd1OBbJI2abcZpauJWCnwwx49LFyiSAV6mfejFhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bwBn223ZjPepOgMWejStYNfTqlO8C17Jc51+wj5stwYggEgzsKDPE+MgpCorIfQxF37YytHsyzgryT7xnxBoXGWi1FSQr47MQaUIoYQkDQEsjL2c5TP8E7ObSaeTkTil5oauwBbmM0/b8b7VDl/TeTAj4JeX5MzL8qWF5pXPPsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BJARz9EB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BJARz9EB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747941291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DslNlnyYeBMO8E0a4QEwSeg6EwzYfoV0u5u9NaRMXyQ=;
	b=BJARz9EBv9wdayT4HHRjAoPCnyox5xzJGuuummINN/Lac68j6vtM8EJZm3c1kjYmS81RiF
	MyTTs08w1D8aydsQrjMAq8NzBLZYyct8pe6bWOU025TlgX3VMsAKJjn0j9DrUhQGUkCd6Z
	IkjYN7HMAmm7mWQi4rII6aOjTvxEYkA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-t2vtzQAJPuiy1yAauxiiiQ-1; Thu, 22 May 2025 15:14:50 -0400
X-MC-Unique: t2vtzQAJPuiy1yAauxiiiQ-1
X-Mimecast-MFC-AGG-ID: t2vtzQAJPuiy1yAauxiiiQ_1747941290
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fa8eca6910so9571536d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747941290; x=1748546090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DslNlnyYeBMO8E0a4QEwSeg6EwzYfoV0u5u9NaRMXyQ=;
        b=rya6CXwD7ka07uBOPG+CXrfMLR4d7UTXCdnX76hg8OaFbxDHLuyCjUlZ93DgC8xcEF
         5yjWNLAdT7H5/mKKvgXEGH3LdAD5V0pf3FUaa/Jqko2zX5ZSWlPNBkQ89DSrg5FJnAS8
         GICyaFG38uoIBJmH55Uj6ZMa3AkRcgVhesUDaZniObFzYe30hOEwAy8x2EdRkHoFVo5f
         b1ulhKpzkEKDiMwLTurVmq/gckODwld0MD3uuJuyeW245YIXmdvEMblbjYRa11peLPR8
         z44eD8xeLTQLRD5qaaLQgWaoj52oT/I1lt/hTII7jiYmH59jr92HCY8POQt3QzfrKbQK
         yw/Q==
X-Forwarded-Encrypted: i=1; AJvYcCULFGZDRPipIi98RZ077oUHcNLhnxUCJi8Kx8cHYbyPIBVfkr8pMVO7KclnzyTFRQLTZS5sPJtI3hCk1O8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUNFsTAeiWfK9Wk585+D4C7z/ctjjRW2tqWxnlUUzv1xP75HO/
	z0WV2nT7tIHgK6bIFHPjigYUTqnIJ1bDmt4zWDINy68HiL4pquJJonsmHJtlgZuQpWfFDz9FMCe
	EjNWxvfA2PFoTjrdqU6OQrxFrD+wX+5vAcyUus5zl4IRzIno4s8oj5n8YlSwGKqgwTQ==
X-Gm-Gg: ASbGnctqMfpqS2T3Z4fbiZGNnPS8li+z7VqKjsUxzqLaB3RJCfwBQknrm4bUCJOpFkC
	ADWtD0rjFil1GNp2Aw2zWIskFJuykTJ3iTZGE10IAeKVNLJCrFUK2z/gq9Z1DOe5SoILzNwyvTr
	EpJpitjVUojrWbmI72pbkTAvgxfjRQkp7G8LcRQ3LpDCOYa5MzmgZIhhOvMz+y8omzxxTGpPN1b
	/oziU3LUZvqQU7jLP2W0ChteVEcTKvlSVWZ/AZyn+Yq5vtC2/dzUhhgk3G8pzRoz4yyrRr0R59W
	DiIo47NEiXVh2M593t9KsoFRRtmhy9MRYhs7UdZ28aw=
X-Received: by 2002:a05:6214:d03:b0:6ed:12b0:f181 with SMTP id 6a1803df08f44-6fa93a3329fmr5223866d6.14.1747941289866;
        Thu, 22 May 2025 12:14:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUDT8yQqi4n4RTYXy8azlp/sJFJlAyhLHZ60JNEKpweDC9ye+5j/Kk6h96Y/dCMxu9PAXk8w==
X-Received: by 2002:a05:6214:d03:b0:6ed:12b0:f181 with SMTP id 6a1803df08f44-6fa93a3329fmr5223506d6.14.1747941289482;
        Thu, 22 May 2025 12:14:49 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08ab862sm102862916d6.38.2025.05.22.12.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:14:49 -0700 (PDT)
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
Subject: [PATCH v3 2/3] dma-buf: heaps: Parameterize heap name in __add_cma_heap()
Date: Thu, 22 May 2025 12:14:17 -0700
Message-ID: <20250522191418.442390-3-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522191418.442390-1-jkangas@redhat.com>
References: <20250522191418.442390-1-jkangas@redhat.com>
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

