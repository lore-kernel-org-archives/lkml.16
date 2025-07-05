Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FDC28ECF4
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751709770; cv=none; b=reldmIPL1H1QP1BZo0p3PKCptYMdkwLEnjOpz8GaN2SB4QfKNcPFZM3oFfnkj/AD5scTlZm9K3QL0Dcj5kPNfIgIPfW1QKXcNlpc2nUoG47HpOeuR/43pWvSyvAlctSmMVhnnvFRVyyZTTmuDkE0VMYnwTZQ0W5VqFTDhq5mjcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751709770; c=relaxed/simple;
	bh=KwQ9Fk/ez5j7BPU4OcwnfOs/f38mi3dlimt1zg0gBh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z/gHsL2UUEZAbwFGq4UEYCX1wQYL6ld/OZYqrMdyujqWDvGtunxKPnjKWRcoGC6ADRDNrxFZ/PrmK61jbFW73WWmZKM11zfaLCIwwI/WIz2kVKFvH6SgRKMrDnF8OfOyWEZ4ier8b+yU81aRGmghHQFlTLLJ72v3r7ttqJVPb7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfUaie67; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfUaie67"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5659lJqV001413
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 10:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v85XOlp6G22KyP3grDgfXY+/B0h4nwRKeUy1AK2CaOU=; b=kfUaie67mbW6FXvm
	DsoBw8fWFNd6fZYixJMvkxp/MxVN5JElfEAJvS35MQQdvUAuw2g1GhOHW8oVe6AS
	5uK7ZRe5xxcmpjRsAPOmODWCgW5SFEg6jPeRKRP45auxC37c5Dq5dCY7VOoT88K0
	IrC1J3guHUjOEbo+qWsa+sIkDf/D9gSO+DaX5dR603UlHTQHCkh37E93SiCRj52U
	GdloITm3NDw01YgW7v3yUKC1ssAToTKHGeW6n5xsf7zCvkRUQ8xubmulF/a9SVqz
	J8zXW5agY502KlQitDQBsNv/thY58JOKCk1uKBqrlwsVJBSmIzNPmOBUexEoxM32
	54Jcmg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4x8k15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 10:02:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09ed509aaso180004185a.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 03:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751709767; x=1752314567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v85XOlp6G22KyP3grDgfXY+/B0h4nwRKeUy1AK2CaOU=;
        b=MbAZEXMA2sVhrvCC0oVMFL7kL/nQTkUjaoc21vDJUbh5k/NzLuhcJiEcWmnfzGz7Sp
         ZxbP1LhJrMft5D9/GalEoohVtw6YxLbIKzRYNTmO/YhKZQ4iH3R70pkUSbCW5UA8zszl
         NNshJe8i6AXW9kN3qTrgrS8z/uAanc0G2AeS3xIR8XGUyG3emj1c6X3Lklq86mbcQaW9
         JL3B3hNdkHHNZ8KRUXjgzPbDtzJX693opHR7nNQ9JVly0qjSU+JubGaCaNC0zuiLRqY1
         /ksKvc0WsLePeY4VxQQswuT3Mx/6XjXffFXAFEAsvNhmRwbGkDp0qfeBFxQiuBAImLVa
         YVXw==
X-Forwarded-Encrypted: i=1; AJvYcCVjg3YsA4+WWJSjvx66BrD+OCSJKrNMDO5uTrLseYryBYLVc9OrLwA7qewPMupkbcVK2XXkPKwHEmk70g0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzodgeS3tMxCggVOh888J09cJy7Qan5Ma/9OHCuYMlnl3v6mhbo
	w1QsPZXhJnE1x7+LaD6QIphF4xoyQQvp8MTBNiQuSun8DOEi4e+6ArYEUsy/3g5UtvRL0jKZ1Jl
	cr6jhYb2lGvgTHJSxXHpCNpC1QfKWOI9UYUZnm9QHBReXqE9S95ykeQMBcKVXfmpPBWY=
X-Gm-Gg: ASbGncsi8XoGtMEfJG41sQYhPT5Uz3n9F3Uzh2nQz73yFwfMfc2buJaBXodkDgSUYld
	d1byBXr+fXDn1VRp/pqRO0Pu358cP6wi/C8QtGYB+EzJwrh6VBjvRm6Twqrr4IDgNqluU5AkXgp
	k0lIddiNd0Jm7TaTgeNrlvmP2Rtm1bK481+nivt5zsQwyJjHs/dbjJ2KWKzxbuDQKYWeem+5Pqh
	8gUSu0xAKAZyZGArV2YD2CBlis7IAN2ypKw9Hec07HL3gUwXk4SjFncCkoGS5xfby/36J0CmQpF
	1uyYg7goHIuEwlgvtD6uVk2p+6vBIElhLSWfWpgHOQDY8mibWiuXqivBA7XgxvU7gRGqhD+gDsD
	JRmggFWXvf9/bK5QqQfrhBlMNnMERltfZQGE=
X-Received: by 2002:a05:620a:31a4:b0:7d4:2889:b456 with SMTP id af79cd13be357-7d5f15f64d5mr239815985a.45.1751709766754;
        Sat, 05 Jul 2025 03:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyEbozZlrjhSQ3iied2i5GKQxbxxyAlBZWrqrOQXmdyuUtu57UO4K9M3gldjqkE0QGpWdjVQ==
X-Received: by 2002:a05:620a:31a4:b0:7d4:2889:b456 with SMTP id af79cd13be357-7d5f15f64d5mr239810985a.45.1751709766131;
        Sat, 05 Jul 2025 03:02:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 03:02:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:33 +0300
Subject: [PATCH v4 08/10] drm/msm: rearrange symbol selection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-8-fb470c481131@oss.qualcomm.com>
References: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
In-Reply-To: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KwQ9Fk/ez5j7BPU4OcwnfOs/f38mi3dlimt1zg0gBh0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPg0j7zdBjOLSrDl22Ex55JC6SmmlXYlMrJxq
 wMMvG/m3jqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4NAAKCRCLPIo+Aiko
 1e/aCACaV/t6Vw5KZ+eAanxu1951sFjQ4+RjZFkCY0/4NcQ31GHSeszc4BiUEILCbCK8syLF+D7
 RcMWhY+E+UXJrnABI3EP4bCejopES7I+ibcjedaSINikVJ71q2Y3/vTgTqIPWZgl0hdtG4vVRHa
 adZCY0oTJ3BvDPBGJ92eWVYwdz11qZoWLIQHo6SMwX8ShfWLl/RATYVz2gS10xVEHCKB9TrmNhT
 XvW4ccCY9QLdCKQMaMEh91MNQHiqdG0sMF5VtMVJzUbQxyvzZanP0ylOmkqC5cd8A/w+S95eyV1
 YWeRvqYd+7QezzXiPtsd2+cC/bIwpjy/nDq/rMuBglBgGLlY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfX8b1rXyVK7b/B
 x4qlSLNltQPfxzDJg40PJW1C8vVCXcBYkXH9s2KuhK7t2Lv8cMtrVSM/mQCoAYQpGTHE1BPd6KI
 FoARyVHfqjI++ULn0DBmwu4yiykPAWQUmLinKAK+UgdEQ3OfEmXl+LfFkeXWTNBbb+vem9ekI/U
 1WTmg76+nKIw/kVdXbiUhCE6vIpsCEGMSKPFvWTGWEQAvlv2LVESbAjZuKrcs4UXep55LLrkA8F
 I+EtQolUE6RmNKsqz8UUifeRFPzqyqEj7xt3DTgtW7c3OEOVG2cM+tKcNqBt6bs+R7iy+l5Xxx3
 mEpntugLiHZJwOH0FrVYYb0E2dl8bVdwqhHabNm7lYkrrjkrichgvaEN6F0fJICch53rOSi2BsP
 vTrVKid0NFcpXTpisGkJ6c5WwbKCdAuum2mX8AP0S+u5DnQLW/S3qKTaQZMbmbyhNQJMCJi2
X-Proofpoint-ORIG-GUID: 4YZvaqYbL-Bp3U5APczDQe9H2D1I8Q9Y
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=6868f847 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Dibrpul-hQ8xFFu5PoYA:9
 a=7cPi-V01pGkjOeJz:21 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4YZvaqYbL-Bp3U5APczDQe9H2D1I8Q9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050064

Move symbol selection to be more fine grained: select DP helpers only if
DP driver is also enabled, move KMS and display helpers to the newly
introduced DRM_MSM_KMS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 3a0a69f41153c5f32670e07f9728d9b9e947be92..250246f81ea94f01a016e8938f08e1aa4ce02442 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -15,19 +15,9 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-	select DRM_CLIENT_SELECTION
-	select DRM_DISPLAY_DP_AUX_BUS
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
-	select DRM_BRIDGE_CONNECTOR
 	select DRM_EXEC
 	select DRM_GPUVM
-	select DRM_KMS_HELPER
-	select DRM_PANEL
-	select DRM_BRIDGE
-	select DRM_PANEL_BRIDGE
 	select DRM_SCHED
-	select FB_SYSMEM_HELPERS if DRM_FBDEV_EMULATION
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
@@ -71,10 +61,18 @@ config DRM_MSM_VALIDATE_XML
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
@@ -120,6 +118,8 @@ config DRM_MSM_DP
 	depends on DRM_MSM_KMS
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select RATIONAL
+	select DRM_DISPLAY_DP_AUX_BUS
+	select DRM_DISPLAY_DP_HELPER
 	default y
 	help
 	  Compile in support for DP driver in MSM DRM driver. DP external

-- 
2.39.5

