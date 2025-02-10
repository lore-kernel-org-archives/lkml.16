Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2928B1BD9C7
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739172636; cv=none; b=AfhbEYdWl4TVWVPE7WYZqWnSnB38gK5r+O8AB0SjjPavHqBgTJLzPsSg+vGXW0SRmSIK1zYcoq148ljDGBIzQKZs4IjKELmlUMv7DenvUJTbsEWPhLn5GAN9V+XK7H7vtcgIeCDsiMVHQOHIoV13KyZ3w8R75V1j9RLzpUyDz3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739172636; c=relaxed/simple;
	bh=aQRQ6+sri+2FjvUvhS/l1+zsbikTMl/4NyNhdlh4S5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dX+HOeXkj/SiAddI/3flbRgGdJiZ719fEDmPpUjFyYmmTsjEFrbs1B387sEsgQxQrqxUoHQXRp/BeCm+qBRwx33qgMd0Mr9d1s2nC0flh6WecN11nrQoxiTG35jR82V3MDnCsAmP+NpdkXDljwXB0toWvg6ahA7cWu5HgeAz/a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QLnkEjvt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QLnkEjvt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519NUFSW032632
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRrOHyip7ZbNQ8lQZNrcx41SX8ZDA1DYAx7l+sPi8FQ=; b=QLnkEjvtShF4yQUQ
	59LbxklTXLrVeURi78b4YdSZtR0aRY+HWGSDr8ous2OcFH2KA4sBGtghCJF+obVQ
	fvwerthjtbQ7QG4Q+h+UiW1JQukHY9geConVce1YcPGreop1rMyx8v/4HnoBaK4J
	5r26vMorQDX5clIIlUcIQw31Q4HNz1PqicK82zid5CUCm3ZnfV4zW8SqY4ZHW3ST
	tcLRke4ZqPWvdgQadR/+DwEaI5UqayB3ndNbAEahLaLC1S+IT3bVrrOBr8QOsmXR
	RCO3S1sq0fFtXSMrgHsgHN9NML8u1wsB6UIXsU7twxrPzRMhcLbaR12kT/mdu17t
	CWUfzA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dxket0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:30:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fa38f90e4dso7055868a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 23:30:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739172632; x=1739777432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRrOHyip7ZbNQ8lQZNrcx41SX8ZDA1DYAx7l+sPi8FQ=;
        b=KILUofPmbru3AmUGZzAsixAFHG8i9zvMQ/aS9lTARjMuhuQuwB7LIC5btvmB2IwxpO
         Pq0IJtn0gwSYaoHXpCivPt7G8tDVnCx6+vKrfEHST8u0FHQy8qgnkhNsYWTJWa9PMy8Z
         sB2r409S4R6RbDobOUyfhLhXKtFrz2p6xUB3XzZtHMCu7CV6XhP9IJlds0D75TMrCxA1
         wPFijH4Ru+U/82JP92QWpWAc+ajSNSZLTr7hPbWBuEsPwsFL6O/R6yxIf28YaGjtVXNv
         KKEsQCJLkRrgg1UI4EKl1/pOUtOLcABEEnkImBsuUXTeYWTkq64/C9b3nvqQUi829Kev
         QASQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhK8bgG6RqjozPiDtRDP3ffS5szDVwKSIlb5RoGZ6jS148AcY9v2XFzUdL12Wu/7hj3GhHw+U7JlhWgcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNnAZ3CRVs0brs3y9m6UGdLo3F2s3PxzIGafLsHwIgtMmuTShj
	i6eDYzAUZydmnb5CuHlgca84hzlCnuIaEhituArNbCfIfX/BkhMDc14Y7S2G9YlyxHf4I16+wmS
	vuVzC0i32V0rd/BGrrHG9ZPDINlU6ddoGQuWjzOnq122SQdWJbXhUxg/5Xn+vfy0=
X-Gm-Gg: ASbGncsJ0kWHhoStckUTIALk+caPHhZdsnEJUPMyZlbgV5ZWnxE58GxjTwFRcxRaXXq
	iDFZ2de4smBXLvYhZBUleu9xNqtZ2Z3mV/S25c79gRcZAFtwjOqYZHaUoDvLs6jfy0mcUf6mWP2
	Tl8/znvQiXzw5n1PGhonb3gYsJ+rYCAItu5tiWZb3446NgR3HAr3MMGA1GIowqEH+1GyyIvnf/r
	C344iixZy2lS9hybrLrXoLmwEajVA6jHWgRcI69AfEeJkQ5kabwZvkj8qusrJaZNPKYur5KfzJs
	W7MQpau+2HIY26XVPs06o9Z8X6UQj3c3HSWSXhZL
X-Received: by 2002:a17:90b:2ec5:b0:2fa:2252:f438 with SMTP id 98e67ed59e1d1-2fa2450cf33mr18714855a91.30.1739172632490;
        Sun, 09 Feb 2025 23:30:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGC4mFsdhr14elczMdgif0tIJ9T32NQVRA86UAwGYhm7aRYQ7hdqOUHt+ZP3HEWgDqCFnMgDg==
X-Received: by 2002:a17:90b:2ec5:b0:2fa:2252:f438 with SMTP id 98e67ed59e1d1-2fa2450cf33mr18714812a91.30.1739172632097;
        Sun, 09 Feb 2025 23:30:32 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a6fe28sm7918507a91.26.2025.02.09.23.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 23:30:31 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 13:00:02 +0530
Subject: [PATCH v6 3/4] PCI: dwc: Improve handling of PCIe lane
 configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-preset_v6-v6-3-cbd837d0028d@oss.qualcomm.com>
References: <20250210-preset_v6-v6-0-cbd837d0028d@oss.qualcomm.com>
In-Reply-To: <20250210-preset_v6-v6-0-cbd837d0028d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_mrana@quicinc.com, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739172612; l=3073;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=aQRQ6+sri+2FjvUvhS/l1+zsbikTMl/4NyNhdlh4S5Y=;
 b=VCnpoykv6zQRuJNMbEm6VdCa9AY6fq++JhPDYFwoMtavGyTSlIFAEqHNlne4oCwsJ2w9Dw0a0
 /v3Lv2XJzR1DAxjBZMQrUAUVCbu6ncBtGcIvRRjc/DYwqXY2GU1QVwy
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: io5nAFC2ZzVgA3wV406CqjhGNFjLcGFx
X-Proofpoint-ORIG-GUID: io5nAFC2ZzVgA3wV406CqjhGNFjLcGFx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100062

Currently even if the number of lanes hardware supports is equal to
the number lanes provided in the devicetree, the driver is trying to
configure again the maximum number of lanes which is not needed.

Update number of lanes only when it is not equal to hardware capability.

And also if the num-lanes property is not present in the devicetree
update the num_lanes with the maximum hardware supports.

Introduce dw_pcie_link_get_max_link_width() to get the maximum lane
width the hardware supports.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c |  3 +++
 drivers/pci/controller/dwc/pcie-designware.c      | 11 ++++++++++-
 drivers/pci/controller/dwc/pcie-designware.h      |  1 +
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index ffaded8f2df7..dd56cc02f4ef 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -504,6 +504,9 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 
 	dw_pcie_iatu_detect(pci);
 
+	if (pci->num_lanes < 1)
+		pci->num_lanes = dw_pcie_link_get_max_link_width(pci);
+
 	/*
 	 * Allocate the resource for MSG TLP before programming the iATU
 	 * outbound window in dw_pcie_setup_rc(). Since the allocation depends
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 145e7f579072..967c62cf3db0 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -737,12 +737,21 @@ static void dw_pcie_link_set_max_speed(struct dw_pcie *pci)
 
 }
 
+int dw_pcie_link_get_max_link_width(struct dw_pcie *pci)
+{
+	u8 cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u32 lnkcap = dw_pcie_readl_dbi(pci, cap + PCI_EXP_LNKCAP);
+
+	return FIELD_GET(PCI_EXP_LNKCAP_MLW, lnkcap);
+}
+
 static void dw_pcie_link_set_max_link_width(struct dw_pcie *pci, u32 num_lanes)
 {
+	int max_lanes = dw_pcie_link_get_max_link_width(pci);
 	u32 lnkcap, lwsc, plc;
 	u8 cap;
 
-	if (!num_lanes)
+	if (!num_lanes || max_lanes == num_lanes)
 		return;
 
 	/* Set the number of lanes */
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 501d9ddfea16..61d1fb6b437b 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -488,6 +488,7 @@ void dw_pcie_write_dbi2(struct dw_pcie *pci, u32 reg, size_t size, u32 val);
 int dw_pcie_link_up(struct dw_pcie *pci);
 void dw_pcie_upconfig_setup(struct dw_pcie *pci);
 int dw_pcie_wait_for_link(struct dw_pcie *pci);
+int dw_pcie_link_get_max_link_width(struct dw_pcie *pci);
 int dw_pcie_prog_outbound_atu(struct dw_pcie *pci,
 			      const struct dw_pcie_ob_atu_cfg *atu);
 int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int type,

-- 
2.34.1

