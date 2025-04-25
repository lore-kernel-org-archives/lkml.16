Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A014241680
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745624892; cv=none; b=gOCQnIDq7YYM2sJ5OiC4PO0TjJv9+aOvHic449CAiD329K+DoYUfkDmLmkZpXlLUUtSLnNyX1omEchNzfUfJk7aKkELzzBfIU9GMGBdhu55c0JXQOb3aOaZcQBQtNeXa53oBDwhStYNCJ07aE2hiF80+9bHBp8Rdf+CiBoguQ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745624892; c=relaxed/simple;
	bh=HwSmczY1BPfAzd6mqaQZTmW0WxFuAC6Q6eQmyL2FVcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WwGq1sFS/5HzDapGSfed1P64rZTQuaHXMMrXE04cLmVB7Z1m2VQBpyQXB39JkIAdmcEhQbAB7mk3xtCCHjsebVytIQufJ0UQdR4hAsUwtMN1I3a8lHVfdTR5T+mj9jxbXu0WhJIb3Y/3AdBcDuCnvwggedoNK1b0TcPLbELi8x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MgvFntlW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MgvFntlW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJtpf007900
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7gZa73dpF26SkhvPxVhZQa4YDow7tdo2+PqHj6dpVRM=; b=MgvFntlWJRBpjfj1
	ctyOM+dV02WzYZTULRX4rG0IGA/Lva9BBRCGquFX7cfq1gz/5YgwWq3caYnmZxK7
	9IW3rK28YPTTVCpUW2pKZ2CY5TS0a4dYVxTwCFQxB6SKp76FZeufdVHGzwnDRpO7
	SlINXOzntXTtJW1Rv/BSACQ8C4QSEjZ4Hpoyt3IrvhIm+FUAjIauujSi9RoT9FUK
	zIyBVUeZsrR96hYA/xLWTIbCMARtUcUo3hIn/ZpwiMtG8vVR99au7UGkhLV8Y4Bv
	xt+pEbly4mHCUqQdjLtuJsMYOZT6HWqtw3PeIjK05vhbcOGYKUp2yyPHXnBwoAU9
	z0lSGQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2jky6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:48:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b00ce246e38so2823790a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745624888; x=1746229688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gZa73dpF26SkhvPxVhZQa4YDow7tdo2+PqHj6dpVRM=;
        b=Suu/X61WZa7MgP7fCOwJyQkkwlSrVKAmN7JyDoTyXYtw2LvAjRRZzDTknlABmH2Rqk
         Ue5xGD4rCH4/w1U9XxwYGzUqa8z6ajvFOwC/tmZ8R38OD3oTmfTgG89nbR7uKkx9SY2g
         Ysy5y/S2XsdvZrXRXjZVqm64qkp+axDH9O6FSz+aEnaabtMlT1Qw/bGhLMAXKZEdp+xE
         pdLJxMX2qnt/zfHn71bJ8klOXypDLAljnxlnvjx3NcTk+Cbbi2eaLFrCXQKT9EMD8hUH
         eiq+33P1/N2DMrBEnzotaGQckQoICBeBgixTiWcU2wgi6BvQsoj0Pn9o/8mqHGEWF5m0
         vbjA==
X-Forwarded-Encrypted: i=1; AJvYcCXrm1wwbifcNNTcpL126koy9Y5O6FjkmwpEqYJHEP4SChGo7YXuoVbZniBDTeqDvUl/kgHu8qckecMszrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBsNa6Y7I7iBn4MRT5AEGAGYbCzGB8uV6/6yZ9H9LV1sxrpGMc
	9OnBV6QYWItUggvXyaMj7ez/HmK2vR5nxLzrq+jlU/PBqhnxnfJaFfolbga/TGUUBGBmr2XBVeu
	oWH6GDsWOQE25LC1JLgfDP+1lU7P0vLJeOgRiwBhPjBcqjn7GzsraxFG8PPGc3lujn+pEoXE=
X-Gm-Gg: ASbGncu5/RjJLUrZA/Pb6gKi+UPJyrMsIS02Z9eRVhEwcjXq8La7HNZheeLFJaLELSD
	8KP3F89RKIWuEhEk6Cl+e7+flMlbHranb2nj/XKkklnFaGme1tXEbxrVW4P5P2sWtZFpiYsvmhT
	m8F+4jy9OKqQd2Aq76odTRZb4h0J+GbT6+fdamve2FhAyepvWZighi/f5kyft2fK7K70Vq9JzNC
	/owPPD3l2fSKRhZWXy9wFx/t5Rgkka9hLCFRlm3xy2kiaXxZVUtOBLgBWyZJLKFmlpZUwhvmjbd
	aP/NSUkawvcnVPTZHx8Y4gj3ek0IUkrytpkAHdlolwPHfjfAwFkMDdVOnqAjS+P1EMde3dsTzYr
	R8Qg=
X-Received: by 2002:a05:6a20:3d93:b0:1f5:63f9:9eb4 with SMTP id adf61e73a8af0-2046a6f0de3mr1519272637.35.1745624888492;
        Fri, 25 Apr 2025 16:48:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwrDEc6Ma5eNwTZjAnXvfiCHVusufWG0jmBbY9U2tOihoJatkfDj4bF2BySc0j/Qd+JYlreg==
X-Received: by 2002:a05:6a20:3d93:b0:1f5:63f9:9eb4 with SMTP id adf61e73a8af0-2046a6f0de3mr1519243637.35.1745624888056;
        Fri, 25 Apr 2025 16:48:08 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9a308sm3868948b3a.136.2025.04.25.16.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 16:48:07 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 16:48:01 -0700
Subject: [PATCH v6 1/3] firmware: qcom_scm: Add API to get waitqueue IRQ
 info
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-multi_waitq_scm-v6-1-cba8ca5a6d03@oss.qualcomm.com>
References: <20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com>
In-Reply-To: <20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745624885; l=4335;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=HwSmczY1BPfAzd6mqaQZTmW0WxFuAC6Q6eQmyL2FVcg=;
 b=uDBkoWIyiXlYh0Cny/rX2dEV+G7u6bEMULbDg3HWxfc5BNFsYGmpNODZ8wpdviHmeNUdCLEj/
 IXbMilpSbdRBhR8zZJng++qWgGrvusNCJ30TkEe4tS0zSgsGNVmWm9T
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-GUID: 5Mr2oQbDs32Q7y_lJ-h_KF23Mkk-sPh0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE3MiBTYWx0ZWRfX+7Ngm3zC802n picTGKn0hglzHXXRnq4MRZ9kmvHjBpMtRh19R4VsYTQm0odlZkk12TQYIcK+4EolhwEYEvsKO0F kYsei5vhz4cnCxKcUB4wVmcsPIQuo9dMk6nlrhxiBJvvQDI6dFLu3tlddvYzp+uo8PrGFs+QVPH
 FyLyWbh89Ysa1n5kmnYNVXUFdu0MvW4udNYKU0dY36nGNzlqyTqmZWW0gVnTmZTk8eL46z4WBWS devmk3JxFfDFmUTsDmJyFkqQfSpk/f7vsfioHFndDmFpfRw2s2XHRB104vRk83Wb7YgRUvAMOcA 2arV0r5mn47sjRq358+JVqcOErr9xlkX27n24qLn/WxBXzZxh7yLy0bmC7c/EgHwY1nUXhbeSIM
 IFgtG600j2w2oNAiI1ns6nWQUQtwvcc0EkwPZfF1ejbZCIrQLIfClBLPIeih4NyxsgnAsqur
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680c1f39 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=BWC7kBQSOfkspHPoMaoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5Mr2oQbDs32Q7y_lJ-h_KF23Mkk-sPh0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250172

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

