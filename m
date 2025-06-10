Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC22329AAF7
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563139; cv=none; b=OHLzHrU/fvVSxoQD9Kc4LcLdxTptNMslEZPQplRshfgMrdlXZfLEqFmIW8AtzNVp6UPpvRUDzPva1nshTSOoWmajjB2bvuLWjTaoJs8FZDyMWsuBwzeAVQNobnoYVuH1uYWDddR+++zD1WddIdJIq/AcK432P3bwA+f8uFbakkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563139; c=relaxed/simple;
	bh=lRTdGZr0aQBOohKHQi0z+qkIwN8mJlJ286epa15TUb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sIF5NWfFqON0CsWYIliWwzlKJyLEApbMjATO+FfLQLXuXpQNA/vFtlkYusegv3Vyyvv1aw0EYCjr7dedKYdeYzPvjudgyoyowJHHh4QJJUmqga5CqGIUWjp9rZEraMrajb3LfOBmypjM+n84DoRxgzRXPAzZohss2vA5dgXzkVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A6JUGWEt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A6JUGWEt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8lnr3000639
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Ip6JzXoXzNg1IMXwmAxpeKkTCk5UZ4yAdalMGWbYLk=; b=A6JUGWEtiHBO2REr
	dZMeM87m3Tg6sAZQc+pD+U9oUwQByjXbE+ZZsD14xgzoo7l+04iY7hbRAaOcQ5lM
	hfWXWylpx6SD7YiO1U2tMZMGA3J7xS1tTWqzmZjoA1om73qtG3aWkliqd5jm+ZvN
	VaNG7PEoxV9VRbG9LcX0vjxHbDFx9H4yJYFxl1YRAWM6D2DuLUQrPJLvbYTPwPNz
	RSCWANNsOJl+KX4B5bxaSiPHvDIsMPw3hiVSe5LYF4Fj2uTi9foIzNAJ8dtr1hS8
	PozrhGBO4e25YaoWGBgHye05MI7sHFH8DL1UKSX8LV/vneepjnY/5+LJzgxNLCkx
	I/25dg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn69jac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:45:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234fedd3e51so49464925ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563136; x=1750167936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ip6JzXoXzNg1IMXwmAxpeKkTCk5UZ4yAdalMGWbYLk=;
        b=TpKnWjKQa5jkBcv+PoggP8n9GmzxP9GUNHQFuNkVj4i077FcZHHJQJA01FlnE7/PtI
         YYXr8AE1Z8G8eFFq2CgxFPbmRx11xQ0NPjKbGk3AVTILh4dtgrt9FmC3z5afW9UZD2RA
         Mi2etO/okhGhEejxRSWpImxOtGG6bWCbJ742zDH8jWUtT3WW3uVRJ7WCh4CBT/B/9Q2j
         nFjLqSAIq3qH+wuCx9ZsDnf1DRDgAoDHjsrzSVIZMI0GltrD370mVjqIpDR8U5fjmIYM
         tsjJ3glnEqqtBpC/ZXC8vAfCP2erKFKmGZX8c74+G8FUiK7sNhDIiXwJFD5S1n45rtc5
         QOQg==
X-Forwarded-Encrypted: i=1; AJvYcCVCTLWY35UqAow8nztWsN+P0j0Di89bSF6G0i5NJ9xrvN7IaSckp+rr4kQoMii5gd6yocXUvmY3M+0q1eU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzMNMuRk/SjGooT1A20pYSRGdKcCgV8T6rj0A6Q8daBbU+x/l1
	MC0rO4XDntl16ZEBs3YcgmDxVyWpbPoo2kq+IsNHs1S6RJMsLMMz5TwdYLs2pAa7IIf51prHu8h
	ph/bMo2u+EFOJtLd/xKKe8Xoyk7lx4XW0NR28S6TTGGvr52sVtoeJcw3RUU9wHbjNtKA=
X-Gm-Gg: ASbGncvLatsSqd6RG50VQo9CHCo81UvrZT6nMRogIexMXJ6NenMLIvTwK/0Ab0iUKtF
	IHmTf/UngTSCKyDQcMAG8mXFeXGGfl8Rh9/dG5oZuBIUIcc64vgM4mwpwd7aMF43qmxL1gyG2xw
	JObxNAXaI5VzF8nCWIV+VAtKXU7d2RP3IWOyk59lSeDaOaglt2h292iNfbFG0mzkphIuZYdEle6
	qkFpqMIEFwJBau3G1X+h5XctYv1kZ1v1YxCsQQtTy3L+09QieNhGg26by9FMxNRBOfOVIOAeux2
	t304Mn2d8uCmbJ8m5xH2tI3SUhiMsPaShmNyxiAhyPzqbLj189250lOe+c8upUudJO3Trr9Poah
	/drq1/aYL555KmpW+vEVbPNy8mhK7jz+FdZewZ/aAmQFj18q4MzxaSTDm3w==
X-Received: by 2002:a17:902:e845:b0:234:9670:cc73 with SMTP id d9443c01a7336-23601cf2f3amr258760345ad.5.1749563136148;
        Tue, 10 Jun 2025 06:45:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGagDwRHIdZc82bl/Bc4fkh850v1GfJHbnj0t2zwGj/im0wRw69ffh5SSZvgBKPQez5uO4MHw==
X-Received: by 2002:a17:902:e845:b0:234:9670:cc73 with SMTP id d9443c01a7336-23601cf2f3amr258755005ad.5.1749563130925;
        Tue, 10 Jun 2025 06:45:30 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee70085sm5858107a12.25.2025.06.10.06.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:45:30 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 19:15:17 +0530
Subject: [PATCH v5 1/5] dt-bindings: sram: qcom,imem: Document IPQ5424
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-wdt_reset_reason-v5-1-2d2835160ab5@oss.qualcomm.com>
References: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
In-Reply-To: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749563123; l=966;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=lRTdGZr0aQBOohKHQi0z+qkIwN8mJlJ286epa15TUb4=;
 b=Cz/fVLAzSNzfmtCcKdndL12pNT67DVD3c8cVSEDgf30NJmKS5BSiBO+pDjtJEYaPdq7mcbcnN
 i+xVgS2gwKBCaVOgoFK0w3ug58sLoHm45tjHFR+CQ7z1KlhsBZ4Yytw
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwOCBTYWx0ZWRfX8CU+ysZm+8Zs
 npDXIB+igRNDeS3MnXVsaLGhqVDuL5T75D+xcwU2CD0LvV65ZrWa+P7Hs/3RzVtKIyAZpksnpU8
 tYrTy2rGjLB5BDVF+P8/NH9YvrDhfMCCaaxfmjctAXA9ox2+qiwm1SvccyJZy5l7VKWh/wIEdm6
 wea7fDIWYP6PBhkDLeaWJZHg5KSAG05RyMROcliemX5sMNxT1X8Ur1IcXCVgTFPYSmCg4zsEqMW
 F4kiU4C6yTBh/JjW5KpcY/4FBpvCaByghlpI2pycRwLYIQ/zPP/DKsjO1UveGTKPfvDh/Zlv4ZK
 aJFLEiG2Ha9PyS/oo6CXGQ6h7OAqsEDYtGREUphY5Tgcn0mzq4qWbNGo0F+QzFnQ+7g370mSiFI
 mrpMbV/nHYuM1O7UplwJW7343VzdSgP1sd6agzZX+yACiOD2eAx1ygyCA2npV6YwMcLKuXtL
X-Proofpoint-GUID: glJXaemmeKHGtQ5Gf_wM17itg5C7yyu2
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=68483701 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=7sp3e_VSdAcdU5CosJ0A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: glJXaemmeKHGtQ5Gf_wM17itg5C7yyu2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100108

Add compatible for Qualcomm's IPQ5424 IMEM.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v5:
	- No changes
Changes in v4:
	- No changes
Changes in v3:
	- Picked up the A-b tag
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 2711f90d9664b70fcd1e2f7e2dfd3386ed5c1952..dec1b1ee924cf1386f559eb262ea864f2788c165 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
+          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem

-- 
2.34.1

