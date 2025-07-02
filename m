Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E7824C68D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451468; cv=none; b=OIshqSpF7WKwx40LelMGtFJJ1lUmX70SAEF9hawDzoQE5X55AqkA4S6uv7iBBS3HPFQLIORHDWgOg0stZNRJUOyc8ZJOobXbXlnNC0EL/N9uwlbw6izYWagjJxT85udnt31RaJ8HnWq6bVsCcfxxEPEP63fisQ1T74fg5lcaU/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451468; c=relaxed/simple;
	bh=+6A6wyU6zI45xM0J89Nwmzn/yIxfMgM9fnnSnd48Y0g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XSbZlrxDD+aq02oqRYvWt5HmEbqy3HVVVsCfmDyd+iqZ8YmWTFdWdOYRMUoWlBtIgZL+GB9sri0fqB2jhm57UAaTX6rGXyH5UyzxaUfClGV1e3ms08w3Sv/EsFIjhjdsr4txDc5L7axaobzR+pDHSAVZ3iXRDxBV3uMRWq+VDs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMJh4pC+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMJh4pC+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5627jAUp025172
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 10:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B+WepaBZTOBX8Yn9x8dvlB
	2T3GbomLkPCorGKitur4Y=; b=cMJh4pC+PNVm0o51RMxvflOV79/RjJyhxQ/elg
	hT1wSVyxuVrOPQB9NhivyZkg2Bxvbtphy9m5w82nqOU373+M/NZ1TNmVtyULaFKw
	f/CbLIkJ36aj66mdvfpcKH/aaY2VrAylPhYuQ85XWxkOhXGV55GuDkLAYoJ9t9c5
	rEC3eY8eh1P9Y1sE50XYd7dQsXmu7712pop3Yi3OhPsqJ6Fyq3UAR97n0pwr6p5b
	+criASfoZggk1gwjzdnUXoYotmW9xihUBJzwVEj4rBJN/kKpvRqinMKz88vNzbPZ
	ihFAotRB4F8mwQpm/GYWMwlImgEbx4QpwsSNirhSI8DanO0g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64sdtg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:17:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b31f112c90aso5195209a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451464; x=1752056264;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+WepaBZTOBX8Yn9x8dvlB2T3GbomLkPCorGKitur4Y=;
        b=jb5eGxtV/RzR1XrKqLt1U9D3ttOe2yIJeGb8E+5y7GzGJr3oriyt1fNQI372NZ2v5N
         cZ8gYx4/CM964PcDWlsD1/A4DLx86U0XwMn05bfaPd9RM80KWOUb2hbS5ykfwHbtZg+G
         gAfKmXqDuqJigkMua2Z9m9HoezL+qNGIjC9kvzhITot92lJ2FgxPYPNaTJ2us/9nyysw
         l1s92xdxwEEj8PXXM/LhRL3cHwEF35zpt+IkuDo/f6sDoBYbYvj9jy0PByVhLO0h82yG
         Dn5z4g5/OF4nFBKj0wQcnPYEA/WKM1rgSzFutYQOktu4sbe0a7KuqWGQ5/jqMhg5JLl7
         3HfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY/VYxg4hKlz2gsMC2ecy3WkLUFdI9zIee79XDn+Iri5vuraHfPWMzmNJtrnKRhpsS13nsVDql6YTmn2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGLNDxKIJJGYYzCuxamz9cS3je9M2l53EEYwfQkyiUwO9knDVl
	O7m9Ujl7lLehJJM8BpxV9QqCqgao41RF35CrLtjXUcV/dClyJWs3lJEgCkr/QYbEghq/f94ezTd
	i1OGV5GMvte4BvBUYSyH4ETHcFyva2wvmZMvfI68+JwequhyT9cy/YcR/opuZOl0VlW4=
X-Gm-Gg: ASbGncvKq83LJ1WiArHe7/XAvGpafreJTGM4dYUgfMWXiQNXUyCVoe+zZ4eA+tm1Tl0
	i6ZCRNpJhp5AmCd+Im3S/j+dJpciccHoHY7MzrGhkIsfEkMteX1aQDwVkDUyEeicF2wDAtLtb/C
	jEY6IMwL8OUkoRGkvZcu0Gjx2kgLhJZMv9qi++Dz9+QRLny5Q5nTl5FqGe7I1No1SzBs0f1QnSH
	8NTrCdLcoZqzsatsQwqycn3Fy8spn2Lgg1BuzxpMeLDHXbsHJHip97iFbElCNhQGcUHt9RzVHbq
	LhEdy8fOxpeGA2bBZhJkYL/f8pn8589BgZKyPUI32NeEHrARcqCpmU8Y0mFzduB9ADe6UPxi3ZT
	TvXCsy2/346QhpOjVuZ9Th0zRqcMhKCJ1pKzeK/Eq6+0TAlJsfp36WAvSRg==
X-Received: by 2002:a05:6a20:734b:b0:220:8ccc:2feb with SMTP id adf61e73a8af0-222ecfaf13dmr3665843637.12.1751451463622;
        Wed, 02 Jul 2025 03:17:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKvznRZf+yAxKwVacb6nCker3LzQt3QaRDf4NSJfZpVLxTxkqKzyh96xEJjXaH0nxt4iv2yw==
X-Received: by 2002:a05:6a20:734b:b0:220:8ccc:2feb with SMTP id adf61e73a8af0-222ecfaf13dmr3665811637.12.1751451463214;
        Wed, 02 Jul 2025 03:17:43 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55749b9sm14486315b3a.73.2025.07.02.03.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:17:42 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/7] Describe the IMEM present in Qualcomm IPQ SoC's
Date: Wed, 02 Jul 2025 15:47:32 +0530
Message-Id: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADwHZWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMj3czc1FxdS3NLy8RUcwszQ3MDJaDSgqLUtMwKsDHRsbW1AKoczRV
 WAAAA
X-Change-ID: 20250702-imem-9799ae786170
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751451459; l=1973;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=+6A6wyU6zI45xM0J89Nwmzn/yIxfMgM9fnnSnd48Y0g=;
 b=r2KB83+Y4w26tgvDWJQfsbypajKxJr2qc1F1ZPIaEewOD5Q+unDAtBr8Z9FqQdMKOYcLpd1Ep
 EeMfULVm+4FAXSRsgKaNviPfZGBRwgvqOO+B4muiRYraj3C/T2HxcCD
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=68650748 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=EPM6MFIlYUcrubcLGAcA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4MyBTYWx0ZWRfX3ZWI8F3Yd5N/
 hkjQQiZe5uo3HEBa+IjBZo7N0NbaiO/ZQGA9tXBcPDa7cZQexdc7VnCTbppKpxCg0ts8pAbZ07k
 Y4Ry6f/Us0ARJi4s/usD90VL0LldSthkuPtlNUDhTAG5kY2IM/FFZ0HYacvusMTWCu/OtaRBe11
 7UC0t21l5I+WmKJrs+FGQu9pF4MfUx9U1Q/zjM4/Bx8YCeA6HxjpbjTSA9kEAgdvDMLyOTJnD+w
 0YWXIu6xLJkueCOvWl4kfWmTeLy8mkVp8UzM87Yf4cVy2Q9ZRDrl0W5y6aDqfUx2ErsC60iXf23
 BcYqdZay77xf/ZZhe827Y9gcJGX1j5LrXQHga8A6kvJ1sf+5UJGTNf1AY3n2A/DfGGDwmnIAGzU
 GpJ4RKEVnoyvCuQLPwvCIRXgUryZ80E7Ehb87fTwPfq0Bg3eQWn6WB4ehn3fEQmmdfJJe/Dt
X-Proofpoint-GUID: cRDizCjb2xqRXpvgnFbh6hCElwnf1Fuj
X-Proofpoint-ORIG-GUID: cRDizCjb2xqRXpvgnFbh6hCElwnf1Fuj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=470
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020083

Qualcomm IPQ SoCs also have the IMEM region and used for the various
debugging purposes like storing system restart reason and so on. As a
preparatory work, first describe the IMEM region and susbsequently add
the required features.

In IPQ8074 and IPQ6018, IMEM region size are 0x5FFF and 0x7FFF which are
little weird. I have cross checked with HW docs as well.

Across all SoCs, only initial 4KB can be accessed by all the masters in the
SoC, remaining regions are access protected.

DT binding patch and IPQ5424 DTS patch are from the series[1]. Dropped
the Rob's Ack from the binding patch since new entries are added.

[1]
https://lore.kernel.org/linux-arm-msm/20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com/

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (7):
      dt-bindings: sram: qcom,imem: Document Qualcomm IPQ SoC's IMEM compatibles
      arm64: dts: qcom: ipq8074: Add the IMEM node
      arm64: dts: qcom: ipq6018: Add the IMEM node
      arm64: dts: qcom: ipq5018: Add the IMEM node
      arm64: dts: qcom: ipq9574: Add the IMEM node
      arm64: dts: qcom: ipq5332: Add the IMEM node
      arm64: dts: qcom: ipq5424: Add the IMEM node

 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 6 ++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi                 | 9 +++++++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi                 | 9 +++++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi                 | 9 +++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi                 | 9 +++++++++
 arch/arm64/boot/dts/qcom/ipq8074.dtsi                 | 9 +++++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi                 | 9 +++++++++
 7 files changed, 60 insertions(+)
---
base-commit: 3f804361f3b9af33e00b90ec9cb5afcc96831e60
change-id: 20250702-imem-9799ae786170

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

