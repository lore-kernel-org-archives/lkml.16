Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D098A2E11C4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877969; cv=none; b=tQYbSYJ9CX8amFRpDbKykeLHnW+/OBy/pG0VleWkK5Q31fSmBjSdCZd26Awdm/wQEHQvDBAOXdgKExU8iJWdiBtDOds5BmtkMOMsZ9wCu21W8P0Xvm53lGEho1kPwE8i/mWtMU/1Ldf17bhwEHwrOST+tc5BLySMkRhrOpdzRa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877969; c=relaxed/simple;
	bh=IgMPTl41AOACb9ah611XjQJ/WFilQt78MCmvu3cYwfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kh3WXeK9ZW+tF2N+xVcGXNlTj/ZcmUqPpdQmZye6ZvWHigQqfZ9T+Hxu3Sm/g5KIvt47T9FS+44eRlSvxamj10LxvHr1YuHDCTkiBeaKyZNnDTyuMflVFlRd+26buSh3Elnov6EA/z2Xp0OQ47OCZq5tJDOvszBpz64/1gTeiCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xc9zjrfY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xc9zjrfY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAcrQx022979
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I0h46r1xWj/
	RRFuFJ7X/xgD3zfEKUB3FLt0XctwRs8c=; b=Xc9zjrfYyuxOEmv13UcBO03CeIl
	7mq7tFcjlL+3Sj66fgdk/R5Xi4Rk9fe9KVP/HVNpyUrmZga8l8y74ZbFp6UlfypN
	JjmweFdCILRF9mYfRH82BGlLYB6YZOoOOQPg5d8VTnHGssdEhy/0k3Qor2gfTPsO
	9/zoFgBxLlk/IBsHPJjafPG+HFRk6WtMDQUeipm/YykJGDMP2nr2CdnCexS0JkC+
	8wPba6TbbrO7ZHGShF6axe9g7TEv/A2a4D9h3JlyucJC85K6Ae593dPifcg1CDGB
	o34MM5fxrBhIFtPLRRuH7PxztIvN0sN8ixHmmbbdU89ySalDdgDa5vwF7Qg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fapra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235c897d378so1460015ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877964; x=1751482764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0h46r1xWj/RRFuFJ7X/xgD3zfEKUB3FLt0XctwRs8c=;
        b=t8mu287733Bz690aA5DdR0gPo2xMbRtNnwJeZT/BfsbfE102PDvs4dVrkwj5jaoKHa
         s/Re499vIIv4Knp1WpNL6Ddb5V9DbYlgdcUIlfyyF3ScXIVUK4qQzDAddw1prl8yKDKf
         wzZzPiiBiCuNF/Zo+viJ5LDY1hlFAuTy3znsxSmLEutShugTYYkq9jH9FJ1F38DfYDmZ
         0ABsHUZ0QGb5IcQEoxbQGW1H0LUuyIkttfaBWOxjPKU3OPpRwzmqqBbJOp0NrxXAdnZG
         QCuWa0vgfPeTq7DAt6or/Da046bVF4kagEv2yVAmXXY+MoniIZv47w1RWAu4H9+N09Xu
         ZtGw==
X-Forwarded-Encrypted: i=1; AJvYcCULlR7uaf9K/IDx8vp1ci4XDvnA/puZklrAIcI99lWsaiC8ZUpukbL6VI1O2mMr9SJPVqpUI3LNm78GE1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJAMQZlgXE9uG4AtKq9A/sI2yMQpbrH1+qI9OsQAuMog1cq4xX
	EhS4fv3sGV1OlnbaabY9SNw3ID0Iy07bEcxv0NwyW8Z2WKMhymtu8AmDUc6AIbbO8Bob2Jm/zAP
	xIephNxEkJwIPGPrp95XlPNBr61iRz8s3uwZ17vt9KVNutc+b0OmcOTrZ1VZhomUDMfw=
X-Gm-Gg: ASbGncsDpEairBt4H24nVG81m/4XJG1Fm2X5+Szm8nlIbcEH7Um39cZClVCzSZLDtJW
	p5v7HH5mlFopV3UIDpt5JBVspfOsTjcbW9NvKdR6gDriwYbMdSd70wsaia+TUU069RcmaB9rfPy
	p8XHkEoEtdCyLEj7mgz/oDnAkbyhtdpUmeK3qyWVutZVIZObkM0FwUL1FLIooAQ2DFkubu0ZHDL
	Qx5u96fjR2+bvj6x5EoTg2C55GYq48slTned675mWrT0YcTeTr7cDlIVNm0FRNHAGBgIm2py1fS
	HqukZPznhyx9tboN4/Beb0horI+H7sxR
X-Received: by 2002:a17:902:cec1:b0:234:f580:9f8 with SMTP id d9443c01a7336-23823f87b5amr70645905ad.3.1750877963904;
        Wed, 25 Jun 2025 11:59:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvhxih0y9qRe4C4d7srb0jgNwb6h7s684Vah0jgoGyb4gqz4t/Gm8EerJvHEPZP+HR0txKXg==
X-Received: by 2002:a17:902:cec1:b0:234:f580:9f8 with SMTP id d9443c01a7336-23823f87b5amr70645495ad.3.1750877963386;
        Wed, 25 Jun 2025 11:59:23 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860a861sm139781875ad.101.2025.06.25.11.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:22 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v7 41/42] drm/msm: Defer VMA unmap for fb unpins
Date: Wed, 25 Jun 2025 11:47:34 -0700
Message-ID: <20250625184918.124608-42-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MiBTYWx0ZWRfX5NS4w/vMFrs8
 5pVb0GDQzJ5sdPMCuztFMbBwxenK89P/2RNlX2I2/tL4lbSzOa5/ucHgLgPWoQFmOtZdEeB8XaR
 TLq+HovQalN9rwkdXSDE/lJnLSC7ZRAV7Ml2ADG7RN6pIqmtOqCX8CYZnqR1QonNfNgee7dJyv2
 MWGwjLpVk1BPtER91UOoyJPz6xMr+KBaAECjv0LKLB0dVjSbv51QvgrGLDcuGHD63Ugnii+E/6o
 rkvI74b/usRnxj/ufe4EKUp15046Mdc54+RVEs3yNDNd80mrWNZzLWFAUgRTxknALnFk2AcHRvX
 PzqY/wXey35c3r/jVcBGF/hX+vH3vJUkQCJ59phlXvviiFYAAaO8rbgj9uiFMtQAFaYShDNFgW6
 TjT7vADOnWXFp+eVr6FP9mSKX1W3z6drIx5jsGp1Xs83FX1QRjbZ7i9BftHPYXq8xqmT1Abk
X-Proofpoint-ORIG-GUID: jJahSpPIbMFMF0DKUtKq2ronhbM43GZO
X-Proofpoint-GUID: jJahSpPIbMFMF0DKUtKq2ronhbM43GZO
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685c470d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=HvHaJK4xSQnTU1JWlMsA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250142

With the conversion to drm_gpuvm, we lost the lazy VMA cleanup, which
means that fb cleanup/unpin when pageflipping to new scanout buffers
immediately unmaps the scanout buffer.  This is costly (with tlbinv,
it can be 4-6ms for a 1080p scanout buffer, and more for higher
resolutions)!

To avoid this, introduce a vma_ref, which is incremented whenever
userspace has a GEM handle or dma-buf fd.  When unpinning if the
vm is the kms->vm we defer tearing down the VMA until the vma_ref
drops to zero.  If the buffer is still part of a flip-chain then
userspace will be holding some sort of reference to the BO, either
via a GEM handle and/or dma-buf fd.  So this avoids unmapping the VMA
when there is a strong possibility that it will be needed again.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c       |  1 +
 drivers/gpu/drm/msm/msm_drv.h       |  1 +
 drivers/gpu/drm/msm/msm_fb.c        |  5 ++-
 drivers/gpu/drm/msm/msm_gem.c       | 61 +++++++++++++++++------------
 drivers/gpu/drm/msm/msm_gem.h       | 28 +++++++++++++
 drivers/gpu/drm/msm/msm_gem_prime.c | 55 +++++++++++++++++++++++++-
 6 files changed, 124 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 710046906229..585527fe09e7 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -826,6 +826,7 @@ static const struct drm_driver msm_driver = {
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
 	.dumb_map_offset    = msm_gem_dumb_map_offset,
+	.gem_prime_import   = msm_gem_prime_import,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 9a4d2b6d459d..b20d94d1a22e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -246,6 +246,7 @@ void msm_gem_shrinker_cleanup(struct drm_device *dev);
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
 int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
+struct drm_gem_object *msm_gem_prime_import(struct drm_device *dev, struct dma_buf *buf);
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
 struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags);
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 8ae2f326ec54..bc7c2bb8f01e 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -89,6 +89,7 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 		return 0;
 
 	for (i = 0; i < n; i++) {
+		msm_gem_vma_get(fb->obj[i]);
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
 		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
 			      fb->base.id, i, msm_fb->iova[i], ret);
@@ -114,8 +115,10 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 
 	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 
-	for (i = 0; i < n; i++)
+	for (i = 0; i < n; i++) {
 		msm_gem_unpin_iova(fb->obj[i], vm);
+		msm_gem_vma_put(fb->obj[i]);
+	}
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b882647144bb..c56d773a3d04 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -19,11 +19,11 @@
 #include "msm_drv.h"
 #include "msm_gem.h"
 #include "msm_gpu.h"
+#include "msm_kms.h"
 
 static int pgprot = 0;
 module_param(pgprot, int, 0600);
 
-
 static void update_device_mem(struct msm_drm_private *priv, ssize_t size)
 {
 	uint64_t total_mem = atomic64_add_return(size, &priv->total_mem);
@@ -43,6 +43,7 @@ static void update_ctx_mem(struct drm_file *file, ssize_t size)
 
 static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 {
+	msm_gem_vma_get(obj);
 	update_ctx_mem(file, obj->size);
 	return 0;
 }
@@ -50,33 +51,13 @@ static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
 			    bool close, const char *reason);
 
-static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
-{
-	msm_gem_assert_locked(obj);
-	drm_gpuvm_resv_assert_held(vm);
-
-	struct drm_gpuvm_bo *vm_bo = drm_gpuvm_bo_find(vm, obj);
-	if (vm_bo) {
-		struct drm_gpuva *vma;
-
-		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
-			if (vma->vm != vm)
-				continue;
-			msm_gem_vma_unmap(vma, "detach");
-			msm_gem_vma_close(vma);
-			break;
-		}
-
-		drm_gpuvm_bo_put(vm_bo);
-	}
-}
-
 static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 {
 	struct msm_context *ctx = file->driver_priv;
 	struct drm_exec exec;
 
 	update_ctx_mem(file, -obj->size);
+	msm_gem_vma_put(obj);
 
 	/*
 	 * If VM isn't created yet, nothing to cleanup.  And in fact calling
@@ -103,7 +84,31 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true, "close");
-	detach_vm(obj, ctx->vm);
+	drm_exec_fini(&exec);     /* drop locks */
+}
+
+/*
+ * Get/put for kms->vm VMA
+ */
+
+void msm_gem_vma_get(struct drm_gem_object *obj)
+{
+	atomic_inc(&to_msm_bo(obj)->vma_ref);
+}
+
+void msm_gem_vma_put(struct drm_gem_object *obj)
+{
+	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct drm_exec exec;
+
+	if (atomic_dec_return(&to_msm_bo(obj)->vma_ref))
+		return;
+
+	if (!priv->kms)
+		return;
+
+	msm_gem_lock_vm_and_obj(&exec, obj, priv->kms->vm);
+	put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
 	drm_exec_fini(&exec);     /* drop locks */
 }
 
@@ -664,6 +669,13 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
 	return ret;
 }
 
+static bool is_kms_vm(struct drm_gpuvm *vm)
+{
+	struct msm_drm_private *priv = vm->drm->dev_private;
+
+	return priv->kms && (priv->kms->vm == vm);
+}
+
 /*
  * Unpin a iova by updating the reference counts. The memory isn't actually
  * purged until something else (shrinker, mm_notifier, destroy, etc) decides
@@ -679,7 +691,8 @@ void msm_gem_unpin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 	if (vma) {
 		msm_gem_unpin_locked(obj);
 	}
-	detach_vm(obj, vm);
+	if (!is_kms_vm(vm))
+		put_iova_spaces(obj, vm, true, "close");
 	drm_exec_fini(&exec);     /* drop locks */
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 9671c4299cf8..47d07a01f0c1 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -211,9 +211,37 @@ struct msm_gem_object {
 	 * Protected by LRU lock.
 	 */
 	int pin_count;
+
+	/**
+	 * @vma_ref: Reference count of VMA users.
+	 *
+	 * With the vm_bo/vma holding a reference to the GEM object, we'd
+	 * otherwise have to actively tear down a VMA when, for example,
+	 * a buffer is unpinned for scanout, vs. the pre-drm_gpuvm approach
+	 * where a VMA did not hold a reference to the BO, but instead was
+	 * implicitly torn down when the BO was freed.
+	 *
+	 * To regain the lazy VMA teardown, we use the @vma_ref.  It is
+	 * incremented for any of the following:
+	 *
+	 * 1) the BO is exported as a dma_buf
+	 * 2) the BO has open userspace handle
+	 *
+	 * All of those conditions will hold an reference to the BO,
+	 * preventing it from being freed.  So lazily keeping around the
+	 * VMA will not prevent the BO from being freed.  (Or rather, the
+	 * reference loop is harmless in this case.)
+	 *
+	 * When the @vma_ref drops to zero, then kms->vm VMA will be
+	 * torn down.
+	 */
+	atomic_t vma_ref;
 };
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
+void msm_gem_vma_get(struct drm_gem_object *obj);
+void msm_gem_vma_put(struct drm_gem_object *obj);
+
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
 int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 1a6d8099196a..b5cea248b7c3 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -6,6 +6,7 @@
 
 #include <linux/dma-buf.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_prime.h>
 
 #include "msm_drv.h"
@@ -42,19 +43,69 @@ void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 	msm_gem_put_vaddr_locked(obj);
 }
 
+static void msm_gem_dmabuf_release(struct dma_buf *dma_buf)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+
+	msm_gem_vma_put(obj);
+	drm_gem_dmabuf_release(dma_buf);
+}
+
+static const struct dma_buf_ops msm_gem_prime_dmabuf_ops =  {
+	.cache_sgt_mapping = true,
+	.attach = drm_gem_map_attach,
+	.detach = drm_gem_map_detach,
+	.map_dma_buf = drm_gem_map_dma_buf,
+	.unmap_dma_buf = drm_gem_unmap_dma_buf,
+	.release = msm_gem_dmabuf_release,
+	.mmap = drm_gem_dmabuf_mmap,
+	.vmap = drm_gem_dmabuf_vmap,
+	.vunmap = drm_gem_dmabuf_vunmap,
+};
+
+struct drm_gem_object *msm_gem_prime_import(struct drm_device *dev,
+					    struct dma_buf *buf)
+{
+	if (buf->ops == &msm_gem_prime_dmabuf_ops) {
+		struct drm_gem_object *obj = buf->priv;
+		if (obj->dev == dev) {
+			/*
+			 * Importing dmabuf exported from our own gem increases
+			 * refcount on gem itself instead of f_count of dmabuf.
+			 */
+			drm_gem_object_get(obj);
+			return obj;
+		}
+	}
+
+	return drm_gem_prime_import(dev, buf);
+}
+
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg)
 {
 	return msm_gem_import(dev, attach->dmabuf, sg);
 }
 
-
 struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags)
 {
 	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
 		return ERR_PTR(-EPERM);
 
-	return drm_gem_prime_export(obj, flags);
+	msm_gem_vma_get(obj);
+
+	struct drm_device *dev = obj->dev;
+	struct dma_buf_export_info exp_info = {
+		.exp_name = KBUILD_MODNAME, /* white lie for debug */
+		.owner = dev->driver->fops->owner,
+		.ops = &msm_gem_prime_dmabuf_ops,
+		.size = obj->size,
+		.flags = flags,
+		.priv = obj,
+		.resv = obj->resv,
+	};
+
+	return drm_gem_dmabuf_export(dev, &exp_info);
 }
 
 int msm_gem_prime_pin(struct drm_gem_object *obj)
-- 
2.49.0

