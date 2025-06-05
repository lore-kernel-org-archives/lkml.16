Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50089281504
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148379; cv=none; b=j2GigRdY+sKMwMQMZ4L9kXacn/FKO75UChSIKwxFKUM2aserpQp/aLb8QFEZmlHGo1DsJuJWwvPG/JGDzNbWLTKgIfc3i0fK6eCW7hvAY54bCGcqpQGjmwKESxim6UAeqv4+2Cj8235OCHzHLYIWexfjEdY1AOdaTK2WB7d8QV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148379; c=relaxed/simple;
	bh=70ksOc5iQpyAgZMAtxMrI+YhBlo1TK2wUkE1lyJmQ6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OByO/r+AfTg1uTFooXU3brjRVEaQiHZARlQ4lyPI5dhj6zTMn0b4XDskpZJZFUTW9uYMam0ybdKww6phr448fR5Gfd2IwviCvjmVIbVqBMmR11/Zjs/Zk1RvbVg1T7/x7k2iv8Cqg6qJ486KXqRXQHm2JSPH3PDcL/63P42XDyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dnGnsLuX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dnGnsLuX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555H0xh9006331
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KKzV8zO4Rj5
	qHtCmhXDXV8OJV41Yiw04GJXbLr0rviM=; b=dnGnsLuXUvEm4gmyUVSGleOdhkM
	Y51qDXt5wPmX90elIq28wPpFlZPSjdetBkW68xql+Xbh7ou9d4ImqOLXOt8abFLZ
	YiWgpYMGyH94At2VnuL26yY1MblLyChBHHKxuWFVQlC3ePoX2X8pR08gFXVyplls
	vghh10MnIPkGB9ARioSG5pkMRBEjBh+5eKg3Vwbvk4tPjcSxTDrpt0Wnk7TdNrnh
	qPqIXyss2Lncaaqd8TN6FwIkwqBm0blrTDkU+qcAVHbh0kOqs5STNEnkKLILo8ZI
	IJKvvUHarSCkeOcjtP1qBDSjUvv4/KOvoXCZoL11RE1vxq+z7J5hcgYR+3g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t2abu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:32:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235e7550f7bso12953345ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148376; x=1749753176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKzV8zO4Rj5qHtCmhXDXV8OJV41Yiw04GJXbLr0rviM=;
        b=oYdFyUc2jrUhqgycQbXzmwOL/vCcrps6e8mnj1YMw2QKf9dapGNTQNE64EY2RAWsx9
         ey8+mkQULYOs37riUkqJcMlhMVedf4sFTGMlEdJld/NxBawnr1F4tZTwONm1kxPkj+iy
         1js1F7SiMZd8IH9vPQU8IJc/BdjvkAFx7FDPwO4GqfekiEUXU4BZtnq8Uu02ujhYRKSx
         Gj6npg9GA8I2SMSULypGHzzk/Nmu3uhloinySEby7L8hfhHN0IF/t2NMIac3+RrrojYu
         9JRtD3RlCTJN0ChZHPLx5q7iciNAclA2Rits0wWgry5YZzn1pU1TeFDrlRnLaCkp7zeQ
         oteA==
X-Forwarded-Encrypted: i=1; AJvYcCVN7WdWIb8sQZYCpPPS4xBUtCnBsYW87HDL+I9oKbzM/XnjLsNubYUyxK7EUF2Lc7nzZd2R0G/2jZ1a8W8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw781hr5CNJj3c00/tpQhSK2IB5DRjFO62Mdrg1r2KI+3h8JdZO
	+I3t+jSovsI43K9gemWPE4oX8+IWIEiu7uRgYSgbDUl4k6DEjv1ciB6PNcCRxN6x1xHlvGqWcbs
	dAjxScRiwhxhDDrywmLSsIoBeQQkuttnjohJAdFFR2cOHHfWVaMU2vjKE3cFGvfyI7m0=
X-Gm-Gg: ASbGncuyu03QJmjKyrsO1VmdprCxyocQywW2wxOvxqel5eOj75+aHw7AnCYxSiBtQ8s
	Ki97dkR6psmu5JTpJpVv4Y94/jyOWcFkB3MqCL+9+2ji4eikeuTRCeFe78zELmZ2xugM0lEOpH7
	B6FktcBYSmP7HTLpvMoiq1j+bZElroimE1sqK9t60eSM303OsKQOLm9urRSYgKQF5SLVdZ/wqXs
	i+xGIGOhSXbKQRTS7RAyYADsAj/hsrmYFMIFERjEZVdMMzAAgu9pp7iCTJJvQRgxXHSC9YF49GO
	wuNTu6pReHhEPP5ls89Ezg==
X-Received: by 2002:a17:902:d48e:b0:235:91a:4d with SMTP id d9443c01a7336-23601d43b6bmr6099875ad.23.1749148375591;
        Thu, 05 Jun 2025 11:32:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH3weqzHpLNIjHLtP+uTqlW5dhVeoRV0i5zYxxOgw8DNZkhQvY7brneYXfzI8UWx8//Zxt6Q==
X-Received: by 2002:a17:902:d48e:b0:235:91a:4d with SMTP id d9443c01a7336-23601d43b6bmr6099545ad.23.1749148375181;
        Thu, 05 Jun 2025 11:32:55 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bdd034sm122650075ad.92.2025.06.05.11.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:54 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 19/40] drm/msm: Lazily create context VM
Date: Thu,  5 Jun 2025 11:29:04 -0700
Message-ID: <20250605183111.163594-20-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: rhDLGiaChs3Ffxqpz_mWEpXYHB3HtbcB
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6841e2d8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=K8YrE2tTMaBrqk7BmowA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: rhDLGiaChs3Ffxqpz_mWEpXYHB3HtbcB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX/FPmInTDyaEs
 3Gssc+VcMAhXfn2HRzAkepGc1C+CAOtOH9ArQWHxosjlN50me0/INJis5FzmzlRimCo0CNP2PCy
 Qcxq4cjdxP03069/2jDAxM7bGFYne/TSjAZKSDf7SA2oLX3U5EF401qEWSxmcvA2DJoJM0Au9BN
 yGnj+ySDdOjzmeABMrrVIpPdGmLUfvYtxHcJZehAUkMfnklVwxoAqthcA0VRUrQvwpo6TBaEKga
 OHPGqDokcMFAqct9fppMubSjQo97l32Tb6JzjJYrzOCloLyxnbESXXNM0xCbt2DNxdr/ygthJm4
 ewNKcYBFg6ZocZH3Rzc3mneG0RmiffZ2wljF1hY5Cqlf/NgChns+n7ZINUjCmwK0pMZjF4tHSqO
 RTUcPlInwc0b7gUxUD/FFD6Zkgb3Q6CQnO69EkFJPl1PbHuH03Zvyxp6AXMruj/EuLYDrliT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

In the next commit, a way for userspace to opt-in to userspace managed
VM is added.  For this to work, we need to defer creation of the VM
until it is needed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 ++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 14 +++++++-----
 drivers/gpu/drm/msm/msm_drv.c           | 29 ++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_gem_submit.c    |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h           |  9 +++++++-
 5 files changed, 43 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c43a443661e4..0d7c2a2eeb8f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -112,6 +112,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 {
 	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
 	struct msm_context *ctx = submit->queue->ctx;
+	struct drm_gpuvm *vm = msm_context_vm(submit->dev, ctx);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
 	u32 asid;
@@ -120,7 +121,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	if (ctx->seqno == ring->cur_ctx_seqno)
 		return;
 
-	if (msm_iommu_pagetable_params(to_msm_vm(ctx->vm)->mmu, &ttbr, &asid))
+	if (msm_iommu_pagetable_params(to_msm_vm(vm)->mmu, &ttbr, &asid))
 		return;
 
 	if (adreno_gpu->info->family >= ADRENO_7XX_GEN1) {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index e24f627daf37..b70ed4bc0e0d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -373,6 +373,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct drm_device *drm = gpu->dev;
+	/* Note ctx can be NULL when called from rd_open(): */
+	struct drm_gpuvm *vm = ctx ? msm_context_vm(drm, ctx) : NULL;
 
 	/* No pointer params yet */
 	if (*len != 0)
@@ -418,8 +420,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = 0;
 		return 0;
 	case MSM_PARAM_FAULTS:
-		if (ctx->vm)
-			*value = gpu->global_faults + to_msm_vm(ctx->vm)->faults;
+		if (vm)
+			*value = gpu->global_faults + to_msm_vm(vm)->faults;
 		else
 			*value = gpu->global_faults;
 		return 0;
@@ -427,14 +429,14 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = gpu->suspend_count;
 		return 0;
 	case MSM_PARAM_VA_START:
-		if (ctx->vm == gpu->vm)
+		if (vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
-		*value = ctx->vm->mm_start;
+		*value = vm->mm_start;
 		return 0;
 	case MSM_PARAM_VA_SIZE:
-		if (ctx->vm == gpu->vm)
+		if (vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
-		*value = ctx->vm->mm_range;
+		*value = vm->mm_range;
 		return 0;
 	case MSM_PARAM_HIGHEST_BANK_BIT:
 		*value = adreno_gpu->ubwc_config.highest_bank_bit;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5909720be48d..ac8a5b072afe 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -214,10 +214,29 @@ static void load_gpu(struct drm_device *dev)
 	mutex_unlock(&init_lock);
 }
 
+/**
+ * msm_context_vm - lazily create the context's VM
+ *
+ * @dev: the drm device
+ * @ctx: the context
+ *
+ * The VM is lazily created, so that userspace has a chance to opt-in to having
+ * a userspace managed VM before the VM is created.
+ *
+ * Note that this does not return a reference to the VM.  Once the VM is created,
+ * it exists for the lifetime of the context.
+ */
+struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	if (!ctx->vm)
+		ctx->vm = msm_gpu_create_private_vm(priv->gpu, current);
+	return ctx->vm;
+}
+
 static int context_init(struct drm_device *dev, struct drm_file *file)
 {
 	static atomic_t ident = ATOMIC_INIT(0);
-	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_context *ctx;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
@@ -230,7 +249,6 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
 
-	ctx->vm = msm_gpu_create_private_vm(priv->gpu, current);
 	file->driver_priv = ctx;
 
 	ctx->seqno = atomic_inc_return(&ident);
@@ -409,7 +427,7 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 	 * Don't pin the memory here - just get an address so that userspace can
 	 * be productive
 	 */
-	return msm_gem_get_iova(obj, ctx->vm, iova);
+	return msm_gem_get_iova(obj, msm_context_vm(dev, ctx), iova);
 }
 
 static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
@@ -418,18 +436,19 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_context *ctx = file->driver_priv;
+	struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
 
 	if (!priv->gpu)
 		return -EINVAL;
 
 	/* Only supported if per-process address space is supported: */
-	if (priv->gpu->vm == ctx->vm)
+	if (priv->gpu->vm == vm)
 		return UERR(EOPNOTSUPP, dev, "requires per-process pgtables");
 
 	if (should_fail(&fail_gem_iova, obj->size))
 		return -ENOMEM;
 
-	return msm_gem_set_iova(obj, ctx->vm, iova);
+	return msm_gem_set_iova(obj, vm, iova);
 }
 
 static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index f51f2c00e6e2..9d58d6f643af 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -63,7 +63,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 
 	kref_init(&submit->ref);
 	submit->dev = dev;
-	submit->vm = queue->ctx->vm;
+	submit->vm = msm_context_vm(dev, queue->ctx);
 	submit->gpu = gpu;
 	submit->cmd = (void *)&submit->bos[nr_bos];
 	submit->queue = queue;
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index bfaec80e5f2d..d1530de96315 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -370,7 +370,12 @@ struct msm_context {
 	 */
 	bool closed;
 
-	/** @vm: the per-process GPU address-space */
+	/**
+	 * @vm:
+	 *
+	 * The per-process GPU address-space.  Do not access directly, use
+	 * msm_context_vm().
+	 */
 	struct drm_gpuvm *vm;
 
 	/** @kref: the reference count */
@@ -455,6 +460,8 @@ struct msm_context {
 	atomic64_t ctx_mem;
 };
 
+struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx);
+
 /**
  * msm_gpu_convert_priority - Map userspace priority to ring # and sched priority
  *
-- 
2.49.0

