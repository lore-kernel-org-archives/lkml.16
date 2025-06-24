Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921282D23B2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772381; cv=none; b=PxKS1zSYw6aBc0laEepv2Bm3CxJPIytHogg5PcDkjQytrOdD3QAKRxDuhAYF2UE7aRaH3Vmv/7akZjW6JezBQ6y5tbngA0YOO43JkflbsCiHkx6HaWaU73UTniVafLvfiTcVp+VE5AGe+NCyOVd/s1knoTrP8AtAH3MGt/S4cfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772381; c=relaxed/simple;
	bh=csFIrfXy0fedNjjmAddrddMk/Vqb6fR+cfz6pIU/Vd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gGy1HiFW0yWcJgzvSHJuAHqWwscLHp+hvTtX80wMggr8RBDwjwx1VUBWoK4c1PZ7YiH6IAPNWnJxjPxyHDFcUp21vmUcm4rk6t+y8ssBNMUXtL7goFHFg2DH898MnoQoUjSNzzUIc+Yk90rZ61doJu99zFakSK4tFYi8kYfkOkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f4tyvbx2; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f4tyvbx2"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a528e301b0so283421f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750772378; x=1751377178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIxqpUsJs9BGJgIKtRsM8twkmF7DXFUM7UQBjMXgiB8=;
        b=f4tyvbx2EL05OH4YlSJFuhpYGb+NE9wRaMAYGctPhke4zkdkb1Zp5zrka1OHb2nq25
         ZFbbIZi9YdHbgRukaIiy1xQnzXbmXixxY7VNZ/aqHk3i4WNgmaAoIfKtDD115cXsAg8C
         FWOMPMIqNt2P2rEwEHHrS1LqF7MvszrUv+XrTOsg0RJt/3tHMLLUfGEghN6J6FBoKh5m
         4wNhPGn7Bru60IhC2wYPEVYgMluXsMvqT/3bGdBx4tAbTuf3bj36ulI7OdeH3j495j3a
         CwaDDWwOnwCdHgih+0GFWXL+OwzgJ6LvvinTGG7pcZBEzFEY6xoiDkFh14apxLCytZwF
         Qvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772378; x=1751377178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIxqpUsJs9BGJgIKtRsM8twkmF7DXFUM7UQBjMXgiB8=;
        b=JAIZe81Z+woG0HbkYI3nIDE9Zen5tRUvTFyHl5Zeen6PAmQEmDvIyBqiqbWtt8MGYw
         lMBwLzKKWzsyEZ9CUGpX1Mk3mlV5n0sFXI5Y1/CTiqSPtbdGfIpm8f8Hg5WBimlKmgYO
         mEkmBwx6QFaJQvNSqXXT6BjE6K1kiIoVCFlzcmcCxUfH1UyP0G8ddwNX3o7JBoGY6rrB
         Iu3dkbTOSLVqwzC8TejHLymZfXdVVCdYRM3jr4c6ztuYaL2QyxKUFBKf53deIfNEj4qR
         vPThHPPdoAzn2l7OiAQe4toRj16hxSIqttCBMSXRx0jbcmJlIMZFIbqahibsSoVbuvZK
         g21w==
X-Forwarded-Encrypted: i=1; AJvYcCUw34pUO0sD4pHmrYOkZZ3d6/aOH4y8ClXM9CFbChMZ21GXTPrCuAxSX+TM1qMsnLlwnj4x1t9FGbr2Rn0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4lRU2aSuIkmNVrAFHm47T2OMYKgMCuEprqYfCELNYWkFS5Z7N
	p0ArLaSrMxmt5Z9VML8JrpzkTQzeTOrtXV1rq0WuTYxc5piZIEo3kh7dMieEBJa4GfY=
X-Gm-Gg: ASbGnctRQZhe2rTrwiNuNKtB0dDBDqxCCm6k4IbiuAV1michbcy8EMXexL0wG18BMIO
	Z1Czj4RHIY3nC5uTmWve45su5IdNLdVp4uv886Q0OICTPXJCOK1S+1NruyUneM2R+/bM1+VJADg
	s5wO7ssVtsKFr7mtFsoLOlNW3UKYwRVXLxROsomg2dCv+7TgtrXmdq8w+WDOhcdJKIXjDcGjUsF
	wBNORqh7ODR2DN0oq5u1k4RK0ITP5TkEoPE1XApjaiqOSXfBEUvrq4Q2ywuvhM/PytBI55U8JkO
	d1U1oobQTWuE+/EZZdliMII2biieBQptxH090ZXC63jkO4Y8ixB/LVc9Dc4kH1HTWQCzbN5yaDB
	Eid3WfMgBa5VSd+45k81xZgX5IF/AFr+oqYE+qCQ1AEgkkX6sZ3+f
X-Google-Smtp-Source: AGHT+IEjaxkBLFq2C7HKp7UXXzPUtMdjdq0jQWl+WGokmC3baJpMc/moJUhdPmwtbE7N5mn13G5tFA==
X-Received: by 2002:a05:6000:2013:b0:3a3:6a3f:bc61 with SMTP id ffacd0b85a97d-3a6d12f9a28mr5299380f8f.7.1750772377699;
        Tue, 24 Jun 2025 06:39:37 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535eac8e19sm175942315e9.21.2025.06.24.06.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:39:37 -0700 (PDT)
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
Subject: [PATCH 7/8] docs: dma-api: update streaming DMA API physical address constraints
Date: Tue, 24 Jun 2025 15:39:22 +0200
Message-ID: <20250624133923.1140421-8-ptesarik@suse.com>
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

Clarify that SWIOTLB also allows to use any physical address with the
streaming DMA API. Remove the requirement to use platform-dependent flags
to allocate buffers for dma_map_single().

Do not claim that platforms with an IOMMU may not require physically
contiguous buffers. Although the claim is generally correct, it is
misleading, because the current implementation of the streaming DMA API
explicitly rejects vmalloc addresses, no matter if an IOMMU is present or
not.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 Documentation/core-api/dma-api.rst | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index cd432996949c..65132ec88104 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -210,18 +210,12 @@ DMA_BIDIRECTIONAL	direction isn't known
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
+	Mapping may also fail if the memory is not within the DMA mask of the
+	device.  However, this constraint does not apply if the platform has
+	an IOMMU (a device which maps an I/O DMA address to a physical memory
+	address), or the kernel is configured with SWIOTLB (bounce buffers).
+	It is reasonable to assume that at least one of these mechanisms
+	allows streaming DMA to any physical address.
 
 .. warning::
 
-- 
2.49.0

