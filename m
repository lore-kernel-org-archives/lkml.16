Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F152428FABE
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749044436; cv=none; b=FNTzH4zKX9bUzXrjdnqCiLBeROOjYxddR3eYqouD+WxLS+n2ry7q9/+P50rteaACKH0sMx+u6Ih2Y2T1Zb8aT1ns12DHdfX+DHp1ZuBGLU0ngbfbF13iaqtR8vrkH3e50yPHdFtQsHvFnbd+gBmKBU9VG+MJ/Q0nyf63FP6YNK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749044436; c=relaxed/simple;
	bh=QYQoyP/GIqzyc5A2IeL6llc0Sso66L78LWHvbYzZxoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tuhQqdr+axdUutzg7ypUugjofhAqa0bQzG+RJGgEMaYP9a+/nJktnlS9sdz3zaVT6l6PIMD1Ua8AxS2jDVGZNqYyo9hOJNWsgQfQYM1QcX1xnmilltNIXN93D7BM9OkfqkwdP76bYJGQVrHIm6MAs//tBzZsx86iihpBz+ofmDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXOvKTaz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXOvKTaz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554AhdK0022400
	for <linux-kernel@vger.kernel.org>; Wed, 4 Jun 2025 13:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uXmKJiGByL9+ymVDz5ljTwOGyAtWHSmObA8IFGGphwY=; b=SXOvKTaz0v5cjPdQ
	LWvUnG6eN3B/1GqCHWln7hDPQz60lZZOtsnmeoYCbeB6xSrzX+JSp2MBOK72Fe+H
	NbhuTjO5IFtekMlDG+szCMbq0bDSusA+u3oIZgbFsTKx6Ig1nCEBUHymg4uo+6pe
	nOySCKnt30Ioc22FG2w9crXzRFMg+kPVp6K2UwsyXsd6j8+Poyv8gRx8a/kdyrdV
	/LtfFuJUOB7dqsjnm7i7GyNvzl8y26JFp1vzWOtjthCWRn6Zcg6Yx/sAwAUcEj9K
	4uhq5mtIA34/bNf7wOBBbMeaCM8IYoqk0nhClkXWKF8RZJDHt6gEhfSr1SxXvowM
	LAehXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn00ej4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 13:40:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5d608e703so1222072985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749044432; x=1749649232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXmKJiGByL9+ymVDz5ljTwOGyAtWHSmObA8IFGGphwY=;
        b=Zl1fGlssf4Hw57uZuShkkYitB2Zt9P3FuXdcLDIf1s/RaluV6k7KS8J9Uq5tR+cdoG
         g1nCi2ktDuR1J6motNZFK8HSOAdzB7/3iAJYZbSPQIaRFAwzm5c9iEuiznVoKLlkKXY8
         IBdfA3klf8evgXxMilw/g3nOYcYwdvIFgoU6NVvSjJ2EgOBIrKAGdWfSGz0CNkiVYFdN
         Iof0KKKJut038fiXvgmuQC9m2d9uK8nFZotsLyDa7b5KyElQUTpk7NpDgQGKf84WP6oi
         Kuf4rWffMBk80RRdTO680M00MNe5pUr5JmsbG9pwp+PGxEYuTvSfMkOik/i2Lsv81UbL
         m0XA==
X-Forwarded-Encrypted: i=1; AJvYcCWXh4JfYHdWjBhg22qjjUuA3ioojaazYXy0dRP1eKXZJTxJmNuzWGy/7Sw7erBgkuryR6VvI4yQ9a9gTh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyotOxjWC57w9oMerC0hN1sUaW+3iyGRFr+VqGkYxjXraygg8E0
	c4kWpzMEiHaZhIaxC4SRhL6wigC07Jt/icS03vV7fWvvzM8kfDelbgjpXe5zT+2w7DRC4TnUVrk
	HEz2QoAG5G16l8HFOFirbhtdA0XhpIA3pPJVBoVGzRpr0l3A9Gc2CYG5PxctoRHv2YGmHQfbSb4
	o7/w==
X-Gm-Gg: ASbGncttQDsJrCI3aNHpMzLVqYXE+lideKsbg1Lx//bNg1eFNbQiAbHeyY+TUbVv1+J
	ZtLLnPPq1kv2AAOnuTLp4MDvS0xZfkHW4H6972Go1O2ZZ74RKQ//OZgmhlLiVnh5Fs7jUNUFina
	m1BmMHRIw6DVSeK2p/zkzDeLj02o67Vw+UP25ciVwDKm2S5h0ZIN2KMQWtxKJSt91Lc/0g5pQgm
	x/6v0VbgleHaodoQvTIb3NBuhO/6TQd9lPV2+R0aNtuFUz8ZsP5Buc5+dy9LkgCI/dzF48kfQQ8
	LS08gBsLJ6cUGhc1ejqVTI+OhRujNFj50uMrPoao3BAMzUpYVy9Kn7H3f+qsKmGj2I6tD+sVzkH
	AZyvhYkhsOMfjOxoxkH/6ljeq0iAmHm4idQ4=
X-Received: by 2002:a05:620a:2901:b0:7c5:5d83:2ea8 with SMTP id af79cd13be357-7d2198e0590mr457241585a.34.1749044431982;
        Wed, 04 Jun 2025 06:40:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDuyyL4+BjepdFfkjsfwG/61Ndc2lP8nkESP6Honv24RSwh/eI1oIYSxqNNfv+mwA7d58ZCA==
X-Received: by 2002:a05:620a:2901:b0:7c5:5d83:2ea8 with SMTP id af79cd13be357-7d2198e0590mr457238585a.34.1749044431669;
        Wed, 04 Jun 2025 06:40:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d376sm2311966e87.28.2025.06.04.06.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 06:40:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Jun 2025 16:40:28 +0300
Subject: [PATCH 1/2] dt-bindings: arm: qcom: add qcom,sm6150 fallback
 compatible to QCS615
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-qcs615-sm6150-v1-1-2f01fd46c365@oss.qualcomm.com>
References: <20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com>
In-Reply-To: <20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QYQoyP/GIqzyc5A2IeL6llc0Sso66L78LWHvbYzZxoI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoQEzMFeLTQxhYDg4DSgk92Iv9ppADpsOoZ48fe
 U3X9NrCCNCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaEBMzAAKCRCLPIo+Aiko
 1XYVB/sF/4CuY8yvhkecvGbvfYCcZX81/DpAcY31MeaUso8Ivh4uYY5akj9zHA+IDd3+i8c0vRf
 1+57cSCy7TB38GC2dQEiDpeHfctPiRL0mjQyGZkaUBG6kS5owGAfJL8HjVGtUdGNHrz2vDa7mTG
 55q5B0S+i86Mb8iop/76Wufh9gQTOP+golhCirSqkejLrnqTtZv8qnSD7V9WSfioXkjaIHKPzUz
 Nqye1Qp5+Y73vq7eaBawY9x1YjdNeo1ue9tOn48OJS9VnUc6BmYCOmKMKkvm/ysV7Zxt3fQu08p
 oQRCuSl2VeD1FdKVU5lRIypzq2uGUefcJDVrek05cNt69Ueb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: -5Lc7vMmBwVVdaXC44A_AoGo5KVNxuPW
X-Proofpoint-GUID: -5Lc7vMmBwVVdaXC44A_AoGo5KVNxuPW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEwMyBTYWx0ZWRfX+2rxbyS2NhvG
 OabHMY51zpGhqNFcRRZXSjDyRHIRETgXdPN+AOX70sn1t6whxzsAbS+1I702n8KqoRbQrEIaF8X
 yoUj79NWztO7ds9pZx5xaVwnKqiz5sjl+OVHVa01HIyFGP7W30l/LrxobtJIbAfOW+qmP/hNrS0
 jv1mNVmFmUVKFoQRememUv9rHY6T/18F2fySiaCfteCSqjXIolvslSU5rf1lQdCtcdW4V5gxesT
 dNaOkx4DPU3HgT+XKD+fKDbktpau+WF97RWMa+olnmVW06w3znt89SFddqdKFcM/8z2/HapFc7g
 sUbbkfzcSvSzAuu+bn6K7IXJBhHRCw4+4p+N5eYwrQA91Njsdle1FK+BOtSCGMTlFnIY1b8Wvyt
 1x61fzfgpgA8T8swOpWJaQkhJ78qMKQGqtI1C0AGS5mDSNdFrT4k1sMMT1ElBgk/JquJUYd8
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=68404cd1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=NDTdqBo84DM6fKfIBT0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040103

QCS615 SoC is based on the earlier mobile chip SM6150. Add corresponding
compatible string to follow established practice for IoT chips.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 56f78f0f3803fedcb6422efd6adec3bbc81c2e03..a4725c7d877d8074985e257c5e35869ce610aec9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -87,6 +87,7 @@ description: |
         sm6115
         sm6115p
         sm6125
+        sm6150
         sm6350
         sm6375
         sm7125
@@ -943,6 +944,7 @@ properties:
           - enum:
               - qcom,qcs615-ride
           - const: qcom,qcs615
+          - const: qcom,sm6150
 
       - items:
           - enum:

-- 
2.39.5

