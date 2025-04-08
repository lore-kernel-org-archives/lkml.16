Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A061D63C4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 19:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142397; cv=none; b=MVM+5HJLSbVpYWsGC3+AXXjlQYB51bHA9X01wNUnT0B90uE0syIckmnW0rfaLniXJ5D6W8tnzQLBNJT20CqAiy/mZy6huUevaLVAU35ssNxL9Y1QD9N3FkV+QIC9ZSqThGNEjBY9XvKjyp7uTCz+skqJ3uXXIcGAICX8UWiZk9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142397; c=relaxed/simple;
	bh=WsROMcDsl0cD1/lC171DGiFQyn5e2YtAwhyaFuO5POc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JHuRDb0zoIeCjaneVIyAzq5mIlBlDE+18gGBo0PLyxwMXVsxfISls3HbdDeVJbdmLC33XcGSjQgqN9WSVMT8dhsjcl5MA6BylW7IbyQwewTMOjzZ/qKQvz3HRu/QfZzCVIwYpyW/ps6byIZuUJNk5DwLXEIosgNwoIw3yjVG9u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QBNOgN4r; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QBNOgN4r"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af8f28f85a7so3790095a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744142395; x=1744747195; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OGOL9Pd6k9CF55B36skDPeiu4f1DCBf3D97J1ryfge0=;
        b=QBNOgN4rgubT1lqQUSv43cQamWGEUGMF/YfEniAVR7BgJ8uOOMQsGAk8H7pnTDcPLX
         HQhaEFz/p8RwWdcz9FTrYGWGqFmGWUtVgw0a9YBhuoyDGseTVA+yVGxTG5AK6zMRJ/9c
         tqjLmXfBSb6ut1ZXpVbUJ4kmpfE4hJEK113LKp4ggNCKRkeqlxh4TIG2WuHeaverib3s
         BKHkIQAIT52WOJa5vtC+IdfdKYMTk8t1BHxN7Mn4mMDk9q6F74q2/gNWt6e9cBv1h0R/
         Rm8NBxElVhnH7GXAg1C99G84ZjACOlfSC7wIocB99W48T/DHaefz9zsmmoOkHP5Y3ySX
         FJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142395; x=1744747195;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OGOL9Pd6k9CF55B36skDPeiu4f1DCBf3D97J1ryfge0=;
        b=dAdSQK5oq4mADyrSLuLM3U5laxO+osKiY5HdN3enmtyJRuzE/xRvDObMTbayok5G8O
         0WtUf1e06TXW3lYybjAZYtB8WPFVvpQFFzKP3RVmXffrCZsYssDP+aVShx+z/7ueO8hm
         Tzfu5E1/1Gg6kPl5jahAoiiGtwu8rlwPeP4EbXYvCAIVE8oZ/lc/ls1U+bTOulavHOV6
         qzqczi+guIbUDxHgyNo4fYqlHK9TvhCzdCnzmDE+zOC5ONzKPTiyi+mazcKYjpJTG8Mj
         QrIK430b0jn7rGhuLpq71opWBqIStbyObD/BjvTSGkSTf+UMlkbd/N6t1se0JKCPctoM
         OtpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF3lH6U8E3Zo8xTFeksNXcuAP2nfkjr2GKcrVmP6DyzXVIO72LD5N2jOsca3YpP/TgmbIHqcRomk9GRUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtLdy1p7eFLAJ0C5FcjobQSq+JJh+iYlr5H3w5rWnI6jHLQLgf
	uTXcbYaOgRCNvxUFk96cjcBxj3oiKw19+t+8UyABppB6ZCFsgkE4RNIeg4/O3ScOKygreyRf8p1
	b
X-Google-Smtp-Source: AGHT+IE7TnlNx9bjwfIhkbEL6D7Vucr8oUw1PVFiQcKtOgd3cuck9+KyF9HLeNJHrK1+IjYCXP9NYIhrumE=
X-Received: from pgc4.prod.google.com ([2002:a05:6a02:2f84:b0:af9:9efd:c78f])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9003:b0:1f5:79c4:5da0
 with SMTP id adf61e73a8af0-201592b886amr372451637.31.1744142395143; Tue, 08
 Apr 2025 12:59:55 -0700 (PDT)
Date: Tue,  8 Apr 2025 12:59:21 -0700
In-Reply-To: <20250408195922.770377-1-yabinc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250408195922.770377-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250408195922.770377-2-yabinc@google.com>
Subject: [PATCH v3 1/2] coresight: catu: Introduce refcount and spinlock for enabling/disabling
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
index fa170c966bc3..30b78b2f8adb 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -458,12 +458,17 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
 static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		       void *data)
 {
-	int rc;
+	int rc = 0;
 	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
+	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
 
-	CS_UNLOCK(catu_drvdata->base);
-	rc = catu_enable_hw(catu_drvdata, mode, data);
-	CS_LOCK(catu_drvdata->base);
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
+	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
 
-	CS_UNLOCK(catu_drvdata->base);
-	rc = catu_disable_hw(catu_drvdata);
-	CS_LOCK(catu_drvdata->base);
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
2.49.0.504.g3bcea36a83-goog

