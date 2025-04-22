Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CBF20B7FE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745364419; cv=none; b=QBWvnviOTWPAk0K27tmii7WVq2FvBw3qn8VvpY/OJu8uj//3IUYuB+m1ZtXH4WxQ+XlurLr8lNDq9neTUxlXY2b9c+RAIcW4L6aInCn8yV6grga34HRXTK5hIsj5XSs8Xki+Uozs7OBERko/71rR2SZOYQIODTEUMlC4gtn4HQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745364419; c=relaxed/simple;
	bh=yV3172UPyrcXv7aQzcJRnQD7GsQG4ZbS0O7C0Ikh3Xk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZxFySO56CmP13UEeKlDfV1h7ZfcatdREk2s4h1Ec2M9etpDDN/MLHzzUskdoIBnJhQujomNF03Dw/MIirkCr37rTKzf7YFJs/AFce9IJGBIa8dMruh32xUHtFajQ8tOhFgFyOu2orw7m9MW/fwnerqEV/HyBW9Ecq5y97tcskD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hBTfBMT4; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hBTfBMT4"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-73720b253fcso4817145b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745364415; x=1745969215; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J6IcEzJxiXJWo904KtPQWxlx57qhuamCaTjhCSuG3DE=;
        b=hBTfBMT45n3e1aNDnVxCZ0UsR1GgCKsrxow6ajB3rvIKuiI3VDMb8n4sncHrKqThi9
         FHN2SLhqmfHTJhgNG9kPQYMSqDalNKEbQtfvhe4KXi4JQBaay84d0aNGhHsvpFpuBi+3
         +M61OnzU3gKPyxupQEOxu7bjZ1x1FSFwiy36CvjoV0gdDKSDQ2imiPqfoBEUQRBM/AsZ
         8mhdqFJltJxx5FnI9oJE2o5/GkI5x+9a5wcVSe7fDY2gUV6d89Ts2ekC/qh1Sp3ZFUDV
         r5rOuuLnbJgBcks/0CPHWkgrD7erdJX4lKgfJKvNGWTosiPE9oEaHigvZJUG9A3zO+jY
         DDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745364415; x=1745969215;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6IcEzJxiXJWo904KtPQWxlx57qhuamCaTjhCSuG3DE=;
        b=fVNuugy6MlkLCJkoM4ItYwe9xh73rfl7PpDCYqZ8tlb1c3SvvyfzHXAU56VfC9RwY3
         hzDbL01nMx9BLhiYshhOtKuH5NLz5zYfvd40+3tV9jtlBoO8xqU2CsEP3RDgh8W2kQlT
         jwwCjbcRqcRSmkgj/Qe6qQcVXHtxvyYOevmLH2iy56yoTQMjrNDmE8Z5jZUSfSgADZ7M
         vQ3O6gespOhMSNoc2VBajIbvMpEmNdZ0pgnpNpm46g5SGh8KAdI58orsrCJh8WjIrQSw
         Jd5vqQaxnajTU7FE6agXj7oXvrw4Ve0gnaP5OEenStBNiiPN+wzeua5VYsbnyekSBKGs
         PHVg==
X-Forwarded-Encrypted: i=1; AJvYcCWj1vn0OQOT/aUMWzzNKNsm25qWeuIJWTEPs5PdBGE1kMyOTQ1gLVpLHiLSeH+z/u/Rr0dUXNurfNpv1fQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4+SioDmHyc/dcyHNPETTz7ZOknvi1CgAM9d4bEto724U7Eibw
	McoEmdGxzFPE/7wDtRsDxJwS/zkGRtzfrc9LmSwSnuYLe3zPmrurDKku+MFuSzNQDM4fZuwnIeB
	wGrsru+5WFRWDVhKjwrFei2Jg3A==
X-Google-Smtp-Source: AGHT+IFnwY/Qn0g1gsIgPB5XRIFKYBhaqHjmYzWi4x3FEL3PSBxc1+8xW0JU5Z+aHvwvasCUwllL13+nb8oxx5IDyVw=
X-Received: from pgbfm20.prod.google.com ([2002:a05:6a02:4994:b0:af5:de08:d3a9])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3a49:b0:1f5:8220:7452 with SMTP id adf61e73a8af0-203cbc74dabmr26806906637.24.1745364415552;
 Tue, 22 Apr 2025 16:26:55 -0700 (PDT)
Date: Tue, 22 Apr 2025 16:26:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250422232650.2737369-1-willmcvicker@google.com>
Subject: [PATCH v1] platform: Fix race condition during DMA configure at IOMMU
 probe time
From: Will McVicker <willmcvicker@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Rob Herring (Arm)" <robh@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <jroedel@suse.de>, Bjorn Helgaas <bhelgaas@google.com>
Cc: iommu@lists.linux.dev, Saravana Kannan <saravanak@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

If devices are probed asynchronously, then there is a chance that during
the IOMMU probe the driver is bound to the device in parallel. If this
happens after getting the platform_driver pointer while in the function
`platform_dma_configure()`, then the invalid `drv` pointer
(drv==0xf...ffd8) will be de-referenced since `dev->driver != NULL`.

To avoid a kernel panic and eliminate the race condition, we should
guard the usage of `dev->driver` by only reading it once at the
beginning of the function.

Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/base/platform.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 1813cfd0c4bd..b948c6e8e939 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -1440,7 +1440,8 @@ static void platform_shutdown(struct device *_dev)
 
 static int platform_dma_configure(struct device *dev)
 {
-	struct platform_driver *drv = to_platform_driver(dev->driver);
+	struct device_driver *drv = READ_ONCE(dev->driver);
+	struct platform_driver *pdrv = to_platform_driver(drv);
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	enum dev_dma_attr attr;
 	int ret = 0;
@@ -1451,8 +1452,8 @@ static int platform_dma_configure(struct device *dev)
 		attr = acpi_get_dma_attr(to_acpi_device_node(fwnode));
 		ret = acpi_dma_configure(dev, attr);
 	}
-	/* @drv may not be valid when we're called from the IOMMU layer */
-	if (ret || !dev->driver || drv->driver_managed_dma)
+	/* @dev->driver may not be valid when we're called from the IOMMU layer */
+	if (ret || !drv || pdrv->driver_managed_dma)
 		return ret;
 
 	ret = iommu_device_use_default_domain(dev);
-- 
2.49.0.805.g082f7c87e0-goog

