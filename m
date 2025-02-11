Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF70C1FAC49
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270452; cv=none; b=lx0OwtJUFaaQYhgznql9Z6qWuqKMJzTtnCag1joLPrzSNoRICoBLdq1vgxPR3wCEVweyaQq8QsSdYQIs2vMhRfe30aFMrBB/obiuC1xuxRm0xWitaZUJ1qeuFYZNkGpEekVsgjJR/QPJVSeX73WLmf2lYQMLIbLLdpJFw2UxDoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270452; c=relaxed/simple;
	bh=W0XzjYlAo4BfVfm0PeSTZtmXbrWCCK835IYaZUTUrJA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ppwEaaDPlEpac20CgEAK4lnINJ6qpcNtOreKiUTZVZ4nVvN7xrroYDYPKpMQPoq/qQHQSVeYvyQ4bPOMP/GqweDlqb/1PVjbBklz1wHnrV1uuJw2I1x5bSyIbnN/baR4gLQwrrPi83vVubzakp16T5zPrASFl92QI1AeRxGYxJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EfyvKaKY; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EfyvKaKY"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so14692115e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739270448; x=1739875248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLT+7yARFu+ZZe2jU+yKN61UJYeQ0L2gWO4wNTXz1Ac=;
        b=EfyvKaKY+PVe27sQy41DFTXZPGw1zwWjfPShktH36cyVCO3wRm7fKTjJrBWNXO6Bn+
         dlgNchyN3gWtoa4YgaeyjiDYlYM4RqJUTrH4iswiVCMG0p5Ubg1tWE1VLH+Z+rk9ogKy
         cU0ICp+ztDkOUpECmPHYzmE7PAP2rwXzRnkrqPMdFcXE8rsToCg9VMZp5S7VDGn4/KoH
         FMNoXNYYTg44LYd97wl3fVFABLEzt31Om+AyFIkIyOpgIuq1s9ocDiPxm1nZoQnaJqNy
         fn6QEt/bIS7A5FUU/7QGDNyx4hRwUhywP9TLZpO+4vsZW/zvT2/NU3foZuxWbIRsdYkT
         Kafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270448; x=1739875248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLT+7yARFu+ZZe2jU+yKN61UJYeQ0L2gWO4wNTXz1Ac=;
        b=aCSEXGewYszjIl8jjzA6o0RrVPji2Cix5vP0qLtBGnZ7JLynP9at5BxsYb4QOUGFYG
         5pqZq7lduwrDJPjgEbzNofZApk3QQhHXNQan4aMC0O8hVnpnISuB2lMHeo21xoRtJB51
         KEo1dpt5UwzkWbXiRkOvhTBSk7Z3LoYgjYjcFn+8Z6WSyn/vwWO26CUA72q/WXUoE/p0
         ECPPAshE/Ti1hgGBpKJMz3DNwU+1MA4WTbvK7yqQ2CVVIi4987EWC6gH/Yg7LxVKfSP7
         1EFlanacMmrcmnGTvifTMX3lJHNVQV8gFoHzYv6DwjVP6l5YyfIrFNfFtJ1oyWA6BF1d
         +dNA==
X-Forwarded-Encrypted: i=1; AJvYcCUgNfJSMdUO0xQDgoythyeKSYGsV2tjwrzI2XOWG9EaCtWQUOwAJbLmfbtXKfYpbG/Cnn7cJqyZU3MkPyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqCMbm0Oe0jR84MG4hKw79RcjLADQzyvNPEqKYrjDYNWTFBoSK
	DcOl1Z/QeWa9ierOMZPTolq52SjRESdHzzkTsnsefqDi0+Gdg6ujnaE2WyZwYIc=
X-Gm-Gg: ASbGncu9fi4UAOJm1cbnosA7U6P9pKFPfVHRUrXc3uRxkAKv4cS6NakezJyvE/6ahX0
	H6krTwGfD+aFrPNGEx/oDfoiU3TwcLH9YSbW0AMJ7Fde6AXnjrIRMuk00WilU5bPX2kke4gOLvS
	7a+Pwiy13tkGCMwfYWmt6Oi2PfpQJU194dW0pcmBXFW4N/1+547qtgn/mWkW6P0YAOY4YFgFxvk
	gvhAcjnK9PBlGrhVSvQDXKn4xTrfl0/oX7QVneQpKXYZpwVYDQim73/bkp0bEOtpLaWZMRJ0wIo
	4Bzk+NtxK+QZ
X-Google-Smtp-Source: AGHT+IGy0JfOP/A4JgJKJRQpoAKt5qMwRlzYsOwuh7SYJBs/gpNnWiLYzgaWj+n9Q0QUYJ0DnLVjhw==
X-Received: by 2002:a5d:6da1:0:b0:38d:d946:db15 with SMTP id ffacd0b85a97d-38dd946de79mr6670134f8f.5.1739270448056;
        Tue, 11 Feb 2025 02:40:48 -0800 (PST)
Received: from pop-os.. ([145.224.65.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd02e2a90sm10456047f8f.98.2025.02.11.02.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:40:47 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: lcherian@marvell.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 7/7] coresight: Remove extern from function declarations
Date: Tue, 11 Feb 2025 10:39:43 +0000
Message-Id: <20250211103945.967495-8-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211103945.967495-1-james.clark@linaro.org>
References: <20250211103945.967495-1-james.clark@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function declarations are extern by default so remove the extra noise
and inconsistency.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-priv.h | 14 ++++-----
 include/linux/coresight.h                    | 33 +++++++++-----------
 2 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index a83113225797..e09071a720f0 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -57,10 +57,8 @@ struct cs_off_attribute {
 	u32 off;
 };
 
-extern ssize_t coresight_simple_show32(struct device *_dev,
-				     struct device_attribute *attr, char *buf);
-extern ssize_t coresight_simple_show_pair(struct device *_dev,
-				     struct device_attribute *attr, char *buf);
+ssize_t coresight_simple_show32(struct device *_dev, struct device_attribute *attr, char *buf);
+ssize_t coresight_simple_show_pair(struct device *_dev, struct device_attribute *attr, char *buf);
 
 #define coresight_simple_reg32(name, offset)				\
 	(&((struct cs_off_attribute[]) {				\
@@ -155,8 +153,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
-extern int etm_readl_cp14(u32 off, unsigned int *val);
-extern int etm_writel_cp14(u32 off, u32 val);
+int etm_readl_cp14(u32 off, unsigned int *val);
+int etm_writel_cp14(u32 off, u32 val);
 #else
 static inline int etm_readl_cp14(u32 off, unsigned int *val) { return 0; }
 static inline int etm_writel_cp14(u32 off, u32 val) { return 0; }
@@ -167,8 +165,8 @@ struct cti_assoc_op {
 	void (*remove)(struct coresight_device *csdev);
 };
 
-extern void coresight_set_cti_ops(const struct cti_assoc_op *cti_op);
-extern void coresight_remove_cti_ops(void);
+void coresight_set_cti_ops(const struct cti_assoc_op *cti_op);
+void coresight_remove_cti_ops(void);
 
 /*
  * Macros and inline functions to handle CoreSight UCI data and driver
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 11808aee9d1d..2b43698c0b25 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -642,26 +642,23 @@ static inline void coresight_set_mode(struct coresight_device *csdev,
 	local_set(&csdev->mode, new_mode);
 }
 
-extern struct coresight_device *
-coresight_register(struct coresight_desc *desc);
-extern void coresight_unregister(struct coresight_device *csdev);
-extern int coresight_enable_sysfs(struct coresight_device *csdev);
-extern void coresight_disable_sysfs(struct coresight_device *csdev);
-extern int coresight_timeout(struct csdev_access *csa, u32 offset,
-			     int position, int value);
-
-extern int coresight_claim_device(struct coresight_device *csdev);
-extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
-
-extern void coresight_disclaim_device(struct csdev_access *csa);
-extern void coresight_disclaim_device_unlocked(struct csdev_access *csa);
+struct coresight_device *coresight_register(struct coresight_desc *desc);
+void coresight_unregister(struct coresight_device *csdev);
+int coresight_enable_sysfs(struct coresight_device *csdev);
+void coresight_disable_sysfs(struct coresight_device *csdev);
+int coresight_timeout(struct csdev_access *csa, u32 offset, int position, int value);
+
+int coresight_claim_device(struct coresight_device *csdev);
+int coresight_claim_device_unlocked(struct coresight_device *csdev);
+
+void coresight_disclaim_device(struct csdev_access *csa);
+void coresight_disclaim_device_unlocked(struct csdev_access *csa);
 int coresight_reset_claim_unlocked(struct csdev_access *csa);
 int coresight_reset_claim(struct csdev_access *csa);
 
-extern char *coresight_alloc_device_name(struct coresight_dev_list *devs,
-					 struct device *dev);
+char *coresight_alloc_device_name(struct coresight_dev_list *devs, struct device *dev);
 
-extern bool coresight_loses_context_with_cpu(struct device *dev);
+bool coresight_loses_context_with_cpu(struct device *dev);
 
 u32 coresight_relaxed_read32(struct coresight_device *csdev, u32 offset);
 u32 coresight_read32(struct coresight_device *csdev, u32 offset);
@@ -674,8 +671,8 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
 			       u64 val, u32 offset);
 void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset);
 
-extern int coresight_get_cpu(struct device *dev);
-extern int coresight_get_static_trace_id(struct device *dev, u32 *id);
+int coresight_get_cpu(struct device *dev);
+int coresight_get_static_trace_id(struct device *dev, u32 *id);
 
 struct coresight_platform_data *coresight_get_platform_data(struct device *dev);
 struct coresight_connection *
-- 
2.34.1

