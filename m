Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEACF1F429C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148408; cv=none; b=i469u88s9OIKvtFYHopXabfL2BI8ipmRmtFxrNF+rrXZiPLIN4GnuWhIn+TMqdHoxhvd5aJ08iweoz8IwHaoNLtmqJIxvVk8FUJuDpaevH9SFeTWAvQgmtdfWPwlKx7gyGTU0MHALZZ7JEQGN439uxtGU6mPkBB5OerbKBbgF0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148408; c=relaxed/simple;
	bh=vPu53PGWBpfPppllpl1iLj20es1VLGg4hj8SiJ/zrYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTvlVPw7lE85IWeDRUsAzO5b7YiVXaj85GCZxMlO07kcv3fFmhXetCh4WhjGjXRjDBDdE6a5+NacQOWfS1n8JOFpyINtNmDAY5FoeV8l7B5RsjOGQjQOQR+kPq5pwgHDV0C0gp6WdBRiSHP3KbwenOGA4TzJcJfD8WSf3uBOWao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Er67g9a7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Er67g9a7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5559f4S0012952
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=49iUFarYqun
	NoIxPR8E20lSmIXKZAbaZ3WmH/nqkmuc=; b=Er67g9a7Gk+LidAHj0cQ3Qpw+LZ
	EOrAqqdSVqkDq59XlMHbDRo+tYSYL7Ja1AovMDGAFfF2RNgqcND39nck3lTCbvCo
	LEucwKE+Arcv/SdbxI7OJ5b9IVxrg9oGSUD7O3hKLfacNNtKdCxXKqZQyN0ZwYTd
	0u3k71SQtAiH1L9vSzgzSCvBcIegzE4XW4sEDc3spBWolYLfRJj4h6SLr826NJza
	w5+7da1NqDou+zrlJT0IwnlnI0os3Orinjhtu0HEh4mFr3Bg90ntPeH+RcxzsTs8
	wMTOX1zRZBOWfhWl2UEv29EAZ59+pjJOMTcILfb0SEXpKpf50Hv8+8CcpRQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47202wg0d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:33:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234fedd3e51so12380465ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148393; x=1749753193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49iUFarYqunNoIxPR8E20lSmIXKZAbaZ3WmH/nqkmuc=;
        b=ldoxIERGkeRTSZ7ebQ3ZcuQdZ3qRan4sxCz1xTZThM02UhuGUXgMj5sfdIZTjUaJlT
         gV4oC4dC1Yfn0FxFtvTu5xzsTzxUfQi1YdiAAXpC5/2YoE72RfzXvEUy0ZejG+H8Sonk
         SoJhMKzdIzrUpau84RjQIuXKsm2pxJBihpQ9/zyBBAxBjWIWIMxf5Tlfji7zweW17Tuo
         2S1PlfrIX0wui9p1Cky/KLlfg+SnwTYgHwcw2G+ofoTWP0c7EcX2GRZ81eQWWaQ5IGmd
         5z0X7LbFna77eYEEku0WX8Wqe37khrJIcZ0ibOn/r79UEHQlpC5EkU9IViP0bDlOLKcd
         5DRA==
X-Forwarded-Encrypted: i=1; AJvYcCWsDH2iiQe/3vjVJxedPafA/fKoEnIm9Di5UWDQTzJ5mjgZ/NdKyoL8477jzLhg2RRGue5HU060FzaxIQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI+kzqdoBFlMww9XKII7OrQ0lJ1D2QR8YSlckas6c/vQHF/KkN
	GUxXLPVYcmAAWsiFMMSkHcnDEeLAC1/MGfUc/YFywyAqJi0XIpP86RkK2oyutULeYKOVlYp9UYp
	dEXH17dThtU11SqNYnzCaDASaddd074o9ZivqwSW1sk6wXew264BDwkjf+sRmJgV7HbI=
X-Gm-Gg: ASbGncubE2Hrsi43eGJ1lGnlWhw0Cn9ygw9Hq1tmfZTUaZwFzE5xdvzWGVFtzeGhqBB
	0cFPy2O7RzuGMXbr472WgRBIHzurx8k+3TYeGUkBXuHKmOw5eMYSUmnfsiDqBMLLVGWzHFbMEQA
	9/cXaH1bTqU5ZZSh4zWUchFBXhRwvtl36wjIas2jku8QLBjIsdsWUqmSaDIqOirXqaoFEsKgjo9
	il5QgQC2XFbLYa4NtIO6dq4By4uJ06Wwdf9DGwabBi7ek+NjoJLvfLwNX4zJuT24xb41nHHMzJV
	tIhPh2Y7UZw7Z2B/jKCpmQ==
X-Received: by 2002:a17:903:2349:b0:235:2799:640 with SMTP id d9443c01a7336-23601d225damr6094195ad.25.1749148393472;
        Thu, 05 Jun 2025 11:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFl0jqdoODWZ/61ArVqyj/ItoV5kaRHwp4+BPeGGigRtruYOwxTDYKpmN1DgxwTU01eE5wdGg==
X-Received: by 2002:a17:903:2349:b0:235:2799:640 with SMTP id d9443c01a7336-23601d225damr6093815ad.25.1749148393096;
        Thu, 05 Jun 2025 11:33:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf954esm122815285ad.210.2025.06.05.11.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:12 -0700 (PDT)
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
Subject: [PATCH v6 32/40] drm/msm: Split out map/unmap ops
Date: Thu,  5 Jun 2025 11:29:17 -0700
Message-ID: <20250605183111.163594-33-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: pbYJPa2Pr7QwdP96KGngdTZIThZYUnC2
X-Proofpoint-GUID: pbYJPa2Pr7QwdP96KGngdTZIThZYUnC2
X-Authority-Analysis: v=2.4 cv=Y/D4sgeN c=1 sm=1 tr=0 ts=6841e2f5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=xxbd-mT8tQbqgF3hF1cA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX/dqgcTATmYQ6
 6uC1ttcZ0lxUKtrF4PUWzqUIG1t98khkMsaJhSUCd3xDKUv2dO0d6UOzb4Aka9KQKFCnKjSStdQ
 UbDcPA2GKOV+0Re/2IbDQM7HFqL3l3iiw66DCgh5UJb435AZVMxzLR7AVGBhMwwcHk1aONkkq6O
 +L62RztsUc2y4newFocIPojAdMYwlgw3eWx8upAnIwkOheBiEoON49GhtJ2LNqtqmz9nJLAfjSu
 Ss9qe/6C7Gig19cjEQ28tH67MjRAoe9PGtZpU0nDNR68ep1F/rNnCu9W586EmuM4CcwcJ3rDy79
 1KggMYswDPV96OBmw/Kxt5/3rYfp/huHGEVXjtGH3XTfK3926OD7dKD3Bt2UQ3jKn1BScDkCW4B
 aRkSv3abbN+EihZ8oXsLkhxyoaE0Uh2rnfLUqivK5ApZ/NaALBdLY/giUG24xaU29vsm556A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

With async VM_BIND, the actual pgtable updates are deferred.
Synchronously, a list of map/unmap ops will be generated, but the
actual pgtable changes are deferred.  To support that, split out
op handlers and change the existing non-VM_BIND paths to use them.

Note in particular, the vma itself may already be destroyed/freed
by the time an UNMAP op runs (or even a MAP op if there is a later
queued UNMAP).  For this reason, the op handlers cannot reference
the vma pointer.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 63 +++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index cf37abb98235..76b79c122182 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -8,6 +8,34 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
+#define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, ##__VA_ARGS__)
+
+/**
+ * struct msm_vm_map_op - create new pgtable mapping
+ */
+struct msm_vm_map_op {
+	/** @iova: start address for mapping */
+	uint64_t iova;
+	/** @range: size of the region to map */
+	uint64_t range;
+	/** @offset: offset into @sgt to map */
+	uint64_t offset;
+	/** @sgt: pages to map, or NULL for a PRR mapping */
+	struct sg_table *sgt;
+	/** @prot: the mapping protection flags */
+	int prot;
+};
+
+/**
+ * struct msm_vm_unmap_op - unmap a range of pages from pgtable
+ */
+struct msm_vm_unmap_op {
+	/** @iova: start address for unmap */
+	uint64_t iova;
+	/** @range: size of region to unmap */
+	uint64_t range;
+};
+
 static void
 msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 {
@@ -21,18 +49,36 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 	kfree(vm);
 }
 
+static void
+vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
+}
+
+static int
+vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	return vm->mmu->funcs->map(vm->mmu, op->iova, op->sgt, op->offset,
+				   op->range, op->prot);
+}
+
 /* Actually unmap memory for the vma */
 void msm_gem_vma_unmap(struct drm_gpuva *vma)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
-	unsigned size = vma->va.range;
 
 	/* Don't do anything if the memory isn't mapped */
 	if (!msm_vma->mapped)
 		return;
 
-	vm->mmu->funcs->unmap(vm->mmu, vma->va.addr, size);
+	vm_unmap_op(to_msm_vm(vma->vm), &(struct msm_vm_unmap_op){
+		.iova = vma->va.addr,
+		.range = vma->va.range,
+	});
 
 	msm_vma->mapped = false;
 }
@@ -42,7 +88,6 @@ int
 msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	int ret;
 
 	if (GEM_WARN_ON(!vma->va.addr))
@@ -62,9 +107,13 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt,
-				  vma->gem.offset, vma->va.range,
-				  prot);
+	ret = vm_map_op(to_msm_vm(vma->vm), &(struct msm_vm_map_op){
+		.iova = vma->va.addr,
+		.range = vma->va.range,
+		.offset = vma->gem.offset,
+		.sgt = sgt,
+		.prot = prot,
+	});
 	if (ret) {
 		msm_vma->mapped = false;
 	}
-- 
2.49.0

