Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2249A2F431B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877950; cv=none; b=cmFo6VgJUP+MSLHRw1nXGvUMGs9L8CMdlx6yjl+ymlc4iBXGOiroqzXahYbDtT5Husrlu9ZT1Z/0HT1OK2P5Id81negplDwhKWllGBE37/58z1nV9D4hCEPlgI2reCpXbpWQ4enS9pMwlHBUvnV1BWulSvVotnNQqHKt6JV9MAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877950; c=relaxed/simple;
	bh=npcaXqJDoSyMBRhF30x2mSPk/8hD8RjcLAdanR+hf0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHfEhayTkyx4wTCmiNJhVDfO+vo22urVCNlwjWT5FH8DCAPZwt00qpDaO09Kom10O29lcfy6h+TUy/hjii4oGODqijpTYXF+BUr0sHVFXCIi3WzOyr5KboIJUG22LmjRGZ1cyAA2wV1cjjgG/g9anD1Vs/l9dgtGfwya/cuASdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzcpaVVY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzcpaVVY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PC5bPr014481
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YGw3pq0xuYX
	eB0bxqdCW/EyRGUrXHxJgo02Bi+E/25I=; b=fzcpaVVYOQkPu+AqJEW5xxL+2Dr
	sJP3/k/nXVodPhaR9Z9hZrRWY4HMU8w72ygsq5YB1dpf13DKZvItcuz5f+wAi/VP
	hOkxdqxdmV04cGSmv0e4Ir5FV3NVrrAmO+78pQZnaYgFKyN/+tdvGxwTqxv1cVgy
	I8xv22yU/UiN2LtRjtwIVKf+E+4NpmGe+N/fm0xsD0hk2coNB8Ywp9hChf14zoPX
	LFp0IMswHz3huuewD0tzkhUC3dnTqqDRiqHA9/gc1wIEbt0YW65/VVjz/K/coDHz
	ULLt+3jqg5VHX70xrK6un1LsCfZSL0CPM8mxbFZv8n8PpoqyPCw8Q2jDsug==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5t1r0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2365ab89b52so1571975ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877947; x=1751482747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGw3pq0xuYXeB0bxqdCW/EyRGUrXHxJgo02Bi+E/25I=;
        b=vHlhSe/D4/yxDfc+/OngzQoTi9Ws2wTV6CfFNCUTGyhKtQFN8T75GC4zYyVcoVKEaM
         BffyTPogdD8K9nGL7ZE5fZEEzPnIHLLlBAN3FwqR0N0Xlc9mqseyUe9WTFB97VoV4JRd
         FuC6OpXoaMjQ/aDL60Dz8V+UyP2sEoiSQmL5X7Wa4/axV51dP3MH9Y43lIxcBEDCR/wz
         qG6jlhBfk+gSMx67NaYtrM+aWF8yy4X/aE1Jhxh0Lidh2hHoHxLaQvC5Pa8S7GWJwcU9
         OfFoKW4vGEvCxdQllFifwiT6PZwMFrWSsWUh6frSHioHLNAccyn+Qf4MqPWxtho728Ix
         ZPwA==
X-Forwarded-Encrypted: i=1; AJvYcCUB4nTZu/UkO2rJsdfu+UFPlhdfaXGfmkwsmsrqHFWf6tOdPVWCnFPHZaVmAKeOpjwQRjylQ9cjcwdDD/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YynkLxV6lTaCeklrIB59B6TqOOqVJ3X8zxLgjYnKxE0hyNRS+Qk
	wAuEzqkR1P95HLevnf7q+1584Pp+TUUwUVoGdbIU1TgZYOxLRw6I0J4jXQ2aY41HrnboUNBLvQ+
	xFNUQuqiOAcf+21rBQwVg5oM/qohfjXijnHvYOoZOjJmGrIGdkEm8G422ZIBBfS84Mx8=
X-Gm-Gg: ASbGncuQwEhBtllR3896NxmWxwWifWCWfpx/zgbd3cJSpJgKe0m5JbZgmc0AA6keXz+
	jD2MKNWFBStu8Olfz1vmI2boJsRnc1bgBoKjt82wuSK8grggscAvANusB5vGeH2mYNRP0Ovd4FA
	uTJVx7svfSTiVtrjkk1y5qHJ2wOD7haOSsyGvHZ+/x1A9CONUnMxU11PEtZ1rFyQy1Sg0wHR0B+
	PmCukngRWmiIWS6vM5P3wXFM2WRkqBy5NJZvisVdBQDw7LS3hdlvMJ2qFm7kv0SN25eedwx7vOX
	XNL0hvjgo4DEmbH9VfxF4dK3jY/cXO1d
X-Received: by 2002:a17:903:2bcb:b0:234:8a4a:adb4 with SMTP id d9443c01a7336-238240f5674mr63435525ad.21.1750877947523;
        Wed, 25 Jun 2025 11:59:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWujkmyQJzCosZxG0/o9huVMzGmefy+6BjUnqrS3MSq6Cgpe4WC/Xv+9jKHpehtNVJ8NIU0w==
X-Received: by 2002:a17:903:2bcb:b0:234:8a4a:adb4 with SMTP id d9443c01a7336-238240f5674mr63435275ad.21.1750877947137;
        Wed, 25 Jun 2025 11:59:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86628ffsm137223375ad.156.2025.06.25.11.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:06 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 30/42] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Wed, 25 Jun 2025 11:47:23 -0700
Message-ID: <20250625184918.124608-31-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: soaaFocQSl3nPyLWS5jwH0T6CT7OYSIP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXzAt038Jkj0P4
 cLPgzHmHgkApm8gPIt0uRrQRsU9zglWidW9lesYS/oVs2qUHFNKBpdtx/Fn+ThEfJQOV9dWVJcj
 DNLroFgLFVmbU0d4yLGg2C/tozzkgs+8uXc0Uys0UarPsmv+S5m9fYvwghgCGKnJreyaWq19NTt
 yQxRhbo6z3aYhIt26h43E8buMAQafLVU6dYl6V3lyC8gzQRYILzMsWCfeOsPGg0xuoW2/W1B7vO
 8BMd6n71e6LGDeUM7aveW0ga2YXW648UnB3cnzOKUMeBN26frLdmc0rYeqn529Gm48mmcFzXrPA
 m0tVqLODiQgOPxgXQQidugnzHSLJE4EUhRMtyEJ2kpatK2mjRhEwQq8vf69JJJLuR3i6OejkM/v
 u8LLLmj/4S7zamexMbkrI43HuQ0ClgWTpbCZKpPMYB7geIf2qwKPgFi38f6JfcBO3JaGfBpY
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685c46fc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: soaaFocQSl3nPyLWS5jwH0T6CT7OYSIP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

Any place we wait for a BO to become idle, we should use BOOKKEEP usage,
to ensure that it waits for _any_ activity.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c          | 6 +++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index ec349719b49a..106fec06c18d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -97,8 +97,8 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	 * TODO we might need to kick this to a queue to avoid blocking
 	 * in CLOSE ioctl
 	 */
-	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ, false,
-			      msecs_to_jiffies(1000));
+	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP, false,
+			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true);
@@ -903,7 +903,7 @@ bool msm_gem_active(struct drm_gem_object *obj)
 	if (to_msm_bo(obj)->pin_count)
 		return true;
 
-	return !dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true));
+	return !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_BOOKKEEP);
 }
 
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 5faf6227584a..1039e3c0a47b 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -139,7 +139,7 @@ evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 static bool
 wait_for_idle(struct drm_gem_object *obj)
 {
-	enum dma_resv_usage usage = dma_resv_usage_rw(true);
+	enum dma_resv_usage usage = DMA_RESV_USAGE_BOOKKEEP;
 	return dma_resv_wait_timeout(obj->resv, usage, false, 10) > 0;
 }
 
-- 
2.49.0

