Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F1A46BF;
	Thu,  6 Feb 2025 11:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840572; cv=none; b=BEbRSxIQZ11lW1M0sA4Kx5J/JqNlrliBbEHe34LOoRjqaoxuIv22oPgxN1JQLXm/azbyZecibzt71S90VpvuFf1G/mVWISbH28Aj1jRHiEoRiEivY9MXVWScKe8SHkNMuY+Uu95vKpzEi2kNs1XYlKHFUeeaAb8GjcbIHWATv8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840572; c=relaxed/simple;
	bh=P89kjlhWbGg4rqWAGe6uFsfVD/9+RhRE7tUJkknWi6Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d4iztvJpuJD4MqgICvvQU3QTYaiLaMoum3M2bQwqdjWUVzuRgGQE49FSVQYFju1TzCJT8P/LlQXesRCQ53VavZWSR/e008EoebhlsBOpqS2u9InSM9q3FG+5S/1xy8sn35coEo7IaNOCttXeozgughvPXYytafyRx9vbVVHCrIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G3JI8yFO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G3JI8yFO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5169lhow026622;
	Thu, 6 Feb 2025 11:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZfkxI75y0uoJp5jR1mZgHjed
	jB8pjF4RXidel6+ZazE=; b=G3JI8yFOvf44mjHIOAN5BpRFucmAte1+AzZ/OJdu
	Pu0NsLJILIoi2Rb7foSxHFv9dNCP/K9FxTnztH+u3V863Mb+sTxE8RyAyvgOmDtl
	pGLEmW7U9oloVR3W38bntACYl5w/jngBolZtYUOa4ey1d/WNRZ13W4nN1ByyYqZx
	uae23EARgLXtP1fZhOJlgkg2yDtN+G3OwqDI7ExNzuVmiH+Jsq1+vkXg2v+GyJZt
	8Lq6QxXAh0ZWmBsShddWugSzZcWORoJNeL/MKEU51CaO+WiXc45wJ++kJYun4A8v
	4whAq8Q9EMmlPeDypnjAZ1H4Vn0aldyv4CcwnJs4nxMQYA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mtrx874g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 11:16:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 516BG5bW012902
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 11:16:05 GMT
Received: from hu-akakum-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 03:16:00 -0800
From: Akash Kumar <quic_akakum@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jack Pham <quic_jackp@quicinc.com>, <kernel@oss.qualcomm.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Vijayavardhan
 Vennapusa" <quic_vvreddy@quicinc.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Akash Kumar <quic_akakum@quicinc.com>
Subject: [PATCH 01/18] usb: dwc3: Reserve Higher Bandwidth for HS Periodic EPs
Date: Thu, 6 Feb 2025 16:45:26 +0530
Message-ID: <20250206111543.17392-2-quic_akakum@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250206111543.17392-1-quic_akakum@quicinc.com>
References: <20250206111543.17392-1-quic_akakum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NMMhjMV0qdKvlE7b6MZwkZdbml9fvzKZ
X-Proofpoint-GUID: NMMhjMV0qdKvlE7b6MZwkZdbml9fvzKZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1011
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060092

On targets using synopsys usb dwc3 controller, it is observed while testing
multiple audio devices, a glitch is observed during testing.
As per dwc datasheet,By default, HC reserves 80% of the bandwidth
for periodic EPs which can be increased with GUCTL Bit 16.

Add quirk to set GUCTL register BIT 16 to accommodate higher
bandwidth for 2 isoc eps.

If this bit is set, the bandwidth is relaxed to 85% to
accommodate two high speed, high bandwidth ISOC EPs.
USB 2.0 required 80% bandwidth allocated for ISOC traffic. If
two High-bandwidth ISOC devices (HD Webcams) are
connected, and if each requires 1024-bytes X 3 packets per
Micro-Frame, then the bandwidth required is around 82%. If
this bit is set, then it is possible to connect two Webcams of
1024bytes X 3 paylod per Micro-Frame each. Alternatively, you
might need to lower the resolution of the webcams.
This bit is valid in Host and DRD configuration and is used in
host mode operation only.
Set this bit for host mode uvc uac usecases where two isoc eps
are used and flicker is seen.

Signed-off-by: Akash Kumar <quic_akakum@quicinc.com>
---
 drivers/usb/dwc3/core.c | 11 +++++++++++
 drivers/usb/dwc3/core.h |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index dfa1b5fe48dc..7e55c234e4e5 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1461,6 +1461,14 @@ static int dwc3_core_init(struct dwc3 *dwc)
 		dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
 	}
 
+	if (dwc->revision >= DWC3_REVISION_250A) {
+		if (dwc->dwc3_guctl_resbwhseps_quirk) {
+			reg = dwc3_readl(dwc->regs, DWC3_GUCTL);
+			reg |= DWC3_GUCTL_RESBWHSEPS;
+			dwc3_writel(dwc->regs, DWC3_GUCTL, reg);
+		}
+	}
+
 	dwc3_config_threshold(dwc);
 
 	/*
@@ -1818,6 +1826,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	dwc->dis_split_quirk = device_property_read_bool(dev,
 				"snps,dis-split-quirk");
 
+	dwc->dwc3_guctl_resbwhseps_quirk = device_property_read_bool(dev,
+				"snps,dwc3_guctl_resbwhseps_quirk");
+
 	dwc->lpm_nyet_threshold = lpm_nyet_threshold;
 	dwc->tx_de_emphasis = tx_de_emphasis;
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index ac7c730f81ac..00f4582edfca 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -283,6 +283,9 @@
 #define DWC3_GUCTL1_PARKMODE_DISABLE_HS		BIT(16)
 #define DWC3_GUCTL1_RESUME_OPMODE_HS_HOST	BIT(10)
 
+/* Global User Control Register */
+#define DWC3_GUCTL_RESBWHSEPS			BIT(16)
+
 /* Global Status Register */
 #define DWC3_GSTS_OTG_IP	BIT(10)
 #define DWC3_GSTS_BC_IP		BIT(9)
@@ -1393,6 +1396,7 @@ struct dwc3 {
 	int			num_ep_resized;
 	struct dentry		*debug_root;
 	u32			gsbuscfg0_reqinfo;
+	bool			dwc3_guctl_resbwhseps_quirk;
 };
 
 #define INCRX_BURST_MODE 0
-- 
2.17.1

