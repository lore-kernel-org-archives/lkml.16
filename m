Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9B8188733
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745605579; cv=none; b=Gyn4jGysQUd8Trwxm1zXUPNO1THT6LYzeWKSxUC89EMsTfFrAV/Y0S8K8xq94LYg7owB+QGsVh+vHuA2A9YppwR74Brgd/yQI1WQ4DNYgwSRidwSobcdw68x7+Yk8IlpVSM7AfGNaFb5VISEXk2HwK0hr3GohF0symZLJx0NVBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745605579; c=relaxed/simple;
	bh=fIRoJX4S5ilpbY4+PpxKBeLt9aeK6mlmQLAqJR6NZGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jh+DpIKyKYxeliHlihnO307AkWPl3VADxttzICDUfAZPxbqRbMDTw5tB2i3aZ721atQmMNesqFr8APOoz0CLsYrVv4O083DO942UBjfxk/stJIWF1n44Vt8UFagVp51nBA0LrIMrHJ56FqlYrC5q5DDBSqDaH0of4yqa1TKkCds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cFjJ39lB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cFjJ39lB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKdkA009754
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iTf0eTju8AhdldSk3iugBG
	1AWTCA5CquJHTdDyLMUtM=; b=cFjJ39lBj9ONaV5fKD0BDEHniPizggPtr//DTT
	ms/L2plCg2BEIx/37VVjMZ4NlnSWbvz4u8ET/kkGv4IrWRgmkrWTdITySBvElN2u
	h1mDmGLb5VbdWHXaJayQDRirO5XcMOLuUG1AqI5VNoCF5zh4xo/11q3t+YYr4TK5
	dwq/gXJktObtnSse1mF0ZmLVdYfqk4SU5T2cVtc+xxdbT1+09wWpNDXgX8EMGb35
	FRt2Meu3LlACA10EXbuHtgwa4femyO7Z6lmDiUC+35z2bL4Tk+J5dMrJsFa6+FeF
	xCfT/6qNvwMGkhSeO4I0S3wRWKDA5r+r2ZFlBuJcNRqF7VvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2j1ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:26:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5b9333642so320366985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745605575; x=1746210375;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTf0eTju8AhdldSk3iugBG1AWTCA5CquJHTdDyLMUtM=;
        b=m7lyffotJ4jK9jxnYcx9cY9vOY8IUwLwiDetbytJNR+JTknOTbdeX27pK+gZOZ5WYK
         fJKCByUB256mf5MfMflqVhoxAu746MBfXVPySqNE2AhVhGZ93fGwK9hF020jW91LRSoD
         lSizk6lHN/EUf0CE02m/jNCGMRHJx6hR3M7TWHzDHhSJNTSWc1p5bdsBRWJoNrT7Chhd
         hHQG0r/k7HLjwwGMpDPQfyrWcB83kXthpDsKW8JJcu0I8owh+N+MgDpu5+C7jAueNot/
         8uT4JGdEaUPbgi5tUrHTJN+M122dgwdYZVJqrwt+fQBagBkvIW/1sRmoaRbXcbu10gcO
         ONBg==
X-Forwarded-Encrypted: i=1; AJvYcCWHEMLH78T+HeZE3sZTW7v5rLI5d3N5rmz65xmdALzV2ZQQRlIkcxJqX+sivxXzDV0aCrlWdZICO6P3a5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE0ln9r62ZjhxPtOBVFrn7WEB3XX7v0SIpMEZ2Xyq7T6bXST+v
	5CxsDaZvYK/8jtS/qIJOdlJbQkC82lros/Ugb+M2FsvQ7i5tyVHm5SvB/BWaRJqcPG0xiKvZg9O
	armb56uoGt4AcCaKK3ueL5Y3uAS2EKDj2/N042jRXwEwiFXy7NcmPzIyVHm6EX0fnb+CPj98=
X-Gm-Gg: ASbGnctpPlgtszCFJHptc5p+41rIslYJ+SZCQ+jerxeKK0h2brqaAEzpO8i2kEAu4V8
	xOxtSD+LsLzM+iuoy9sHx0K/9WZnTaqUaWvbEjb3ldUcmErxfx1Zbf0s0pkk8y345hhyLuc3auA
	ZHziFJujVrQQeTNupy3H3FoxAQAgHn8znDLTCVYjvqtAad3DwgIcjFDCxrQZ4CCDvNnPJKKBg3a
	A0fPEKZ24PDMM5VWsaWkr4+wO0cg8dhXfx0HONjBHSxadxkFOUMbUu48hNQIQr+pbxsitL3z2xZ
	BZKDiuK1Cv7MnRVAHeKQjlfUBdtNskUYA95HiPiHb8eIVl2B5FOzYK5kxv7S10CMPvsdA+En4Ye
	t8OOuV0/M2jotZQWSlggJQlqU
X-Received: by 2002:a05:620a:2801:b0:7c5:61bc:70ee with SMTP id af79cd13be357-7c9607c4910mr572636885a.52.1745605575561;
        Fri, 25 Apr 2025 11:26:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKTT8iNwJMqOoXmU9Ct65fjeYb1IBbAiPUFARnfTtNr/hq4nYc2aLjPKTgfPVULC5dkYTKjQ==
X-Received: by 2002:a05:620a:2801:b0:7c5:61bc:70ee with SMTP id af79cd13be357-7c9607c4910mr572633085a.52.1745605575173;
        Fri, 25 Apr 2025 11:26:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bf0csm679036e87.101.2025.04.25.11.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:26:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:26:13 +0300
Subject: [PATCH v2] arm64: dts: qcom: msm8998-lenovo-miix-630: add Venus
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-miix-630-venus-v2-1-cdfca385a0c8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMTTC2gC/3WMyw6CMBBFf4XM2iF9oEVX/odhUXGQSYRqRxoM4
 d+t7N3c5NzknAWEIpPAqVggUmLhMGYwuwLa3o93Qr5lBqPMXlWqxoF5xoNVmGicBJ1X16rTnXV
 1DVl6Rup43oKXJnPP8g7xs/WT/r1/U0mjRud0a60iMu54DiLla/KPNgxDmQeadV2/0SrRKrMAA
 AA=
X-Change-ID: 20250408-miix-630-venus-7a0b4f1f3788
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fIRoJX4S5ilpbY4+PpxKBeLt9aeK6mlmQLAqJR6NZGA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC9PG2gEUUQOLcaWpu7+bxz+m6qfojSPqTxtHj
 8r7/WdL+muJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvTxgAKCRCLPIo+Aiko
 1a9XB/9VgMkN9jIwM1jgNLydyT+7YsugpMg/pTTT/vulif8/JAyg/gKG3XllKQZ2QBsCTbBKDB/
 l+McDntp9R4JEj/Wdr9Bi6sLQXQxC5T2quUrit1J2OIPQ3+nMiN8gBbDcdZ7MF3CdgM9ZTDkmnd
 7ZFh3Qg/EKOLu9Mwny0RZcQCkV9wSyqMZ+OvKh9rvNl6XLkjKIG7tMKqPuCuvOOR+i791KepJWF
 mDiMu21U0X6nvwiw25RdLR15OKH1dGVS2w9i8+HsfFD3UlmdmnrXUxK3Ym5XzUD5JoP7DVWxuLb
 48ecANrIsIQbUkr8Su1JlyJpRMX59SgZHmPQIB2xlzqIyN9A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: t_iaId6eDEngk-q4hng5Z3oRudaYvNp1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzMSBTYWx0ZWRfXyx3yWlQHiQ2Y p0S53lnAmuwbBRMApWsrlFl9g809P+PA24qIzIikqVt8eqwFXYTv83i9hufDyEyjNTaoQEgWwL4 GGd0MHQ09hIp9j6C1t0GpI0oV66XLXomBinFqVErDL8w3YfO8RcJqcG7CQ71V01X6ILS5VKOtbV
 C7uElFBO3py9MOt6yjyoWwDart7OGdpc6VnqCyWK6kTchmn6Z040qQowJxyK7qt9GNPyxWC7NGz iwbJ1O0wP/AO7EUyoXyeXIil+sShs3d9x3MSdY7artwjyCoA/AoDgN46abdjtRa5lSRg3OZtoJ1 hJB9LufJp1vzUcqTVqkiOV0KumL4SgcCA6Lz4ltHN9bT2fKWK3YQt2uYjz98SjaxxkD7rYwd5yy
 zs+fT9CHB9BOEHXvFlR7OiLz4RbSG3urSRhwkFTcQHEbD0dykAbCY3hl/1BHdLOOkkjQuS3G
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680bd3c9 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HWf__M1pwcHe8JKbHgYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: t_iaId6eDEngk-q4hng5Z3oRudaYvNp1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=959 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250131

Enable Venus on Lenovo Miix 630 and specify corresponding firmware file.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Rebasde on top of linux-next
- Link to v1: https://lore.kernel.org/r/20250408-miix-630-venus-v1-1-771c330ee279@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
index f160ba562b0af505bdc1357731f75a394b5eeeeb..c11b972771c3881a57ba5a4dfbdcea487da7c6f1 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
@@ -100,6 +100,12 @@ i2c5_hid_active: i2c5-hid-active-state {
 	};
 };
 
+&venus {
+	firmware-name = "qcom/msm8998/LENOVO/81F1/qcvss8998.mbn";
+
+	status = "okay";
+};
+
 &wifi {
 	qcom,calibration-variant = "Lenovo_Miix630";
 };

---
base-commit: 6ac908f24cd7ddae52c496bbc888e97ee7b033ac
change-id: 20250408-miix-630-venus-7a0b4f1f3788

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

