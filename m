Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A0F25393D
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206105; cv=none; b=fxIOs2hZ5Unl6hlosyjK+qdvuhGfX2sItRkTuZb5AjH1t8O2ZltFRU/uLfHaOjdwIj9x4V4/H+fxW87BTfDxSbi2Di0CexTEkZuNyqUNPlafItNaga0LB3i4w+LEEFson3oN9X+dmIiL/KIgm+WS1MNKUgF84I8I4jov2NJwA80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206105; c=relaxed/simple;
	bh=W8kPWjbVzloymT+WUD1vDHZMSH23Ip4gfQjinZZYu1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kir1mQpxgw6VMUpcryd18o7y//tCfwwJSByJNMFX234jtjGfg/FbzltHG4dKOh2topNTYuoiEbGzzTelZ+krwJ/3DQXkIL3pIMeIUCSaOnKRDycaniU3h00zlS85g70fekin4QgFAUl/Mw61mkbvRk3HzRlwz+T9Hr6mnCE9QOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnhurXEW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnhurXEW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAgvJJ010227
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=b2JMHHLa1rE
	J4Hs2IxSKvgFj2W/GQDFpMVFHK3adsj0=; b=RnhurXEWnAH8uYJ3s6DP5uG/WRL
	F/5z9lItVk3+tUZspn/DgHu1wH31NA8wKMkAShUxYbPD0rco5Vz37TKdQsed8t0C
	q2wAUZJv9+UU9Jq5QtHxCwQr32yqEPEf6dAXT1OVIZH8L1FhUOQYU+5C5+0Exazx
	OmxZkTh4T3T+CwtW7on1M++KJpVnkrJi39X54R5qCkqdybvec+85ZMzvIjgRDMMJ
	USEydlk/NEYtU1gAbUThCAMIgO4rahD7qsv9g0c10v9CqPlZbhoyd6X3KT7pt8Nb
	i3vDdy7HKpMBV7Dnmlqa5CtR0Vz7L2DjLZ9mAW70SF1vJvYUAZ6Aqg8nU+g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxa8gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-313c3915345so5324396a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206100; x=1751810900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2JMHHLa1rEJ4Hs2IxSKvgFj2W/GQDFpMVFHK3adsj0=;
        b=GoppuRF9Qq+CajON0Q2OOk1coMdOHsvNepqDvr/fgz1QiyEa/JpPVCQ+nzKMKX1ShC
         r5AIyxl5+xCo0Z8HMKJ2H0vSQyMR+qpKeeIaGDSFzdewWPblgkaw3Ku6K+zuuLOXVUlK
         uQ5dbRSzuMqd1Az5xzFubKBkuNaxnH4hKUulJON6NahJit2VXGwyRJI8gpRgCthwNdy2
         WeqUh1B4nqrzxsMxRZxT3T5mE14imBaDt0SzyrDMURUQ8L+A2zfsN7sQ/Y2gHOSTfjX1
         v85ijIVPabZ1OvZ/qLX9/izaFv638XNtvm12zkjx7fDg+O7o3Uprveyi0bUo7Q/6mC3z
         gUAw==
X-Forwarded-Encrypted: i=1; AJvYcCWktmyKlacid19p8KNE4MOrDR+xQcwu0OBAJFFsjmTjUPB4pNk5PC7ldFiVYgXKRDA3pI5HqzTf80K7ggM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmr4BPB43SZlJFR+Jwm+4weDcDEne+eUxbZpgp5Ld60JkEQGQ/
	uZ32xOTYotdhbCPB745auXniPyah0m1lsbRAFVV1+d7HoRGgmGxghZqj/9pex4zbNGyCSDLpAYF
	r8xvAiQ1K3ZPF5DM2BJ8miqN4Kmr2C8MyOigfRjWv9Om4xOJW6Y4Vo7VLbjdUMdu5f8I=
X-Gm-Gg: ASbGncsxehePuf7kSNngWSAIGXsLi2b1ewm0r0IxTXsUKtts/y2P06BsLnMlNshrnaB
	rYxhkrEeYpNfPVZp36L9Aj3tIndyY9KjI6+nM7S1myEZrZE4MOA5hvFfuaE2/kxHUXGf0Swx37O
	w1HHyuwyv9wgqOsqOvNer6eAJJlMeJPHB8D0WPqXcbf3WJavsdPmwkyi5ZBEoSGIbIIPAshaSnh
	EAd2blxm09BTADlY4iedc3r+SRJfIGoItSk/oihu7EagF+Y+ibSgnzM2o54mM1KiBULbwPhGzrb
	fMTySDcW1VVolASlHHxsLi7rVl5nuyNA
X-Received: by 2002:a17:90b:4c89:b0:30e:8c5d:8ed with SMTP id 98e67ed59e1d1-318c92ec0b3mr12948873a91.19.1751206100134;
        Sun, 29 Jun 2025 07:08:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiDMbz31LMjbBb02d/S56Uv7tkiAC4YMLY2zh6CZRHS60/qIk/uFxuDOgoVcjoCDswRHPwiw==
X-Received: by 2002:a17:90b:4c89:b0:30e:8c5d:8ed with SMTP id 98e67ed59e1d1-318c92ec0b3mr12948828a91.19.1751206099564;
        Sun, 29 Jun 2025 07:08:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b3afbsm59289295ad.161.2025.06.29.07.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:08:19 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v8 41/42] drm/msm: Defer VMA unmap for fb unpins
Date: Sun, 29 Jun 2025 07:03:44 -0700
Message-ID: <20250629140537.30850-42-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX288mUkdQcoxx
 u4dvbYqy9EqUsHSZNqJMYB7vogB6nFy44W8PR/khpEvJn6+Gfv/cppqhfk3Br0+YzrnPBZUBBRA
 jXQSalchT8nEiubjxSZC58vxEtu/XAkJJQExLZaswX8jnaDWiSUtfoLayfp9Zq7EipoyzM9Zhad
 N+M+y5xQv6TcljM+UrOwbgR7lsOQ9j/rFDmzQ2BdVcgY5/qirnRsdI5wX0EQHN1UJF+cHFZkJVx
 WJPMKsfccFt52C03C9Bv561pKJS0rjBUva5mO5V3eSnkM+9beNg+4Am1GmkzfaNO1WC4J0dKZls
 GmtvsCCNtUD42IQW4f+6YhULEZeQ5KYIyL9E6Q7uU1t+A70NlaKul1Rd2PfiJiIp81pHJb/njNp
 dyzDy2/i4wf/z0QDEWn4yDi8sIArVMNWMZPsH6sBVknRAdDrGEZnQl3XqaolqCRiCgwytugG
X-Proofpoint-GUID: G7DymsdL9lpj56jJ6IRckD-jifjWPHR4
X-Proofpoint-ORIG-GUID: G7DymsdL9lpj56jJ6IRckD-jifjWPHR4
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=686148d5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=HvHaJK4xSQnTU1JWlMsA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=919 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119

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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c       |  1 +
 drivers/gpu/drm/msm/msm_drv.h       |  1 +
 drivers/gpu/drm/msm/msm_fb.c        |  5 ++-
 drivers/gpu/drm/msm/msm_gem.c       | 60 ++++++++++++++++++-----------
 drivers/gpu/drm/msm/msm_gem.h       | 28 ++++++++++++++
 drivers/gpu/drm/msm/msm_gem_prime.c | 54 +++++++++++++++++++++++++-
 6 files changed, 123 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9b1f1c1a41d4..0597ff6da317 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -830,6 +830,7 @@ static const struct drm_driver msm_driver = {
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
 	.dumb_map_offset    = msm_gem_dumb_map_offset,
+	.gem_prime_import   = msm_gem_prime_import,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 200c3135bbf9..2b49c4b800ee 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -269,6 +269,7 @@ void msm_gem_shrinker_cleanup(struct drm_device *dev);
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
index 3e87d27dfcb6..33d3354c6102 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -19,6 +19,7 @@
 #include "msm_drv.h"
 #include "msm_gem.h"
 #include "msm_gpu.h"
+#include "msm_kms.h"
 
 static void update_device_mem(struct msm_drm_private *priv, ssize_t size)
 {
@@ -39,6 +40,7 @@ static void update_ctx_mem(struct drm_file *file, ssize_t size)
 
 static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 {
+	msm_gem_vma_get(obj);
 	update_ctx_mem(file, obj->size);
 	return 0;
 }
@@ -46,33 +48,13 @@ static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
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
@@ -99,7 +81,31 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 
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
 
@@ -656,6 +662,13 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
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
@@ -671,7 +684,8 @@ void msm_gem_unpin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 	if (vma) {
 		msm_gem_unpin_locked(obj);
 	}
-	detach_vm(obj, vm);
+	if (!is_kms_vm(vm))
+		put_iova_spaces(obj, vm, true, "close");
 	drm_exec_fini(&exec);     /* drop locks */
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 1ce97f8a30bb..5c0c59e4835c 100644
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
index 4d93f2daeeaa..c0a33ac839cb 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -6,6 +6,7 @@
 
 #include <linux/dma-buf.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_prime.h>
 
 #include "msm_drv.h"
@@ -42,19 +43,68 @@ void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
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
2.50.0

