Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C65D261595
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611287; cv=none; b=RFLbZBAIBN5hKJfDLl6UhdqpLGCpD+UubdiFF06MR4IYRjQNUTASw/4pl9hO2vauOFjPJkwLGiN4S4lx76/xN6xQS3gh0BfMKVTFeOcB1EfQP66Mug+0v0cIlzhr1GWOOq0rwKt9tShqnjh6QE31TIgS4f6i6vSDAwlyYc60dBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611287; c=relaxed/simple;
	bh=zsNDOxtssyyXKwrA/Xqhu6xlTQfQcZiumpCvpHLeiVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TBTKZdxCnjJ/QH/MF9u9clainQC0PG8moX0aAHobfsa/LPbQz8HrAyCKcgDYaP5U8sUjgtvktGBvm2O8zsprwq9WvTUqsWaSlKsVbzaY7Vh7nVCBqykvlzbN7JK/eI2Q5dK8ktZZnXhEpdd2L97T1hcXBurERdX0GpQIANYbFhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODjua/nM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODjua/nM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5640pjZu021088
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 06:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9lCHtaEWJJtL5rVllaD+CR/7jxFq0pVmlc9VCIqSOw=; b=ODjua/nMk1mCMUfz
	w9Mf/0KBHIHfm3OM11HtyyGJpeGKm2xlcyF2Ifqovc2IzbiLt3wHF4noe3HfeEgL
	sYLsDb+TNMemYBFpgWq+gHEj3Ar1Z7h9B5HwESBHWWsqJ1aZnrPm4JdZBLb6tW1s
	39uO6QR5NjqRoSpxH/hOdcQPggc6R0zYdc9qHAzh6PhKYKHs7lC3bSIXNrlpvT0F
	4WS8Gf13UEhX7kzBQYG1iIHnp5+beCZilG3wuGCzAy3fiuuSy+m4KQnsnjaEERoN
	L03lrcIA0NRy7czInsgm97zWopU1sd5qzWPoHsmxpJ1mNBdqXPoOT/XmG7u0mATu
	PNVGnw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn9ehy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 06:41:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-313f702d37fso669601a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751611283; x=1752216083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9lCHtaEWJJtL5rVllaD+CR/7jxFq0pVmlc9VCIqSOw=;
        b=sW8ACj4w7xH0uSG4ZNrdoMmPJk8aAJ0bLAWnEWgVtbusFo7O6YKNoH+FcIszIeYWu8
         Bj0GORgfN6kFfD2rvHKP2JK6lpLlBA3+aPtZQVVQkx68ywqkC/EXGP5VZ35lfjNgS2lZ
         saXAo4zArXGnfOw/7+MjaZ0Vyfy6SFT1qE1uCqYYAbgDChARNtRL4u9HeT6VZbIskl7j
         MD1CR/wBXaNVbMNzmg9kuVuWx6keMoadFaXLcJKJKfCFvqGVzVlH2ja69gj6W5lapg4j
         WlTBeBd9BWMCq/lry5XrF9xx4d4xXYyjPsiz9fo77xsDws6PeP1LPpwZn0T8zb0qD8ZP
         +4sA==
X-Forwarded-Encrypted: i=1; AJvYcCXq1ahu9MUQiu/ty7szHtBCJj3QC2ShpHAdhdZETEnUk9KbNtNio2gSsotVVBGKv0AATFQCb0DCbl7xumo=@vger.kernel.org
X-Gm-Message-State: AOJu0YysIQs3J03Y5W/qOfXfpOcixBpKt506OiBv+ZDcsc9bi6MBtW9A
	kfBR2jCw5YvJeKoj4qc0bJ+IabeStFdFG/BVwfTEs2eEr9l8iCHhcK0kbh3IHR6PZ0CkaiMCaMm
	DIjz7snkvZ/H8qA3omdps4tJQe0NMHm73M09zD6mPAvJckZI3O2gMof234oij7GxoULc=
X-Gm-Gg: ASbGncv1wuvSXCvkb7ApoGM3r7AqhIqOgm9g8bSBqlh6Xkw9kb3Y9NgAhc0LPtb0Nz4
	ZJ+3XGOLcMFFrjLu7kvR6Fzagx0wZm3izpzj14nTFFYTqr/8N8G7jgQVhugpMFbtoDSjo4Gq+hU
	Sd34sc8d52N8Dzx50aOWCHgh2IBXaIU4OUQlPS4dAEPwUBm+LQu/Zprf1bZryxIDgxyadJfQJno
	kkQU36AHOdYpFfw+8yJgiOZgoJ/gojzrmxWRZTNmCpKef5srWo7ZH3fKECUaunyhRivdURj9Xk/
	YpzPhw6TREgf8lB0xROhOV5c4RifXat3ffJeJT3R8nQinAURf3is2loYc0mPYUwNBgT5FWs8BL2
	xucuIOnuN7Q==
X-Received: by 2002:a17:90b:3c08:b0:313:287c:74bd with SMTP id 98e67ed59e1d1-31aaddb82f4mr1563530a91.33.1751611283385;
        Thu, 03 Jul 2025 23:41:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAKATJXf4IBf4ljh/+e7f0jLnuHlOXrFp416Nbsw5C1SbYqDCEGjEjACcmx0lg1dclD5I75w==
X-Received: by 2002:a17:90b:3c08:b0:313:287c:74bd with SMTP id 98e67ed59e1d1-31aaddb82f4mr1563498a91.33.1751611282945;
        Thu, 03 Jul 2025 23:41:22 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae6b6casm1304746a91.18.2025.07.03.23.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 23:41:22 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 14:41:10 +0800
Subject: [PATCH v3 1/2] arm64: dts: qcom: qcs615: add a PCIe port for WLAN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-615-v3-1-c5f6b739705c@oss.qualcomm.com>
References: <20250704-615-v3-0-c5f6b739705c@oss.qualcomm.com>
In-Reply-To: <20250704-615-v3-0-c5f6b739705c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751611278; l=943;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=zsNDOxtssyyXKwrA/Xqhu6xlTQfQcZiumpCvpHLeiVE=;
 b=O9iCxy+leDK3wN7Fx0+x8rQSsKZkO+0GO8Ym1zoQNkQh6H5xqsr35kYmNLZHE8SzQMfJ6MV1N
 AWPanESNPxvA+df54Ls+NO9/dxCUVbjlrynusSC4qNNjreIIMCvNNCc
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA1MCBTYWx0ZWRfX+lYfL4LHQSVD
 p3ZvHNdGQFQhUnVE8+38HRfNflbjdomcpY8++yAcmSLvMoMnsIbnlnEIp+PehchOVAt2MkRmpWK
 ObKLvbMXpUYlmP0SCqkJiLpaP/pui3iEQq5OASuQ+KGPip3uC6XSNuercWTaFdkTJKHwb+BvV8K
 935fkIIpljvzfi/w2HY3Vuujv7157ic1qcCv5vOXq40TJ2gVJ7iQI/DIcgJMJ2L+SStc6ta0QYp
 iE1ydeEwewg/0s7xO2P4tURwo3CTmqeEvhJzHhqmIPbXZgx58DaBwjXLRLpEOyCJQdgaTWxyh5I
 gJHE/+ttYgAiL9ahu1YYzGxyw4rMjVYDTadq9PKH7ZmJ3WiKu3F2081T+KTMqyX7BrYAOLPdtNH
 zZOSR/5oS/y2GnefnOj2v/N5de6NnD0ZH3OcrYFoJ9cfvCt7HZ5fu7fzw0quabKDdgEugSyb
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=68677794 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dI-8CA4c5Xf8_vBnWYsA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: udcfT2KI6tmzOL3cNVrGprofH72i1nkR
X-Proofpoint-GUID: udcfT2KI6tmzOL3cNVrGprofH72i1nkR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=969 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040050

Add an original PCIe port for WLAN. This port will be referenced and
supplemented by specific WLAN devices.

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index f4b51cca17de5518aad4332330340a59edfdc7ec..b4fbed517cde18e088096d182fe6b482363e403d 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -1173,6 +1173,15 @@ opp-5000000 {
 					opp-peak-kBps = <500000 1>;
 				};
 			};
+
+			pcie_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+				bus-range = <0x01 0xff>;
+			};
 		};
 
 		pcie_phy: phy@1c0e000 {

-- 
2.34.1

