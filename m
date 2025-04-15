Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5698A2957A1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712826; cv=none; b=I9ZSYa0//TmKxJ4COC7KdLohXjnjbPkuu85+5CE8szanHptCIM1MFCqJKS+x1EAKlE+9K/fAJXNIm997dCkOSasatr3K+uY3cImonzpIQyoa1CPCaEF66aWMI5GC6oZKOSkDGzB+qqo3B82wMImjUjT8AT7aT9CMjldVN5oUr0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712826; c=relaxed/simple;
	bh=XyJrrab7yUxjzxK4VPgBdw3hdSYd1VL2NTP7FYQSMxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fPFXMxL3LNp/mOjnrc65FnS4IruLwQhijvLwvFm3AAIltoQAo7xvq1mYVZu/U0+Xeu7xp+tIIf0cA4rCbEB+2afWISWAHoU2XruvvCeBHgYamB4NfU9NRWI0ok9tg6aGE1Qobg15+6qD6Th2tKe1e9RycPY/IXFPQhGQKgs4x+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcpJwzKt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcpJwzKt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tM5o002421
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oIm+8b6P2AjVyXOt9VB2DqMMOC0/jRc+VnrGzCdYJbg=; b=WcpJwzKtWYU39knz
	kX8/I5LGWgdWtKbNtatMvYy4LIX+GkvseVNKEa7kcxp0qgwitxw1pEyj6PdPX3qg
	WVt/ibH4l/Wepf9+xgYBEEo3so2j8NPLyN//yhojVovpKsUqAjhKp6nwJjLer16H
	570zy7yA30CgCcVO5dLxmrU9fPBMN/jIG4YbFbLWATVSzWtoai4wMU9j67ytoZgb
	G6slkoj8k8bS8maLrfylf4ww/afzqdvoWVsw0C5i2iFABbxrgmHY51gPuDP3OS7Y
	ZWQd2lI3lbT3emComILvUOu1NdQ/AFIGkGC1Gq4SlncBv6QLgbtNngGawAvHqRT4
	sx0Cgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjygx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:27:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c572339444so720126885a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712823; x=1745317623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIm+8b6P2AjVyXOt9VB2DqMMOC0/jRc+VnrGzCdYJbg=;
        b=vS1BqGaacvYiC9a32foCD+MTuqFuz93CD6QBlkc+ebKn77Yrr+OS6v4Vf02gHrsGRQ
         3Vv29HXBjHARSp5xH4Bw66FECR8+Wv5SBX9Mp2GmDXHksXt7bMOhpKJ2hobqe1EGqafa
         nyDPdtBfK0aYql3febEI8NyZO6YDX2IAIE8Zs55GVkNgn/3yTM0GqXljUVqDFgNyGkqQ
         yP9L6glWudRNfiNVQYCdMQEep55ffVpjhg+3PmEu6W0N8YXjGMyAyZekTuNeSAEAJYdv
         CAqaW5OHva/Gpgz6KTihsYOWVqUKR7Xp14N/4xu5SDCGJC6VLka7PQEK1/JvvvSOimJh
         Y/RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbF5vmuhEH1I4O6Qvb0jIvF8uL9AmdvfF/qZMkwcbsZ7r1CsgLr35N98fqoq86Lx7gXElcE+SZQ/SibdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzB8ZZPVGZuPOxDnj+PnrTRzOMnOPfziQFs8wsHYBBKNwyHINd
	+bFVu3sncs0WKQZnmGIOmLIJruNv+kb/SeUSeTPlVQDDukgspkLnv0CbYZd/MRYhba0M/pERjAM
	JLNzwwA9+qTd9N+UCqLmpPTefQ08OTBy3IDYaau7yDrRkE/RAq+bbV/69oN9tURQ=
X-Gm-Gg: ASbGncuN0CjPL1CjKUa0/2vgsoD60b6J/K9Ov87RD1jLOHHCCHaPNk/5GiM1SKuC4q6
	x0wrlrnLc4PRZDanzplOTbXjNSJEBSSVRN4JmUrwZjeuaWMV4GgOThpgzFriwXBdJ9cdWOwr6Qm
	q/5EMXNLewrLMLr5yBCMU52Y4R+JfclRliP1hOe+mIfLJ9pPNqHviG53HyYK0bThrqLollhv6Fb
	nSP2sQNvg+EEOJleU3tK0rIQ4vmIvu1IPHbgfPsiaLDv+TKFXeL5x09UcP5gAYvl7dzjrsCNAo+
	D8ugzVXDtnpSBj9Z+Pu0rBH9+DahNnGIlOU9hvg/UYqlF7C4/PSG1cu7+yC7FL95uC+GgYvqJuP
	aMWag1lq/POEX70ud50S6mTmn
X-Received: by 2002:a05:620a:172b:b0:7c5:79c6:645d with SMTP id af79cd13be357-7c7af0be2b0mr2252455385a.11.1744712823084;
        Tue, 15 Apr 2025 03:27:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuumvLG94klx+TnJLNT0DxONI7WvnZu5Yt7rXhdsuyUaYkOnHDsiKaUxJs0G6ArJ9VhM2FxA==
X-Received: by 2002:a05:620a:172b:b0:7c5:79c6:645d with SMTP id af79cd13be357-7c7af0be2b0mr2252451785a.11.1744712822645;
        Tue, 15 Apr 2025 03:27:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:27:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:11 +0300
Subject: [PATCH 13/20] arm64: dts: qcom: sm6125: use correct size for VBIF
 regions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-13-90cd91bdd138@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=959;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XyJrrab7yUxjzxK4VPgBdw3hdSYd1VL2NTP7FYQSMxQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRdxsWUv12aNX8P39ZBNX2e0lJN/E7JNsDWH
 QaLORme9EuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40XQAKCRCLPIo+Aiko
 1Y9WCACZNcOFZ5eYfrwfskCLw1Zu3EbVv/WZp/mnraFYsfXplSyz7DKwJfh9PlBr8ABtd7oxkxO
 zG0OgemX5eryJxYERNxvnQATcxZJq25kEjjllhUqBzYgOLW4bpeHFmbaVoiWKQBhxhTeY1yD8RH
 ApNPG0zzC9/agu0D29vQg7uY2WgBJwDFl8P0Na1zqJg6dVmLUFtR0JrRtKsDVmoC7anppOD0918
 lcXUscwHawwM5fq/tT0/zq6fTjsAQMx+tqA+mmaAVx6bPOhpG/BnrCdyPL/OublFBDxpfu0UxLv
 5PtWq/mPZ0IsNNM35J3DLdypTVWfd6vaqDnnlDjXzQxM0TUR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fe3478 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=wazrfr_39O-6HVnBxSEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: JyYL56QgJ3c2OerRqi-_GutSlmlpixsn
X-Proofpoint-ORIG-GUID: JyYL56QgJ3c2OerRqi-_GutSlmlpixsn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=594 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Use allocated region size for VBIF regions as defined by the docs
(0x3000) instead of just using the last register address.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 091dbdd171b46c1aacb37b90c3fbce14422aa031..8f2d65543373e70b48b4015478e21e8e74fd23c9 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1251,7 +1251,7 @@ mdss: display-subsystem@5e00000 {
 			mdss_mdp: display-controller@5e01000 {
 				compatible = "qcom,sm6125-dpu";
 				reg = <0x05e01000 0x83208>,
-				      <0x05eb0000 0x2008>;
+				      <0x05eb0000 0x3000>;
 				reg-names = "mdp", "vbif";
 
 				interrupt-parent = <&mdss>;

-- 
2.39.5

