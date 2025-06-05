Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3282A286D6E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148392; cv=none; b=H5ozKBE9hod7NvLKDlW2ity4Q969cUatShveT5ybczC4pUIxDlujnnHSbUDfMONjzpJvRsPVqOBpHi8/afDW6LLIdf2A6e6VB+o8OGF14WNKDdCzZxgujMHTS8fH5oqanwPt2APp2C7c8J6NcGct/sD1+MkNP+gU6V4XzjExJ7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148392; c=relaxed/simple;
	bh=npcaXqJDoSyMBRhF30x2mSPk/8hD8RjcLAdanR+hf0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aN+jqPI8ts7S1zN+Kg6zqtwLUzE91nCEanUa7aJ602mmu0XMhOpzoJrc0Ou36u6BGxkGQEfbNT/12jTvPUP+oXPnVYkpCyHN1fNb0b5LjRIU6BIIsYzZUF+cNKleRvM+knrZNjIyEXYw36rlMvMoC+P+fUZG6PzDMtnjXdN5hYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDgP4tdd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDgP4tdd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5559DRFw013495
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YGw3pq0xuYX
	eB0bxqdCW/EyRGUrXHxJgo02Bi+E/25I=; b=nDgP4tdd+Ws7bev+GhOhAZpuA2f
	M/5EBWVxMI9QxUQaxxy1c7EQj+40WKPc35VOwdybVzQVPvSLi/uNj5CVH7u0jtzH
	g34lyK9urU3eUUuTdkyfQwdmfZJwhkmTpsvodQBhbXN4pgDi6EcYO2ogcrXEzRvQ
	pt3uVuNQShO5jBWVOW8DYplSU8gcl/t6+18vrDdHeXgHEZeIpHYpFUuway26NujA
	9MbRlhmnyMWkka6pk/wuCxmJFr2MZrFGUPiXe/p90wq3HSuilqJKIDaFrive0Wb9
	OWcw7fHa6h0llk8l5P5ChrLd+NPdTD0hMz9NVSWqClEnrl6LQ3V9RWvnJHA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nt9vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:33:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-6c8f99fef10so1344148a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148388; x=1749753188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGw3pq0xuYXeB0bxqdCW/EyRGUrXHxJgo02Bi+E/25I=;
        b=hfYU6sqlpzaflu+vsP7vK+9ztyd9ToFh+jbJf7SuEAeq/LYz/aRQbbn0vD5xteICZD
         5M2MI56dvTXb+hsJ/5RLbHTusWoey5Nq6EdccaDEHdIoGx2VpcaJPGaQ6u3U+rL/2GeK
         ToOK6Aef9TFajn8C2xwuEGWZjw1gANlyPSsZmJ/PBp0G0jMHOKCccL2hTCVZXCoYVXea
         TvRFvlX4cKTYzMN/jy5CIKPwKXZUW8bJDRg97nJAK4wSGGqi6mp9o4B72V50SRTIFXhL
         97Gg3Rxax6ORhxqCHv6CuPVSKMEzVgWniTeaLgyEv5PYstS/AMar3KxTSiJ3lHGUz/wc
         gkyg==
X-Forwarded-Encrypted: i=1; AJvYcCWzo51rPgSHU3+uKR3DnydaVQWTpMHLd0hvMSaGDB2rX4+3nKyU48inK6hVcxjma6u2H3mGSEC8JUIEbrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcTNuuTqmRt/r6nn1E9ruVG7abE5Eq4VQvmwtE9g46UeeB59JN
	T7sSEUU64+1HcaXU8hjwNQze3s7VTSGiGeXxJQ8WBYMblH2C2JRmlnWzicm6HDuAzE7kaEoPkyZ
	3/rdOLpFKbEUt2GyxNo+HY/Rhgq1jxnCt6wT+6yIPLvM4Lo0u17W/NgVHYoCi6wby8ns=
X-Gm-Gg: ASbGncvOGWbYC6lzQMphMQ8+35kbUHjqrEE5pY6QdgZnecqCHV7JgJiFnkp09mlHWDn
	IxfImjJu0Nlb4fxiYje6PVBX04A+umCqO2on1hSGvHr4amqV6Zrw8qHFXrFlcXRjF4z4QkOhfho
	WeZJE1FPGzliR8es4BluU9meuJnc7bKbAQm4zb9sCTV+djAvEzGBB9fKMKgAq6JSr+ELZzN8W+F
	f/J6+8Yry6zF0+Zv9N/mGGm104Tr6ksVhmsHZ+AtotNZXqO0l95aUfOEJ+I+Uy7YSgzWiWZk7M2
	SFJ/eoLc0RI9MMc5vu85yw==
X-Received: by 2002:a05:6a21:4cc5:b0:1f5:8fe3:4e29 with SMTP id adf61e73a8af0-21ee685066bmr387125637.3.1749148387730;
        Thu, 05 Jun 2025 11:33:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZy4+h7p31V7pW53fals1CsboObn2Z1U4IfzK+Rx2MlP/oVXrylzGSxEK+JWTBZYf23+Ce6g==
X-Received: by 2002:a05:6a21:4cc5:b0:1f5:8fe3:4e29 with SMTP id adf61e73a8af0-21ee685066bmr387097637.3.1749148387380;
        Thu, 05 Jun 2025 11:33:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affadf70sm13643103b3a.91.2025.06.05.11.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:06 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 28/40] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Thu,  5 Jun 2025 11:29:13 -0700
Message-ID: <20250605183111.163594-29-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rpfZtyapSlQIu3oT2f-sF6wwlle0RpLT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX4X7i8E2OBbnp
 JvaYkYj7tVWWeeLyGdJKgjj3SUw2/tq3bbdOlOmtg6ubEF/1KBPCbTkOdQeW18aNSRrudSh2+0L
 d5ClO8eVGq6isSvfAvNQjvH4AsFf2rdYlK9AWWNfmHnOn5u4X1kFc7m1ZV5O9twqFTXd3bVUAFi
 MKm04PobHZdC564wd+b94bkKHa8OqKw8yjg5oPAcNCzIvcCSB21UTZKdcZ1QG5eT4ObN6WsN2tN
 o1djl0337YGv/MYWVCuzlTahry1URBiBxNRzITBUnIuSa5LUMNH2UNUqG/wF/LdR5RSvPBKJZ0N
 Vge6ps0G9j00F2OJnRzYmA0BNmjz8mwq68FNI4Dgi2zQy8y4e7NXxKbpJohcAf+QsrCz04mTg7/
 mNsDBq8Jn5edr8zC9Wz2PsLnGogWh5uvZBICEg7nCimqMwLp5Gj2Cf53p20jLro/4aJ5vZYA
X-Proofpoint-ORIG-GUID: rpfZtyapSlQIu3oT2f-sF6wwlle0RpLT
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=6841e2e4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165

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

