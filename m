Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B4F2E0B6D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877961; cv=none; b=Mob8+7v3aZ2rlrmKd1Egr0oKxw9eYVb/Qd2dRBxavLH4FT6YlxIUAvUInbd855C3nbW3w41Vm2O4ENmWFGtf+qXmkxPHycIi6KSoMhuf5heOr/Ef/Wvo3kAzoYkjglDpTZogPn3jkS4zt1KVZBrSZHrEb2Pm4b7xyr9V4HsQGeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877961; c=relaxed/simple;
	bh=L8wpcxI5KXYprc9BeNWaB4wQshf9pNrtQh0ARD/map0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m28Tk6Z9XKZcM9uc0D/CbC6DmBwiLIn3vabgt4ZUppB1ENdxXnnKjc1kFbuuT5N8atBHXiJOYqM2TtOm2GhQf/7r9VpawWHrWv/tpDfOJPHmr2+aMLdSlzwBALkdUYf7uZgoxhyvEaM+hJwlNBHYilza/+p2NUU61fx7kTGGZ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCoEpAD7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCoEpAD7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBZXqF023070
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9I2+D+NGCoh
	icuIhMIGVY89TGnMrZSKG21yuS94HUEI=; b=dCoEpAD7aJ7BxHTVDUNEjGMohfp
	J3jVuQT0enTKUHmyPqu1xBDW3KzaPPhmtnVsusLfv1nYBSR2usAu7OS0llhxY8ZP
	NIcG29qAZlf/PYS/SezwjInMLqkVZ+VlJjtuuELy4vQTm+rB2ZlQerVQR5b+tO99
	eHNo0+8+MKDuT2wfceVmXJxbC6t2NHuig/ED0YB7aGeQzs5Pan0Ysc0m/eRtlE9z
	+02MtdTPTqYSYiPfkjm/bRv8uE552tFAFuv6kZa5mSYC9ezlFZg2xldZL+4NVZYO
	tdZaoN7EzANkV0itDnJmpPoVn+3DXd0Oqek5bI4RZU4uVVMLLlWHgjsjj4w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fapqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235e7550f7bso1591555ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877957; x=1751482757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9I2+D+NGCohicuIhMIGVY89TGnMrZSKG21yuS94HUEI=;
        b=HiRfw1LuJk842NGB9BsuuX2W1Ns9XRW+dlH5+YNy6w2uSEvZmbyKxNP0jS+Lye5GMx
         pFr5P6QkzTrae/MQCCotB2ulyEd3ms6g4LUR8lf3i5I2Bn9Mgj0eySSDgokcTicF9AG0
         R+eqxanM+khCopIjQ6p+7ULndnpV98MhxUorzeMARtxwJyo+IaqE2SKUZpZ/T1qNGrRm
         ZOqhe9Bt/RIW1y8DKUYbAhXE/YSasnjmg3Zc0z6X7WalAQZ4sDrzmf28PrdQf3rPob8C
         oUaunHogbNwKRJZkQ46qAwVfW3Z7hYW/we4UvXE8cBkuAIjAogWmLRtFbcOVXi5e74xm
         pbkg==
X-Forwarded-Encrypted: i=1; AJvYcCXnJQ3QmD2ikhmrcsoX50fxS8lAGD1m+ipxXXIa+UjGlqyxy0s2M6mm6OJ1nSiUpBt9HUBT5rbqajKY//8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYEfSKasGafb4NuKfrOBeEN9N8V/rxzq5J+k2u9M8thUf3I09P
	/0cQlgZRYWaiwBLNEOBEchirEdpi/gFZ897t23KEIqNxyUm8IlxJIbu+ri6FYKi2OmhVLBXJt0t
	82NHZNqAOyaJyuRU0leVCLPFDI6EkVGW4xerAfxc6YDVgxFU1D0LUhfPc3HKuFm42uvQ=
X-Gm-Gg: ASbGncsW7uW5MTnb0swg6ceXjEkgtO6ANiJ1HezZgnPyyP4qOS3vat6MD8CdrRUZDCQ
	trHP1xWGKXpuJvmp/vUQsktzy9rRpBSmB+Lv4bhFU+FcVWG2oS8f0/44OmuToy4wzTuA51Xfxel
	7suaNHdb3IGX857CKJRBnOyf3reTj7djtkCEvyU2lPwY6hk0V0wmpcq9L/jgIsNnPvT7u1RtyLU
	NhZzwWEFr26T4Y1PltPYLyuzUI0rYpIJ1VPr4cXIy1fQXQQx0y53sSbG4tuOlDOr6Qc9wjJ6fQt
	JuCaYhQQ2L+WVtv5s2QlPQlx6I1AT5KR
X-Received: by 2002:a17:902:ea06:b0:22f:c19c:810c with SMTP id d9443c01a7336-23824385a8bmr77135445ad.51.1750877957209;
        Wed, 25 Jun 2025 11:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDgIa12KYBHmawAQQa/WWpZRau96PEwqSOKWlZcQvJvcYsT19my7oKMt6QL6vRlqMLYfN0Lw==
X-Received: by 2002:a17:902:ea06:b0:22f:c19c:810c with SMTP id d9443c01a7336-23824385a8bmr77134965ad.51.1750877956657;
        Wed, 25 Jun 2025 11:59:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83932dfsm140491125ad.30.2025.06.25.11.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:16 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 36/42] drm/msm: Add VM logging for VM_BIND updates
Date: Wed, 25 Jun 2025 11:47:29 -0700
Message-ID: <20250625184918.124608-37-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MiBTYWx0ZWRfX92HOP/0DPQg1
 5db0C9CcYZz1iH85Y6/DUwyhexextfPsl3rru2d9YoXhqKFpzbjgEEHUvbcdH3gLPwZtZn1YPyE
 WI4f3+xft4SKNG72EhqpnpTehc7Khn8dpN7vwBpm4D0W5TCQJctnjqx2EhkRKbZaqd3hjMT1JuA
 tmMahYljGhm2Csh6x2Ol6STpZjxXPWNqUbhYSP/xXuGu9UFpFpIRh90T6G49Toy9L0QYwvP5GmS
 wHlqLcCDubpHDPwBHWtPt5h3x+Au/wvlDL0D6iZjmRjxd7IiJR5Tx2rKgp0JF17FcFHulFueb5T
 V/s5HaseZkKbnAYKPSHIRpKeJgTihs8B9SYaSEaZUVrvJVicSjRxPcq6qbPjAtHE5TKzPz8hkLW
 9EV9ktQOohcG4TN7/1hrJ930OA6N6Ej7a4vfI2gunQ+D4nqc/KLDE1wISOddNpHiJ09U8brV
X-Proofpoint-ORIG-GUID: 788mQdjjhKpzJa8plgfGwyQ34mrqUZvV
X-Proofpoint-GUID: 788mQdjjhKpzJa8plgfGwyQ34mrqUZvV
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685c4706 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=zDHoyB4d8wgZrPPXejgA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250142

From: Rob Clark <robdclark@chromium.org>

When userspace opts in to VM_BIND, the submit no longer holds references
keeping the VMA alive.  This makes it difficult to distinguish between
UMD/KMD/app bugs.  So add a debug option for logging the most recent VM
updates and capturing these in GPU devcoredumps.

The submitqueue id is also captured, a value of zero means the operation
did not go via a submitqueue (ie. comes from msm_gem_vm_close() tearing
down the remaining mappings when the device file is closed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  11 +++
 drivers/gpu/drm/msm/msm_gem.h           |  24 +++++
 drivers/gpu/drm/msm/msm_gem_vma.c       | 124 ++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c           |  52 +++++++++-
 drivers/gpu/drm/msm/msm_gpu.h           |   4 +
 5 files changed, 202 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index efe03f3f42ba..12b42ae2688c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -837,6 +837,7 @@ void adreno_gpu_state_destroy(struct msm_gpu_state *state)
 	for (i = 0; state->bos && i < state->nr_bos; i++)
 		kvfree(state->bos[i].data);
 
+	kfree(state->vm_logs);
 	kfree(state->bos);
 	kfree(state->comm);
 	kfree(state->cmd);
@@ -977,6 +978,16 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 			   info->ptes[0], info->ptes[1], info->ptes[2], info->ptes[3]);
 	}
 
+	if (state->vm_logs) {
+		drm_puts(p, "vm-log:\n");
+		for (i = 0; i < state->nr_vm_logs; i++) {
+			struct msm_gem_vm_log_entry *e = &state->vm_logs[i];
+			drm_printf(p, "  - %s:%d: 0x%016llx-0x%016llx\n",
+				   e->op, e->queue_id, e->iova,
+				   e->iova + e->range);
+		}
+	}
+
 	drm_printf(p, "rbbm-status: 0x%08x\n", state->rbbm_status);
 
 	drm_puts(p, "ringbuffer:\n");
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index d062722942b5..efbf58594c08 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -24,6 +24,20 @@
 #define MSM_BO_STOLEN        0x10000000    /* try to use stolen/splash memory */
 #define MSM_BO_MAP_PRIV      0x20000000    /* use IOMMU_PRIV when mapping */
 
+/**
+ * struct msm_gem_vm_log_entry - An entry in the VM log
+ *
+ * For userspace managed VMs, a log of recent VM updates is tracked and
+ * captured in GPU devcore dumps, to aid debugging issues caused by (for
+ * example) incorrectly synchronized VM updates
+ */
+struct msm_gem_vm_log_entry {
+	const char *op;
+	uint64_t iova;
+	uint64_t range;
+	int queue_id;
+};
+
 /**
  * struct msm_gem_vm - VM object
  *
@@ -85,6 +99,15 @@ struct msm_gem_vm {
 	/** @last_fence: Fence for last pending work scheduled on the VM */
 	struct dma_fence *last_fence;
 
+	/** @log: A log of recent VM updates */
+	struct msm_gem_vm_log_entry *log;
+
+	/** @log_shift: length of @log is (1 << @log_shift) */
+	uint32_t log_shift;
+
+	/** @log_idx: index of next @log entry to write */
+	uint32_t log_idx;
+
 	/** @faults: the number of GPU hangs associated with this address space */
 	int faults;
 
@@ -115,6 +138,7 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		  u64 va_start, u64 va_size, bool managed);
 
 void msm_gem_vm_close(struct drm_gpuvm *gpuvm);
+void msm_gem_vm_unusable(struct drm_gpuvm *gpuvm);
 
 struct msm_fence_context;
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 5d4b7e3e9d2c..729027245986 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -17,6 +17,10 @@
 
 #define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, ##__VA_ARGS__)
 
+static uint vm_log_shift = 0;
+MODULE_PARM_DESC(vm_log_shift, "Length of VM op log");
+module_param_named(vm_log_shift, vm_log_shift, uint, 0600);
+
 /**
  * struct msm_vm_map_op - create new pgtable mapping
  */
@@ -31,6 +35,13 @@ struct msm_vm_map_op {
 	struct sg_table *sgt;
 	/** @prot: the mapping protection flags */
 	int prot;
+
+	/**
+	 * @queue_id: The id of the submitqueue the operation is performed
+	 * on, or zero for (in particular) UNMAP ops triggered outside of
+	 * a submitqueue (ie. process cleanup)
+	 */
+	int queue_id;
 };
 
 /**
@@ -41,6 +52,13 @@ struct msm_vm_unmap_op {
 	uint64_t iova;
 	/** @range: size of region to unmap */
 	uint64_t range;
+
+	/**
+	 * @queue_id: The id of the submitqueue the operation is performed
+	 * on, or zero for (in particular) UNMAP ops triggered outside of
+	 * a submitqueue (ie. process cleanup)
+	 */
+	int queue_id;
 };
 
 /**
@@ -144,16 +162,87 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 		vm->mmu->funcs->destroy(vm->mmu);
 	dma_fence_put(vm->last_fence);
 	put_pid(vm->pid);
+	kfree(vm->log);
 	kfree(vm);
 }
 
+/**
+ * msm_gem_vm_unusable() - Mark a VM as unusable
+ * @vm: the VM to mark unusable
+ */
+void
+msm_gem_vm_unusable(struct drm_gpuvm *gpuvm)
+{
+	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
+	uint32_t vm_log_len = (1 << vm->log_shift);
+	uint32_t vm_log_mask = vm_log_len - 1;
+	uint32_t nr_vm_logs;
+	int first;
+
+	vm->unusable = true;
+
+	/* Bail if no log, or empty log: */
+	if (!vm->log || !vm->log[0].op)
+		return;
+
+	mutex_lock(&vm->mmu_lock);
+
+	/*
+	 * log_idx is the next entry to overwrite, meaning it is the oldest, or
+	 * first, entry (other than the special case handled below where the
+	 * log hasn't wrapped around yet)
+	 */
+	first = vm->log_idx;
+
+	if (!vm->log[first].op) {
+		/*
+		 * If the next log entry has not been written yet, then only
+		 * entries 0 to idx-1 are valid (ie. we haven't wrapped around
+		 * yet)
+		 */
+		nr_vm_logs = MAX(0, first - 1);
+		first = 0;
+	} else {
+		nr_vm_logs = vm_log_len;
+	}
+
+	pr_err("vm-log:\n");
+	for (int i = 0; i < nr_vm_logs; i++) {
+		int idx = (i + first) & vm_log_mask;
+		struct msm_gem_vm_log_entry *e = &vm->log[idx];
+		pr_err("  - %s:%d: 0x%016llx-0x%016llx\n",
+		       e->op, e->queue_id, e->iova,
+		       e->iova + e->range);
+	}
+
+	mutex_unlock(&vm->mmu_lock);
+}
+
 static void
-vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
+vm_log(struct msm_gem_vm *vm, const char *op, uint64_t iova, uint64_t range, int queue_id)
 {
+	int idx;
+
 	if (!vm->managed)
 		lockdep_assert_held(&vm->mmu_lock);
 
-	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+	vm_dbg("%s:%p:%d: %016llx %016llx", op, vm, queue_id, iova, iova + range);
+
+	if (!vm->log)
+		return;
+
+	idx = vm->log_idx;
+	vm->log[idx].op = op;
+	vm->log[idx].iova = iova;
+	vm->log[idx].range = range;
+	vm->log[idx].queue_id = queue_id;
+	vm->log_idx = (vm->log_idx + 1) & ((1 << vm->log_shift) - 1);
+}
+
+static void
+vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
+{
+	vm_log(vm, "unmap", op->iova, op->range, op->queue_id);
 
 	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
 }
@@ -161,10 +250,7 @@ vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
 static int
 vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
 {
-	if (!vm->managed)
-		lockdep_assert_held(&vm->mmu_lock);
-
-	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+	vm_log(vm, "map", op->iova, op->range, op->queue_id);
 
 	return vm->mmu->funcs->map(vm->mmu, op->iova, op->sgt, op->offset,
 				   op->range, op->prot);
@@ -382,6 +468,7 @@ vma_from_op(struct op_arg *arg, struct drm_gpuva_op_map *op)
 static int
 msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *arg)
 {
+	struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
 	struct drm_gem_object *obj = op->map.gem.obj;
 	struct drm_gpuva *vma;
 	struct sg_table *sgt;
@@ -412,6 +499,7 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *arg)
 			.range = vma->va.range,
 			.offset = vma->gem.offset,
 			.prot = prot,
+			.queue_id = job->queue->id,
 		},
 		.obj = vma->gem.obj,
 	});
@@ -445,6 +533,7 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 			.unmap = {
 				.iova = unmap_start,
 				.range = unmap_range,
+				.queue_id = job->queue->id,
 			},
 			.obj = orig_vma->gem.obj,
 		});
@@ -506,6 +595,7 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 static int
 msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *arg)
 {
+	struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
 	struct drm_gpuva *vma = op->unmap.va;
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 
@@ -520,6 +610,7 @@ msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *arg)
 		.unmap = {
 			.iova = vma->va.addr,
 			.range = vma->va.range,
+			.queue_id = job->queue->id,
 		},
 		.obj = vma->gem.obj,
 	});
@@ -584,7 +675,7 @@ msm_vma_job_run(struct drm_sched_job *_job)
 	 * now the VM is in an undefined state.  Game over!
 	 */
 	if (ret)
-		vm->unusable = true;
+		msm_gem_vm_unusable(job->vm);
 
 	job_foreach_bo (obj, job) {
 		msm_gem_lock(obj);
@@ -695,6 +786,23 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
 	drm_mm_init(&vm->mm, va_start, va_size);
 
+	/*
+	 * We don't really need vm log for kernel managed VMs, as the kernel
+	 * is responsible for ensuring that GEM objs are mapped if they are
+	 * used by a submit.  Furthermore we piggyback on mmu_lock to serialize
+	 * access to the log.
+	 *
+	 * Limit the max log_shift to 8 to prevent userspace from asking us
+	 * for an unreasonable log size.
+	 */
+	if (!managed)
+		vm->log_shift = MIN(vm_log_shift, 8);
+
+	if (vm->log_shift) {
+		vm->log = kmalloc_array(1 << vm->log_shift, sizeof(vm->log[0]),
+					GFP_KERNEL | __GFP_ZERO);
+	}
+
 	return &vm->base;
 
 err_free_dummy:
@@ -1161,7 +1269,7 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
 			 * state the vm is in.  So throw up our hands!
 			 */
 			if (i > 0)
-				vm->unusable = true;
+				msm_gem_vm_unusable(job->vm);
 			return ret;
 		}
 	}
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 8178b6499478..e5896c084c8a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -259,9 +259,6 @@ static void crashstate_get_bos(struct msm_gpu_state *state, struct msm_gem_submi
 {
 	extern bool rd_full;
 
-	if (!submit)
-		return;
-
 	if (msm_context_is_vmbind(submit->queue->ctx)) {
 		struct drm_exec exec;
 		struct drm_gpuva *vma;
@@ -318,6 +315,48 @@ static void crashstate_get_bos(struct msm_gpu_state *state, struct msm_gem_submi
 	}
 }
 
+static void crashstate_get_vm_logs(struct msm_gpu_state *state, struct msm_gem_vm *vm)
+{
+	uint32_t vm_log_len = (1 << vm->log_shift);
+	uint32_t vm_log_mask = vm_log_len - 1;
+	int first;
+
+	/* Bail if no log, or empty log: */
+	if (!vm->log || !vm->log[0].op)
+		return;
+
+	mutex_lock(&vm->mmu_lock);
+
+	/*
+	 * log_idx is the next entry to overwrite, meaning it is the oldest, or
+	 * first, entry (other than the special case handled below where the
+	 * log hasn't wrapped around yet)
+	 */
+	first = vm->log_idx;
+
+	if (!vm->log[first].op) {
+		/*
+		 * If the next log entry has not been written yet, then only
+		 * entries 0 to idx-1 are valid (ie. we haven't wrapped around
+		 * yet)
+		 */
+		state->nr_vm_logs = MAX(0, first - 1);
+		first = 0;
+	} else {
+		state->nr_vm_logs = vm_log_len;
+	}
+
+	state->vm_logs = kmalloc_array(
+		state->nr_vm_logs, sizeof(vm->log[0]), GFP_KERNEL);
+	for (int i = 0; i < state->nr_vm_logs; i++) {
+		int idx = (i + first) & vm_log_mask;
+
+		state->vm_logs[i] = vm->log[idx];
+	}
+
+	mutex_unlock(&vm->mmu_lock);
+}
+
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		struct msm_gem_submit *submit, char *comm, char *cmd)
 {
@@ -349,7 +388,10 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
 	}
 
-	crashstate_get_bos(state, submit);
+	if (submit) {
+		crashstate_get_vm_logs(state, to_msm_vm(submit->vm));
+		crashstate_get_bos(state, submit);
+	}
 
 	/* Set the active crash state to be dumped on failure */
 	gpu->crashstate = state;
@@ -449,7 +491,7 @@ static void recover_worker(struct kthread_work *work)
 		 * VM_BIND)
 		 */
 		if (!vm->managed)
-			vm->unusable = true;
+			msm_gem_vm_unusable(submit->vm);
 	}
 
 	get_comm_cmdline(submit, &comm, &cmd);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 9cbf155ff222..31b83e9e3673 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -20,6 +20,7 @@
 #include "msm_gem.h"
 
 struct msm_gem_submit;
+struct msm_gem_vm_log_entry;
 struct msm_gpu_perfcntr;
 struct msm_gpu_state;
 struct msm_context;
@@ -609,6 +610,9 @@ struct msm_gpu_state {
 
 	struct msm_gpu_fault_info fault_info;
 
+	int nr_vm_logs;
+	struct msm_gem_vm_log_entry *vm_logs;
+
 	int nr_bos;
 	struct msm_gpu_state_bo *bos;
 };
-- 
2.49.0

