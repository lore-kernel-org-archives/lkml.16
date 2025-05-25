Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD9D1FDA82
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 15:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748188481; cv=none; b=NYBVqDEI3KLYD3nXqT4I3kI/h1WvoAMsmKq41PHWerecIS2W6jIJYZyYZzWGYp8lqTqh93oD8lYa42eOwD0ZKANJiytE6P0am8UGq73FezhMn8JMfg2l4oPaSTKrx8JiPWV84/LX8HyWWjyymZvUEjsAROSu4YArNGYr1RHlgtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748188481; c=relaxed/simple;
	bh=4OVsYXvm636kbBfiM8ZtZMPfRfHbcvvJiwYtG056HSo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TFyr2Z6EwMNDQskWBIDmjHHt6XR8sE0KTqLjeYwiB33QGABEnRVy18NdZiDUIm9pRpMAbepRWwXsd6s+SNiaT+A5x1taGAV7JC5kKE6CHT/Cpb9mVt2Zolo5tDrIn0/dVbDIdrWKQPGzocAU6R79DoGnnAyTBpYJQLK431wWFiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUVdNVu+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUVdNVu+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PBs49u029749
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 15:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dzKtiHuPNOm
	ylJT7507aK6lLExsMbd+U+1mGsRH52yI=; b=LUVdNVu+uWEigsw+yKr7sOWwk0D
	W0Tcnb7IZp3mDbPHjhLpWDQzZPFa6t+a/uigR1jMM1rId6GdcWe1GULYxKhXHPPS
	8Ymn0SrrbCTC1149z3qMqcgaywIX5s0TdNbrQ3KxlyAvk1BTvZIPfgEYrNO/2GN6
	mPD/Rws+GIkYVomMj8JkVNwMbSB1ZIBF8yYFFpdVObFPcPP4myLsTW/JUIprTYU1
	KLkUcz2tAMeCg820GKE/T2gh07V9jLLHYxDhmdKvOOU73l79pBkXFhqzpsWMm7vx
	wUxT2v2sXZURYEwlOOu1yqrAvQcl3HUkz2FcEZWlFFNt7sBHIb64EJq2pxA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjj3f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 15:54:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7377139d8b1so1054180b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748188478; x=1748793278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzKtiHuPNOmylJT7507aK6lLExsMbd+U+1mGsRH52yI=;
        b=czizkZiz3cy+JLfJLEcBTbwJklm2iOpPhRRhf/koSJu7Pc7nNA4NV4wTVpRfLYjir6
         G989JhmOooq9gVh0T+/vSGNXsXX5JVxYhw2i5mRW4do5lIM5gznpK+7YWq1W3k5gRyXa
         YoGPodxVR0lZUNsGY9jwbN4290va0wnM5jiwmEsrGw4z0fNdXi3HGCk1feYdIcg07T1j
         E+umYxxa5aZr+EDCpI8+I7AxUvy7i/2CTHMnzdiJYGD46gGixVh25CJOZ6iJ1FjGlI8Z
         D9jmXQZt4tqIUIzEp9nUaf0PElLzGiHM+MNgmWGRvIfmP/OWo3Q63ZIpL88OzvWkGbMk
         J9PA==
X-Forwarded-Encrypted: i=1; AJvYcCXG0aTIfIgG6HfvMWnr+5I5hVubDDo2LRqFLqD1qLoO2gMZ5SD1qNgX9PhNtszB9uUHCFq6iVluGWpqquk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx89COGyhZk4hia+//z0Bpt2VW4pg19Vm1mLls9fOytRUd239U1
	5xXgPsxgUReUN6lR6BTI1ARIcEC62Z2UQxA3eoK7XzLVIXtK2j15eXwokkypK9O1BYViW9J9YVb
	3btYOxqSu6NikDHo7wvohYc2ZYVATamhT1eR02FunL+oUfLRGeCIO0FD2FB99NXj0D78=
X-Gm-Gg: ASbGnctrPE4FCVqDX8aHCaYSl0n7PILZnlz5C3s/19WJutrwiV10wroNRBgg0Kn9fG5
	SwJspxXGLQrBX0DMSIrbUcxZIygS5RIrI4L/KpRZQ2VuR/Q64SR3FrRo8EEl89sIdrzhsUCcyCq
	lkIr1XYRk2OPTjedE3X1Q/jWQxDqsJKICHe2X5+3hshVTUaG4sFU01/Z7Es+3DVb950UQY7yE0H
	8CMJE1i1bmAGf5P9smZDSzlTBZFgWX3p4D3xG6cV73sWILjs16pI7hYOtk349KM8UiQpVCfXXeo
	fUMnAb63Q3sndexvBj5t5rMJlXiJKt1gAxUemZjW5+6fP2My
X-Received: by 2002:a05:6a20:2d29:b0:1fe:5921:44f2 with SMTP id adf61e73a8af0-2188c299622mr7316871637.20.1748188478501;
        Sun, 25 May 2025 08:54:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFbB1JBHwonHEw+3UCejVEIzTnXDTtiBR04Gpp+fm7aF1mb/Tj2DYxKtm9QrJvSgbPFF7PUA==
X-Received: by 2002:a05:6a20:2d29:b0:1fe:5921:44f2 with SMTP id adf61e73a8af0-2188c299622mr7316856637.20.1748188478066;
        Sun, 25 May 2025 08:54:38 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96de11csm15634488b3a.31.2025.05.25.08.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 08:54:37 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v1 2/2] arm64: dts: qcom: qcs9075-evk: Add sound card
Date: Sun, 25 May 2025 21:23:56 +0530
Message-Id: <20250525155356.2081362-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68333d3f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=mKn8UeLdGVDd1___hkMA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Cq_kMKJZzYZ7sQP_rqYGIVgmCr9FEvPC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDE0NyBTYWx0ZWRfX/S0Z8yK1yR8Z
 XHbv/g7R93aonNVbkbMt+idfrmewDRdAssfAIH3WGCdFmAG9l6YgE+/A1cDU9+Vh3V17aak5k/M
 xIC9rv3kPEqSQ9tNKMFc21PxlHcX89JMtz4VGSqej8yTXVGW7YRS5SyGWtngD5ecYBprv68arrD
 O4eVcTgSUmQSxh692lw6pr5FvD/hPqx6ncf9weg4T+hCVFTziumG7I3jrJ5NMeAEkl7upfTdSlz
 ErFQkRNUJYk7mwb1ETXPafU4L8aVTNQHn70qDV4h862oBxovhvflEKf1IpvfLWEPayACxg5fg5k
 HUbdlnyJKHkkBavr1NoeIEhKmJvS20+nh/oTdA6OQZwd3LsdbSVTlc7M4tAUSzHSu2Ty7lthsa7
 i7wLYt+r1R3PHD3x6+TaOrPsYwX/+YaFqnusL1IZRt1SfUknqepEJ84j3UQkaQHcpkdF/xYu
X-Proofpoint-GUID: Cq_kMKJZzYZ7sQP_rqYGIVgmCr9FEvPC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505250147

Add the sound card node with tested playback over max98357a
i2s speakers and i2s mic.

Introduce HS (High-Speed) MI2S pin control support.
The I2S max98357a speaker is connected via HS0 and I2S
microphones utilize the HS2 interface.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 14 +++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
index 0e44e0e6dbd4..1ebf42b0b10e 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 
 #include "qcs9075-som.dtsi"
 
@@ -20,6 +21,57 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	max98357a: audio-codec-0 {
+		compatible = "maxim,max98357a";
+		#sound-dai-cells = <0>;
+	};
+
+	dmic_codec: dmic-codec {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <1>;
+	};
+
+	sound {
+		compatible = "qcom,qcs9075-sndcard";
+		model = "qcs9075-rb8-snd-card";
+
+		pinctrl-0 = <&hs0_mi2s_active>, <&hs2_mi2s_active>;
+		pinctrl-names = "default";
+
+		hs0-mi2s-playback-dai-link {
+			link-name = "HS0 mi2s playback";
+
+			codec {
+				sound-dai = <&max98357a>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		hs2-mi2s-capture-dai-link {
+			link-name = "HS2 mi2s capture";
+
+			codec {
+				sound-dai = <&dmic_codec>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TERTIARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 187a59e29f59..23dad329cd74 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -4536,6 +4536,20 @@ tlmm: pinctrl@f000000 {
 			gpio-ranges = <&tlmm 0 0 149>;
 			wakeup-parent = <&pdc>;
 
+			hs0_mi2s_active: hs0-mi2s-active-state {
+				pins = "gpio114", "gpio115", "gpio116", "gpio117";
+				function = "hs0_mi2s";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
+			hs2_mi2s_active: hs2-mi2s-active-state {
+				pins = "gpio122", "gpio123", "gpio124", "gpio125";
+				function = "hs2_mi2s";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
 			qup_i2c0_default: qup-i2c0-state {
 				pins = "gpio20", "gpio21";
 				function = "qup0_se0";
-- 
2.34.1

