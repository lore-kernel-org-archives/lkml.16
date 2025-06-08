Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3BC13C3CD
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 16:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749398566; cv=none; b=uC/Fma8Lok4TEbguW1RoLgGsjsauqe6j4lXzsUR4oi50X74aypNZX6zoneqQCsY95LgERooDZf396E6SgiFCBrWyt/p0gUGxOp5RLpgjk1/wCObAGbFyBhqlQLB/adDhD1yg51nOb7sKH/oTq4cgqNjpNwq+zzRH/4V6YtLCEeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749398566; c=relaxed/simple;
	bh=ng6vNHx0KHQp00KBBM5YTfXCaoFx/DPkZNehdosFH5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r7JEG5X4drWS3hAoi9lsYWB+GQNXar0MttrwcU0mjqDBk9eUCsvjdwUGASP61wPQyp0lG5PkwXHUMhtWIncDZUn2zceUPtrITM1ORftleMIUuM2ohlKjJEdbl41wIlK9WkDOdWJd92g/d2zMKkEtWJvE7ngdKvD7jj1U+Sbb34U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T4dSIepJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T4dSIepJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558Btg1U026346
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 16:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9ATNhPk0MO+XaN5zIAOr1T
	u9k3BvFkQs+CrUneLW+Os=; b=T4dSIepJg+zjRcQR/an0+K+q9oo7ih/dusXq/j
	txqL4ZqEWsk6hTFisXu4Jk0tseVcd966OwOkAgTnW1P6bN3OxbhRBxt3Lj5yfYB9
	U16F80bvUwFVgXSGLh7pKH7CWH4EMKv1vl0C81gyQRxnqkWKOeRA7TsX4fYdEGni
	dMULL3MZczxWYFAEPEYqb7mRM30k1BndnojWsLr8Cr5hAycrBcopBo3fpcCSmt8d
	kabxcd8xKFzWiLTnszABvP1oPUxjnGBx/A2Hw5szkdNrT2FGfNL2Qva8JpiwpoaV
	C8TIB6p+WO+EYQieTbKF1mpSrV6G3IM3L2CKHobR0FMsmu5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxkdyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 16:02:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2872e57so658251185a.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 09:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749398562; x=1750003362;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ATNhPk0MO+XaN5zIAOr1Tu9k3BvFkQs+CrUneLW+Os=;
        b=Qep0E4bd7K7FGRCLrxmzra3eTrwjcKCbs/9QsAwQAT6qcK5bE9bQR4LZ+d355Cbwti
         DWvHyObhjhTO/7/sYvXtCW6w0e5Si4/tX1ffYVLFwZkP4TI8OfOED3nDqUv2zPB961T/
         1v8AsI6FrLGcIMvtiB40QUW8V+wpDgaCYzz3maDaRpTEh1/EXpUh3ouN45A8Trc9Kplu
         s6PNWc5eByCuRHNIHNd/2jt4Z2EAzaWaCvcEVfEmcvdFjXcDeT6W1azVCRoHHk3k/+PV
         YmY/nSG6ROj/7VMsNPieKBy9ps/htfo52PY2a6TAHPmiUNRDpOSWtei2QXFXUDCp420F
         xH3w==
X-Forwarded-Encrypted: i=1; AJvYcCXd5CPQgoc/tAnjaGSlDgPDSaUDcXBI217UA6cdxgwcVikG8WbwZtYMysbHl81/I4CT6gwV5uYt2mZEJEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhPQDlRcWUvKyjlR2xLKv7HoY6oWl0gMR/IRJrW0gi2iUR5+nn
	+NydcMZdYGL+iaFlGLq2k9ncLwSbty/0vVI+mcF7B6v4HkznLSFZy5vPGbKOogokL+uK6gJJHDm
	JBjUgoY5PvmYkV2OZif3WMng3mFxF3tcMkU3qaWdaZ/eD+/rgnMwlTjId4hHELE2RT9s=
X-Gm-Gg: ASbGnct3uNdu/05JPIqJQlsXjrQV1TBtGvCEPTN8N3yfSVQIqClwtqS6blkFmWcqNnc
	8DTP/w5mVZy1b3NPRA1C+kxnQBBSufY7hT1Ni9wddBpR1wJFv+OuVT3Iv5Q89Km7Xp7gXEvtQQJ
	Yh6uThfmEeeEFmYMR66soEyS+QO4eXGtREn6SfH8W2v2Sr5g7ruYm8Gwd2lnjICi94zQznerhES
	UI3Ml8pOHfulJm+DmXrDrmQ95byY4qCmPFS39j3CZGFqHrzUjUlkfZRNdR6k+mW7ILBxAFj4S2Y
	jCrfHTZkIKKqLoGQ3WaIONMHBOvYFskN/DZZ71Rf8E6PsSRg3WS8qjQWhhrzewwApaDcS075LJT
	t2QRO0N7hqu9pi6sNLu79/mrKQvZXbO50Jk8=
X-Received: by 2002:a05:620a:1794:b0:7d0:9eb1:1b2 with SMTP id af79cd13be357-7d2298967fcmr1658716985a.6.1749398562461;
        Sun, 08 Jun 2025 09:02:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8fKgeKtGSb85mvHWj5RzsS1iI8d2m/fnHkn3JvRKR2Lg7uuaktiqs3DFGMk8j3VXiExpAZQ==
X-Received: by 2002:a05:620a:1794:b0:7d0:9eb1:1b2 with SMTP id af79cd13be357-7d2298967fcmr1658712585a.6.1749398562080;
        Sun, 08 Jun 2025 09:02:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a9d2sm817584e87.186.2025.06.08.09.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 09:02:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 08 Jun 2025 19:02:39 +0300
Subject: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: enable sensors
 DSP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250608-c630-slpi-v1-1-72210249e37e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB60RWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwML3WQzYwPd4pyCTCDLLNXUxCDJ3MzUQAmovqAoNS2zAmxWdGxtLQD
 PG91uWwAAAA==
X-Change-ID: 20250608-c630-slpi-c66e540b7650
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ng6vNHx0KHQp00KBBM5YTfXCaoFx/DPkZNehdosFH5w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoRbQfyByvTcv3RPTDiXBoe+HGLQlHWzOyatmO4
 f6W3Nl758mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaEW0HwAKCRCLPIo+Aiko
 1YrpCACT8mm+n6TRDm6FoBnWCoe5Y8x+4SmA1H9PN+6IQ7EDp57y6AawwQyPWsQ9tOEf2YPt2yh
 VghEMxfZIgZfxmoGusYPpW2x2FpRfH0HPzwLluLZtYehJPO/SH5FA+c9M4WrRJj6zUc/bfn7dC5
 I5OshobJlxDMCraJv+1WQPtW2HPXejcAZOuxiVGoYvc9apmYGfNrB1rUN0XOuCcx8GzVSS9dyTT
 bhK7oU5J8yRiC0bnc18pcxupT0eEWsHOa+fTIT1JusZd/Q31NBZeUATMZ6C/Cw1RoxKD56M4WMB
 bFByxPtpZ53dLtE1t5rmH244/p9sncQTpfMMV0QFuDnAkFs8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: fI4AyryVWTfASgwUpKnbWMjkhDoe8Sr6
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6845b423 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=qEs0HanwUspA_dS0iFcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: fI4AyryVWTfASgwUpKnbWMjkhDoe8Sr6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEyOCBTYWx0ZWRfX83sZqgRmu649
 LMfMCs6aGGTswhPBbex0YabvcGMBcvWUvw3I2AkFLvPt7jtpEO9q+H/PYJdnpXhf2diqF+YsbvX
 8ApV/h51GEI5J+LDtY14/HDyq1wF/eqDdyzuotJTl6/+eqpvAWzzG+6eC3A6mv3GS6fyvVd6AoQ
 ZifEiCM6s8F8ksAvNlLXrDCcnDEIXpzEyfBxPKp/fdtGdFKrCM3IdhU6f1W7tP5imM48Txf5Dad
 9XIvh5g7/7cC+iFWX5g+P40uwcfwnlOnVuoShYP5TIftfSq0JzaobQFIRzu11YGSw1m4zkXW3ek
 qWb2N6mHPG3FoOytUY1ncdwTeJaPfjY3ZPIoHs5CpMki9iT4vJoQJiZqyIOieiOxYPEJpe2Izsh
 NmNkl0xhLO/D/ADoC8VQ1ilX2/MvprCwdfMoWIaUuLaFEfTOLQSeuN73RiVMLAt4EBKBzSIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=900 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080128

Enable SLPI, Sensors DSP on the Lenovo Yoga C630. The DSP boots the
firmware and provides QMI services, however it is of limited
functionality due to the missing fastrpc_shell_1 binary.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 3b28c543fd961c787d7e788995f8fe0e980e3f68..8ef6db3be6e3dffe4ec819288193a183b32db8e8 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -624,6 +624,12 @@ dai@2 {
 	};
 };
 
+&slpi_pas {
+	firmware-name = "qcom/sdm850/LENOVO/81JL/qcslpi850.mbn";
+
+	status = "okay";
+};
+
 &sound {
 	compatible = "lenovo,yoga-c630-sndcard", "qcom,sdm845-sndcard";
 	model = "Lenovo-YOGA-C630-13Q50";

---
base-commit: 4f27f06ec12190c7c62c722e99ab6243dea81a94
change-id: 20250608-c630-slpi-c66e540b7650

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

