Received: from mail-oo1-f74.google.com (mail-oo1-f74.google.com [209.85.161.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB72D229B30
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742821; cv=none; b=OBoGZbxMgZf943wXf5EdmYD6o+2SqnQdSa880ZRAvWyiwsmp37SerfwR3YgtsVNFtWgrX8vkoAPNfE/qpAsXsuTHwFBlfjOjdupwkqFAMoKUzuBbHu52KRi8sUXhqilII0gDV70mUN2dC2EoQBMT/XAnK8C4DD4fBNi1IkGjxoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742821; c=relaxed/simple;
	bh=anZkANSwSDCmjOipxerQH1QTYidJBJdyetokzdU3tbk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RsMDLocUkgGJhgN5BShvTtClEZADmZHzR1Eut/kdJpUu0EfDGIHo5eoM0q5G/azeoW80rQLxws1nUpa/GNxa3CcR/PDnvXa5/HRqV6PocPQIcX3R2Uj9hvSQOXsY5Clne3/e2pdseAwLWBTrrcr6PAFva0XRmfRPnmgn3fe7yEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hndV2SL+; arc=none smtp.client-ip=209.85.161.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hndV2SL+"
Received: by mail-oo1-f74.google.com with SMTP id 006d021491bc7-601ae9681c0so4537599eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744742818; x=1745347618; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IegfUhI5gVIS8XkKPR5l9zWak8XwOvvgw8K+zjrd1EM=;
        b=hndV2SL+f+qcyHwm2/Eznt35jVTx0E7DfRAqxlGuE/ylUtKdYTj7GjvjvcJTJ4MsZ0
         Tr3WULCfCSPK2OsiHOVKAmEr20u3BCam+AK31ql5990bdouVCBK4SCov1C/NCzac1vJC
         nb9JAGRTad44UsuaaAmiz3RUZqwBcqTaVl0qQb/4o8r9trqyFqrickNXqg5qoyknkIzl
         r1jVIHdwP5jDR5ujxQ/lLJYTEWPPrDPbkY6k1cYFZxeHQMxMPq+jKFxC5QOirjXqlcgy
         UZdgE6es/EbCCyH/CQRSIOFHqbtMkZmSQdfMSA0Flaih3uSensVV9d0XA0J3ryA6gY2y
         5P/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742818; x=1745347618;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IegfUhI5gVIS8XkKPR5l9zWak8XwOvvgw8K+zjrd1EM=;
        b=uiAjfdytuMIOLdegKaghOM0MOjguZbhsNzP0zPXxCq6a3uHxqp6+kFnriIqw0/7aML
         4tfGfLOGcPTOwgmdk7Ybi+0tdTlc2pb1qo+V+pGf6KGixh4eYytqLQC1yRp8Kcw42F3c
         rVxpxfWSYpVjHmcLaYU1w2xfeI65vMmg8V9xgNWzm1DYtbiPD1QyZEER/drD8jFDaNyT
         krpw9ZzJJr0K/1O+qzZNzooUrUU8qNNxyLKBwsCvRkftaT+ZwlXZgD0Vmsw9yTrpD/Nq
         wuw1HRQwGox//5F6FQRhZX9PLfE1/4u1SFpnM3oB98VylSaI4k1OJQWH/PD0RHrWOLi1
         GIlw==
X-Forwarded-Encrypted: i=1; AJvYcCUQxd3KFj1W2fz0HbZwNYj8Wkq/m9hI4P/bQbJfApaP/iVmWG8zwn8/LOguGv3dhDxzu3dT55Pp8Vne1n4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWQ/AVRBps2D8GOxlsR6O1U8XFRAkwpRZMmM5EmbjLqPexB7Xe
	cuY9/x3J74OxscszvZJIaribxy58NrL1ANv6JZBio5+pH7TyBeYx8dNioCRWdNG97hgy+h651DM
	7
X-Google-Smtp-Source: AGHT+IEQi8PNtHVcRy7LuBEXq5xHg4BzdFcTSBuGvgAfDtsQNpuwbpRyY+zu7kia13Vkit4PH+1HBu9PL1E=
X-Received: from oabqw7.prod.google.com ([2002:a05:6870:6f07:b0:2b8:e401:9c8d])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:e05:b0:2c2:343d:1368
 with SMTP id 586e51a60fabf-2d4c3eaca2dmr192919fac.29.1744742817901; Tue, 15
 Apr 2025 11:46:57 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:46:48 -0700
In-Reply-To: <20250415184649.356683-1-yabinc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250415184649.356683-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250415184649.356683-2-yabinc@google.com>
Subject: [PATCH v4 1/2] coresight: catu: Introduce refcount and spinlock for enabling/disabling
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"

When tracing ETM data on multiple CPUs concurrently via the
perf interface, the CATU device is shared across different CPU
paths. This can lead to race conditions when multiple CPUs attempt
to enable or disable the CATU device simultaneously.

To address these race conditions, this patch introduces the
following changes:

1. The enable and disable operations for the CATU device are not
   reentrant. Therefore, a spinlock is added to ensure that only
   one CPU can enable or disable a given CATU device at any point
   in time.

2. A reference counter is used to manage the enable/disable state
   of the CATU device. The device is enabled when the first CPU
   requires it and is only disabled when the last CPU finishes
   using it. This ensures the device remains active as long as at
   least one CPU needs it.

Signed-off-by: Yabin Cui <yabinc@google.com>
---
 drivers/hwtracing/coresight/coresight-catu.c | 25 +++++++++++++-------
 drivers/hwtracing/coresight/coresight-catu.h |  1 +
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index fa170c966bc3..3909b562b077 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -458,12 +458,17 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
 static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		       void *data)
 {
-	int rc;
+	int rc = 0;
 	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
 
-	CS_UNLOCK(catu_drvdata->base);
-	rc = catu_enable_hw(catu_drvdata, mode, data);
-	CS_LOCK(catu_drvdata->base);
+	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
+	if (csdev->refcnt == 0) {
+		CS_UNLOCK(catu_drvdata->base);
+		rc = catu_enable_hw(catu_drvdata, mode, data);
+		CS_LOCK(catu_drvdata->base);
+	}
+	if (!rc)
+		csdev->refcnt++;
 	return rc;
 }
 
@@ -486,12 +491,15 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
 
 static int catu_disable(struct coresight_device *csdev, void *__unused)
 {
-	int rc;
+	int rc = 0;
 	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
 
-	CS_UNLOCK(catu_drvdata->base);
-	rc = catu_disable_hw(catu_drvdata);
-	CS_LOCK(catu_drvdata->base);
+	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
+	if (--csdev->refcnt == 0) {
+		CS_UNLOCK(catu_drvdata->base);
+		rc = catu_disable_hw(catu_drvdata);
+		CS_LOCK(catu_drvdata->base);
+	}
 	return rc;
 }
 
@@ -550,6 +558,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
 	dev->platform_data = pdata;
 
 	drvdata->base = base;
+	raw_spin_lock_init(&drvdata->spinlock);
 	catu_desc.access = CSDEV_ACCESS_IOMEM(base);
 	catu_desc.pdata = pdata;
 	catu_desc.dev = dev;
diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
index 141feac1c14b..755776cd19c5 100644
--- a/drivers/hwtracing/coresight/coresight-catu.h
+++ b/drivers/hwtracing/coresight/coresight-catu.h
@@ -65,6 +65,7 @@ struct catu_drvdata {
 	void __iomem *base;
 	struct coresight_device *csdev;
 	int irq;
+	raw_spinlock_t spinlock;
 };
 
 #define CATU_REG32(name, offset)					\
-- 
2.49.0.604.gff1f9ca942-goog

