Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5A928DF14
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712808; cv=none; b=d5QoAcScKjNIay6tKg5EPjs+sddK98N/sUYB+dvO4wYmMblJRhVqrmmTu4OlIzF1OyeG6dznpxGz/lLzR/WtK0iGuhlQILYt/XVCbakzY9ZAdpQ2dKkGNA5s+ciMbvOQzzTLxeAgsH/wMx1/tYfLHj0TLXJkQL9eS7m3aVIQPNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712808; c=relaxed/simple;
	bh=YdWXoAkJu50GgIwSHWvm/lgy+Y2L10DMZUt7xa8WK0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H2C7gg3sR/Cy62fMNkF1NZe0SAhFs+3KJJ9cvjeQ79YERsrCliMeR4EoRHgdfqvIVVQV6RVYN4T/1ql2jmrT/AuO+qo/6gfqqvbACmgEGntmuWGQDfvP0WCjlr7LV2qz25G8I4D2R0qbHnBCbAUaHfmeuJ6ZAdJSz1+AfnhwS4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGdoi534; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGdoi534"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tFBY019608
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Vjw3SVk0wjLPKmkP9BoZA1BfaWD+olWdqitk6cgUw0=; b=KGdoi5345UAqaGry
	525S0/4Q2LJH3zk5c7HXa/5FYekmYVuECfVcTN2UmGfBJRyDgt7rqvzM4+ROxfSp
	vXDosYPXOYMs/ziQx6wA0Jg7wfOZoXg+fMhJjyMXKqLuqAPL5cwnQVncR6WT3Eok
	GZcQbdsJtD+AjwFXt3p89pHK5C36q8jxK5I3Qs9aJkQ2FeZ11mSSpMqEDEGriWk0
	RY4zOLQ0RVyYMtMt/s6nA2RiC9RGZZa5xN8ph06DWeHsQISJ0tA2ECSgq7QOzA/h
	UWDaVMxfAOt7TkRI/2JpuNjhjtkSh6KCvFp53rWF43MNZJ6RQb8xk+1IgDs9QDsr
	2b6/3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcyjf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:26:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e28d0cc0so881207885a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712805; x=1745317605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Vjw3SVk0wjLPKmkP9BoZA1BfaWD+olWdqitk6cgUw0=;
        b=vemi18fJUUBLR/7+yNfUgQzj0v20MfMvbes4UAM0Lxb1imvU4YJZ3By0mOY7JNDwpq
         xnN5iY09rWP6PZLBApO8xrH+TYsTINaeA7D5MCwQEUMDCot8CNKEmIzGfXwYdMEKFgRY
         nuyFyNcS9Kk5w7bV73NKXmtbqpsTTQKB7teNM6KQt+BeQRQGDeZYM5tR8oxTJvsSrAVy
         F6BrEGkCIK4sGh5547rQfbHm0Bblm3XfZgCp2IzCJPKx/flUVsY8zaILCb4JOXlSfy1B
         t5uGQ/PZdNPi3SEwrIx3xBBMdjbw6FXUlTfPySt8NV1SCPnk0lsazu9AbDokK0Nn37OJ
         pgvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh2daC6Xdu/MgioPvFzVBYpctBSEhpZV/HsukG3g/fWWv0+/MpxGupQmNi0wvZproduMavgMJyxFFFZXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YytLYbmmqUzIFLs93Rq6NDkmlr3Zit+FF9yaPcvIg/KGyDTsmmW
	pXM4gnlg6u4IqLZfOotrC41/uxBEwutD8L0lG5Mb6OsZJtjZH/3ShDgqwlRgO2j3eZR8vmYRbab
	HXfs8ITjd86U00cSDlJfGDjbUf8aq7jccteBqDzVjL1cWOy6S1DTl2vFOnR4g4qo=
X-Gm-Gg: ASbGnct+E0C3rkNtkhxVn2lo1EZxQS7/pll7tYadA5oy6OpHeUKY32glsh2xEuWI0Ck
	p21z1L4NRUR9LYJIrA8NXw1RxRyNqU4Tz5vLngOi3mhS1ivK3290An+flcxBlm9+UvCFv90H/qs
	si/e0mhc/Ezsk37MTQUKolz82vVem5ziUAj5+421PeNbLYl7buhq/VxkXk1/HjinQ7QqsbOAC4G
	cejBOHK/eaqKfv1d3eZvzga9qTthC7Xntm3H4/zn7UjBXOacInJwR+Rs2yexTJiV1WgmG7aONtp
	BFpyD/WxWqP/saDgoEGyY+4vS3hv3wUzXQ7WN6HwBw7m0TDxhs4Dn79n9N7TBKxRmQ0oEeXzMgY
	QYjwgOCj/VbR0JKbn1J3742/W
X-Received: by 2002:a05:620a:460c:b0:7c5:46e4:47f5 with SMTP id af79cd13be357-7c7af0d4123mr2289518285a.20.1744712804894;
        Tue, 15 Apr 2025 03:26:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuSJi0petXjx6RM1bnLO4fpQy0mpzzooHnWGSmcswIdEjGyd6JneiE48Bv5M4MvM1VqrLWLA==
X-Received: by 2002:a05:620a:460c:b0:7c5:46e4:47f5 with SMTP id af79cd13be357-7c7af0d4123mr2289515685a.20.1744712804497;
        Tue, 15 Apr 2025 03:26:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:26:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:00 +0300
Subject: [PATCH 02/20] arm64: dts: qcom: sa8775p: mark MDP interconnects as
 ALWAYS on
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-2-90cd91bdd138@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YdWXoAkJu50GgIwSHWvm/lgy+Y2L10DMZUt7xa8WK0w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRa9H6BzjczgspkYC4DdPxnDBG0dFq2hI4zb
 U2NKjjH7qCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40WgAKCRCLPIo+Aiko
 1bxkB/0VU+o/HNj7AGDJmJkmDCgIjzFC6ZZP/Q3R9/DvreqWqclXaJefcP7HHtI9x0MNHapCWj1
 CwTcP4r9XbLHL37kygHaRJAhtwj4RxOZbQj3Z0aZ8YK1KJLMM3fLhBlqVo0aiV0sT0YvXE00pYJ
 +xk/vTaClGHo714Qo0i8etICHcApU+Mdk9YpR1zonS+xmf0ZAnmfJn0+8zsHD9V1V1+vZLjvDTS
 0JshHF0v7AzxBBwfL5N35rXmLFmv9U7W1RlsBWVXA5uu3fb8Emwu1NxkU8Rg5YpDlHDTMjNEMsr
 elcubwanJOqgK0p6juQZtznVqAI4LpCfo8ni4Pw6Rh8f8K+C
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fe3466 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=SfVT0voOukGlX1IeJaEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Nl9tdk3luH-ZabpNqTyyoE-WUu4R6_Nh
X-Proofpoint-ORIG-GUID: Nl9tdk3luH-ZabpNqTyyoE-WUu4R6_Nh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=945 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Change the tag for MDP interconnects to QCOM_ICC_TAG_ALWAYS, so that if
CPUSS collapses, the display may stay on.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index a904960359d731d2f0b6659a8ae99bff0e1bafb4..4da50c5ec612688a78b42543e23625b5a9801f2f 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3959,10 +3959,10 @@ mdss0: display-subsystem@ae00000 {
 			reg-names = "mdss";
 
 			/* same path used twice */
-			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
-					<&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "mdp0-mem",

-- 
2.39.5

