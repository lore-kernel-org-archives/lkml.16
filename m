Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140A025B2FC
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228219; cv=none; b=YX8v+v45c5Oq58wSdSpe2JyfJ6ERRw8jm6sYKgGAJhEZJeP3fSZudYw7pJIm+vQ+zw6d6ralVsOT5zU029PE01jxzLkHfIt+iW7/nafTivs509Op/c9OU6WZcYQO5Djr5iTh6RNs3zvq1cqce5gy9cupm56+T4u8oO1ljBMC79g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228219; c=relaxed/simple;
	bh=B/MJJNslJOsQHJswCv8VSXBdVcsWoC/DDELjr3YL7Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d9A/Q4mDbT4VprYtaKhZKZwKdWnLAG6BkCi1WPcCIPkKE195GK5zePVLYvRL2N00WNShqIG2cJvqhUcAL4RVHaqFmM7pLAzY5gdgd2SQc+YnuosI6GkUerfo6Yn2tlCPBexNFCytuUqkL53YGNouSQQQDubbusIkicux/WCRdv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLAWhJFP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLAWhJFP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55THv4CA008985
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wKngwCavAFH
	eJEVVeeWKWIsmvkttEuyPvRiuEbDcy3U=; b=NLAWhJFPbq39BjypQRne8ydDAaM
	OolAh9mjryiU5IR4UO0JxAmwV0D6/5e0bkjZyAn4KbFUEBpTylJaCPQfzuVtn5pi
	oG82sdajtE6GsEAoWing/jw5mB0wt7984SDNjudPS1d0IlV2wMF6wq4xKQyt58DN
	6h71dEw34Er6vX41qI+u9uno4j9MvDUmTM+xI6ckWCO8MKbzlvEY48S4rR1l2PbP
	MVzhAhWYp/oGyXsWq1aVItSEctqXm/z5Xr5fThOb80h6CzH7ONP2hZe74tuue6xA
	TJjzAOHlDH1/UZn+ltJdl0GEedUwV749oaKtTamMawopr84fqDV/xlvYDLQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95htk70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-236725af87fso44131835ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228216; x=1751833016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKngwCavAFHeJEVVeeWKWIsmvkttEuyPvRiuEbDcy3U=;
        b=UO2f54bXAPv7Xtp9O4F0tLk0DfW8VNxUp8z2YIuSkd1TNP1jCcGPZWl+Nj7j1GG2Nm
         jRiDlAMAlRV3Xlv73uJ44CWpq+CHchuCXoskxzH8KMt7U3Sbw3xp57DCTV7E8c3A7H/9
         sgE/fvQOtXDSZpzdg955x56PLS7OoXKG32pQfkAz/JLhAZVGqAA7V+X9Ae1xHyDTbtWm
         WAc7yOVyxQEy23tbayI9i761uxkrVjlKLkDFTubD8SN3G5eMow73wmXLF3DG7lZlqsPb
         1SVRAGzboAVYR0GISY1t0aSmjWaZKwP3VzwV4eFq41G4M02SaPP6THVQmYEzo1HYWTVH
         ctCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYWc5KzMY1GWsRnrNMDXXMfD1pEJRL9JILJyB2eVvL8q+2lhdU3SVMbuOdjDJ2aiOmXtEBk1ffqwUmJk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGZLRJ9qfLYYYsBRIb/MQaCfsHHWVJMpuwTM5ZjnQOMG4tiaYp
	S53iXSB9KfLxMfngNBNUpi7G/aQFC7FtNqVQ16+kb5exwl44O035DRh8t9Qax5C3TYKAqAeSxRm
	SXPgmyTW9GXOQllnILItVojHbSo8zUdoX+KFQ4KukPgUPTnBT/3yfXuNP0HKbatvp1lw=
X-Gm-Gg: ASbGnct096QKKnPal2wyaw4y1KV66+cQsAlUZ0Gn3C1zTnbTYTmrJLxnyRgIVZLew8h
	ld9mgX5WFzB6RdKEhRc69we59PfOazrHGizSLFTcKxRx1WRjO8Dco3OVqGsuVp2mldDN8WN62uO
	4nrtTzs3Se+5vT9MTAk+Fo6ieYrwXrvbTk9y+VfcJt+90uWIyYl8E2wJeWHB8ja3fAgh2WvPcSz
	2p1yfQTHieV+fT82gjQilzfSjhGwm+exl6PiyMZrNDe4Jia2OsPTylnaIowWCcqslXhaCf7cLoo
	BQVHy5WFzIFi/EB8N7fJ9y1bpfHfrLpilg==
X-Received: by 2002:a17:902:e88e:b0:234:8a16:d62b with SMTP id d9443c01a7336-23ac40da316mr169235225ad.12.1751228216397;
        Sun, 29 Jun 2025 13:16:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaWGPydQV216i89tCogIBG6+vmTYkFs0wd5R8OzSvv9tHVI2ml64sOXsCCbBPTAcj30aV1kw==
X-Received: by 2002:a17:902:e88e:b0:234:8a16:d62b with SMTP id d9443c01a7336-23ac40da316mr169234945ad.12.1751228215987;
        Sun, 29 Jun 2025 13:16:55 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b833bsm67473705ad.180.2025.06.29.13.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:55 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 27/42] drm/msm: Crashdump support for sparse
Date: Sun, 29 Jun 2025 13:13:10 -0700
Message-ID: <20250629201530.25775-28-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfX6INxKLkdlycv
 LICUayI2cFGHd6liVvBieXVqSbeQ+Uv5mwOOrKXlHOdR9khX1ED0YG6lmYc9mqE6/ZYP9fvj/qf
 S54d/KVirIW6dn4WRgN3yHkd6aOM/CWszZIBm/YzWC2cUPjbzlwfRmHyvLavbux5EWs3pEku2tp
 tKqAG7MgnEXTfQ3gcpT4jnj73f1Lw5/kBN/ev8GlAf35Cok+7PreC5XxctXmpNCFV/xV3/neB/3
 TPsFBTr+4hCQopidnzmPGQvx/1tH50QbnlglM7E7nYhDJH+NitXlHeMACHTKEzolKFVAdjQZosB
 Li5GI1fpsw7cpu6VHKdFaYETYQyfdil0qg7EE9hm3NHzWSf91S+vGmBSL0pMoAZQHutSMDLpGYA
 g8xNSTiLrx6EjoDscPiObw4q2wrd0N6LcjGfS28uqV3vvzKYv6blSMvrreJjSsNqD95V2aJ7
X-Proofpoint-ORIG-GUID: fsxr8Xh9zjhfpbIvL-Bn8V6gzbIqy2k0
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=68619f39 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MUnOxqT-vkRKCsmERf0A:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: fsxr8Xh9zjhfpbIvL-Bn8V6gzbIqy2k0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290171

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

