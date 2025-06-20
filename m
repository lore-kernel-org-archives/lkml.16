Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E36A2EBBAB
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434351; cv=none; b=bmTlnw2D7+uv1LF8GQrp0kdqtOGaoCR+4Hnx2nRCHuqV2SW5Si3BWjDKuYMFhclMDCtjjaiD45w1XXRlPQsrKgWdhrQbgnvInoK3M6OubSDR4nNG4c6rmk2GNPTVS4JH/ogyyzz/oIJ0MQBew+0QSHgUXghjybQc+r54Br/QSEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434351; c=relaxed/simple;
	bh=MYuEJE+0SdySaYO3CVU/uvi2cgNQjyHkEeNQNPJjWt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=myF1l+aCCYxJVdZGOJYVRMQliIN2polQx9dTDNdeOs4th0OMCm7ftiljOYLToCySFF7pL5WrVCPHthbvTojWy+XJWK/N46HTRxxv/zhdH8rg4h1yROPflZysWnYvKiooW9DHGeRA4xH4Xw+q/SoT/UHwcCwt29LbHJQP/Z9bYXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AvviTS9f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvviTS9f"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KD1K9c013410
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IBNhqEhlbdF
	Pkj+kCuKLrjIW5Ve2xstiu6VBwj267oo=; b=AvviTS9f6YCfBfqr5RxjM/w0mcB
	ZeBKRk0jNK8bNr6inafZx1LJ/Gy5dAoSpznk/4QKl8qv4lW4Pd1BrEzF+Gny/jCY
	bTxbrjYfu1iS4IqLH3YwwboDiT120HmoAH9sI+mdn6Ow0FkzEzS57cqyvtMpsQ2N
	/QMUMDPCkiY6sCEBWZSe4Q0zDNEniBQwRhnTTj6vQHrxe2aBejhBSUyXcyLBT5ZY
	rUFfc55w9ubPwxaaAyKdsffHZQxdd9JR/YwrOm00vx3yZQOF3rAyx5izkXPllGjG
	xDEKdACYyJSGcLi577870cRSSeQXTDgS18X946FVkuN/V1zFl8or6GV98oA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792cabxrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:45:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2356ce66d7cso25695475ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750434348; x=1751039148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBNhqEhlbdFPkj+kCuKLrjIW5Ve2xstiu6VBwj267oo=;
        b=taJjpvMW/1Pmg/CpzwUxUG18Atxn4Xs6HkAa6CbeYl3mDAQcPmieSw7+uqUfsbHoSR
         cTG1+qvnDQxlFKvTzzBCb3bAC/GGWohWspNOVwXEOnj/1wZ9PFwKfy0F43GW0q2Do6qj
         2FJNYHf5/hrDejwIvitEK7bzPwTSKB7aBGi1DA0AkReA3j5zZ9QWk5IO/ekyEtVBLDyN
         Rn6TkwqoABGRYzlnsyI+2f2wK/ZIK9UbvhMFD1q/VbCZKCxQATdfUW26mPrME3eq6FST
         OR7+/L7vNxCqB+YQPCaFcGqbeVqf+gPM9MSy/j8BInElztCAO5dZiyNDQhxZjHc1YDka
         jnow==
X-Forwarded-Encrypted: i=1; AJvYcCUrCngp9DEwpzeyDugmmMy5PGnJL9agHPms9bl3bP30pmNcttVze13gEK9UY7h6qR+kbIlwhFhlRLhO9Bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFBxKumI/ayIS6ODimvXyWsORv8Xh3rVJNIW0H/QOwbtGrQ3pF
	4y2YQVBkaQJERM4jPQ+pulKhgkE39lEdWrQfylLJuGY4DPaFLOsvDTxwTHSNn392sBwT2cpVMBp
	S1zW4hVQiRCa6kMWT9EFycqhf1Zol5STxowiDGsOHMx1xpnImDcD7pdW8G5BuoYRnRwc=
X-Gm-Gg: ASbGncteS0pUtOkiiKXuBrAB/XPs49SbAAZX+EHiK0HvyOW9u2kpFr1gaoLb12HahW2
	a2sVxXHPw7XmmuPvRWrdewG1EQxEK608XE8/wW9J2XyYgINaMxfqUl7+1A8kaBlF61fPhCyJQnS
	XIiRqYPU2UGIVJF+cgut+0YMRPE4fp5FeRqAa+9jgZSOqpqERe9IhZUF2FuWup7xw8PQgn0aUJj
	nXnyPnvcjmUtFThHwXOhgNMb01nFcZkuJVN/1RGVC2TL2qFJ8vJ1Sig2HOeG0OyIWlgeoYPnT8X
	nZH14SZdFEbBZTHuE7W3ae3qC89lsaGI
X-Received: by 2002:a17:903:166b:b0:234:b123:b4ff with SMTP id d9443c01a7336-237d9870a0amr41976055ad.21.1750434348475;
        Fri, 20 Jun 2025 08:45:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3uiV9mVqMw9I/3jinpD0YtzGr6J2SplRLMbVB/rccnB3N+Yx+1W+hkGE50i19U8Yzi4Uw5g==
X-Received: by 2002:a17:903:166b:b0:234:b123:b4ff with SMTP id d9443c01a7336-237d9870a0amr41975625ad.21.1750434348053;
        Fri, 20 Jun 2025 08:45:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8640dc6sm20800765ad.146.2025.06.20.08.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 08:45:47 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/2] drm/gpuvm: Add locking helpers
Date: Fri, 20 Jun 2025 08:45:36 -0700
Message-ID: <20250620154537.89514-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620154537.89514-1-robin.clark@oss.qualcomm.com>
References: <20250620154537.89514-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: S9RbULr1PzzRSTSt1I0u0vKnXarS2BLU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMiBTYWx0ZWRfXwbDXbIpW4oPO
 QAR3AWHoyf9+SiQOETWuY5COg3/GwoG3K+N6fU/pGwqp9Gk++1/sHDv3EMEh1gXlNyVVkwggnEJ
 c97ZziKNHYIto8/N3DEYXkaEF1Rw1beI5T9mj1QgTDYvaGJfyXFeZ+bqa3xmht6vylVR/TIsTUY
 WFtBtSEeOUQepUo1QPP8jjqfVYd7wpCK7nnZL++K0t12rNauUDSXKIYP5ghB5rXaXq5+/zWl81q
 xVL2Xhpob0CMvcYb9NxqECHoo5wRk8LUJKes0amtvb6eNgRs7DcoxCvDRNAuFf7bSZ53JWPMWG8
 3atphe/htvIiMBqO4FxEpkd0IW8BG4/qMz85YPm0nYYFT1TCuH3tAAAe90CAd9tiNhPQmWSaVhv
 Z/lm6A3bOVjq6RfaAh6avREHjNYYQ6j3pCWUBHkvdxWoSNJQmV/n0dxg5env5bv/Ya9snA97
X-Proofpoint-ORIG-GUID: S9RbULr1PzzRSTSt1I0u0vKnXarS2BLU
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=6855822d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=gXmLzIc8hE4PcKHQkQgA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200112

For UNMAP/REMAP steps we could be needing to lock objects that are not
explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
VAs.  These helpers handle locking/preparing the needed objects.

Note that these functions do not strictly require the VM changes to be
applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
call result in a differing sequence of steps when the VM changes are
actually applied, it will be the same set of GEM objects involved, so
the locking is still correct.

v2: Rename to drm_gpuvm_sm_*_exec_locked() [Danilo]
v3: Expand comments to show expected usage, and explain how the usage
    is safe in the case of overlapping driver VM_BIND ops.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 126 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_gpuvm.h     |   8 +++
 2 files changed, 134 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 0ca717130541..a811471b888e 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2390,6 +2390,132 @@ drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap);
 
+static int
+drm_gpuva_sm_step_lock(struct drm_gpuva_op *op, void *priv)
+{
+	struct drm_exec *exec = priv;
+
+	switch (op->op) {
+	case DRM_GPUVA_OP_REMAP:
+		if (op->remap.unmap->va->gem.obj)
+			return drm_exec_lock_obj(exec, op->remap.unmap->va->gem.obj);
+		return 0;
+	case DRM_GPUVA_OP_UNMAP:
+		if (op->unmap.va->gem.obj)
+			return drm_exec_lock_obj(exec, op->unmap.va->gem.obj);
+		return 0;
+	default:
+		return 0;
+	}
+}
+
+static const struct drm_gpuvm_ops lock_ops = {
+	.sm_step_map = drm_gpuva_sm_step_lock,
+	.sm_step_remap = drm_gpuva_sm_step_lock,
+	.sm_step_unmap = drm_gpuva_sm_step_lock,
+};
+
+/**
+ * drm_gpuvm_sm_map_exec_lock() - locks the objects touched by a drm_gpuvm_sm_map()
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @exec: the &drm_exec locking context
+ * @num_fences: for newly mapped objects, the # of fences to reserve
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ * @req_obj: the &drm_gem_object to map
+ * @req_offset: the offset within the &drm_gem_object
+ *
+ * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
+ * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
+ * will be newly mapped.
+ *
+ * The expected usage is:
+ *
+ *    vm_bind {
+ *        struct drm_exec exec;
+ *
+ *        // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is recommended:
+ *        drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_WAIT, 0);
+ *
+ *        drm_exec_until_all_locked (&exec) {
+ *            for_each_vm_bind_operation {
+ *                switch (op->op) {
+ *                case DRIVER_OP_UNMAP:
+ *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec, op->addr, op->range);
+ *                    break;
+ *                case DRIVER_OP_MAP:
+ *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences,
+ *                                                     op->addr, op->range,
+ *                                                     obj, op->obj_offset);
+ *                    break;
+ *                }
+ *
+ *                drm_exec_retry_on_contention(&exec);
+ *                if (ret)
+ *                    return ret;
+ *            }
+ *        }
+ *    }
+ *
+ * This enables all locking to be performed before the driver begins modifying
+ * the VM.  This is safe to do in the case of overlapping DRIVER_VM_BIND_OPs,
+ * where an earlier op can alter the sequence of steps generated for a later
+ * op, because the later altered step will involve the same GEM object(s)
+ * already seen in the earlier locking step.  For example:
+ *
+ * 1) An earlier driver DRIVER_OP_UNMAP op removes the need for a
+ *    DRM_GPUVA_OP_REMAP/UNMAP step.  This is safe because we've already
+ *    locked the GEM object in the earlier DRIVER_OP_UNMAP op.
+ *
+ * 2) An earlier DRIVER_OP_MAP op overlaps with a later DRIVER_OP_MAP/UNMAP
+ *    op, introducing a DRM_GPUVA_OP_REMAP/UNMAP that wouldn't have been
+ *    required without the earlier DRIVER_OP_MAP.  This is safe because we've
+ *    already locked the GEM object in the earlier DRIVER_OP_MAP step.
+ *
+ * Returns: 0 on success or a negative error codec
+ */
+int
+drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
+			   struct drm_exec *exec, unsigned int num_fences,
+			   u64 req_addr, u64 req_range,
+			   struct drm_gem_object *req_obj, u64 req_offset)
+{
+	if (req_obj) {
+		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
+		if (ret)
+			return ret;
+	}
+
+	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
+				  req_addr, req_range,
+				  req_obj, req_offset);
+
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_exec_lock);
+
+/**
+ * drm_gpuvm_sm_unmap_exec_lock() - locks the objects touched by drm_gpuvm_sm_unmap()
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @exec: the &drm_exec locking context
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ *
+ * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
+ * remapped by drm_gpuvm_sm_unmap().
+ *
+ * See drm_gpuvm_sm_map_exec_lock() for expected usage.
+ *
+ * Returns: 0 on success or a negative error code
+ */
+int
+drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+			     u64 req_addr, u64 req_range)
+{
+	return __drm_gpuvm_sm_unmap(gpuvm, &lock_ops, exec,
+				    req_addr, req_range);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap_exec_lock);
+
 static struct drm_gpuva_op *
 gpuva_op_alloc(struct drm_gpuvm *gpuvm)
 {
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2a9629377633..274532facfd6 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1211,6 +1211,14 @@ int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 		       u64 addr, u64 range);
 
+int drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
+			  struct drm_exec *exec, unsigned int num_fences,
+			  u64 req_addr, u64 req_range,
+			  struct drm_gem_object *obj, u64 offset);
+
+int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+				 u64 req_addr, u64 req_range);
+
 void drm_gpuva_map(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va,
 		   struct drm_gpuva_op_map *op);
-- 
2.49.0

