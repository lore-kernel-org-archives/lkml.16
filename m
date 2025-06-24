Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C142D23AB
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772381; cv=none; b=UPeIHakxvrYNHVORejYLXypAY0m0+O6QqftSAWsviPiIiy2ciKUcuxquk95cioRNWYh4LXPpYpIT7szo2IZDRLQiXOJYQ0H42XHfz4a0nb0JhbBcP5XyPEoevKdrMcQEzaDWtuENO5LKoWE/6mpWfUHsm1pXiR23LHFhxW2Svdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772381; c=relaxed/simple;
	bh=E+REAvkImx2ZVSFP5+sd6SOFCvTY9h9klgMb4XpdM7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXtXEPkEon5aST1N8QhhwYzQ/fc7ilNCWvtnSFTf33kK6+OuXw8ylZ+dx2OgPfPdiickboTAG97WtbFTm/eA8iuLYk7xjTsrqxuko7Tsb54s2fX9kTFZ3df08kLBtHGS91iion3AiX3Tbzv0OPUTS8eupb4QkyyrVtWE7jHSPoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UBUU6j6n; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UBUU6j6n"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so946229f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750772377; x=1751377177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmoyTuVu4akx78qVJi6bTRvxekKYdC1/i6FSJLO9Fsw=;
        b=UBUU6j6nnj0Szuf+M8JmLAdrdrvLDpUMOep51yQcUkVPSSEFhm0wnxXGzFXsCUAufN
         kC4q9SY56+F7jLweMWjBok2iBzFGAKt1yniQY9YOiaOlJw+ZpWOILfzqlOB6bBks5oJD
         LdQy6gX6S279rUG6QjjawM/Ptq5fDiRRiw+LYdEBxuORU7EvnNFd4wDBFVEGwimlPZyD
         YPUB9ItUV9+bYfLEziTsZx5jpfq/tBePGtUUQILJacefOVpjbUV6jOrdRR874ykwUzyO
         +U0xiJHcA2hAVQ+XWf6enxQsST1o9JhEwverGcuC+IucjoPSNwxUa0uEWASm/FeQn9OI
         J+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772377; x=1751377177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmoyTuVu4akx78qVJi6bTRvxekKYdC1/i6FSJLO9Fsw=;
        b=Rvuydl7IcfgGr3ybjDWwQ0GP2CcSM4vvHCZ3e6/7l1wTHIK5JPAltUtRG1CPrIA8aX
         nKU50FCJi/xBenNF4mulzYfXm4ZxpCpy2ZpiUTs8K+HR7+aMXbJAXBVY7elA85mVXY+n
         gquwWjHAu7K8jQYxJeg7UOr88ga1GFg34uAsbDmIMfJxxdzhuufZuI9GyT0RUi9q2Ygv
         mlsUwOfKDC/w2kLEZFz+xF21YCW6cQxVjsjNx5Th+GmmeFUYjpogQ1mVwpeSr0xxayaJ
         oGUry6MaBIJY9sXUeeiKXGlkwASBzK4BK2ugrUFzCwgDxgC97Bey6L2sbIGF/Xl5XRVz
         +Z0A==
X-Forwarded-Encrypted: i=1; AJvYcCWjMVnG8eQhXHfQ++BD3U05Y8M4Z29lpYlRWQkURB+PB7464TzwN/ce4HwU+c8QC2bJCebXN8xQhzvy3tI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNaZafYyum2a956Jq6HCGKDW9+KOT2LeZTUYofcCh7YFs8MQXs
	EWhuM/aY25rHfJGfPodrtNBwwTjqb7VkMbXnup8/bmCVCrIqQWC7lEFjxFDPADF7ZzY=
X-Gm-Gg: ASbGncuz0byTw07JD6IlgwVeciV4rK6duiOw+o6yeRpFbq0WhFxvujsulbTKdf1Wh7w
	YYSQXMMApPL+fFWlSOGwbnHE+LBxJF5fhOFAXLtvRjhDZyabMDzctwZ59N/ruS09KmAWocxCE45
	FhiY1WZHNrUhsEBPAW1JG5h59iCL8TStGfYLGQ0wcdlySsOA2P+tLR/cqcTTCsB2AtSv0tpbC0a
	6W8X8eRPBeUCd18e53AIUQwWFoOdDNzE+cjxASyqc+4PweCz97/7b9C24bDlIiOTx9XGkLmE6XD
	cKmJ41DTVwPKpMDiMWPGuBBIR3+7bTH55kMsPZHsUauDWFaCoaElxZYikyJM00wn9eeGdFMxikd
	55tUSicKw1sKI+wy4/m4kx2U8wiaHyfRg0e3RAjB9+6TZ/Hqungqo
X-Google-Smtp-Source: AGHT+IGkZrplpRBlcgMXcjw1DbH2uA7Xgft+a5isw/zKi2IcP2PXv5geqjz1FHC5se+KenSl4WGZcQ==
X-Received: by 2002:a05:6000:4412:b0:3a5:7895:7f7e with SMTP id ffacd0b85a97d-3a6d12ebe7fmr3683192f8f.15.1750772376600;
        Tue, 24 Jun 2025 06:39:36 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a6e80f2274sm1961890f8f.48.2025.06.24.06.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:39:35 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Morton <akpm@linux-foundation.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leon@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Sagi Grimberg <sagi@grimberg.me>,
	Jens Axboe <axboe@kernel.dk>,
	John Garry <john.g.garry@oracle.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT),
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH 6/8] docs: dma-api: clarify DMA addressing limitations
Date: Tue, 24 Jun 2025 15:39:21 +0200
Message-ID: <20250624133923.1140421-7-ptesarik@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624133923.1140421-1-ptesarik@suse.com>
References: <20250624133923.1140421-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the description of DMA mask from the documentation of dma_map_single()
to Part Ic - DMA addressing limitations and improve the wording.

Explain when a mask setting function may fail, and do not repeat this
explanation for each individual function.

Clarify which device parameters are updated by each mask setting function.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 Documentation/core-api/dma-api.rst | 35 +++++++++++++++---------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index f7fddaf7510c..cd432996949c 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -90,13 +90,20 @@ description of the DMA pools API.
 Part Ic - DMA addressing limitations
 ------------------------------------
 
+DMA mask is a bit mask of the addressable region for the device. In other words,
+if applying the DMA mask (a bitwise AND operation) to the DMA address of a
+memory region does not clear any bits in the address, then the device can
+perform DMA to that memory region.
+
+All the below functions which set a DMA mask may fail if the requested mask
+cannot be used with the device, or if the device is not capable of doing DMA.
+
 ::
 
 	int
 	dma_set_mask_and_coherent(struct device *dev, u64 mask)
 
-Checks to see if the mask is possible and updates the device
-streaming and coherent DMA mask parameters if it is.
+Updates both streaming and coherent DMA masks.
 
 Returns: 0 if successful and a negative error if not.
 
@@ -105,8 +112,7 @@ Returns: 0 if successful and a negative error if not.
 	int
 	dma_set_mask(struct device *dev, u64 mask)
 
-Checks to see if the mask is possible and updates the device
-parameters if it is.
+Updates only the streaming DMA mask.
 
 Returns: 0 if successful and a negative error if not.
 
@@ -115,8 +121,7 @@ Returns: 0 if successful and a negative error if not.
 	int
 	dma_set_coherent_mask(struct device *dev, u64 mask)
 
-Checks to see if the mask is possible and updates the device
-parameters if it is.
+Updates only the coherent DMA mask.
 
 Returns: 0 if successful and a negative error if not.
 
@@ -171,7 +176,7 @@ transfer memory ownership.  Returns %false if those calls can be skipped.
 	unsigned long
 	dma_get_merge_boundary(struct device *dev);
 
-Returns the DMA merge boundary. If the device cannot merge any the DMA address
+Returns the DMA merge boundary. If the device cannot merge any DMA address
 segments, the function returns 0.
 
 Part Id - Streaming DMA mappings
@@ -205,16 +210,12 @@ DMA_BIDIRECTIONAL	direction isn't known
 	this API should be obtained from sources which guarantee it to be
 	physically contiguous (like kmalloc).
 
-	Further, the DMA address of the memory must be within the
-	dma_mask of the device (the dma_mask is a bit mask of the
-	addressable region for the device, i.e., if the DMA address of
-	the memory ANDed with the dma_mask is still equal to the DMA
-	address, then the device can perform DMA to the memory).  To
-	ensure that the memory allocated by kmalloc is within the dma_mask,
-	the driver may specify various platform-dependent flags to restrict
-	the DMA address range of the allocation (e.g., on x86, GFP_DMA
-	guarantees to be within the first 16MB of available DMA addresses,
-	as required by ISA devices).
+	Further, the DMA address of the memory must be within the dma_mask of
+	the device.  To ensure that the memory allocated by kmalloc is within
+	the dma_mask, the driver may specify various platform-dependent flags
+	to restrict the DMA address range of the allocation (e.g., on x86,
+	GFP_DMA guarantees to be within the first 16MB of available DMA
+	addresses, as required by ISA devices).
 
 	Note also that the above constraints on physical contiguity and
 	dma_mask may not apply if the platform has an IOMMU (a device which
-- 
2.49.0

