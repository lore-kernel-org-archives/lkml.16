Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EC51A254C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823475; cv=none; b=MYfmTrlobdz76amkmEKE42h+mYyL6a6WWovYbXp/oQ2cxiQHtGY65+mxW7zaxAkm3lP++z9DJGlLK/ZPI+sv7kpu50xfuaUgV/hO9g7BQ0VT0Z5O3SZL4eMpvIoojsf2pQdAzCfGmqJPZKIjPWU4h7qGtBUpSz9Wirn2ASFvuO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823475; c=relaxed/simple;
	bh=ofSIhURbE8JGA42UH0YBsV2VOIoz7qhQ+CYI90S4iYk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RzUErmX0x4hNEFqYo9toubUtDfQWytCnFBKW8fzqJg59a+2R+BynBjWq0trAI3BttoOxpYN+3wBJDVS0kSwNoULT02QTGJkMooiMNq1tmf6fATG+1bYn5zqAlOhuCKjcRa1hwsEsproOYuaQq1Gi1NxWXx5fS+jSViwyLzWDiuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGgL3PP0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGgL3PP0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9Bj8X029602
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=q4UXbwz6Fhd
	4XfS0c/exNIes/qKVhYhBXGv2xa/goXo=; b=CGgL3PP0l1IQJyh0jgJogaxez+Z
	dmEVvBX+L+aSuDB0nw9+R7Uu2kMU9sBKKRle6W+hjDIBe7LCRgtrhOxzbyDWncai
	iTqXKTMwtNwdsCLXTKRmcRJIhRbeLNbFkQ5BHwn3N/nXFCfR6oQjYi5mvWECxwJn
	xhrhnNwEa1qBLdpofb1wIjW8NbI8n4SE8sD8uBtaVHuqd90Dq4Bhh90k7ZQs90cB
	ph0XU4yifZ/gGp4zi0CjVedWdJIgqvg6+VNS7X5FSLnUYo0oahbPRK6LcIn2ForY
	7HEAZLX/5uC2Y+zAUEL9U4iY65qTnZXS4IyMAgcKAKSpmEwhsUqHImiqyjg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d12bkur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:04:30 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-735aa4b1572so627401a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823469; x=1750428269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4UXbwz6Fhd4XfS0c/exNIes/qKVhYhBXGv2xa/goXo=;
        b=Yq1iCh+NT1/GYvtHD5k/nL8vgnqb4dTv0hENOWYWPiNkVxA4sFhvmGx8S2+FZfN93W
         HBA+4cxKDcreq0cRUpFjxrFLAaICbCZDkqJPsfHPkvR+kEJJEQ6ENpVciK7nrPKvxAhM
         3E9I/16VG4CpOVSssFoT2ltXlsuoUPKmeW3f/1ee18WfIBETeuJe6o7mws0NbjvEwlSL
         h89rqcFPR637lCggZDXd1K7WXFl2AyoD0LUmENrXK27H+6srDXKmgDT/vTe/6y1RCu9b
         PwO6MfDqM+RVQD4YOsiHBdiUHohEohy9vh1IC2ZUcYqZwjTk/+5Gkt2jWRhIgW4TmoMO
         eIFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz8NC3tCoovLxPCA6SB+OkgPnrJSKlZLu++awkJF4SOhIRNU5Edm/VfbNcHTPJlgDmcBXGaNQ0kfkARkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB3Sq2H9nW/XqdJD63CE1wYEEzl6ZpAIr9WtNCBghiB/MoOdcx
	n/I3sree5LE9TTyYBHN86RtEY9B8FjSyslHCc4spsJyBDDqg+uWUVMFsddpZQbHbuZSYM3KETZ6
	m/CwuIMqf3tPf5IuQ+CGC62v8SCy+mYHVwwOJyUGzzYW7Ehx3PXF2i2gnqhQmntzqCNwsYfQ9Fc
	Y=
X-Gm-Gg: ASbGnct8H3abGxNJS+Jx0SIbXfRpsDbmWpbSrklbwJ1hOK9jSae6Equ+detNv98g+cY
	mIV2SHnof6FuUc2cmSFSQ2HTI92TASfXS12+XCw5zWCs6UnwsFkKwLTgZl73CgjwC2DcFJDWDv5
	a1nCIgv9mbwVh+AyKZxAuJMwJkR35urbJd1RtXr7BtnQtagnlXb4rF8w0sYebn0lNCazI3iPLiv
	3LPozXhEGpzJGKDYrtrkqgEgG9/s1nFsDXpasLYpbGOJHgYOdd5BMl5Joa+byWYZoNl+F/NJftz
	9KnCabG7jIbOLQ6z1EHUOTKLXmUtLcDHvLXQw9UhKAtkuMJL4fczE/Iu6ZKK9tVPjJAq9rCiVTO
	I
X-Received: by 2002:a05:6830:6488:b0:739:fa45:591c with SMTP id 46e09a7af769-73a27117ce9mr2091093a34.13.1749823469089;
        Fri, 13 Jun 2025 07:04:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6NK7CuldtPlXawMuq8prfqWmCFAxSuPDLMdl9iuUTY5hKhPURrq6fXjXd9zDxFImakDqQqg==
X-Received: by 2002:a05:6830:6488:b0:739:fa45:591c with SMTP id 46e09a7af769-73a27117ce9mr2091046a34.13.1749823468657;
        Fri, 13 Jun 2025 07:04:28 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm53503615e9.40.2025.06.13.07.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:04:28 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] media: venus: vdec: ar50_lite video core support
Date: Fri, 13 Jun 2025 16:04:00 +0200
Message-Id: <20250613140402.3619465-4-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: M9Vr4aQuxzzMlZ8XSSUNVFnyjQwl04NM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMiBTYWx0ZWRfX8L318QZVKzfc
 aPTi083Ki8UMtGG2xcXjwp3pvWjf7uCs0WoR1CY2CQ6CjaPWw+YqLXfnJNkPLwTRLEGdG0O34L6
 4QGa71beQxJL6AOOPWNcTuNcvAZUp6OV8q+IAmmUNxZMNOVClmhLJi4mKeK1px9w4U5RHKJyWHz
 vBzxaH7nxhC3Zb8i64JTQkCxzGEp8pjLA5Oinyd1pYvxYpSsl8+z2F0ElO8dy34u4N1oE9g74IB
 FC5M1Cgmg/WIVPwjev2J7P7pRHCPnj4dyEzCzMZHA3kka+KbEbzXx5nPt9THa4HSqxibQNnVfRp
 zkIAfjbSmfBWwz5PXTNvXiD/8r6KVcIGtjVVcfGgKgrtywdaHmsJ1zZflkgXG5m1vK7Tb1AVUwA
 5MN9PRz9I3GdoV24KuPkr9f4OYGciHD0JQ7XNyzaKMwu3AWJd3xj+QYeffBm6zJ1AGSlIKh3
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=684c2fee cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Gsml5EI1S0Azkn3hA_8A:9
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: M9Vr4aQuxzzMlZ8XSSUNVFnyjQwl04NM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130102

The AR50_LITE is a streamlined variant of the AR50 video core, designed
for power and cost-efficient platforms.

It supports hardware-accelerated decoding of H.264, HEVC, and VP9
formats.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c      | 11 ++-
 drivers/media/platform/qcom/venus/core.h      |  5 +-
 drivers/media/platform/qcom/venus/firmware.c  |  8 +-
 drivers/media/platform/qcom/venus/helpers.c   | 81 +++++++++++++++++++
 drivers/media/platform/qcom/venus/helpers.h   |  2 +
 .../media/platform/qcom/venus/hfi_helper.h    | 10 ++-
 drivers/media/platform/qcom/venus/hfi_venus.c | 14 ++--
 .../media/platform/qcom/venus/pm_helpers.c    |  1 +
 drivers/media/platform/qcom/venus/vdec.c      | 15 ++--
 9 files changed, 123 insertions(+), 24 deletions(-)

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
index b412e0c5515a..122441f9600a 100644
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
@@ -520,7 +522,8 @@ struct venus_inst {
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
 #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
 #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
-#define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
+#define IS_V6(core)     (((core)->res->hfi_version == HFI_VERSION_6XX) || \
+			 ((core)->res->hfi_version == HFI_VERSION_6XX_LITE))
 
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
index 8295542e1a7c..ae89369c6a07 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -230,6 +230,80 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
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
+
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
@@ -630,6 +704,13 @@ static int platform_get_bufreq(struct venus_inst *inst, u32 buftype,
 	if (!hfi_plat || !hfi_plat->bufreq)
 		return -EINVAL;
 
+	/* Firmware buffer requirements for internal buffers only */
+	if (IS_AR50_LITE(inst->core))
+		if ((buftype != HFI_BUFFER_INPUT) &&
+		    (buftype != HFI_BUFFER_OUTPUT) &&
+		    (buftype != HFI_BUFFER_OUTPUT2))
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

