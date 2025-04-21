Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0349E2165F3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272839; cv=none; b=H3qpoPyDSf5v3Fys+Sq8O5aUV1GedwzcHwQU6P19kbVLQ69SmpEMvAf1fDurbfJ1dnNTjRGeBpQcIa1twU2aDzzVVV6YKrhWf7k9/pRZlOZAT55JacJA12qF8RX5qne113ikZpTLaXXKYVklqdHadsz3u5YrYJlR2WjBBJGfyfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272839; c=relaxed/simple;
	bh=RucDGnh205zN9Du1WLY/9OSUuvvX/3h5grFDFTis0qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Il7EJ1PqRF6lPVI6xdAsMj0i5iklaXkWt+BCp3m6kpUU/9xclftpuFiVaG/RgfqL1EIWDIY/FI/65hjhPxT81OK1gTcMHfMNTOjR2TwdegaTaq5R5/3uwB4G2a/PdKTOJoht309miaCYO4q2q3tqrtLwPxu+SYnT7D2hM0lfPd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SPrIDwSf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SPrIDwSf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK3oNT009395
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RxIreYtDs8PbxaWWNugh8dWagakL5JwQYhA96Zqa+B4=; b=SPrIDwSfCZk8LcCs
	H7FS4181QO7ZCoVZcpL4inEKpDlj2RGbVk0bu+D8xnt1Wpga4CAMyP8eIBcy066m
	Z6lC/YhMVR2YVPOveBLC6k8a9pZCfyMTlaYLnET6yih4UGlvWbZx+IFgFx2uuJaA
	q61pNmlSrlP46frW97lSqkMPNLuDKRS/guc/4HNy6GM01eTUitO9e3jToSqvyCMn
	rPvPjQ9SiAViPofaEeGNhLqcw2y2PbZgs9TJvcosD2yASLwTNgdDAkbUfKNcRS7/
	01mnpViGTO9IXLLpDyO/XB40BU4xn6lJVPLm5tH3z9toOKIUSZQDT/HYdG/v2WEA
	CMk+Kw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643e1dc9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736fff82264so3331631b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 15:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272835; x=1745877635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxIreYtDs8PbxaWWNugh8dWagakL5JwQYhA96Zqa+B4=;
        b=lGOHzMVMMrnuIx2OO4iBJgoqMXi6l6Cao9kxkIp9lMJyn49HJ7dqEI9p426xf9ARcl
         o2FZ+38y1nxMsIeOsD0nxpB1eXK0gmv2S5UVDcrA13suc+J6C6rAV7p11itu3PmJxgQJ
         nHyR9v7w7WgskkUw0hxqfuFPzf1sY4+6WtSqBpaWw/uoNSrTHiGfBlK/hVV5z5TER3Ig
         RBT9oofiI5xAZ7fyNNWZFrwv72CGB0YoXvmX3peOiHR1gG0N0zThHbXy48wDesm2GIvi
         wCqZDnMV6xIHWn/QVFgWpLq65ATIgGPyPIxNnclnwUHiyxQUi4evpqSpbhwrLceoKm3K
         8+pA==
X-Forwarded-Encrypted: i=1; AJvYcCUgayjFF7B+IW8D2+AMRRsj126oHm4OsIvp3nPa6QfS6GvJJ/dqBeoWjiLAadBPApvOGIdCHLP0mpMmyD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGr4ftZlHQfeZB1zNYpXgkqiJDWNTefdT6NVEbkKNVukClNJcq
	ylhyCdzd8li43hW+RHLhUjQLVExIRYmCoMqE7YvC90dr5XoHHMOfCg+hCCo6aXUQ93xXafRYxWm
	/tle0Ehyh6so/FycSr5v79xVmKK7/dgy6MLJZqN9Fh0Nv0+HxkIWL78tu1c+Ds00=
X-Gm-Gg: ASbGncuctpAGFwminnEDGr748LNPWv1cQvQ/ib0mfQFjyJGdIWy4zf3vhZ8/PssqfWk
	UlSVLTW+teGItCCpAKhVeHM6HBocMp8fMBNFr6p4Cl/91isnVSUpcDbdvcTT1kC8WL+o9hmIL4X
	yWRd4hfltgL7uYWZk9DKTWplbxnD4beR0tbYHwRaPhgoVqcCI1tBdiXC3Gi19lM7g22vE7HvIrt
	ahgexK+tijOFvmfSRCUD+6fYDTzljLW/bG+MvhC6BY250H9xseMA1Q1Ruu6RVl1qmY3zHGt7dHk
	XyAR0uQiNBoue3V/78oRK7OolF4Nn4rB2KjFbIddHGSX7fmx2WGylPgBpyReyWJLKOM=
X-Received: by 2002:a62:e315:0:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-73dbe601c10mr16714363b3a.9.1745272834764;
        Mon, 21 Apr 2025 15:00:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa4d/A0MdKe7wsQHbdyWdb8WfMEvnr8OJVqW1df+NeezeSlqtJ/whYCxmwSASSmgAQKiKdoQ==
X-Received: by 2002:a62:e315:0:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-73dbe601c10mr16714297b3a.9.1745272834133;
        Mon, 21 Apr 2025 15:00:34 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:33 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:12 -0700
Subject: [PATCH v5 05/10] phy: qcom: Update description for QCOM based
 eUSB2 repeater
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-5-25c79ed01d02@oss.qualcomm.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=1377;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=+hImyIOsCXufDPn2hP6J7P3TE43wajo+VUahTyCkksk=;
 b=e1eWhBFHzDWXtYIz2cG0r2tDlIYq7kkjoByLMH3dJK3efUPNwqwPXRsotlSepEFtiK4HvWeYV
 56XvmXYuE46DxXiIiZYfWfv+gCA/1Ne3Xy6BxIOP+QrhBjZD2uOxJnZ
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=ZOrXmW7b c=1 sm=1 tr=0 ts=6806c004 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=2IHzoM5ujN45o2WKKn0A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dlNWGB40y_Rcx-pQk6gtrATR4t4GkYzk
X-Proofpoint-ORIG-GUID: dlNWGB40y_Rcx-pQk6gtrATR4t4GkYzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=931 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210172

From: Wesley Cheng <quic_wcheng@quicinc.com>

The eUSB2 repeater that exists in the QCOM PMICs are utilized for several
different eUSB2 PHY vendors, such as M31 or Synopsys.  Hence, the wording
needs to be updated to remove associations to a specific vendor.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index c1e0a11ddd76c2056eb2e72a287ece4def2cf5d8..3cfb4c9d3d10dce49bb93b241f9b56c75b934601 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -135,12 +135,12 @@ config PHY_QCOM_SNPS_EUSB2
 	  on Qualcomm SOCs.
 
 config PHY_QCOM_EUSB2_REPEATER
-	tristate "Qualcomm SNPS eUSB2 Repeater Driver"
+	tristate "Qualcomm PMIC eUSB2 Repeater Driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
 	select GENERIC_PHY
 	help
-	  Enable support for the USB high-speed SNPS eUSB2 repeater on Qualcomm
-	  PMICs. The repeater is paired with a Synopsys eUSB2 Phy
+	  Enable support for the USB high-speed eUSB2 repeater on Qualcomm
+	  PMICs. The repeater can be paired with a Synopsys or M31 eUSB2 Phy
 	  on Qualcomm SOCs.
 
 config PHY_QCOM_M31_USB

-- 
2.48.1

