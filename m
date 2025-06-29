Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B2525229E
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228211; cv=none; b=PbNh1Q8+/SrYjUxEQ9slsox0085hVO4/FQi7ZbFhIbdBzlfJhN+JdIli7bcQTuNRt+aShXmOwANdqvLWjETUUrl9P+4janvxV+JbVySo5fIo7QKq+mytPRaMD/J9RYXmCupUDT8sWyjPpTzh14vVnsgG3G8UOIkJInSUsP7TFYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228211; c=relaxed/simple;
	bh=B9YTTznctoHdBwrv5g0hUa2frK/TNvG5X6fwVs2vyWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LCXkxjePa4i9xg9jj4f1H3yoMk7ZLVVOcuj0KneyImcxG1RuPuyXjanbALEJs9mP1XYT4sYwLxbPK19+GAc1E3xiyLFK/zqG0KIuCfh1mprOvYyu8ApGBWBAxENMlCK13qUedBM7jb7WS2C2Lw2HXWCFN7IV1UyquXBt7dgYOl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XehopLSb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XehopLSb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TGrXQB024711
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P0BUJyXh6kP
	qdE8f3drw7XmhKLdbfVd0jGadfPkUqgU=; b=XehopLSbMYZ8zipaEeBYiedSxvw
	drUuZhaDiVNQJeDFUCk4CvXd8tUzxMRtB3IAg7gZojZH2aHrE4GikNsKDKEe/YFK
	yHWAUXhoy7e+/liS8X0/IPKxYQkW88g//+hsqr8r3aEp5nT4WSkn8KIf6zgw54sN
	vXjXoxaDQAbOewqC31p55W9kr9sdoEfvb6kt7dDnR1/ff4EUrx7Lx6kboiamhJ/q
	81Y9FHY+vlI215tLX/JACuMMsCoPmFbDPp6lQVubUY50a9vhsS3iG5ScaE8taLO4
	8z0MjXT0qxTk74NerImatBp+P3erkiA4k7NBhbT5BxLzTl8MHNjGFugLDrw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9jpth84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2365ab89b52so27837355ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228208; x=1751833008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0BUJyXh6kPqdE8f3drw7XmhKLdbfVd0jGadfPkUqgU=;
        b=mZz/ioRnenw8ux9xe27gllNBN2gzNVtf+TVWEIH8U61uW1dkbC06AsIDjlHbr7z/3D
         Gxfbiok9Wg2UqRb/uM4mjHD/krhxfOdkAqGZ3OGgozE4p5NWULvWjp8Jt4SMAinKP3rF
         giVw6oK42EUGk/grzBZqy9S/7ezyQ2UtNzVPwtGr2nSlamKNZS/D7d0cF8PHZPzSwP2u
         8/6D6UisZTv8PhhtiPsk8GVw/rxnXpC/7iBUeZCcnAqLwx0iLPjZglujmQ6cuFl24V5X
         fG7Eiehq6cppcA8O0Fk3v1F2gjUynbqvG7fj9IRcaXkw9M1cgSKT4yfUT9ve4lreKoWm
         ZYKg==
X-Forwarded-Encrypted: i=1; AJvYcCVeR32jKXXRqoFsHddwtOa+mtIAON+fI2Ehc+6lu372XxNbXFVu46s880sqmRvpmCEdqQRVR/5k1737des=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6X9D1y+onmUODTtye0a3z03l8ua35j5d2yhDvOsASmwtiEyCG
	rkvKn0r7xPSAB5P+pOGPfkzvmnW2Yb6fn2tQHZONfhYdtniGxslNRePgFZvQQwN/dCiir3KyAKg
	rVf0JsSavmEFCkei0o9t0PJjTP9wPm2ubrio987btRbwRQjpnQLH69gYdVmZPZPQRd0M=
X-Gm-Gg: ASbGncuDDBETEkYegJNfqVC/P9j+lZWmDVQ1D2mDsj260Gq1Jh9gkAIR6Pl9Jbw6eME
	xOypxdIkKE3CgVCnTNMeZU5I9Qa1JjULWnhwDOwC6q2iKSYACho3f0/d8H1n7nEVOu6rnfqt2UG
	bInMLD7Iadz8LHR5hagyCwAXmyzbpITzNZfkYNcNZXqaZJ0IHpTViiAwXcJ0A+yRRmaInuraotn
	B/NlGiidJhGsTCCrikkjvGAsdjeMAqP6L/qpewWG764df/sZ53meZuzMynsfEzrD8kHn+kFelsx
	NohLf1XkuceX0AeVNJ0kIjczlJI7a/ZJPA==
X-Received: by 2002:a17:903:1a8d:b0:235:f45f:ed2b with SMTP id d9443c01a7336-23ac45c0f72mr165769025ad.1.1751228207964;
        Sun, 29 Jun 2025 13:16:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyVthO40tcQTCJ0muJg7MQ6d9drZ8K7M4xSAJ9r+yQe9hJqTnp7unHgV/QgHaOX/oZf6bRXg==
X-Received: by 2002:a17:903:1a8d:b0:235:f45f:ed2b with SMTP id d9443c01a7336-23ac45c0f72mr165768705ad.1.1751228207469;
        Sun, 29 Jun 2025 13:16:47 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm66898175ad.156.2025.06.29.13.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:47 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 21/42] drm/msm: Lazily create context VM
Date: Sun, 29 Jun 2025 13:13:04 -0700
Message-ID: <20250629201530.25775-22-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXzS1EnrYb4pXb
 fL7xUr7IIl2SYQSOW8KGXtGc++dYvg5KNFd97hWHZma+Da2+e5CPpDICsJbRf6sMJbjNoGKfFLN
 9ngl9vgYB5t+CfkY+79b46D3zbVl3oh2UtrOOgCeOAHliCBUxwkUngFnJksYYC/pTkNjX7Fbral
 PVSIMXZp9814v5dqaK6V4/6qPEk+yFvv9z/hDOERNiVBIKFADjiDJod45ApQ9UkdN1znRLJZmXn
 CbnQUFU1ue08m/4L2q5SPZUGJpq9T4tGD+idT7Cjj62es4RBNWkW1HZKPihkVqOpScCP/kqLXw2
 Shz4d0EMLNLCKz0E6o4wVuMZXCN3gdZlwzNrNQxuMaYQUFNhzQF3j3WKWajj1GnAggU/3Vr9zyx
 9oPaWISJRt2m91XhcGg2/nCRPbBsqNbIj9B/S1g7DsknBo0/o2Ox9Ek3fT16NoRkfjMonei4
X-Proofpoint-ORIG-GUID: d8gAWyGE5gf0fKnty46Ic2SCJ5W9utPG
X-Authority-Analysis: v=2.4 cv=Tq7mhCXh c=1 sm=1 tr=0 ts=68619f30 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=K8YrE2tTMaBrqk7BmowA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: d8gAWyGE5gf0fKnty46Ic2SCJ5W9utPG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

In the next commit, a way for userspace to opt-in to userspace managed
VM is added.  For this to work, we need to defer creation of the VM
until it is needed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 ++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 14 +++++++-----
 drivers/gpu/drm/msm/msm_drv.c           | 29 ++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_gem_submit.c    |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h           |  9 +++++++-
 5 files changed, 43 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0b78888c58af..7364b7e9c266 100644
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
index 12bf39c0516c..2baf381ea401 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -369,6 +369,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct drm_device *drm = gpu->dev;
+	/* Note ctx can be NULL when called from rd_open(): */
+	struct drm_gpuvm *vm = ctx ? msm_context_vm(drm, ctx) : NULL;
 
 	/* No pointer params yet */
 	if (*len != 0)
@@ -414,8 +416,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
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
@@ -423,14 +425,14 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
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
index c4b0a38276fa..5cbc2c7b1204 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -218,10 +218,29 @@ static void load_gpu(struct drm_device *dev)
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
@@ -234,7 +253,6 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
 
-	ctx->vm = msm_gpu_create_private_vm(priv->gpu, current);
 	file->driver_priv = ctx;
 
 	ctx->seqno = atomic_inc_return(&ident);
@@ -413,7 +431,7 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 	 * Don't pin the memory here - just get an address so that userspace can
 	 * be productive
 	 */
-	return msm_gem_get_iova(obj, ctx->vm, iova);
+	return msm_gem_get_iova(obj, msm_context_vm(dev, ctx), iova);
 }
 
 static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
@@ -422,18 +440,19 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
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
index a35e1c7bbcdd..29662742a7e1 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -364,7 +364,12 @@ struct msm_context {
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
@@ -449,6 +454,8 @@ struct msm_context {
 	atomic64_t ctx_mem;
 };
 
+struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx);
+
 /**
  * msm_gpu_convert_priority - Map userspace priority to ring # and sched priority
  *
-- 
2.50.0

