Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D779296D28
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712833; cv=none; b=cB0m+DUcAHdM/uShdWooSL9CXCU1BRcyErKI6UoeTdj4eK6ubD5nOmBXtls8lHsG+IpZEwk0ymcovgGjqo9qZqBhzBXVl49BgWuvZ7oHYBih0V9tl0OBopYgE5kmmq9R3giiJ89QOyCF860gEKv2IQuM8YMqpiqnReLMdJGvBoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712833; c=relaxed/simple;
	bh=GoFUeq3COsFNKS6OZDiucgVWyGEnlIN8tta/plmxfTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IRTImgAouSUsyUxRTiPVvfyzFfx7XlEoal85lJpUCr/fNA/W6zYEzNm+AMV9gGSii0FFUQsNgDfEZAeFMyj4hvuybEj+v4EgBjR9a+3pesnsw7Jg8XhZkv45gPyCgGbO85h3xfTXn17LgoldPSAirPt5xgAnamBBLu5iUI+J9i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iC3x76pm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iC3x76pm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tI8w013149
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tu4V+rq9yYbPwBlX6V2/e+yD95f4QCasWVj8G2YPuQQ=; b=iC3x76pmYZyECpPt
	sGaVS1b+VB9zGXyntgaqb4jJ2ENl73Kr7pbrxhj0IzOkIfgPPm2NwXG1EFj6rZLP
	RofYwqlvI5FWCIiN2ojQkBmfFH6YchORBow9xS2PeuB2gfnVFB5ZUB01NlJodsya
	6yo1sRIJOIJOa7bPfwgYfc6OimPE8ZqRZPexczIJ1wfjaBiD1TGyw4r7izlwIJlx
	eDN0IzVzINTd60zI3AKPSY2g4KXjuj+mhPFEatfCoF/QLsqcSIFiZmH+yXR97XTI
	FYT2cj3fiuvBSz4SF2RkZHSyVviWmdVLgcdyXdzsdZ9ffwqzk3JYCR1TxZ6u1yl/
	zHU/5Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6fnjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:27:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c3c5e92d41so829521985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712827; x=1745317627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tu4V+rq9yYbPwBlX6V2/e+yD95f4QCasWVj8G2YPuQQ=;
        b=aBIdDuyFbykS6ifDTG+mGlLe0ls0i1C3zqzv9nIFNM0T/afO8N/mKZUPpL+oRCKL0Z
         zlvMLLXkeutZSZ11CfRGNYku14NRaXIe/enrbQWxZ84n76g4q8TEu68BBh/N2mew9QA/
         1IuMhfNKlu8Gbogh8jZjJTRnDF/gAoSIwFR0S0heXbr7pUpNZ6+hoRYhSFF7V6PWmz7J
         qA0ZscN/W9y7k+dKJNDXwsPYPD6wsStvfw0QXMpuP60EdlfWYSdAWvTBUEiCabF1ZMja
         33TJfKc4VXWHoVs8rNQ7RP5gFJGrVZAh6kuT6o9smnFvVc5V+hwNDfhmi7bqMpC83R8n
         /i6A==
X-Forwarded-Encrypted: i=1; AJvYcCXGjHIGD8FIi5DW/XKvogEc/KiVZd144lnypfPvklOs60fCVBpMfIfJbbM87wG7Phyrsmyr6ar+JcCzIR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpj6GCa8wF02/2nsQ4Cxjnn/S/45+8k159jSKTYqUUTrSkOZIl
	koEI9gxYwDlXhw2UcCj4+UGxZmev8zHDAndq4LPtq++Sa/PJ/5I6bliKoi/eOh9kSJuYg7mwJMp
	mynr9tLm2GxoenUbGfegzRI4n9xcBqKFQwvH36gZZdHMsyCql4lDKYhx6Ys0qINk=
X-Gm-Gg: ASbGncs+VcSlmlcsk79wZo8pjWKAmW38GEnal8ppbpA5E6unFCQXiEGHqj4XV5TTeT7
	BpqtobWMzYnurJo0OVq+9+nOSnN+bU0xTZAnw2RGiFiKr1ajnUs03Y+Tp5lY07RRAHghDUx7U/5
	bvai9J0OeVNwAoK/83OuTxeft5TGn5CpSyo3B7FP0trmgDh0117xwvXyjZGM3QZ/0dbXMzjvdJe
	swBB+0JqFNBDC2AahsHqg8LN5P1eQFVgoC3GQAUdiqjjZKX323f9g9aRWwPfXARxXtJPQgaNWCF
	vamTZEV2go0wMIZzZkrqOkRo64cUQZSHivUk6h0T+mk4zgh5eb44iHRVGNmgCBmhd7nM8x/xLuB
	r7pTntu8YxKJqlT9CDp4/0d0Z
X-Received: by 2002:a05:620a:1927:b0:7c3:c9f9:3936 with SMTP id af79cd13be357-7c7af12e791mr2162534385a.20.1744712827215;
        Tue, 15 Apr 2025 03:27:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW8i5OgddqzjSA0XCCfh7pwqkGUWa4o3uq5UbvA8uyU2TWRnI0Y1uQ+mOQo0BUIDEIhqOysQ==
X-Received: by 2002:a05:620a:1927:b0:7c3:c9f9:3936 with SMTP id af79cd13be357-7c7af12e791mr2162531585a.20.1744712826837;
        Tue, 15 Apr 2025 03:27:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:27:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:13 +0300
Subject: [PATCH 15/20] arm64: dts: qcom: sm8150: use correct size for VBIF
 regions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-15-90cd91bdd138@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GoFUeq3COsFNKS6OZDiucgVWyGEnlIN8tta/plmxfTI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jReZENti0SzjjUY30bgG6lObdkqRg+6bavCK
 WOiCsgAitqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40XgAKCRCLPIo+Aiko
 1d6CCACcC8kLM10JAivKgO6GQAmHxtdwm8Y5ot8hR5xeihMSQz4AlKIGDHIo/FS0dCEYHOo+ABJ
 MVf2Iiq85bvDqJ1LydBRUs6CLH+tKOZhDrhJ2zpwp+vGygHmhsRANc1dG0HtXRcJb6aOxjBfyCd
 Vl303YyTPgja/vewVw30nN/esh0fqEUt04yYFnM1664scNsJ8npat/iNwaKPJGGjdP2Y2RO4IL5
 MyxXXTecB+f1i3d2hzk0+syPidhBk59rpMZ1xgvX7ljjNlub4Mf0hG+/u2MQrwbd34Lyo+LL5Tv
 c6wCGDzqaVvk8heUs98DzKMIrWPFxmlhnbIAz4FDKj0cn+ro
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 8iuXvjnuDWFafcBWAJxLVT4ZuOp9rggu
X-Proofpoint-GUID: 8iuXvjnuDWFafcBWAJxLVT4ZuOp9rggu
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe347e cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=wOYvf8k4mV6aZP9KKLAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=750 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Use allocated region size for VBIF regions as defined by the docs
(0x3000) instead of just using the last register address.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 2aca3fdae47ceef9b3030613ec2b8f3a6c1a3356..e364cd07193ae7fd3057a49987a6f2aecfd7b5be 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3809,7 +3809,7 @@ mdss: display-subsystem@ae00000 {
 			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sm8150-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
-				      <0 0x0aeb0000 0 0x2008>;
+				      <0 0x0aeb0000 0 0x3000>;
 				reg-names = "mdp", "vbif";
 
 				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,

-- 
2.39.5

