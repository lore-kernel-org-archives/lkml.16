Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3EE23F419
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206085; cv=none; b=cofLkpcSe3QzGeN0PuYqSOBd+P7kVs99o7usI/pndN6dkpYS1eD4wJ1zAvGccQYHHMe1ulKIHfnop4rV0xyiNi+AFnTyoOzpJup90Lu9HR576KiEq1DKxpm+T+NxeDhvW+FUJisocplj0k+G9Byhp4z6qMQLRajEWwBark+zuNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206085; c=relaxed/simple;
	bh=B/MJJNslJOsQHJswCv8VSXBdVcsWoC/DDELjr3YL7Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EESlPkAU43aL9fQhdrAQ5Ivn8D6Gt9lvp24mRBfpOJyBWBNzMrO/E+RJGtjFlLIh+pa14LrEFoCNzAg8AeH1KxmuqzgG08zghFf4bCMYrW2GrBGhTgt8irBfKES9kc80S073R6qnenXdTmf0syrCsNsR5+WFb1QvLnAddK24vGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e3WXG8rQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3WXG8rQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDrCgZ004924
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wKngwCavAFH
	eJEVVeeWKWIsmvkttEuyPvRiuEbDcy3U=; b=e3WXG8rQ6vHuJOqD6VGdpzNnBbX
	PUBJy/yVEcAa5UG18CIGIWSs1yGDkldBONwQjE1deVxapBFN1T6q/SlheZqziWPs
	5Tx32azGmi13Qd8CtDjfEujKkelZvouXKJSj7YIDhgohch0uX2KjOWbhD9h6CEX1
	lZB2IwbgkoJ65QtLXd4FwYjt/evKDDpikKmJRxEEq7VGRNJFc+ZJe0oJX0UYaMT+
	76rZiPYJ4dfAwmD9b4yAqyAPMmRVrsRej2AeD28ApyXSedTG2L6CoRmlajDSDeTU
	J+xhkFB1+6JwZe2pSJ8C/a2PniwfETZWjYvM7iivaZevT2AKzs9SdaDOJuw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm284d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-313d6d671ffso3061069a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206080; x=1751810880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKngwCavAFHeJEVVeeWKWIsmvkttEuyPvRiuEbDcy3U=;
        b=q/AoQQUFJrP+uxKAUlfE9JPLWR4r2OhRJez6iQSfXB+l9TKdXkSX775py+BJLcpr/U
         j1Lho1qqTyIpM4K3O4sXmBPs0Wmk5Lvh+EE/kYZYD5urCOPnPTQ/cFXh3x2N+WyNEYlh
         jMEwcIu7BaMeSRTepIHsViVsdt/fcIDNPHtSLxuLChloexO9TBH8+7uqNoFByQ+odWDf
         uYXRtyvNFgrn5r7VuoRKVHidtBwpsNWxnpk3tdV2CZ+rVwLxptFWQVrxkEyfVjxlXoz2
         s3H94sNqwXY8a24TOpk3HaHaFs0rPs63079ILpcsOo37+aYoOolV7WGTawBxP64g58QJ
         Ij5A==
X-Forwarded-Encrypted: i=1; AJvYcCUkV1Wf3DNk8oy9pdRK7xa7arGwW97/gchYRVUsUot0edsUhVruYMiffsJEUMArZE7qFDjkWrIprAP8vis=@vger.kernel.org
X-Gm-Message-State: AOJu0YymwCUr0mng12bYC42A9n2oELAhEcQTz2K+38CFBysILuG+YqU5
	ViiizPSbkiRpQk2/xWKT/Zv60KJVknFg4+q72xgzY+v47M/lrw8jF4q42o/j2nM3W0kl+JQbcT/
	99+FV3a+NrnaJOyoe4hfsiGsBr6Lb5r4MDsXszetEmRCWdL4i6uBhiHA5qW0cXBw4ntc=
X-Gm-Gg: ASbGncvrwOCRPHJY1KeQcAlIlkI+POOb57WDVtGkzkM8JDYX87zIK0ia8/XHCKQuhlM
	H4dKEg1qnkCnma5R9IEjN4pTdtgsBFfP+srcz0H086WBW3FA5LAY8t8j9NGcR+aQH5xpmF+WRDj
	hE3p+6KIFJmqssM1nN7TlAkOsAP76JcnjZM4T5UpEZCXuo0wDtvevkkQbfIKtC2G5H9sTB6H9y0
	XFbFj1Y/g7iYb0ruTWN5Z9eayj3ta3wUnYjSQZE1FY3bBnxyJVOj7zXLncr6zEUsLY+i1e14/c8
	Pc3myt/1wOO6VqbnCjkMN5wda3GK/Su6
X-Received: by 2002:a17:90b:1844:b0:311:d258:3473 with SMTP id 98e67ed59e1d1-318c8ed854fmr13825615a91.13.1751206080065;
        Sun, 29 Jun 2025 07:08:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2yCfAWZdhnM43W+FQAK7Ei13wp2HdXGViln7XgoM6zEbL0poVm6fbDuQVtD+plTe3hIuSDw==
X-Received: by 2002:a17:90b:1844:b0:311:d258:3473 with SMTP id 98e67ed59e1d1-318c8ed854fmr13825561a91.13.1751206079616;
        Sun, 29 Jun 2025 07:07:59 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5382f02sm11175097a91.1.2025.06.29.07.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:59 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 27/42] drm/msm: Crashdump support for sparse
Date: Sun, 29 Jun 2025 07:03:30 -0700
Message-ID: <20250629140537.30850-28-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=686148c1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MUnOxqT-vkRKCsmERf0A:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 9-M9sE7UDEVViJ4B5JnQO7MHCVtAz_Nx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX0PjbWkYznPsm
 Zs072CuZGIK6RUvxfYirf5RYJAVSozdPqhLAvkoNT0sffdinVGc1Fk+r5cfe6vU2rN4Hlta+xxa
 tVDEtrLEXkMkk3iTXk8jwOxpDpYLLYMlzXA0NwyXAi9KLPaxSHHL3k9Yks1csAS+9QwDW9S4Awt
 GuXe1hmHxXl0tRZgLJGYYtFgLZ0h/0ozvMwxGfU+Uak4iTMfE5qxQvTAIWwqT2Vr8Bq/SLMDdRy
 IkU272/N8THfKIAMqyAuieCQYkGFwXMvt+IOf4YmSUeWduvMuXIXo7DMnpQ6IIqASFslIev1AQ4
 Kl7Qs43zIHEzW0QURUjPq6M6XkwutPVKnJq0d0gd3L7hQ/4tfnUUvQQr9mlBtGx54Q/OcB3gSZ2
 uF4xrlusRueV70TAZaUtQQ2BU6Tp8hQ70OJi0r0PAv+yJW0qPsoH37BwIFlmdRrgHJV1Nh3D
X-Proofpoint-GUID: 9-M9sE7UDEVViJ4B5JnQO7MHCVtAz_Nx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119

From: Rob Clark <robdclark@chromium.org>

In this case, we need to iterate the VMAs looking for ones with
MSM_VMA_DUMP flag.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 96 ++++++++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0a9d5ecbef7b..ccd9ebfc5c7c 100644
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
 		struct msm_gem_submit *submit, struct msm_gpu_fault_info *fault_info,
 		char *comm, char *cmd)
@@ -281,30 +342,17 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	if (fault_info)
 		state->fault_info = *fault_info;
 
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
2.50.0

