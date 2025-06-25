Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9512F94B4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877957; cv=none; b=WU96P0CamOmxc4POF85vz4Ole4F/x1VdNTvgak2bw8riZzGD0ElY/td9o1CaW5bSD522aEUDwgvES1XJDLLz+j9i/iTpA1U8G1q2JvmkTSU0+dbD6sVqT+0l1EqRdF2PnKlsF/Q1FmZmRcnAAA0TCh/5YP3QWLzfRGjUAJd8Oos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877957; c=relaxed/simple;
	bh=vPu53PGWBpfPppllpl1iLj20es1VLGg4hj8SiJ/zrYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j/Vf68uW/JxyW0JADJfQVrrT0oV2UYolCDe3zvTkAPR61Sycez+mu+dnRtqQQYM5h4VGvfG2I435uGgImoghLREx0LFfhCfHh024mkzD3F4SDMyH0aE0RnUZKQVuoHCf3bsz9wJZ7EGh/4VHqP7wE93ZL7jG97J/ZKzqIGSOwYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WtZf3CkK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WtZf3CkK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCdV7M019166
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=49iUFarYqun
	NoIxPR8E20lSmIXKZAbaZ3WmH/nqkmuc=; b=WtZf3CkKNuQU97IvGeNFmcWXCY6
	y2l4y8KMgmNeiWDi0g8rGOrSkCzKn2ph/JxmTm7tL0MJ/qr4a+CkeUaZ4x+thjl3
	DLLAuPmFc9T+hc0c2jEUVcJeX3Nbd5qGNf/ioRPy0deT+qW2mOwvaNneFIRsvZqv
	V/hQv31Z0d/sAXbcJ+ZeEOfUQOBb/rylxj3dJY8xK14i/xGjgM23/tqYgWDNaJtl
	/PQR3mmLuMGbURcDyQzCDG0WKTXhKVoLurdai2h/Ip6rHKRHTC1b8ptbkpsh6IED
	Qmm6juVfCxYYyRiJPiYxmbFyPgrXA3THe7LRso6NbvuOi7q1mSCm+H9ikQg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwy7uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23692793178so1566105ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877954; x=1751482754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49iUFarYqunNoIxPR8E20lSmIXKZAbaZ3WmH/nqkmuc=;
        b=qFW4755fhflTS39ozd9/4GHZMxw15LCjpEgWuIB8wuultQ5L825owaaePMx+dli35a
         JO0xuUg8IpRUm8+jLKR3WrDRYapcEGFl9gj2KoT8viqPkTdHpx0I6bDx8wQMcoFRA/Lr
         YoYTCBvw+SqdjXWQG7X93lbx9W2sejvoy47f69nk+X0udsWcuzsBreWncX7Gu4YKp0Az
         XFyJEqa6yXw91kYscZonfT0stRE1FQZaFggko+BsZUWrnnIP+jKvHH5ffF7vKBecH4+x
         rkRXTu0wwJL/KLdKK93jZcv3A4aQExl1sr1fQEHzgWRROLbUO2/gDu/AANwdn6tTw+5h
         JD3g==
X-Forwarded-Encrypted: i=1; AJvYcCXulog4GxEMKNYefkcVOel9H0vI/EeFmXVFujYRXmdlrJD78FHAGY22ZBfJAxq6+L58R6ZjZSPyqJ+1Kdk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqAk9sSw3bE456z3ij5tMKWbg509eLQ+MyhbH6zWYGCXflvms3
	FKs06JRZsSTMRfcsoAjI7shVsC+6WQoqVCZPKLzqM9wgVCGH4ZgGm9ClxPPm8D75kN3CBqKTQ2u
	nqfr8F738gtP705vQzbBWErsLxhzLVtaWmAga3z13OLeL6cqLGc/hoUyLNIfSYXw9kOs=
X-Gm-Gg: ASbGncsfqqCBB61l3Hvccx+SZK2FT0qAkdxc5hy/yIp7S6PAuUdQ9bELaO727hLnwrV
	pc4YVnkj0ymtVK3LtfTQQvbBkCUiDlv/16K0GoVp7z/HntuyGxxRMjd2tSaZK4i4d3Q4xAPiH1Y
	fJmWu3IbtAgipZz8KcCTVqhLWyNPibVwNl2I/7jVNEZArAtaX5YMWYu1sqQMDBGyqgMFtloeGkp
	tjv+0YNFwvdcp0M42z8pOXShPWC58v5cyvL+dbco2ej9HYLsXpBV2VgxKIIV6M6d/k3Si6NrObr
	ziLHHSuFvgCui7wm8TWBS2+7RFSRSr+T
X-Received: by 2002:a17:903:1cb:b0:235:91a:4d with SMTP id d9443c01a7336-23824108cbdmr77910095ad.23.1750877953567;
        Wed, 25 Jun 2025 11:59:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf3AcJpzfzjZQsgRmjwLAbbXRsrGhtl7AY0PDU2VAAi3sP12gUBwP1a3MTqSTUA/gKCDHVqw==
X-Received: by 2002:a17:903:1cb:b0:235:91a:4d with SMTP id d9443c01a7336-23824108cbdmr77909665ad.23.1750877953165;
        Wed, 25 Jun 2025 11:59:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83989besm144278745ad.38.2025.06.25.11.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:12 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 34/42] drm/msm: Split out map/unmap ops
Date: Wed, 25 Jun 2025 11:47:27 -0700
Message-ID: <20250625184918.124608-35-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: G4v5h9_KiXvP-DQgMbvhAoU3NlOTiGU7
X-Proofpoint-ORIG-GUID: G4v5h9_KiXvP-DQgMbvhAoU3NlOTiGU7
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685c4703 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=xxbd-mT8tQbqgF3hF1cA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX2weDZSS4EUMs
 t+NWz9y0uCHh/NgQD9rbKHmJB9wktbG/fBYtGaE+OUOxPdahwblHIkB5TLqH6HcEDTb4qLDw4so
 yh94FXFwZD6rcXPMiVZOaorNUVmxF/feAefSdKKF/6yuX0RQ5/98zHu4BFnagrV5KzTYYhs9eum
 ehv9uIC6aR/TbhlB96D7kCRRnVLMiF3g5WQrQb+71nh6l9xlxKxF4wC+wz3Dvqc4duEu/6mQ9Kg
 aNCJ8yHOKS/au+atukekQOsoelJKaQwagilCYlirmO8WSWryL26c0pKc45cyfGydM/Btp+Se++0
 P4T8xL/jFPX3t5bPcwx1ItFNG2viOvWCFV/D+LXC/eS/xtk48CNQ4R7ZjLahMAOgRDNvooaXQ8M
 h1JEcxxv96Zg4iwrQFnBrBYJFqAUyRPHbs9YgdRDlZFQDUBB+dKLupj2gegU4s54NYlL6HoQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

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

