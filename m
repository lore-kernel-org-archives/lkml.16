Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A072C324E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019040; cv=none; b=fO6I/76q5N/547AYA5MQe0BQ7Q4Q+kGKpIB2FMVM6HYWbe2a8+CJK3+0pneOjJ7mpxrv0EQCZqvMRdkMi75BhiFxYO/stsMbjAhqW5kElCmn8OPDvo9WGk9urTGxk9o52a1ijQ9gBAzx1ngRwLLWlFjF9YjCiYY/129cXjbLEfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019040; c=relaxed/simple;
	bh=3+ynpMQcTjsyaLFunYDi9YC+WhFUge4SSY1Ra3bgnMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IYsfg2+P25VcOwaR8u+jimtAgQFIPa1N6CnREHNAB5WwC+JXEh+NpRWnVWJhldyAt3+PqFyg1aN98A1tHQIyLcLxDcazLMFYhlW3fhg0C0gN3qWqHpjpSx5jDHOX7GZihCPITvWejdVCr7H6R9vstaLz7soQnoFpFX4Ahz5r20k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EVzt5GoG; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EVzt5GoG"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4f64cdc2dso304348f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751019037; x=1751623837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TquI4kf2LD9Vztrqxbozxq9qf65pOiNFo4XcEnHd+w=;
        b=EVzt5GoGtp0EtE8oNXa5V2RADS61+7/7l8TNxCCpEPdDo4xuV7S0cegYEn6Xz8wlgF
         GyhVzrTIkhkIvrf8ZHs+2WbQvFYcQ0rkfcXNc6VddN+j5vWFV6wJ5y0wcRBU0XSQY7gf
         hFarfWd0q87GAh8hjqSv4vPKi/Fq7a2EnH0Fjmg0bxNWokbYzxIbbtlzO/AsP7lD93KV
         +h9MUpsEUxN4XDhKyuyLQurZQH5tfu3yEs1M0BLpXphkqY0RfyN6LGF0n0h+YijpPjK9
         MMkwdsoG0s8WV9MYk5Hz4OsI3Or3YoRsEYiTP3ZQFxebB+47/2njFeFASpkFyx00lMh7
         zKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019037; x=1751623837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TquI4kf2LD9Vztrqxbozxq9qf65pOiNFo4XcEnHd+w=;
        b=A9MBY4ZQcQSFeZJmMtfPLjn4mgzGSBiTY3LY1RbqMjxingrgsmqi9xKDSonMVHgNIj
         WlojSSOJBsfaXHDXfCnsmH7u+sM5Ne0nGnAyRuRzRYSvlP14yhaUbAhYfyo9gSOA0pBU
         pPM5UTi7AmCfy22h/MrAIRpNtjfSJXrtukPZBEhxTwGowSgLODU3NEBJVd+wCHceJOBj
         H+rrIbAYrbkMrsaQJqKY8sl9sy5+btAiE26yyBz0YEPT7hpBqJ0owyjfhlY7ZJnxp9dF
         a1moYm/NqwUJ54Y8kt9DUKij8E4wwzg/N+WxNDR/uQ00AfsDUMRj/pnqYDF15WHdq4SJ
         n02g==
X-Forwarded-Encrypted: i=1; AJvYcCUQVjflSro6UBxeyn7UjVUU/JhJT8vCUrFjNobwg8XNoOoCJN/KWOPgMacPvLkr73n2w6WYnzEo4z0baPo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3plEvSVyeC+IVKuxDrYvM+jg+Jw/E6+VG1XeAgC7fSMSbo99i
	XrJ8EiHYl6xjrCXLjzVHT025FaaA6z9cqJYiowqCIDBx9z90kBgwmm/81PXFKohFj1k=
X-Gm-Gg: ASbGncurkfByitqdiC8KqvEsR3LH32jNOe/UhQA2VQt/TngDxwrMJXgKo0hQd/hxB+M
	l70SL6KUuk2Y0vX0iK2LK7Kh2v/PEwt4IDsKVSZTW6pkz6WAxg8l8qAqBtXvUeRLPbbPW8mNtbM
	99WCUN+we6F2rW3nIU/g2itw2bOaoYCoE/TidV6KDT1yuX9wNdvAkQerlk34j0nqFm29J+cojqa
	4v1+kwSnI4ACVNjExxgqVeoC7pAKbhq1XvCAtEM1cJTSLIxxfV3m+XfYAYL8JXwHCNltDT7wCwP
	I27eBuHtyC1CGu9Oi5IXPumj45+TlxkfoMbbEF2dFF8oRAFhvdSsXBv/ijc84roUKdG4tDYVcEr
	AxQVFRCTswsdRVKpgbdNl//j0qzsuvxc08eBBK2aBV78dgXN2AcsT2WdsgH9EDlQ=
X-Google-Smtp-Source: AGHT+IErhL/Jp/Zzw50DopSUtmqu7kBNtcSnX1TVkRC2/Elb7ZST13WhfXT1w6C3WIxy5rXTNtnoKQ==
X-Received: by 2002:adf:b652:0:b0:3a3:6e85:a550 with SMTP id ffacd0b85a97d-3a8fe1dd5ecmr831103f8f.5.1751019036624;
        Fri, 27 Jun 2025 03:10:36 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e52a26sm2290796f8f.51.2025.06.27.03.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:10:36 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT),
	Petr Tesarik <ptesarik@suse.com>,
	iommu@lists.linux.dev
Subject: [PATCH v2 7/8] docs: dma-api: update streaming DMA physical address constraints
Date: Fri, 27 Jun 2025 12:10:14 +0200
Message-ID: <20250627101015.1600042-8-ptesarik@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627101015.1600042-1-ptesarik@suse.com>
References: <20250627101015.1600042-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an introductory paragraph to Part Id - Streaming DMA mappings and move
the explanation of address constraints there, because it applies to all map
functions.

Clarify that streaming DMA can be used with memory which does not meet the
addressing constraints of a device, but it may fail in that case.

Make a note about SWIOTLB and link to the detailed description of it.

Do not mention platform-dependent allocation flags. The note may mislead
device driver authors into thinking that they should poke into and try to
second-guess the DMA API implementation. They definitely shouldn't.

Remove the claim that platforms with an IOMMU may not require physically
contiguous buffers. The current implementation explicitly rejects vmalloc
addresses, regardless of IOMMU.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 Documentation/core-api/dma-api.rst | 36 +++++++++++++++++-------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index 9fcdb160638e0..a075550ebbb54 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -184,6 +184,26 @@ segments, the function returns 0.
 Part Id - Streaming DMA mappings
 --------------------------------
 
+Streaming DMA allows to map an existing buffer for DMA transfers and then
+unmap it when finished.  Map functions are not guaranteed to succeed, so the
+return value must be checked.
+
+.. note::
+
+	In particular, mapping may fail for memory not addressable by the
+	device, e.g. if it is not within the DMA mask of the device and/or a
+	connecting bus bridge.  Streaming DMA functions try to overcome such
+	addressing constraints, either by using an IOMMU (a device which maps
+	I/O DMA addresses to physical memory addresses), or by copying the
+	data to/from a bounce buffer if the kernel is configured with a
+	:doc:`SWIOTLB <swiotlb>`.  However, these methods are not always
+	available, and even if they are, they may still fail for a number of
+	reasons.
+
+	In short, a device driver may need to be wary of where buffers are
+	located in physical memory, especially if the DMA mask is less than 32
+	bits.
+
 ::
 
 	dma_addr_t
@@ -204,27 +224,13 @@ DMA_BIDIRECTIONAL	direction isn't known
 
 .. note::
 
-	Not all memory regions in a machine can be mapped by this API.
-	Further, contiguous kernel virtual space may not be contiguous as
+	Contiguous kernel virtual space may not be contiguous as
 	physical memory.  Since this API does not provide any scatter/gather
 	capability, it will fail if the user tries to map a non-physically
 	contiguous piece of memory.  For this reason, memory to be mapped by
 	this API should be obtained from sources which guarantee it to be
 	physically contiguous (like kmalloc).
 
-	Further, the DMA address of the memory must be within the dma_mask of
-	the device.  To ensure that the memory allocated by kmalloc is within
-	the dma_mask, the driver may specify various platform-dependent flags
-	to restrict the DMA address range of the allocation (e.g., on x86,
-	GFP_DMA guarantees to be within the first 16MB of available DMA
-	addresses, as required by ISA devices).
-
-	Note also that the above constraints on physical contiguity and
-	dma_mask may not apply if the platform has an IOMMU (a device which
-	maps an I/O DMA address to a physical memory address).  However, to be
-	portable, device driver writers may *not* assume that such an IOMMU
-	exists.
-
 .. warning::
 
 	Memory coherency operates at a granularity called the cache
-- 
2.49.0

