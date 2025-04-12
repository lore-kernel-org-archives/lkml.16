Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF46131E2D
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 01:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744422651; cv=none; b=CYmBri7cmChhsAQvpr255vF25O6uhh2i+TLS4hDL9fA646okyGwcD0W2E1PXLJdgs3EVnWywm0VUnqorJTacQK/BcebZdQo1cZm/ykuIilQ5NYmvjyuk4M6mGqNYF8yHXRh7dYtSm0Irn88nM2Xb2mF6T6RUB2uP3gucQvmdB68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744422651; c=relaxed/simple;
	bh=qa2fHYZnesCAui3XINcjkvPJz2DvBVRgbP18f/Va4Zk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RrPDthLcZSw0QYhT9UQHdH8fsFaAPq7m/20XaTSuRciXMbzLkezhae6igQc6/gIO9ER6N8H6tlGrT3wolNTmDTjjAuQGXunQrwhUmXDww7YNWakEFqp4lWNvgpXFoO33CTgqvwAKkIdHRP4ji6TZBMwO4fErn8DL20gbvOWIpHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKSMDR/j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hKSMDR/j"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BG28sc031991
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 01:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NJRLMhm/fdnX3kykc4RU85KtWG/m4mG8gJyCB+VYr+A=; b=hKSMDR/jVZwpgReX
	/h4uOooHzy5NAZIN4YhavqYzKyTnqQ+PG9WEJ06awKZuWK1mRXTTtyCCKhlgmdEn
	44PbnftUE2koOkZ3AQUvMLVm1z/UZ7wMMSE+0Ek7ITbbys30nFWHd7lMLe7oM2bc
	kHzDXZ9I9n9JapbTKSPVqK6u5IurHs713D+kkKEiXOtIw+hOLq1OTjvOzD5tW4El
	uzofJD2EylQSVRrBBEt+RqvbBJddzLKTAB96+cYE+YVfdOhmLxSI+mtiGdoLywIb
	R2x0J8mb+p4gWGP3J2EiuDoOEAHFRrUL1geEdXvpMR9Y8n3f4six/b3y30ljHoo3
	ze2QZA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmm0hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 01:50:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73691c75863so2978301b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744422648; x=1745027448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJRLMhm/fdnX3kykc4RU85KtWG/m4mG8gJyCB+VYr+A=;
        b=J+PUwbPjJCez7/5UQ+poLKFdsshqb0DS450nnKz/KcHQQpePB1FLm6d+cmrv2Z6/n9
         Q5vzfGpN8HYlKLlkxCjltDRlk+W9soTrAtIptoyqyl57EyIy9netXbwuroGAvNe4Iq8H
         kGfjHa4ofFFggiPScepk+zfyNlB9EGFEHl1L/49GLoFkcYnlZX4mkRYEToJJE62rd4o4
         reWV4af6WjMrupVGr7KKZAv1FBTKZtCDv3mBPW7mExBMaYmQ/o26f9SW4/mycbYkzW6Z
         YiS9/YedIHkoOe0WHahPuVUKPk8woFxJtwFR5sFpDJGNIP1oLNUOjG/1GOcnO6Q2ybK1
         LMqg==
X-Forwarded-Encrypted: i=1; AJvYcCUP0luujM+kgCi4bckQq/17MgamYULaE8f+Fzck18HmoBWSGH3/uAymDnRL5CHWcdzzh1T+/9MEbT9dFiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRw9D1jMR6QBMh3RMJty82kEKoeVOIEBxCuKTQznhOSfuFPLEX
	c4ePUg1NyNwdteBODRNMEbjEIy6QbijPmuRFGHxMldefp//q4KanCcVPa3tAHYxgzuVDKmiDUjs
	s4ypXTiCW9bZvd54OfnyxW5FN2a8ader1hdG7GT0fXA12hFd/uI7VgyN61oX8cYA=
X-Gm-Gg: ASbGnctgoIdWpeZB2//N2D9x4HDzi3Eyn54Gnz+77RPq0tifpboPRqGhOltziH86UEs
	kvLKCu6pf5D97fdRZ8etJH8X9/zKzbOOnk33aNFWHZa/GgEkiPtv1M5glnu4XsDegcE8ycX+WPH
	T3ELB9NsAqqgGIfDlLGHqd4GYw0KfP7qMRBhwMuCMtkzv9NFA6Yg56cs48aq8FtXzTXG4akRCqs
	UYucS6bLqzb0j5UBqcjt3AdjhU/vwE+nDHuA58rz4A4qryrddZ40sLDwfkD/kAil43puxKwuY4m
	mTcceqf+P+/VIlinTti/8RwOCNj9C48GHcZdkiB+E/7aVxw=
X-Received: by 2002:a05:6a20:244c:b0:1f5:8655:3287 with SMTP id adf61e73a8af0-2017999700bmr7758401637.40.1744422648122;
        Fri, 11 Apr 2025 18:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqIidenWwBo5ifmdW9Dnc2XoM1wM7wagR0rEJ4R9Ggv4H1iuLINVAiCN3icYk7kDfKB9kxPA==
X-Received: by 2002:a05:6a20:244c:b0:1f5:8655:3287 with SMTP id adf61e73a8af0-2017999700bmr7758356637.40.1744422647664;
        Fri, 11 Apr 2025 18:50:47 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a3221832sm5516825a12.70.2025.04.11.18.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 18:50:47 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 07:19:55 +0530
Subject: [PATCH v5 6/9] PCI: qcom: Add support for host_stop_link() &
 host_start_link()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-qps615_v4_1-v5-6-5b6a06132fec@oss.qualcomm.com>
References: <20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com>
In-Reply-To: <20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744422605; l=2832;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=qa2fHYZnesCAui3XINcjkvPJz2DvBVRgbP18f/Va4Zk=;
 b=3e2iwoROGAqjYHvRyc7vAQT087G+WiXCaP0XMUBQQJpHOkE2dMQVICDsBzXvly17NY9rP07Y7
 u4h75QW+AzyDf2qxepI6PT6vBseh/fhbRk0U8fF9E3ziUyIkr4dem7O
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: mpLgjIRiCUp9-_ZSF3NMWrWJ4OS1j9Yh
X-Proofpoint-ORIG-GUID: mpLgjIRiCUp9-_ZSF3NMWrWJ4OS1j9Yh
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f9c6f9 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=dstPO7x8LWyc_yWpthkA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120012

Add support for host_stop_link() and host_start_link() for switches like
TC956x, which require configuration before the PCIe link is established.

Assert PERST# and disable LTSSM bit to prevent the PCIe controller from
participating in link training during host_stop_link(). De-assert PERST#
and enable LTSSM bit during host_start_link().

Introduce ltssm_disable function op to stop link training.
For the switches like TC956x, which needs to configure it before
the PCIe link is established.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index dc98ae63362db0422384b1879a2b9a7dc564d091..2715838b1036d68a10f6bbf282fde505802227f7 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -247,6 +247,7 @@ struct qcom_pcie_ops {
 	void (*host_post_init)(struct qcom_pcie *pcie);
 	void (*deinit)(struct qcom_pcie *pcie);
 	void (*ltssm_enable)(struct qcom_pcie *pcie);
+	void (*ltssm_disable)(struct qcom_pcie *pcie);
 	int (*config_sid)(struct qcom_pcie *pcie);
 };
 
@@ -618,6 +619,37 @@ static int qcom_pcie_post_init_1_0_0(struct qcom_pcie *pcie)
 	return 0;
 }
 
+static int qcom_pcie_host_start_link(struct dw_pcie *pci)
+{
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+
+	qcom_ep_reset_deassert(pcie);
+
+	if (pcie->cfg->ops->ltssm_enable)
+		pcie->cfg->ops->ltssm_enable(pcie);
+
+	return 0;
+}
+
+static void qcom_pcie_host_stop_link(struct dw_pcie *pci)
+{
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+
+	qcom_ep_reset_assert(pcie);
+
+	if (pcie->cfg->ops->ltssm_disable)
+		pcie->cfg->ops->ltssm_disable(pcie);
+}
+
+static void qcom_pcie_2_3_2_ltssm_disable(struct qcom_pcie *pcie)
+{
+	u32 val;
+
+	val = readl(pcie->parf + PARF_LTSSM);
+	val &= ~LTSSM_EN;
+	writel(val, pcie->parf + PARF_LTSSM);
+}
+
 static void qcom_pcie_2_3_2_ltssm_enable(struct qcom_pcie *pcie)
 {
 	u32 val;
@@ -1362,6 +1394,7 @@ static const struct qcom_pcie_ops ops_1_9_0 = {
 	.host_post_init = qcom_pcie_host_post_init_2_7_0,
 	.deinit = qcom_pcie_deinit_2_7_0,
 	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
+	.ltssm_disable = qcom_pcie_2_3_2_ltssm_disable,
 	.config_sid = qcom_pcie_config_sid_1_9_0,
 };
 
@@ -1429,6 +1462,8 @@ static const struct qcom_pcie_cfg cfg_sc8280xp = {
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = qcom_pcie_link_up,
 	.start_link = qcom_pcie_start_link,
+	.host_start_link = qcom_pcie_host_start_link,
+	.host_stop_link = qcom_pcie_host_stop_link,
 };
 
 static int qcom_pcie_icc_init(struct qcom_pcie *pcie)

-- 
2.34.1

