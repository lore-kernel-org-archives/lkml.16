Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98296241CB6
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228232; cv=none; b=C1kTmAPrzc89KuvmovWkXb6dRhuSwGV71t2XV/BJZ0lbqtY3haIfsltUMgXp3vpbCwkrnhKz/674LvQVDJNQI9Z3BkGNfEnagHakgsB1xSnXF1cUmzoWdZ1yfbShfJrpvbB4jHjLJkVDvzSMhq4J3jwguAdblehkzlqfvCIDzR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228232; c=relaxed/simple;
	bh=MPo1IkqWJ2Qo6U6FxPeDsi41WXUD+qgCx9wi/nJZ6nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQ+upN5YoEtAV5bhjkXkEuSCNr+wmE89OA9cLRPB69HrULwfSJk3ZWhU/MoMt3oq3N4RXIYraimYz2s6R8UmTTY+21cHCdcFdOOt98TRneZVvMEAj903QcFoB8COCay55wTVDpht+HA4RhazSirnli1DxlxcPfffHfBq6+qu2zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RSmfV4mc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RSmfV4mc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDqWF6026426
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A54UdMciCNB
	ls2/cngumRMQ7rIW/ZCmN2ztDtF1NIpw=; b=RSmfV4mcvX5pQ405rpyNr43/qDU
	7sAdjMrbR9hT8P0OK7oG1yg6B3Wq8RHgbDJ5/pIFs3dDGh9D9LAqVIYXCb/n9Wdf
	G6F1K+376yppN+S1oddc6eRkMo919bSAJATg3QUwhVnegGjPLm3X/TcSBOVIesri
	9q8LMjyUpTSYAPMT55dpYht1xmYn5KfYwg8Zi2wUaGq4HGqr/KtpRjjR1fCcMn9Z
	D3abonYgAdddvhUAG42wEKJYLiMEyX0+NNTRxKEoRkrRIbrCdBT7bts+8Op3ZDrl
	aPk3C3irtBbdoXiDAZaAX+Ec5nJW+7ynPCEywSHu3y8YwdEBjRt5rT+V/mw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvjptp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74890390d17so3244998b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228227; x=1751833027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A54UdMciCNBls2/cngumRMQ7rIW/ZCmN2ztDtF1NIpw=;
        b=I2JBWhvO4fYevaCS+G6vVawF/m5KwEKnzFDovogH1No6+s872kSlq0AagbiAP2zqa0
         OcGQut7gpAGMESok0+hFEUOcwwvpj+8ot8Vfu3EO2IrNd1o5/griEJ1/XSLxC34Hg9WW
         wcpXKqDwgQFDEypBIDG5lco1oW3wGGCZpR+7EHptL/SLGIJPadNyhu71hIXkw0klGo+J
         1SQQgfJa5NUrO3ub/VNVd8afKX1rgfjmqMWi9/Ec6C5e7NaKbaYQZ9twBF5o9VtuZrpI
         2oSTb2a9X7NOT1zMvrdo7hyUO/x103xhQpdsPqniwxMxjxggDCME8ixU3tN8ubuK9j7h
         NFrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW5ccksto/F4K4D7UG3BTTWlp27h+Us9So9BxkHX+pM1RYtoWysN8+KuyPysYfF5C3KrF2F67tNIAWHpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL91uMhm/tmBBsZBJJ5AFb7QtYehgJwRODDg3ycuoq5WeRQ62+
	d3ScxiAZjCcSXdIGSYyc0TGrntUsuukkTNkUyIUaARLrHoLqjb7xhZttR2vSS7oPCbMZVS8fix5
	65moWNVIS59NOJq2IbBPnYf8MWJM7JehKtRbUA9wfC6k6ykKXgGpaNtSpX9UAzerXqWYEdP4l43
	c=
X-Gm-Gg: ASbGncspJmdKIrMzU0QUF+YGVreM3C9vMsiKXFKwdOeHRvpsefBHC0nqYlTIfliFxfJ
	fP8Q9ZF6pwhKCJZI/kYbjpfUwRuidEO/sy/KtRzI8x39N/hnTBKF3nHWeNsDtsyJaqY5dvpnXn4
	S6VnwIVfU5r6tvXnuj6c3I9Jpg4CamCzO+pWmE+jJwTUFPVGwN/mTbGRhYG8vVmvxqpbI/r3EHi
	M5X3yknpAWxMIcN00bqjycTBL21el9PSCJEi+XJQTbKK8mnBygQ5CupBLoj06nAhBojocxY+c40
	wQAR09m9bSgwlxHnpm7Y214J4IRbMEamIQ==
X-Received: by 2002:a05:6a00:845:b0:749:540:ca72 with SMTP id d2e1a72fcca58-74af6f5b39amr16188975b3a.24.1751228227425;
        Sun, 29 Jun 2025 13:17:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9aruV6eSL2q1mrAooTzltJ0Bk0WGQyzvvWFqX/Eu7bihRZwCW1HMVKXXsx1qqK/9yIQBAVw==
X-Received: by 2002:a05:6a00:845:b0:749:540:ca72 with SMTP id d2e1a72fcca58-74af6f5b39amr16188957b3a.24.1751228227015;
        Sun, 29 Jun 2025 13:17:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e302378bsm5914877a12.23.2025.06.29.13.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:17:06 -0700 (PDT)
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
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 34/42] drm/msm: Split out map/unmap ops
Date: Sun, 29 Jun 2025 13:13:17 -0700
Message-ID: <20250629201530.25775-35-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: 5FInVbZz5f6EywU_hA76dwcoQojaXgYM
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68619f44 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=xxbd-mT8tQbqgF3hF1cA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 5FInVbZz5f6EywU_hA76dwcoQojaXgYM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXzb3WO2DkKbFH
 cXGj9nADK9gD93BHdP5iR5e8ihE5O3ivYg+q8A7/Hi563Nb/sSocd+ohvB6BsO7hHqybXY13eBm
 b9/nwGypJ8auDoFEIBEH0Gp4RhqEvUXgAZGrHCTkXlelMde+RTYEflTtrQnLMASU4qrnwJT5icm
 te6+SFUBrWicOFLTnUkZ3wyG9PkHvXOXw2jIYY21EFi9SoJJpSiVauy1KozfqErQKKos1FSsEb8
 rAocYY60DQzbBmsF0pCGAPbGLU5l/r++I2dTRBs4W9INnPm1oUsGoR7Afm6wnPN4LvPWYyz/1Su
 rlyIll3E177nuKTf1WmBrkJGdB6POPCi+/WyjPJoeh1rUQCECCyyGfy4S8oqtGR1I+2lR1vV4h6
 2+2YvBrfte+zKv5t1kHu9r78gNuS9so+Sm9/kfooYojEzi2GwOK3nj991NS7fZpl24QeCJEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172

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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
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
2.50.0

