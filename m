Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4D727978A
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643684; cv=none; b=ngvlhpVSA8NNQvIyAN3Af8IPr8tU8Ue6j7yoJva3qGJRGPwfc5NS4HsyX0qCRpV03nUKj2VGgwf2guVPAQbNY/yNLs0mVGdFBkia36UQfBJm8/5fEzcQY+y0szenMVQ6FdnY9cf2EOVzJwZRQs5LTU1H0RCvFKnZkzZ9hh7v7LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643684; c=relaxed/simple;
	bh=fZC5iEDyN1WRoOmVWJh9DWv+C3+DDRc/1OmPFIpcscw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2H8gFFgdaGZw6qoME+fTM9CNGslFZapHQrWUlRCWetAMlJ6oCEQ6JyGrqccfpmVSxhVkCsGhz5UyLvUyyvaq2KqmGqusW54+4shGznOQV1Od8p+cNlIv9XjsqQpUq0m9LYk+Fm27NJAPFLe+4EjTa8GoauZFPrtZkz7fsCjL+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPPwF1kx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPPwF1kx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J008pO019805
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/5b1D60mKVscDIbFquf4+neBMATt7Zc0JngQlFyNTPM=; b=PPPwF1kxcpXFaOyM
	bGk5xZqzz0LD6y1Yds15ogk5dQIPwXPh/M7Sf/Xp6/zGj5AxMdZbFQwwB8i/Ajxy
	GhQv6llV+ckJ9tFK5p50mrX3mPz1zmpSejKoiaoWUg2zhjr12wzZqOIjMf9J3/17
	Ngc2dZoglecWKEU9A8WSGJqBoyfFGgZnDE9DoGMUyw6tAKTstLAttrVOkkrw1H/d
	e+3J2TubvdxC5d4/1BT1D9kaTVgJyJlUK34zeJqWb/jLOke3kXt3pGNTIOrhtSx6
	AroQnHTYp3x6Oq9oPHoJhMSnDnBBw1yusv+iwhj4FRglsQKOnYjPkdAjcANBsawh
	ms3pUQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkykrs4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:34:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af5310c1ac1so2470520a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643681; x=1748248481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5b1D60mKVscDIbFquf4+neBMATt7Zc0JngQlFyNTPM=;
        b=t4nrnq1FaFyFEdoLgAl/nYj7Es7yh2i1/PlcKZBPFXYZ1upphuVVeaixIk5rhZT0qV
         JUUx9++No7oum+rOehD5uc9NDVnQ6nN+q+ZN6aZTj/s61XNG0qULx394lha1lV9vwdAq
         4X9uc1Qb5TZnXUHqPEDiAYh1ns6MaSpsDWFQ6GXnaDslU5xdvLjCmU+eRjzbgB91ocXc
         Vxkph7z4xdqIisj70Rr+2R9JL2HSrr2Ox5ym/E57R0gTbNQLuMK4mvgvkGLOCa2T28CQ
         vZWdoKvf9yLOpPA1wo7mevrIe1O3NsynDnWhX5+6XYUwaWCtMIH3oIe3VrSdzHmikY0b
         n2wA==
X-Forwarded-Encrypted: i=1; AJvYcCWlscMgOfSqbsjsPTlCK7i1hm+jkBTrMxnf+OKbjexgiz6aSzroMqVw2mlhZTPdZj+zaTSklfuSQh4D2IM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyifsqxM5otV8NX+ziq3eNo1m7WMCdfLgTT+qU5P3cRi/yWfzYc
	LHb2bgBn5ORFz6XzEdiNiGUPH3JMkv4gJ64+ua7PhAt2lohMoTX5DBQQJTyYI39QPqo3fgF9yxn
	F6Rjwvciq/PWg0WoAJKkyLtX9HkgnEFBg5QfYKYRG3cm9sIb1gByBXtP6pa560AfVVeo=
X-Gm-Gg: ASbGnctOXUHjG91QSgH6shtM/p0vGxzJxfIJ9Y2zQfrPmY2j1MRDKm+XsCPwf6eOToI
	ghFRMGCTDxoqGvYPyQ2OuDzrkvvxQChE5CefxbtqGdIUU71AMKm+RsdsrrSbZyLGLBAIuTaRgh1
	LmyyzkZuiob1xtljWVJD01AAGwGJ5Qu7VKO0Ey8M1AozveQk/d6fpyj16pMeoNbrBPI1+9/sPVi
	qqAciy9vDK2z6Xphm7pD7bHio5KGu2udro4EQkJ/jDd/X2wG8S1t4rYcL+YQGgz9J7nn1CFIJ4w
	LXYrsLmk29WpwmUOsfsoFeGggYBTY9hroXs+uxEFJwsbUkiyLe7Gi6T/oa/oKXWHMv40T+aoiU7
	FM73AH9xblq43gMNKHnS5guflLmO1EJ+BpKB+qfdQn4RWnbU=
X-Received: by 2002:a05:6a20:6a2b:b0:215:d38f:11d1 with SMTP id adf61e73a8af0-216219bd5aemr15696607637.29.1747643681028;
        Mon, 19 May 2025 01:34:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1QQZg5f/JnejbZmIH8vrFWqCqoHDMyJqtadf6lkZXSiF2OLDv4iZwOSQm+b4Pz7CIeVQoLw==
X-Received: by 2002:a05:6a20:6a2b:b0:215:d38f:11d1 with SMTP id adf61e73a8af0-216219bd5aemr15696571637.29.1747643680645;
        Mon, 19 May 2025 01:34:40 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a2cesm5705475a12.9.2025.05.19.01.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:34:40 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 May 2025 14:04:05 +0530
Subject: [PATCH v4 5/5] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-wdt_reset_reason-v4-5-d59d21275c75@oss.qualcomm.com>
References: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
In-Reply-To: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747643657; l=1279;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=fZC5iEDyN1WRoOmVWJh9DWv+C3+DDRc/1OmPFIpcscw=;
 b=Bgjf2iHKk0lwDDhpu/9ynKhNsCD/0q5OQzljDVtG5yvVk6VDs60hLeVXDG/tF7epQZdd44u/i
 Wq+/YSHPFBdBu9zvRIhcplEw6J2GplK3Zb9uArZwi0gFTqLWXFjUixn
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: wtdZm4syHmSCzIuD2wR0Zsra33Yrt40D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MSBTYWx0ZWRfX9lalrJfdi17Q
 kkNNN0c1zMOBZ9pY8cAarLWQHkQmuZ9hMj6o0euAR+x36TVt2L1WrHjqFGv6qzQoLHv4N7A6vct
 o9vwCe8zWdqG7wcyNq1qcs4RxZ4cqBHKPQqHiuJ5Jwp9/S9WWOqpjdwiXuCcOHb6VvOfkQfHZxU
 Gqzm3HsfwNVrsy4e5e+1MW5OhqueWd24em+Eb3ALQo4cBppvxOjQm3ZXFGR3S1M/Q1bB9osNjXD
 mgvg8BTm2/3iX/A8MkNDfj6wTy2oC4TM3CRcR/OhhqimM2yzcf2lJUKqf3jv7valPVRJ41cxczl
 uwhNVPStoXC0CIYHzOsmOonhP5bEnXke4NurGuy/HADxI5Wh6NZSUn1eemt6zF1h/2RwKB8mkoo
 mYBtFgTVGYhvfkiuj1FzJvX4MVM9uP+rTkhjVm7M3acZ4WPJBWv0Y84IaT3ZeyrUkCJsk07l
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682aed21 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: wtdZm4syHmSCzIuD2wR0Zsra33Yrt40D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=913 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190081

Add the "qcom,imem" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
	- New patch
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 4f18ea79502738c2b9cb4b13e8eb4ac4ddd89adf..8952d769dad4ec4635759d6eae8344aaf1d8a79e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -380,6 +380,7 @@ watchdog@f410000 {
 			reg = <0 0x0f410000 0 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
+			qcom,imem = <&imem 0x7b0 0x5>;
 		};
 
 		qusb_phy_1: phy@71000 {
@@ -486,7 +487,7 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
-		sram@8600000 {
+		imem: sram@8600000 {
 			compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
 			reg = <0 0x08600000 0 0x1c000>;
 			ranges = <0 0 0x08600000 0x1c000>;

-- 
2.34.1

