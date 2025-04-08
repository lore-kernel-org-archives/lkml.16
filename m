Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979322673AA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102240; cv=none; b=fV2g/aegslZHb9XC4PSejD+SsTUSHyDwJBC5+9HM/PEf6jguNaZQDptinwVT0p02EeQW/4pZ7OoG0rOe7RFrJCtRqfrYsRE7UhyABSKeib/Z/f0rAjoL8YzpC/uQKBEI/bakh/X7k8kohagAKY0bAzyculorC80/KHR2SmsGNNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102240; c=relaxed/simple;
	bh=M8s7BxCEMIKIVssuhwE1Qzjds3ely+Ku4yT4Ok75T/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FHVhNwXJR+rC2IOLgcHzPjOVHdHnNdj+XX4v0ZR6RMkhA1uKIGPA80a5ZCEEVUNws5e0yDC0q0dwfRYRPgfx57PaUQacwmIDNysdCRJrMjo5lN2AVq3hbYnGhMP26TQ27892VSscLSEToTgStT4S0afRcFkfJTvMPg9DJx16V+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMh5kgzk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMh5kgzk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GMT3020154
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 08:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	loRI/DG6BJeyA3QEAVzMFr8Q2pNYjDeHa+tYwjZmEhA=; b=pMh5kgzktKuV5Ks2
	2YBESMxwiyrnw4nR0xSN7RZfp6utSc5b9lkS44COySojAE41hoXMvPtFm3kammd8
	jY/B5gGQq4jdI0VsopqG+f5oW8hNX1Yvv+4nYfYAnVFPPKWxeskl8mw8N1Z3IYB9
	z+6OeppTyNUQ0hLYuOKcHCJKZ0Dl7b3x0XzRj3CR+Z+bGcv6G3x2c2N50d+HlJG9
	uCtnYnENRgColE+5eVtSNJ2n43yMhC1iUyIZ3qfIhAWG+MgDbf0NTxCS1BDtqalM
	/ct9qaTVicT0SP8d2HFrHbPfX3JlgKUmJ5AvAnPo/6vEpwhHXPmiDHBw0hULq3uv
	3XNd8Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2q40d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:50:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af5cd71de6aso3518932a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 01:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102224; x=1744707024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loRI/DG6BJeyA3QEAVzMFr8Q2pNYjDeHa+tYwjZmEhA=;
        b=k8vr00NgHYz22pWIKZ1PT+Yb5hjIMzPhISaTuh+oF+CO2Jr6A/N9e/y4V7KIEefW6/
         jGOA2rjSXVXS7n3B1Rff5MVNVrre15NkcMgQf0T7yNbBbUsp0lkb9zae5vzNpurO6lne
         +5Cj5HE/O5XblV8UG4oXkWp8k1Fs15NCAbqOAnGy6FqZyiy/YJI+14CkJ2cNa46AM15y
         OAeuDD2JDtiS60Jr/WXiA+NqWLxuGe4/PCOHVVmD7TlZtuRGT5a2g/oe6A1VyAK5WQ7q
         hTbuMPnPXCFMwsYx/7JvzSb4ZjEDM2fcdnIX3er6CKQjbLH/WK4RwZKTrlU4fihjsTxX
         FZ5A==
X-Forwarded-Encrypted: i=1; AJvYcCUKH4As3cd6/uJqVa2AADp0oZdEJXe4uE52jCnKoRwBP7xKremP9PiAcXC/3Il8xi2dvzISLvPR+Juk9xI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOkcdh580htehmC3nYewJkJB1gPHtY0udBFuC0Fm1PDT5htq+D
	rqz6zXwBxCvxyOrctVywGj2gDawbJrZw+KwbE7bbPiN3A+wr9HcojhAsMe5etDmphBGShPQwVFm
	Bt5vef4t7hj6UNXRmaetypGnL8rp71069vNn3OWQeNHW0qQFP8QpWH3ghy3C9c/I5e2ppvME=
X-Gm-Gg: ASbGncvqniTHIcbV0M6h+fSawIHEEHX3hMmNZpm5zLMQFfwJGYhTlMKmVNTtgQaPO2g
	E7ThdohQFPiizvlWfcqR1HwR4feKwIpKMdxn1BKfANihzIErsvqLROQAVB2oesYVt3H6c00MDZ8
	88ag9iz6MmCrLX0bT/huivUJsCRvyio2MkJTgYK5faViPl/8Rf6oE1ApM5XkIeh6EETN0E2Kxwq
	yihgwaeH43924XdplPTuQhfdQSpD07e5X+opIDfxBQnbk3K8Ma2weSzCEScalUv2udnWi+WmqNo
	UOVYkCx/CD6JbBIbK/jJER9nr0waPC/4xceQJfE8ThskqtUBVeZg6XAfkelksr91ZWC5GoYJ/c9
	nyjZ+59ybcqT657JoU1psXBgfOtqevZrOlp8DUkG0WA1pkLJZVGc=
X-Received: by 2002:a17:90b:254d:b0:305:2d27:7cb0 with SMTP id 98e67ed59e1d1-306a48a6878mr19952896a91.21.1744102224157;
        Tue, 08 Apr 2025 01:50:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOwLSckL+yWdaN2uT8q2dSYvVISiMLUMwmKOZP5A/vUS1nZ9ejcw1TqflVkrhpjEqV/veqig==
X-Received: by 2002:a17:90b:254d:b0:305:2d27:7cb0 with SMTP id 98e67ed59e1d1-306a48a6878mr19952879a91.21.1744102223831;
        Tue, 08 Apr 2025 01:50:23 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5a823sm10480846a91.34.2025.04.08.01.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:50:23 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 14:19:56 +0530
Subject: [PATCH RFC 6/6] arm64: dts: qcom: ipq5424: add node for the
 restart reason information
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-wdt_reset_reason-v1-6-e6ec30c2c926@oss.qualcomm.com>
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
In-Reply-To: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744102197; l=873;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=M8s7BxCEMIKIVssuhwE1Qzjds3ely+Ku4yT4Ok75T/I=;
 b=f8fhhU7k1xmVdNeYHDyzwFQAKC3YeDSuh8ItfvAVxu80upvicUEB4pbPW2s1FggobjsQtzrWV
 oe9GPtl/D1DBBF6a4pqG7f6XHIFt3k2MVzMl9mR1RHAp2R291G5zKfq
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: _fhZHPcVvrogKAPFQbOg8CSImU0Baw_k
X-Proofpoint-GUID: _fhZHPcVvrogKAPFQbOg8CSImU0Baw_k
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f4e35d cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=-3m3cBowUQCSrRBqnYEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=862 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080063

Add a child node to the IMEM region to capture the system restart reason
in Qualcomm IPQ SoCs. This information is populated by the WDT driver via
bootstatus sysfs.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index a772736f314f46d11c473160c522af4edeb900b7..d399ae506748b22c1dc653d357c6fd071dd67f04 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -493,6 +493,11 @@ sram@8600000 {
 
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			restart-reason@7b0 {
+				compatible = "qcom,restart-reason-info";
+				reg = <0x7b0 0x4>;
+			};
 		};
 
 		usb3: usb3@8a00000 {

-- 
2.34.1

