Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45D02110E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 01:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743556779; cv=none; b=pXqyobGFL6zC+2zDrjGZQCEE+zehUXwtzbGml3Sr4HmJV/ykkqnBPLjuhQZZWHCaW9hb1YpEhzww9lcR7irzYYBBD3rBQQD1D2QbVphHaqlffgTyM2pSDfm+hzqS9q+u4CtR/VTx3ESkYCvb80vGYAgad/jBAqQNKR3L0JCEr5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743556779; c=relaxed/simple;
	bh=PBljBqL3LR4re1XcEjx1T8tlrZc0d9QkpKQgYyhexqM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j7L24QgODkfJO9LlSKNLCK3KCc/fxuMwWZPEfx6rdeJS14Kq3Jn2YIf2zh7qnOgRC5+D2DdR0CsL7dtOCMYZOB7pRCbDobRUnpQ825+9gRn8tODvm8bKv868rALjwHwDvGMEVAMDjgcpi/m9qswIpjCWtnN0T3KLWpwXFVhshF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=33aUBxa7; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="33aUBxa7"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so10810212a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 18:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743556777; x=1744161577; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wptZ3tNfETWSP5KmatzEV9b0isyJtCFqvayiJ7W6mUQ=;
        b=33aUBxa7OszkZcJqaaHT2fuAah5mLVdGnAcv1/l5v6F7XBUioNNLu45Euefm08MYRR
         ERYZjKTGRt6CNYNi2tlDkeRTZ4za3Y63kvZ163V5t9JrLUltuMUdZz057TD3p6++6doZ
         9YjDwP8Xrt2Sjr5ft6uwkmSp+NDSR0XpcSW0H0vSaFmN+dp+5l6K3xQIHjAREEx0yn63
         jafgqLzzqJ85XpiNo8DpLgcuKjAg25XxEHR7X5oRvkYlWyUx/w9r9a/alRI8hA0YMCcO
         l9zTjoQCkWNyYECCfqKagW5OI0/wBbefYK1iqfEIelDmHkfj+hytpHZsiAYodty2bZNo
         lEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743556777; x=1744161577;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wptZ3tNfETWSP5KmatzEV9b0isyJtCFqvayiJ7W6mUQ=;
        b=hLJ3Q9U/qxt6E8r4Yf8kkPMiIrY6JX9eKXtjt8TAasUf+KjTHihh6sYGWP2u1+Aj1U
         px5Qa77h+8WtRs2RKFEJCRzULK0akikcKsO/0xOJ9+LpvrzRFz9aVlXyEWK+apeyQ3Fl
         40jwXKaj9eN1buO8/LdPhbEe3Fc4Cwvmn84ZiVZzG5y/jdDcuRCqaJ+/UTVI5cCzMVz/
         +yOKyQ8NXthlF/SZC2MKPip3WD4zzlF6/H2Lla41qptHsbz3Lt8z/T4nNumOj64qhSQ5
         L50wHakLtnlaCcluPWMbuV6lobE9LlUQ40uTRvUh7nwwbAhCqig4sJX0tvQdTNyZnIAV
         sfnA==
X-Forwarded-Encrypted: i=1; AJvYcCVknoFOalyUs9Yr/zyFkCv/CZaZFEd3jTvuvC2O0Q2SzleKWuo2vggxIC/IT7hzLBhbwvXetQGkPnltbpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWaAggjI994AyoBZFlPiydC96Kp2Dgfajh+tGuEj0sYQVZokUg
	OrtRoLvcM+NwK3BaHVpq9auWn8NjhQjrC9+tOCmR4PoyYR+tvemjPoPxa0lQgbM3LJBxS9c0dcC
	G
X-Google-Smtp-Source: AGHT+IFhUbws0ZJvMef3veFQxaSe4aJtMLCMuoVX0WIkPdjismgC1ZQ/waL+Ou51y9waTjtiUX0U/6YkFjw=
X-Received: from pjbdj15.prod.google.com ([2002:a17:90a:d2cf:b0:2ff:611c:bae8])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2807:b0:2ee:d371:3227
 with SMTP id 98e67ed59e1d1-305608aa9b7mr9144422a91.17.1743556777029; Tue, 01
 Apr 2025 18:19:37 -0700 (PDT)
Date: Tue,  1 Apr 2025 18:18:30 -0700
In-Reply-To: <20250402011832.2970072-1-yabinc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250402011832.2970072-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402011832.2970072-2-yabinc@google.com>
Subject: [PATCH v2 1/3] coresight: catu: Introduce refcount and spinlock for enabling/disabling
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
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
 drivers/hwtracing/coresight/coresight-catu.c | 27 ++++++++++++++------
 drivers/hwtracing/coresight/coresight-catu.h |  1 +
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index fa170c966bc3..b1d490dd7249 100644
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
 
@@ -486,12 +491,17 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
 
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
+	} else {
+		rc = -EBUSY;
+	}
 	return rc;
 }
 
@@ -550,6 +560,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
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
2.49.0.472.ge94155a9ec-goog

