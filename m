Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02AF2F94B0
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269019; cv=none; b=IHH8uX0vvswSIo2QkZ7cKpl5+yHRFlWlNwVY+/Y0ta5HlU8LEDVsiuABzY0ydVgZggbO1geHM2XijxN/Y+ngy4nw0Mk9+/kfPydnYCfFLLcZcP6FXinTQcdtA8IoF7dNxjbKWsdlqqlh86SClNn1dHctR4O//gLkD8Ifqbhqlqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269019; c=relaxed/simple;
	bh=tpBKnIAuCP3hHpY88s21IGk6s0xzFRbXOi1xBoSjdpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cJwp3lXz5zpb9OMw5J/vvzWqqzSZHGhPqpokchWjjO713f4GfW98gSaPci47olJcPFENakJul05m2jZy6v1WA8M8Q4jeFH+tvf3o1xED8nYT3CuO/UgG8EOOQZ91iS5y/9M21r56/ZKXe7BgzflM2yFpKaYIkRhAtQeEA2CKmVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hW/ured8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hW/ured8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IAnVoD016813
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MRtl5KObeetKj8XsueZwlT4HvnbbdDcQprlvAt4ypkc=; b=hW/ured8BPMN1U0k
	o7Bt1HVFzPsMA/0Q+4JZ2bNM4lXxmAOy7Y4/dlSdYKVMHIcJEDmmDWchNWxwOooq
	s5/AR8mwpNQ77FydMr5kYgVHMvEmNImIDv7G9UTWGKeehOjdv3MwnKr4+ZiueSLv
	lFAYWddrvuSISNWr53+iQNb1ba4ZQIUFzpU+/F0Qw6SGnp/lAyMQ8f98itplIv24
	ma0iHaw+iXYlb1L/DMRz2LaE11UCvmkAwhANPH4d8YCNqYhQZAtgD5kBKsBON2nB
	hF4bsqVLFHFc+oku9+xgz5WYJwlJPCiRVoKD/1H4l6O98qrCUGolg7nCYBXz2jGc
	u1EwNg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfn7ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:50:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3d3f64739so865478085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268999; x=1750873799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRtl5KObeetKj8XsueZwlT4HvnbbdDcQprlvAt4ypkc=;
        b=Hsbw0GkyhlYI6ag2fqfhutaD5XY8L4TJZqQ2pW9YMIJ4P9udFoxoEgN7DGG/AEZS97
         8+p8XftprK86+bwS+9TnnWVr6IdpAgxTkPNBdY7EmWY1WllTOtmJjoalAaCevQcIVIhB
         AtOdSGoPDDddnmyWJk1gf2gJxwr+4mA09H6dw/WaC0IpVw70LF6zYmKAuOze0VTqYQoG
         cEWcM+qx+zphsewXR+D+qaWl7532Yw+26ua8KBQDpBkZ3O0BYvwkesSEL4KxyhdXDQta
         GGXXctlfH8OTjMkg8/oZl1ppr+u7t5LcBw9S0I7PpxfXMpEpZueb4U6ftIAtD4S56t4a
         nSbg==
X-Forwarded-Encrypted: i=1; AJvYcCXgbC0gPOEpKFSA0nA0ERy6OrH2gMFZ9hZaiv7mH1vut2W52CybHRrb/gyQ+/vSBsOcxAvyd384TuFAf4s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy26XjgbiUGGt6VWeA5EKvNSEvSvZ7K8Xc0T+TFnVrU+AuokoRt
	AWykV6o0uEos+1/6l5TO1daoKblQSCG7s0D+5Uy6brBIUB51H8BsjdYZN8k63VU4Lo8CLiW1nPj
	23LNLXNv8W/lrFD2Sn65VLt/XQer6d4kz8M51MSKS2h/cl4TFGUYn8qYMK7t3EV3yz2s=
X-Gm-Gg: ASbGncvBZnDGTfzwd2NfK13PWYOg5eXzBmf7rsiXCEVkkfSVSxHS32PjL1jJOt/2JwK
	EdZAwunc7noNtuIY4T5igfbVb423lJldEUaGueFD7CvFf1IneJfL94OToIF4hq4DN5RlL/lSkU1
	mtqtisM4HkNXfX82E+O/T8OraJ/MfckucOWCT+djZXrm2/OJRyHLpV1fvcnmRoYae6VmehtOnN0
	BYOWbtkZrIPDhrre4GVDEmNuL0ldeLwgvD0/pveELxjjihJNIX6XJjnliQrStYCt5j9DZh5f0Qs
	n/PU9Kvb8hBvVvL3FYw+ditkdBLQYdogJP1BxEIkkFo0ob/hfb9ClAbAobbw4+eneVy3hMTl058
	3rmuFCJ8IXA+aKD7FfSjfVJJe8SHAgRZB4IE=
X-Received: by 2002:a05:620a:318c:b0:7cd:31ca:d76 with SMTP id af79cd13be357-7d3c6cd9c7fmr2475201485a.33.1750268999037;
        Wed, 18 Jun 2025 10:49:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3z8OAvTpTGWACRNkJcs/dFQGqJGMmD6eV6BI5+VFC1nQtz2t9LiZEWhZ47C60omEChiyMrQ==
X-Received: by 2002:a05:620a:318c:b0:7cd:31ca:d76 with SMTP id af79cd13be357-7d3c6cd9c7fmr2475197485a.33.1750268998586;
        Wed, 18 Jun 2025 10:49:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b7b43a98esm2911131fa.65.2025.06.18.10.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:49:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 20:49:53 +0300
Subject: [PATCH 3/3] arm64: dts: qcom: sar2130p: use defines for DSI PHY
 clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-sar2130p-fix-mdss-v1-3-78c2fb9e9fba@oss.qualcomm.com>
References: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
In-Reply-To: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2199;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tpBKnIAuCP3hHpY88s21IGk6s0xzFRbXOi1xBoSjdpk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoUvxAb1xg1MLy4xeqhbG8IzCQeBAQUS94HvioB
 lMpZuNCkHaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFL8QAAKCRCLPIo+Aiko
 1fiICACHTS3u8xNy6tTR4ll9c5Ltiexdon9rwTZjFzyy/1j8Z9OG+JYf3WQ3x8nFbFvdbLaqTCQ
 gDgCACHVz71SqAdyr7ZLdbRZkw1uoHZ6gpaeDtbFdz2PgyZkj4VohgEWB4AHTIYHTDkS06grl7p
 7vqthgqZZQgj7ETswoQGrFXZ3TCdlpP0oZWPzkGGFNljbELoBnPZiIDjUxAt7nN//GyWpyyN5M2
 Jq7Tegj5RENRN12xeu2EhEYTFwxSFfHeuS6qPdDUZxCt6+NqM7rhV9xFoQlQLZDHttf+2uMz/b0
 iCfhXycf+xREWSEuPp1e4ocVUbcn1XqOq31QZb57041IIR3k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE1MiBTYWx0ZWRfX4Y5SC7MI1oKq
 KubbCqC95hmREPzp/qu+MIavPzVhwDjrBY/tvmLoDz98ZKVOMcVLOntCpBqKFUpp7RH6g+8gxA3
 QJyaPr/myt44zxXGER8gLr3UyESto2EeIIWj2U78aY/mIdF9Iu3snIqS3lxkFl9qvVIWyz1vyck
 eEAh+6mYj+xSsdrywmVypXdLaLFOm401Dnzh8l3Oujnllv7DseZJr/tehkt5hZhU1uLYqx1yYFm
 fLasuaD2LCYorRbAKC0KbMN0VHfWXbaRAuKBRxOf6otI9TVc49J6qYXi5JCwk2K8fuIQvcK5DpK
 OG2mPSvytMA6tnIeqtGfXoSB10yZuU7b/z2G8FT6HwcPj558AsWYW5GpMdqxNoNl23LE/yG0QQM
 rhDK5MEIj22r68QIxpalth+8XRW/XQN5f0BYH5P4PfQJO5l3BJifiR7uf69HdI2g7AUNolfe
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=6852fc58 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=sW9EZDGZIsf-NLb0FcQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4x9IYCZS3zb2YY1HCKr-tsxiSeCj-HMT
X-Proofpoint-ORIG-GUID: 4x9IYCZS3zb2YY1HCKr-tsxiSeCj-HMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=756
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180152

Use defined IDs to reference DSI PHY clocks instead of using raw
numbers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index d9948360cc0198a768598f60302097e1143cf1fc..38f7869616ff01ece3799ced15c39375d629e364 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2024, Linaro Limited
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sar2130p-gcc.h>
 #include <dt-bindings/clock/qcom,sar2130p-gpucc.h>
@@ -2237,8 +2238,8 @@ mdss_dsi0: dsi@ae94000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&mdss_dsi_opp_table>;
 
@@ -2333,8 +2334,8 @@ mdss_dsi1: dsi@ae96000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>,
-							 <&mdss_dsi1_phy 1>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&mdss_dsi_opp_table>;
 
@@ -2392,10 +2393,10 @@ dispcc: clock-controller@af00000 {
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&gcc GCC_DISP_AHB_CLK>,
 				 <&sleep_clk>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi1_phy 0>,
-				 <&mdss_dsi1_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
 				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
 				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 				 <0>, /* dp1 */

-- 
2.39.5

