Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58882629F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 01:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743556785; cv=none; b=eI1LsGj9bqVwmSCJUUbYkp1q3wFu7iucmGouleJLMUm51DXHpHt6P9IyPb753KMRdsFB3qdbQ58nb8Y5sFbAP5KWLe6Ufgjj/DmwGpk62sZzT4sGOvxcslBzQRFEEGdv8yqKOCVUEfJDdpf02vcVwd0OMtpteJkrZjFFozhEar0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743556785; c=relaxed/simple;
	bh=/kYzi4agpjtq+H4NaUhrqoBOuyYEG6GuYELS7Wz6rPs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=byAhpwhWbqdrNj+51BAgDvxfBLZ/pnafn85svn7kj/G5LT36pe16zqPUGigEfIE59M+mEa8u5Fcfzd2V67tJQ38ckt/u/axWF9nM+wjQPLgQTl8WYpjJoVg0oIljBFhRx/+mA2/UB3S6/bnzuGk6NUvFmo39Seni3BSLIWv5xNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CRVlHtAv; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CRVlHtAv"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff8a2c7912so608700a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 18:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743556781; x=1744161581; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3yUz8B8UOwQKdx+ikShwAoRAzuYVj/mGC57kza1e97Q=;
        b=CRVlHtAvj/SehFYynbwoybnM2IveM9csIlxnhYTlrMtf6zyQrDcN9gHoFjRTXMSweb
         vhNO6J+1lYg81ka5cJMKtS+vexeGIO9KuntzMLJYKR9IYxp5KYlW9xEUuIigSWfrlKKD
         aSpilUGCM6ssyBMcuZ7MKUzEvOcDiDCyx9f19T0I3Cn9r+unbxETttXwRIzQfDnQ0HlF
         2Yh28qvPzis8omfZ7l/EMCJRH6rcQ9+G3OaxWE/mDvlpcv7Yb+P7uaGuu9a7NbQNxoRN
         n6de9et7ovWncXFoJUs0lEF9aDZzXAgWN+Sv3kLniaMZbokeuHULyxNzJIF+7ZI+Y+0Y
         oQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743556781; x=1744161581;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yUz8B8UOwQKdx+ikShwAoRAzuYVj/mGC57kza1e97Q=;
        b=MHfOd2XQQnUebJPzPza/y1WLPibzHeBszmpoJiU6FU/OOYiOdWFUfY7w0ZUmA6BOkA
         7FEYW/hm57jB+qzBG0c3hc+tVFfm5m/2LCenHGwKi+SE+83Xo558iQCOlksQokLlNJwx
         vL/g83P7xFksB8gu7CuRrsGBGFjbfcNDYq2oKjQ/IJgEz64EVQCd+WAdi9+14MDMrJbj
         mGNhnq95+rZRLcDNvpHwD4nxSVIh0Zbqq7ILkDkWXYIM7Evu1KJ/wRonrerwjbCF0cIK
         ab+Y3iOWqog7ooR+iHu3x0Nd6AeJnG6rBcNuGfpVN0dNWb1CqwxO4Rcq2fxXDbjaHGsS
         1DsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBj3Z2ungWrpqpxq7B0GUVkKOPcOVq3z4YADr+Ues3NYifnMid5xWkl95smBQb4djAc7kT5KT3dl9AUhY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF6et9l07s+OpF4gDegxs9Lu9M6lpjkvxxQ7GouTX7DmEdqn8R
	SiQN6j8HMJK98G61bu5TevO/x3/faIXR1YxIi63/tHTlkpHwXhvgaevCN5Wgs0wDNWTvAyTNxbN
	V
X-Google-Smtp-Source: AGHT+IF2odUx6KL5NWFPqm5G8r/6pPbHDFTjru8tv1QaI+AKSymC55lai62Y/Vh/TzF1U2eaSauiAA7d+M0=
X-Received: from pjbpl10.prod.google.com ([2002:a17:90b:268a:b0:2fa:15aa:4d1e])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:538f:b0:2ea:8aac:6ac1
 with SMTP id 98e67ed59e1d1-30572609c09mr225709a91.15.1743556781014; Tue, 01
 Apr 2025 18:19:41 -0700 (PDT)
Date: Tue,  1 Apr 2025 18:18:31 -0700
In-Reply-To: <20250402011832.2970072-1-yabinc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250402011832.2970072-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402011832.2970072-3-yabinc@google.com>
Subject: [PATCH v2 2/3] coresight: catu: Prevent concurrent PERF and SYSFS
 mode enablement
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"

A CATU device can be enabled for either PERF mode or SYSFS mode, but
not both simultaneously. Consider the following race condition:

CPU 1 enables CATU for PERF mode.
CPU 2 enables CATU for SYSFS mode. It only increases refcnt.
CPU 2 enables ETR for SYSFS mode.
CPU 1 fails to enable ETR for PERF mode.

This results in a CATU being enabled in PERF mode and an ETR enabled
in SYSFS mode, leading to unknown behavior.

To prevent this situation, this patch checks enabled mode of a
CATU device before increasing its refcnt.

Signed-off-by: Yabin Cui <yabinc@google.com>
Suggested-by: James Clark <james.clark@linaro.org>
Suggested-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c | 6 +++++-
 drivers/hwtracing/coresight/coresight-catu.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index b1d490dd7249..0caf3a3e75ce 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -466,7 +466,10 @@ static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		CS_UNLOCK(catu_drvdata->base);
 		rc = catu_enable_hw(catu_drvdata, mode, data);
 		CS_LOCK(catu_drvdata->base);
-	}
+		if (!rc)
+			catu_drvdata->mode = mode;
+	} else if (catu_drvdata->mode != mode)
+		rc = -EBUSY;
 	if (!rc)
 		csdev->refcnt++;
 	return rc;
@@ -499,6 +502,7 @@ static int catu_disable(struct coresight_device *csdev, void *__unused)
 		CS_UNLOCK(catu_drvdata->base);
 		rc = catu_disable_hw(catu_drvdata);
 		CS_LOCK(catu_drvdata->base);
+		catu_drvdata->mode = CS_MODE_DISABLED;
 	} else {
 		rc = -EBUSY;
 	}
diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
index 755776cd19c5..ea406464f0a8 100644
--- a/drivers/hwtracing/coresight/coresight-catu.h
+++ b/drivers/hwtracing/coresight/coresight-catu.h
@@ -66,6 +66,7 @@ struct catu_drvdata {
 	struct coresight_device *csdev;
 	int irq;
 	raw_spinlock_t spinlock;
+	enum cs_mode mode;
 };
 
 #define CATU_REG32(name, offset)					\
-- 
2.49.0.472.ge94155a9ec-goog

