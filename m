Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0967817C98
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712825; cv=none; b=JBfCR9qewYxmR4vxtrX2IlmNeglmtRQ7ixwLQ5UUzldiXCS67IQ9r30ks8I8D9KFxHQhwKYIfYXCWhSFNNdiWbHV0e70pZL31gQfzBQ4PfTUpur/4GSMybsHTbRb2XVzk2OaHy4gUTlgH3fGOz4vBgZgIUpPpKVFoyinFjxZnuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712825; c=relaxed/simple;
	bh=GygRZw5Ti02GZx5XqMcLxlfsQwWFlAwLOrO/lzfQ3sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LKJUvUeU3ZxeLnJTOfozdEJt1UBxBs64cu0qsz0o0AEeFKNmPrY/+CDj0Zx65L+PMTQbTy/z/zQQlFxvYp/oqO3CQUZ8RTkRJwL7T4b9LJ48eG4/5XGFWJ6WcZOgcSE9bbpthZep0xNvm0dpXVusU66s830gbiaMLgoCxRGMkcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZmP6+/9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZmP6+/9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tJ8x005287
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y6xu74aXc71HW0/LNfV7sdsFlKH3ZNgjVD7QJOxD2Yw=; b=FZmP6+/9Sr4msgcv
	elwksgHHhP2rr6EIbMDcm/xoCGHWc/F81tSgjJvaujeNqW2IAt0NYt8ksTVhCIrO
	sYTqmoAcO/IgZbp1vw3ZKZYgC5KG1ikxTsJJEdA4rFvOTkSNTGcHZ5Cr0s0gml6D
	6Lvh8rmC1TCCofXWDV3dcrpTeW6wCPr0G30ntdEj7cVLD7Rfigc/myd0zh8OtbSe
	Qpo0eLBIfCRUXY6p/fRXqIIBcIt/uISFp2wED6rxavWGFk1ouDsEWOMo6QQRk8DW
	paVUCXfm/PQ9CXDRDEDh+MFQv/xACWC/0YpKxV4vktNHSRYEe58o4SEnvf9LBa+5
	8C3Bug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpqfy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:27:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0a3ff7e81so971783085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712822; x=1745317622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6xu74aXc71HW0/LNfV7sdsFlKH3ZNgjVD7QJOxD2Yw=;
        b=at4/Sn58j+vLuJr4v0HNwysuxJsS/RUQpUm6Tsoe8f3N/2g2x8YBI+QfNcA5jK5cgv
         MBnzWXexxjwOfIomBxaq4anVCGt0rdMiZwJyD505HikKwaNNNvaada2rnTFTUgARpb1m
         viQrGLaMj41ozJGCshIn7Yx/UyqH6nOWq7hWfYZ+GvYt8q8Rv/R/svRHs0j9e1CyJIK8
         INvREx0WSQsxyJj6Jrosy+ci/X+VtSxlmgHWO+Kgzag/aozSB17DBM33/4Wa5Pv8QNni
         bn1zmvgzyaSvTlwpiwUJw3zkyIgfQ41edCLX7UI0la1SchhyBMNTbTAYP5mJTU9BRccT
         zknw==
X-Forwarded-Encrypted: i=1; AJvYcCX/l4mjA3xvU/2JRoEYPiiGrqca8qx2g344PMj3Qlcxk0pwbkFGQPyF2Umy/Drubg8c3yjj8XeMBRISkCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqDMWq3FKAZgDrmCvjw8hob5eaXIbVRiS26cjuJBWMAki+FYhX
	M4MzyV4rVQL7bY2XuR2lPDABP81bE+wCWOfY1PAxPaorqMCclMRFYXiSbyW3XDNLlqJRqztRgal
	zodbtEmYuAcQmz6s88M4bFtIOH5M3BrKU/UFr0/ynauesdViDBUEVkYFYnSgLhBA=
X-Gm-Gg: ASbGnct1VX6aPYJLZ9kaVZgQy2iO8auWmsWJkApx5aBCHM/EOLKoyc+NvZUjjp2EYcy
	xAqZRDazJ8GXqsCfWiUsuC3iIfolAK7923UHLJGUC36Ktj0oyEddTl1DfoLPE3z5y46VlOEyTWo
	lbpF0YHtqo9R9EFfrrdTqgtcZL+iW9SwpBDFSaaztZO2bEH4QQLN8zj1qWIfS/LETtLEOYrl0+c
	WJ1+1evpAJ7gkql7K/ZFyfdd4sNf+rEFrU85vnVQp8/NXVRfL5m94c1WvVFEfgudDgl69GzUzpL
	P9sfw7Syrfwo94p2u9mygMTVSAoNxgmv/63J1SDvXZOWg9w+kZ07OZoJ0HK50wjW/345GbtYymP
	x4JpH3MRtYZJTm1uFRuNs3DbR
X-Received: by 2002:a05:620a:394f:b0:7c5:5d4b:e621 with SMTP id af79cd13be357-7c7af1cab77mr2184602185a.37.1744712821778;
        Tue, 15 Apr 2025 03:27:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMj16jnLQs4tEqhafGmuL7wu7k0jJtW8cdrODgjt4ownvW5yzmWmOkCdB36noXdQifYWrfCQ==
X-Received: by 2002:a05:620a:394f:b0:7c5:5d4b:e621 with SMTP id af79cd13be357-7c7af1cab77mr2184598785a.37.1744712821339;
        Tue, 15 Apr 2025 03:27:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:27:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:10 +0300
Subject: [PATCH 12/20] arm64: dts: qcom: sm6115: use correct size for VBIF
 regions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-12-90cd91bdd138@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GygRZw5Ti02GZx5XqMcLxlfsQwWFlAwLOrO/lzfQ3sU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRdt4GGJqiJ1eGO4f731bFFCK9V3+J1HxKJj
 A27evcMBb+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40XQAKCRCLPIo+Aiko
 1aeyCACxUx3b0bnWVHS4rKfzSdXLi0C4KTTAoBTRJxr3jdWV9Fh98SKgde6JVMwVV+lEuJm535z
 rFt5ubEf8Hj2FZWp+r/Uf9BfoLEWJufZK7aIA0aEz0RqGs780F4YYGC+VIWJjEAEuxkidVEyemj
 g3w1Jb0nhTOcYvkcuAtpGisYW3RHo4XN9aN2Murr1sswb0G7hf9oZD3od56UsQ5Vp9PPQIBAPRu
 eatjYYjjffQW9YEbHL8mQyJ38aQ0J52JjsW7Rbd+V7nciM8B2K8i4Smn+5H2rLXQ/kK7kfL2r0/
 xGCmSfUsQbbhNSmz6+SzPHydr9F4cbTIS+e7Vz0nHad5XLsl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Dy5M_n0chEBUo-ZFdmgoKiDzBjyuPSDD
X-Proofpoint-GUID: Dy5M_n0chEBUo-ZFdmgoKiDzBjyuPSDD
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fe3477 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=_YRF4UmqckwQbjleu94A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=845 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Use allocated region size for VBIF regions as defined by the docs
(0x3000) instead of just using the last register address.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 55a0db0ed9cbfa2560e94ca8160a31ff3f1efc25..c8865779173eca65f9e94535b5339f590d4b1410 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1874,7 +1874,7 @@ &bimc SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
 			mdp: display-controller@5e01000 {
 				compatible = "qcom,sm6115-dpu";
 				reg = <0x0 0x05e01000 0x0 0x8f000>,
-				      <0x0 0x05eb0000 0x0 0x2008>;
+				      <0x0 0x05eb0000 0x0 0x3000>;
 				reg-names = "mdp", "vbif";
 
 				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,

-- 
2.39.5

