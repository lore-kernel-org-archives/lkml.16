Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEB4253B7B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451483; cv=none; b=N3vTZsFF676uKeKze+ZCqusy9tzMmDtzjLtdcMj9xzy82ka21BkiwZp3ZhqgQNcARLTClskxvNzw2lC5NrssysT5RptEaeAixbdqc5fgrcGmAaFGuxa73QjlKctaXHiFm5CxhYMwEW2SarihA6yaeLEbU/LBZ1kl9FkTXq06aZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451483; c=relaxed/simple;
	bh=BChmyNzrbptXwc79lffspr6OBkQ+ogUUU2HgUK1XJhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BHNCJRb5GJUns8UyZ6nuh0ujpPA5H8rP968b6Hsab6uGcNwqwRZBtPU31X+WxaKefP6lwLprl4b6Io+ymsVw+ue7ydrVkj8H1ZNZU1+wQGo6Y8sOcToFWZuP8AP/M9JpQ91YbApkhdXjdeD8MK7XEAVCCqXqkQgJlTJTC3X0DmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bk+bvhHW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bk+bvhHW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562AG8FU022671
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 10:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GoXuhL/dpHUk34qN7MYe65pVIfgaZ8Idp1jgX88vXd0=; b=Bk+bvhHWKE/hNC5a
	5XdNb0Mr2CNw7bN8bGkCATv9TDhmb2lzNSqXuR66L7iDj8/c893mzdwIjrsfOYRQ
	7lQB6xctdX/x1+kyXj8+hpUzTPhuJ31qCQlEA7JVZ6Erk1jEqrc3aAvJck95gN//
	HT3zqHOMMTiReEICvLS4FqTQW7DNXz41aAY95J0IixPq1I/w8ZmCP+W4ML5Ji8R6
	EXh2HaRxfzxICQRAx7py3+hekYTlnhnqgrve1LxQ/EQnCS3aHKdNL/tJ2MyGV4/K
	SN1jTOOW+NLqNckuf12NyFo8xG+7KABjJiygzVypMV77U3htOZBcJnr4trpSXfwb
	8Tfo7Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn2w5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:18:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7377139d8b1so3560017b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451480; x=1752056280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GoXuhL/dpHUk34qN7MYe65pVIfgaZ8Idp1jgX88vXd0=;
        b=KfYhNvP+v+yVf9yNa8+b7z8AV8LJgGXBsFfASd9UsG85sfgszcfvddDNQoRWT1jk6V
         HLifVGJzskIR9njAs7LOu1qot4sVFlljwkBFGqbQahHEJu+NPbVi/CLsII9GW/tJaiq7
         RktNaA9vue6+5ZYc0XI3aUK+GMhwo/CipAJrZ3lf1dHBlqlTFTo4tZBqRO+Wp5S/aAUd
         X7rAHbhxEVF45IzdmjO09BHHpIwhQAi+VYc3VVG6P+c6aMqE5H11j9elOl29xU+3A5Pj
         6txfq8y/DcvKZkkvx1lUrGVphhz1TLLUYNec2jowwSSmDXBi82+jP3Hg3wGm40M/UWkE
         ITtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY42E+jZjQCrhVJd3ma3ifJ0fyuKNp68Y/SqPWpW16Ck/tmngSA2KjpRJ4fU60pjnjH6YbLXMoOGsyT0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YykBXE0J3GBcoWzZ5q1LvzvS5l3pIXg2I3qzPzFmV9Bm485ZUkV
	DyYpe1vznn8LSwhby0K8aYMUHUJnRO5uvL54YNeaNB/vO9/Xm0rp7P+qkgIwjH0iyGvimffs7ZR
	DBt1mkvFcWH7XJId1T7CTU0+6TeVHFM8xQFWDq6Zj7Xoot3c7EbtQbYbwQc6k4jPQ1+w=
X-Gm-Gg: ASbGncshDrC8Kmw3QOKE2WvwN84yk0hVVX/m4hRdl9oIwGHWhZk9LGzLxrGTVvucqZW
	FQd64kuVpCsQUMP36Ruaz7hbvdYzVWcwY77F7ieQ+gi+UBm9dKI98u0TiNDar2/DfJ4JGwu2cCw
	2Y1vUcNDyzdIZ6oNzpmd1vZjwc6NoZ5MUlKgV7PAklnKyvmOV5BSkNZcIiTgcoyPy9UhqoSh4sH
	TNsc17MSxrMND3y+vhEMYXk4U0uexBGapd/3r3VXj/MSAQJ9cHwXlaK++4XHDslTciibQv+Ux3s
	Xw62qBCcUAV5aKl9Mqikl70E64RblTpsLFjMxYGhE4FXc24BTcEnvM5wYbcPlRP9NEiV/JusyWc
	yPiUaCQtL3c58EzwBL/N3U0JdhOrBYNhcX+exlaJ+hIKotKL0HCU5eNJzCw==
X-Received: by 2002:a05:6a00:14cb:b0:748:e9e4:d970 with SMTP id d2e1a72fcca58-74b50ff200fmr3190965b3a.1.1751451479832;
        Wed, 02 Jul 2025 03:17:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXcFfdkHx9AghU20rt9aF2VMJWcy10rwNXrXSDxqTM5WskhvWbDhoL+zPyIhIRnCB+hqfXOg==
X-Received: by 2002:a05:6a00:14cb:b0:748:e9e4:d970 with SMTP id d2e1a72fcca58-74b50ff200fmr3190943b3a.1.1751451479436;
        Wed, 02 Jul 2025 03:17:59 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55749b9sm14486315b3a.73.2025.07.02.03.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:17:58 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 02 Jul 2025 15:47:37 +0530
Subject: [PATCH 5/7] arm64: dts: qcom: ipq9574: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-imem-v1-5-12d49b1ceff0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751451460; l=1171;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=BChmyNzrbptXwc79lffspr6OBkQ+ogUUU2HgUK1XJhY=;
 b=WGerw5DWA5FvQ3+7xGczckFhDI6J1ABa6E1jUiK5UBXC8LU6UwB3V74s9GL6Ipw9G40kBgP68
 l5nkVn7VkeiCQaaOKDTsds70aBcrvGYn4Y3FwtxphWlF5i8xbABSxf/
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4MyBTYWx0ZWRfX5RK6rqQ8byNk
 UjOiKqMvZYj6PNipgr7YKUWZgK5Uh7fi4ePxFIUfhl8paT0jsYPn8iSho0vhyH0QE6X5WdEh9am
 KHRA5m/POdDdk9ccz6RedLGHq2fdczwLnxYV/2bEsUBTNluTdVbcxra+51I7eIf5A07tBj4U+PH
 d9E5Xjtwwr7eyZ10l5/cef//Km38M9Pa2DoBMT9y7ceZJjDg7SKi3uMgkWixigAH7TsUkDc7fFy
 gkOTOvskV9+N8Bn0n8dV6zRpXNog9/TTYSCZ/EGaryrcPa4uFCMG6kP/UrvGl0kr+PXDYnosVZy
 RCSFTRyoDrBDSU1ufUp+tXPrvOKO+z85s07MPe9kh+UXOJKeJp/M0n2KBTce03KaFRohAxggRYv
 vsfy6poJF1S4C2CRBnQ4Mu3VGN5scI3ReOWsrOzLu++h1i9fOgQaw0Xef7+7jFtJWt4E5Ugh
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=68650759 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=g_gtcTFTaut2jdyMrvoA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: FxPUxQgY-kGsL73iBE5cDY22h0AWoYN0
X-Proofpoint-GUID: FxPUxQgY-kGsL73iBE5cDY22h0AWoYN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=767 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020083

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 32KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 815b5f9540b80e91e81e02a97b20c0426f40b003..2a42e8a9c79274f2b983d31e0b7b587ad524b211 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -741,6 +741,15 @@ usb_0_qmpphy: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq9574-imem", "syscon", "simple-mfd";
+			reg = <0x08600000 0x8000>;
+			ranges = <0 0x08600000 0x8000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb@8af8800 {
 			compatible = "qcom,ipq9574-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1

