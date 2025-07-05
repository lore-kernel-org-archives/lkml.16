Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0821E0DD8
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751727171; cv=none; b=W2FdXrUb/0hBrQAY5lkstV8M08xv+rfhDC/axC8N1SlURsOHsvvpniWTfCMAA/N4R5AP0lPctYmFrBLKRiF3PpfqXFj5YHUv6lT2/tKsFeavwPpIB118fWY66msDepZbpPsllB9ibTw6TOMcCJrsjOJe6BwYM6PcbRZmfRQXxjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751727171; c=relaxed/simple;
	bh=u+70PA6lxbtmPFc5dpKzbLcjYJ5WBLyvQ+6eeiM749Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MssLakaow4qiWE5zu2MknEpz2QOLGTrqT5TDSz3rfajZ2X0eHNBp76yvUewpVwBmlF2RS1Cu6dM+OPd44/LtY3oOq0l3k1Vxr8eSBqoCopAPVM605U7wOBpNBzrVMximhsAYWncRnXHnGqC5NSfMmmF8TthOAiNxxUYBVnA4iIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMwVlEF3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMwVlEF3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565E0D4w013763
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 14:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Nk90VOiEFug
	0vYkjADFImbzNB5RgGN7Xu9yxpfyqjMo=; b=EMwVlEF3LV1v+XqxGnc0prQi2ce
	POIJRSVXse1eRxSZLHLYXK4uhri57YWRiws8HBkYAgd/otBUdtDpq975Qs5VnOT/
	22aWWmtroGWckkzEUr9q9AS05TrBHqJSiuqwbOUDxcVDfHaLsCZTJDwUIORNXBwO
	wqrBt5BAYEf/IzKlQsPcsZUiNJwNh/qF+Gpav1WT+T0WUIBi99bH1EOn+5da9zHO
	ntWFIGsIxMauQVN7I/L1zLIXjimxjFHQfJddcYFvXM/IqwurSbUI8mEie+IS8kIV
	JCFAoYXcH7L6SYK5PddG9ue5MMUt4eZS4nTZ3RlIGR9FsSSQmHevh+L47Pw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0vsbb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 14:52:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235e1d66fa6so14155935ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 07:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751727168; x=1752331968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nk90VOiEFug0vYkjADFImbzNB5RgGN7Xu9yxpfyqjMo=;
        b=t4wl0l78Y3Iwee5sxCIHuxwya7jNSdLqsWxNAQfKCs1TZwOG0tyYchkvENVDe7D8Y+
         xjdGdgyGsCtj4VFzVAHwnv2b0q+/YL2c7Tq6Q7IUHrHo695nOpTu1oqhs+TCyPIR0eb9
         ifiU6DAyK7hsY9eN68cEECBPOTLtvUcwaDZ46Fi3vi8r4jtccjQdpZUhuEDHelAOKxYZ
         HLyeHyuPa7ndO/tkmrR+gGv7PD9FKc49YHv4pp0WdcAT1bWlpDwKhKQRAMXuhbd8wdZj
         4vX9OjlZ2mwK7EQAjXJw+kKEQGVJUv0ElAwIBmX9hV2BjoYBpj8pczC8cLGKLKfKc1hc
         tmSw==
X-Forwarded-Encrypted: i=1; AJvYcCX9V2MkM8H2dAS45mJZcKujIVMw5yB1fNXW+eEwGJpRlnHA32LPl1l9KsVCB8Dt5emRzutQNFgUdzT9PNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHB2Sb2FERO2IsB+5EdrVpXAeGUbgqQu/x2ZuhgGCekfR/GBCD
	+fpOvuCPoq13I4mYMmlOgDc0BJhGpqdW6n5yAUC5RRfeOXuJPiBqMH8LVwyv4xkcF1hmbPLhZEv
	yVCgFOiFx9VQZODhEYR66UpA8YLsB1UO3P6I/R/eOK9REa5DiEnv/lUBfGnu+MyIZoF8=
X-Gm-Gg: ASbGncskGCaZN9Xhl16DOal/FbN8nFZbaB11liAn5Q95+62AesmN8SLNPM0hfhs223T
	2SXE8FNJZ91+nwI8Y3REAk44aSIayoIHRcNPkFVx9Vo8uFYE54MuUJzddDG3XXphnSMXXp7ZvBQ
	ngVgrPG9fRF9ZG8H1hIFI9HHxPonRL45r4tg7cy5Dpm1kCI7nII0yNQPQOX8vPqSh4GoKw7QYa/
	00kb8O+JB9mC6irq8qJkZ+vqFifkJ2hukpRqCTiWpBBQWUL/0/xdWQEC7JhMnJyiHDhOfs+KWXa
	6gxuv1auL3dIRfqQV4pEREt3SWjTBp2j8Q==
X-Received: by 2002:a17:903:41c1:b0:235:f51f:c9e4 with SMTP id d9443c01a7336-23c90fcbe60mr34277735ad.12.1751727168478;
        Sat, 05 Jul 2025 07:52:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGecKCCmRq5wXE4HczwKGdy/aWs+wh50ypGWsS+hlioJO5FRxk3SoGiY7wXQgs9u1NiDjqw0w==
X-Received: by 2002:a17:903:41c1:b0:235:f51f:c9e4 with SMTP id d9443c01a7336-23c90fcbe60mr34277465ad.12.1751727168075;
        Sat, 05 Jul 2025 07:52:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a38fsm43137835ad.4.2025.07.05.07.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 07:52:47 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Clean up split driver features
Date: Sat,  5 Jul 2025 07:52:40 -0700
Message-ID: <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kflMcUmU8hazE9TsIUWqtYFdyTbCTTCx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA5NyBTYWx0ZWRfX6m68aI8VY+0G
 21WKQtQEeltiRoKuxPeLIVmw1QnD95URdL9cRDyM2Ye5aL0BA1eYxDGL6zQyZL9syuhLiEbCxFg
 gLwEl+dgSHAnxGuWloIGRd4F6CG5npXN0gdDq832UUn8uVDgJfLfrMLl1oepoZV0FM5hLRE8mW6
 97jl1RGSdQKA6R224w4OtSfjRXxRP8toQbc+fIz2E9B6zEncu5JXDj9SOjhxzCp+zhSP0Dq434R
 YcZvlw6+8+RQe0mhVBBQ/GQeCnf/yXmsDZAsSL+IV2KVX8yarA2FzgQe2SPizQOBEyAJ4WlFtTo
 AdkDjhYIGdE0bOltZvrwcCHRPv7DjSeNZV5uL7PEPtwk9tPHLtnMq1D3B+uZvLabSRchUXZAbtY
 j0KoE2t/vQRq/pT5hKE/Pn7C0lQfu3w6yfU6pFjJ6hBIZbGscxPh4XyLZl8PzGpUtz7YeDQ3
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=68693c41 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=udmpUeRRehRK9BJah1YA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: kflMcUmU8hazE9TsIUWqtYFdyTbCTTCx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050097

Avoid the possibility of missing features between the split and unified
drm driver cases by defining DRIVER_FEATURES_GPU / KMS and using those
in the drm_driver initializations.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index b6efc5b9933b..5695de1bbae2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -816,14 +816,21 @@ static const struct file_operations fops = {
 	.show_fdinfo = drm_show_fdinfo,
 };
 
+#define DRIVER_FEATURES_GPU ( \
+		DRIVER_GEM | \
+		DRIVER_GEM_GPUVA | \
+		DRIVER_RENDER | \
+		DRIVER_SYNCOBJ_TIMELINE | \
+		0 )
+
+#define DRIVER_FEATURES_KMS ( \
+		DRIVER_GEM | \
+		DRIVER_ATOMIC | \
+		DRIVER_MODESET | \
+		0 )
+
 static const struct drm_driver msm_driver = {
-	.driver_features    = DRIVER_GEM |
-				DRIVER_GEM_GPUVA |
-				DRIVER_RENDER |
-				DRIVER_ATOMIC |
-				DRIVER_MODESET |
-				DRIVER_SYNCOBJ_TIMELINE |
-				DRIVER_SYNCOBJ,
+	.driver_features    = DRIVER_FEATURES_GPU | DRIVER_FEATURES_KMS,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
@@ -846,9 +853,7 @@ static const struct drm_driver msm_driver = {
 };
 
 static const struct drm_driver msm_kms_driver = {
-	.driver_features    = DRIVER_GEM |
-				DRIVER_ATOMIC |
-				DRIVER_MODESET,
+	.driver_features    = DRIVER_FEATURES_KMS,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
@@ -870,11 +875,7 @@ static const struct drm_driver msm_kms_driver = {
 };
 
 static const struct drm_driver msm_gpu_driver = {
-	.driver_features    = DRIVER_GEM |
-				DRIVER_GEM_GPUVA |
-				DRIVER_RENDER |
-				DRIVER_SYNCOBJ_TIMELINE |
-				DRIVER_SYNCOBJ,
+	.driver_features    = DRIVER_FEATURES_GPU,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
-- 
2.50.0

