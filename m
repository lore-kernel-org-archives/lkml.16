Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39CA214226
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745603248; cv=none; b=HshoPCJanJphuw+t6544CsRkRWt+Lm+9jyc7abCOpXqDAeJ0YDHmvc5zHYkkYFXso6QuQdNrq+3ufdE8kslcekd8TrLyqiy9+vftmCZwvVO1W0esT5wLj+dKkXCMi9QDfjQYUlmakpb+ZiUgcbetQAFs8S2g9HRny7QRPvypnrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745603248; c=relaxed/simple;
	bh=euC9lx8IKVS/A4UdhCZ5+fvdurao8cR4qkRb3bHColg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mxrnEvFlABA64vpZYqc1o6WXt8uy3pEKcGNcPggJLE3APKWX50m2gySt4Y954KjWPjXdHF9lAwNV1QhWsS7BUKdsFaBlVjO1nFR8YjDsFg6l4XYxQr2N5uXge5MrcGP7qTjAUPCppNlA+ixSruVB6rGjtwOBgTKe1W7765Lyc+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j7QGIM+h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j7QGIM+h"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwGG032085
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7IO4GSFLKL+RE89vjiv//aIMcE3MIuPp86OVbDzpdo=; b=j7QGIM+hkbkOZMxv
	i5eO48NUR/jzm3EdeCb24hpjzmsTbl9KoYgSEI/jv/aJvqTYc51nMumFjdtcgU2x
	Yd8wMd4vIMn75KtzgApMshVnDTfqGA3a3w6eNJmUyms9vP71jJLMr0sMfwlJ3oby
	EbHqj7l4dlnfeu5j76/0yykjoUG7FI72lN0jBP2NRsIbK9T3HfI2YEXvYj3/2gxT
	gUMvEpt4+4K3X8LEGWrL4xh2XHNxLjtlGReD8eu0Q2auDiTKj/mN5dldHL4DgmXB
	9qreJM//zy7bva/1NZDLwzky6Cm4XTBZDGPxbNVcFgqaMOK7ZlXPaGxOzdO8cRYu
	JsEcBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh19r8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5cd0f8961so507427285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603245; x=1746208045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7IO4GSFLKL+RE89vjiv//aIMcE3MIuPp86OVbDzpdo=;
        b=nw3nGEsuJA1zBrotHXUzZZ0a49lWdb7sram0grw8zi4h4PUK6OHYSo0bKYpMx8oNAN
         TmPpA0xbk74Y7zdzmdA2gdz+MPkr9ISUyr6Qi0gwveIcLnHxuTPNF17mS9S34nT1wGNF
         nvZ70CzY1p3qLMlcEb4eyp7SU8pBZqdvPxeHo2S3ARLqcvjzfflyrfGuC/8RTs1TqqrC
         BzuVmRihuhDDfLIiv8NleLoys2H9x5xRWZ46QgHpAr9hseadiDRlGbsGQvAbEZwUmW3o
         XleF6pthQm3d0n8f4Qr08WhJbAL8IefGT36T8Ud1i/CNKg5xAq4kHc7YefM5PW/lz1E3
         m8WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDIUWfwfRiSz8y82pi3K91bHOgPJF5usPhjAS8Os9fbz9YC6h/ryJVhsnBV9cuspqEHX+mbbYYMF5VHak=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVwqDShkQdGNAYd/Rw6A+2cXBGl3atB6vMK6Onfz7rF4cX+XNC
	TNvHv22uBFMEHUzdwKEBt0qiGcMnV5sZ/4/yt+6PGXeJPZcSqIzD5PNEkEYdtAo891AtzEVO7al
	10gwUdOMF1GAoTE2jS+HCh5suchG+lMjhlv+30oz2Ms5dDkxoj1CAFxYre5OTXOY=
X-Gm-Gg: ASbGncv5v7vj/7SABEPKChAjpzHejEoTBZA7RrBFcU6VLcJyTIPfsztVGP5rm2k02UX
	OYoC+o9/HEYgQUEmWxTGp18c4Yyzz4Uon4cGuLO3J37PReiNl+4MrhITTr+esJF7oVXae+vIjdu
	qZZ5MyQg+BdWIH+h6rs2mtW6SkNXEQEQVkkNQQqetlAW7mkrqoNrt6chW1QsG+KLVCgE3rcvHir
	EIKLNK44inK3GGwLLukA1UL4mSTe52r89r+IFwJdzpNORDySgzUa3izicqoAgRdpNakjUouYi2i
	zbCNI4rgRJbOd50wJVTD8EunuXs/0cMz43fbMyO1LfrX0kfvvY3tbIpGyVwtgRprXdH3LAbuK6l
	l/Jm95l4rdU+wwcPERQRYeGEp
X-Received: by 2002:a05:620a:460a:b0:7c5:50cc:51b3 with SMTP id af79cd13be357-7c96072d7e3mr483415985a.33.1745603245191;
        Fri, 25 Apr 2025 10:47:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtWO3ZUcxDc/2klMeYlZoJrKhUFUwBPFBESBgrjTBIhVNl7tUqNE3ZLJF8IgE2UQDL/2QyLQ==
X-Received: by 2002:a05:620a:460a:b0:7c5:50cc:51b3 with SMTP id af79cd13be357-7c96072d7e3mr483411885a.33.1745603244862;
        Fri, 25 Apr 2025 10:47:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:09 +0300
Subject: [PATCH v3 09/11] ARM: dts: qcom: apq8064: use new compatible for
 SFPB device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-9-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=782;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=euC9lx8IKVS/A4UdhCZ5+fvdurao8cR4qkRb3bHColg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qbUyp12J3iMaDl11OPJ5HVt9azxGa85+/2j
 8p1wI4mC0OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmwAKCRCLPIo+Aiko
 1ZfKB/9/byvswDJiseb44Tt3uF9K4YrTdBCHtg254tQgElwLWqcU9hk5NvRAi8z2vKudgCBgBNx
 cg74FHwlrFHkxx5ai1CJfnMFWEYVz2tbHYNxCZQ5PhfYHRup7l8aHp4IGdjZ8aojWMM4EODrP7V
 MAGHgvmSpYadXcoIEzRRtaLw1S4b/64wDrdFchuqxFxRL3UL4d+74lgm+DUw4eIeAzN7AcYm1DR
 fpPb30O8zULpjxiuiXjmO7x7Xyghp/A7h+RbNE4KD1gjjUk7P1vegKFj1R6h9foCyujXQBjoP8x
 910Qvr8H9SqLd5sRuomxDw4y6g/FckzUURkLnhiHeVLUVVyR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: R98bo5gFw3SWgoC_P4mdSLfqs8IMMqr1
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680bcaad cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=vGl9qbW8TQSvOBFUlmcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: R98bo5gFw3SWgoC_P4mdSLfqs8IMMqr1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfX9Mi17yVD3HOx z0/lc+ycfqbyJz2arAIGcFZuzt75kuO4L7LpIcmYSFf+luu6wEmmDz3+2ZxeaQhyLAD9dUD9XAH 6MWPYcPE48Or7u9D3IJNqQnJ6lR6SO70eFloob5RrLpofouqL0xgoAWWXEOUGiPgHFgVTa8dUeW
 TJAXpo6ypI0s+2YMweZm+1ZfPWBrfUdc1OehokEhL7/6NzpmEcqfbNzguS4KKESzLzdeJOxiSdV sT7FZSqpyWOWLSlWiepChU8cOL6k9/uZ5X3vauQeSvkjcV5ojEc8JR2m80Bssw8vmYF554Pi5tY bcRzvvH1ERInZB3PNuGu8flKGBCfm0Ssd0ebqOVRYRyR+ZKsVDlHGZPSQuBx+rGKmLVnhFB9sB3
 7EDJPeFZ+N5VJ3RLKZkfCSYQgYFvOrw4LCty8PKMWy79l7bMUYbG1iC2Ok4O+Og9ldGxAOyF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=743 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126

Use new SoC-specific compatible for the SFPB device node in addition to
the "syscon" compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 41f8dcde20819b3134c38dcb3e45b9e5cc24920f..a5aad4f145dd368aabed44cf520ffc037018b37e 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -1086,7 +1086,7 @@ opp-27000000 {
 		};
 
 		mmss_sfpb: syscon@5700000 {
-			compatible = "syscon";
+			compatible = "qcom,apq8064-mmss-sfpb", "syscon";
 			reg = <0x5700000 0x70>;
 		};
 

-- 
2.39.5

