Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B91925B684
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466349; cv=none; b=EgW8ImKd0nMR/bcWb6Vq1WwAQcL0XD0EaGhJY5wZihV3/qivIeDyDjNmCONbUSrY9dKDoOh5q+bSk4dLJWKEm7qe6D+Lbm5NfzPBeL+ufcjtbjKT1Pe0C75vhqSNaig432L/2YxEKNduRMFNPjrnXUE7wb94qzBBsT4n8BtjT8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466349; c=relaxed/simple;
	bh=mQP/2kjW43Zd9RccVZlz6IzdDvgPGrMPigpQllInEwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mwe/V1Hlmp/9P4DLFN3Nho72yc4HI3ppCZT8l9X++TphNWPC2BAJ9da2bCaFsAkrZylPKN8a2n9FkWRWZ0CDJOqolsMN2yv6/EH4Krn6L91rBZ9pBPuXkeGtIR0rykQOFgg862qp+Hnrm1Zlehsa0UkGwcCJZ/rK9FMS/EahET0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+hFA0Ck; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+hFA0Ck"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599IxUM030051
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 10:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o92yNqD2Tgr7h+9utlt9yCYodwnleBQ6N8D29Rin1hw=; b=G+hFA0CkvxUJr/zi
	wSnDhjrRSzOgEA3bsEZp+cI8PQ7UAGoyyTmMjoFSarFBvdoHrr52XFEtW4j5szvz
	lIB8e2g58yJhls5rgb2DBkx5TP16rqjHSJGV8P4mXMi+W0VM409Y3o6lqoMT94Au
	Qa424WPhuK0+xC1a7GFrvVD+uxbDKEte+e+XOr5BexHbCRMXoeiHGZA9vDbosdJE
	GhfMLAW18ZMkj65OnldQXYBoun4jsrck+jZ6yDcS0/dPSChwXgZGK6jzwzPJAglb
	ajAk8mHfDDzNGpQqP2k0rmqrSlitkXpdhateK/4t5J3/FbfH6g/LDszHPpovFJg0
	CT/XYA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpnfw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:52:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b0e0c573531so2556792a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466344; x=1750071144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o92yNqD2Tgr7h+9utlt9yCYodwnleBQ6N8D29Rin1hw=;
        b=HOp+xA+d6SDKscdwUD3nKDCeaAru3eodh8M4k1dLPHEO2M9Ymp2FH2wm+Ea1OZe1bw
         9NTs5ERhoyGm9yf0Ifj7nDiLKOP4tiUx44gaWJbF3asDRp02MlvdoJUPkT4SCly5p76w
         Vzjgb9rgaamiFQBN/qBPq09YbBk0jhEE0rIRx3u55gdXTYMB8iecAWT2iXTW7XVBi349
         VHLGntNo0lumI+Abz+6SSdbexKYy3uykJJpQGV89hXuafhRPqUD3CGZ6VH+OfFVoGPfa
         mKdAjzn1g7fpvR8bb/EfoaDLEJe1KC4yxuNh7/U3tn9KS/l1ozXn40vq+CdrSDZr46Bp
         U0qg==
X-Forwarded-Encrypted: i=1; AJvYcCU0+X8tKyKMu1xaNxNy9yM1SHhrA6qDM7LLCusAkuoKXGRRoY9YX5xugarDtJWW4q2A3tAp0veC67rZlio=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj485ZYQk2857110CX0DcNAwVqtJc5Q9fvRU4yvjk+WknAzHiH
	Mw4zn10G/f9GUmOW+Y6T8D/qCeTqslnOneXCHIQpJOOZL/h4ALtWYfU1SwRbsYtrZcEma/FvjZB
	1aDr0XdoSfyIwrPkGpj9ORBxy9mPsGpaCLt4cU4Ij7ivjy9x4WxZdUnT4fXDcbvsj+vQ=
X-Gm-Gg: ASbGncsu9+NEUp6sU1iierg3tjXhpnUfw9AEcLc/AcCcWrZlZQGOMWiuzQZIwlsl9lA
	fOTPQ7kdGimrs02284qNHvH1WY+XcniGkTDdB1GR2gF0Q11MNyPa2wQZ3gD0oufP8ymibbty8Cv
	GYWlCt277lbYga6kiKUSuzkR/vlWKzUkhy/QqL4fzZiF6IlDb0+CHxDTlpjao2NchMhN38FfmOr
	IwNC6LXYW5p+APF8nBcm+B+mQaHDILpJw9hEX3DmUvly5jNrcD3SxViDOPe9uDuoILeNeKCABRM
	fY4iw/dJg/+/sD0YuTTJR3uHU2U+hyEEpNb6Ko5WBC4fAeUX7bjBVhy/Og==
X-Received: by 2002:a17:902:f54c:b0:234:9066:c857 with SMTP id d9443c01a7336-23601e50d77mr159860265ad.21.1749466344249;
        Mon, 09 Jun 2025 03:52:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFqOZ0LBqhpHW4dTHxE+6rU0ZPQzQW2xA5UNp/TIVNcBbhnWqqq67ylrTPdwc7ULZzKPDUew==
X-Received: by 2002:a17:902:f54c:b0:234:9066:c857 with SMTP id d9443c01a7336-23601e50d77mr159860025ad.21.1749466343879;
        Mon, 09 Jun 2025 03:52:23 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f44sm51836465ad.63.2025.06.09.03.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:52:23 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 09 Jun 2025 16:21:29 +0530
Subject: [PATCH v4 08/11] PCI: qcom: Add support for PCIe
 pre/post_link_speed_change()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-mhi_bw_up-v4-8-3faa8fe92b05@qti.qualcomm.com>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
In-Reply-To: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749466291; l=4037;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=mQP/2kjW43Zd9RccVZlz6IzdDvgPGrMPigpQllInEwU=;
 b=NU7mc78Y5DDzuXdX5+Bk8k6qlUSb4HRMRU9Cz98SQ5kXfngX5ckDgsx9jlTQpzKPe1SyhbpP1
 1B/b+g8nppgATx055WOYhDiMM9kQWBER9f7ygNyW0F/wiOdkazNdjrH
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6846bce9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=h4B-02p0z56_JbXvspoA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfXwwwnkhf5/WI3
 Sch4frGUo7obl0essFtjbZd0L+FUHTEgCgta5adpn0gIa8lPzkN7x5C1TsvepEHqpiMIXHKL7kg
 W3KZQZOaEGAB1S8Gm/AoYPeTk6fkwjLzYhYGemBEkrq0J3c5EukeQ/hIr+ipFvLE5J9m7OSbsdn
 NviagCcvMejBUqyr+zcYSnGpLjwNA+eVmJ7Xr+XVHFcE8P8UW/k7CKEbp9MBLIItsFGowxW8b7S
 2C9/reDB9mfwe+VXk9PUx/finFR2XPYM3UXeVZl/F9VfVgRz9yhK70H+lILLeveWie3Beqw8z9X
 +RV7FxMLG6p+qvWr4H3+U/HXdyYGBBVPyI+sDRdrRtHpMyVUNyrlhDCst9kPsL+oYHvSaDnK+La
 joMVFuiCyXio2ESIoXvcVCP4uj58b4QJDTHzG53weyWibV9ufsXWR2qP8AvrY+5LKgneGmyT
X-Proofpoint-GUID: CbXq-QRFwVqbkgrJFwUdRBYJPq5YcZLd
X-Proofpoint-ORIG-GUID: CbXq-QRFwVqbkgrJFwUdRBYJPq5YcZLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090082

QCOM PCIe controllers need to disable ASPM before initiating link
re-train. So as part of pre_link_speed_change() disable ASPM and as
part of post_link_speed_change() enable ASPM back.

As the driver needs to enable the ASPM states that are enabled
by the system, save PCI ASPM states before disabling them and
in post_link_speed_change() use the saved ASPM states to enable
back the ASPM.

Update ICC & OPP votes based on the requested speed so that RPMh votes
get updated based on the speed.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 63 ++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 02643579707f45fc7279023feb7dbc903e69822d..c4aa193bbdcc928603ae50e8d7029b152d62f977 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -276,10 +276,16 @@ struct qcom_pcie {
 	struct dentry *debugfs;
 	bool suspended;
 	bool use_pm_opp;
+	int aspm_state; /* Store ASPM state used in pre & post link speed change */
 };
 
 #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
 
+static void qcom_pcie_post_link_speed_change(struct pci_host_bridge *bridge,
+					     struct pci_dev *pdev, int current_speed);
+static int qcom_pcie_pre_link_speed_change(struct pci_host_bridge *bridge,
+					   struct pci_dev *pdev, int current_speed);
+
 static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
 {
 	gpiod_set_value_cansleep(pcie->reset, 1);
@@ -1263,6 +1269,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 			goto err_assert_reset;
 	}
 
+	pp->bridge->pre_link_speed_change = qcom_pcie_pre_link_speed_change;
+	pp->bridge->post_link_speed_change = qcom_pcie_post_link_speed_change;
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
+static void qcom_pcie_post_link_speed_change(struct pci_host_bridge *bridge,
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
+static int qcom_pcie_pre_link_speed_change(struct pci_host_bridge *bridge,
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
+	 * Disable ASPM as part of pre_link_speed_change() and enable them
+	 * back as part of post_link_speed_change().
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

