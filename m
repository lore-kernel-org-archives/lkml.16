Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D052F3659
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877946; cv=none; b=hhjOpxoWLH94PNEzdyUPjRR+iCaPy4TGfC6crUAUZvowNCYu44ad+WI5bEutLbbvxGIZ3Rp2/1Bq/h9rXD13Q0ReSa/nm6iocVJM+oADnM1hARR6BUXNeqWVfFfdUmY+RdRC9cvSAoWOCSCQvG6sg5Jid7vfjhQw1cAoBjVX21U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877946; c=relaxed/simple;
	bh=cVRNX2A6ELOpK0RfBGNzCk+LFIQL5ZAU1DSg6RQcvzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U26LSe34rFZj26imE9OCk838e1jfdUk3IGHnuebYlsHs9Amrgf/jD81DZoI0D9Kb5vucBc39cHgKJIT5OVOEHChZoTyOEAp6blFjAqAvlCzbGQ6BwJ1dLNbMv46GibioLO0fEsuEnMmr4CPyenoeGn98t/fNGtLQ+lH/SDl9USY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GysHBRol; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GysHBRol"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCZ0nH015714
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F6qh8d6fUyE
	8PFPWr8kAxkQ8qVtIka0LBkE1NoV8MqA=; b=GysHBRolCVL8iJJjgnL3i4JJ2C4
	r/PjE9IgO0DcDYOlwm5VGFd5z83ttKrBGTWcy76wrpYMlUyqjRmEuAWkub+MoL6H
	kP+M5glqyt2YoO6mRzHgxYikmRZ73856aNpOB+d9wLTY+BcvmazdZh3CJsLp9zOQ
	wPOOf/q28tsuNfiMNvgUylh4geO1zsITey1HNKkX+CkQsnBN0gVbn4IYxmeVun9s
	HIrY1zv8oRmKPTPZ8Rod/YqPF7bMQboKf1Wzau/cB84eQPKv+068bRptlD3P9Djk
	QSWDBL9F1ghhYoBawNLlVA3SPHXz4VjGqxKiypgkz5JakIzrJHv12oq6rtA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5t1qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748e1e474f8so341768b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877943; x=1751482743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6qh8d6fUyE8PFPWr8kAxkQ8qVtIka0LBkE1NoV8MqA=;
        b=mmckH8GFlYzU566ILntA5MfnxEjFMlqAS0ltgvvhH1/5ZjCIltKOz5pT5PAn4i5YLG
         n3pgxtkAOjxtAfTRS7DX+N5wQD/EE+KJdrUcS6lFB0eZkuGO7JsVsg5eliadodUa/zPK
         FaPlohdgT3dXtxin2p3n7/F9ns9JlOZmF9C30sw90OjMgGMbVw+DwbVtHhPmDpmU0R5Z
         XTzxy8WUEkkE0ZCfkye5TDJBhEhuDsDOmJirwINtHh9NwOIpZc0ovNT9NKEHO/+w4vfb
         6+lwg1bzD7MIqpt+7AgwRrbFAXGbyk+YhQCdZkUO2k9DMfMmy+UV7GL+7tXo2ECaG2O0
         tRtQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1ZoU0pQ0Dvj+b6w6/CnQfXdTJGs/LObsef6dJCegWuPYUy4y8XkYmPQLb7HQDRllhU2iqQN+TXSVS3VQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV0wp+YYQbdBRZxPdBMco5ndfxIgMTzTv0d87dlvMF1D8uTs8M
	Q7R0vguYrP/ITB6epbRGzKQq7RhCQo5VuLcEEkZhRlmLaKrceThST/9yIbiT36uyn1J/fyLlnzk
	Oq6wxnkv00UKZ2Ll7rgNmkn/r4HRDeWwZsFzg3EP4Qh9rXJrXW15O6Htwlhdkwe++8Bg=
X-Gm-Gg: ASbGnctmjvOlL1z3Xe677Ol0N0abPPG5nMC9Rp0gYpH/6FKftJnf45xGM4XDka/3VVF
	IcSX/W+ab5zHxtrNvKyBVxwA/zSrc3l4hUz5vZgWES/neOHvv4t9STvm8nivH8bb43LsYB2Fji/
	ItRIdjlsve2N0HWNZGwJ2eGMDg+qeP8sH+gNfsLUOzcqTBvqDo72HwJmYa6nwvArj6bkYZ3h3kM
	LqJWFg9OenST3O7M5lyAv95ZLB42BjdqcPuPB83Mbhj1VbzVKCWLOiTS2JJvxV7M9/2rfTHuzEh
	twoX2ANgmHaQ4bW+kiQK6j07PsNYKqOl
X-Received: by 2002:a05:6a00:2e03:b0:736:31cf:2590 with SMTP id d2e1a72fcca58-74ad45bb45bmr5615184b3a.16.1750877942968;
        Wed, 25 Jun 2025 11:59:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHg8vNYWkF6glZsGu/qF4tKCYvJINSQzai59ELYbebz2aZfun5XKFQM14/85G3r1zrV/TUgLA==
X-Received: by 2002:a05:6a00:2e03:b0:736:31cf:2590 with SMTP id d2e1a72fcca58-74ad45bb45bmr5615157b3a.16.1750877942543;
        Wed, 25 Jun 2025 11:59:02 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e08cfbsm5259906b3a.18.2025.06.25.11.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:02 -0700 (PDT)
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
Subject: [PATCH v7 27/42] drm/msm: Crashdump support for sparse
Date: Wed, 25 Jun 2025 11:47:20 -0700
Message-ID: <20250625184918.124608-28-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: 9DQXQSpKKr3pl6lIDDzkOQbTeKaE607m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXx+VLLC5XPbw0
 8voSg8dDCSxfFPhLfqU1d1km1J6Qo1xCYSb23NICBfTifqTY2y2W9hjVx/0LRSBiuIsNfgMv/t5
 4CdHva5UHMvMmikXhPeSan7uAmw+l4uG29S08zwYUqlG3Fkb1I8rimKxCS/AQxngPq5wn+nzBT8
 F61s5wr6rfOvmudzmnCaa4A6D1VgN3kPxkYOgOQtUCkfTuKyrAGkSv4La5b8e7yEU3soZDd5cQM
 Vagyld61t9xECCWapslJW8sz9p+3hkHkocTchogTwnnjW10XP4Qqx+iNQCcsbncgp2+cdy8mSNU
 I/7zzcapArmbSb7ORDMwVhMeARNlciU8AfqxGQVWxxTAYcofgDCBViZXONhV/ZcpzQSQvyJ/wye
 J9D7y6HTDy1yd3CItFIOt0qmlPfA6gpGlQJHwfBZQcgGfsObJKk9b0gcH5IU0wyYA5+gT2er
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685c46f7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=MUnOxqT-vkRKCsmERf0A:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 9DQXQSpKKr3pl6lIDDzkOQbTeKaE607m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

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

