Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BE92DCB41
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745968398; cv=none; b=V6WGt/TIjoAtHxKO78pI/S4ZQ/K/2Tj55pi7wOd+Pfv1nqdjiLOh86EojP5G0MJwV0iXxpzLs18lFwVexn2PgwBc2stmFLSub425ENpEYh5TfpKUU6hRNez2NIVkrGNjpKusTFBVChrF/grrNBObTHd8G7WzIxhkeSkzsnYwKkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745968398; c=relaxed/simple;
	bh=MCmNFhiZw1asmOj5z7a+KQ3khmBCYE5zFOLBdRh/Lfo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NQaNFZdcmcCyBhKQGFDueaVF9YsY55RBV7/F26c90csdGW86dbHysgVnIIGfNRIKb+GWHh1F0IhhCOQHINaI18e50XeidCcZB9eimzt14QYA3xXqNZ3+7kZGnLSMc28jQqHhDMbVV9YEIjIDKVGVxJz7MFSNpiIiWRizYZ4lHQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WaPQu7i+; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WaPQu7i+"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so4884298a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745968396; x=1746573196; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ptubX+4PRxSRuHNuaNIHmOvTzFtHE228lGkthuD+wwo=;
        b=WaPQu7i+EOARZfIHTVVL/RO16KYkrPB8EAHLmvzp6r52DiBHO0YM6GzV+CWFc+yRxe
         Es55bW62LdDaJ5cckJjDnuVblXeaFMmhlSlni0CLT9uX0oiTTMD2A1MYD26R+TfI2rKE
         8WcWWIhQ0N36AimFmQBR0edj0wmsTZpcK8TvVFJ3iNaK+rECbw2VFBdx+9di8PH9D+YT
         qcnkHrLWBckReRCRkW+Jdz8SKX8Bzi6a5cPMhY0U965kx3SN/Eb9tcq8wknsd3TQwBOQ
         wsuQuj1r76PMx8SwYTVOZjtdab4PkS7Ftw7wLMFLU/s9YdflhHb/vLG14bm8y4D6+7yG
         snNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745968396; x=1746573196;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ptubX+4PRxSRuHNuaNIHmOvTzFtHE228lGkthuD+wwo=;
        b=dua58Goe/xpYRy32uv14NQ6xW8rBrld/Z2s8FA96zAsS173quoVzRrIutOUY8qauRw
         eHc8vDs5rQgmgKVdg2CSZro1JXrcFMhnXcqwuZj6sVpFRj/IXzg6o54sFCJlUAL6Q3N4
         jpJDhAjXQeM2qhUu4rcsPB/yx5UMlWjyYonRwq4oUgzAgQVhXJUqZF9Oea2Mnkn1zUfk
         VvnjI37MEkABB9HJ3ZCduBWEvxyD/kS7nfnMacee/BMx27yYBlWnUkSFwuahvmNRGIBD
         84zNENET9NjBktNF3kkBjJpWnhb5oT7juA+qQVXuWnKaDEfrvRW+euZpBrTPh6Uxg9DM
         vZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlKZJsXFi5YdpHX915+wKYq8Lc8JnGt0qT0Ge4Jj3T3IxuolS7gnNr/RSAUhGvG9Fssc/nENotnHebkUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHdP7GGChnGfXyLQAgUrP+rBo57WYiKhJGQy4Yz/9eiJl6RScZ
	ll8G1spcZu8Yfrc2xWlmtsottRe/oe/E1iADg8Fhml5Ja+iEgq3akij2Wc2OLapQauFQ4zFksK5
	0
X-Google-Smtp-Source: AGHT+IFm8fO/EOznOvJbdJCOyS53ir+LzZX/uOe6DyxtNcMywtrFZXZEtFx5N0SC/FKTCYw47Z0veO+X0js=
X-Received: from pjbpb12.prod.google.com ([2002:a17:90b:3c0c:b0:2ff:5df6:7e03])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5547:b0:2fe:dd2c:f8e7
 with SMTP id 98e67ed59e1d1-30a332e8d74mr1388130a91.10.1745968396064; Tue, 29
 Apr 2025 16:13:16 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:12:59 -0700
In-Reply-To: <20250429231301.1952246-1-yabinc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429231301.1952246-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250429231301.1952246-2-yabinc@google.com>
Subject: [PATCH v5 1/2] coresight: catu: Introduce refcount and spinlock for enabling/disabling
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
Reviewed-by: James Clark <james.clark@linaro.org>
Reviewed-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c | 25 +++++++++++++-------
 drivers/hwtracing/coresight/coresight-catu.h |  1 +
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 96cb48b140af..d4e2e175e077 100644
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
2.49.0.967.g6a0df3ecc3-goog

