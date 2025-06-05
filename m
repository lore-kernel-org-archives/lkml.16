Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E370127A913
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148351; cv=none; b=imiMyuugHCnQPCygZe3mGUBpj/eiCXUCqXokGrDU4k3n8tagWvtyEyCwMIvuOSQc2y7pk2B453KI8qS3xMurXm5pOYWQuHR24ZtJnqTi7Bs9t/rZszy/+EW7hcIjGszfsBfkQK+hiGJXccPD82Y6cV6yksLqIoyGt0GRxOUdAKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148351; c=relaxed/simple;
	bh=x6l1U8SQbNXar2T+nKC44CZbNnCrpWZd9rRpAvG91aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OS41YMXff2I81ADRhXa0wTe6tw280i0dNnOwbEbjRmmLXfv+BUv+wvZR6z//Hc0PPnIJgPQsqPDZRGx4mjU7KLSTg45KbU/fO0R7caCdGf/ykAAzKuvdCjXSUfp1MmLk634Xy6EqBrRQojhiCtgEsGKGsrjTn0Cz4fO9PVaq0tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jpdhTPiK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jpdhTPiK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5559keIr027115
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BHyE+ROYmr1
	BYZwR3C+QXhzqfJ1dS+58uUEwZ+AZnWU=; b=jpdhTPiKagEF5j6KX7pPe0LyzeH
	OZTEVdqkA/8sYYJSnJXLxEkmfBiCgiLYEGmqjhlJ6/nYCHn0OZYObLKwfBJX1DpA
	vqmJDJhYS1cO2S24WA9NsAk7/cJzj5hj+pB4/2Uce+IldRnNRPJewIt8363Q0N7E
	OJSp1k7MfJrDoaw+etoLMlGkHSoSV3rmWJGunNggNEL++DL1l3gJ3WtAIrfXEiR/
	cz9JiCaafyZo2IYAeoQ8CTV6epyZ7Q0V0c/+RFPT+G0gcJ6q/jKn1U/zNe7mSRU/
	tw4AaIQI4NXPjPdTDmWiY2fwWiz/gpnXlgx44mNb4UOShSsdXn6l80RJ22Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nt9rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:32:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7394772635dso959978b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148348; x=1749753148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHyE+ROYmr1BYZwR3C+QXhzqfJ1dS+58uUEwZ+AZnWU=;
        b=YdklIZGesan2kO0ps7ClTGHYpeDMJAaudCeVx+PYUqeW1kYQIJQfStCCU+50AN1zmE
         vf+M6dIGDUeAkpwpxWHCzejO1oJD3900mkiJ4CgcKVK4sD8gXouxbhFP908jSoz1DES6
         XJKAivVEbQhx0ktoDEkCuNQ6KxrYs6q8h4hNmB7nsBTIttLPgmTphVWVkl+SIyuuqI+6
         cAh/9G52JqxkbMxp7xfnBRamUaFD5nd2D9mYPmYuo+N2NQ1R4GnApc0n+S8V+xgVenIA
         FSCZL3ucfbFqbbEVBIlVgSipN4ZhZmLs+KcBCejWeKpjfc41dtxOueP6Dumq9F36EObq
         +12Q==
X-Forwarded-Encrypted: i=1; AJvYcCUU1fvn8vM+9iG7ftE61qPLcRKXC6T0CLMReIA/MGcLleoFMqAYq8j0H2HgjSLn//tJH/nOX8fcNZzzcjo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz9fUNIjEB7ooITo21wEAEVBnjx7aH/I9RhHECsl4cbfrqEnRI
	N+xnV+eAt1tmfsUMYHzWKg9k0i5cDN/pif+CBiheKbEdYrB/yWnej0RJwRQ9MP/sVCxLxThrTlp
	+dBmaz8KQEXxnlkmR7mkfMxxy7ukhZQ1fI3zOPz8GG3aV6BArSmD+6KWvCBKL1707pT4=
X-Gm-Gg: ASbGncujwog179ITp8GS4C/eJO3ZeUhLXLsG0ow8YP0ECi1Xa15xBQ4VXR/ILEpx7+j
	ZhcLGLhlzokG/sdjQL8XdIxLw8fTJpswzpItwEi25tXXUVf+MxZyRj5HWRJXfvMyNX10fo4l3Xp
	WOsW4MEMZuDaqYtNYqLmJcsA9KAljgqFe3fjuiCOpaZDQ9I6WQKo6knvgNfZQmOHY9kucvzrAv6
	60LVa7kwZ4QYITUAghVG8cY5g1OUhGK0zfTJ+yP0H44ChBDG4/HNUm2GiNJFdvWVMMGdKgWxsmz
	MGXcVrvrFTb4mVVo7rL8gQ==
X-Received: by 2002:a05:6a20:3d8a:b0:1f3:41d5:65f6 with SMTP id adf61e73a8af0-21ee2637d11mr356805637.32.1749148348138;
        Thu, 05 Jun 2025 11:32:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVrfLgNyWqLp9DNSwslns/gOD9utCo3fzpYrtaVTz2iGKhZuHEW0/CiegXluYIPkvKb67fXw==
X-Received: by 2002:a05:6a20:3d8a:b0:1f3:41d5:65f6 with SMTP id adf61e73a8af0-21ee2637d11mr356783637.32.1749148347737;
        Thu, 05 Jun 2025 11:32:27 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcfa0csm13511882b3a.131.2025.06.05.11.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:27 -0700 (PDT)
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
Subject: [PATCH v6 06/40] drm/msm: Collapse vma allocation and initialization
Date: Thu,  5 Jun 2025 11:28:51 -0700
Message-ID: <20250605183111.163594-7-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: IkKG-rV825XI_9xadPRh4dXoRMdNf48v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX4O/7GJIqt9aV
 sYGuhPLSiUrw12CqphGMSyKfeVKonOFnOAfrDAp3RSPNOuZ7m/CcNMaCFETeaV8UY17IO19Ndv8
 FCKrYm4kaNpEqwn5w5nbC5Qq4ImjAwPry7JMG+2BcbGWJ/YOQRHGOu3hfFYBo2TzVYOPPHoG8y9
 y8PArr+z7zBuxcDHQ4K6e/5CnzHbYihUzhV+1TKRNoUPpuvnOSmmHF257/BVdGFk9VTRMRZZe1g
 T2GqlCfOOJfn0sKPTTNDvSjD8V5JC1b1j/hS84y4yepKatY9wwxJbEL0OFWY241EVg99OGZBQnM
 L2KCjvUSZp8WEfXqtX+18BbDh4RDNvvoPPW2iL8EaaEtKKRw5HKOvBJzgVBjOhJYxXWTyCzCTSz
 0ZGarU0fl0KNAceShO+FTTO8Uaj9cp8qlEtDvaY7i3v4LQWu9W+Db9kG5QYDcv+njWx4J57A
X-Proofpoint-ORIG-GUID: IkKG-rV825XI_9xadPRh4dXoRMdNf48v
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=6841e2bd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Fs5xBETKxiRrdmql5B8A:9
 a=2VI0MkxyNR6bbpdq8BZq:22
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

Now that we've dropped vram carveout support, we can collapse vma
allocation and initialization.  This better matches how things work
with drm_gpuvm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 30 +++-----------------------
 drivers/gpu/drm/msm/msm_gem.h     |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c | 36 +++++++++++++------------------
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 621fb4e17a2e..29247911f048 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -337,23 +337,6 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 	return offset;
 }
 
-static struct msm_gem_vma *add_vma(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
-
-	msm_gem_assert_locked(obj);
-
-	vma = msm_gem_vma_new(vm);
-	if (!vma)
-		return ERR_PTR(-ENOMEM);
-
-	list_add_tail(&vma->list, &msm_obj->vmas);
-
-	return vma;
-}
-
 static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm)
 {
@@ -420,6 +403,7 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
@@ -427,18 +411,10 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 	vma = lookup_vma(obj, vm);
 
 	if (!vma) {
-		int ret;
-
-		vma = add_vma(obj, vm);
+		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
 		if (IS_ERR(vma))
 			return vma;
-
-		ret = msm_gem_vma_init(vma, obj->size,
-			range_start, range_end);
-		if (ret) {
-			del_vma(vma);
-			return ERR_PTR(ret);
-		}
+		list_add_tail(&vma->list, &msm_obj->vmas);
 	} else {
 		GEM_WARN_ON(vma->iova < range_start);
 		GEM_WARN_ON((vma->iova + obj->size) > range_end);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c16b11182831..9bd78642671c 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -66,8 +66,8 @@ struct msm_gem_vma {
 	bool mapped;
 };
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm);
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end);
 void msm_gem_vma_purge(struct msm_gem_vma *vma);
 int msm_gem_vma_map(struct msm_gem_vma *vma, int prot, struct sg_table *sgt, int size);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 9419692f0cc8..6d18364f321c 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -106,47 +106,41 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	msm_gem_vm_put(vm);
 }
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm)
+/* Create a new vma and allocate an iova for it */
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
+		u64 range_start, u64 range_end)
 {
 	struct msm_gem_vma *vma;
+	int ret;
 
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	if (!vma)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	vma->vm = vm;
 
-	return vma;
-}
-
-/* Initialize a new vma and allocate an iova for it */
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
-		u64 range_start, u64 range_end)
-{
-	struct msm_gem_vm *vm = vma->vm;
-	int ret;
-
-	if (GEM_WARN_ON(!vm))
-		return -EINVAL;
-
-	if (GEM_WARN_ON(vma->iova))
-		return -EBUSY;
-
 	spin_lock(&vm->lock);
 	ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
-					  size, PAGE_SIZE, 0,
+					  obj->size, PAGE_SIZE, 0,
 					  range_start, range_end, 0);
 	spin_unlock(&vm->lock);
 
 	if (ret)
-		return ret;
+		goto err_free_vma;
 
 	vma->iova = vma->node.start;
 	vma->mapped = false;
 
+	INIT_LIST_HEAD(&vma->list);
+
 	kref_get(&vm->kref);
 
-	return 0;
+	return vma;
+
+err_free_vma:
+	kfree(vma);
+	return ERR_PTR(ret);
 }
 
 struct msm_gem_vm *
-- 
2.49.0

