Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923E01E0DFE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 22:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743201524; cv=none; b=IFGO73FzoTdFcBz79ZQz8bAdxZ8fLWcokJdxn4EfBGuEiit9NuIeGt+FAjvk4xulFRFUiGGeDj2waplyQU0ik0KcUioO64A7UiCazIx4yWuWfqtoH76fDE5s8Z5JDAB9TiqV4dYz+NRq+63k96U22Uu6YJv55p9fZ80pkvOh0uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743201524; c=relaxed/simple;
	bh=N8q6YSZw3himtr8IpoRQKmYCAPscTQCWGCOHzxBQyso=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZSCDh0R4gwCEGL/mBI0xiUiSG4c59wCwhnl7fmoQsgbmetQXMryfm2E6Ddaa7FFLRAZKbwIXvrblFeF7lFVBPI4nI663QgX4myeQzatcKbXunxoufVjjnNcvZjXZ9sqlI0l9MNzdmClmbQSBj/fwLMIALhrCtB/hVFvQOhl3arQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZzCYiFSf; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZzCYiFSf"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff78bd3026so4469952a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 15:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743201522; x=1743806322; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NRoSmZerjcWNJMKApvxHU572E9gAzbyUGVwA014Um5g=;
        b=ZzCYiFSfEG4U4FwjS5X6wXBSUxYcC7dLvGWS/mgUKZCxY1hbVbRVJd+pX+nWcPKnNs
         nqCq6WN+JAZFkO1k9afAYTjCVUnJhSUxELcVO2MRWDXweX8WB9ACR6YHYsRXVF6Qodkd
         yYU1iuv9RMIBpyGjhkBvmN+qL5K0gMNHmSlPwk+u62ovUMPng2Swgyg+mO/saRswTgaT
         NtKAnjubP7JZj04RDWgJknOMfB+lIhgHak8Bb9m7EshyoPzsxQVJiGyOWvp4c/WsV/vO
         X7JC0kaWWYruhkRVeVIk1IU2HOeaFkAyZ4nrD/1DUU57IT4X6y/O9S5Pd9A4N+nqK8jB
         rZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743201522; x=1743806322;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRoSmZerjcWNJMKApvxHU572E9gAzbyUGVwA014Um5g=;
        b=Do+i/i3cqAIGf+6n1TtkCngQQcAxdF5eQQhiVbnZVBayB8kmsTwrqNlhLBdQP9zG8s
         STyFrhWlcyM5XD5FWfb7l9iacuPKEIpM/YpBpihLq+1mw6xlkwKvZ6A/3Nbq/jAhfP7w
         /rDhmCkNCLnD8EyO7wS6C52WFDwJ1ww3mPBrkl/SDUTjFf/0uEYAH/Jf4sJAWxR8Y/QA
         T3g7YLhbfsOgmm2hmqZm5bohHClNK5AljJmVZVTUHTd6kgNstVOLvC1rJCIR2RDuI7+w
         cTx31Nk+v652tF5tt9yKwfvX1X5Ts/N2+s5zfMrVYsB+07xj93RdxU/diLQvA9wJv5yX
         Ku4w==
X-Forwarded-Encrypted: i=1; AJvYcCU4MkFnMUvilpjRqBY11rQxotzIbwWdS2k50qli9Ei5n6yKPKxC1WB8dsFCX3JaZrH/sRTHeRAy+x7ljBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRAWkn3s0Q2U/wHWYGlLDAGe0VmAU0MW2sJrqgGSxNKqxu601e
	xs2es3eqnCZPO5+5gpePK7l42CL061rNNSO/SgcNVapbAD7pAHhJl+2GqXA4bTHVkItzdymafUi
	g
X-Google-Smtp-Source: AGHT+IGeQZV4YMlQxGu7ri71cw78XHpKeqc/l8mlvDEHbjUvRl4ijS7WcnHjYHx3fHp6/g82yZfeWhv+0gw=
X-Received: from pjbdb4.prod.google.com ([2002:a17:90a:d644:b0:2ef:8055:93d9])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b41:b0:2ee:ee77:227c
 with SMTP id 98e67ed59e1d1-30531f782c1mr1299876a91.3.1743201521746; Fri, 28
 Mar 2025 15:38:41 -0700 (PDT)
Date: Fri, 28 Mar 2025 15:38:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250328223837.2314277-1-yabinc@google.com>
Subject: [PATCH] coresight: catu: Introduce refcount and spinlock for enabling/disabling
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
 drivers/hwtracing/coresight/coresight-catu.c | 29 ++++++++++++++------
 drivers/hwtracing/coresight/coresight-catu.h |  1 +
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 275cc0d9f505..834a7ffbbdbc 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -458,12 +458,19 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
 static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		       void *data)
 {
-	int rc;
+	int rc = 0;
+	unsigned long flags;
 	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
 
-	CS_UNLOCK(catu_drvdata->base);
-	rc = catu_enable_hw(catu_drvdata, mode, data);
-	CS_LOCK(catu_drvdata->base);
+	spin_lock_irqsave(&catu_drvdata->spinlock, flags);
+	if (csdev->refcnt == 0) {
+		CS_UNLOCK(catu_drvdata->base);
+		rc = catu_enable_hw(catu_drvdata, mode, data);
+		CS_LOCK(catu_drvdata->base);
+	}
+	if (!rc)
+		csdev->refcnt++;
+	spin_unlock_irqrestore(&catu_drvdata->spinlock, flags);
 	return rc;
 }
 
@@ -486,12 +493,17 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
 
 static int catu_disable(struct coresight_device *csdev, void *__unused)
 {
-	int rc;
+	int rc = 0;
+	unsigned long flags;
 	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
 
-	CS_UNLOCK(catu_drvdata->base);
-	rc = catu_disable_hw(catu_drvdata);
-	CS_LOCK(catu_drvdata->base);
+	spin_lock_irqsave(&catu_drvdata->spinlock, flags);
+	if (--csdev->refcnt == 0) {
+		CS_UNLOCK(catu_drvdata->base);
+		rc = catu_disable_hw(catu_drvdata);
+		CS_LOCK(catu_drvdata->base);
+	}
+	spin_unlock_irqrestore(&catu_drvdata->spinlock, flags);
 	return rc;
 }
 
@@ -550,6 +562,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
 	dev->platform_data = pdata;
 
 	drvdata->base = base;
+	spin_lock_init(&drvdata->spinlock);
 	catu_desc.access = CSDEV_ACCESS_IOMEM(base);
 	catu_desc.pdata = pdata;
 	catu_desc.dev = dev;
diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
index 141feac1c14b..663282ec6381 100644
--- a/drivers/hwtracing/coresight/coresight-catu.h
+++ b/drivers/hwtracing/coresight/coresight-catu.h
@@ -65,6 +65,7 @@ struct catu_drvdata {
 	void __iomem *base;
 	struct coresight_device *csdev;
 	int irq;
+	spinlock_t spinlock;
 };
 
 #define CATU_REG32(name, offset)					\
-- 
2.49.0.472.ge94155a9ec-goog

