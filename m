Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623E12EF9DF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877938; cv=none; b=qRUEba+EquuNc4qVVlGWK4TC4oa7M2OPmnUKBq16cLx8G6S3YRz3jgHHGvHqOk5IL5tutEGsM8nmSI6skzJYSaZToemsQG7rtykllhBE+aZaur2+jCdGbDUY5BeSz4hYAMBSeiL1Yyn/UuieaOaardXiGtGrdwhMUdGzjSrT3mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877938; c=relaxed/simple;
	bh=ajM0ChvulsIcVGfGfQUYaLVu02a/srjqveKXuNHgeqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pwvBMsjCPAohdwYjC+HTE85YMmPs2UKJstitiUHWjRllXxJWM7zq1naDBgiw25xsnnaMEHSxN8fQ70HuiOFp+b+ww/EP7SOgOG1jr416kqf9LVkS6X0wNu+KK/vNKT5yWhM7T9vx6LVddv+3zHr/bch18owuQ+AtOV1/JsXiOe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qaps4hdF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qaps4hdF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCtnMq020753
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9Qwd9YtBr5K
	edr0HQ8biobuJ+sJVNM9PhDsuEO5zY+s=; b=Qaps4hdFhZPjqvdGwNOjy1poBAs
	mZVw3zcznxd+uM+CRz79SffOUEc86MEEaRRrZbjDqzbG5O3zx+oKHFx7Rq/M+baS
	5c6KPcJYBcnrI2AaoPg+ki9JyKNPVVaz8BJdDO0fTenCzWCfAbF7EB+uJDFs3esm
	rNPs/T551SfI+HzNz4j79V7hobghWh3cFqY1fMdS+F3Qo8A6pltkLLX9Wk+aw9VL
	I0d/knyP52JUSFieLGIm2sZHffNfrg0lxnsG7++AfV6PuHeue+5pnWrDFlv3D3vb
	svCciBlCy+WjYE8+iYARciDDsasKBG7fI5mLXYVQ7/F1J6PcVYzN0X+pbTg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b40s35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235c897d378so1453325ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877934; x=1751482734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Qwd9YtBr5Kedr0HQ8biobuJ+sJVNM9PhDsuEO5zY+s=;
        b=uunRINVzYImyesO5IlDroyDVw7/1YMPbTFNsEk7bZkAcfMYWIIR8i9xhtx9jKub3i6
         63T/bp75IePMKKSr0YS+1NXCnwdG/bpv30ScxClMci0WTqRq6TqdFmX1vjNsjWxhHpUk
         by/hFpYCX527PoM1xYtp+F/kE9VpJfzBwod6ZZfzExjc0SKo01lO6Nl6wc4xC1lL/KDd
         ESEeRxlb1tvZEX+Ep0e0b3LPpHn6orXUMzrsnOY55cHRrCkVESiWJwloQSeExSpQMdT0
         1SL8tk/nlJ4d4ixpmdjTu3E40bENZI8MWf2arQ3/gE9rvIihpPVoLB4AXXiLL9+UQqtL
         VoQw==
X-Forwarded-Encrypted: i=1; AJvYcCVqkQqXWNzpJRc+Wy2qEKHdFLwzg0HAwaOAWGPc9uSETRZCF6b12C/a03J7ix5uZIudDEogxvJ0WNOYuSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YylHile73GJN4u1QPKJY/QBVSLR4d0stRdP8DSRUnOMvIF6VucK
	LFLR7P09rzQjuh+pKU2vSwBelB29NcvnJDqC4kBCDAI44i5RRqSSBSBTpVM0tyi7gtfU0SEaaJJ
	t/jiDtUJR16T6x958K1XOqwZ55TnCscE4x5p3u8yDtUPAUopowMoZHOCH8L1EaYwGQQk=
X-Gm-Gg: ASbGncsXBa5REZY7ZB4dYDoDwnBMBUWy+oOm9KrySfzRrN+c4P4eier6G56v8VUmtkY
	9EJfNn6zZ4Fvvz5iN4/uoSRxUkWhIyo8L3Bes76xSFlOq3wGTxvmE3jGVjpJBK9rboFgLjV5TVb
	iIVgthRmJ2Ux9pROGswdl4wnPEj9YDtLoJFprW+0JJw+GdX+f4ftfy+4bsGDoTae2KHQ5+H4zyL
	IJa6sj3pb5WwUa2h69tsb5fRg/lcoowrz6+SoqXS0jTzUtstM9X9TItX5b3S9h6xjBq6ViCY4BU
	BTld2rYUAhh2sWTErwtZHZV5ZfRYv8OK
X-Received: by 2002:a17:903:1b50:b0:235:e1d6:4e22 with SMTP id d9443c01a7336-23823fd6328mr60830675ad.18.1750877934564;
        Wed, 25 Jun 2025 11:58:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0aNDwPow6gLTCD2PANYngWFgatt1KGMuU8iZXTOOqmmB7r1M+2L+7LtfVVDdNAVULeCsdSw==
X-Received: by 2002:a17:903:1b50:b0:235:e1d6:4e22 with SMTP id d9443c01a7336-23823fd6328mr60830405ad.18.1750877934062;
        Wed, 25 Jun 2025 11:58:54 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86e8fddsm138155205ad.210.2025.06.25.11.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:53 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 21/42] drm/msm: Lazily create context VM
Date: Wed, 25 Jun 2025 11:47:14 -0700
Message-ID: <20250625184918.124608-22-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX1M8yVeHlZPFj
 Nc2T0tGZK6dSIS59fpf/PWcVpwbP/mo8zh1kdGEpfgwZDfY+7dfoyvFXJQClFGkvWR25rxBAVwY
 jhVGbfOxdmkze0/FTEgBI0dEwUhnGhqA8MvKB4LMrqNOTx6kcsJillxwW4ut/EOY4CyY/HQa/SH
 qngaeyCIaf9LQOh5nym74UWc4p6KrNh+L8AzWLCPmJ8aDSVlaE8AXN91jh8+CnQDBJ0cDBv+UOK
 wGsVHyJO610jO37sNpLGB46Q0Cb3S/YJhN5oqQbmzxrebduLbpFhOT3R9EGQ4qgbWpVjLSWvkvw
 6TOSIiqUr0/Z7ZaMY8fw76ui/z0xFh+092LuDzxqeUpNE/TZza5XO0VIYQ52P8Gb754YXRiAnKp
 JZIQ+jbDcQnmCxhHDGN0GPWYdkfAnyH3gnaP6d33mD+WTx2w+LXenygSVWbWVuFhOF4nOca9
X-Proofpoint-ORIG-GUID: tWWaLe8xCdJcEpKY9W03kOJk0b3g55Hy
X-Proofpoint-GUID: tWWaLe8xCdJcEpKY9W03kOJk0b3g55Hy
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685c46ef cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=K8YrE2tTMaBrqk7BmowA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

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
index d8ff6aeb04ab..068ca618376c 100644
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

