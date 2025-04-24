Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE9A20D517
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487042; cv=none; b=nkfn8pV+Q22kYC5PwodWHjPravBjXdBk4pEYc2+njJPZXP5G4fSuh6mJPCn8vgdn3aaNGUGwQBeRTxsV4jInaWmOvwCnLnhkqo3n0zo4jjtnGw3EjkMqnM0XjZp+P/aRGiRUgzLwWO2z7t2RrC7y7xHV3eDRxqRokjGsvi4aZXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487042; c=relaxed/simple;
	bh=BADQwtzEfIqmdry91ABJFWu/ahxyhjqsUqlLLm6qRok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NAfS+e9sX1Rmncl9BxuxIPKyNLEsadXxalSDZmifwB50NJg9G7DL3P3jg/UyJMSAETFkIG6ouW12ksOETXxCeKEnJLGgZUnXqHknYSTf0f4YoOpCG9jlq90g/nMt7ib+Nh1NJotCVc6PYR65nS3BecJoLD78htUbGrQEwTenzFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHVHBo6s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHVHBo6s"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F7RJ013249
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bgw5w6Jz5CCY8K4ZBzZ638Sd8klA46YawrWWMxJ7sso=; b=lHVHBo6soTzMiRN3
	tb1QofpoyCkrIzZtYbYvZl5UEk0IEJFlY5kfF1nVPQ7q5Ws994BxhrUkhy/1sMIv
	lixco34/YlJfpFj4G8wyHL1L2T0wk2wXl75I4QniX2qpTdu7GdYvcFIkioPCBfAN
	GiTr2iw9k+wjArKqVPE4OA8Grygzgws9nUL7ZIPLj7hvdXipLn2ObFpV4FR+ThDG
	CP5AC2OiskvxNylOp9dL9Eya+6TC4gULXkRUhjE8pVS77IgKUdHQvFJkZAI8TcIX
	0X5YseSD/lcD/bdugZoaL62Z/q3KensyahUXINmZyaO/9jKM/iUH6dujD1K3mQ6D
	IoghGw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2d04c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e90b13f5c3so18520136d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487038; x=1746091838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgw5w6Jz5CCY8K4ZBzZ638Sd8klA46YawrWWMxJ7sso=;
        b=ECVl486xmdNeQfsGh4qbV4E3mwzr5lSVu25fGBeSB59ZuC+6UmyGiL8DrU0EvJ4jNh
         Vl7que+mP4ANqw/PV0VUECevifwGo3rjltT5y2yUurctdpbtmsVfmjVoI7lDl20ySiE+
         A6DaWjb1qzsRaPEvJYN4c77pwsW9pn29ZsI1uIBB+K/396WOOh6jZXgY+079Nh8Nk8QK
         teOd2Y6AP4GFTLHlEtRhWXcY8MP2YCayUWP2Lt8TGenOlfrAqhF79vpGxX/4Ic7LCe43
         hLe1d2Mvfs4iUA+tCfsOX4AgkLf/akkrl1pnD5Jd9SurDFmWRqQzg4fQLZNRh2Baexd4
         OvHg==
X-Forwarded-Encrypted: i=1; AJvYcCWR+t/g0ykECmjzKwEyLJ/ir15r6yYNM8ZheW//NEdrKpdLVIp80d6mR/YAyEDpZRW6b/izcQFx29qMqUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx36h+diNJJCtNXJXpXduIS+w47o2aVGxkDByAHPXlKSrgmT8RM
	DPpzg/dCSGj8nW9Q8eAN6+4bUEytv7NmwaaNwhg45aVxokCN4k5d14/+fmlSNKR0XmcKGPsnQKu
	11YQRsf1MSBuA2d0VRaUVrxTG9xbOPQk3DwLNfGqqGqGijOIUmgM+5n5e6i0QWbU=
X-Gm-Gg: ASbGnctB7ES8itgKIvhCV+xjpi1tDUtdkjdEE4jWYkoGRUhb5knVy9PlIxsFRje27QN
	iUeVmFDcX86ZvoSB1HBRYGMzCgYJ+YVDRg97qCKZI4BQDPami5yv0i03IN0MWRr/7ZP/HFUjJd7
	Bp6fL75WvxdUatfkVEhmLqJR7alof21//6Z0uRlCyQw041EVRceQEXVBCAPVuazxrloRDmiyk7V
	QBke57UlxgE/EaIkU8s3nwouY5FL7xQ+1xBXbIWGWi1a/XkWurAlL6uGOqCUM70Vkkq/U9mObzV
	8AP3As3j1XOxUz/u8uuYMrFUJro3iyYr/wlQv40b3op11C4cogXdm7b9G1jGhDeRSPkcWidat13
	26dxXlR2nUDSTexlFNQ6zyYej
X-Received: by 2002:a05:6214:d8f:b0:6e8:f2aa:a8b0 with SMTP id 6a1803df08f44-6f4bfbea652mr33175106d6.18.1745487038027;
        Thu, 24 Apr 2025 02:30:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvwBz40WSrk/d+/umWPXxXJTB9VQ3N1H+0AsJ57bietmhxEZmsUeRU+GZrZtNc7PCWuFiaLg==
X-Received: by 2002:a05:6214:d8f:b0:6e8:f2aa:a8b0 with SMTP id 6a1803df08f44-6f4bfbea652mr33174756d6.18.1745487037501;
        Thu, 24 Apr 2025 02:30:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:12 +0300
Subject: [PATCH v3 08/33] drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-8-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11085;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=x2jmSC9gKl9NnUFLRgdzswBb50uCdVNQ6+tX2ykb8hA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSrtdYl7kmUvsNg1/uIObaogE24lE8rizvDX
 SADxmWeuNyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqwAKCRCLPIo+Aiko
 1ZJIB/9++G5MI52D6unsT7D+/lUIir5fRCQlyOUyFhQ20DGcB6wptwRn6o8pRwHSrXfi/0Qm1IA
 rpvFMrZz7fzXTBKZG7pmPIsYk4AWIUX7zKYQjccoPQ07j2FNM43Vul83u0b6WD4Q/837s2cNGwh
 Q7oy9ch5h6dljFgt8I8XXKFv2H4D7PchUgIEHGTw8tx8dmoyxkW0wBtmZdnSsLauguQ1WuhdNXW
 /thoEzxVsVotBfrblCBKlja2YOtmKqL5qAufyXCbUSu1CDjWXfE09gfN+y8NOAjsQD2HRHn5M24
 m6+iJsNPKdBVzEz1304IJZjuyQq78gC66SfWTZoiOhxY5xEh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 2w1KsSzI-io4geAlYu-IKEK9m4mrHQob
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX8DJ1/0pVlJFU iP3e1ch85UH9GZRcGBg6uw6FCGy1WhRA8QfTfXMKraL5xKavjuOt8/fs2xjr+Ll37Rqvaxhxbyd ZCPu14ZDtsIo6q0cQMqCvDqo9iPzwCBTGWMNn9xYUtNrqmsOdQAyS+82ifXncrtlNZLI8RdmOYp
 C7+5ZOhfrG5vg1K0YhW0BithS/77OOSkyBaL3/zOkNC8GzsUmJJXAGdgHpkBEs8vQvXS4IXJjMW O7YyZIOK/m/Q3kg2qhVc+901SjJ2z0hy7IOJOFD1CA2aWBtWll6W3o95b7Rt4ppgFn3o4mAQRJ6 7cv1C3XGJsmVyzSumpTXDz6f4MgGDlXQNB9vqRTN7ur62xqUm57RbIcN+MgYipdQNglzx1cyKBm
 8CU7X7/pJxYcdlIS4gxM1brcteSU9+UnHgbjzmFRk4+pqHu97CBgW2FODUnXJ4vd63QFA5oz
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680a04bf cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=mVeP-GC--jfuYOuej4MA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2w1KsSzI-io4geAlYu-IKEK9m4mrHQob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_HAS_LAYER_EXT4 feature bit with the core_major_ver >= 9 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c               |  5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h               |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                   |  2 +-
 8 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index f7acceba7af1e8ec4b9c0cb52cbec60842c73704..922c9c6ebd82cdfc7f948df590091852282c9f64 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -32,32 +32,32 @@ static const struct dpu_ctl_cfg sm8650_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1000,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1000,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 3907d143056e2513a6a6bdd8aa2b56f63ac406cb..e17345d954f26b234ef6cd65843e1cb349376ed3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -32,32 +32,32 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 8cbec3741338aba07a780194ae50c162d2087d83..4d37587d6a6374d9e6ed6d8f13837aae0ef55c34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -31,32 +31,32 @@ static const struct dpu_ctl_cfg x1e80100_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index fda429972c35acc1e44c4384cf6d72d7e9f120eb..c3b659a12d58e18aaba65ba88ff5de131d712412 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -116,9 +116,6 @@
 	 BIT(DPU_CTL_VM_CFG) | \
 	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
 
-#define CTL_SM8550_MASK \
-	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
-
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4cea19e1a20380c56ae014f2d33a6884a72e0ca0..81592cbdd5d234dacc154778492382faecfddb39 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -136,7 +136,6 @@ enum {
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
- * @DPU_CTL_HAS_LAYER_EXT4:	CTL has the CTL_LAYER_EXT4 register
  * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
@@ -145,7 +144,6 @@ enum {
 	DPU_CTL_ACTIVE_CFG,
 	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
-	DPU_CTL_HAS_LAYER_EXT4,
 	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 466bfee3db52d980877a5cdc4eeb739cae250afc..8a7408801bb59e8799e67115ee00cdfe87eba668 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -549,7 +549,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(c, CTL_LAYER_EXT(lm), mixercfg[1]);
 	DPU_REG_WRITE(c, CTL_LAYER_EXT2(lm), mixercfg[2]);
 	DPU_REG_WRITE(c, CTL_LAYER_EXT3(lm), mixercfg[3]);
-	if ((test_bit(DPU_CTL_HAS_LAYER_EXT4, &ctx->caps->features)))
+	if (ctx->mdss_ver->core_major_ver >= 9)
 		DPU_REG_WRITE(c, CTL_LAYER_EXT4(lm), mixercfg[4]);
 }
 
@@ -720,12 +720,14 @@ static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
  * @dev:  Corresponding device for devres management
  * @cfg:  ctl_path catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
+ * @mdss_ver: dpu core's major and minor versions
  * @mixer_count: Number of mixers in @mixer
  * @mixer: Pointer to an array of Layer Mixers defined in the catalog
  */
 struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 				   const struct dpu_ctl_cfg *cfg,
 				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver,
 				   u32 mixer_count,
 				   const struct dpu_lm_cfg *mixer)
 {
@@ -739,6 +741,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->hw.log_mask = DPU_DBG_MASK_CTL;
 
 	c->caps = cfg;
+	c->mdss_ver = mdss_ver;
 
 	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
 		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 080a9550a0cc6530b4115165dd737857b6213d15..aa560df698ed4e57a25e4a893d7333e19b065fe8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -272,6 +272,7 @@ struct dpu_hw_ctl_ops {
  * @pending_cwb_flush_mask: pending CWB flush
  * @pending_dsc_flush_mask: pending DSC flush
  * @pending_cdm_flush_mask: pending CDM flush
+ * @mdss_ver: MDSS revision information
  * @ops: operation list
  */
 struct dpu_hw_ctl {
@@ -293,6 +294,8 @@ struct dpu_hw_ctl {
 	u32 pending_dsc_flush_mask;
 	u32 pending_cdm_flush_mask;
 
+	const struct dpu_mdss_version *mdss_ver;
+
 	/* ops */
 	struct dpu_hw_ctl_ops ops;
 };
@@ -310,6 +313,7 @@ static inline struct dpu_hw_ctl *to_dpu_hw_ctl(struct dpu_hw_blk *hw)
 struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 				   const struct dpu_ctl_cfg *cfg,
 				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver,
 				   u32 mixer_count,
 				   const struct dpu_lm_cfg *mixer);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 3efbba425ca6e037cb9646981ebb0f0354ffea8e..1ed458aed2bc2c54f6e02acce43d88927100b99c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -140,7 +140,7 @@ int dpu_rm_init(struct drm_device *dev,
 		struct dpu_hw_ctl *hw;
 		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
 
-		hw = dpu_hw_ctl_init(dev, ctl, mmio, cat->mixer_count, cat->mixer);
+		hw = dpu_hw_ctl_init(dev, ctl, mmio, cat->mdss_ver, cat->mixer_count, cat->mixer);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed ctl object creation: err %d\n", rc);

-- 
2.39.5

