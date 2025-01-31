Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A19E1F03D0
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341431; cv=none; b=jNR/kYFx/P/HEXGoQCDvIISkiqh/tM4zBEzni9dug9oQvlhiu4UysCc2Gzoi170PF2OKSx4riI02DdCphl7w4FI+9E+sDkUhy0mOFjJy8eixVW2wLn1Sv0ZAimx/HtHcHbhZgjLf1HObd9y6RexNzxaV1JMoNedsfGvBIl/vAKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341431; c=relaxed/simple;
	bh=aH8AK/Cr/TlhW68pX4fzQZiqyaIyd8diJGumlVEF+i8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JaadFLi25cOKPOv3NHzMHvpbGMRXuxWswEx8cLv08DiLK+SwAKeF9u4D91aiJ/3eY9ixj3GaQdxO4b7J4782xDn18+WSVkQJ/bRTySnJb8Rpo9N2A+j1nwkBxmsGnPZ2tNaY2ffaYL9qWlhCFr7WSmZfi+U6OHYeb7THpSS8YXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L1uwciBM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L1uwciBM"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so25619485e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738341427; x=1738946227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7MomK86+ouS/G5oAALpKpnv8TVzemPi9Q2kt64Ct2c=;
        b=L1uwciBMrVopVBc7zUjtEzsbvG3sRUYklUYjQ+UXskYDNeOG+y+PuAha+/Ny54gerV
         zLhkKCNEo46pXeal+Q9pZNmYDY5SddmYeg0bs7i54Djjte7Wul8ViVy8GoiuyzaKBpfs
         o+LYwqNcU11dWVV2m2h/gIsvBlvP6ug2FabHcieoMLrBIPorR6FpbNoHqRRWjYF19r5c
         nsL6QjyT16wQ64UqOCbBmHpgfoyUFzlYfWPCsQO5JJvnVj6vaJcumCOgRaIZd0ZRw0qP
         n0ctQwTBc5x5nrvoQKWx2p/MWhXDL6F9WijE8NXzgyQkiFvN7QkLHcy69504Tx6ESYie
         xbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738341427; x=1738946227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7MomK86+ouS/G5oAALpKpnv8TVzemPi9Q2kt64Ct2c=;
        b=uHfGvk+I6+k4tsa+fNf//D10M98anZMZa3IqhHcIIT76Rkw5B7sj9glGsiY1Z36Xtj
         6wGNyu07d3+P7PVixRI7LYVDiF+yP0GeyBNOdWyOBWxvdLglPk1+vrHIIlOpt8bJDq+S
         qoqNlXbV33ms3ldku0tgd9WwdNejLabCLk0+PfFAbVVTIVii6Epl77Y+Ewxl8QrvsGZH
         DG/ARand6+Jm1ks3k/JWeE5YM7XMDIOU2UNoPxKX14lQvQImyNVwyIAWp3ioDhcPPwid
         f4xhkd/7dGBsbUGig9gNMRwYRRAwtsMVdko74nK93lbxZ3X0W8t8/83Bv63TyBE90aro
         wAKA==
X-Forwarded-Encrypted: i=1; AJvYcCXEIX57N6jnd0GsB+jl1lu44a7I4pAbZqQ8n5o9x/pyx5z1UBoQbSJ/BT6Yzggb2U4M3O2SF9DuoqIr4QY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcurjU8Si8zyP3KpiJSBlKOOxDh2aRZsJsrcATVQKl/jT98VPg
	gXLC+Zo1xdDebkuobmD0z2cOp83Rgo3XdVd0dcHHsR47wDCt/z1YWgXIKzSIZMg=
X-Gm-Gg: ASbGncvdJaiI0HTUSt2RVuUIUptCPj+Ge/gwg50fVrWss+kdjQIcjaFJXXaoP0F0o0c
	8WH1vXk+Pvg3Wd1vRA9Bt93drh5pNsqHeC9ajE8hxIyaRjaMcxf6vcOypfwi5f6ESCLZHiYvs5u
	49SFG0ocXKnLG/olAKTzwkT7j4R70loOKTu/ASroREN09n2Jo/B9BhTPle59djxHqCOUiJVvD6E
	gxYG/6cPBa6YsYzrKNtfyokfxeXsUkowY2ssbr6KLS9eWToCrWRx+hS3MkSB87KcrI8vHHQTV/I
	EDkvckRurs/jI5k=
X-Google-Smtp-Source: AGHT+IFW6UUx3VFvrhhQA0UKfWXPE61O1AfZdbHWQgh9U8vY75F7edI1Un+IGYs+RKA8bLLCI9gYtQ==
X-Received: by 2002:a7b:c347:0:b0:436:6460:e680 with SMTP id 5b1f17b1804b1-438dc3cc9e6mr118298935e9.16.1738341427298;
        Fri, 31 Jan 2025 08:37:07 -0800 (PST)
Received: from pop-os.. ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1e8f53sm4975118f8f.100.2025.01.31.08.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:36:53 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: quic_jiegan@quicinc.com
Cc: quic_tingweiz@quicinc.com,
	quic_jinlmao@quicinc.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	alexander.shishkin@linux.intel.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	James Clark <james.clark@linaro.org>
Subject: [PATCH 1/3] coresight: Don't save handle in path
Date: Fri, 31 Jan 2025 16:36:13 +0000
Message-Id: <20250131163617.1730505-2-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131163617.1730505-1-james.clark@linaro.org>
References: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
 <20250131163617.1730505-1-james.clark@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c     | 10 +++++-----
 drivers/hwtracing/coresight/coresight-dummy.c    |  2 +-
 drivers/hwtracing/coresight/coresight-etb10.c    |  8 +++-----
 drivers/hwtracing/coresight/coresight-etm-perf.c |  3 +--
 drivers/hwtracing/coresight/coresight-priv.h     |  4 ++--
 drivers/hwtracing/coresight/coresight-sysfs.c    |  2 +-
 drivers/hwtracing/coresight/coresight-tmc-etf.c  |  9 ++++-----
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 13 +++++--------
 drivers/hwtracing/coresight/coresight-tmc.h      |  2 +-
 drivers/hwtracing/coresight/coresight-tpiu.c     |  2 +-
 drivers/hwtracing/coresight/coresight-trbe.c     |  4 +---
 drivers/hwtracing/coresight/ultrasoc-smb.c       |  8 +++-----
 include/linux/coresight.h                        |  2 +-
 13 files changed, 29 insertions(+), 40 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 11d5d5320b1a..253ef02fde12 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -272,9 +272,9 @@ void coresight_add_helper(struct coresight_device *csdev,
 EXPORT_SYMBOL_GPL(coresight_add_helper);
 
 static int coresight_enable_sink(struct coresight_device *csdev,
-				 enum cs_mode mode, void *data)
+				 enum cs_mode mode, struct perf_output_handle *handle)
 {
-	return sink_ops(csdev)->enable(csdev, mode, data);
+	return sink_ops(csdev)->enable(csdev, mode, handle);
 }
 
 static void coresight_disable_sink(struct coresight_device *csdev)
@@ -448,7 +448,8 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
 	return 0;
 }
 
-int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode)
+int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode,
+			  struct perf_output_handle *handle)
 {
 	int ret = 0;
 	u32 type;
@@ -479,7 +480,7 @@ int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode)
 
 		switch (type) {
 		case CORESIGHT_DEV_TYPE_SINK:
-			ret = coresight_enable_sink(csdev, mode, cs_path);
+			ret = coresight_enable_sink(csdev, mode, handle);
 			/*
 			 * Sink is the first component turned on. If we
 			 * failed to enable the sink, there are no components
@@ -807,7 +808,6 @@ void coresight_release_path(struct coresight_path *cs_path)
 		kfree(nd);
 	}
 
-	cs_path->handle = NULL;
 	kfree(cs_path->path);
 	kfree(cs_path);
 }
diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index dfcf24e9c49a..6f86d33efef4 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -54,7 +54,7 @@ static int dummy_source_trace_id(struct coresight_device *csdev, enum cs_mode mo
 }
 
 static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
-				void *data)
+				struct perf_output_handle *handle)
 {
 	dev_dbg(csdev->dev.parent, "Dummy sink enabled\n");
 
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index 05430d8931d1..e373b0f590bf 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -167,14 +167,12 @@ static int etb_enable_sysfs(struct coresight_device *csdev)
 	return ret;
 }
 
-static int etb_enable_perf(struct coresight_device *csdev, void *data)
+static int etb_enable_perf(struct coresight_device *csdev, struct perf_output_handle *handle)
 {
 	int ret = 0;
 	pid_t pid;
 	unsigned long flags;
 	struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct coresight_path *cs_path = (struct coresight_path *)data;
-	struct perf_output_handle *handle = cs_path->handle;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
@@ -225,7 +223,7 @@ static int etb_enable_perf(struct coresight_device *csdev, void *data)
 }
 
 static int etb_enable(struct coresight_device *csdev, enum cs_mode mode,
-		      void *data)
+		      struct perf_output_handle *handle)
 {
 	int ret;
 
@@ -234,7 +232,7 @@ static int etb_enable(struct coresight_device *csdev, enum cs_mode mode,
 		ret = etb_enable_sysfs(csdev);
 		break;
 	case CS_MODE_PERF:
-		ret = etb_enable_perf(csdev, data);
+		ret = etb_enable_perf(csdev, handle);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index b6765abb0a26..0fad9968c2c0 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -501,9 +501,8 @@ static void etm_event_start(struct perf_event *event, int flags)
 	if (WARN_ON_ONCE(!sink))
 		goto fail_end_stop;
 
-	cs_path->handle = handle;
 	/* Nothing will happen without a path */
-	if (coresight_enable_path(cs_path, CS_MODE_PERF))
+	if (coresight_enable_path(cs_path, CS_MODE_PERF, handle))
 		goto fail_end_stop;
 
 	/* Finally enable the tracer */
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 8e02a222b9f8..7bd43304f461 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -112,7 +112,6 @@ struct cs_buffers {
  * @trace_id:		trace_id of the whole path.
  */
 struct coresight_path {
-	struct perf_output_handle	*handle;
 	struct list_head		*path;
 	u8				trace_id;
 };
@@ -142,7 +141,8 @@ static inline void CS_UNLOCK(void __iomem *addr)
 }
 
 void coresight_disable_path(struct coresight_path *cs_path);
-int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode);
+int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode,
+			  struct perf_output_handle *handle);
 struct coresight_device *coresight_get_sink(struct list_head *path);
 struct coresight_device *coresight_get_sink_by_id(u32 id);
 struct coresight_device *
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 04e76cc1bfdf..f9a6b838726c 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -209,7 +209,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 		goto out;
 	}
 
-	ret = coresight_enable_path(cs_path, CS_MODE_SYSFS);
+	ret = coresight_enable_path(cs_path, CS_MODE_SYSFS, NULL);
 	if (ret)
 		goto err_path;
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index e6b07f917556..fdf1c2511d67 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -244,14 +244,13 @@ static int tmc_enable_etf_sink_sysfs(struct coresight_device *csdev)
 	return ret;
 }
 
-static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
+static int tmc_enable_etf_sink_perf(struct coresight_device *csdev,
+				    struct perf_output_handle *handle)
 {
 	int ret = 0;
 	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct coresight_path *cs_path= (struct coresight_path *)data;
-	struct perf_output_handle *handle = cs_path->handle;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
@@ -303,7 +302,7 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
 }
 
 static int tmc_enable_etf_sink(struct coresight_device *csdev,
-			       enum cs_mode mode, void *data)
+			       enum cs_mode mode, struct perf_output_handle *handle)
 {
 	int ret;
 
@@ -312,7 +311,7 @@ static int tmc_enable_etf_sink(struct coresight_device *csdev,
 		ret = tmc_enable_etf_sink_sysfs(csdev);
 		break;
 	case CS_MODE_PERF:
-		ret = tmc_enable_etf_sink_perf(csdev, data);
+		ret = tmc_enable_etf_sink_perf(csdev, handle);
 		break;
 	/* We shouldn't be here */
 	default:
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 82a872882e24..2d0bd06bab2a 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1252,10 +1252,8 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 }
 
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
-				   enum cs_mode mode, void *data)
+				   enum cs_mode mode, struct perf_output_handle *handle)
 {
-	struct coresight_path *cs_path = (struct coresight_path *)data;
-	struct perf_output_handle *handle = cs_path->handle;
 	struct etr_perf_buffer *etr_perf;
 
 	switch (mode) {
@@ -1643,14 +1641,13 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
 	return size;
 }
 
-static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
+static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
+				    struct perf_output_handle *handle)
 {
 	int rc = 0;
 	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct coresight_path *cs_path = (struct coresight_path *)data;
-	struct perf_output_handle *handle = cs_path->handle;
 	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
@@ -1698,13 +1695,13 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 }
 
 static int tmc_enable_etr_sink(struct coresight_device *csdev,
-			       enum cs_mode mode, void *data)
+			       enum cs_mode mode, struct perf_output_handle *handle)
 {
 	switch (mode) {
 	case CS_MODE_SYSFS:
 		return tmc_enable_etr_sink_sysfs(csdev);
 	case CS_MODE_PERF:
-		return tmc_enable_etr_sink_perf(csdev, data);
+		return tmc_enable_etr_sink_perf(csdev, handle);
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 2671926be62a..e991afd43742 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -336,7 +336,7 @@ struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
-				   enum cs_mode mode, void *data);
+				   enum cs_mode mode, struct perf_output_handle *handle);
 extern const struct attribute_group coresight_etr_group;
 
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 97ef36f03ec2..ccf463ac7bf5 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -75,7 +75,7 @@ static void tpiu_enable_hw(struct csdev_access *csa)
 }
 
 static int tpiu_enable(struct coresight_device *csdev, enum cs_mode mode,
-		       void *__unused)
+		       struct perf_output_handle *__unused)
 {
 	struct tpiu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 5005efd88a66..997d5976d2d2 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1009,12 +1009,10 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
 }
 
 static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
-			   void *data)
+			   struct perf_output_handle *handle)
 {
 	struct trbe_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
-	struct coresight_path *cs_path = (struct coresight_path *)data;
-	struct perf_output_handle *handle = cs_path->handle;
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 
 	WARN_ON(cpudata->cpu != smp_processor_id());
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
index 9be88394b3bb..1574b5067206 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -213,11 +213,9 @@ static void smb_enable_sysfs(struct coresight_device *csdev)
 	coresight_set_mode(csdev, CS_MODE_SYSFS);
 }
 
-static int smb_enable_perf(struct coresight_device *csdev, void *data)
+static int smb_enable_perf(struct coresight_device *csdev, struct perf_output_handle *handle)
 {
 	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct coresight_path *cs_path = (struct coresight_path *)data;
-	struct perf_output_handle *handle = cs_path->handle;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 	pid_t pid;
 
@@ -241,7 +239,7 @@ static int smb_enable_perf(struct coresight_device *csdev, void *data)
 }
 
 static int smb_enable(struct coresight_device *csdev, enum cs_mode mode,
-		      void *data)
+		      struct perf_output_handle *handle)
 {
 	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
 	int ret = 0;
@@ -262,7 +260,7 @@ static int smb_enable(struct coresight_device *csdev, enum cs_mode mode,
 		smb_enable_sysfs(csdev);
 		break;
 	case CS_MODE_PERF:
-		ret = smb_enable_perf(csdev, data);
+		ret = smb_enable_perf(csdev, handle);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 87f9baa7fefe..a859fc00eef9 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -353,7 +353,7 @@ enum cs_mode {
  */
 struct coresight_ops_sink {
 	int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
-		      void *data);
+		      struct perf_output_handle *handle);
 	int (*disable)(struct coresight_device *csdev);
 	void *(*alloc_buffer)(struct coresight_device *csdev,
 			      struct perf_event *event, void **pages,
-- 
2.34.1

