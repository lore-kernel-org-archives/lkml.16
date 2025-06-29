Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1379F240611
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228217; cv=none; b=IHogq95jqDP4/Dz9Vy2LDu/eaZ6iMZ7qpyDOW0IoAc1n+JjsmYYacpjulN/aZKy6M2lcESmG6JmmSBatwgBvYv610PwywUIGKZbxzIx35SWCnr3cNFBWqkBwL+gvi8moNDUA1zycCz1Awc3rzg1hQ+dnjc/nsooGeufVsMab/Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228217; c=relaxed/simple;
	bh=YuCHHK211nqpvFmOlpnR7LLsU5KAAseFcypOymve7lM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c2ATFxM/iPVvaBGbjVL7rb3hWT6JE+oMCF003UC4ObBKGd5SeNnBp3N+4J7H65YeRxDzJ1HLartAOMk07teMWbCfjkLMUX22yfQ3CLlyBtkuoS68kxkAHtKwYGeZp2c6Qr5M0yQti1TII3VNLp6O4Whi1luVT/VMe5WMQIsEvEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTS7oMPV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTS7oMPV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJmeOu032248
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Dn2IbO0/ubD
	WRHxm3cfadMPbuPKYgkB0YKeKTE62Wnw=; b=BTS7oMPVvVkrT3R5ytS6GeI/QlQ
	I2LXgxl61XW3RhqlC4yvUxtXPKcOCJ7XhdCkNe7sPK03S/yMVQznK0nbkAaA9wyx
	txgxB8PudflKGwJgcJMiHLUX+ChxhnSEjj70/Hiz84Lfl4BrD7Vq8/vfvLplcRxd
	ScM8UFjSyziyH/Pk+HwuVZ4TNiFRYsADB5iB2lOIXy4ezREIJZbvxZuguZd5Z4oR
	AQX9yqVLaoaLX+hsYuyFvX7jS/OXBACThab+DGSgN3jCb4J9s8oBMKE4HD0cogzp
	Uul2YJlUsfbyr8WEa7w0naGzx0+cQHjNHO2CEP5cztNt/4dz9W9H0VUMfrQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxan8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23507382e64so10328865ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228213; x=1751833013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dn2IbO0/ubDWRHxm3cfadMPbuPKYgkB0YKeKTE62Wnw=;
        b=G2k6I6rGzon4C2zx9ur8lxPbyB8gdRtTkhzy4PHynCTw6NM1k7fPxLlImUdpTQUm8y
         rabQl9F36yPxQJ9aMD5C+xn3fUvQGzi+YTpNBV0Zu6pwqjSqbyaijKBPp/a9qyMrU8uA
         nkjzvbPQy+wtPYLhGpiR3tbYiPD+F/IAsA436ibp/O54DjvmafaP2/n7M3dFCy5ZLah8
         mm2wXFXROmUufCc1x016SMU6uuEbMmhzzFXB42rZPApcSG0PtnBLuck1YZCQmX0fdNj7
         Ic65n8HrquyvlFOnrFxTBnhsFJ+Dw8/TK6T1sXJPPPP7s+NfFlMr+XWHsNuFpqkwlXnE
         IVpw==
X-Forwarded-Encrypted: i=1; AJvYcCWVw9dot8fQdpRXaVKtJ16S35406Qe/UlfPRBHk4JVMm/ygbNQkwSUQw5iV4QTBfHnxmIP/1TWWQQGCiBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YybwLV1MgGbDeIvmfjC1EmJYeF3E3v7ygrwT/zwFWEN16EqLES/
	j21kRKCe7mtE3I2nEKwGtMLy3oF/NMCEZoMpVqJY0gGr2nbkSNq1xwpOw22RTfwhr7iHz+qA8oS
	LK47IIgAc4zEI8Y3orvP7/1/ZRsfXuMPksqfZqDD2yRrs5yFyeV+b73u6wOqyDGcRbNM=
X-Gm-Gg: ASbGnctONDCLXqyzNYBNWv/N+2e0QDBPoU0fCkv8KePWA61q071hRPT3c2mJW7MwFdD
	wcg3mpOeqK1pdpRAEgLD7vqhk0iFp/5PE/0VGGDIwA6xsmcx/B3cs/gC3TohGICHAU8mUsjKp40
	1S/WmmII3HPLJsGUMDNqQerP0mUgApfST42Jbt6bz6tElluGsbJowuWtHVMeOm0mPBBUJyWHtjd
	t5iRFTODafNjY/xVshYOYcPlWD5zQwbnauV15HZPntLjD/o/CRfiUXHwy9l8S80StjB8IYpzm1P
	HxHLKMsV90Es5TKfDwH3XSkmaL/5VIfGEg==
X-Received: by 2002:a17:903:90d:b0:234:c2e7:a102 with SMTP id d9443c01a7336-23ac460737bmr175224975ad.43.1751228212476;
        Sun, 29 Jun 2025 13:16:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeA1tYAd7bfr1WUtJgWKUVLuskW38MgxuNwttD3gRKKh36qxhhXmusocB9o5of9/VCGqf64Q==
X-Received: by 2002:a17:903:90d:b0:234:c2e7:a102 with SMTP id d9443c01a7336-23ac460737bmr175224585ad.43.1751228212009;
        Sun, 29 Jun 2025 13:16:52 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3ba4fesm64273895ad.199.2025.06.29.13.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:51 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v9 24/42] drm/msm: Add _NO_SHARE flag
Date: Sun, 29 Jun 2025 13:13:07 -0700
Message-ID: <20250629201530.25775-25-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX0OzYS7vj3MtD
 3SMc2POBOz9cbFKdn5oj22R9x8ThZdCtXlGKljc3eAqdAgyC3rK/q+B+qQDKaboB3Qj9r4LZD+N
 qXgW3LnLdhNvuYxDgq7fkbkfnjTikRRAX8BBWMmzKzlhZ20/XEEXiG5T701FvcNEGjp2wgBI7px
 iwoSOOaDE2asPNCvOF/9Q91WbWng5tfLDEDsBGjOAyymZYDgOIzEaAt9SGvIbG0AOpGi+yP5lGs
 CvpIyNvE66pmkQsEYBHK+v1Rg9cW/urILuPOgaLNEVngNKLoaS3XBRLN1WakSXpJiL5IWX4PuXV
 uTfvR1J9uOpNJuvagvIDPCqaZcToCwF8lwY17nC/1vIhTYbB4PtXVpVR2KGobuSTnL99xXPljp6
 UMjHQX288bOAXeo6VxC/S5G469LKdutgYBqz0RHo1BGH6j/BYFXVygayREDfDbulx26D7EJ6
X-Proofpoint-GUID: 04E7sKz1GB3hbEdhm0glO_kvbZyr7_WA
X-Proofpoint-ORIG-GUID: 04E7sKz1GB3hbEdhm0glO_kvbZyr7_WA
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68619f35 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=5GAAy6agFmV6x6zTEMEA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

Buffers that are not shared between contexts can share a single resv
object.  This way drm_gpuvm will not track them as external objects, and
submit-time validating overhead will be O(1) for all N non-shared BOs,
instead of O(n).

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.h       |  1 +
 drivers/gpu/drm/msm/msm_gem.c       | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_prime.c | 15 +++++++++++++++
 include/uapi/drm/msm_drm.h          | 14 ++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 0fe3c9a24baa..9b1ccb2b18f6 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -269,6 +269,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
+struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags);
 int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index d16d3012434a..100d159d52e2 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -546,6 +546,9 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 
 	msm_gem_assert_locked(obj);
 
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return -EINVAL;
+
 	vma = get_vma_locked(obj, vm, range_start, range_end);
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
@@ -1076,6 +1079,14 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 		put_pages(obj);
 	}
 
+	if (msm_obj->flags & MSM_BO_NO_SHARE) {
+		struct drm_gem_object *r_obj =
+			container_of(obj->resv, struct drm_gem_object, _resv);
+
+		/* Drop reference we hold to shared resv obj: */
+		drm_gem_object_put(r_obj);
+	}
+
 	drm_gem_object_release(obj);
 
 	kfree(msm_obj->metadata);
@@ -1108,6 +1119,15 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	if (name)
 		msm_gem_object_set_name(obj, "%s", name);
 
+	if (flags & MSM_BO_NO_SHARE) {
+		struct msm_context *ctx = file->driver_priv;
+		struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(ctx->vm);
+
+		drm_gem_object_get(r_obj);
+
+		obj->resv = r_obj->resv;
+	}
+
 	ret = drm_gem_handle_create(file, obj, handle);
 
 	/* drop reference from allocate - handle holds it now */
@@ -1140,6 +1160,7 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.free = msm_gem_free_object,
 	.open = msm_gem_open,
 	.close = msm_gem_close,
+	.export = msm_gem_prime_export,
 	.pin = msm_gem_prime_pin,
 	.unpin = msm_gem_prime_unpin,
 	.get_sg_table = msm_gem_prime_get_sg_table,
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 2e37913d5a6a..4d93f2daeeaa 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -16,6 +16,9 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	int npages = obj->size >> PAGE_SHIFT;
 
+	if (msm_obj->flags & MSM_BO_NO_SHARE)
+		return ERR_PTR(-EINVAL);
+
 	if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
 		return ERR_PTR(-ENOMEM);
 
@@ -45,6 +48,15 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 	return msm_gem_import(dev, attach->dmabuf, sg);
 }
 
+
+struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags)
+{
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return ERR_PTR(-EPERM);
+
+	return drm_gem_prime_export(obj, flags);
+}
+
 int msm_gem_prime_pin(struct drm_gem_object *obj)
 {
 	struct page **pages;
@@ -53,6 +65,9 @@ int msm_gem_prime_pin(struct drm_gem_object *obj)
 	if (drm_gem_is_imported(obj))
 		return 0;
 
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return -EINVAL;
+
 	pages = msm_gem_pin_pages_locked(obj);
 	if (IS_ERR(pages))
 		ret = PTR_ERR(pages);
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index b974f5a24dbc..1bccc347945c 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -140,6 +140,19 @@ struct drm_msm_param {
 
 #define MSM_BO_SCANOUT       0x00000001     /* scanout capable */
 #define MSM_BO_GPU_READONLY  0x00000002
+/* Private buffers do not need to be explicitly listed in the SUBMIT
+ * ioctl, unless referenced by a drm_msm_gem_submit_cmd.  Private
+ * buffers may NOT be imported/exported or used for scanout (or any
+ * other situation where buffers can be indefinitely pinned, but
+ * cases other than scanout are all kernel owned BOs which are not
+ * visible to userspace).
+ *
+ * In exchange for those constraints, all private BOs associated with
+ * a single context (drm_file) share a single dma_resv, and if there
+ * has been no eviction since the last submit, there are no per-BO
+ * bookeeping to do, significantly cutting the SUBMIT overhead.
+ */
+#define MSM_BO_NO_SHARE      0x00000004
 #define MSM_BO_CACHE_MASK    0x000f0000
 /* cache modes */
 #define MSM_BO_CACHED        0x00010000
@@ -149,6 +162,7 @@ struct drm_msm_param {
 
 #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
                               MSM_BO_GPU_READONLY | \
+                              MSM_BO_NO_SHARE | \
                               MSM_BO_CACHE_MASK)
 
 struct drm_msm_gem_new {
-- 
2.50.0

