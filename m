Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A27253F30
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451471; cv=none; b=Qb/P9hbSrgdOh+Fyci0yrLIWYWaJ8R6/sn0M21NhynqYXLDMaXMzCjG3oPjlZqzOQZ7xTBDeWFLQHFQjDlXdavGhRjj8k9ffus3LgZBu9oXgVlr70eFkeTenXXr1ELyIYDn5INYr4oJeOAupMWU8WOSbIHXwm7mm6pNy68pouAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451471; c=relaxed/simple;
	bh=J03UIyk3++cZuCipvWPcyyiE30k0tNvp34iP4Z7aGPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OPujFupqy2F6V3JXZk375C3AjWGHF7NTfjNVhpWGsbK1fefbWq9XtfRSL2kIssOU9xGIg7oIUBtuz8ikdW3qD5pHh+h1j7fcl2A9oHXguYPFloCJHQeITMIJ+Jdar7iVPtWzC3jRmW7z0Ct3XRdDlGuuJZZ0Z9hfbIfAGrCC3Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5ORfg3C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5ORfg3C"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5626dEgg000324
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 10:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZI9sC05cm/3qX1MoV4H5KL3qK5OGAwku7Dmvoj6xDsg=; b=F5ORfg3CyCOJD9tP
	m+EsBNKM9A4ljp9R8RSmGn2Z4E9qgBJtGyriqrRNg0lHUsVq9uuRvPTliTyUMs8c
	dlwHxOGSbylN9qMboN3J8hrkFqvpy8um1tDU6g2zYTiIBleOnb60S39OFlM0DpcK
	ywmq0Ii6UIV8vfxo+EYO6LCfd43zA5ZtKGan3aK/9RtiDXi1M1pdrX4aBnljl5UR
	c7x/JTdyKWIdR4h6oD7mZlFmSrEYnEDcDERTT/uhOdNNlHKHHtY6OmUzhkOgZz2d
	LyIUH8uY7vZK/P881OUIyJbog/1a9pzUqS5xAurw525VpByHX+MN/uqFlK1zHLyv
	spvkEA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmc5bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:17:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748cf01de06so9676934b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451467; x=1752056267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZI9sC05cm/3qX1MoV4H5KL3qK5OGAwku7Dmvoj6xDsg=;
        b=kbzj7RpJVd88x5Ez989zwrcJZjjgIEO0DiHZtoAfEWReffFIOAohL5Il0uFdM9T7i3
         9JS9sy3JoFjn01yrowlvOiHu7Z5Nac7Fpq3aIHxQpQ31J6zOiQKkRMbcuWdxskjwpVd5
         uDGg+OC1lPKA4ntD4D0rDO/zKt+iS/Fn6E1vwdruoyMfQ+HLlUXFQ5HsA2k0iR93ug9d
         q2f57b2lhGVkFeqLHiHoMF67g+eSs+JaxCaH76NK8mfa9G7OFCmOLEDlhGVy+d7+c+Iy
         RrHuckXzMRik/09HYuNuaubjTTgN4H3rAfOwWz5kXQnmqXfL3pMYAAh2O2H8VUgGXyte
         Pf5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZawnGFtZQEsMC++xhysm7iHo0yWs4ALrmKtq4WNV1MGJTi4aDM4uoumVIzH1vCxXwTMEuM+egGuqi3lA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyay6YFi37+/ZwCwUmZ44dl4F9mQBYzXZlhw0o4d2OnGeJS62YI
	VWIzDYrFWuxx1X0pB6FyhC2c8OnonEXhXnfzeOFTne1RzALc06mAne3p6ukg31Voz6haq5I6DRw
	uE05IkFrgAC8J8MUn60tfGOKzyzn6U9UeD2qmNK4aWbu9xBi/Xt1lP1+9fhhJGcuYcAo=
X-Gm-Gg: ASbGnctTfsDh/6+nUYyzR+3D+bW1Z4xkA7Ak9NJEwGy2jtksOe3djRT7+d5GReklABy
	/dnei11Q8tntqyxj4GcstaxmEkXUSxLTxSGHbEJry52UPaVT6ZDJYOhXqqzkIpCARXRLr3O1rv4
	pMETpaG694eq/r7KK+k+Y5afJTx3+XztvzO84J3zJUZgMxIjyakf4vlBQgUuODj1g5/6k5pnWYe
	6ETFMQgoflMfVFppuV+Med3RCSk5U3NbZQLi4nRQA7FxPfBKNGO1ZWDVZ4lMBdnBUYcH8SxOFN9
	qsjjar0UhOOQlSJhDBsxFc5bY+sVRRO3gsODKVzUPMVgevOSquKzyDA0iRlZXXQ6h8j5+V8SC4j
	Th1TIOTcZHy+C6F/hTXjUeoulM3wM2hg6HZ80uxShPxDwgQgA5acALe/9Yw==
X-Received: by 2002:a05:6a00:929e:b0:748:e1e4:71d9 with SMTP id d2e1a72fcca58-74b512a4b63mr3001852b3a.22.1751451466946;
        Wed, 02 Jul 2025 03:17:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEowJELbiCa1g27aMvRwnyFZkhJX67qGkXj/+6sgoDLFdi9mlUc8OJntYXysxWDvCkzYUt4+A==
X-Received: by 2002:a05:6a00:929e:b0:748:e1e4:71d9 with SMTP id d2e1a72fcca58-74b512a4b63mr3001798b3a.22.1751451466524;
        Wed, 02 Jul 2025 03:17:46 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55749b9sm14486315b3a.73.2025.07.02.03.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:17:46 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 02 Jul 2025 15:47:33 +0530
Subject: [PATCH 1/7] dt-bindings: sram: qcom,imem: Document Qualcomm IPQ
 SoC's IMEM compatibles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-imem-v1-1-12d49b1ceff0@oss.qualcomm.com>
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
In-Reply-To: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751451460; l=1004;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=J03UIyk3++cZuCipvWPcyyiE30k0tNvp34iP4Z7aGPA=;
 b=Vc29Gf3HfisCRIVy+1KVgmb2V83MeMBwc4+kqNklsHihBbbaMNbppKo9HGwaPNNxpDWOoYSAH
 9wc8RYEX7dCCuT9Ezm0G2udLa90G0ubvyS9PiI2V447O6L1knkHpmwE
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6865074c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VpYCf0uwatFdRcK0hfIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: JhB71X6VVJljQM9h0WK7btQTk1W67l8e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4MyBTYWx0ZWRfX9GHLTCIsfpMP
 jE+Mr7ZNFHDs1xyzLxSnNzbqNxSOVfrvTUKQdm3G3ed5EkbqAmMFYTyKQwegynRO5pVHDZvXgUZ
 FdkZyeG0juw/47lAqhWhafEbvicQ147TX1LN7zxmqLENydcgda4R5wRRjmAeYzQIMXByjn3XjwO
 mBtB5afWST6RyKAPEB1Uqq5ODe4MnLDsKSdm3NKfzNntq0DaZIAvuFE33rcOnByYaDRo9JhJJKa
 gSafG00b0gLpRT5FUtPFpADCelFVuf8Lg2xo5pOSvh4lFBgGtdVmFVJ2yAMrnrFhjICof0Co3mH
 s+55NI0Gj8bdV6UtvlZP1LM/VJJRS09ERBe/gsPRO66F2luPLlJsWwmKhiav2tulBaP9tILGlXx
 Vc0EtmfLxCooSnWQfS8OEBFIPhioVOhGIkc4gdIUwXfzSMwd6moi7t9m13SZ/MQXDLRgYuzY
X-Proofpoint-GUID: JhB71X6VVJljQM9h0WK7btQTk1W67l8e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=826
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020083

IMEM is present in the Qualcomm's IPQ SoCs as well. Document the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 72d35e30c439ccf4901d937f838fe7c7a81f33b1..48e2f332e0e9fc9fa4147fa12d9c6c70a77fafda 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,6 +18,12 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
+          - qcom,ipq8074-imem
+          - qcom,ipq6018-imem
+          - qcom,ipq5018-imem
+          - qcom,ipq9574-imem
+          - qcom,ipq5332-imem
+          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem

-- 
2.34.1

