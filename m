Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5C614D283
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750530010; cv=none; b=aN5lK3oz90gW5DdfWbblPA2IQLPB8Dc4LCI4bgrCqQfTe/Q81S75eJqGiPsPmSFkhSM5J7b3s71+7F8Qa71HEs5HgdsaggHkON9awo3fByt8+bvwQm+5+eXH3FzPfZWd2J0EqCLhNCg+jD+CzbP0BHUodseotSJtEj5svBP6yLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750530010; c=relaxed/simple;
	bh=XwtJM8njzBbdt1liWqcJfFiBjPvnDt2aCZqwDP0aZaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fH1bH4U8JLmmf5EYlLAIMWqoR88k40yBZq2zoyqaYOEwTJWzkC7bFTSmrIxRyVpFMhPmAgNnSCzQxEmYgIvVNsxCsRwtO80ciu0l2mZM7yLrZeOtn/7/JNkv+ePSzKgsh+lnRjYARnz5B45OXltvB427wNBG3zxGsj0bOMQ0upQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IThhWzhZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IThhWzhZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LEf2Fe003135
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6ny1/i9MpKx34KKyVr32wx
	2ezhZX9tnwSugxz62UmUc=; b=IThhWzhZM02CaBXcrb9aXqAJ1gFm+/dN8Tl+bT
	LOIOMfs7tHyDi22egJIIGn92a+WJKO08O+blvwhprIRC5/C1S0UzUyI33FYTed9g
	tO5ST4Oe9fyjXisJgljjl2nMmlsq+7sqHuyJDx6AoT7rdpeVF6eurACu1VGGaQUO
	NUJE0IA0X/NldlShSvWIzMotWTryhKko4n4PLWmjC3PU2Nw6zGZNS7CNte3rVxX5
	EggFiaWK8BGxiOW+AyIXDBH6RYD0GB0t9MemV3NDsx487rNUUAc8DmwrCQZigR6Y
	n1lbHGXvFl7xkgmICfMBbZWB+9EJLLU+eRcWjT5HgevfcHPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ducj0exk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:20:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3d3f64739so670822785a.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 11:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750530007; x=1751134807;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ny1/i9MpKx34KKyVr32wx2ezhZX9tnwSugxz62UmUc=;
        b=F4csAEYXBuBXKqJVvY6jAEH5DMOidaHuTCJKhJ+x4ffrMacMtyh/EV9DUKllwip7jV
         Sxwr4t+Mxr8mc57uX4HxjNvIBAu3pvtYNjbo4cy9lTdWonLeLfrB0aGWL+YfTD/OByAa
         hOdNR9/AZ3zU66pw8P3M8wbUIzO6Gvst5WwTRNCROZusq99LtTsWDepThuaraf/HmysK
         1ChKtcKoUvsaX/zfUUpqNSQfEaslOqNTi8gj7GUMp02PFO1NaXud1YplFrRu34N+0ed9
         OXyxigSvejWTP7q4KQiERpsSWkTyJFQFDjkfWL91kv1TQ3Fd4XrWJhUwbHvpGz7oJITZ
         P28w==
X-Forwarded-Encrypted: i=1; AJvYcCVSfDu/z7z7+W7Pl5xL45+Sqw2RSiT9BzfQ9MrO+M+mNdKib3gZlxvcx8nPEPX81vtROaTJPnSyZ9Acqik=@vger.kernel.org
X-Gm-Message-State: AOJu0YwocZIglGCOM2HYZWMf7n4oG9js2q/3yzuhNu6amkCmvg24Y/Sn
	qflToanUwMuf77L55K6u+hYCjk3F1G/AiLPP8xOLmHs29G+4rPGVn8RgnFutK717eKwKWGweOaK
	x/NH8wBEj+GjiqFJ4eM8mt3B5BffXjyeb5tl3QCmllI+Fy5/eM2/on+mBb1o96jEWoFE=
X-Gm-Gg: ASbGncs5EaK1Fx+ny1ydotxrtRUlgFjyJit91wr3DXDlBEVw2i3xBho76/kydzWWJJV
	bAmdx4FHnyr13ihRlzZmtnhJXoQZ4dU7PQBuwH5tZITJGLW3mpRHbsMMPrYJe4FXOu+yDkSjZ2l
	hzQNcBPamQv7vR7e4DNDQh//O4JLK6H8TIusF/OxURXYaugRSUN2IoKSChj17nO6tMHa9/aNCyM
	yTaQRPRBd5MqNX1YlvHlsgOTguHfkvR7frGCXt8023C6VOkpanFlWV8UvcTu6/SRvsVdnXptyRn
	o43P4HOrnxojhBGrtbX03a3Bb0oguk30fmdcloxme0OQCvWV12mbmbdMT7Z7RTGhfyQ4uloKpNp
	cw3v2EBdPt/We8YpYK+AubLOfAEVPv+FjHPM=
X-Received: by 2002:a05:620a:c41:b0:7d2:27b0:370d with SMTP id af79cd13be357-7d3f994009fmr984605185a.42.1750530007170;
        Sat, 21 Jun 2025 11:20:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkwcA2va9FYtfuErFb8AetYbO0QldLKi5r59/m8O7bdX7pIQ7hYBjZRiehOeJk1uml7ANUYg==
X-Received: by 2002:a05:620a:c41:b0:7d2:27b0:370d with SMTP id af79cd13be357-7d3f994009fmr984601685a.42.1750530006754;
        Sat, 21 Jun 2025 11:20:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414c4a7sm763995e87.57.2025.06.21.11.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:20:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:20:02 +0300
Subject: [PATCH] arm64: dts: qcom: sdm845: rename DisplayPort labels
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-sdm845-dp-rename-v1-1-6f7f13443b43@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANH3VmgC/x3MQQqAIBBA0avIrBtI0cquEi0kx5pFJgoRSHdPW
 r7F/xUKZaYCs6iQ6ebCV2yQnYDtcHEnZN8MqlemH5TE4s9JG/QJM0V3EgY76kF6a4J10LKUKfD
 zL5f1fT9H1E/5YgAAAA==
X-Change-ID: 20250621-sdm845-dp-rename-f97461d95f9a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1499;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XwtJM8njzBbdt1liWqcJfFiBjPvnDt2aCZqwDP0aZaI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvfUN9k1vamR2BIUomUPbrLx80hRIGOeeXZ4+
 etfgrWpuW2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb31AAKCRCLPIo+Aiko
 1TlCB/9ksLS/KDxXwhDSBqbIqqqPm2wOjS3jL+sCKx9gKWhKyADkH/HdScgE4HVs6DrrN3CQf5N
 R8nwZn1M1vWOvxdqZLtzTNOCrSj7RH971nrrg855WKnYeV6J9OmpMdzys6oHYLH5E8yer7gH2vm
 axKTZHU0WGpK1qql7GjLMRlUl2XADFzvhI+CGyexX0kC6YTclz4JL5ik4XgWTFGryD5NDOsxNtb
 3WIoGdR/7MB1hEhQAvgm/yWamNd/ckMmEm5VNYvUYLGIFyqof8FCP9aeky1IY2eNQf27NMM0TfJ
 NC84h3RpGEHxTbCVdYOvruNdeAMxwTpYQolws3nNbgxrKeGh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNiBTYWx0ZWRfXxdsXue2fKj62
 oaWrUOMlb8lWMJjP017Bojh63flqotyVe2j3U5xdnIrSfvlKhQZKEOIZ18W9lCPZza5ATp+03iS
 PBtu+gNVcUxbL8B0MFiqBto/aaL1B5dUjg+wzIjlwzorLQ2DzKU3wr3bSLVR6OKNt0YuT7OCO3x
 x2LtQWhwHs5qmfvSlWjrkChbKbAUnpUaV3EiTnp1F/xX4d7+rFcxxwqslH5rSaM108h52cFHlcc
 RXzMy0hhtVmKB3x35DXhIAKegkuYJ8+AO4uyqvFwfRzwHR/kQ0VfoXFk1tiqsrAriq6sjVBXbgZ
 O/5wD5dcZ0A+O6zZe0v08GAHYjxtCzWtdObmcoDIcCxqYIBQ5BNGIyELZuVkTNllYBZWfs6HHip
 vidUqOnxvE4ixAU129yPgxuLHbvEDlAaqyzNcd1nDisg1xPkk9gzw1kcWsfjJqOEg41yMo03
X-Authority-Analysis: v=2.4 cv=MPdgmNZl c=1 sm=1 tr=0 ts=6856f7d8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=WAJOHdNl-RRtu7VvE-sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: H4cSk7RP0bHvVU8wlsoUlbAknfZVQX_s
X-Proofpoint-ORIG-GUID: H4cSk7RP0bHvVU8wlsoUlbAknfZVQX_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=834 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506210116

Rename DP labels to have mdss_ prefix, so that corresponding device
nodes are grouped together.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index c0f466d966305af21b28d724fc8f0536d8734791..2311ebd515d7fdd919e88f2a9477fca0fb2076dd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4089,7 +4089,7 @@ port@2 {
 					reg = <2>;
 
 					usb_1_qmpphy_dp_in: endpoint {
-						remote-endpoint = <&dp_out>;
+						remote-endpoint = <&mdss_dp_out>;
 					};
 				};
 			};
@@ -4603,7 +4603,7 @@ ports {
 					port@0 {
 						reg = <0>;
 						dpu_intf0_out: endpoint {
-							remote-endpoint = <&dp_in>;
+							remote-endpoint = <&mdss_dp_in>;
 						};
 					};
 
@@ -4682,14 +4682,14 @@ ports {
 					#size-cells = <0>;
 					port@0 {
 						reg = <0>;
-						dp_in: endpoint {
+						mdss_dp_in: endpoint {
 							remote-endpoint = <&dpu_intf0_out>;
 						};
 					};
 
 					port@1 {
 						reg = <1>;
-						dp_out: endpoint {
+						mdss_dp_out: endpoint {
 							remote-endpoint = <&usb_1_qmpphy_dp_in>;
 						};
 					};

---
base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
change-id: 20250621-sdm845-dp-rename-f97461d95f9a

Best regards,
-- 
With best wishes
Dmitry

