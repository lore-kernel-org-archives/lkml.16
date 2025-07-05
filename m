Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE591E9B04
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 14:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751727172; cv=none; b=RfsyXDazRiTAFqAAnyDphDkCwbd/M35KOsCSVRd2J1byup+zXvhL4zEoMnQ2oBZNYyfpbM0oz8rtocHtplkxNNQmiQb1ZtRY2lkrOy+qpB1pBZvYfeKMdSIr6G4woFp40udXCofrU6mCyxVshghm7OCAah5fniL+/B8WY5XmOrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751727172; c=relaxed/simple;
	bh=Mc5soiGjmg4xMxRz4Dpb2vBENdG9Q6wchlnSfNSxRsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IA4yNMF4LmcTr0wNolBosPC3K9wR/Bsc8L4rarK1fvaQacsnnBrBNiu7dnJeGKFbTfRkG9CnOVH3E2eRTb1juSUaFZ/Xyr56GG4m8OlT4xKZhgYs0XEwRnF2gbgdIEylVHt/KZTGtraSuA/P2GuUvYDedeOtCZAAC6FaxGTrOe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCbwx1Od; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCbwx1Od"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565At2dT004283
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 14:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q8N8EuMWRa1
	mmGemJFqKzu5M4ZeUODj+NeiD8B3lAIc=; b=iCbwx1OdTY540JdijeWz6mmxNtN
	jcHGzufMgNE6sGGCM60+73X2CC5hB4a6n+mVQ6+mYuuvlMBiz2FIIWOUV/trq2ee
	UMff44up788BP/9Fy0qCuDj1vBt9XfVc7m0n9deNVhbfiOA/yIg02c60zEYg+UFT
	1gw/mHwX4iTa19joxGK3rdMAymAyIvH2bunT62OgXRwX5Q7P9EvI+qpC+eXw27Vf
	1gkUdMMhYJm7/xKconn3a1m1U3sFRSv5D9e/D3rcx7cZEu7LCUTOdHVBF0WeeYQK
	d2frJQa7ongKYNGoDsd64B5leBQe7HyseXZ1q8o4dxbEXvxwAO/VLaoPQNw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtk15b4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 14:52:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748f3d4c7e7so1241567b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 07:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751727170; x=1752331970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8N8EuMWRa1mmGemJFqKzu5M4ZeUODj+NeiD8B3lAIc=;
        b=BKl7WasgWQ3cas0gX2Xj189biPZe3taKACFkh3RT7+HSoAPjG2AoxwG5bJBDjk+HG/
         YceIduY4ljMi+UdRsFRXaQDWxNBq9dtAGX9X7pTTTlGqJbDBGVtegUgkJx3wKaWaYZd2
         aihGq5he2DeAaBEEuZb5bAgeWYMLbzfy7y4XhkhpFWoGWASEN0jDVzknk1bB6SUYlIcl
         22btE9LgIjeMzVyp9bSrc9SXd6IgFQxysD+82Nr5L/fWTvQALiz74rYpWEt+dI10EsQJ
         rK4WP8DRdsvpNd/ngP+o+XoywYs4isKtU3xTN+9aBo+lVkzexXVhopm4JTCL8YLv033N
         HD9w==
X-Forwarded-Encrypted: i=1; AJvYcCXbHe8/M99fxxJo12TFsSTt3gBe2lMTOWmBVerl14vOap2VEtzDrY0DBmXLEhXH5DWnzqTQPKFG3VXRqD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaYNCEMCYhVHGZMSPh7YAnu3QKA2aA4CQyyIt15thATkVAeKuC
	1v/87YZPeaQoxmy5InomsWNmEKBy5tJOMaW2cLIrr74heNOlJoywFPWb0TGkhkIi7zxnmcrMguu
	jazNENAKoFhJ4po6lLIU8V/NvHKs1LmVs1WKZ1SxCxB9gr2jNJWCdahKyB6FAXyVHklc=
X-Gm-Gg: ASbGncvoGLMC/4Kh5AatwCuDNPxbnenhpoGMHk5fwgSZas5ui+/mCqH/YFlA3skf3gS
	NTMbDf10h2+gymmxBudfOy+EpDV915h/HaPt7SW7f+JMXl2J2LsFqEatcyToj9TQwi01zE8kUbz
	THZOJg5VTIyYMWi01kuqDxq/90oHFdRuOB5975E3FuFhY+76O9RtGV40O+lXnjYxU8dr1/rnXUC
	6e+Cw/jQlh4EWk+vgxtTTf4kojsL/n2KrzH6dAgk2/Qq3w9yRA9L7uxPoEvIBD2j0yuNGpce6TS
	qV6MH0ZXcybEH5UmsKTzl7+fWhmjU9GZsg==
X-Received: by 2002:a05:6a00:218c:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-74ce65d7abamr9077990b3a.20.1751727169717;
        Sat, 05 Jul 2025 07:52:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEl5WMxSoNRG+3cwNkna22DGFREi0kKhH38n/zY2ySFcmwRRf5Bf2PvyWedYjvXUGUcKiTh2A==
X-Received: by 2002:a05:6a00:218c:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-74ce65d7abamr9077958b3a.20.1751727169338;
        Sat, 05 Jul 2025 07:52:49 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce4180e47sm4753893b3a.103.2025.07.05.07.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 07:52:48 -0700 (PDT)
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
Subject: [PATCH 2/2] drm/msm: Take the ioctls away from the KMS-only driver
Date: Sat,  5 Jul 2025 07:52:41 -0700
Message-ID: <20250705145242.781821-3-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA5NyBTYWx0ZWRfX7cnFP/WgOG8x
 Faolf3X3c6Kgn58uLDIlz1GlRJ3FTDnSR602DTczbvu5LMvZClVe62Ib8b7o48XlTh3yAo47wpi
 jhlqp8dqsWij4ZP5Okt8D9jIdhKFsAEqRdPDs/vT4LisvELExItB+tJt5SpeJmsQsJuwhYdH8V6
 cpKR1skz95MHhLX+iJnq/E0+2SWH64iwa5heHzLPvxFZh6tCQQ6HaQxpUWiiuC8lO7PcS8UmPSw
 Qwg65cAI1MUFHEI13xStbWaMa8FU0LEs/z6A6y5NxVLDmpaqZZNbhJo/IZb/N1CKUmShoIbL6vR
 oQ0RgReaanzlLNuSU+ZtD4D7+Fw5LA8qRWjuPRAhPvg2aVU8bCOrI9zOglawepGn0NH2UgNCGhe
 DRZxklOvAPEtQH487BKqlCj7cyUC1TYaqPbL4eGupM6uv2M4I/lkbnusG0pKeTZYr44ePGua
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=68693c42 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=2c09coKmtNN1XW7u8z0A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: vzzh-bwPIDEv1FrT0keD8okfdUlW2FSr
X-Proofpoint-GUID: vzzh-bwPIDEv1FrT0keD8okfdUlW2FSr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=941 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050097

KMS-only drivers should only allocate dumb buffers.  The driver custom
ioctls are only meant for the usermode gpu driver (mesa), and not for
general consumption, so they don't make sense for standalone KMS
drivers.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5695de1bbae2..3c856c0ae855 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -864,8 +864,6 @@ static const struct drm_driver msm_kms_driver = {
 #endif
 	MSM_FBDEV_DRIVER_OPS,
 	.show_fdinfo        = msm_show_fdinfo,
-	.ioctls             = msm_ioctls,
-	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
 	.fops               = &fops,
 	.name               = "msm-kms",
 	.desc               = "MSM Snapdragon DRM",
-- 
2.50.0

