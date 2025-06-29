Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A40C23A98E
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206076; cv=none; b=ddg2xNN9tGgREpwPYI3tOd1IKSty0aXDZRM/Ced6oDY0wIT6pwd4Rg5R8RwqmSxTj0vM0kWWr5hV9cfoG26bcMEOZ4YSYWtgqWgBEYAsk5t7KZA7Adgn44ZnAsO++Y2S0NZUsdvj41xjievzIjTDLYZYtimcvjNLI1G4/5rD8fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206076; c=relaxed/simple;
	bh=B9YTTznctoHdBwrv5g0hUa2frK/TNvG5X6fwVs2vyWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C0RpV8oymzTPZl5XkuK1BsKMqGyEKZQNnHyJRum5fFRfZ0fXyDqqvEe9sn9VsKbubZU7qxdWNqwo/zNCXA6cKwzHiMRC9D3J7kzTTRbdIpKCR4PTUj5CUT5xQk7e1NPxytKUoMYp86Ex9qBLL9pUoV+WkNpiTJDG7dQKxFSRMQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X+wWrEAm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X+wWrEAm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TCk2dB001756
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P0BUJyXh6kP
	qdE8f3drw7XmhKLdbfVd0jGadfPkUqgU=; b=X+wWrEAmJGmu/SO93F7X1tUL/59
	vtB+c8v6olldeFmmDYL6571eNla+EuxBl389yKouIntPniJnrcoTMH74DFhA7OQb
	oddhKmFUbna1mFj9CXiF4w/3WfR+IneSap3hPiEblx6jZ4KO/5+1Y55b3CvqA68B
	dfe6fWH5mBmwMIUuOZL56+34LKKgSxNaokRFM5UGNRSVr/c53Rb5X7B1LD7amryO
	WonnlJGGrFyQaKUnvREKcBgP8+8uQlGumwRN3kf0MInolI4eF+n2hMy4uHiQnXb+
	YvFv4uOekV1IJdeU4KaiGyfcu7nFZrsULhP1tjY5SSpW336oVgiI1LYzJkQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9a5y9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso2361802a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206072; x=1751810872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0BUJyXh6kPqdE8f3drw7XmhKLdbfVd0jGadfPkUqgU=;
        b=bHIu3vFjRkpFCK2fWxziZF6mBJ+VO8V2vSG2wKR85CM2xvfir8DmTgEQU+ZIK3RxF3
         00jtSwdKm9Y+lbbi4DtakJacHv7Q3gcQOGK6Rcp3jddJkAg4eGsMm4fP97GaI81iKSDS
         MdnaIBeGmvbcqrYsCZCzD351MkIjpVzttlOMJUDSPSc2rYjGGR7+6HJVjoCuxhW9cq2h
         ixgQDz4ndzEVlHQqDf2fvgmHWhi7342frkTzrSVmrUHU6yb1DfogvRBs8r8vwmcpcDap
         GnEADCX+jwQDBfskW1AHbYJXeoMDEKsRW8WgvrzOJXxd5yMwAoSehuDwjVfVfWkLeX+z
         05TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt08ZCAe6aOEBhlDSTxLHLVj7dLwpZ1oZ2Lh9YIa3P9EFp6KZEhfQr0j/ST+6CusgZ+dRyS8fEfSXDo0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwERPmsIkLzJeShrRgxN2M+urKBJs4AnfFsB9IlcQW98dBnuXK4
	A+k8u5NE9CqAaPDgLn/cXrNCgYk5Sd585tiTVbJIGyLu6uC1GmnFXk+Zg1Or8YEClffv1QACg81
	OcAN9EvtWeh6n4oWigvS/kVtvOBnfyvYdzX/9Moh48P3rZyB7Q7Qz0c/LhSuG8vOfGyM=
X-Gm-Gg: ASbGncsvgBYUVkv6IHN8CWTbu0F/L+gYxavM9jzQ8r0GSKRHRP9aTWzgtHgVgDkbiOh
	B+w02cbBd+nVEvzWsgWV9fXVqnc7atn5sUYYwk93dgdRxM5T0Rb7XUqfqy4nMENcInC47jmEnhL
	m5QrxsF15Ec76S+aYkBBs68dte4KX7fdskS+T54TK9qlsiKDMr9O7myUs8rdn4Og02aFFl5BIWa
	JoijysXrYbnvzbBIDB4lOK60i9xTqczZ3GJksaBSZgeWOrCO7lsvvvLhAMry1t64p86SCzxF3/K
	NjVVV1qE3HMN788bXVr4tUHvjs7lDR2e
X-Received: by 2002:a17:902:db09:b0:226:38ff:1d6a with SMTP id d9443c01a7336-23ac3cf54d3mr146088715ad.7.1751206071989;
        Sun, 29 Jun 2025 07:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE32k7Afuea4S6YlDfLE+VUZzeCxgrzidUbH0ovqiE4vkhu2fW7o1UrBtt/LddK/revmNzJUg==
X-Received: by 2002:a17:902:db09:b0:226:38ff:1d6a with SMTP id d9443c01a7336-23ac3cf54d3mr146088305ad.7.1751206071431;
        Sun, 29 Jun 2025 07:07:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f182csm62074285ad.55.2025.06.29.07.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:51 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v8 21/42] drm/msm: Lazily create context VM
Date: Sun, 29 Jun 2025 07:03:24 -0700
Message-ID: <20250629140537.30850-22-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=686148b9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=K8YrE2tTMaBrqk7BmowA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 6FFIjdHmtIwcQ_pA2bUNctpnWLjH4rNC
X-Proofpoint-GUID: 6FFIjdHmtIwcQ_pA2bUNctpnWLjH4rNC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOCBTYWx0ZWRfX/iUBMeXs2UW/
 GCJBPMFsqyL7GhkAMHxxPAGFWc+YPndvjwRF2BW86TgnFT1/hnAPaSVA4CmNvQK8oaYi13/oguG
 koGIlHm3QvDCwQufuAMuK7i1Ve9sycyWNJ3GAE6hlxd5TUV/3Po2yvI8x3Zp4HBG2zUALUfSSUb
 ROKuYKMV9FLOWSJfT1EQihC8VT1altN09yDoockwIR7xV4XVTTC7KGsFoobLkceQG1Ip9TecfUN
 eEDrgE6JRpcXcAib6N/WBKYq8bB/GR6DYcECWybrnItG8qs0wM7+elrpsGIdFDtpZ8SzzQNPt0s
 s/E7nXc1UcNJDVuZvZza2osieNh4ZqLF4KGCymiktIsyrSlk+I8TPE27FQpXGc55Rf3ODyexEgy
 gICmzc8Xx5nag4tUiUH0EJs159c4Ibg0cHwlqhkcJvl/ik+tQ/NMUHA0NuLfzYB78h44n/J6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290118

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

