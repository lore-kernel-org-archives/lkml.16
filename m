Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BD92853F3
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148387; cv=none; b=iJaCnNl8q2bk7CC2IYeGDq3dOUlUBAT3YQQ03VrIji7vdXuLoPOuN3qwN7W/SxWr8Va9dq44cq6y//k50cFE14ZzeIpzLBp0E1Dfjy/FfkDBmCnsWjh89CmRbRyy+WIYQKRLzoxmnROHILOfwUYGLLtkVVNLWnngGYzC9MccIS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148387; c=relaxed/simple;
	bh=cVRNX2A6ELOpK0RfBGNzCk+LFIQL5ZAU1DSg6RQcvzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uu9dllUHo19FGUq5ObAdClnFDlaqDDTV0UfvyXGC7qsphaoWFlJTLgQJLeKwlLTiq8ER//ax7ss4l0d8IPdAp/a+zojk7jDNDSGVn0HjvRtGcOS8Mob4I5XIgygeRwmayu3Q8iL8vDTB6/+XSCcvkWfGGeM+uYw+wKkNjxnEZ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UC4FJCH5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UC4FJCH5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HIVAh013476
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F6qh8d6fUyE
	8PFPWr8kAxkQ8qVtIka0LBkE1NoV8MqA=; b=UC4FJCH5X1JLCxB5ylfxR7L8laL
	9MqIhJsSIs3QAhPEEhv1Ikih6CoaxRVdPGUFvnCgbfSSMa8s5xTTUZEqg94X3QZp
	y9n0luRXoqq8kjh6UI4M2yXyWpINJkJZQX0hP/A8+mFwRYRwpZ9mjqV9lMXaTwGt
	+mQ6pWjwAu04mrjCQ4tUSckZ5CIoWORh7LjUR100dorIuMDxXXoMsAiUDtAI6t9l
	FWMq0BjxWCK9uz3wO94yrSvlLcE+lJ4Zne8ByBpQzh1bY1VrLb9iVBz//IiTIvw5
	dMIilNjwl/mAb0HFDexazbq9pzTLUfeeAmbmfIwg3RlMSczgOQYm5zzx4LA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nt9v7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:33:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2358de17665so12421175ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148383; x=1749753183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6qh8d6fUyE8PFPWr8kAxkQ8qVtIka0LBkE1NoV8MqA=;
        b=tlkOJD+LJhTawfCvMoZq7sJAlaJUvD8dlB1REFpFh2xYAG1UUPthAc293F4b0lwg9U
         wuZEHX6oEaf6A+KsVE+AjUW5WiYs0XKmfXY3H9pJNh7Prapzk+hylH7kWHK3bbBFPftC
         XvENGHLARNk1IJsErqLJJS/LC7iDbhH9DED5Gy5vjsThSHMzaNIkbNTjZbvfaMqbHZ24
         7iKfguLD/S9nlvFxs6/T9yuQEfxDo3CY0cbeBCZME3n9nOnIAZy2SrA1PPxoGivHhMLm
         llKlo75yM90tsWwLS2k10o3y4ZKoXn9JRPf/DjWWchIETqAMt3vogQKpr4PWWRa5yauy
         0qaw==
X-Forwarded-Encrypted: i=1; AJvYcCXep0FVjQ/eBeD0HoxT8cVVBJtUc9Qp/74mwV9EDNO0STYMxZMtUi3vczpTjXlz1UuS/0MBEyIHuAxBRiU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7oAavg6XkQlnQbXj+q1C++p91uq8/I8i3if6yG3Ar8hYfCIOK
	4pbZpeaY6UTHBfHjdx6S2wn63WCeTIAdvI2XJZESran2pd6US5aPSP9M0SOtaM8BUJEB6hriNIk
	BHegcu67R29mb3GjMHjHhEoangvL+4vLSmCfrGQm61i2eNOoaDiXydl6BoZbMhUgukqg=
X-Gm-Gg: ASbGncsgGWI8hwIGw5EopxUjQZ6iHrFNNZUu16YAouYQCgRpJqaYcSaDBe3fAokbC7l
	IlM7pzk4ofqIFWnQ4Yg6/ovZVioeDRmHWdDiQaaazMkRigilo/k25ZD162gj46Mm5+XcNHvnBDK
	JZIyfd3NuRf244ZpxDuTtL62SGT9CPTIH1f/GjGlX1V7ud8ZM+q0UjXcdCXzk97YtvZgdZE2XtO
	70CMAz5xPpZcFzRhYloabLq1UhyKWCnvgY5C26+iU6cSXpjzLCN+YIsRbrcmNpsGIQauriNios8
	f2zJxaa8OkodzMByGsNJRA==
X-Received: by 2002:a17:902:db10:b0:235:ef67:b5a0 with SMTP id d9443c01a7336-23601d977c9mr5811075ad.36.1749148383283;
        Thu, 05 Jun 2025 11:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXsjrpMtJeaeFHHJbJYs5K+E0Ts7FRZDqdRwAsfHwOl9dnEOZ4Y9cggfPiVerZSYeeQaSUqw==
X-Received: by 2002:a17:902:db10:b0:235:ef67:b5a0 with SMTP id d9443c01a7336-23601d977c9mr5810695ad.36.1749148382861;
        Thu, 05 Jun 2025 11:33:02 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc8863sm122351415ad.19.2025.06.05.11.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:02 -0700 (PDT)
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
Subject: [PATCH v6 25/40] drm/msm: Crashdump support for sparse
Date: Thu,  5 Jun 2025 11:29:10 -0700
Message-ID: <20250605183111.163594-26-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: kyW9iCYuGYAvYrH189tAPWHqUYvl9-fO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX86kiUwM/OgrD
 JU9bD/mN5NqgviJWs99Mdm3g25pihX0egYbmJPxQYYOgbeRBfYd5KOGFOdiwgrD26u5YvVb+fPZ
 xwCq/F4/HfZEGRWyKGsWWT807K9gB/vw9vJs7vB9eBsKXLvRQ6YPGpgI38YJf4nt8gdwUIoYlOd
 20dZ+EBLTq7p10YJswh0M5CG2FmU0fZAU5OUXj/0lMvwBsf024ekfI3Br5/7ElZ40HTcb3o2Cid
 qz3GLUmDfYtkEQdf5fQh95Z8k7KvJ0Ql85c+DEputzQbA7d/B4fm2y3hPXotqSVOD4Ggo9f/Oxd
 07gvt6oREEcVc/Bcv7El+9/nmqEs67+orCVwTNPOEfjxLzT586SjeolAxl8MT7Q+gV46dO7Wm6M
 NFz0VIBPFpaSDbxMvdUkv69/21dd7XzeCrj1FkChxZHjGxx83V/sVpZiPGkpo6+V8rIYF5oR
X-Proofpoint-ORIG-GUID: kyW9iCYuGYAvYrH189tAPWHqUYvl9-fO
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=6841e2e0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=MUnOxqT-vkRKCsmERf0A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

In this case, we need to iterate the VMAs looking for ones with
MSM_VMA_DUMP flag.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 96 ++++++++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 2eaca2a22de9..8178b6499478 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -241,9 +241,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 		if (!state_bo->data)
 			goto out;
 
-		msm_gem_lock(obj);
 		ptr = msm_gem_get_vaddr_active(obj);
-		msm_gem_unlock(obj);
 		if (IS_ERR(ptr)) {
 			kvfree(state_bo->data);
 			state_bo->data = NULL;
@@ -251,12 +249,75 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 		}
 
 		memcpy(state_bo->data, ptr + offset, size);
-		msm_gem_put_vaddr(obj);
+		msm_gem_put_vaddr_locked(obj);
 	}
 out:
 	state->nr_bos++;
 }
 
+static void crashstate_get_bos(struct msm_gpu_state *state, struct msm_gem_submit *submit)
+{
+	extern bool rd_full;
+
+	if (!submit)
+		return;
+
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		struct drm_exec exec;
+		struct drm_gpuva *vma;
+		unsigned cnt = 0;
+
+		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
+		drm_exec_until_all_locked(&exec) {
+			cnt = 0;
+
+			drm_exec_lock_obj(&exec, drm_gpuvm_resv_obj(submit->vm));
+			drm_exec_retry_on_contention(&exec);
+
+			drm_gpuvm_for_each_va (vma, submit->vm) {
+				if (!vma->gem.obj)
+					continue;
+
+				cnt++;
+				drm_exec_lock_obj(&exec, vma->gem.obj);
+				drm_exec_retry_on_contention(&exec);
+			}
+
+		}
+
+		drm_gpuvm_for_each_va (vma, submit->vm)
+			cnt++;
+
+		state->bos = kcalloc(cnt, sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
+
+		drm_gpuvm_for_each_va (vma, submit->vm) {
+			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
+
+			/* Skip MAP_NULL/PRR VMAs: */
+			if (!vma->gem.obj)
+				continue;
+
+			msm_gpu_crashstate_get_bo(state, vma->gem.obj, vma->va.addr,
+						  dump, vma->gem.offset, vma->va.range);
+		}
+
+		drm_exec_fini(&exec);
+	} else {
+		state->bos = kcalloc(submit->nr_bos,
+			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
+
+		for (int i = 0; state->bos && i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			msm_gem_lock(obj);
+			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
+						  dump, 0, obj->size);
+			msm_gem_unlock(obj);
+		}
+	}
+}
+
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		struct msm_gem_submit *submit, char *comm, char *cmd)
 {
@@ -279,30 +340,17 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	state->cmd = kstrdup(cmd, GFP_KERNEL);
 	state->fault_info = gpu->fault_info;
 
-	if (submit) {
-		extern bool rd_full;
-		int i;
-
-		if (state->fault_info.ttbr0) {
-			struct msm_gpu_fault_info *info = &state->fault_info;
-			struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
+	if (submit && state->fault_info.ttbr0) {
+		struct msm_gpu_fault_info *info = &state->fault_info;
+		struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
 
-			msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
-						   &info->asid);
-			msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
-		}
-
-		state->bos = kcalloc(submit->nr_bos,
-			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
-
-		for (i = 0; state->bos && i < submit->nr_bos; i++) {
-			struct drm_gem_object *obj = submit->bos[i].obj;
-			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
-			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
-						  dump, 0, obj->size);
-		}
+		msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
+					   &info->asid);
+		msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
 	}
 
+	crashstate_get_bos(state, submit);
+
 	/* Set the active crash state to be dumped on failure */
 	gpu->crashstate = state;
 
-- 
2.49.0

