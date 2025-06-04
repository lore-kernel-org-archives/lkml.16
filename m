Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3B8224CC
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 06:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749018454; cv=none; b=AmauHJBgFsyuOyb/cYfPneMq8d15OaRIIrj6gEcfu7fms2DN+FxeoOLXyyMWFPDFJ2Zs/S8dKYh8dBOr8ygPhfsSZaWMjvaYnjIuzMl5itCbQnoBmdPfEnBqwdMxx/CD3ns2P1rkd5Ii93EJlzUO2lBjFXbhpvvEi5BRAjYXtnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749018454; c=relaxed/simple;
	bh=S+Vr06DNm7YB89ZupCnoEi5l0tnbrL6S5BIihirZLd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Cj7oB4jIZJZvTJl/c6K0sXM1HdeWWjk54C8ftR+J826IRYG03wAMjI2Ae2j41doxJYJML0KLJK7u2uYpM0aHSu5MwbXABNAldklE2t5TSQakBhE3OJklZdzysD+yxfnXIMkfRBZMu0IjhRWDBtGnAnEKA1Y26VhtAyjFFZaenig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGRO57He; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGRO57He"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553KkbFW027442
	for <linux-kernel@vger.kernel.org>; Wed, 4 Jun 2025 06:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i8Jdnl0unu1Ugmz+Sny018
	vDTajWqp19uec6eBvnv5o=; b=pGRO57HemMVI9jKKIFfzdJxIBU7eyj+kYIZX1R
	gp1IRNLfkjlAymdr6hwEqUM+UnR00MnqNBES0XEDDxnQduHClljdKhRXIHHEs8VB
	ZIdE2mJOpcUVnZpv4BE7apkYZPVGKUd9jh6pZCYTvlj+FFeDBZgPQ0QrYz5BM0Ak
	4I2QUUC68//oG/ZEBoWo1/G7pyLIa86OdnDCjVryQSPXcpOQAjI90Vre95M603tG
	OSjBttUZ2soFeriZq9+DCzXmka+FLeOVGFZvj1lJxjoh/dNpwENbMtRD40mKzRSM
	AFAMrAbBdRCPZNVXCPy80EAn1lVadP1uLzzNdwxjg5sFOQbA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t52s5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:27:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af59547f55bso3854916a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 23:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749018450; x=1749623250;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8Jdnl0unu1Ugmz+Sny018vDTajWqp19uec6eBvnv5o=;
        b=DKvJHcKO/SOOscUgP/Sgog5f/DSCjo/wq0pgct07NmYVsIYMl7vQpM/70mH5r8B1aZ
         /sVgQ8LXCAsi9lVUIBz+IPZ1KhIaSDIJATL/Lal31Ej9KM6i7mPJ6Y5Rwp0mBQCg2fSQ
         87rn5F82lBZncUJpTtshJGKdBRpw+rrVX/YWgNVZEq+yzQvJNl5QGVNYePwKUNtCiBQq
         9O6AZjlbfifZ2VBW1xXhML1lETAjOlBv+t5tIBRCLfsP+/DYliOn8f/Lp2u58gO0ONio
         66V2uzZwojbrhmSUo1oQ9O5+ucRaFCAh87dIhbMGu0vXGI5/YoYKYEpemy7XOeEhcKuj
         AJVA==
X-Forwarded-Encrypted: i=1; AJvYcCWLPn7bz4qfVSEnmOHokgehq6iLiam3J48lRyxxJ1qHFqQGn1K8LOm8RHl41xLEAbfi0PjAPhAgYq7Is48=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoHpHX+67GIrXN1zp4b7gTA3GumL0afQ3iqnbCXsVv84QqG6WK
	cFx9VN0pUhpaHS3FUhLDRw30aqtLPbARGmYjVO//Joe40oxNfVUTnktkUZmOJzEBTciq+AVENjG
	Nhinel4Y7yUg5FTPFMriIyv0CuA4s1l0e7oTpqQYsPeJdMYiJ5lpmtW46pGgeI1aSs1I=
X-Gm-Gg: ASbGncvdoD6YwOvjnd9U9f1kyMO3fJU621Je3RbpP1bd7RCBCbwVf/T5A6qhqJXebKt
	Y4uRJzOc19/3CjuSCfPvIEb1ZwAYl4GSQ1Td0HYQVEbE5YIBIFkS0NJEmX909L5hoq1s3fBpSVh
	RzhXe2Zhvof/FZcLbUkpVS0e0AEsTiFBJvfAJFcZQeR6RgMExg2Xh/OAuvkb5GhLd89blIIAfPd
	u0Tq9TxyhJisE5jgXIvkXuTgu9XyDzPFtIn4+v2gKoFom3S0HleGXjAA+EnoaptHyCS4v++2Ifr
	IA4iBQDSp03HlNDtesdKDKtguBE8rRlwUEFDzaYrTw==
X-Received: by 2002:a05:6a21:a8c:b0:1f5:7eb5:72dc with SMTP id adf61e73a8af0-21d22a6cb78mr2708323637.3.1749018450406;
        Tue, 03 Jun 2025 23:27:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtTUwNbIkJQJC3mzKumJbHlzqEtns/3tOR6yrzopn28l0jLbp3v8hr1YQAE1z8rStZV2svvQ==
X-Received: by 2002:a05:6a21:a8c:b0:1f5:7eb5:72dc with SMTP id adf61e73a8af0-21d22a6cb78mr2708294637.3.1749018450037;
        Tue, 03 Jun 2025 23:27:30 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff70b5sm10419995b3a.160.2025.06.03.23.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 23:27:29 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Wed, 04 Jun 2025 11:57:22 +0530
Subject: [PATCH] arm64: dts: qcom: sm8550: Correct the max voltage for
 vreg_l6n_3p3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-sm8550-correct-vreg_l6n_3p3-voltage-v1-1-18cd01a69ac6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEnnP2gC/x2NQQqDMBAAvyJ77sI2aUT7lSIS42oXbCIbCQXx7
 w09zmFmTsiswhmezQnKRbKkWOF+ayC8fVwZZa4MhoyjlizmT+ccYUiqHA4syuu4tXG0u8WStsN
 XJUze9N0UyPQPqKVdeZHv//IarusHYl9LuXUAAAA=
X-Change-ID: 20250603-sm8550-correct-vreg_l6n_3p3-voltage-cba298bc0294
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, david.collins@oss.qualcomm.com,
        jishnu.prakash@oss.qualcomm.com,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749018446; l=4308;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=S+Vr06DNm7YB89ZupCnoEi5l0tnbrL6S5BIihirZLd8=;
 b=JJpUElkUFdjfrIHZKxSvhqXVXiczcVEXM+2ZUYp5bPJ6TDP9u7M6y81kHuSsoA3y9ukCy6i5S
 aQU+foMz4dDDwJNmp2mKlMwSUISqhbq7Z51r4QUPWkar8gMG80kXsmZ
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=683fe753 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=G29jiHXVfx2XXIaXbRkA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: fnvJhce7wKcAI8ysUnYFfxtwYvHSn1Z3
X-Proofpoint-GUID: fnvJhce7wKcAI8ysUnYFfxtwYvHSn1Z3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA1MyBTYWx0ZWRfX5svdEwDjTZ17
 xURva3/aSXEZvxhmOSzGNLep5QMb7wihDKHBsWwCMxROWNVHIePovDM0yLBXpaQdSCGuS0sEW0k
 qVYEmglWs31JBp1n6Q//ebx3vGoq1h6OZm/0hmuEZl5FsnXraFLJhh0UnruNRY0g6RxHGGXGnjl
 iQlyIZdSLpkCUMWg3YTIhtFTBy95Fbf9//2NeBkZQCYoOPoW+7lgFp/vRieL03lXWujPMI+6hMN
 lCMyao4xkLU/zJtahyzarx8ewTa4cp96dyo7+B4aWQ3ur8CFCVq2/UClf/KRJFL7iYpH+tlkLf3
 uluwzzaOVDkH95dsZ8OlJFB2pvMqDVrduoIEaicobFtsmR3wxLhGbnH4qbhradqmHA4an8I3Hb/
 3lcpkyOXAbPBLGwJqUItwAnlKw7KgQ8YYjVwCQlPqTUmhjegL6fXe+20evnXs2DQSkAF28EB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040053

Voltage regulator 'vreg_l6n_3p3' max-microvolt prop is currently
configured at 3304000uV in different sm8550 board files. However this
is not a valid voltage value for 'pmic5_pldo502ln' type voltage
regulators.

Check below the max value(3200mV) in the regulator summary for min/max
used as 2800mV/3304mV in DT:-

logs:

[    0.294781] vreg_l6n_3p3: Setting 2800000-3304000uV

regulator summary:

regulator     use open bypass  opmode   voltage current  min     max
---------------------------------------------------------------------
..
vreg_l6n_3p3   0    0    0     normal   2800mV   0mA  2800mV  3200mV
..

Correct the max value to 3200000uV, so that it is aligned to voltages
allowed by the regulator.

Also, correct the phandle name of 'vreg_l6n_3p3' to 'vreg_l6n_3p2',
so it reflect this change in settings.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts         | 6 +++---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts         | 6 +++---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts         | 6 +++---
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 29bc1ddfc7b25f203c9f3b530610e45c44ae4fb2..fe46699804b3a8fb792edc06b58b961778cd8d70 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -857,10 +857,10 @@ vreg_l5n_1p8: ldo5 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l6n_3p3: ldo6 {
-			regulator-name = "vreg_l6n_3p3";
+		vreg_l6n_3p2: ldo6 {
+			regulator-name = "vreg_l6n_3p2";
 			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3304000>;
+			regulator-max-microvolt = <3200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 5648ab60ba4c4bfaf5baa289969898277ee57cef..1e95a2849146e3eeea9f68085ac504e32b63fdaf 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -624,10 +624,10 @@ vreg_l5n_1p8: ldo5 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l6n_3p3: ldo6 {
-			regulator-name = "vreg_l6n_3p3";
+		vreg_l6n_3p2: ldo6 {
+			regulator-name = "vreg_l6n_3p2";
 			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3304000>;
+			regulator-max-microvolt = <3200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 3a6cb279130489168f8d20a6e27808647debdb41..5a33d7d7ac923c7c0bf6aeb51d0db728e65883ac 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -700,10 +700,10 @@ vreg_l5n_1p8: ldo5 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l6n_3p3: ldo6 {
-			regulator-name = "vreg_l6n_3p3";
+		vreg_l6n_3p2: ldo6 {
+			regulator-name = "vreg_l6n_3p2";
 			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3304000>;
+			regulator-max-microvolt = <3200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index 7d29a57a2b540708fa88fb59e821406f400a3174..073040fbd7ba215169adbe3862d3e1f6d2c786e0 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -485,10 +485,10 @@ vreg_l5n_1p8: ldo5 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l6n_3p3: ldo6 {
-			regulator-name = "vreg_l6n_3p3";
+		vreg_l6n_3p2: ldo6 {
+			regulator-name = "vreg_l6n_3p2";
 			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3304000>;
+			regulator-max-microvolt = <3200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 

---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250603-sm8550-correct-vreg_l6n_3p3-voltage-cba298bc0294

Best regards,
-- 
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

