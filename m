Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBC227C84C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148381; cv=none; b=JaF8YYOTQXF/nnOypA4fG9hO7DRGPb5VfWJNshylPGjo1+RlREVcMgu16KnmRopYGedxDYt+7KJGMbsHEgNczXc1Lx+5WgdKrZah5b8QpsdFr3+v2WLZ6jl4xavPTvBa7zpZ6Dc+RGc06Ch5r/0dmjEfCz55HE7CJY7HmWzWW0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148381; c=relaxed/simple;
	bh=LREB/xY7C5jNcdjT/n4AlwVuZ2kqMqXCgxBuqCdzI2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dfAYjz6s0sSyqQ9sBBhIvMUCSdxfA7ipNHXAJY23L87xb5w0A6esPBmJCZ3M5kzMmH9XLcFi1/8XA3CzT63rbLj97xSm4mAWu5xOC4aeTa+NebEo8KcLuJbwFQPRuw+QpGaQ0IPXkBXd+64RqhKq7K7jKOT5q/boyiIhemIOO64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0CYuxZ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0CYuxZ0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GoWp7022437
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Hh5tX4Ew+Aw
	YGkhPc+5ZLD0+EzWfomf8YCd88hJnzq0=; b=E0CYuxZ0o6sSL/D28WAc1LFM8GQ
	cQSNOWK7JovpQkSosWohyxwIWP2RgNZh0tDDgLIJb1Zb8wZQWmjHMgeZsZPb8vPG
	MfVNmuBGMwdV0KmfAVMghgCUfP+T56UtBk+54rNI2HYbFzQFAbWGEW86+aQe+o74
	Y1T7BS7jWZ1YJjlH4xWIyok5pZKE6x+W8PaSNrGBWpFgYuWUdBBuCO8y1Vy+3+Ox
	EMIK8rZOgSYoZfsEF+aGtEJji8AnD2KL1fwM8Tz1YtW4/AuCKlPS0mGu8q4kmCj/
	y2t2VJWScspfoyMTtaV1ZcAHLgM783coylCfb2wvKVcp02g6SjzrWUA5HLw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t2ac0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:32:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742b6705a52so1945681b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148377; x=1749753177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hh5tX4Ew+AwYGkhPc+5ZLD0+EzWfomf8YCd88hJnzq0=;
        b=BVT6b9CL0d3791wC0K7AQ3qlmC9E9uYRUaVaUzxtXRHCKD1ley3LKlYm9Jgv3bWCTi
         drPNpKZUaQwoQ/Tp7D0bCwIXntozjPGI1TP0z+++YnDp029vYo29O3qI+B/hWqgDwHhY
         4QILRy/1vn0N+uSWyA0Dx3V7P6gnIIgIlOtvR7q2LaXP3iSTBHgrlF6EOx0fGGgumFv9
         VoakQ3C6rBds6FHSg+3Dga4d2j2k7ybwgjKkoY/M/q6lhrh62yW9wgiuGtiMIPPw93Gk
         0XgANDYSofeUiMDE19v0dKf9ywJbuhbPNgbgvzBkqM8OQ+ARInaQXrB78cp8rDI30hHc
         6ikg==
X-Forwarded-Encrypted: i=1; AJvYcCW7Jj43wOkhu2S37jzI8juy9Xgt70ZNqS4qJo3ROFPLfgBdrACZ7BEqV82slYNM0ztbvjIpasgNERBK4+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyabEkih1B7pv4Z+jRL8hCg7cEZfB8vVpa+CQmyDuyMhwbK/50U
	g5UMdwGQarWkIUFx31vp/Lw7DeVTWgMn7RPwgUR3gPeLhBvTy8WWraVeT0jO1BwcnCDD50uYISp
	eUTlRl4uhqzgi2jSXQg/dXd/O64JeteVZOV5a47//jPPQ7OOQrSDzyMF/3z4hBABxsVA=
X-Gm-Gg: ASbGnctyNRQL26NLzHdk5POZ/mf3bNynaEKY+htipqzXVwideqcDt2XC9dgTguc0D3r
	VUYRi3vB3wNSBDIU4qaSOejjMsZQDGVeusYBVuzxTVZE4lzEwn2ULlTpo6YGk7pn29+WDFxhp0L
	oQicwWeZLHH987jgo/D/Jjr6KS/rTgpriHo2nYWE08VtxIykvUR8ga4HNyh899kKSGYNsmM/tSE
	DQqniadlGkbn9Rh1sG+6xaubbvzEr2BiNlnwve9EszhquX1m5WGFwAPKrhD3xa2RyQ1elakAJay
	d4uzHnm5T3JauC/cNYPEw+u3tumf32a8
X-Received: by 2002:a05:6a20:72a4:b0:215:e60b:3bc7 with SMTP id adf61e73a8af0-21ee696decemr338232637.26.1749148377148;
        Thu, 05 Jun 2025 11:32:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHddDuhtrWljoIwKO/VQE5To9I4ZsIfzjokkTHxlpETGM6b1GmJTQMyDcr6eu0GUaVfQdym+g==
X-Received: by 2002:a05:6a20:72a4:b0:215:e60b:3bc7 with SMTP id adf61e73a8af0-21ee696decemr338183637.26.1749148376692;
        Thu, 05 Jun 2025 11:32:56 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f67505asm7301a12.45.2025.06.05.11.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:56 -0700 (PDT)
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
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 20/40] drm/msm: Add opt-in for VM_BIND
Date: Thu,  5 Jun 2025 11:29:05 -0700
Message-ID: <20250605183111.163594-21-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: KYwkfxbg2lY_SPiLx4uPojOzIhEsXtPc
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6841e2da cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=iDRtRSvoPPFvr6RSarUA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: KYwkfxbg2lY_SPiLx4uPojOzIhEsXtPc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX5+NSSmlv8HB2
 a5CCyvgfh/8BKsTtu8Q/0s5uQjad4dmssTj2UDBTEFhRCd8Fj5y80Le1KBG+LiqZt/Lg86/JDuM
 DO2snzYrSbI4h3QBnU8xZ2H4DYFw7JWLpv05OyP9VVePd3c+i1cM+Ag5nvR/v7SE9HKbIEEb4UQ
 sedO+2TTqIhwaoQ4+V6cbcMcxXiE47SHlaTuGeb2VvMyIPM+uwiUJeO8qifPrX1H83zg2VweH9t
 Fbk4a+cIkVgu4W6JLO9KtZe3khbLwbc9CBLY0izTryY/PPqclPUE6owI6nx1NiMaJDPoI+i7nu/
 KbNRWu5ofwemclMY3dSf53SOy0xdnnPp/7wWUgAueGf9KD0W0OEaYVzX5AEqeGDsau4vAU09MOZ
 6lnCo6g8r4yv/DaHNwM7l1MeVOT+ivxKDyu0K8EX0YXqezXR0FYiQwZ6OkfNLI18U6pHwYui
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

Add a SET_PARAM for userspace to request to manage to the VM itself,
instead of getting a kernel managed VM.

In order to transition to a userspace managed VM, this param must be set
before any mappings are created.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  4 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 15 +++++++++++++
 drivers/gpu/drm/msm/msm_drv.c           | 22 +++++++++++++++++--
 drivers/gpu/drm/msm/msm_gem.c           |  8 +++++++
 drivers/gpu/drm/msm/msm_gpu.c           |  5 +++--
 drivers/gpu/drm/msm/msm_gpu.h           | 29 +++++++++++++++++++++++--
 include/uapi/drm/msm_drm.h              | 24 ++++++++++++++++++++
 7 files changed, 99 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0d7c2a2eeb8f..f0e37733c65d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2263,7 +2263,7 @@ a6xx_create_vm(struct msm_gpu *gpu, struct platform_device *pdev)
 }
 
 static struct drm_gpuvm *
-a6xx_create_private_vm(struct msm_gpu *gpu)
+a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 {
 	struct msm_mmu *mmu;
 
@@ -2273,7 +2273,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu)
 		return ERR_CAST(mmu);
 
 	return msm_gem_vm_create(gpu->dev, mmu, "gpu", ADRENO_VM_START,
-				 adreno_private_vm_size(gpu), true);
+				 adreno_private_vm_size(gpu), kernel_managed);
 }
 
 static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index b70ed4bc0e0d..efe03f3f42ba 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -508,6 +508,21 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		if (!capable(CAP_SYS_ADMIN))
 			return UERR(EPERM, drm, "invalid permissions");
 		return msm_context_set_sysprof(ctx, gpu, value);
+	case MSM_PARAM_EN_VM_BIND:
+		/* We can only support VM_BIND with per-process pgtables: */
+		if (ctx->vm == gpu->vm)
+			return UERR(EINVAL, drm, "requires per-process pgtables");
+
+		/*
+		 * We can only swtich to VM_BIND mode if the VM has not yet
+		 * been created:
+		 */
+		if (ctx->vm)
+			return UERR(EBUSY, drm, "VM already created");
+
+		ctx->userspace_managed_vm = value;
+
+		return 0;
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ac8a5b072afe..89cb7820064f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -228,9 +228,21 @@ static void load_gpu(struct drm_device *dev)
  */
 struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx)
 {
+	static DEFINE_MUTEX(init_lock);
 	struct msm_drm_private *priv = dev->dev_private;
-	if (!ctx->vm)
-		ctx->vm = msm_gpu_create_private_vm(priv->gpu, current);
+
+	/* Once ctx->vm is created it is valid for the lifetime of the context: */
+	if (ctx->vm)
+		return ctx->vm;
+
+	mutex_lock(&init_lock);
+	if (!ctx->vm) {
+		ctx->vm = msm_gpu_create_private_vm(
+			priv->gpu, current, !ctx->userspace_managed_vm);
+
+	}
+	mutex_unlock(&init_lock);
+
 	return ctx->vm;
 }
 
@@ -420,6 +432,9 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 	if (!priv->gpu)
 		return -EINVAL;
 
+	if (msm_context_is_vmbind(ctx))
+		return UERR(EINVAL, dev, "VM_BIND is enabled");
+
 	if (should_fail(&fail_gem_iova, obj->size))
 		return -ENOMEM;
 
@@ -441,6 +456,9 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
 	if (!priv->gpu)
 		return -EINVAL;
 
+	if (msm_context_is_vmbind(ctx))
+		return UERR(EINVAL, dev, "VM_BIND is enabled");
+
 	/* Only supported if per-process address space is supported: */
 	if (priv->gpu->vm == vm)
 		return UERR(EOPNOTSUPP, dev, "requires per-process pgtables");
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 89fead77c0d8..142845378deb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -85,6 +85,14 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	if (!ctx->vm)
 		return;
 
+	/*
+	 * VM_BIND does not depend on implicit teardown of VMAs on handle
+	 * close, but instead on implicit teardown of the VM when the device
+	 * is closed (see msm_gem_vm_close())
+	 */
+	if (msm_context_is_vmbind(ctx))
+		return;
+
 	/*
 	 * TODO we might need to kick this to a queue to avoid blocking
 	 * in CLOSE ioctl
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 82e33aa1ccd0..0314e15d04c2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -831,7 +831,8 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
 
 /* Return a new address space for a msm_drm_private instance */
 struct drm_gpuvm *
-msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task)
+msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
+			  bool kernel_managed)
 {
 	struct drm_gpuvm *vm = NULL;
 
@@ -843,7 +844,7 @@ msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task)
 	 * the global one
 	 */
 	if (gpu->funcs->create_private_vm) {
-		vm = gpu->funcs->create_private_vm(gpu);
+		vm = gpu->funcs->create_private_vm(gpu, kernel_managed);
 		if (!IS_ERR(vm))
 			to_msm_vm(vm)->pid = get_pid(task_pid(task));
 	}
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d1530de96315..448ebf721bd8 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -79,7 +79,7 @@ struct msm_gpu_funcs {
 	void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 			     bool suspended);
 	struct drm_gpuvm *(*create_vm)(struct msm_gpu *gpu, struct platform_device *pdev);
-	struct drm_gpuvm *(*create_private_vm)(struct msm_gpu *gpu);
+	struct drm_gpuvm *(*create_private_vm)(struct msm_gpu *gpu, bool kernel_managed);
 	uint32_t (*get_rptr)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 
 	/**
@@ -370,6 +370,14 @@ struct msm_context {
 	 */
 	bool closed;
 
+	/**
+	 * @userspace_managed_vm:
+	 *
+	 * Has userspace opted-in to userspace managed VM (ie. VM_BIND) via
+	 * MSM_PARAM_EN_VM_BIND?
+	 */
+	bool userspace_managed_vm;
+
 	/**
 	 * @vm:
 	 *
@@ -462,6 +470,22 @@ struct msm_context {
 
 struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx);
 
+/**
+ * msm_context_is_vm_bind() - has userspace opted in to VM_BIND?
+ *
+ * @ctx: the drm_file context
+ *
+ * See MSM_PARAM_EN_VM_BIND.  If userspace is managing the VM, it can
+ * do sparse binding including having multiple, potentially partial,
+ * mappings in the VM.  Therefore certain legacy uabi (ie. GET_IOVA,
+ * SET_IOVA) are rejected because they don't have a sensible meaning.
+ */
+static inline bool
+msm_context_is_vmbind(struct msm_context *ctx)
+{
+	return ctx->userspace_managed_vm;
+}
+
 /**
  * msm_gpu_convert_priority - Map userspace priority to ring # and sched priority
  *
@@ -689,7 +713,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		const char *name, struct msm_gpu_config *config);
 
 struct drm_gpuvm *
-msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task);
+msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
+			  bool kernel_managed);
 
 void msm_gpu_cleanup(struct msm_gpu *gpu);
 
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 5bc5e4526ccf..b974f5a24dbc 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -93,6 +93,30 @@ struct drm_msm_timespec {
 #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
 /* PRR (Partially Resident Region) is required for sparse residency: */
 #define MSM_PARAM_HAS_PRR    0x15  /* RO */
+/* MSM_PARAM_EN_VM_BIND is set to 1 to enable VM_BIND ops.
+ *
+ * With VM_BIND enabled, userspace is required to allocate iova and use the
+ * VM_BIND ops for map/unmap ioctls.  MSM_INFO_SET_IOVA and MSM_INFO_GET_IOVA
+ * will be rejected.  (The latter does not have a sensible meaning when a BO
+ * can have multiple and/or partial mappings.)
+ *
+ * With VM_BIND enabled, userspace does not include a submit_bo table in the
+ * SUBMIT ioctl (this will be rejected), the resident set is determined by
+ * the the VM_BIND ops.
+ *
+ * Enabling VM_BIND will fail on devices which do not have per-process pgtables.
+ * And it is not allowed to disable VM_BIND once it has been enabled.
+ *
+ * Enabling VM_BIND should be done (attempted) prior to allocating any BOs or
+ * submitqueues of type MSM_SUBMITQUEUE_VM_BIND.
+ *
+ * Relatedly, when VM_BIND mode is enabled, the kernel will not try to recover
+ * from GPU faults or failed async VM_BIND ops, in particular because it is
+ * difficult to communicate to userspace which op failed so that userspace
+ * could rewind and try again.  When the VM is marked unusable, the SUBMIT
+ * ioctl will throw -EPIPE.
+ */
+#define MSM_PARAM_EN_VM_BIND 0x16  /* WO, once */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.49.0

