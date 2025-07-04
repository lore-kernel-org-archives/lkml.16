Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DF12E5B07
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646726; cv=none; b=Hfz8DMLejdYa2muOUCf0s5YV1AQBGPCUPa5OA2luRXe6oW1733JOcA1bQwcuOunFiupfZTdS3AVwm3Chchj+WMEZxWgElj0Gukugb5cTRO5ZnP+On95DImuhRwKJ9SFL9dGBBY8N8v0sbBo6psmyiy+nDKNndeHGPq59Mup/Y+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646726; c=relaxed/simple;
	bh=bAtnGsyPKQGjRv4wCht+S1dUXqoLPaKb8f4OFVueSmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUjM4FRoFCeC+kpHME7Fr6apB6trCV0HjFNZhoSsoyziPp+QeVDz1fs8P4gfECzjJRv+9GI8gcMiGTv9yVnABkiakbTcrKz2/zeC3S4AcYh+orbGXg0PFKhTh2CvpMlJd1oX+sMHnMGBKHa9XIrvmRniTflIyb/ndVa89+mM82s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IPh/6TZM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IPh/6TZM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564CknHD028616
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 16:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCy3Mp26PN6RlYzqrLIVdWeBnpFYaVfs3jyvVwWycsk=; b=IPh/6TZM16S2tTdI
	hKVUt/DOxChP6B14zsxSMVAh+AMKmHC5Pfkq6nakLVpDdywDvWDJRVCrSJ2zsXFc
	gWjhvfRaGhs24QQx2Ay60I/2/pavVTerIVMbZPoEjq4bh0EPlhXduPsOyczGKqBX
	MU3zKZGN25OVffTKxZZZaH8+5goPbS06anXVBF7rt9+HaX8iOI5yDp8xj+2x+uwS
	7NPAhav4yAakW7+TkmaHAVCdT41n/AxHHLJVeDwqegn/lXA7EQO0/wU3r4gV/fQZ
	M4yt+MMfS8ZV3b+WUX2Af2hAWlA8ovuhfmuwbQ4MphpLz8byEFi79gTA/72D18WO
	F/GBaA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw4p17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 16:32:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d460764849so365632385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646723; x=1752251523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCy3Mp26PN6RlYzqrLIVdWeBnpFYaVfs3jyvVwWycsk=;
        b=H4R8z6DcygSrHCpSZruSInM+hsRV9IH7tFRh/KablNT4zopzdi9+6YfcgOc66aMWcu
         t4XM+nPCnxCRS2dxdMjO55nNVZVuhfdWT06xL0Ha591GBcZsEW8MQwrFhJ1JP9jsCx6q
         RXspKdAZr8vnbKlUFpltwgBct5waqp/AShrZgaRoZXQmjzecJcVfCG2s2C31Ha6lWrx7
         pqj8WAwI7kDtjLecoTnzjLfA17CGMKCGBnh3YDgyiAz1FyGUnm1VBYuLa8+PIfCCfBRo
         6Zf5Ttbgpw0ua06uAdgHIijI6LNFOJ1hsgdvd0uMLsSp2qHC+iu2MKBfdCt921YhzaSs
         +veg==
X-Forwarded-Encrypted: i=1; AJvYcCXjMqZZskmPZeHkq1y8vCXaIn6rrOATGewgzkYO9DGZfcRh33ggX9bxkmm8fhOVMmPAFLg5p81EthC5jqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcSUB7QtTm09o/NyRyoQSw56mB9/Q5IQgWb4dHW4bms+QUcNP5
	QMrkMQzZHMKMOEvX2SaeirFm7qguv3Ee1lCuNtb6oVHHWcAWn1DtnFuSg/Pid4oBdi7xu1DUgjW
	+P4AfDS2NKfRHXCilj5PeeARkDV2ekZ1Mcpoxt4BAPyzfxyo1ncJBFVXHy8IukzPfIEA=
X-Gm-Gg: ASbGncuLhG665fNR42yrZw9NS0+/TveO+wzRixMU9EiobixCez31kCOYcaLcyKsBgKi
	fS9m6raYQBPh5n0ztnpinF4ciox9M6OUHz1AMIv7Rkx2IoBVJasmqDkg9VID0fkchFx5dNaIGLZ
	+u6VcTSGdYFN5N+6iHyGcY1ILYSpig7qSLDEwC9hRI5waRUp/Xj3yV1CP3qal2ksMDXmc6wC67J
	sc1g1qo5L9vqysXoKe2cRWrEYjJr6eaw+rHrv7hfeXMTciISENarmuMcnypc+97n59xzHwXnjDB
	a5PRInH1D0IKXWqdNjqMD8r5Nux2W4NoTgrfEWHK16LvZYRXKXBX2l71eJJftzKHQqpKw59cSBd
	3eXE98xnZ0QB24OY5YsX7X4YrVALrtiy9Km0=
X-Received: by 2002:a05:620a:1724:b0:7d4:3cf6:15f3 with SMTP id af79cd13be357-7d5dc6e3826mr542682285a.25.1751646722721;
        Fri, 04 Jul 2025 09:32:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFjNhcyPXleZqxKkeBOedoEcBl5IqQ/zhQ/LmNX+iWVLvPoc6U8bH4uDJapqPQZMpf7V7c1A==
X-Received: by 2002:a05:620a:1724:b0:7d4:3cf6:15f3 with SMTP id af79cd13be357-7d5dc6e3826mr542676885a.25.1751646722210;
        Fri, 04 Jul 2025 09:32:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1af83102sm2813571fa.6.2025.07.04.09.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:32:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 19:31:56 +0300
Subject: [PATCH 4/4] arm64: dts: qcom: sc8180x: modernize MDSS device
 definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-mdss-schema-v1-4-e978e4e73e14@oss.qualcomm.com>
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
In-Reply-To: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bAtnGsyPKQGjRv4wCht+S1dUXqoLPaKb8f4OFVueSmM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaAH7eTzqlMVB/DjRgzBiEBYxLi08uNbOA1F97
 Vd0EtyyMZSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGgB+wAKCRCLPIo+Aiko
 1VkeCACEjcvsCOWvGzeerp5hPYD0fEONkveo55tJrQSZd19YanefgWVCovErRNlJ8+mMbndcfTi
 Gx9CSFn9ge59UYKObBArjFltpzQWnYQ+pJCm722MMoiEBssFUk6XozGFU233IQRNBN4SwnN1B7R
 gZgDvNjD3FMNb9mbXEmYJGe8qyPujcYlzyMT6p79fD4vs1d4vLln1hrDilvDr4HLjJ2Ilugb/wS
 9jg7eBzC3wyaQIwRnQHQSuOVh+YR68OVTRZbWse1SQz+VmDkj+rAXtrqgaRezVSiAqDvFrEjgGm
 ps2vw8RJsWNTJTVQG46WluyhtvQegOpPR2Y2x7u2Ylsaki21
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: UlJHHQvUtEjNPlcUxE3gaLWMy207l6AB
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68680204 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=WUOsL33OVTVxArewYC0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: UlJHHQvUtEjNPlcUxE3gaLWMy207l6AB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNSBTYWx0ZWRfX4MWTqHz4lPpv
 FJIHX2AfyEwDCHuAYXbZ5yOBcxm4WlPGIc1lbsaOUC0MJx6P4+gnzXM8XQACkjOCrp2oCJLw9Y8
 cCtLn8NvY94zJX23AuWGalRwE0nk04ooqh3QoG+vLhh0hvK7BZC9+4yD9ZFiPtvZaVUkk0fVyB7
 p/R16/B36s2L4DOS39ScYPO2ovlP5JUJBARCXDrTbL9lEmPYKAdVzs+4sWq0rnkFFtiyIIf+M9B
 hUk3iD8VyC+eAWOtH9stuUfiLyToqjqXHhlVuZdtaaoOUOOJjTa/qjeDWhQSv295LKUaNbGeidU
 gtCOPzctvFzAEYDJoCCFjPnmoA13JMvX1Fsk8fFgyjDK37HvfLvSytqWPjWRrTZ00lXEgvTavb0
 aMMi7WIfJm/xNByIbTKRGYOLba+C92Sn4Us4893Z3Xf885Fnm0uwkchtcFkMWmv/2efg+Gvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=933 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040125

Follow the lead of other platforms and update DT description of the MDSS
device:

- Use generic node names (dislpay-subsystem, display-controller, phy)
  instead of the platform-specific ones (mdss, mdp, dsi-phy)
- Add platform-specific compatible string to DSI controllers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index b74ce3175d209b569e634073662307964158b340..14775b8dc682221ada3d30773be66edb46138662 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2956,7 +2956,7 @@ camcc: clock-controller@ad00000 {
 			#power-domain-cells = <1>;
 		};
 
-		mdss: mdss@ae00000 {
+		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sc8180x-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
@@ -2996,7 +2996,7 @@ &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
 
 			status = "disabled";
 
-			mdss_mdp: mdp@ae01000 {
+			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sc8180x-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
 				      <0 0x0aeb0000 0 0x3000>;
@@ -3090,7 +3090,8 @@ opp-460000000 {
 			};
 
 			mdss_dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc8180x-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -3156,7 +3157,7 @@ opp-358000000 {
 				};
 			};
 
-			mdss_dsi0_phy: dsi-phy@ae94400 {
+			mdss_dsi0_phy: phy@ae94400 {
 				compatible = "qcom,dsi-phy-7nm";
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
@@ -3176,7 +3177,8 @@ mdss_dsi0_phy: dsi-phy@ae94400 {
 			};
 
 			mdss_dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc8180x-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -3223,7 +3225,7 @@ mdss_dsi1_out: endpoint {
 				};
 			};
 
-			mdss_dsi1_phy: dsi-phy@ae96400 {
+			mdss_dsi1_phy: phy@ae96400 {
 				compatible = "qcom,dsi-phy-7nm";
 				reg = <0 0x0ae96400 0 0x200>,
 				      <0 0x0ae96600 0 0x280>,

-- 
2.39.5

