Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573F428031C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148374; cv=none; b=P+mamahlqsAteldTzzY+yUEapZ92Q/6n/8aI4XgnBfR0zIMIjlgzik45Qo4oXqVrKxU354CAmroMQNQbkfDxiKZLPAIkJl5NLRfqq5rKqNOY+FiRVy+qz/1QO/OEux9OAIFl5E9ArH18Lv2DAVzSca3mbNxKV//A8TL9HXQUdm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148374; c=relaxed/simple;
	bh=B9eE+MJ7+O1AN7BKJ5NQdswWxGPSuZQjmPfgsgUDJiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P1SLSJ8Lsz7p+I6OHWnnXlsZsa333sW9XCU/jbYEMMvbIzDMP+nTiqAuXeSXQUPtqL+qhwjgL8YaSutgt4vM3maztsowcpRtxA8zzCgmVj9mVTIIFiCafGOG8URwmoEJotb088exZ+FL3FiLs0iwwioKlwJ/I9ZbIvPDuYvzLoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PeKrppCO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PeKrppCO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GrJTf006553
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uUof/zDaOaC
	uzta8w72KM+mWpGInUe/M4USMZdkFuc4=; b=PeKrppCOxxNODy9F/tVq+FcFJi4
	dOkQ+mdt6SuviCpAZfONak5goTINH3OIVgMDyBgW5tePxyUhZqRZrt7VIWCfVclo
	+cs3HaOfNzEoLMUFyJajX/t9lJV1bkoydeC3i+UQSOUYhi24aPnWStfydborUC18
	VRzUSIODKewo+4TKb4VY2ASWLUx+niTc7i6LlcT2uuwWrbmDzpK5qJs6Ak2fNekG
	X2G0MglPizE/yy7BCh/h0eGTyMWdp7vKI2wMfg5tpxK0pzlctOnvEaGtPWux7FPu
	oBueTTZxM5un0eZXXHjvtQiyoGICDfkADqgOTQ40fbJob9y7AnPbAoS1LSw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t2aba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:32:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23536f7c2d7so19120735ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148370; x=1749753170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUof/zDaOaCuzta8w72KM+mWpGInUe/M4USMZdkFuc4=;
        b=IHOGGhnbKFVqEZmYT/593gnlh3oo5jZwHmAiziyiQzQ7F7LJpKLpo204NJ6uW/RnVX
         T6qtRGNv2CnVHYwoBoR8u9GtS1A8sp5BapztKDS4tjdpQQcmZFxIZCJksX0p+XWPRWie
         yUL3gwK4xivy3eOe1Kp13xfuQ+vM4RbSolpJ22dA2kH2rc3I666oLDY95B08vmvaAeeq
         VD1IsQcYQ8D/z28IFaZlByj1yr0nduDSZIH6t2WZfepZN2ERI7Jz094jF+zPRFUkkUJm
         tIt5d1SKJ4WTkjAASbOD2NZu8yg/YZx4QFFMSFvQMwmi9e83MlBm3dKAaOmO6xXVnXFz
         LC/A==
X-Forwarded-Encrypted: i=1; AJvYcCV8IOg/mGsszuPAij9mp5gCVVpEZFAQsMIziZenzlTrxRRhnnEO96XzCUyUUX/0jk5oDNATDRqBxANBOW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeBCBMfB69DnMK+nC5lHbB9q7PDM/zNb0JRW//lKFgkP0xNQdW
	JFoId/YCni0ctzhxHU3Jna2+Kxyzk7StP5G2QOULmgBxsffXr86gPT8NcqnasNhd+OP7F0GGwsV
	Bbr17GAvvnttwniuvrlh6IbS9YqzP798GxV6sNvPCHKK9Xc0fcd1HNWu1xlKOagmE5ls=
X-Gm-Gg: ASbGncvT4lzmh/hDVNqH5r03PU6U8ZXcKMzsfE8eP1sBEwUygnbUo577UfZkP4AJpob
	PluujHt6oaqLwSgseO2RL5vpNmY7ybOaS7HITEYkQ91MettRw8UFp3jIKGBkBNX3D6QPGXiO139
	DePNBN6blSIg4f7vhr1hWNKeKjs1aFDheWo0ClVSeUOpcfS5USmMMV1ztRbPoV1LkgP7TZeyXrO
	nKimsQOQC1WD9TlG8dGBlyPrnjS/6fz2suHWrIJNdrwocTC770NoK1iHQltcv7WD6QG7rl9JNbE
	KuC26V2/E/ZGXoR4DCLI2Q==
X-Received: by 2002:a17:902:e890:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23601cf6b9amr6390115ad.4.1749148370467;
        Thu, 05 Jun 2025 11:32:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQnM4xAK6Q7sA9TaODreLehbG/7tDzSTuO9E5rA5DKAL+arxWePbEuiI6ffeNfHj2Qkxo12w==
X-Received: by 2002:a17:902:e890:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23601cf6b9amr6389695ad.4.1749148370060;
        Thu, 05 Jun 2025 11:32:50 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd92c7sm122605935ad.62.2025.06.05.11.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:49 -0700 (PDT)
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
Subject: [PATCH v6 15/40] drm/msm: Add mmu support for non-zero offset
Date: Thu,  5 Jun 2025 11:29:00 -0700
Message-ID: <20250605183111.163594-16-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 19Q5aE90R7e-HVya1__d5gir1uOYpHto
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6841e2d3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=SJjE8ph6EfIcxDFTuEgA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 19Q5aE90R7e-HVya1__d5gir1uOYpHto
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX5JJWTsAyWphW
 A3CpHr3vGx21ICS+H1jCC7ptzGTvJQACC/iLxslKl92ARxCQWJ9J5m+DptAbeIcK+kwqNTYkXXy
 RAeBIPyFCpMy1Rb+clERIG8H/iYw5MQaZWbX35SaYY5pJhsJVidFDbg5tTvBYGmIfXV3g4yDbwJ
 4KstkXVegZEFIu0p2AxulGgMcQ1+h12eAWwpSe/rW6blRsJve20YgXbfxBPIAHk6xOQd6cBCIn2
 AEA0BVexn1SdiOX3REhbrALAOHz2WHrnIRM10Onu/qZhTnsVbV7WrnUy9WlFGXGt0R6JKF0Yet1
 zlEOU8MjP322I6BR4wjP4MWxBMcdQV4us5uxxn/Mgu9FY9Lo+clVRHjqwhLsoqrGAZYUYAxZB5M
 T87gF5YyxzoyBIRqTWEietB0g5DU0JvVpbJCCupFGXRzs1HNxpt09Ns4pP64F3tYr8wHxr2e
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

Only needs to be supported for iopgtables mmu, the other cases are
either only used for kernel managed mappings (where offset is always
zero) or devices which do not support sparse bindings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c |  5 ++++-
 drivers/gpu/drm/msm/msm_gem.c            |  4 ++--
 drivers/gpu/drm/msm/msm_gem.h            |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c        | 13 +++++++------
 drivers/gpu/drm/msm/msm_iommu.c          | 22 ++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_mmu.h            |  2 +-
 6 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
index 39641551eeb6..6124336af2ec 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
@@ -29,13 +29,16 @@ static void a2xx_gpummu_detach(struct msm_mmu *mmu)
 }
 
 static int a2xx_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
-		struct sg_table *sgt, size_t len, int prot)
+			   struct sg_table *sgt, size_t off, size_t len,
+			   int prot)
 {
 	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
 	unsigned idx = (iova - GPUMMU_VA_START) / GPUMMU_PAGE_SIZE;
 	struct sg_dma_page_iter dma_iter;
 	unsigned prot_bits = 0;
 
+	WARN_ON(off != 0);
+
 	if (prot & IOMMU_WRITE)
 		prot_bits |= 1;
 	if (prot & IOMMU_READ)
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 09c40a7e04ac..194a15802a5f 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -457,7 +457,7 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	vma = lookup_vma(obj, vm);
 
 	if (!vma) {
-		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
+		vma = msm_gem_vma_new(vm, obj, 0, range_start, range_end);
 	} else {
 		GEM_WARN_ON(vma->va.addr < range_start);
 		GEM_WARN_ON((vma->va.addr + obj->size) > range_end);
@@ -499,7 +499,7 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
-	return msm_gem_vma_map(vma, prot, msm_obj->sgt, obj->size);
+	return msm_gem_vma_map(vma, prot, msm_obj->sgt);
 }
 
 void msm_gem_unpin_locked(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 278ec34c31fc..2dd9a7f585f4 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -110,9 +110,9 @@ struct msm_gem_vma {
 
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
-		u64 range_start, u64 range_end);
+		u64 offset, u64 range_start, u64 range_end);
 void msm_gem_vma_purge(struct drm_gpuva *vma);
-int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt, int size);
+int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
 struct msm_gem_object {
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index df8eb910ca31..ef0efd87e4a6 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -38,8 +38,7 @@ void msm_gem_vma_purge(struct drm_gpuva *vma)
 
 /* Map and pin vma: */
 int
-msm_gem_vma_map(struct drm_gpuva *vma, int prot,
-		struct sg_table *sgt, int size)
+msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
@@ -62,8 +61,9 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot,
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt, size, prot);
-
+	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt,
+				  vma->gem.offset, vma->va.range,
+				  prot);
 	if (ret) {
 		msm_vma->mapped = false;
 	}
@@ -93,7 +93,7 @@ void msm_gem_vma_close(struct drm_gpuva *vma)
 /* Create a new vma and allocate an iova for it */
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
-		u64 range_start, u64 range_end)
+		u64 offset, u64 range_start, u64 range_end)
 {
 	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
 	struct drm_gpuvm_bo *vm_bo;
@@ -107,6 +107,7 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 		return ERR_PTR(-ENOMEM);
 
 	if (vm->managed) {
+		BUG_ON(offset != 0);
 		ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
 						obj->size, PAGE_SIZE, 0,
 						range_start, range_end, 0);
@@ -120,7 +121,7 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 
 	GEM_WARN_ON((range_end - range_start) > obj->size);
 
-	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, 0);
+	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, offset);
 	vma->mapped = false;
 
 	ret = drm_gpuva_insert(&vm->base, &vma->base);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index e70088a91283..2fd48e66bc98 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -113,7 +113,8 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 }
 
 static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
-		struct sg_table *sgt, size_t len, int prot)
+				   struct sg_table *sgt, size_t off, size_t len,
+				   int prot)
 {
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
 	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
@@ -125,6 +126,19 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 		size_t size = sg->length;
 		phys_addr_t phys = sg_phys(sg);
 
+		if (!len)
+			break;
+
+		if (size <= off) {
+			off -= size;
+			continue;
+		}
+
+		phys += off;
+		size -= off;
+		size = min_t(size_t, size, len);
+		off = 0;
+
 		while (size) {
 			size_t pgsize, count, mapped = 0;
 			int ret;
@@ -140,6 +154,7 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 			phys += mapped;
 			addr += mapped;
 			size -= mapped;
+			len  -= mapped;
 
 			if (ret) {
 				msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
@@ -400,11 +415,14 @@ static void msm_iommu_detach(struct msm_mmu *mmu)
 }
 
 static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
-		struct sg_table *sgt, size_t len, int prot)
+			 struct sg_table *sgt, size_t off, size_t len,
+			 int prot)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 	size_t ret;
 
+	WARN_ON(off != 0);
+
 	/* The arm-smmu driver expects the addresses to be sign extended */
 	if (iova & BIT_ULL(48))
 		iova |= GENMASK_ULL(63, 49);
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index c33247e459d6..c874852b7331 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -12,7 +12,7 @@
 struct msm_mmu_funcs {
 	void (*detach)(struct msm_mmu *mmu);
 	int (*map)(struct msm_mmu *mmu, uint64_t iova, struct sg_table *sgt,
-			size_t len, int prot);
+			size_t off, size_t len, int prot);
 	int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
 	void (*destroy)(struct msm_mmu *mmu);
 	void (*resume_translation)(struct msm_mmu *mmu);
-- 
2.49.0

