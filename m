Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DBC1C84A6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745517884; cv=none; b=rea5N+7vDv+Q8KTANo9tCMM+jvde5KpgGb22Bm8lbvQCQFNVNWjTc7FaTDNFiJ6lZ6UvEhAZhBz76iGTcErfltKb42C273RbtLNqCrq3wHTv5QFhFzp5i8PaE/sAYvrlLk5oB3mA2YRB0pTQbYq+hZ08svP65hQQmlJgarHpOPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745517884; c=relaxed/simple;
	bh=SDpYS5ZWknMpckF1EiWnoZUkPjoTca1oTO5sjKUafB0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MmLVDyQjPVeYFRYufabgDk1hQqmwlwTFysgqd5gaHxmpF7PPFkTGCILmuhKVe3QEBHAbNLHSKKXCP5iUoBre7Gp7y3ZBg8M0A20iGKqT4LEYa5KGlKx9LdkwhKBt4HtwBl0Q8h7e0SFIoxM0Mkp8Iz2WRmlZ/Vgnr6iZyvblz9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oaeFyGsI; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oaeFyGsI"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af2f03fcc95so1351732a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745517882; x=1746122682; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V/zEUaD7XALmrEdJtQ+W7mbWtOiJSP/MzvvsaVR7LPI=;
        b=oaeFyGsI92GgoYmgl7mDw6xkfz0sJtK7HeqH/fwYbxYytc96Bt5IQz50TJJb1WDG9R
         Jp5O4pD6EZ3kgTYOdm+pfQCqMOFv+dXbjQPzPpC2UK5vgrnPqxRUP4+uFNJ52yvNOQvp
         1oHXpN4Mg7WmXJvmzGd990WeaWtkhMdcQ6MLjT3EZ2piR/4g5lqA6wAEFHKpyNQxEMnh
         whMif9/QN4IRVcAtK2mSCU6fRwVwQA93EwVsPcTnQ3HHX38rLShYyZLl0JZwe4Ao0kTh
         77C8t5bskfLMLJLXP1gzl22SLYPXZczliosS3DDu100cLWIDle5A2KE8QrUhQPEmgg9v
         8snQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745517882; x=1746122682;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V/zEUaD7XALmrEdJtQ+W7mbWtOiJSP/MzvvsaVR7LPI=;
        b=IbGAyZ4XESEvpBxmzb8UtfGfiZyN8Gv4bZ4Ty5BTPKuQfu41Cu7WDvdBR6prSMp/q/
         mSwCy19/TLobf+yhOjUZhhXKrkaaTG558PKb42P0FfHmZzFJPe+n87ZmhHMCECXwK/Cr
         A95ZO+8UWnniG7DFPpbN+dZhV1MzXgE3kNq2dkH9H4c6fIWpLwFVT1TLdGUimWf4Kye0
         vMQY8DxZX6c/TVwynBbN0Pmv6SDol8cTKD7/Lz2uenDGAM3P4r7Qcg8vPKyXtxYwCvVO
         8RWyccoubmlnH6cwsSOxwsuGSNXYG2QMvA9GQakBAxI491/RMm00415XkkknQYDusmQ4
         XRrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpuMdQlAjrG3eZKeTojnKLkQZH+69BL/rZ+07YnwwJBBj4NRqa1qUpVctwtHf8bdDMUGZG87j5+OPIXYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE16kClU66q9oKDHD/XHWHe3bkr8bpqvinLCPKv8g/vFQviwFR
	d6Y7IH4YuWjsDZxJVMPlG21AeP/WkBiZlIaUZrC/0K7uNbYo+ZrwObnV7Zxk/Cg/Pw5YnQRLEUN
	yn/jRTjWXz1+7a5ez5s4qnh8AvA==
X-Google-Smtp-Source: AGHT+IFCD6wSkeShiUGYpxhZbZBv0/y9w0T1IIc3HNt1hkQLFgJDBQEO5h7Bli2VPrTT5E5MwlpXd85RSXZDpW3dVvA=
X-Received: from pfblm19.prod.google.com ([2002:a05:6a00:3c93:b0:73e:655:5bee])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:218b:b0:1f5:8e54:9f07 with SMTP id adf61e73a8af0-2045661ffaamr416057637.24.1745517882289;
 Thu, 24 Apr 2025 11:04:42 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:04:19 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <20250424180420.3928523-1-willmcvicker@google.com>
Subject: [PATCH v2] platform: Fix race condition during DMA configure at IOMMU
 probe time
From: Will McVicker <willmcvicker@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <jroedel@suse.de>, 
	Bjorn Helgaas <bhelgaas@google.com>, "Rob Herring (Arm)" <robh@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, Saravana Kannan <saravanak@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

To avoid a race between the IOMMU probing thread and the device driver
async probing thread during configuration of the platform DMA, update
`platform_dma_configure()` to read `dev->driver` once and test if it's
NULL before using it. This ensures that we don't de-reference an invalid
platform driver pointer if the device driver is asynchronously bound
while configuring the DMA.

Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/base/platform.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 1813cfd0c4bd..cfccf3ff36e7 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -1440,7 +1440,7 @@ static void platform_shutdown(struct device *_dev)
 
 static int platform_dma_configure(struct device *dev)
 {
-	struct platform_driver *drv = to_platform_driver(dev->driver);
+	struct device_driver *drv = READ_ONCE(dev->driver);
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	enum dev_dma_attr attr;
 	int ret = 0;
@@ -1451,8 +1451,8 @@ static int platform_dma_configure(struct device *dev)
 		attr = acpi_get_dma_attr(to_acpi_device_node(fwnode));
 		ret = acpi_dma_configure(dev, attr);
 	}
-	/* @drv may not be valid when we're called from the IOMMU layer */
-	if (ret || !dev->driver || drv->driver_managed_dma)
+	/* @dev->driver may not be valid when we're called from the IOMMU layer */
+	if (ret || !drv || to_platform_driver(drv)->driver_managed_dma)
 		return ret;
 
 	ret = iommu_device_use_default_domain(dev);
-- 
2.49.0.850.g28803427d3-goog

