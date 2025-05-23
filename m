Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687C629ACCA
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027278; cv=none; b=PQlwuEE0WEOVOCkuu+1nSX/XtWgJbaWczz24OZo7R8DJsWHxpl0gf2LPgcLzHs4JVY5GKzrEeu7s17zn41gPsoQwL6loR0WtTTRd6MaATYFuBElb/qgddbslFzSAy0aH74IU2ZG1uvxgrMEpKCHjtLKXpmptrOUc2Z1/JJNsY94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027278; c=relaxed/simple;
	bh=HwSmczY1BPfAzd6mqaQZTmW0WxFuAC6Q6eQmyL2FVcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hFFewFUI9Zd3Cz/hw9hH+M/4sbRhZjnHP90vGbxCUSyhBND1d9FapVpSdWk7o0QAbSnG1OLfIMPfQOVkB5YEhamTNYXimtozou+9SRfhS0jNxXsLlJwLIy14DWSgOb78O7GrUYZ6Ut+1OEQRA+eEetZQKGyEStVoLExw+2Uzm+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B0XNEx5f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B0XNEx5f"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NFKP4W018127
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7gZa73dpF26SkhvPxVhZQa4YDow7tdo2+PqHj6dpVRM=; b=B0XNEx5fcG8KymWg
	KQfqbqCjHxIuR3xTiUjoths9dTazx+J5qI+6S6lsCRTHoVB3u1vfG9/TI8azX3nu
	gvdHd9NKxXUmud8JWrM3/R2mNjvkcw5TjiLnPoIybIWdgm6SpLApoW9if3OGdIug
	XKny6LLYZrvyx7QNNSXjWRsHixhFxUW+TK0SVoB1CfllsyaBjtvfF1/wVBkYON/w
	KCB+CEIiXcCz6l1KPbgbfiD6A+4nucdovBZCC48gUMNeD9QpWG0dpjpcmYKYPnK2
	FE+OoXXrhkfm8KDP2L5OaXN3dKPXzy9bn1cqTPW2b2E+1Gip4gR0xQu4d+qK0oVT
	cACAHA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfbauq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:07:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-231e3cfc144so1394945ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748027274; x=1748632074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gZa73dpF26SkhvPxVhZQa4YDow7tdo2+PqHj6dpVRM=;
        b=w+YfPBlJMnLuJuGo3szYVfOUak92AVA1Bn+RH/h9jTVoLoqt9JUXQvdnKda6Fz3Es/
         uT7FnGq3Ve+iJu6184WZCyEPElTU+TY+CuGQm5lGyzkluxygJomrQPDMjphkPw4cO/r9
         PX6YIJopD6DL9wDzOmUvOlMm8xaW3ORaKwS9cEVKp4PJVjj4Febwt6tAYFFU5474P7bO
         lQx/qBsS6j9IrqNsdUeIbX91GRuvMudxw68CXaqX9YEzbBeN9Tzt1/OswvEVOIG9bNKT
         ptxd0zjuio+SvelhFiUKJfR0giNw+qtAmRmCOIXQtXn+Y+Eu/lw36rN9tSOSIgzhl7g9
         VFJw==
X-Forwarded-Encrypted: i=1; AJvYcCV5N6sVC5Y5qWxCOR/MAMaihCsKAc6LS9VgTo25H+KHA7BqH6CYUxgv8K5wWr7PT7khaaPZ33uIramM1Es=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw3n29/V1V4sL52j1hXXoftVohQQhr3tbYqZ+0N0brr7juLrmw
	Fj62E91aTKsRch56ZCH9M96Me8NSgl+aVOZ1T6c6QAcCUsf9NTS0BenScSiq39jvfnitxZhUmNW
	JR6fm9wbD/rWitRq55w56ZOl6NJ99uF7YywrY0QeMfbwaRXZBlyyybQgasevmqvzfi4U=
X-Gm-Gg: ASbGncsm5X7YOhO2Tx0OmguWoykoRmEhue98Lt7McOb6Akjtc+HBXL+unj1zqva6BBJ
	MeLu6ejXMA/0QjbAYL1SvdJbF7r0QqKQntgCz6xJVK1daiaLnch4HYQH4A6FZcZURL3GEPfbwYe
	Kq/TWo/+vkc6qeOlw1HP+Jmdxo60Tu6aLVW3OZq/jOGq0E2SJqc+zQer+ZTggHRvCfYhh8kiTHt
	JFAOmTHr27XEgdoWZ8fqOV52bHMa+2KPY85zRvF27SHcijGqbHXltSb3l0orZPEZBjNKiIwOxXP
	xdX9KjO8gkOgB3wWdEACwMksuI2EIeM+h16kpt+EGQwgNUARk1WRkVg/L/+9PSdijZW3rhVhlyq
	dHuk=
X-Received: by 2002:a17:902:fc44:b0:22d:e5ab:5525 with SMTP id d9443c01a7336-23414fb18f4mr7684295ad.38.1748027273731;
        Fri, 23 May 2025 12:07:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9aGHMYSmK7SrV45BqIlcmsAhO42IMfLLXP73waFOUBZmCfBzFQvKjmp44IBDyYmX/NigZnQ==
X-Received: by 2002:a17:902:fc44:b0:22d:e5ab:5525 with SMTP id d9443c01a7336-23414fb18f4mr7683925ad.38.1748027273336;
        Fri, 23 May 2025 12:07:53 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97886sm126652165ad.146.2025.05.23.12.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 12:07:52 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Fri, 23 May 2025 12:07:40 -0700
Subject: [PATCH v7 1/3] firmware: qcom_scm: Add API to get waitqueue IRQ
 info
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-multi_waitq_scm-v7-1-5b51b60ed396@oss.qualcomm.com>
References: <20250523-multi_waitq_scm-v7-0-5b51b60ed396@oss.qualcomm.com>
In-Reply-To: <20250523-multi_waitq_scm-v7-0-5b51b60ed396@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748027270; l=4335;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=HwSmczY1BPfAzd6mqaQZTmW0WxFuAC6Q6eQmyL2FVcg=;
 b=wGqF1n/ppHEqyGEgSw+8/sKO/e6uc7JfP1jmTIfWFlWNHi5jQAxPVqrQNdk39Te8twHGplxwb
 pktnaa/w5FPBvNiln+WThqcWOqUmBR0GUEZafXWkIPMEYzbc2X8JAzj
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-ORIG-GUID: HFyxm57p6J6U8b28YOqD5AVz0t7w5ciQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE3MiBTYWx0ZWRfXzuXfVJjI/zzD
 rrADLyZ5UhEWPsjF27SGza4Auh8WnmdgVy6wdJapnteCv3B2fd+F7F8+CzXCNRceVFKk3R1lUfQ
 s3J4jId09l4jzpb2UAIiFXmjsSYO4Y8TaBvWoFNEXCL0jGhbOccf5LXUwR/eiJZzlYWsMaNFcmQ
 XGnNcI60H4VAuSZTCqhXVW+gLItAash3Khu7weMgdzbqurl9QhJbKjr7O/xfBrhhbhc9ZS0NUOJ
 qiqNvmoKxWBnBKYUnyYyeK11lyaxVicVc6qs/5LKVDbyRWaWa3nINYRXR9F2T2cVdLrCzJfxVpl
 LGZMtxHJKeNdLNt1B/IyiAGz0X48R0WQqeCtB3qPn9zyuOHW8wtmCWjEvAB14PWKFCauLYZ3vrf
 Yw0adKXRRSJ/d1vDl2h3PvQP15FKA9An67sb49GTnJsmJ+nGARhrh7TWKA7EK+KgFwLbwM1O
X-Proofpoint-GUID: HFyxm57p6J6U8b28YOqD5AVz0t7w5ciQ
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=6830c78b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=BWC7kBQSOfkspHPoMaoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230172

Bootloader and firmware for SM8650 and older chipsets expect node
name as "qcom_scm", in order to patch the wait queue IRQ information.
However, DeviceTree uses node name "scm" and this mismatch prevents
firmware from correctly identifying waitqueue IRQ information. Waitqueue
IRQ is used for signaling between secure and non-secure worlds.

To resolve this, introduce qcom_scm_get_waitq_irq() that'll get the
hardware IRQ number to be used from firmware instead of relying on data
provided by devicetree, thereby bypassing the DeviceTree node name
mismatch.

This hardware IRQ number is converted to a Linux IRQ number using newly
defined fill_irq_fwspec_params(). This Linux IRQ number is then supplied
to the threaded_irq call.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 60 +++++++++++++++++++++++++++++++++++++++-
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a67efc77e0135c06db47bc14d0aeaa..529e1d067b1901c4417a1f1fd9c3255ee31de532 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -29,12 +29,18 @@
 #include <linux/reset-controller.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 
 #include "qcom_scm.h"
 #include "qcom_tzmem.h"
 
 static u32 download_mode;
 
+#define GIC_SPI_BASE        32
+#define GIC_MAX_SPI       1019  // SPIs in GICv3 spec range from 32..1019
+#define GIC_ESPI_BASE     4096
+#define GIC_MAX_ESPI      5119 // ESPIs in GICv3 spec range from 4096..5119
+
 struct qcom_scm {
 	struct device *dev;
 	struct clk *core_clk;
@@ -2094,6 +2100,55 @@ bool qcom_scm_is_available(void)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_is_available);
 
+static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
+{
+	if (virq >= GIC_SPI_BASE && virq <= GIC_MAX_SPI) {
+		fwspec->param[0] = GIC_SPI;
+		fwspec->param[1] = virq - GIC_SPI_BASE;
+	} else if (virq >= GIC_ESPI_BASE && virq <= GIC_MAX_ESPI) {
+		fwspec->param[0] = GIC_ESPI;
+		fwspec->param[1] = virq - GIC_ESPI_BASE;
+	} else {
+		WARN(1, "Unexpected virq: %d\n", virq);
+		return -ENXIO;
+	}
+	fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
+	fwspec->param_count = 3;
+
+	return 0;
+}
+
+static int qcom_scm_get_waitq_irq(void)
+{
+	int ret;
+	u32 hwirq;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_WAITQ,
+		.cmd = QCOM_SCM_WAITQ_GET_INFO,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+	struct qcom_scm_res res;
+	struct irq_fwspec fwspec;
+	struct device_node *parent_irq_node;
+
+	ret = qcom_scm_call_atomic(__scm->dev, &desc, &res);
+	if (ret)
+		return ret;
+
+	hwirq = res.result[1] & GENMASK(15, 0);
+
+	ret = qcom_scm_fill_irq_fwspec_params(&fwspec, hwirq);
+	if (ret)
+		return ret;
+	parent_irq_node = of_irq_find_parent(__scm->dev->of_node);
+
+	fwspec.fwnode = of_node_to_fwnode(parent_irq_node);
+
+	ret = irq_create_fwspec_mapping(&fwspec);
+
+	return ret;
+}
+
 static int qcom_scm_assert_valid_wq_ctx(u32 wq_ctx)
 {
 	/* FW currently only supports a single wq_ctx (zero).
@@ -2250,7 +2305,10 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	/* Paired with smp_load_acquire() in qcom_scm_is_available(). */
 	smp_store_release(&__scm, scm);
 
-	irq = platform_get_irq_optional(pdev, 0);
+	irq = qcom_scm_get_waitq_irq();
+	if (irq < 0)
+		irq = platform_get_irq_optional(pdev, 0);
+
 	if (irq < 0) {
 		if (irq != -ENXIO) {
 			ret = irq;
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 097369d38b84efbce5d672c4f36cc87373aac24b..7c6cb3154b394ab910bf7775a5ae07a28e0b57a5 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -148,6 +148,7 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
 #define QCOM_SCM_SVC_WAITQ			0x24
 #define QCOM_SCM_WAITQ_RESUME			0x02
 #define QCOM_SCM_WAITQ_GET_WQ_CTX		0x03
+#define QCOM_SCM_WAITQ_GET_INFO		0x04
 
 #define QCOM_SCM_SVC_GPU			0x28
 #define QCOM_SCM_SVC_GPU_INIT_REGS		0x01

-- 
2.34.1

