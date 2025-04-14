Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4291FC0EF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672938; cv=none; b=UIJikS6Chzs+5pbEKIuygqWoPmaRv8l4DsKCZbSqa2ZypDMhNdF6dgRggQrb43uixFiXN93fmGOi4boQJ89jzcq2skJnRpIQPvUrcQbcZ2pek8d2qkTDUp7cQ6deT2CbXBDIK1ZoDJHjNyujHu+osjn59pgR5K+hux4h0xOLTbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672938; c=relaxed/simple;
	bh=iVXmk+6PlFCRAwYWJHcWgZJRCI46HfqbqwSKFjMQVkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jgzb24+wu4sKxUWjCllgmfu5hVOiJTeRHVCi8v/7AteCTCT1mgwq47n/kbesncMVl6B7xv1lwAYALRTdl2XXOVwo65OIlSIvkrbASLxD5+YvljELmarc/8xwhrhtp5MGNjD3uyjxP+vVvDGaQw9XzflMLtiHJhl2DvEInJ5W0lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XheUTK7/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XheUTK7/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EKeGfN011641
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7gubxlw2eh9/E7VsvX3yb5YKpoQUbGbeurpx1mvSfWw=; b=XheUTK7/y2G9YEi+
	3DsG5+WxFCpRsNXgdOQEbMxZ5SyZ946WalYziChn5TLl9SGENYvs7xHiRNzLDPQW
	pwbCvI7tcBrA2d1UESyzD98OQN1ylnmwUSNhn3c5oaWdEkpdIHR0IdNnQsQeyyFj
	uc8kXMsVn8r3qs8R5gCY5NAcr31KxAJwxE42aBLxxj3JqhPoihoQsNBHzOKUtXr/
	PB+/CGNdEz+V54tDuP1XKnw9hSwKZZgy/l0G6/9+/YukBvUMc00DrsNEfmCuoFvt
	0yS2wpxQoktCX3W6qorQNEuuBIphvEdz5ON/yqLhz6PvZUSJ6kyisFn/dkPLO+eD
	r8h/6Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcwxas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:22:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-73720b253fcso3654262b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744672935; x=1745277735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gubxlw2eh9/E7VsvX3yb5YKpoQUbGbeurpx1mvSfWw=;
        b=fQMu/JE3In6VSI/JzX1EMm/14kX/rkLqN3smJMbFc2l1H+PueWKX/Is7U16DWe4OUo
         ucvH1E/hTagYW62axtB48+65gm53wjgkw/ENbi3wY4OORw32ZXg3zhBzqQe7jJ4ZqPyH
         Efom+u2o2dFhxBeu8aZMt3IH0RkedxVGaKyeuymdBAt2CTq6iaI14oF27OrVwUfxWvqf
         gmswTbrenmnT9CYCF5BbS2iiEjY1Hitg7wdtWvgj5oIx4OtTs5AVUcUZDoktLG04vkq9
         xigwxQLWorH5iQqzH3Joao7rsiUbJ7hik/7Pt3W316hYp20thLOqCneD+ORrIZlgkxao
         A0sg==
X-Forwarded-Encrypted: i=1; AJvYcCWtiV60c4dHJs4dtBj9X5swoezCUCS/doS78l2HVcSJ20Ua/dOuWR9qNm19EWw1pucNvJUHSgjP2S01n74=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl1GmfPYJjyGxfHAzcEezxHwzosxcViNmUQe/b+yWW74QA8Slj
	p+nN/hYzpmhnd/dJ/OSOEMlo9pKNs7NgxB7kn4z1lD7wpzD39K91kWYDArfRgI8oJzcAYacPGQ6
	YxNmLE9b5wJw7TOw1snRuE/q/qyL8NIWQ4U9AX+jjR2CWVNSVSY+8HoJfzvMZ+TQ=
X-Gm-Gg: ASbGnctN62cnJ+b2DQ96Eul6bDB9rfFghWgsC2EBnZxXCaoO2iBATywoosUe95PHB06
	PHx67rL3bO40GS74Tys/G1kH2AFoRtY3ILy9UOBHK/sLZYd/zRcbJD0Rf4dnVCd/ESkAkLgsaHm
	/HJ0yykqO5Ed+aE32hVUWFGma+IfDQXewke+KRwZ2zXtvn3xlIkvE/M4p/L0x2AMq+Zm/jycPR7
	b4uJ9EgvzF4s8G8gnvz7Z/4QdMj/1Qh9fDC8bt1eGGvFxrZQSu81iq57V9mtyYe4TrcKxTi4rXc
	58gmwb2RlJeS5+qkmpI07oaW+tJwdveqFWuYmU+7zKqFpFym/Aw8KjuRStgNqjiQhfY=
X-Received: by 2002:a05:6a21:8cc1:b0:1f5:60fb:8d9 with SMTP id adf61e73a8af0-201799645afmr17990663637.33.1744672935157;
        Mon, 14 Apr 2025 16:22:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQotE4IJwFSf60/yRceyEHCN9NT8RU1Xq2jQoJx1KNuVZ1qE9F0fk4YZq5Qc+GudEIp1XXbQ==
X-Received: by 2002:a05:6a21:8cc1:b0:1f5:60fb:8d9 with SMTP id adf61e73a8af0-201799645afmr17990626637.33.1744672934710;
        Mon, 14 Apr 2025 16:22:14 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a3221c7bsm9746298a12.71.2025.04.14.16.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 16:22:14 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 16:21:50 -0700
Subject: [PATCH v4 1/4] dt-bindings: cache: qcom,llcc: Document SM8750 LLCC
 block
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-sm8750_llcc_master-v4-1-e007f035380c@oss.qualcomm.com>
References: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
In-Reply-To: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744672932; l=1020;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=iVXmk+6PlFCRAwYWJHcWgZJRCI46HfqbqwSKFjMQVkk=;
 b=QMIU6b5l+kB49usMjdLtstOn6pSMTMnLpx2p/yocj5YNe/oym1GeCeLXZRpkrY828+UlmJekZ
 gJv6Uk0wqc/BMvrrUM9korbwpebMFZIQ5WzznXjACViEZE+SX5Qh3BL
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fd98a8 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=XYAwZIGsAAAA:8 a=sCV_76e64iQtlowYmxsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: tyQ1SPux8KOt2D3yHz0MUeizk7h6ZJED
X-Proofpoint-ORIG-GUID: tyQ1SPux8KOt2D3yHz0MUeizk7h6ZJED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=739 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140168

Add documentation for the SM8750 LLCC.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index e5effbb4a606b1ba2d9507b6ca72cd1bdff51344..37e3ebd554874f0fbbb8956a718dcb717ee82155 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -40,6 +40,7 @@ properties:
       - qcom,sm8450-llcc
       - qcom,sm8550-llcc
       - qcom,sm8650-llcc
+      - qcom,sm8750-llcc
       - qcom,x1e80100-llcc
 
   reg:
@@ -274,6 +275,7 @@ allOf:
               - qcom,sm8450-llcc
               - qcom,sm8550-llcc
               - qcom,sm8650-llcc
+              - qcom,sm8750-llcc
     then:
       properties:
         reg:

-- 
2.48.1

