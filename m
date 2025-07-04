Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EED2620CD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611420; cv=none; b=MKLDlSualBJdny6UIgbWdDHh7CbbVBXbbwylvMOsh3F/0zMfop7+E36x7cHSJb4HMr5mpVrop6jkqjaDvNj9/ASv2XGQ5AY4cAXWXev3XUjSpaCNIjImGe1zJ7SdQFL4UiJ+iBakaijavDrj8QtpVjw0YBXWD+jCF4qW+JTe7kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611420; c=relaxed/simple;
	bh=zsNDOxtssyyXKwrA/Xqhu6xlTQfQcZiumpCvpHLeiVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Af4Mu1peD2KmTmri1DMTIAcfVZxaOkhfvvgJacyqcmtcuCbpp+np0XklElZIBvvLzfI0NtyBsriECPdFlMkHtxNh33CwV5x/FqrudJPju0tCImbc7bxuCLjL0Nj4I47MEZv4bZXEdA0XUPOlmvnpawZDublDrtyqgyiYKqWFF/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h26nSnF3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h26nSnF3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56441NoM024756
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 06:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9lCHtaEWJJtL5rVllaD+CR/7jxFq0pVmlc9VCIqSOw=; b=h26nSnF3Q3g+IacY
	uNOEDguBAwPTCxknylnB1foU5LxLV5TFZtyXFurVQf+FGQv1K5LnHRHCGQF0WQGy
	o9FU9CgnsBubUhCDxxyTlKFU2DMRySQnr9Ax7ii0FJtIvMZnsN9eRIBNhuoyt1U7
	lKiWvkt/yIa7WuDhlrJe4Buo0uRGdyoXJGKR6LYsfdRF7svQMv/lcbYryheIDuQ3
	S52sooHPFY5oyRncCVHGugJ/AwTyLFBfqjVMHkz6+6Y+JQONB1amPKmcHVGUIYUh
	fI5cKm2m/XTPCBg7wM9JNP8gnj7SIYBlRmAmNTvgUD07Xh9XAtNeY4aHm4rn0ekA
	GV2SOQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9tt5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 06:43:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311ef4fb5fdso763370a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751611417; x=1752216217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9lCHtaEWJJtL5rVllaD+CR/7jxFq0pVmlc9VCIqSOw=;
        b=Gk0NtgRVOI/NvO2lQphCjVQmrxynWzWAUQmIpIJxdKaRAoFqxmY0t4P/QPSwUEe/vZ
         UeOtTEczk9PqrAX/LTD8o8nsBgdJHiuHC9cKbNgKv9SzWQlD2nfLSQ4cF3A9TRiCPwX6
         o1mS0qNNlV+SGMy4BN2GP/zhVF8dRSol0gqNy+JJ7ZgcLdxLxVp8Rc+cl3qq7CwpyH8s
         6pbAXSKUPsULppoca8Zsj5Ozz4x/GzUtjepAc20msq5c557HpBVq7+hFNbe72YLysTcm
         6Gf7pCoasnnFJzU59eQwsfGTZMAkoMAK2FIPllrBNXtXUmzUtqJ2GXFYuWxlIgU+xhVP
         oi8A==
X-Forwarded-Encrypted: i=1; AJvYcCXad8ORUQI385eKtG4bvNH4ci5e2FVsdfjWyMU1kMNQvXbtX6F1iDiGWmQy9Gn5qSV8dk1NNuKqJmmplqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqyyARWW+c/wl+5POoQwP47f/wGx6n6gTG5AhfomEQaGVM3PA+
	DYbRWVcZXkuIh3EuBRCbH6A5LpvT7CuMolTiSzuzFkMPh8R2g7YiCdI3EQrBGrEwqvLQ0Tlvx3t
	K3uK/d/1RmuJ5OA/E75Uqo54oyH2iv/mPFJHCZPuJn43uzoWM37fDGAiVEMVwj09AXAA=
X-Gm-Gg: ASbGncuetpy429MQ+Do1fJW+ABjlTO+Z1EjKk75jAPg/CV7o1A2ohiLzmTp3cFC2nA2
	aUcov0E5kEpU22ZQViChttESwpI807Ve8+NC6DO/jXhB5ZJ96UbQ63ew+2Q3owINEK2raEAgQth
	rLbuK8pZQeTTpViduHRUTct/hN51PTFC8B3gde/lXNHA3XOWGcYVgBZhV3xz0AoA5DbBCn/lTUT
	RtwfP45CYSodoBlo1YaxaX7vwf4jtsqERPXydbSWG/fiuuybxF9BuizxkMoxDtKN15vpwVf9ZYW
	hJWtIym7Z+kkIQLnCp6VQNklrcu0DQ0jS78aVB/1Wq0xbA7DNDVVHR9HP4o1TyRapJMW5mgDesG
	fZd0p3/486A==
X-Received: by 2002:a17:90b:4cd1:b0:311:e8cc:425d with SMTP id 98e67ed59e1d1-31aac44b73cmr2387061a91.10.1751611416610;
        Thu, 03 Jul 2025 23:43:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoc11QV9ma5uxW2FB279y2pYSq3X2bkAUDt9BdmUrudJX4cC2ZYBnxo2xgq0gjyejcuVPGDA==
X-Received: by 2002:a17:90b:4cd1:b0:311:e8cc:425d with SMTP id 98e67ed59e1d1-31aac44b73cmr2387014a91.10.1751611416179;
        Thu, 03 Jul 2025 23:43:36 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae3e24asm1260338a91.5.2025.07.03.23.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 23:43:35 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 14:43:20 +0800
Subject: [PATCH v3 1/2] arm64: dts: qcom: qcs615: add a PCIe port for WLAN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-615-v3-1-6c384e0470f2@oss.qualcomm.com>
References: <20250704-615-v3-0-6c384e0470f2@oss.qualcomm.com>
In-Reply-To: <20250704-615-v3-0-6c384e0470f2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751611410; l=943;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=zsNDOxtssyyXKwrA/Xqhu6xlTQfQcZiumpCvpHLeiVE=;
 b=qO3rspRRylitl1mLHaDZFgCCQWera3gUWAdzx6UMBGz71sNr1+/vkEah8eeHdcOmoCc1ihVNK
 cUsNJlcDjapCcWCQikvTbOrGqdSd84Hmpp8SLjVcJtFl0W5NjwA7hXN
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68677819 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dI-8CA4c5Xf8_vBnWYsA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: mrFZMit6JmNDXGh9gISEuKwXaEOT-gRA
X-Proofpoint-GUID: mrFZMit6JmNDXGh9gISEuKwXaEOT-gRA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA1MSBTYWx0ZWRfX7P1p/XJbw925
 O4diemk9r8x98fduZBZ0hl3fGDQvwPVm//aEkT6ldXu5HcfcLGsv15W2W1z3QhjQrkcrHA+cz1K
 0jm3TF6IKhk5y+PUYaFLMWFaYZfr3xxHaJn7XucTQ5V3IfGlJ+b2vAPVMUS41NMrThLGbhW2Y8U
 H8L4ZPBefmGK3qAk1MU76XnsyFYfhz8PQbx1Szxxz2yS1OoZ23I1vYCSYv7q95kiOsDoLMyet+W
 SaBIhvlhUen7lRoa6xZd17JLmRv1g+0AmVTGB4sP01qNq/sv0nCeQzzeGOvP6KDhOjlCf9kdexV
 CULlBVPWibiclI4GS5d3Cawmta+41n/2ATTVHcrzR5IlSOffFAW7YW/WAeQpjiY6+1d/3SnKJAA
 K/xsNhhYmhZmz4EiGT+6tFpKSLaI/qZF3cFY+Cc6tAD1i8zKQJ6siLCew879fUcHhnP8yXI/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=969
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040051

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

