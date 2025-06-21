Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF8B277008
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535790; cv=none; b=NVL9Iz4aGgDG8POGvXdEdx1Ty5qLepNJt0I2SsQORl8vr9+evCfxhfAKGLotsGbpR+oujWN1lBxsnNhRm832MPFeOMLFov1h9SpiAs0ZIb/0KjaOELvxyX7fcS94AQJsl6ZLtktXEpcmzfNnDmjmVANtk4V+e2oBev/NHneca+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535790; c=relaxed/simple;
	bh=dmCipaDPJe2YVwyZOa+uBgBo5lkKZLTd546OeZ4tdeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WhGByWjm5nUXCnqC8YISEMBJKtxOOx/tosynUlNy/McWe+pYY//U2bYzp0IsVMO1YMUPnWi4P18XVgUIRVaDvw7QxvYK00bVI9DdIBT4lvhd9d9G+7YzOzZFzBaMnNb0HAECTWGW+7ZoTwYs1+tLARrlB0vMBzFBx/3vZbFB6pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VistqUMG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VistqUMG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LBLGor018181
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	js6tCKZ4RBWtZxDLFFvdhQJKiTQFitZgh6nUQc1LmVo=; b=VistqUMGctL0DUi/
	9SM72S+cbEt8Q0HxzQRo+Fnjx7Wm5/Ygw0GTZFGykTNzZ5/wgGQwydZo3snIE+Uq
	A9f4uRlHm+QtY6m7MyrCasVjCdPggOXgLUgnzb14POTissWWOVEK+DNeDQkpozju
	kqcr59DszQ1murEA7FjWbTB+eqpsVDGndTKzbgfUUcPvHT9goE/QP0xlSwW+5UAK
	+7kAHzViOM4wNl/JiCVPpD/1SHHbYIk6LQQ5fCmWWbz9S7BfmwNZtCTNdYJfdsLo
	M40dVofQ5+A3dU5pAGyOF3Ld7KyYEv6G3YKgVsQb3J4sxcE7TenbqnLGtbdFgQcq
	m8/FPw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47du0x0jrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:56:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d40d2308a4so27429285a.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 12:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750535787; x=1751140587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=js6tCKZ4RBWtZxDLFFvdhQJKiTQFitZgh6nUQc1LmVo=;
        b=A8FFIWpiGMFlQ7YzvyQkobHLtpyOhnqVwxr/PwXhtGKu55lCkEofydL8VkwLRhCKYe
         jJ7oSaNHrzFC5Pmqb4bMnXuBRzXh+iiduUDKERXIe3wKq2ZmSpjzfNV/TVWTvNsep+ZZ
         Ln23uCW56WCDBQTgpmBT9pydw2TrO6Cgv3jKdEWDPtscfXpng7MkfFcluuicJiyBA2N2
         841JrmPMHflE7Jd7ZQK+tmK5BBobLnF89rDNGYqO6CvNLl1f46a/f5oIk59/DFsqbDi1
         DEQOJBiACMHPRaCz8KTLJ76Ydxmal7aSx7w2tufCoAd1v7aatO87pzMwGpDb77GhBYnN
         t5gw==
X-Forwarded-Encrypted: i=1; AJvYcCX/EW8IdfN9LLnbyavYgWLXTJLlQdv3N7XfIUUeeyTGUblfml0wr5E/a2XH1lBCuVjWI1Z7BWUI5JyZGjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBaefJR93V9K1IS7624BoouYtwvSePA10nunUeg8jSMBxW9F1x
	ZOQCdzu6Hxn63qq2sta55JDcqOUFkZIuXDvbqIOzhk+lPIufWHGQVCig3N6nk6STJgmh91Tda8J
	hpT9qFd9JWeKzsg0kj7quZSvkIFPY0+ofzQWUFZ+hLLAyzJ4ElGjivX1BbZZoPd4Wxx4=
X-Gm-Gg: ASbGnctCxXD4Bj7IbaDUrwzppwijrrdDCQsN7GIpGYGgiwf0+l1+zK9AfG6dkUB7vju
	uF4/MZ57XwaVm0Sf0UtMJ7H/7sp9jiHB9ZbLEnYDKc7s7oYbQ6k1N51h7Ey5badFJpq5RbEn49U
	TZ/dlRHGBlgaSorVAzdFhd0DqgAq/K2mqEW7Mmm9vOCGUJI7VEEVcZSEii7U34Vb7OWQ1ShBr0l
	EGhVZvJSwsyxkxRnMhviq437kJwkT/QPi7UA67FjCdIUT3a6K1gdgVFu9CwCAtzbAu+ZgnVLgNy
	wmy5/+70QdB5+VUBhfvf17tH4XCWQeKS+UgZ0+og0Kw93FsLDVlLGoCvZiPfsFF6b9SD0mcMwcv
	8vzOJvXO5TCWuRbBGZz8GIh4CtwyycxgY4QM=
X-Received: by 2002:a05:620a:7014:b0:7c9:2383:afef with SMTP id af79cd13be357-7d3f99234b6mr1109778885a.37.1750535786996;
        Sat, 21 Jun 2025 12:56:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyl5cNRjU35xqzI1TlNWEdTw1aDtOySJKpk6eUkl28uTHs5uRyf8Muw38NgV5PbrWglll6yw==
X-Received: by 2002:a05:620a:7014:b0:7c9:2383:afef with SMTP id af79cd13be357-7d3f99234b6mr1109776985a.37.1750535786617;
        Sat, 21 Jun 2025 12:56:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c3db9sm777299e87.179.2025.06.21.12.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 12:56:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 22:56:13 +0300
Subject: [PATCH v2 4/4] arm64: dts: qcom: sdm850-lenovo-yoga-c630: fix RTC
 offset info
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-more-qseecom-v2-4-6e8f635640c5@oss.qualcomm.com>
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
In-Reply-To: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1567;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dmCipaDPJe2YVwyZOa+uBgBo5lkKZLTd546OeZ4tdeA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0Y4X6L4n8r96z7ncK96s/S2o+JX2Su7RdXap/8SNrm6I
 7vU3nhNJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm8vQj+2+WLROOr3q2V2C1
 c9vWUuH+zGeX93eazvKp9fxWUWJ2YQbvXRd2hqVXPRP+fRLu8QoM/7Iono2ZpSI6QiemoijnNp/
 Ak/jSss13cx+vmrQ3Lk37kEfY4oxtzbzJM9nE7M2fnhUpuWTH95Eh6Uosg3pw7b6bSxv+vRZg8l
 Vfu3XW3n1VT7eb69rvzLri9OejxBOGwIC+CJatjGfCpI+U7gY6ff3dzVkLL0uy2erryN6PljdzX
 uf4v4VxW/btjS1nRfgU2aOsb0ueShQUW3yjps7VbMYNtYAJVjLmDy3ZOlwUV95mfblc3HX2bM2g
 K2v8P73xihNZ9GWXoLTtct63ntXzGXx+1G3mnuYgkTARAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 2bPL1EOIRfgLijkFC9ZuyDTiyoiRM_zc
X-Authority-Analysis: v=2.4 cv=fYqty1QF c=1 sm=1 tr=0 ts=68570e6b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=lpcYNmPcDvg0ODyLRbEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDEyNiBTYWx0ZWRfX99Rjyuxmz+5i
 k73NT8lY5DlPQN3rDCovxYeFw6PfA1JA1m6ECMFUBWsqsW+H+TCqH+p0iR6nFmRs1Wia6Jo+/bD
 5NJsjpSBSj03e/R2GIRoW5KTrfyTqljf9uNu9fO+fJ5ymBZfuyH+Inw3xKjueCa5znuNzA74l1S
 ud6PcvdTa23KpIdWUEKilpfTZbpeclYCeJRLqU+deXpJmtMcoHqWt+hv8btrbVe3vYTnjmqed/j
 az5n0jeLwaWoXugRjV5XLGphyLrM5swcWUOxVyYJ0qU05A5GaFrUW39SOgS+vq3KS09ZHSVJvtx
 IqKaX9BO10BYjkwSfj76fKCiE5vGihLnVzFMAyy3MQ2yGHSTDhBNrNOb5LGMvkO47TgVNFKA+gT
 xBu1GbUtnjgAR4OCwgLbFOnSg4YxLdyJBJUAflSvTmqYZn2Ng4DgyzLKfV4etrydLFG8TuTy
X-Proofpoint-ORIG-GUID: 2bPL1EOIRfgLijkFC9ZuyDTiyoiRM_zc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=949 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506210126

Lenovo Yoga C630 as most of the other WoA devices stores RTC offset in
the UEFI variable. Add corresponding property to the RTC device in order
to make RTC driver wait for UEFI variables to become available and then
read offset value from the corresponding variable.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8998.dtsi                 | 2 +-
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
index 3ecb330590e59a6640f833a0bf4d2c62f40de17d..50b41942b06cf1a3f43f9c754b3bf2e1eaa4d353 100644
--- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
@@ -101,7 +101,7 @@ pm8998_adc_tm: adc-tm@3400 {
 			status = "disabled";
 		};
 
-		rtc@6000 {
+		pm8998_rtc: rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>, <0x6100>;
 			reg-names = "rtc", "alarm";
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 8ef6db3be6e3dffe4ec819288193a183b32db8e8..c0c007ce8682cacd1cbfe816ddb975c0a099ac89 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -592,6 +592,10 @@ sw_edp_1p2_en: pm8998-gpio9-state {
 	};
 };
 
+&pm8998_rtc {
+	qcom,uefi-rtc-info;
+};
+
 &qup_i2c10_default {
 	drive-strength = <2>;
 	bias-disable;

-- 
2.39.5

