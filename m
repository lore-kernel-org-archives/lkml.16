Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3660126B95B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279808; cv=none; b=mJv6XR4y0ZOdEWfi1JiUbo39i4AGgzc/168dPiybTRq+8G57ojaO8CM1P4/rDs9NKdSB3IWx89e9vGm7/IeQDSTTtoUp7i9cD5tj4eApSX2s/wHFI0Z3mt9XrTjlWTeBaomZxBqvGnukkd/a1NsA+hAHQX1idcom3b6K81mkEJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279808; c=relaxed/simple;
	bh=pehHWA1MV8i6VWMG9pbqo1MbudTfJdbjXmAlPInpPvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FOcVh5a2V80s4oPqXZxx2BHjaDoolk2oYFA+bRiuoTOW3zZ7KMJHSnY1rLmfKDMETkz+nvWRjMYEuJHKgQIPrhe3yKLAd/PePABsTiBIs94mPW01wgknTYSvWWQrAYD5xJ8cS1TO5Q7nFgcp+ZRb2N6cnz7FaQcxNkpeTTKd4n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X2qnqQoE; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X2qnqQoE"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2264aefc45dso8341165ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744279806; x=1744884606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kr1cHHVGexO9WPOsYvoAN+vDKjl3OP+/qsNx+1+f6GI=;
        b=X2qnqQoE5myXwXCsKhwCNkFxRb7THi/v2sUPnoLAej/P8Vfps8PlqowDwKyiRm+loG
         wvK35hpQ7D6Wt+Duj3kWL6Pd8ArulTau6gISAqhRvVAoPiQAGjpyU5zzM0xB9uamP9O4
         iqnyXB6muSwQ70codC93jEULYbR8MaDSWOSdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279806; x=1744884606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kr1cHHVGexO9WPOsYvoAN+vDKjl3OP+/qsNx+1+f6GI=;
        b=Avq6TPYcXsxul8MjDf5eq7eqTtk7POfl6YjFuogemXQhlx5dAqBNOLtAx8EEB561Rm
         7AIaZRrxYwjOVWx1ylJw57RygDzkwPvoToqoZKwxRXLlm3n1i1PToIS4KvzvcEwsgJCD
         rUuAe4wa2PWDhJFBMMNBMFq5ttPRGCqskORsY50S9WEXV7ivdBUD7FaozRl8Ln4t6Hys
         fa9f0n5GyDqFS9vQuINxdM3iyh4J8WhATTFIzYtQ4Q+ULHuF/yBamkUQ1jPFTCvYtBk8
         l++g+ObSa3neXUW5hzXfmvn9CHYijGug7RAxp2bnz+xugE3/aMuJSAThWNZHbpnYTXLP
         K7sg==
X-Forwarded-Encrypted: i=1; AJvYcCVSHl9N0cyUnIzsSbdZBCsFNmtAbLF+k4RpvqxW2QYda24tTvzsfEFYxOWjanA10X5cBcBpVVFKC1mTlB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrPGPy47qyE3cZCI2Gg7CFQl+DX7nA63JpSSB33HouLPGf3/qB
	h3IFLIOgyHdLnC23go+u1L1yQb3Yu9rGsErUKAUTe5TbiDDvgx/osxsUkzq6dfkTiYr6S/jGrFo
	=
X-Gm-Gg: ASbGncs86QRu1z51QBVYiVSz1CCZ5edjECa1RfPuVN4GT+STumabdx+Uo/oEOxwcO7Q
	9qroyDhN3x1kvSQnLZ9YgtDUduE/faZ9WLvxevegmEKJ+l006dPttqh31xXZZWaNNt3OEMq+m1p
	ESv5wcovYz7HYTbSjB1H3x+BCGQROaWzCm94GoQqbm7zFeOirlazXsM7EtybhkWhOEtahRutZ20
	6dBzJEuM6WRrHkPIvyFhHSdkAPS/CXrctaGHeDIhUMHUvzeeQswcZ5tyeXKXvUFisFuGizdrNQg
	ftijqtk6PXHT76MRzBtBI86z24gczOr+28AdRMP5H4ZGBJnjQMFg4bawMpo=
X-Google-Smtp-Source: AGHT+IFlH5XrxIBRVfouorGOOshM1TpJxUoU1ZEBxDLPDH/QhmhbmPQjSV4BAe2z5KgtOThYqpRP6w==
X-Received: by 2002:a17:903:3c66:b0:224:2717:7993 with SMTP id d9443c01a7336-22be03eed46mr25499075ad.45.1744279806423;
        Thu, 10 Apr 2025 03:10:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:478c:87b8:a129:9851])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb53d0sm26601945ad.175.2025.04.10.03.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:10:05 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iommu: Clear IOMMU DMA ops when detaching a device from its IOMMU group
Date: Thu, 10 Apr 2025 18:09:59 +0800
Message-ID: <20250410101001.429694-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In recent changes to the IOMMU subsystem seen in v6.15-rc1, the process
and order of how IOMMU linked devices are brought up has changed. Now
when the IOMMU is probed, the IOMMU subsystem core will attempt to link
or attach devices described in the device tree as using the IOMMU to
the IOMMU's associated group or domain. If any part of this fails, the
whole process is (mostly) undone. The IOMMU failure is then treated as
a deferred probe; after sufficient time, the deferred probe times out
and the attached devices are brought out without the IOMMU.

In the process of undoing changes, one part was missed. When a device
is initialized for use with the IOMMU, iommu_setup_dma_ops() is also
called, which signals that DMA operations should go through the IOMMU.
This part was not reverted when the IOMMU changes were undone. When
the device later probes without the IOMMU, DMA operations would attempt
to use IOMMU operations with no IOMMU domain present, causing a crash.

The above was observed on an MT8188 Chromebook. The MT8188 device tree
had incorrectly described the IOMMU endpoint for part of its display
pipeline; the IOMMU driver would successfully attach a couple hardware
blocks, fail at the incorrectly described one, and roll back all
changes. Later when the deferred probe times out, the display pipleine
probes without the IOMMU, but when a framebuffer is allocated, it goes
through the IOMMU DMA ops, causing a NULL pointer dereference crash.

Add a helper that is the opposite of iommu_setup_dma_ops(), and call it
when the IOMMU-enabled device is being detached from its IOMMU.

Closes: https://lore.kernel.org/all/CAGXv+5HJpTYmQ2h-GD7GjyeYT7bL9EBCvu0mz5LgpzJZtzfW0w@mail.gmail.com/
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This patch should be applied for v6.15. It's not immediately clear to
me which commit is the actual cause, so I did not add a Fixes tag.
---
 drivers/iommu/dma-iommu.c | 5 +++++
 drivers/iommu/dma-iommu.h | 5 +++++
 drivers/iommu/iommu.c     | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index cb7e29dcac15..62a51d84ffe1 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1739,6 +1739,11 @@ void iommu_setup_dma_ops(struct device *dev)
 	dev->dma_iommu = false;
 }
 
+void iommu_clear_dma_ops(struct device *dev)
+{
+	dev->dma_iommu = false;
+}
+
 static bool has_msi_cookie(const struct iommu_domain *domain)
 {
 	return domain && (domain->cookie_type == IOMMU_COOKIE_DMA_IOVA ||
diff --git a/drivers/iommu/dma-iommu.h b/drivers/iommu/dma-iommu.h
index eca201c1f963..dfd31cb9e685 100644
--- a/drivers/iommu/dma-iommu.h
+++ b/drivers/iommu/dma-iommu.h
@@ -10,6 +10,7 @@
 #ifdef CONFIG_IOMMU_DMA
 
 void iommu_setup_dma_ops(struct device *dev);
+void iommu_clear_dma_ops(struct device *dev);
 
 int iommu_get_dma_cookie(struct iommu_domain *domain);
 void iommu_put_dma_cookie(struct iommu_domain *domain);
@@ -30,6 +31,10 @@ static inline void iommu_setup_dma_ops(struct device *dev)
 {
 }
 
+static inline void iommu_clear_dma_ops(struct device *dev)
+{
+}
+
 static inline int iommu_dma_init_fq(struct iommu_domain *domain)
 {
 	return -EINVAL;
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index c8033ca66377..498f8f48394c 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -677,6 +677,8 @@ static void __iommu_group_remove_device(struct device *dev)
 	struct iommu_group *group = dev->iommu_group;
 	struct group_device *device;
 
+	iommu_clear_dma_ops(dev);
+
 	mutex_lock(&group->mutex);
 	for_each_group_device(group, device) {
 		if (device->dev != dev)
-- 
2.49.0.504.g3bcea36a83-goog

