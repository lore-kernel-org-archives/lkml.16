Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319B15D8F0
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 01:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744422639; cv=none; b=Y5TefzyyDRszXxHnuYQ27bsOptVGwcWHOS4nqxa0pYwSjor07mI/i4gG22VSosDpBtcpMwvkGtz5smDsmVDEqEXj8yVxmWQo9GXYGt7sgny1iesdhAzq6eCd9Ua386h03cRJzC5SaXEL4hv4Nx6hOINIFQLQh8eBKOAafRgJeYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744422639; c=relaxed/simple;
	bh=XchJ+I4Ear9gG/gPsK09+clneiUIEGvSpQq596I1TtY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hVfqEoZ9QNLFAu903bEn1XcMiTmqczPeZKbHRCA1lpQrDWjyyi/W+7VrQWN7WF1BalSpEBvl4OS88t9A7ACwKspEBDSxez0fViqCvLTpHvZTdl5xbf+xunsUAlwiaKFPqjalol1VNxNRdXtD0gpZrfJWuyVv1HinZj7QZ/mkhmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iUVyLRgr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iUVyLRgr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BC6Zb9006840
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 01:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oYOi44WO+zkPOJCPPKYoUWpuQQF+pIDf3S5b1isNpYg=; b=iUVyLRgrMPtfQKsb
	qKz8n8QgQAe8NRriMpubBIO0Xo6z6rJFmstIYLOWy/Ue4hYy7p0D8QSdJxBGaE7r
	qbncEuFjBpF7PubA5qJe/C4s+2uyFzIcW0Wn5U9DdFzQtyBNgqYiJ8f3EYJ8zcGv
	w4+IpgT+7fRmeLu2HQTgTDELAnoyEYhoQwLdYtk4bNELaP+MVikpeo5PyhwC6rVu
	yGZU43GghVaKS7ppjPAv+mhzgo9YjzX4kot1eX4OoxS5H9EOItHt7gPLQQfE5Vva
	RZ9+grN/ITLstOR/cze44JZerEkPTE4YDc1j3u1VSLb8lcRXUjeelNfpxEdCN/Xv
	DrS7Uw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3n1kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 01:50:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af91ea9e885so2343762a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744422636; x=1745027436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oYOi44WO+zkPOJCPPKYoUWpuQQF+pIDf3S5b1isNpYg=;
        b=fRcrfCsTT451QCg3FCarY/dRlZemo006gMgb0z5pUBNw5ru00hOesv7Spf/cv0YTF4
         zEphGIpoQEEcVdzLLqQ27x19MPNRN+WwscFa3DVulPzmuV4nRRWnzRsYkd+hbfmqS8hg
         QpAxlyDmm4AGg58QyYAyTVqRI2UIMITF6rvQGWNgxyLI/zRhJ15SrPnbgDjhTLe0wIzI
         ZtSqGZA9ALFnAa/KSCd6vW1zNZYAnqVUd7dVLrfOQBHRFThUFkwD8/7MsRqHTasBF6eg
         eYdZqDTsp/38Ds3588FakzGxmGZO9ce938bzx/VG8zFnvtU0f+tX+UzS4eJa6pEYZ5oJ
         JbgA==
X-Forwarded-Encrypted: i=1; AJvYcCXzKtnzcYqNPH/KGLDz2oiVJTl2N2M76/dKJF5U810gssl4By5xT5H79P0Enbltqse3UIWYt18SU9R6rVM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz5N7JLnhjkeLpvUVPlw/Foa3LFmim7xRmthjJuP1rIvCnec/n
	A2A7R2oewiN6Tood4MLyi3Rjb9dI+hGyT5p8u1AY97j+qAWD19j/ABE4NIgFCcI2myQ46BCimd6
	+bR2a9Xx/ecnzdzIr+PaJs1zKcvHbNNd4MYF37U7D33SDxxAJMIN8g8031+jmTVc=
X-Gm-Gg: ASbGnctbfzQKa+G6vy5Ssy9CKHVqRwsRjh+eJB7L1X1hYeJ60FztlSW9OSyW3vad/o1
	95ve/x7O40tX4tx12tq4a+watVW0QFZq7T0BNiLhZb4ZciQsfXKthPU5iF0wlusxe1wTFaTBhPo
	fsRGv1QbqOhX+Qfb0XeSeCvfXwAbmmkI1OVbTjFBAui8kOO9yQuIGKBpGxFl3WNrnDraDn2nYcu
	O8xj6yGIOQRoGrRXDXMbdClj19NnZU/eakG6cYzezw8GmppIx5Oia50vVHPdu/p0A4gEysJv3WR
	AT5oJVQ9si+HBFczyT2xsxVlFqX9GhcTKJ/GyEqSjccg7xA=
X-Received: by 2002:a05:6a20:c706:b0:1f5:7eee:bb10 with SMTP id adf61e73a8af0-2017978ef74mr7640381637.8.1744422635719;
        Fri, 11 Apr 2025 18:50:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEy1047R5RX/zZuv/NuW4Ly4u8E8wOw/508EQSTeQ25upBk1E7jkKhJZb+0VeQZCmxsbqlEGA==
X-Received: by 2002:a05:6a20:c706:b0:1f5:7eee:bb10 with SMTP id adf61e73a8af0-2017978ef74mr7640354637.8.1744422635377;
        Fri, 11 Apr 2025 18:50:35 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a3221832sm5516825a12.70.2025.04.11.18.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 18:50:35 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 07:19:53 +0530
Subject: [PATCH v5 4/9] PCI: dwc: Add host_start_link() & host_start_link()
 hooks for dwc glue drivers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-qps615_v4_1-v5-4-5b6a06132fec@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744422605; l=1587;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=XchJ+I4Ear9gG/gPsK09+clneiUIEGvSpQq596I1TtY=;
 b=wEfDVbJqT5k8/OZ/k547iX0Qa5pXN50JwZf/j1S7SDGoiMIVHQM1ePMT7j4SCMnCn6QscZUX3
 l7BYCLpHIFJDK4KC+oPntvIiau/RgyV93qAgFiTOo2Pz1EzT6BuZhh4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f9c6ed cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: xwvDC4P3x2ciyuRd27IpUVAkDsbOTDjn
X-Proofpoint-ORIG-GUID: xwvDC4P3x2ciyuRd27IpUVAkDsbOTDjn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=749 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120011

Add host_start_link() and host_stop_link() functions to dwc glue drivers to
register with start_link() and stop_link() of pci ops, allowing for better
control over the link initialization and shutdown process.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 56aafdbcdacaff6b738800fb03ae60eb13c9a0f2..f3f520d65c92ed5ceae5b33f0055c719a9b60f0e 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -466,6 +466,8 @@ struct dw_pcie_ops {
 	enum dw_pcie_ltssm (*get_ltssm)(struct dw_pcie *pcie);
 	int	(*start_link)(struct dw_pcie *pcie);
 	void	(*stop_link)(struct dw_pcie *pcie);
+	int	(*host_start_link)(struct dw_pcie *pcie);
+	void	(*host_stop_link)(struct dw_pcie *pcie);
 };
 
 struct debugfs_info {
@@ -720,6 +722,20 @@ static inline void dw_pcie_stop_link(struct dw_pcie *pci)
 		pci->ops->stop_link(pci);
 }
 
+static inline int dw_pcie_host_start_link(struct dw_pcie *pci)
+{
+	if (pci->ops && pci->ops->host_start_link)
+		return pci->ops->host_start_link(pci);
+
+	return 0;
+}
+
+static inline void dw_pcie_host_stop_link(struct dw_pcie *pci)
+{
+	if (pci->ops && pci->ops->host_stop_link)
+		pci->ops->host_stop_link(pci);
+}
+
 static inline enum dw_pcie_ltssm dw_pcie_get_ltssm(struct dw_pcie *pci)
 {
 	u32 val;

-- 
2.34.1

