Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD38B279357
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744220921; cv=none; b=gS53ZePPM9jqFzNN9Pwa0mynlsq6WgVztEMks54jUZ3QoPhWdxmPCPQtfgTlO/hI2bBwYeaAvmrE1WFFyxl9slcHXndGNYDur4/tbS+izm7aKAFQvogcxwlXmiT6cXf0qQ7w/+dIpZniKQFf2N5b6Rd0h+DfAEnwNNObH8O7V7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744220921; c=relaxed/simple;
	bh=sz0kXCsZPP1gXa3Tdw156Uk9burhLLaP+nEGbSexEIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gwiqKU0YRilBpqlsTLDBudvLg25HyFmS+5k9t46tO9alyzkIjBO+yMBcul1kcoe1TZhH1sGZoY9yCkAlS1A+XsBetVzZMI+NdhSUABWhbGR7/mqvo0aU/DhsbE2sdBfdE+90DXVPXWO2qgOYW4fA8Ko2DUaYVUTGF9cHqnk8k5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aOjUuivX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aOjUuivX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HD7Jx015755
	for <linux-kernel@vger.kernel.org>; Wed, 9 Apr 2025 17:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMlcATzpP4SwOlSvLawCrOvBXTdzBvxy/P85lAIfsJc=; b=aOjUuivXd7msVk7c
	xeRu0w31+xxRiBF/iX9GmbDSL8mz0ouMyIJAx8bsZno0BvguXarPnyzGQasQqHgO
	GW2okA7vyZu7lDKFVEUlVV/Y2vPxfJzm0G2kX3ygQuAAPHTaP0oSejuztBXrz9+E
	dI6mA6Kmcf4TMvYOVv3G5TZ1+y6p5JayAdp/6YTip5x+unFzjyOHDzRtCp1y0G6P
	4e4S4+4OYUfFk2pYTR1EsCTo4wp3h4K1ZsT0rHsg8lt+c+mfn4vo/505wc0M5L/h
	yBWc4x0MNJcOHZ9unPQLbH00NG3mNVz8j9JMDFUMZ3x4bTCose7vYuS+W62KqWS+
	OtUrHA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2v8eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 17:48:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-af5b9f0e075so3293992a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744220918; x=1744825718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMlcATzpP4SwOlSvLawCrOvBXTdzBvxy/P85lAIfsJc=;
        b=pNgx9klDQW2NDrKYuc9TshLj3fWrVtSqUSzTKZaZZzbU799In9mGG/2A8V5Y+DCGAd
         MjaqOgTu2UrW6TI3UL2/v7Z2OGaiTkQC+5SlYC4A2+3KiMDVbBwNKUhHyfKq5p1nh6cX
         4MdomfcNqNFWEpisOs7h2kYP6y174Uh2yhsgtKkaYaTj9c6SSq+isMCtWrjk344gojzJ
         gV8oN7J01Ylc16LBwRIhyIyjmG33l9TPIn1P89RMNZwIle7LzCcpT8GCbOcvPWhWbwU6
         2bn62K2L1QQkuHhpXjR+gVWowtFgZr+NYTfXpqRCx1B4ub9WW6Vjn1CE+mGMHMRd3L2H
         z4ig==
X-Forwarded-Encrypted: i=1; AJvYcCWsnqkf0+/yTip3krhuZ18o3uIU9+f1vqcbi56GAf5srkhWryIDEhwp2T3p4cMPJ0Td3XJr7gFWMI8LUig=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvoGpiLelZz7CspDye5NZsbf16pJPEP3Z4I/VttsFbsxl+hTUO
	VR0PrJejTbtPbEmW5KcWZQU7NXYpIKJ++P+Qks47jJjXULYbWPJN3+ePDyJ7pyv3lAdjhCY91AY
	S93XQqGCv+CTnzJRHK7x5YdjZXjSx3Pzjmiky0rxDAJ/b5qOWO9AP6mXLt4vQ6N0=
X-Gm-Gg: ASbGncvdE3stdFk19Oc7D3ZEkHHjyXzE9QcLmk1xybZjPxEkeJfxIRD3DKKEuQ/4bg0
	zjiucb8h1qtyMlgQEeHKsN99Oi0hqQw/FkVBrF8OPy+sXK7DUlPZLd4DfrprpLiNl0suVnt4ZUa
	fZoet6f842Y7vzrWfwD+5tLd9br+VnD9KpvJjoiCx8voJcCuUL3bHmKoLJci4WRw0lYk0t5f3Sr
	aeYKZzhSyESL1K2kp0R6saMbuQ0wHGLvYlK5u7QNl0IxadIyVYz3PWojUFsK+SCoT4QQKvf8hXd
	75exDfgkipMkl0PEsyKQ1HVW9IbL1ddFI5D5SWSJ2qhdNXXSJnj/2qTJ+pMb4JUT7BQ=
X-Received: by 2002:a17:902:d4c9:b0:223:3ef1:a30a with SMTP id d9443c01a7336-22ac2c266bfmr48940505ad.45.1744220917807;
        Wed, 09 Apr 2025 10:48:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDgSyGLh2XAMOqvFxthpf7vhlVKkk1+AeWpcHVuGhAtlSIix9yvEu88v8WHZBgkrm1aUAyCw==
X-Received: by 2002:a17:902:d4c9:b0:223:3ef1:a30a with SMTP id d9443c01a7336-22ac2c266bfmr48940235ad.45.1744220917481;
        Wed, 09 Apr 2025 10:48:37 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm14964005ad.148.2025.04.09.10.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:48:37 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Wed, 09 Apr 2025 10:48:19 -0700
Subject: [PATCH v4 08/10] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP platform
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-sm8750_usb_master-v4-8-6ec621c98be6@oss.qualcomm.com>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
In-Reply-To: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744220903; l=1288;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=DuT4nt6bKMvm4aZhmJJ4jf1bQ96Ec/cSqjFur5HUS2s=;
 b=+KntYU+os+cO+o4A696kL+VRqPIFmJ2KwIq6t0NqPlaQKbnrpjNAmXUNpAoeA9f9O/0QxgsjQ
 Znp4tGy0v4tAQzZB3gU97UoM6bEXtjBq4J+filtjGpOchw/of3PBvLw
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: NtQkV5zWG91DHkrtav-LEmZe9hqSra1L
X-Proofpoint-GUID: NtQkV5zWG91DHkrtav-LEmZe9hqSra1L
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f6b2f6 cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=zJXK8rm16J_mOy4j9woA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=758 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090116

From: Wesley Cheng <quic_wcheng@quicinc.com>

Enable USB support on SM8750 MTP variants.  The current definition will
start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 5d0decd2aa2d0e0849414534cdd504714402458e..3ad417aaaaf46ee007bc4c029fa9e57ac183c075 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -806,3 +806,27 @@ &tlmm {
 &uart7 {
 	status = "okay";
 };
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l2d_0p88>;
+	vdda12-supply = <&vreg_l3g_1p2>;
+
+	phys = <&pmih0108_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p88>;
+
+	status = "okay";
+};

-- 
2.48.1

