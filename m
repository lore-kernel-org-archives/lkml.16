Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F5A2D052
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743699372; cv=none; b=t+zDER6HPgdjAREMoYcLyFmWrimSzgeKUgSr/aumE18JkV3gfvzLPFl8xvO65+gkC0J+0+qKgnWa/6/m9KVJgT7rLiV5Uo279809cz5GDHuKYZ3yaUvgi7KeQfRvYPQ/62vP+c+8cohquqD5hKl7TMs0AHLRyUFEtX71fE446Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743699372; c=relaxed/simple;
	bh=fMPFmuCz+4umhrbdsLhmwvjvyCDs7GQHqN+lP7Mqa60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EbnANa0tU+S4JTCNRHUSrXzcunF/4TTzZgA77vohZix49MKUBPDUxgrZ9QvjvnZNEusTZA9xFJTQJQJ8ZPzPSzoBggeLJBLcllLr0VsNejeoZ0qu79iwg6GbpWUam1blFY0VuOLwV9A0+9ZdmmdIJaJi/QZSfEhV6r5AIXXA0hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RNLcd52w; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RNLcd52w"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so508085e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743699367; x=1744304167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nws//u3rgDvjuf/6JSBp7e6LmW215pjitpAR2uf3QY4=;
        b=RNLcd52w0m0/sz5S6fyutKW1iUwQQChOdXSvRC5KMYRCFbPDnPFEOWsLcKmgDcLQfZ
         QvCqq+xf9GR4OtaRokgXfatHEUihVwiGkE2BAi90FApZa9LQL2T45h/uvdyXOXnsRKfR
         cwOtUyZW6tkqBRMMWY6qDjaoxlPv7DyNbQSiUn2GxdMup+RF7iYTDXYQnaUSt4HEU5Xz
         2usvscEjsaNuyU6YW4BAWw2NqPRtyGHj0sH10aTCj/UyzAMXcn9VX5zEEJsr63ZAgbGy
         JptIs55Ihws3/K2QSPzd+VYPocK60/2MBgl4EYZO+R6nxPb06L1IAp0/vO8Z5Z07da8t
         VgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743699367; x=1744304167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nws//u3rgDvjuf/6JSBp7e6LmW215pjitpAR2uf3QY4=;
        b=t3CiWyHV7veQXMeNCE42Tdvie0fL7BjYNU5U8eLDTLlYX6c3I+YSP6YzVHTVGu/qAU
         w6l92IaID1qDz9pV0m12BIuwohcDrbk9oYL6QySddVBgX6sbK2dNUbdZzkoXOh213r9/
         fEg+6OJfw32n4ufNxguHiWvKWtyTeJYyh3LQakq/0Tz/AFBqhACXLmgzafAxyf+uvT6X
         d7GRvzX2rFzneNrs2mIXEor3wgbW3ffJn1i9vwTA4Iy1UmomFIrF0hsvXMK/NwsyiYz+
         OsDRzB1a9sGOAOSb53bfih0H//avR0wrFlYYcp4iYzI9dqI/XUcxcy2kAOJ+fjd3HdQK
         eDWw==
X-Forwarded-Encrypted: i=1; AJvYcCWeKzc9mh2TY2zwB5QqdeZoysvYi/mkRO5LxjNooVxdTibBqfoQn5jS2Ud4U53dbX8elqU03bgV24ih9YQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztwor2ra7A/k88r4MKbzTtYS4VZ7PBbZ8SLm7h3YJGmmYT5RG7
	sK42oQMwutFRFftv657XeReUSceCRw/x6x0SSI0iRDlaU8qC/d1j07kaYn4Cw/Y=
X-Gm-Gg: ASbGncuTPz62EUh6mA/samISFgwZBygtClew/KhYtne8UMfW59OzywKU39M4ogcM5p8
	Y1R7Lgw4nY5/aWIVV8mwQhnjfqv8B7IKwJqeL0cv/ZLzwVb31s9fRlhA7PDh8tjnpjx454zkuZT
	a2OYzvj8ttpyEapBeqJDXU6JUMDBFDZRND9q+hv1FuQ2FKIBlx9jG4JHhelTmjZwasMDpgUfntz
	LGCQgJ4eWQbyuLPtPFHtreT1ZkYrQ+rQubZY3/ZmU/e6fPbo849IY/4c/jhNLNb0tNBHnlglrgG
	EUQG+fGbRTBKRn94diauph4AYN+MU62RV/sRoySLS5QG+aPIeaIHyowQPTFXu8cM2h2zWLzHCL/
	YplcDIBxusULU2j3Kwk7KPFm4pvSTDwJIH3c=
X-Google-Smtp-Source: AGHT+IFnHs2M9uTl/sVMr31Bcm8NftEhjmsWDRJgPxm3Q2k+jhRwztzbZUcO8weBM1x8XxOnlIgZfg==
X-Received: by 2002:a05:600c:4449:b0:43b:c0fa:f9bf with SMTP id 5b1f17b1804b1-43e94a41ae1mr64277355e9.3.1743699367345;
        Thu, 03 Apr 2025 09:56:07 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec34be2e6sm23198265e9.18.2025.04.03.09.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:56:07 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: Tom Murphy <murphyt7@tcd.ie>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH] iommu/vt-d: Remove an unnecessary call set_dma_ops()
Date: Thu,  3 Apr 2025 18:56:05 +0200
Message-ID: <20250403165605.278541-1-ptesarik@suse.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not touch per-device DMA ops when the driver has been converted to use
the dma-iommu API.

Fixes: c588072bba6b ("iommu/vt-d: Convert intel iommu driver to the iommu ops")
Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 drivers/iommu/intel/iommu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index bf1f0c814348..b7e500451d4f 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -3789,7 +3789,6 @@ static void intel_iommu_release_device(struct device *dev)
 	intel_pasid_free_table(dev);
 	intel_iommu_debugfs_remove_dev(info);
 	kfree(info);
-	set_dma_ops(dev, NULL);
 }
 
 static void intel_iommu_get_resv_regions(struct device *device,
-- 
2.48.1

