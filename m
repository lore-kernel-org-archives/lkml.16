Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5E52741C9
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647790; cv=none; b=Ip5WbwoQrpLc3h8RI/8gfsrj5vbFkzAz/1nq20Dds993jAIXuvsIq4HpMl7S20RBATr8+AVGkukOrIpeqjyqzOGzfx231XAqx52rlEGcZdRvobPTY0++c48p45m0a4jKftQKdVyMBbvIGhBKu3LZqBNWVfnIKPnkhK8RCZf2/eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647790; c=relaxed/simple;
	bh=uRy4dvcpRg7kmvMAbVOO9GqUHN/mlG3BTN+ZElHTVsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZ42iOdqHCORczbUkX2uq+Pdfj9ikCwEF5X/HBR7+hzZmG0fM4LAAKaT/sZlGO5dT0hg4ClFSG3piNRhvTvokE8O5tDbJYtVtMNIJ+BPe7IplVPZ7xc/mj42b1H3qYOgkFoECO/lyOYvIpzlsWi037Yl7QJ9HBWvUAUk87u53Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cgX/o7F0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cgX/o7F0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7GWHF022850
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	roesPrhIrlAEA1YO21ErXpasCF74J3nkSL/IK34yrk4=; b=cgX/o7F08d+t9S9G
	3tX/r5Mw0I2iJiP4Vn5nXkXD0E3O0JoodT8s1sxqtCps3ty+pLP35xiy3UpdOsk3
	UkKWIwmkUriV9MfumNUiSCQORL8OCOumMzWSgLoqYV7snr4gBCWG7NRUdsk8uLwU
	ByPfmopguNzLun4BWofMZysYT8+jUpODarBaC8XGIhz4RtHgu+YWrYwpteY79R6+
	BizLA11/vuY08MmZyp9kIIQOWKR5IgilwfGGMXH/vphsx7DEaltzxrfwtWO06cNJ
	AHP+tFpUJ52IkRxXCNhXiwwJM7ytxjrjPPQ6WBEjhD60VwlHOwsNkmDcZiv8mpz2
	YOAFxQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041rds7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:43:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742c00c9044so1111845b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647787; x=1748252587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roesPrhIrlAEA1YO21ErXpasCF74J3nkSL/IK34yrk4=;
        b=JdXzWISt1ndwfcqHVCxZ9TdjYNX2dl1KodVUM9FjibclDxkPtnRfEx4cwPhI/94WU7
         HIHICOr4EK7etZXzx+72uUQH4iNjWn0NPcHxK9gT5RXS2t34MhiUV1aHq+9hdIlStsw4
         ajpp3uKz3REmOGATs/A0b27/IZCol85S9fTX7IP+zsQ+4ahPUAFCJ6OOggRjxj2hpWVi
         rmjY4zvfpDpT7qohTFtaUJU36TDLbHRMT0XoMxNE84KZVIMAsIqg0GYeQA5/qTPia2B7
         VLzm6t5mo+SlXRZwXJAgNq1tkSUGDoFPQnJFTZTe/XRHHjHE3+EENgP6FYtBS/joNozj
         pwrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWDYDBSnvKv/rZ+q9P+8ner0r7rdDr0eVrIvfLJstziZJK42MCkgBbk7pDvaR5ovBQUjaUln8rxkoMaN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJSldrnIT3a9Fdg+ZZ50ObcUVCM1M/Do/KJ/IjSB0vzRS0hh5p
	7FIt3ycjfQCcqO/1h0aHgrhO/T9Hn5XscioYpILsFwNDRdeklh49K5cO/M/L94LI0E9mTzEWoWH
	8yHDlXi2oT+R4Bc+ArWkYQN2W8FgSt+RHpSTjwzZjjQ8mriK6dmCM7KN+dMzjeB1jdF0=
X-Gm-Gg: ASbGncvXuzO3DQrv1VK6LxfchS56qGxIdtODK2aTieLiIhsxv0phywVXARn8c3z1lqn
	4Tu4OnhSQZrglGDJeH/ni6yidWqZxpeVB53KJS1BrBTNXkCJTS/6hKjXsxdmBTLxS+vtWJa5UOk
	nhQFI2+BcBoySQ6vkXNTtTSMpp/iNzBq0ojblG6A8thK0RNBf2TpPfgeyXwuRhlFLFAOpachxnz
	AFpDONE2XWqq/0nei+LJuqjebyI7rqOitRL+6dySEGERtK1dZOV3xHCOrSiH26mtLwcq0o83+vk
	HTNedZt3Dvt9OPE96q9EsIqXxdTL5aOLViGbugUy9jtHJn0=
X-Received: by 2002:a05:6a20:a108:b0:1f5:882e:60f with SMTP id adf61e73a8af0-216218c6475mr16209483637.17.1747647787498;
        Mon, 19 May 2025 02:43:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZH8Dj3PuS6Ytm+ZrZel0YOH28lKM6PLPGcCy1a6ugOdm4Fbbt13k3NmX+lfNghb6SE7j+aA==
X-Received: by 2002:a05:6a20:a108:b0:1f5:882e:60f with SMTP id adf61e73a8af0-216218c6475mr16209456637.17.1747647787108;
        Mon, 19 May 2025 02:43:07 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:43:06 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:19 +0530
Subject: [PATCH v3 06/11] PCI: qcom: Add support for PCIe bus bw scaling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-6-3acd4a17bbb5@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
In-Reply-To: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=3981;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=uRy4dvcpRg7kmvMAbVOO9GqUHN/mlG3BTN+ZElHTVsw=;
 b=mQtO0/n8c0BhB/f25pUQ1GkXVkBqCEu41cAG9IMiYjXuYqkYiaL9uOeXRiXpx2Zd39908iLjI
 3cLG+tItBK+DrmDBUuWU+gDQnMWH1DgjbAt4j3Ygm6yiMWh+y4Y98D9
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MSBTYWx0ZWRfX5lnDRqh9+vpI
 OcscUX4a70QyLl6xtVikcjtUBYUz3khSSaYBvvKbTTB9qHY1rGzswBUJUC6zJDvv/kv+uQL4Lyi
 3d5uRNpNKlWS4nRFxkXqSaebUJ7C+haEGQKzJk48kImt+ePncR74rkNXu5RLkoAQO4hYcHSvkGL
 /JQzffsd+pPUziusIshc6eMnsr92ADjMKALRMDxqF/d4/lMxXrSo+hfd9V3PddzQwyek6oDnAJQ
 QqBWASWcZ0Qf30kxoHBFFcpYnFT1jLvw2cBxRdl0NR0vRQcPQ/bCwtFVGlpQEoXIe7cabMvM8fY
 H7WjgBZGbzJtDhl+YO1YcuoVcuZKGEN2JO1ZVbUjHBa4Otd1JmtpIzvQJ2qOy13aJ4ikHdA2l4H
 6AkxfxgH2bWV6WmLER5kSVBK3XSihgNtKx4EDej6IuCcljm2AJSArXkPbZEz0pjzEiOAHK2H
X-Proofpoint-ORIG-GUID: mWBa75wuKws-bYYxabFj-49WneNGgsny
X-Proofpoint-GUID: mWBa75wuKws-bYYxabFj-49WneNGgsny
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682afd2c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=h4B-02p0z56_JbXvspoA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190091

QCOM PCIe controllers need to disable ASPM before initiating link
re-train. So as part of pre_bw_scale() disable ASPM and as part of
post_scale_bus_bw() enable ASPM back.

As the driver needs to enable the ASPM states that are enabled
by the system, save PCI ASPM states before disabling them and
in post_scale_bus_bw() use the saved ASPM states to enable
back the ASPM.

Update ICC & OPP votes based on the requested speed so that RPMh votes
get updated based on the speed.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 63 ++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index bd984cde8d3bd688b2ac32566b0e9cdbc70905c0..491324d44785535b84460d468727b8c356ca1040 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -276,10 +276,16 @@ struct qcom_pcie {
 	struct dentry *debugfs;
 	bool suspended;
 	bool use_pm_opp;
+	int aspm_state; /* Store ASPM state used in pre & post scale bus bw */
 };
 
 #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
 
+static void qcom_pcie_host_post_scale_bus_bw(struct pci_host_bridge *bridge,
+					     struct pci_dev *pdev, int current_speed);
+static int qcom_pcie_host_pre_scale_bus_bw(struct pci_host_bridge *bridge,
+					   struct pci_dev *pdev, int current_speed);
+
 static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
 {
 	gpiod_set_value_cansleep(pcie->reset, 1);
@@ -1263,6 +1269,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 			goto err_assert_reset;
 	}
 
+	pp->bridge->pre_scale_bus_bw = qcom_pcie_host_pre_scale_bus_bw;
+	pp->bridge->post_scale_bus_bw = qcom_pcie_host_post_scale_bus_bw;
 	return 0;
 
 err_assert_reset:
@@ -1328,6 +1336,61 @@ static int qcom_pcie_set_icc_opp(struct qcom_pcie *pcie, int speed, int width)
 	return ret;
 }
 
+static int qcom_pcie_scale_bw(struct dw_pcie_rp *pp, int speed)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	u32 offset, status, width;
+
+	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	status = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
+
+	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, status);
+
+	return qcom_pcie_set_icc_opp(pcie, speed, width);
+}
+
+static void qcom_pcie_host_post_scale_bus_bw(struct pci_host_bridge *bridge,
+					     struct pci_dev *pdev, int current_speed)
+{
+	struct dw_pcie_rp *pp = bridge->bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	struct pci_dev *child;
+
+	/* Get function 0 of downstream device */
+	list_for_each_entry(child, &pdev->subordinate->devices, bus_list)
+		if (PCI_FUNC(child->devfn) == 0)
+			break;
+
+	pci_enable_link_state_locked(child, pcie->aspm_state);
+
+	qcom_pcie_scale_bw(pp, current_speed);
+}
+
+static int qcom_pcie_host_pre_scale_bus_bw(struct pci_host_bridge *bridge,
+					   struct pci_dev *pdev, int target_speed)
+{
+	struct dw_pcie_rp *pp = bridge->bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	struct pci_dev *child;
+
+	/* Get function 0 of downstream device */
+	list_for_each_entry(child, &pdev->subordinate->devices, bus_list)
+		if (PCI_FUNC(child->devfn) == 0)
+			break;
+	/*
+	 * QCOM controllers doesn't support link re-train with ASPM enabled.
+	 * Disable ASPM as part of pre_bus_bw() and enable them back as
+	 * part of post_bus_bw().
+	 */
+	pcie->aspm_state = pcie_aspm_enabled(child);
+	pci_disable_link_state_locked(child, PCIE_LINK_STATE_ALL);
+
+	return qcom_pcie_scale_bw(pp, target_speed);
+}
+
 static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
 	.init		= qcom_pcie_host_init,
 	.deinit		= qcom_pcie_host_deinit,

-- 
2.34.1

