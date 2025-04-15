Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E16428F52A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712813; cv=none; b=juJZ7Z6rFOdaG+8U48PPppjOqv3ncHlPGzvrZFBfViiYkNqw4sVt7kvAaSuwOfZcmALtrNXm5L5A8B3OSI+Zy7zsxzIfu4OI2O9YzC9pBG/WctFzw3aDh2zOUsDdqMt5ym8hzLM6dkF/RBww3ktM6X8d3rI9yaJe3k1KWAXP/Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712813; c=relaxed/simple;
	bh=m5iCFVyVqfnwHdtvSJfoafx6xtG1zH7P84KluaY3Cpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZl/PDfDdwsokwNFH9I0Ttn8yJMl+VLZkaMFvSAYnjdty6ZVezCu0lzVtczDphW3F/cLKATfSBD3dTUA7wxZIe+qePxSiXYrW8X1gEq6eiyD6TOwbwwElwpvdEgarNQGDfq8zTcN0ITciR1Gq9qQUT6/rrbMjHhmng2zVuzkgzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5VKr/pE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5VKr/pE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tGx2013127
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dCvhu/9W0Gi6UnFFngAKGj3mECQvGYTjgnbXd9mZ39o=; b=j5VKr/pEi2+Rx26u
	bFeGMYMUR6OSAZV+gVNWFrb9VHQxTEheR6d1XADmVxgFUHDnse1SUtS9ppt8ljT4
	2018XKpkx7EMZmy7uBbhjVI7TGdNh3mgEHNyrelp/wKDQ5Cw8wbfp67rVGzSywCK
	4yNSPC9KnHbQ/fllqdR9tVuWF5EvJJqyJJF/b9F1Ob24T/jjoMJ8DpKJyKHpBCc3
	Qe1VV98/WQL5PPKvQ1Dcwv/feD5cF7BogeHl+7NN3exeA8IHXjoQ8igSZhj/x5FW
	zjp92U7RwsqrzWeWWjsDSSf4X2nKmdvicqUpeWz7ewQ2IDW33GNZn92bmEQN/9eb
	dvEIbw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6fngw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:26:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c572339444so720111285a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712810; x=1745317610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCvhu/9W0Gi6UnFFngAKGj3mECQvGYTjgnbXd9mZ39o=;
        b=TqblzspqxaOTOvRrK3XcEB+P5kmpTgTNvdieZ0RLnxsQUTOHXtpIH9+xir6fAY0rz3
         aGPRBJ4QTeCTkUu0IoZzyizqgVLNGuuEsH2rLUqjh6oU2n7TTFZFEn8x3IsN2NqZJqW+
         BodGbJ3aVS/2lvaG0DILVWDK+ETB8q2lha2usZ1VQrqSbl2nBoEK22Q4uCLUGP5Didpp
         GOcfkJdVNoCo+lJGw+nOccLaoyFmbAn4sAvkO6yp6ycNaLg2xUtR0Fz5pWf20QQY/+TS
         JNzMl2ogrLUds6bHiNqGRujBlfue8qQUsb05kb2BlsFGGwFpGxEg8tpJ1s//bK7qN48v
         cfNA==
X-Forwarded-Encrypted: i=1; AJvYcCVcs5ZtNebWWybqpuLhrcTiuUziZlOSAR7ftSyQuKttBUNof2kvUWLj/+XbE3RIKX/s/9Ga60Z7hovZVpY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8wnWdezJo7pLkAkXekIXMUgJJkilCOVuCuuNtuyRUzLSdl7Ch
	T6xBj1HQWblTz7FPsMhPBJCCvCwCvg89FqGVoe20ujmTvXNdOaNCsq+JHVg5mozeJASmDPHYjcY
	ngDFiTxuIvMsNwunF/sp3R0mgCbJIrekDLjtJYbZEDHF7eWBxbSVx176Pwo55Eo0=
X-Gm-Gg: ASbGncv4M4QNcojWXkLzCMo8MbZtz6LVKd+cny/AynISKYAHxhbUH6x4Rot8bsV2BWU
	Tt3gY9Jb3cX9xfwSjIJDVGgQUfgEYTquRU6hJf2r6/BvTHIZ5i2jkUNq8PUOtoiOli6VKGinRHP
	kdL1C5w4aEDohFMRF2LFmzH/n52Ab9naU3q5bc65sH0NLvPoY5ztnbdVtPDYwbMgS72iNNKpRKa
	UjxbjWAFCdoGp2kGxH3+kpwnn5slumVrRsozbCFyw45Xk4JGIpBhHWrc69zdFrLtRZhqiy6BtUo
	Tj1uKxtDmUaP0EQg0HAGF+3AaQGta5ZVZ8S0q9FPL7e+jGdOvKHgcxmX7L/wD6Z5XPj2E5ZYYVI
	9OCp45MZcxCuB8MO2Qcl//0kN
X-Received: by 2002:a05:620a:3944:b0:7c7:a4b8:5753 with SMTP id af79cd13be357-7c7af0e0f9dmr2546568885a.30.1744712810463;
        Tue, 15 Apr 2025 03:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+lScsqhqNcM5wMaa6Nng1ZFIiyrvNhp2kn2vLSMOYK7W3q5wesY2Xv4GMV7/4RXSn9h6AFQ==
X-Received: by 2002:a05:620a:3944:b0:7c7:a4b8:5753 with SMTP id af79cd13be357-7c7af0e0f9dmr2546566485a.30.1744712810094;
        Tue, 15 Apr 2025 03:26:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:26:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:04 +0300
Subject: [PATCH 06/20] arm64: dts: qcom: sc7180: use correct size for VBIF
 regions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-6-90cd91bdd138@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=983;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=m5iCFVyVqfnwHdtvSJfoafx6xtG1zH7P84KluaY3Cpg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRb7mHC0zMnNPPzjGqiVl3oxAGYFScf1bxn2
 ato23Ov9LWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40WwAKCRCLPIo+Aiko
 1bcPCAClGWCTHco2b9swj2qx6PfYtiJpI6lxng9qrRDeFeLMmh29od55mP1dNdeGjJ4ypSBU+Yr
 udDeEv8+P3WgWWPk5/YrFab/1al2NBU3bHd5fOJa1Bq7LSNGYaY3xpjr7kcbAFGjEHsoplkPEis
 U04mfi9XoP//WhtY0bAXywttqyKakVD0TKVDuKyYNRcxBuDi0447fkrj40G24K08qRkI/dAO61p
 9uNRIP7YbraXyjo+r5Uc+e4dBuxBKswLSW0NfnSlkWLyLxBw/G+jbfXcpy06mVpGeBaWrve+Y6M
 1MkH+uz6M4NSjeXy9CJTDoaj1NJl7UlsJtny4QH6mbhPmfjP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: TJvvYgZIuJEZUuoLxqNh4vzOUDvAqqbg
X-Proofpoint-GUID: TJvvYgZIuJEZUuoLxqNh4vzOUDvAqqbg
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe346b cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=e59Rtz-e4fPQ83KgERQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=807 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Use allocated region size for VBIF regions as defined by the docs
(0x3000) instead of just using the last register address.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d157863dbc4a18b6861060579a148632f8ae9e3a..bb1880a9458b8c570e3fda35d3c289a9a4ce29e3 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3196,7 +3196,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			mdp: display-controller@ae01000 {
 				compatible = "qcom,sc7180-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
-				      <0 0x0aeb0000 0 0x2008>;
+				      <0 0x0aeb0000 0 0x3000>;
 				reg-names = "mdp", "vbif";
 
 				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,

-- 
2.39.5

