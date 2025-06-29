Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEB02472AB
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206099; cv=none; b=hfdlTVIaDmZAmt/CbbXOzmVxfGJY77RThI/dbQXKEQtain5raUDf8bZXyrCp7UU27H+X8+mxa592er5+6/6TlPL/rFZoG+Wbp+Jw5Pt8hMqpoi/MOh9HQhSJMLY2bHkBV4sTja0t7SH0GwAUtyfmSrUkfpZNL/CJyfE7zw4jeqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206099; c=relaxed/simple;
	bh=jMPs5r3BTYO36F8stkrr8rTxNIBrNmfozE3/6ZLEedw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJthCCHyXIz+Y6q1FaD0LweGgve07CQh0hMZ7KsaQGziHWV3u2Ou6G5VkMlalyItBNZ6aHZpOLWKADpDTBs8F9gbW+o3mgGkUCx7pv0Udfyd7dftNCXoiKOysi3C7oS29iswiGdc9JECoCCrj/PJJ0WtqjzAQ6FCYaD0mtJEVb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3TQES6y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3TQES6y"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TADXsT028542
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aKBBWm7nPUU
	yOq4hUiOYJrGsYTYqKezSGuXIgspUUko=; b=l3TQES6yTa5NfOHAP+efygYFmPj
	5G31ChneJukxs1NeLvG4v20xNHi6h3mL701oANu+vCrshzpGB+o1jFQjD7zmTk/J
	I+f6SG0BbEpKP9/YE2i/ET+CDyNiuJr5an7v98YVcrJP9wT+MUdW73Ee8Dt8MQTO
	KfG0bA5KUOJVy0NTCZGnEbJHUb7ipgyVA3Eh+NL6K+G1SN19Q8m6NqdPicxwElIS
	ABcnhDR0XGsKCKadKswKgNU2pr6cf/9KHTa462UL81vxNAf5MuB3CbBzTjsUsxpZ
	d7pHbWlFgowEbcLkksmFa65BJeZcewvJFCrQoXCRg1cEIaTuhloWQLGa2HQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9t9f8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74890390d17so3145243b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206095; x=1751810895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKBBWm7nPUUyOq4hUiOYJrGsYTYqKezSGuXIgspUUko=;
        b=lfqv0rM2H9VZqIYk0WLow9pSAQY9I5sB0rXYybHa76Ia17SdGFKHJ+8qqicRjNc60z
         GpBRDpHZQ7gG5dRcOAP80pZ/lTdYWTc4+NkoV2s6tZq43tMNLO2hHfVUYlKUO/o1TKNV
         UB1PB0gRWoovuwM/SqY5YfRIsAS5IqvhuEzV3uIOwUb8fmSiJ0QlrbNJ5Yl2p5uTJSaB
         Vesb+xXKHw48VIeR/vFYfROHQVUH2ScREDy/+xSBsW4jn9IydFae0jtZlvgxaNpMPYRd
         QWeBVAnbDIYHrnrSgYQXUXTKCBeACScg+gAMFOzSMXbc5tT6oegvdwhoBWy3nKDTVoV7
         IPLg==
X-Forwarded-Encrypted: i=1; AJvYcCWL8tTI0UaYcOiuYt4M41dCLqqZh7MZZnInDlqYUI/nTyp5t8I0Rpyc1gkZkqZzdCf4+WcyHBA7wsom17Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Q5Hbr+Rel738IrGqPBJmphf8xwluxNEkABXcM3INvWfkQcHP
	OmLIARgJelYeB4ki82ZUQ93GHpNMpQTEuZ8SoH6gmUyJzhyYJE9ZFZhrwga3epKLGD/8S7hsR7a
	Dbn9YW1RmaMsW7X4ROkBwKSqd02xx/MH7ctZgZYj2bfit4yuvfnPGNw/iBgM21OgB0bI=
X-Gm-Gg: ASbGncs/uNyJEBGnKOXZSjz/g6r2KN4j8WwKcMwvqqkARBPGmGjn77jMKmToHkvE3Qd
	t4xtXbsbOZW9gWzYzuB8Sf1Gu5Z+EdtocvJ0uXe+xGzaSQ2calgmYJAcWcYldsQvzI4TOJ8aRha
	xxSipR4iVVrQjwCvUp6XioAovdtxvlsJToNTYb1TuWEMQcJJAEej9XiJvOCtFftJuLaeVKpqbkJ
	sT4OmggovSNv8xv/JfWl8xFYarUIkyG2NIdtlfPqdWZTsMLpx3xX4BfyqQay1yQTf+XPJFcyW/s
	fBHAVp5ZKVLr45rV8p5/WfjZwMsTm0Kp
X-Received: by 2002:a05:6a00:b4f:b0:748:e4f6:ff31 with SMTP id d2e1a72fcca58-74af6e509f7mr14911755b3a.8.1751206094714;
        Sun, 29 Jun 2025 07:08:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNGlWtWr74xS35IMxD89cPCX02EDxaMUNf02HqSTbtkooQymavLXX5RV0QM6HK0OEbV8Y9aQ==
X-Received: by 2002:a05:6a00:b4f:b0:748:e4f6:ff31 with SMTP id d2e1a72fcca58-74af6e509f7mr14911710b3a.8.1751206094272;
        Sun, 29 Jun 2025 07:08:14 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af558914dsm6998004b3a.78.2025.06.29.07.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:08:13 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v8 37/42] drm/msm: Add VMA unmap reason
Date: Sun, 29 Jun 2025 07:03:40 -0700
Message-ID: <20250629140537.30850-38-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX/JRMPQJX/LU3
 qVJQIcqml6YP0txRHzW+KTQaPG5RtHOB+sXcJAKeR/sZkJ0O13i0mlquSfzbYVB+c99y5GO9qUo
 IjFcPPQQLuEg5f/SPjH2IIJNSImJIR+wjTv2FpqtWVbjj/ZIc9dj0THuQHhKdkXYpdLobvjHLlb
 WemeI6HGwNGnMY21w+2UfiBH/rezYrJtQH8/NAxFSKVQl9ujolMS8uFEp4p2nuAxv79BI1Ga8qw
 c2XUmi6eS4Spzz76u4fqwEwL6B2THP28MA+pZgxAMkCms/JiW9gMouI2IMCkClG3RlyjuzvVbcB
 VbWDkFpdsvcpndD5fYzSgH1w5ApddvBziFFnYUd4Qd2eAKGkyApOgaq+7YRb7DGE/f363P0smT/
 ZKOpOOuytd4a9jgBn912QxDvKBwbnPW8vWin0aP/Bfk7yGyM0CWV2pxjIuVaKaDZ1Te4fEeW
X-Proofpoint-GUID: XuP64aFKsxslK9ILk757QiaC3Aje9elA
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=686148d0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=S93TA_zjY9FrSvCmoiAA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: XuP64aFKsxslK9ILk757QiaC3Aje9elA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119

From: Rob Clark <robdclark@chromium.org>

Make the VM log a bit more useful by providing a reason for the unmap
(ie. closing VM vs evict/purge, etc)

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 20 +++++++++++---------
 drivers/gpu/drm/msm/msm_gem.h     |  2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 15 ++++++++++++---
 3 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 77fdf53d3e33..e3ccda777ef3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -43,7 +43,8 @@ static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 	return 0;
 }
 
-static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close);
+static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+			    bool close, const char *reason);
 
 static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 {
@@ -57,7 +58,7 @@ static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
 			if (vma->vm != vm)
 				continue;
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, "detach");
 			msm_gem_vma_close(vma);
 			break;
 		}
@@ -97,7 +98,7 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
-	put_iova_spaces(obj, ctx->vm, true);
+	put_iova_spaces(obj, ctx->vm, true, "close");
 	detach_vm(obj, ctx->vm);
 	drm_exec_fini(&exec);     /* drop locks */
 }
@@ -425,7 +426,8 @@ static struct drm_gpuva *lookup_vma(struct drm_gem_object *obj,
  * mapping.
  */
 static void
-put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
+put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+		bool close, const char *reason)
 {
 	struct drm_gpuvm_bo *vm_bo, *tmp;
 
@@ -440,7 +442,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, reason);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -617,7 +619,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_unmap(vma);
+	msm_gem_vma_unmap(vma, NULL);
 	msm_gem_vma_close(vma);
 
 	return 0;
@@ -829,7 +831,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, NULL, false);
+	put_iova_spaces(obj, NULL, false, "purge");
 
 	msm_gem_vunmap(obj);
 
@@ -867,7 +869,7 @@ void msm_gem_evict(struct drm_gem_object *obj)
 	GEM_WARN_ON(is_unevictable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, NULL, false);
+	put_iova_spaces(obj, NULL, false, "evict");
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 
@@ -1079,7 +1081,7 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 				drm_exec_retry_on_contention(&exec);
 			}
 		}
-		put_iova_spaces(obj, NULL, true);
+		put_iova_spaces(obj, NULL, true, "free");
 		drm_exec_fini(&exec);     /* drop locks */
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 062d1b5477d6..ce5e90ba935b 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -168,7 +168,7 @@ struct msm_gem_vma {
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end);
-void msm_gem_vma_unmap(struct drm_gpuva *vma);
+void msm_gem_vma_unmap(struct drm_gpuva *vma, const char *reason);
 int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 729027245986..907ebf5073e6 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -53,6 +53,9 @@ struct msm_vm_unmap_op {
 	/** @range: size of region to unmap */
 	uint64_t range;
 
+	/** @reason: The reason for the unmap */
+	const char *reason;
+
 	/**
 	 * @queue_id: The id of the submitqueue the operation is performed
 	 * on, or zero for (in particular) UNMAP ops triggered outside of
@@ -242,7 +245,12 @@ vm_log(struct msm_gem_vm *vm, const char *op, uint64_t iova, uint64_t range, int
 static void
 vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
 {
-	vm_log(vm, "unmap", op->iova, op->range, op->queue_id);
+	const char *reason = op->reason;
+
+	if (!reason)
+		reason = "unmap";
+
+	vm_log(vm, reason, op->iova, op->range, op->queue_id);
 
 	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
 }
@@ -257,7 +265,7 @@ vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
 }
 
 /* Actually unmap memory for the vma */
-void msm_gem_vma_unmap(struct drm_gpuva *vma)
+void msm_gem_vma_unmap(struct drm_gpuva *vma, const char *reason)
 {
 	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
@@ -277,6 +285,7 @@ void msm_gem_vma_unmap(struct drm_gpuva *vma)
 	vm_unmap_op(vm, &(struct msm_vm_unmap_op){
 		.iova = vma->va.addr,
 		.range = vma->va.range,
+		.reason = reason,
 	});
 
 	if (!vm->managed)
@@ -863,7 +872,7 @@ msm_gem_vm_close(struct drm_gpuvm *gpuvm)
 				drm_exec_retry_on_contention(&exec);
 			}
 
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, "close");
 			msm_gem_vma_close(vma);
 
 			if (obj) {
-- 
2.50.0

