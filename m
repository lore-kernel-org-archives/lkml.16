Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9342E628
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 15:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345677; cv=none; b=M/ZmnfkbSf1DPAZyXai6IFGbPPtPAJJpGeqOYLoW9Uk2tKTTCeoN727uepkQHBdHOwvBsJTNbBcEcqKA1v6hfNRepQiR7l6KcELqY6lNl5OaqGYQiLHqeg8xg7cUYwl5ymPMV83NLBTz1WcGN7HsZJ6k0BQ31/am9WB/sdkIppg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345677; c=relaxed/simple;
	bh=DtPX7RhHVbXubCh0Jb2VoyEetOalS11DjVojxmnxXVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s2WrDuYOdfyrcp5uEYrGGK6fnyY82VFgwGAtQ7k6a5iqWupUHJfC3s80QK9kOf4UUc15T1V0Yd4VIPHvpELlnzxp/2wfJyo+I8m+0rPbtraBHOF3GaZQZ4cAKZH9UgFTiMoBFbck2rVUvoSijPQTZC512pI6iPQgKFzmW9mximE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVcdC2Ju; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVcdC2Ju"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a43afb04a7so6501891cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750345674; x=1750950474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jl+tkAD7IEqapxaqKMGyyy5Mng7FOC4KQp7Byq+9H6M=;
        b=YVcdC2JufXtLGUjeSWvbQw6R4F0hfhj3wzbe2K8v4Ey3TMXKpat4fBnmDJB+0HfyNS
         KMX17Sgjx5Ce1flGjkAEsYEqd3a1+srhz+6Mkg/5XSylGw4x9kRBJe12p1drKEam2962
         S9Ntl9nc8osPvnvUH71/ATvd8ZNkzMdvUVX1Iy++bbO8z7SF5SxsdXtuELv4ayJlgrkV
         xeXK0N36ElPiKamXZ2zRp+z1x8VkNkU4jTW6FSpQCRTT9gVEIyfuk1mhjaeyOF9WZJwk
         gXUIP3FX7+houEnHTmaMuc+248FFVPyNzwdLBd5yw9TzGn9NTtTo27H0TVoGmyvP7g/X
         MssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750345674; x=1750950474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jl+tkAD7IEqapxaqKMGyyy5Mng7FOC4KQp7Byq+9H6M=;
        b=pngzWUFdw3QfttgNLA2cVE+SOstOqOjTuQYDUo8s4w9+iy+7iv6Yoi8i/1lFK/EOww
         FKGryPB6ZLvy66R8osJWLrw7WG/PF5ggvgafcRMiWhsZlER4SGVpFpg16JqG9bUnLDcz
         Od0NvTm/RP/Crpw/pqQ3bIYaHvZHfNZIqeBnvHFMoT0T2cimQ6QkJkow0FZfZbgmHtpq
         VQiWjcHyG2aDD0vXtsUI9yyOGKto+boUT07m/5B7VnFFxfH2qvasIFepOtDdk4aMzpjW
         NIcznX4X+jOKq8MjPYEGJm49JVfTq/OzqOJxa3IIMEhMpi7W9kofFDRBFfN8vbcl4+yX
         G5tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv/W2zQwV092VfEZj53j193Q2wl5fNdQI21NigGfTAX5pSMYlF9AUTDknstAxXKAo6cVlvbhKq8fueoOU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt5gkTaPQ2wLZ9WpYqhindCqUhcJ0uODQESgOf751aFQHy1yqA
	GVNWMpnEkAI/VHXU4bFbj0dcDu/xIRk91TAgCC5cnYkWPCdt+7zjZX/7
X-Gm-Gg: ASbGncv05fna2NtX3DEvutLhES2hEY4lc6XgE8hdke3jMWZoqMxlh4Qg3i0wsXJTudS
	2valxS7Yz3QUpdw+jKthBLjnrHjceqBlMbeFxF7+OEOT+mesyKgkyp+l0PvR++uEp0uKpIPAnLT
	SBRtWZ8YkkZuoil9kZ0QxpzkOLPwrw3f6h8LzgDcKt3AxIKyIyBcR7qO6poXVrN1pIpfM5GEQp+
	jR4z5bNXnLlw3BSOYwIagwvH7WxY7ZtCWlREVBgJUxxnvUj9xFhLMDjaqoKXwRncyOhFy4R+Bsa
	NQ6/PFvdUsg/Iu29E5mjhpySaNN2kGDkmKYT1D0LwCY/Tg08JYEsB3iSoSls46FR7CLI1JojrzC
	rtTtWhKGuCe4oDbGhKXUjdh7i+CIF
X-Google-Smtp-Source: AGHT+IHOF9D5TQmsnL7C3KjpeO6dx0IaKRZCSuOUc0dAk2GQ+U8l0Y2BashIDjIRAs0q3yQmjfbFAw==
X-Received: by 2002:a05:622a:11c9:b0:4a7:6e0c:7606 with SMTP id d75a77b69052e-4a76e0c792bmr55487251cf.32.1750345674027;
        Thu, 19 Jun 2025 08:07:54 -0700 (PDT)
Received: from fyre-x-redhat96-client-2.fyre.ibm.com ([129.41.87.1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a778394f64sm490471cf.0.2025.06.19.08.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 08:07:53 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: suzuki.poulose@arm.com,
	alexander.shishkin@linux.intel.com,
	mike.leach@linaro.org
Cc: james.clark@linaro.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] coresight: Replace scnprintf() with sysfs_emit() in sysfs show functions
Date: Thu, 19 Jun 2025 08:07:30 -0700
Message-ID: <20250619150730.413287-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace calls to scnprintf() with sysfs_emit() in sysfs show functions.
These helpers are preferred in sysfs callbacks because they automatically
handle buffer sizing (PAGE_SIZE) and improve safety and readability.

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 .../hwtracing/coresight/coresight-etm-perf.c  |   4 +-
 .../coresight/coresight-etm3x-sysfs.c         |   2 +-
 .../coresight/coresight-etm4x-sysfs.c         | 108 +++++++++---------
 drivers/hwtracing/coresight/coresight-stm.c   |   8 +-
 4 files changed, 61 insertions(+), 61 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f1551c08ecb2..8cfdcbc2f8f6 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -851,7 +851,7 @@ static ssize_t etm_perf_sink_name_show(struct device *dev,
 	struct dev_ext_attribute *ea;
 
 	ea = container_of(dattr, struct dev_ext_attribute, attr);
-	return scnprintf(buf, PAGE_SIZE, "0x%lx\n", (unsigned long)(ea->var));
+	return sysfs_emit(buf, "0x%lx\n", (unsigned long)(ea->var));
 }
 
 static struct dev_ext_attribute *
@@ -943,7 +943,7 @@ static ssize_t etm_perf_cscfg_event_show(struct device *dev,
 	struct dev_ext_attribute *ea;
 
 	ea = container_of(dattr, struct dev_ext_attribute, attr);
-	return scnprintf(buf, PAGE_SIZE, "configid=0x%lx\n", (unsigned long)(ea->var));
+	return sysfs_emit(buf, "configid=0x%lx\n", (unsigned long)(ea->var));
 }
 
 int etm_perf_add_symlink_cscfg(struct device *dev, struct cscfg_config_desc *config_desc)
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index 762109307b86..4868eb05a312 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -1182,7 +1182,7 @@ static ssize_t cpu_show(struct device *dev,
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->cpu;
-	return scnprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 
 }
 static DEVICE_ATTR_RO(cpu);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index ab251865b893..7cf4045cc748 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -63,7 +63,7 @@ static ssize_t nr_pe_cmp_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->nr_pe_cmp;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(nr_pe_cmp);
 
@@ -75,7 +75,7 @@ static ssize_t nr_addr_cmp_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->nr_addr_cmp;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(nr_addr_cmp);
 
@@ -87,7 +87,7 @@ static ssize_t nr_cntr_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->nr_cntr;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(nr_cntr);
 
@@ -99,7 +99,7 @@ static ssize_t nr_ext_inp_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->nr_ext_inp;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(nr_ext_inp);
 
@@ -111,7 +111,7 @@ static ssize_t numcidc_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->numcidc;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(numcidc);
 
@@ -123,7 +123,7 @@ static ssize_t numvmidc_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->numvmidc;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(numvmidc);
 
@@ -135,7 +135,7 @@ static ssize_t nrseqstate_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->nrseqstate;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(nrseqstate);
 
@@ -147,7 +147,7 @@ static ssize_t nr_resource_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->nr_resource;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(nr_resource);
 
@@ -159,7 +159,7 @@ static ssize_t nr_ss_cmp_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->nr_ss_cmp;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(nr_ss_cmp);
 
@@ -287,7 +287,7 @@ static ssize_t mode_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->mode;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t mode_store(struct device *dev,
@@ -453,7 +453,7 @@ static ssize_t pe_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->pe_sel;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t pe_store(struct device *dev,
@@ -488,7 +488,7 @@ static ssize_t event_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->eventctrl0;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t event_store(struct device *dev,
@@ -537,7 +537,7 @@ static ssize_t event_instren_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = FIELD_GET(TRCEVENTCTL1R_INSTEN_MASK, config->eventctrl1);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t event_instren_store(struct device *dev,
@@ -593,7 +593,7 @@ static ssize_t event_ts_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->ts_ctrl;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t event_ts_store(struct device *dev,
@@ -623,7 +623,7 @@ static ssize_t syncfreq_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->syncfreq;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t syncfreq_store(struct device *dev,
@@ -653,7 +653,7 @@ static ssize_t cyc_threshold_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->ccctlr;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t cyc_threshold_store(struct device *dev,
@@ -686,7 +686,7 @@ static ssize_t bb_ctrl_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->bb_ctrl;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t bb_ctrl_store(struct device *dev,
@@ -726,7 +726,7 @@ static ssize_t event_vinst_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = FIELD_GET(TRCVICTLR_EVENT_MASK, config->vinst_ctrl);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t event_vinst_store(struct device *dev,
@@ -758,7 +758,7 @@ static ssize_t s_exlevel_vinst_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = FIELD_GET(TRCVICTLR_EXLEVEL_S_MASK, config->vinst_ctrl);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t s_exlevel_vinst_store(struct device *dev,
@@ -793,7 +793,7 @@ static ssize_t ns_exlevel_vinst_show(struct device *dev,
 
 	/* EXLEVEL_NS, bits[23:20] */
 	val = FIELD_GET(TRCVICTLR_EXLEVEL_NS_MASK, config->vinst_ctrl);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t ns_exlevel_vinst_store(struct device *dev,
@@ -827,7 +827,7 @@ static ssize_t addr_idx_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->addr_idx;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t addr_idx_store(struct device *dev,
@@ -866,7 +866,7 @@ static ssize_t addr_instdatatype_show(struct device *dev,
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	val = FIELD_GET(TRCACATRn_TYPE_MASK, config->addr_acc[idx]);
-	len = scnprintf(buf, PAGE_SIZE, "%s\n",
+	len = sysfs_emit(buf, "%s\n",
 			val == TRCACATRn_TYPE_ADDR ? "instr" :
 			(val == TRCACATRn_TYPE_DATA_LOAD_ADDR ? "data_load" :
 			(val == TRCACATRn_TYPE_DATA_STORE_ADDR ? "data_store" :
@@ -918,7 +918,7 @@ static ssize_t addr_single_show(struct device *dev,
 	}
 	val = (unsigned long)config->addr_val[idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t addr_single_store(struct device *dev,
@@ -974,7 +974,7 @@ static ssize_t addr_range_show(struct device *dev,
 	val1 = (unsigned long)config->addr_val[idx];
 	val2 = (unsigned long)config->addr_val[idx + 1];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx %#lx\n", val1, val2);
+	return sysfs_emit(buf, "%#lx %#lx\n", val1, val2);
 }
 
 static ssize_t addr_range_store(struct device *dev,
@@ -1049,7 +1049,7 @@ static ssize_t addr_start_show(struct device *dev,
 
 	val = (unsigned long)config->addr_val[idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t addr_start_store(struct device *dev,
@@ -1104,7 +1104,7 @@ static ssize_t addr_stop_show(struct device *dev,
 
 	val = (unsigned long)config->addr_val[idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t addr_stop_store(struct device *dev,
@@ -1152,7 +1152,7 @@ static ssize_t addr_ctxtype_show(struct device *dev,
 	idx = config->addr_idx;
 	/* CONTEXTTYPE, bits[3:2] */
 	val = FIELD_GET(TRCACATRn_CONTEXTTYPE_MASK, config->addr_acc[idx]);
-	len = scnprintf(buf, PAGE_SIZE, "%s\n", val == ETM_CTX_NONE ? "none" :
+	len = sysfs_emit(buf, "%s\n", val == ETM_CTX_NONE ? "none" :
 			(val == ETM_CTX_CTXID ? "ctxid" :
 			(val == ETM_CTX_VMID ? "vmid" : "all")));
 	raw_spin_unlock(&drvdata->spinlock);
@@ -1219,7 +1219,7 @@ static ssize_t addr_context_show(struct device *dev,
 	/* context ID comparator bits[6:4] */
 	val = FIELD_GET(TRCACATRn_CONTEXT_MASK, config->addr_acc[idx]);
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t addr_context_store(struct device *dev,
@@ -1262,7 +1262,7 @@ static ssize_t addr_exlevel_s_ns_show(struct device *dev,
 	idx = config->addr_idx;
 	val = FIELD_GET(TRCACATRn_EXLEVEL_MASK, config->addr_acc[idx]);
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t addr_exlevel_s_ns_store(struct device *dev,
@@ -1325,7 +1325,7 @@ static ssize_t addr_cmp_view_show(struct device *dev,
 	}
 	raw_spin_unlock(&drvdata->spinlock);
 	if (addr_type) {
-		size = scnprintf(buf, PAGE_SIZE, "addr_cmp[%i] %s %#lx", idx,
+		size = sysfs_emit(buf, "addr_cmp[%i] %s %#lx", idx,
 				 addr_type_names[addr_type], addr_v);
 		if (addr_type == ETM_ADDR_TYPE_RANGE) {
 			size += scnprintf(buf + size, PAGE_SIZE - size,
@@ -1335,7 +1335,7 @@ static ssize_t addr_cmp_view_show(struct device *dev,
 		size += scnprintf(buf + size, PAGE_SIZE - size,
 				  " ctrl(%#lx)\n", addr_ctrl);
 	} else {
-		size = scnprintf(buf, PAGE_SIZE, "addr_cmp[%i] unused\n", idx);
+		size = sysfs_emit(buf, "addr_cmp[%i] unused\n", idx);
 	}
 	return size;
 }
@@ -1352,7 +1352,7 @@ static ssize_t vinst_pe_cmp_start_stop_show(struct device *dev,
 	if (!drvdata->nr_pe_cmp)
 		return -EINVAL;
 	val = config->vipcssctlr;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static ssize_t vinst_pe_cmp_start_stop_store(struct device *dev,
 					     struct device_attribute *attr,
@@ -1383,7 +1383,7 @@ static ssize_t seq_idx_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->seq_idx;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t seq_idx_store(struct device *dev,
@@ -1419,7 +1419,7 @@ static ssize_t seq_state_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->seq_state;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t seq_state_store(struct device *dev,
@@ -1453,7 +1453,7 @@ static ssize_t seq_event_show(struct device *dev,
 	idx = config->seq_idx;
 	val = config->seq_ctrl[idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t seq_event_store(struct device *dev,
@@ -1486,7 +1486,7 @@ static ssize_t seq_reset_event_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->seq_rst;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t seq_reset_event_store(struct device *dev,
@@ -1516,7 +1516,7 @@ static ssize_t cntr_idx_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->cntr_idx;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t cntr_idx_store(struct device *dev,
@@ -1556,7 +1556,7 @@ static ssize_t cntrldvr_show(struct device *dev,
 	idx = config->cntr_idx;
 	val = config->cntrldvr[idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t cntrldvr_store(struct device *dev,
@@ -1594,7 +1594,7 @@ static ssize_t cntr_val_show(struct device *dev,
 	idx = config->cntr_idx;
 	val = config->cntr_val[idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t cntr_val_store(struct device *dev,
@@ -1632,7 +1632,7 @@ static ssize_t cntr_ctrl_show(struct device *dev,
 	idx = config->cntr_idx;
 	val = config->cntr_ctrl[idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t cntr_ctrl_store(struct device *dev,
@@ -1664,7 +1664,7 @@ static ssize_t res_idx_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->res_idx;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t res_idx_store(struct device *dev,
@@ -1708,7 +1708,7 @@ static ssize_t res_ctrl_show(struct device *dev,
 	idx = config->res_idx;
 	val = config->res_ctrl[idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t res_ctrl_store(struct device *dev,
@@ -1746,7 +1746,7 @@ static ssize_t sshot_idx_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->ss_idx;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t sshot_idx_store(struct device *dev,
@@ -1780,7 +1780,7 @@ static ssize_t sshot_ctrl_show(struct device *dev,
 	raw_spin_lock(&drvdata->spinlock);
 	val = config->ss_ctrl[config->ss_idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t sshot_ctrl_store(struct device *dev,
@@ -1815,7 +1815,7 @@ static ssize_t sshot_status_show(struct device *dev,
 	raw_spin_lock(&drvdata->spinlock);
 	val = config->ss_status[config->ss_idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(sshot_status);
 
@@ -1830,7 +1830,7 @@ static ssize_t sshot_pe_ctrl_show(struct device *dev,
 	raw_spin_lock(&drvdata->spinlock);
 	val = config->ss_pe_cmp[config->ss_idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t sshot_pe_ctrl_store(struct device *dev,
@@ -1864,7 +1864,7 @@ static ssize_t ctxid_idx_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->ctxid_idx;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t ctxid_idx_store(struct device *dev,
@@ -1911,7 +1911,7 @@ static ssize_t ctxid_pid_show(struct device *dev,
 	idx = config->ctxid_idx;
 	val = (unsigned long)config->ctxid_pid[idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t ctxid_pid_store(struct device *dev,
@@ -1972,7 +1972,7 @@ static ssize_t ctxid_masks_show(struct device *dev,
 	val1 = config->ctxid_mask0;
 	val2 = config->ctxid_mask1;
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx %#lx\n", val1, val2);
+	return sysfs_emit(buf, "%#lx %#lx\n", val1, val2);
 }
 
 static ssize_t ctxid_masks_store(struct device *dev,
@@ -2090,7 +2090,7 @@ static ssize_t vmid_idx_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	val = config->vmid_idx;
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t vmid_idx_store(struct device *dev,
@@ -2135,7 +2135,7 @@ static ssize_t vmid_val_show(struct device *dev,
 	raw_spin_lock(&drvdata->spinlock);
 	val = (unsigned long)config->vmid_val[config->vmid_idx];
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t vmid_val_store(struct device *dev,
@@ -2187,7 +2187,7 @@ static ssize_t vmid_masks_show(struct device *dev,
 	val1 = config->vmid_mask0;
 	val2 = config->vmid_mask1;
 	raw_spin_unlock(&drvdata->spinlock);
-	return scnprintf(buf, PAGE_SIZE, "%#lx %#lx\n", val1, val2);
+	return sysfs_emit(buf, "%#lx %#lx\n", val1, val2);
 }
 
 static ssize_t vmid_masks_store(struct device *dev,
@@ -2303,7 +2303,7 @@ static ssize_t cpu_show(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	val = drvdata->cpu;
-	return scnprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 
 }
 static DEVICE_ATTR_RO(cpu);
@@ -2461,7 +2461,7 @@ static ssize_t coresight_etm4x_reg_show(struct device *dev,
 	val = etmv4_cross_read(drvdata, offset);
 	pm_runtime_put_sync(dev->parent);
 
-	return scnprintf(buf, PAGE_SIZE, "0x%x\n", val);
+	return sysfs_emit(buf, "0x%x\n", val);
 }
 
 static bool
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index e45c6c7204b4..fa09a43889d7 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -470,7 +470,7 @@ static ssize_t hwevent_enable_show(struct device *dev,
 	struct stm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	unsigned long val = drvdata->stmheer;
 
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t hwevent_enable_store(struct device *dev,
@@ -499,7 +499,7 @@ static ssize_t hwevent_select_show(struct device *dev,
 	struct stm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	unsigned long val = drvdata->stmhebsr;
 
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t hwevent_select_store(struct device *dev,
@@ -534,7 +534,7 @@ static ssize_t port_select_show(struct device *dev,
 		spin_unlock(&drvdata->spinlock);
 	}
 
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t port_select_store(struct device *dev,
@@ -581,7 +581,7 @@ static ssize_t port_enable_show(struct device *dev,
 		spin_unlock(&drvdata->spinlock);
 	}
 
-	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+	return sysfs_emit(buf, "%#lx\n", val);
 }
 
 static ssize_t port_enable_store(struct device *dev,
-- 
2.47.1

