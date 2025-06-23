Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0176242D6A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675885; cv=none; b=FBQt+XHayabeVAPgH6F1DYXPjEBy9LTe4+YZyWuiXs2CumwYl9QG9FF1QfwXeEaaPEZGdHpR5dL99ED3UO3T6JyxH2skg6tfkz1TBvXHtWc/63ysRwnU/eZ2sd9BLM9y9HJkkev3BpBPVpW/8tFfJCZLv5n+PkRs9M+aisqrNSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675885; c=relaxed/simple;
	bh=cf2mE4zjg9GEqCKUKehqP9oOFCutyourmu24HTRAUr0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VbX199fS5Jm2TZM3cJOhheMLHP4qY3kI8FEwGxR/EAKk0FaC0geR31Y3N/lvq0PhM/pdB//085L5uBxnCBSl5kq8Ubb7de1kSJMUKWDnwiKEQ11XhfTpzDg+wvIvf3gnV5RV/w/ISZo8r6vbpVkMUHKoJHQMiL+OECAFGoMgyOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QpbODwsV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QpbODwsV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N3eXW4029893
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gWN98f3c82+
	9VDHhJ5LqHepgcOVOp6gSM3eOdELEbRQ=; b=QpbODwsV6uvm1mVTnk32yEHfu4M
	pS+2cGDwhzXjs7NrllCKK077defe5cwmoetwTZ7RpXVMQbA3jLPox23D7f0Y4ks2
	51cNIzA8qqMlZJqLPs9oDMFspEfkWBWsJT4jIYBPUQjcbEf094r3nlTpwXwo6f8k
	/4gal08/ik7KwUns0dgUqHt5Eh6dKE8/3F1/uoVx40Y/wCDXsIj6p7avgrOm0ijt
	jM2pi+hTfzVPJlDFcqN5et188xb+KcLk3yLTZBVdSfJpkRXs/dU0A1WKVAzZimKE
	aRGJ1Oq9dSCuYlR3N6ZB6jBE+BqFIxmcrQanZpigPM/1tw8TeDoZC6GrnYA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ey7k14sw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:51:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d413a12847so158832185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675875; x=1751280675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWN98f3c82+9VDHhJ5LqHepgcOVOp6gSM3eOdELEbRQ=;
        b=Cmk1Pwx+n8ZvBu/6FucAzX8BD9g4Q2gkqJm1WvhAVqRCNxj8hGJQiq9sagHR93MhzQ
         QtRHmvCia+ZbrfEBfA6gclBw4KLXZaQUsVz0FZYsP132XUHb/s515m1njLx02N3J73ro
         aAfZMXvIBhDfhQXRZsXVlqw4LWIvvopjnPb7yc1foa+8C12lVTDd79753msLEEmK4mp0
         nAGpnOIHQc8vyLPjUySVJWENFi38TjHCucthPp9MR/yGklp5znSZ081zd7klnT4yGuGA
         P2t+9NfUT8t5K/UrlTVow3X67Kop0kBUUncC/3wDyOwifEzW6Qmdm+F+4xFbqN3/79K2
         IvKA==
X-Forwarded-Encrypted: i=1; AJvYcCUs0HEdRrJXrkvLbAU4lhrNF+DErFTdRguxhjlnF5hv9rWnWXuU2pvo9ibeI0C8ZE3CO1ZxLEgItd3bPD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPdzo3DC65ol8EYvXLVQ+7WBKML8GnRrWXol2pRbzunOO+6F7I
	wIjqt7d+C+wrQGLXCZHY/nkMEjxuaj+vIDoe7QNUZWAJxg/D2YMbNx+DyUYk0RH42kNcVZX4zBB
	d7WMeAxtN6ZlhtlsUGJ4vc84JhvuF5QKaZk95E2c1wocdQfqy4ZHz4+M66RBuBM0LauUR0nVjQV
	Y=
X-Gm-Gg: ASbGnctrRJdxh46lIhuyOWJJjgaQBeoWoWHzo4wuWtaT+JDCzdUA3jOtcqC9jCdssqM
	uLsacQMnElH7dkZVQ0arOFKkFvINE0yCtyBX5z1LqtnNL6L5FfLR3yeSeiUeNbGEfsUZMKfYzwe
	05eZiC0vlY9CV8w9wvJJQ7+Yj3VyGA5xBQ1uMQjqAsdByOV3YrJ9LFDyr/NeTK2Sg8EBERplZYj
	YWGorZFgYh3oDygFVGgVKiCgIwigKJMTOSuxrIQ2dCm/02pe8VVGYVpww1PegyWm8Q0ZeDNnY2e
	Sq8ebCvLCMbcQGNDzPOZdR49ujyer/A/0yd2d/C7cQzqcSu5wTzKXZvDFRwgFI+EY0HPeL0jR+x
	7
X-Received: by 2002:a05:620a:bd5:b0:7d3:a6d1:b66f with SMTP id af79cd13be357-7d3f9951180mr2024645385a.47.1750675874559;
        Mon, 23 Jun 2025 03:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmt0vtirVOaaEFaZbvXbyU9PYKxzWlShCt1BWjKITect2RYo8AwiCc1MMsXX+0FI97bQCEJQ==
X-Received: by 2002:a05:620a:bd5:b0:7d3:a6d1:b66f with SMTP id af79cd13be357-7d3f9951180mr2024640285a.47.1750675873954;
        Mon, 23 Jun 2025 03:51:13 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45365af83easm100821835e9.25.2025.06.23.03.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:51:13 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] media: venus: vdec: AR50_LITE video core support
Date: Mon, 23 Jun 2025 12:51:04 +0200
Message-Id: <20250623105107.3461661-3-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YoEPR5YX c=1 sm=1 tr=0 ts=685931a3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=DlvUenxY_34F2hPXssYA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: bmA4dJuyEvkr01njhwKwra2VNp0EJ1EM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NSBTYWx0ZWRfX14k1M5LRJhMo
 0RbBWTASgxFBEz5BSo1vQPzvM/GTCxm5qkDJlKXfjqXz7ASA5QwmPNfLpBGw9M44YaRYnZkw3yR
 /wsYwkTsDIaN43qkWzrHlCrJQZHjI/FM6tbdZMc1itVIxTUzInq4qyaCLaX9jYkvU6wDx6ZaTuf
 sPYksgOy/48WZ2HVTHD87LO8RgzETXTjfRvGerWmNTawQAIBARRn7IWrtRvaB1rG+beFVq91yDp
 2Mhb3x27v2L0ybs7vvNKnjEdwDuwD10wxvzdzijSWdgzM6EoOFmMkSvycjXWvMfAaKzagkjBqd8
 Ufz2ZplweTU6e+ciJwM/uHaWF1kg5ye+l+rNT08TDjeNu9mXyAwNbNdiKfJaBhy0cV116vvI237
 9tOXsFqkms/kMoY87gTco7+Ssfni8PRKXuG378BeJwpUhhh+vaIkK6mXDCOsH7WKRbSnLo8J
X-Proofpoint-GUID: bmA4dJuyEvkr01njhwKwra2VNp0EJ1EM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230065

The AR50_LITE is a streamlined variant of the AR50 video core, designed
for power and cost-efficient platforms.

It supports hardware-accelerated decoding of H.264, HEVC, and VP9
formats.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c      | 11 ++-
 drivers/media/platform/qcom/venus/core.h      | 11 ++-
 drivers/media/platform/qcom/venus/firmware.c  |  8 +-
 drivers/media/platform/qcom/venus/helpers.c   | 80 +++++++++++++++++++
 drivers/media/platform/qcom/venus/helpers.h   |  2 +
 .../media/platform/qcom/venus/hfi_helper.h    | 10 ++-
 drivers/media/platform/qcom/venus/hfi_venus.c | 14 ++--
 .../media/platform/qcom/venus/pm_helpers.c    |  1 +
 drivers/media/platform/qcom/venus/vdec.c      | 15 ++--
 9 files changed, 128 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index d305d74bb152..736ef53d988d 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -254,14 +254,19 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
 
 static void venus_assign_register_offsets(struct venus_core *core)
 {
-	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
-		core->vbif_base = core->base + VBIF_BASE;
+	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
 		core->cpu_base = core->base + CPU_BASE_V6;
 		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;
 		core->cpu_ic_base = core->base + CPU_IC_BASE_V6;
 		core->wrapper_base = core->base + WRAPPER_BASE_V6;
 		core->wrapper_tz_base = core->base + WRAPPER_TZ_BASE_V6;
-		core->aon_base = core->base + AON_BASE_V6;
+		if (IS_AR50_LITE(core)) {
+			core->vbif_base = NULL;
+			core->aon_base = NULL;
+		} else {
+			core->vbif_base = core->base + VBIF_BASE;
+			core->aon_base = core->base + AON_BASE_V6;
+		}
 	} else {
 		core->vbif_base = core->base + VBIF_BASE;
 		core->cpu_base = core->base + CPU_BASE;
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index b412e0c5515a..e755a28e919b 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -382,6 +382,7 @@ enum venus_inst_modes {
  * @lock:	instance lock
  * @core:	a reference to the core struct
  * @clk_data:	clock data per core ID
+ * @eosbufs:	a lit of EOS buffers
  * @dpbbufs:	a list of decoded picture buffers
  * @internalbufs:	a list of internal bufferes
  * @registeredbufs:	a list of registered capture bufferes
@@ -450,6 +451,7 @@ struct venus_inst {
 	struct mutex lock;
 	struct venus_core *core;
 	struct clock_data clk_data;
+	struct list_head eosbufs;
 	struct list_head dpbbufs;
 	struct list_head internalbufs;
 	struct list_head registeredbufs;
@@ -520,7 +522,14 @@ struct venus_inst {
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
 #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
 #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
-#define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
+static inline bool IS_V6(struct venus_core *core)
+{
+	if (WARN_ON_ONCE(!core))
+		return false;
+
+	return core->res->hfi_version == HFI_VERSION_6XX ||
+	       core->res->hfi_version == HFI_VERSION_6XX_LITE;
+}
 
 #define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
 #define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 66a18830e66d..f8dcef0426ac 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -30,7 +30,7 @@ static void venus_reset_cpu(struct venus_core *core)
 	u32 fw_size = core->fw.mapped_mem_size;
 	void __iomem *wrapper_base;
 
-	if (IS_IRIS2_1(core))
+	if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
 		wrapper_base = core->wrapper_tz_base;
 	else
 		wrapper_base = core->wrapper_base;
@@ -42,7 +42,7 @@ static void venus_reset_cpu(struct venus_core *core)
 	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
 	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
 
-	if (IS_IRIS2_1(core)) {
+	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
 		/* Bring XTSS out of reset */
 		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
 	} else {
@@ -68,7 +68,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
 	if (resume) {
 		venus_reset_cpu(core);
 	} else {
-		if (IS_IRIS2_1(core))
+		if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
 			writel(WRAPPER_XTSS_SW_RESET_BIT,
 			       core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
 		else
@@ -181,7 +181,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
 	void __iomem *wrapper_base = core->wrapper_base;
 	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
 
-	if (IS_IRIS2_1(core)) {
+	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
 		/* Assert the reset to XTSS */
 		reg = readl(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
 		reg |= WRAPPER_XTSS_SW_RESET_BIT;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 8295542e1a7c..812bec9a05be 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -230,6 +230,79 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
 }
 EXPORT_SYMBOL_GPL(venus_helper_alloc_dpb_bufs);
 
+static void free_eos_buf(struct venus_inst *inst, struct intbuf *buf)
+{
+	list_del_init(&buf->list);
+	dma_free_attrs(inst->core->dev, buf->size, buf->va, buf->da,
+		       buf->attrs);
+	kfree(buf);
+}
+
+int venus_helper_free_eos_bufs(struct venus_inst *inst)
+{
+	struct intbuf *buf, *n;
+
+	list_for_each_entry_safe(buf, n, &inst->eosbufs, list) {
+		free_eos_buf(inst, buf);
+	}
+
+	if (list_empty(&inst->eosbufs))
+		INIT_LIST_HEAD(&inst->eosbufs);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(venus_helper_free_eos_bufs);
+
+int venus_helper_alloc_eos_buf(struct venus_inst *inst,
+			       struct hfi_frame_data *data)
+{
+	struct venus_core *core = inst->core;
+	struct device *dev = core->dev;
+	struct intbuf *buf;
+	int ret = 0;
+
+	memset(data, 0, sizeof(*data));
+
+	data->buffer_type = HFI_BUFFER_INPUT;
+	data->flags = HFI_BUFFERFLAG_EOS;
+
+	if (IS_AR50_LITE(inst->core)) {
+		/* We must send valid sizes and addresses */
+		buf = kzalloc(sizeof(*buf), GFP_KERNEL);
+		if (!buf) {
+			ret = -ENOMEM;
+			goto fail;
+		}
+
+		buf->type = HFI_BUFFER_INPUT;
+		buf->size = SZ_4K;
+		buf->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
+		buf->va = dma_alloc_attrs(dev, buf->size, &buf->da, GFP_KERNEL,
+					  buf->attrs);
+		if (!buf->va) {
+			ret = -ENOMEM;
+			goto fail;
+		}
+
+		list_add_tail(&buf->list, &inst->eosbufs);
+
+		data->alloc_len = buf->size;
+		data->device_addr = buf->da;
+
+	} else if (IS_V6(inst->core) &&
+		   is_fw_rev_or_older(inst->core, 1, 0, 87)) {
+		data->device_addr = 0;
+	} else {
+		data->device_addr = 0xdeadb000;
+	}
+
+	return 0;
+fail:
+	kfree(buf);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(venus_helper_alloc_eos_buf);
+
 static int intbufs_set_buffer(struct venus_inst *inst, u32 type)
 {
 	struct venus_core *core = inst->core;
@@ -630,6 +703,13 @@ static int platform_get_bufreq(struct venus_inst *inst, u32 buftype,
 	if (!hfi_plat || !hfi_plat->bufreq)
 		return -EINVAL;
 
+	/* Firmware buffer requirements for internal buffers only */
+	if (IS_AR50_LITE(inst->core))
+		if (buftype != HFI_BUFFER_INPUT &&
+		    buftype != HFI_BUFFER_OUTPUT &&
+		    buftype != HFI_BUFFER_OUTPUT2)
+			return -EINVAL;
+
 	params.version = version;
 	params.num_vpp_pipes = inst->core->res->num_vpp_pipes;
 
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 358e4f39c9c0..bf55fe3b8747 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -58,6 +58,8 @@ int venus_helper_get_out_fmts(struct venus_inst *inst, u32 fmt, u32 *out_fmt,
 bool venus_helper_check_format(struct venus_inst *inst, u32 v4l2_pixfmt);
 int venus_helper_alloc_dpb_bufs(struct venus_inst *inst);
 int venus_helper_free_dpb_bufs(struct venus_inst *inst);
+int venus_helper_alloc_eos_buf(struct venus_inst *inst, struct hfi_frame_data *data);
+int venus_helper_free_eos_bufs(struct venus_inst *inst);
 int venus_helper_intbufs_alloc(struct venus_inst *inst);
 int venus_helper_intbufs_free(struct venus_inst *inst);
 int venus_helper_intbufs_realloc(struct venus_inst *inst);
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index f44059f19505..128ddf8e3cd5 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -397,13 +397,16 @@
 #define HFI_BUFFER_INTERNAL_PERSIST_1		0x5
 #define HFI_BUFFER_INTERNAL_SCRATCH(ver)	\
 	(((ver) == HFI_VERSION_4XX ||		\
-	(ver) == HFI_VERSION_6XX) ? 0x6 : 0x1000001)
+	(ver) == HFI_VERSION_6XX || (ver) == HFI_VERSION_6XX_LITE) \
+	? 0x6 : 0x1000001)
 #define HFI_BUFFER_INTERNAL_SCRATCH_1(ver)	\
 	(((ver) == HFI_VERSION_4XX ||		\
-	(ver) == HFI_VERSION_6XX) ? 0x7 : 0x1000005)
+	(ver) == HFI_VERSION_6XX || (ver) == HFI_VERSION_6XX_LITE) \
+	? 0x7 : 0x1000005)
 #define HFI_BUFFER_INTERNAL_SCRATCH_2(ver)	\
 	(((ver) == HFI_VERSION_4XX ||		\
-	(ver) == HFI_VERSION_6XX) ? 0x8 : 0x1000006)
+	(ver) == HFI_VERSION_6XX || (ver) == HFI_VERSION_6XX_LITE) \
+	? 0x8 : 0x1000006)
 #define HFI_BUFFER_EXTRADATA_INPUT(ver)		\
 	(((ver) == HFI_VERSION_4XX) ? 0xc : 0x1000002)
 #define HFI_BUFFER_EXTRADATA_OUTPUT(ver)	\
@@ -561,6 +564,7 @@ enum hfi_version {
 	HFI_VERSION_3XX,
 	HFI_VERSION_4XX,
 	HFI_VERSION_6XX,
+	HFI_VERSION_6XX_LITE,
 };
 
 struct hfi_buffer_info {
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index b5f2ea879950..302776bf8fe6 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -497,7 +497,7 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	if (count >= max_tries)
 		ret = -ETIMEDOUT;
 
-	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
+	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core)) {
 		writel(0x1, cpu_cs_base + CPU_CS_H2XSOFTINTEN_V6);
 		writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
 	}
@@ -565,6 +565,9 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
 	u32 mask_val;
 	int ret;
 
+	if (IS_AR50_LITE(hdev->core))
+		return 0;
+
 	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
 		writel(0x3, cpu_cs_base + CPU_CS_X2RPMH_V6);
 
@@ -1134,7 +1137,8 @@ static irqreturn_t venus_isr(struct venus_core *core)
 	wrapper_base = hdev->core->wrapper_base;
 
 	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
-	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
+
+	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
 		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
 		    status & WRAPPER_INTR_STATUS_A2HWD_MASK_V6 ||
 		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
@@ -1146,7 +1150,7 @@ static irqreturn_t venus_isr(struct venus_core *core)
 			hdev->irq_status = status;
 	}
 	writel(1, cpu_cs_base + CPU_CS_A2HSOFTINTCLR);
-	if (!(IS_IRIS2(core) || IS_IRIS2_1(core)))
+	if (!(IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)))
 		writel(status, wrapper_base + WRAPPER_INTR_CLEAR);
 
 	return IRQ_WAKE_THREAD;
@@ -1531,7 +1535,7 @@ static bool venus_cpu_and_video_core_idle(struct venus_hfi_device *hdev)
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	u32 ctrl_status, cpu_status;
 
-	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
+	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
 		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
 	else
 		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
@@ -1551,7 +1555,7 @@ static bool venus_cpu_idle_and_pc_ready(struct venus_hfi_device *hdev)
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	u32 ctrl_status, cpu_status;
 
-	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
+	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
 		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
 	else
 		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 409aa9bd0b5d..5d9dfe3fd043 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -1168,6 +1168,7 @@ const struct venus_pm_ops *venus_pm_get(enum hfi_version version)
 		return &pm_ops_v3;
 	case HFI_VERSION_4XX:
 	case HFI_VERSION_6XX:
+	case HFI_VERSION_6XX_LITE:
 		return &pm_ops_v4;
 	}
 
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 99ce5fd41577..87c7901b280e 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -550,7 +550,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 {
 	struct venus_inst *inst = to_inst(file);
 	struct vb2_queue *dst_vq;
-	struct hfi_frame_data fdata = {0};
+	struct hfi_frame_data fdata;
 	int ret;
 
 	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, cmd);
@@ -561,18 +561,15 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 
 	if (cmd->cmd == V4L2_DEC_CMD_STOP) {
 		/*
-		 * Implement V4L2_DEC_CMD_STOP by enqueue an empty buffer on
+		 * Implement V4L2_DEC_CMD_STOP by enqueue a buffer on
 		 * decoder input to signal EOS.
 		 */
 		if (!(inst->streamon_out && inst->streamon_cap))
 			goto unlock;
 
-		fdata.buffer_type = HFI_BUFFER_INPUT;
-		fdata.flags |= HFI_BUFFERFLAG_EOS;
-		if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
-			fdata.device_addr = 0;
-		else
-			fdata.device_addr = 0xdeadb000;
+		ret = venus_helper_alloc_eos_buf(inst, &fdata);
+		if (ret)
+			goto unlock;
 
 		ret = hfi_session_process_buf(inst, &fdata);
 
@@ -1332,6 +1329,7 @@ static void vdec_session_release(struct venus_inst *inst)
 		hfi_session_abort(inst);
 
 	venus_helper_free_dpb_bufs(inst);
+	venus_helper_free_eos_bufs(inst);
 	venus_pm_load_scale(inst);
 	INIT_LIST_HEAD(&inst->registeredbufs);
 	mutex_unlock(&inst->lock);
@@ -1682,6 +1680,7 @@ static int vdec_open(struct file *file)
 	if (!inst)
 		return -ENOMEM;
 
+	INIT_LIST_HEAD(&inst->eosbufs);
 	INIT_LIST_HEAD(&inst->dpbbufs);
 	INIT_LIST_HEAD(&inst->registeredbufs);
 	INIT_LIST_HEAD(&inst->internalbufs);
-- 
2.34.1

