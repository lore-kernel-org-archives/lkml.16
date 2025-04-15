Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A64D297A44
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712841; cv=none; b=g7+VhzBMfsOT/QZrdrDHDb8bmib1eEkFXmZTfWZ9rwLo8u1Bk4arsQtb+IPoQPXlceFEfQK6UGGp9wz/FzNs974uoMyjxGKMQBhx6E4u5I1qOyk4QzGAusoMhQPG49Z+buDXtkLGR9l8xyB8BVowYR6jb6iNzLlxPdbswHRytPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712841; c=relaxed/simple;
	bh=VoZQVew6viPEuYlrCtdvICVKrz2T3uY7Pq6nDR4GIEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rcqvkmP+fy/f7AFy22ArsEdYFxiKC+CyJq55NUUBOdD2buS20VmA3K6P/q9hYB+xBZinjRM1/gAwrxYrdl4XPMKyiOX4jr8ca8+r741pS7NXEycOZZfK8i/UNmgf2S/7GXWmkJWGz2peROEa1TH304Mqyy3/+dKkhSVf7d918qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VnWBtmbu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VnWBtmbu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8u9t9025916
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j4u/3kbOTeLwXzQRuQidArWlAAKpTV0l7G0DJvbKQuk=; b=VnWBtmbuPHfY5x4d
	8QYzNXBBO1heSq6LHyUVMNETtFC6VhbXfiLs1vqBsSXBgzhOdCWpvqnIk/1osHUj
	dybysWNJXFDcvKDfvdYo251Tr37F6ww6zanyqBeSmToaeSc+YA53GocGU89pBmT+
	DMDZynJJga8/KzBdTFfMTPfWXN7TTlyxdJfmjcVyyXsr1LdcYGDuiiJ/wi0BB72M
	eqTp21LxclX60qNxvHFswKSGz8vKL8xMQ0mDWQlXUev4ji+EOIfpzTGRT1sXLrbF
	m1EwNvJXdYGteVSvGOXlBVxkjceqVmgOudPc9JWQpoew3cVI5UIEAxFo2datXaUT
	j0yV/A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69qq62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:27:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c544d2c34fso748541385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712838; x=1745317638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4u/3kbOTeLwXzQRuQidArWlAAKpTV0l7G0DJvbKQuk=;
        b=bXU9s0k8J7lJkBClKX9U8sP2wbrrKltil2RQBLY5Crtm4aE3oMUSZAE7hKiCOtSK0A
         5o960Bg7obhmK/eLmgTP67JJlOegq9u1q5fyH+MZsNrbHimIM3fNLnI7OHG+s0L+VDLe
         nKrnwfe8a55vf+0tlIphKlrrJCFjnBc5pNSYw9zQR+kJozlnDfZQSsEqk67nGE7s6JwQ
         zImrAoW6YaF8vCbL2/nEsfutSA7Kyd4GhTnXC3eRnir0i26HK5+vYQ6siCLmKdsfW5wg
         l3VdbOhP/ULS7soQO/HXZxXRSYFPhNo542WZy9o67z1EcnYQhCuCpG7iRFqCrlZTuocX
         MzPA==
X-Forwarded-Encrypted: i=1; AJvYcCWJtimoTmgapTXASrZvvfVwIs1zzSZMw4NZdvFhq5vrVhCwlYizq16olaQmZhsUyivj8l2A+Vh0XbhQ8Vk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9JY7vYMW2iq2MbCF+rMV4KhvnhoTajthyWzLgn/XX0cubwy16
	wTqXD89QHfiaS0sTThFfi0d8rBG8SuE4M7IIFEEu55lk5rkrQjDkTV1xai7TM9PfTXBX/dwDHDk
	zsF0jGhZmeHi72OgQYBefSQC1//9w4WFhnCKBcM0bimlgtyEcudqH1XKyFKdCsUg=
X-Gm-Gg: ASbGncuKkrvz0Ej14PJrn306DhcYpz2MOJSqc0NV/xw7xM7bxRpcKYlXeahLHuG25Z4
	0x3SZ7N6L3Ys0l1bsMh3jyYXL3xgITqNZN/dAWqvpJaLtmxrJLUefo3k8g1kxG/KseQVkOHJZmV
	gQJ3dFhpErjRAXah7Q51QnapsOg1snARJIr91eafXvxLqekmcxHC9zvhxvWXtKlN8gBTKx8imkm
	0hM8uGxLLhUbTmdTOK031WdSHOYi8wB8DV9esV+lhYjc4uULfO81SICk0hAeB2Jk+bQxKEIAHqQ
	4gGnYD2tcAHs6Oi0FWKeyVXyRYNomQJtlKq3hPNIpBJAi3HAL3FfErmE4FGUw4wYU2CjZ+sECCJ
	+P2mnCGoOUmqlIfLWv6kB+Neu
X-Received: by 2002:a05:620a:4608:b0:7c5:50dd:5071 with SMTP id af79cd13be357-7c7af12f0bfmr2349766185a.22.1744712838459;
        Tue, 15 Apr 2025 03:27:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE36npubXenGcySKHpgNA4Ak2bCAF2Ne8Wn4iQLaNDcOj30+7S8NyuUx9YbfPhGEegUys1QFA==
X-Received: by 2002:a05:620a:4608:b0:7c5:50dd:5071 with SMTP id af79cd13be357-7c7af12f0bfmr2349764385a.22.1744712838170;
        Tue, 15 Apr 2025 03:27:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:27:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:18 +0300
Subject: [PATCH 20/20] arm64: dts: qcom: sm8650: use correct size for VBIF
 regions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-20-90cd91bdd138@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=956;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VoZQVew6viPEuYlrCtdvICVKrz2T3uY7Pq6nDR4GIEM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRgRXI5hZl9vVYSozhbJrIuEbR98JIXcZ1p3
 E0kUF7rjd2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40YAAKCRCLPIo+Aiko
 1SchB/90UgLSNCrjULGbX1BXRXbsNC1XmXUupD29nGEy24600Q9Wup7MoUT3LqAmv8s12WAe6Eq
 tfZa/sMMZsp+vrN45r4j55Yq+Tr2Dpx3SV+7eKewjslAAyPySxEIlwsBMrOODyoq14+idhkGzpL
 YytUFsiFUaoRI3jc1OSikRDPoeyfgDo3eH63IMiIOWKHb7i+XvUT9VT0FUAZJS4wKKljdEIB0KJ
 GmZK0RVBsrJcrijUFVDAEXHY31brDYL/dx7Nlrl1HwVhMw3GlKbSArrnY7Pfq4U7xSp1pqHKEzB
 5O9syoDkmeRRmmonovsrm0HX/1VyPCJRPQvYGciQbkdrvLQs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: WNgHwgwDduMLTQHhau7uF_c1F8WKLl3n
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fe3487 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=QTc1DAzlHLIpBZH1LxwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: WNgHwgwDduMLTQHhau7uF_c1F8WKLl3n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=688 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Use allocated region size for VBIF regions as defined by the docs
(0x3000) instead of just using the last register address.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 437daccca1bbe72bf8179e5d4b2f7c097a330360..c2937f7217943c4ca91a91eadc8259b2d6a01372 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5114,7 +5114,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sm8650-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
-				      <0 0x0aeb0000 0 0x2008>;
+				      <0 0x0aeb0000 0 0x3000>;
 				reg-names = "mdp",
 					    "vbif";
 

-- 
2.39.5

