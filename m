Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F441EBFE6
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744561994; cv=none; b=geI5OCJPaWG7GfUCGVACJHXJC+ofEwBQo2gEYEIJkVtTTwxKkqNu+v6btWo5UBViNh9VeI/bY7TX9nn0IDYUTvE0IVdAjAZioh7VAfVILf0JhkDiwtXFskqSnbjz9BTFcmz4fFPONDEt7o4s+t8faxqR0tntp8N/OjZWs8zlOE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744561994; c=relaxed/simple;
	bh=TnUzAndi2T1YnSlyFpGeu/Plqylj3xVIJozR04iJiQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ES+3IzshtoSnHo/087brA6/NnoFxJ5O2dTexWDee4JAcrN6UMrCrTAWsgp/JA3VDl7PQMr6GZWwnLhOHl+qaU+xiyZaHdX4ugIcEYuzRlNpj8xiyjfl3UQ59JfRKMwjRfaMqvDvWtb4LFSVbUdovxuSlKXj9XCaT3BYElzu3hpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/jCmLoW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/jCmLoW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DDdx5q029751
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xKdgT+dSB0xeGKLnfAIrPSxWUg6xTzhuptWzcax3H+0=; b=X/jCmLoWEnj8ou0j
	FDod4ab3rBKuLB5ncZ9WYScSi4/1YVKEy18589a544WD+HEFNzFaox4/q1PkP20c
	pZ2y4Maf1DRaUvsI7B0yAbnny+DvHoYOFjqDSqgJjkfoTbzpwB/+okAAK7yxq+if
	WAuwWnp8mnfF4Mz/cSm/L6kQTD7JoZsihH14QL92lJmqJx6vDS8op3LzVYNp7Nq8
	nm89/Vf1SvMN67j//x4nHab+EJGOYqnXL1kZmaWPfzACBAJUumt1To2J98A1LptI
	Q/GDL6NeK3o7XyT8953t/3FFE1dhjYjbFEzmh7NaiKewfThkEjsqKn0G8ZJa6Lls
	VxVaJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vaewb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:33:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c760637fe5so678407285a.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 09:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744561990; x=1745166790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKdgT+dSB0xeGKLnfAIrPSxWUg6xTzhuptWzcax3H+0=;
        b=tppeUl7stbwt6baDVOwUPIAlONWPOJxIrMhiT6C7Ah22My1gOquD4CQSvURuLDgwg1
         oSIYrz047RIwi0dhKCJJimUXbN/IpCWzekoYqTXdD5sqw9TxCTV/HyImlKCzzyjOLSk4
         yT/lhJECQKp6FM/S1DmYu1IlLVtINiGPLKbmdAOfuFcZ1CZtZwEFoj0Xf1/LuB/ielss
         W16q7WGrEkjEYh+5GMDFZ5Lbr0F5Zsd8Gm5tN985NZtdcNWeZ1kJYoiTsMB/sAPQVMJ/
         1s74z8fhj0EPZb7d9LrSyVbPHCkaXZ/M2qsSdI3D+MfyEyauHRzteWCkG7lZNlh6CIit
         NhjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgwfdtzq3tegqs2quTrHOPtMOkD4vj5TpIyWE/W7sNzZgC/4+U4m2RhxyNVDFQhsgfpDDBuh++KHZYmD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFDSmkE8PEMd4ZvxuLwBRey8haHbUd/12CZbtEpXQR/xXl6KVc
	dEmkS6e2fr5ghVYorHHaSQR1kK4ZXgvg5L97smFZg2N8dpim44JNUBi3E3GTdSdbckGnwOKlxMM
	YnkPa3YRKz1OKvQTlKFiAV73Oawe4aOFYaZ3+XhdzExTNXyrxGKWroGKl9sFIaeoPUsKCHjo=
X-Gm-Gg: ASbGncsF8PzF1c22kX3T25f5bf/39pwgKOoU9Yw/MqfapH1Qmed2Z1zd0baKpn08zH4
	XsMHlryv0D9xHDMqPZQ0CXeWv4X7bH+HU8CYATs4s8PbaF80n6PWu1DF9DFO1Ba5CDns3mZsEIQ
	YqHqFUx2qVyCCEC7XRIuyxssORQvt1YMXoP9vBAgiybo6Yl/xMyCHSsknWJFEPtWbNXlu0qMA9F
	9Qg9zfJnWPTGJJ7WDVrwpstXk7Le9B5RnLY5U79H1EglXh8WkN8glCLoScLK0N+3kKsV5kTo7Nl
	pKlrXVNVkp2xd001AuW1OCBmGVacGoAi5EF7dZBfazppFZ8FXpfyEGepQQ6OsxsCzmHn4YMp7qO
	38M+qZvifYaptx7cVfw/0xdaU
X-Received: by 2002:a05:620a:2996:b0:7c5:4bb7:8e45 with SMTP id af79cd13be357-7c7af1f333amr1451359385a.40.1744561990316;
        Sun, 13 Apr 2025 09:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUWRMVIE6OK+FWrYj7sTxXGYMEYvK/1lf0lJmZzzBgGPqel7FWzI3sccgjw6syFjwg6JtAIA==
X-Received: by 2002:a05:620a:2996:b0:7c5:4bb7:8e45 with SMTP id af79cd13be357-7c7af1f333amr1451354385a.40.1744561989750;
        Sun, 13 Apr 2025 09:33:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464e9812sm13345431fa.49.2025.04.13.09.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:33:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 13 Apr 2025 19:32:59 +0300
Subject: [PATCH 5/7] drm/msm: rearrange symbol selection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250413-msm-gpu-split-v1-5-1132f4b616c7@oss.qualcomm.com>
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
In-Reply-To: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1820;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TnUzAndi2T1YnSlyFpGeu/Plqylj3xVIJozR04iJiQ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn++c5zot51bWXjqYm5qRu0xm6DL6T8wScfw9tp
 x2I8HWLsNWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/vnOQAKCRCLPIo+Aiko
 1cr7B/9lhjWA64+i6WMEKng6H1Gjr41aeV+3L9pCQteZeOPJK5kWPokWOND0NMftGAqTLzVGSd6
 Q0abSVqr+c2q3U+INZiBD3rvM2Kulbs85KXkqgNcTN0Tqcw/mFgA9+JkyrSOaf8HWICe8BjtDDh
 v+UN3UXuGskPQIf036Jh3XhAqDFACbyy7E7mKIdZOBI79CniHDIt8LOZgdwErhqo7y2gDDuec1h
 xnGRpDGBTuJNWRh4TRLND3cUeWa6ijjcx5jkj0Ac2fidIHfu/nVLhvE4q3sJJUk916jn85UUcEB
 CSbCS5snIDthUkPE+4OqN0k1sZPVDeTC2BS1alv8KwCCFblI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: qSJmrERt0PP3OXdvqdRWl1gQI7mPosNK
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67fbe748 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Dibrpul-hQ8xFFu5PoYA:9 a=FBDQ_9kEivOruIPM:21 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: qSJmrERt0PP3OXdvqdRWl1gQI7mPosNK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504130127

Move symbol selection to be more fine grained: select DP helpers only if
DP driver is also enabled, move KMS and display helpers to the newly
introduced DRM_MSM_KMS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 0be31c5acdd1b7ef80f0e820ff430692616122e0..b3c6117ab035764d603cc257c28df651d9c38175 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -15,18 +15,8 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-	select DRM_CLIENT_SELECTION
-	select DRM_DISPLAY_DP_AUX_BUS
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
-	select DRM_BRIDGE_CONNECTOR
 	select DRM_EXEC
-	select DRM_KMS_HELPER
-	select DRM_PANEL
-	select DRM_BRIDGE
-	select DRM_PANEL_BRIDGE
 	select DRM_SCHED
-	select FB_SYSMEM_HELPERS if DRM_FBDEV_EMULATION
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
@@ -69,10 +59,18 @@ config DRM_MSM_VALIDATE_XML
 config DRM_MSM_KMS
 	def_bool n
 	depends on DRM_MSM
+	select DRM_BRIDGE
+	select DRM_BRIDGE_CONNECTOR
+	select DRM_CLIENT_SELECTION
+	select DRM_DISPLAY_HELPER
+	select DRM_KMS_HELPER
+	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 
 config DRM_MSM_KMS_FBDEV
 	def_bool DRM_FBDEV_EMULATION
 	depends on DRM_MSM_KMS
+	select FB_SYSMEM_HELPERS
 
 config DRM_MSM_MDSS
 	bool
@@ -117,6 +115,8 @@ config DRM_MSM_DP
 	depends on DRM_MSM
 	depends on DRM_MSM_KMS
 	select RATIONAL
+	select DRM_DISPLAY_DP_AUX_BUS
+	select DRM_DISPLAY_DP_HELPER
 	default y
 	help
 	  Compile in support for DP driver in MSM DRM driver. DP external

-- 
2.39.5

