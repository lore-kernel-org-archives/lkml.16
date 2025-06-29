Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EA923B61A
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228180; cv=none; b=b12zVk0L5S9S35Jw4++4XxYTJhRH6ijpKEWcSdS3pWeFsAVNiESD8UqSWvBW+iep62Wq7yZrasTyJ2lk33/oiJi1PeU6+lcxtQ2Oalp7hyETurTqbJtdFy3tKh8kXcWExvnwX1ZrYRCTiBb0L5tu6kdvp0+4VUzuT+4fpwlbXWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228180; c=relaxed/simple;
	bh=au593a8+7mGZ4QlvT4X7cpF6yg7CCF/F42yjIFbyfCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3RkbSI4PLS+/X89GMTLNHtapZ/feySL0AMcdofUDlbWBppM8W6sUDNXcuggQrZdUwjlk/L8cKMC3FIHk0EIR28EkxFm0D9q5tQqCAxrsjnuPkB7toigzSQUXg/KLhOPjcHvICLcloVEBbsjifS/imxLair+d6DxYNa++8P+A7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B73z6o3N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B73z6o3N"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TBMQf0029314
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eRArZHg5kja
	6OQg/YP1uRgtCqLo62Lhjfwd+5rkVLKM=; b=B73z6o3NUOnTBeLRUz/v4CmCQuC
	NG0NvTygtQIVavwWwnSyU+uTSygQRtJT5ZZoQXGzz83y7ou/2k0HwoL0MboB2Hq6
	COEAlCbEjz/+hUcF64VO1IUF4pktiFoPpWxBerjO019dh06E8Gjtur8f4ErBeQiy
	CDIN18t6q/1/2slPbQrTJpzHMu+dGxmJRUDQEVbUHfocOyDpIoaq97VkBrky8R+9
	19/Tn43glh9WVt9wJzVC/9YAdiq4AM+L8uxkNE5kA/J8CpKCPs9zyiKMvfe8VUPk
	VCmCEn7B+XGmnU9GnEKJ4/SE50uQcWQku2UQ1UewhRHwJ4gUIh0WAldycXg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcjjcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234fedd3e51so11025495ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228177; x=1751832977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRArZHg5kja6OQg/YP1uRgtCqLo62Lhjfwd+5rkVLKM=;
        b=XDgUJTNYfPhtUQtKjYmYlKP7b1gZIMjiex5YQsgF2MClXUBVjblwLJjPNgspiCoS4z
         8u7r0WGH80/36TH4AWtaWAkRF+vpA1xI2461Qtl78kqyqTbjU2FPFYLt+cmVqdpVVMly
         X1x393Y1dkdr1iPWwRO5jp2gFJ/AXER27cZJ+lYdB8goAe+4ly3hlJHlULgtW2lG0vWl
         MbsnMRKj9Uq2Q/S3N7eOPokweEq2wZEh3IAVQMgMhuDY4sukanYdD/PIQ21wH0LfqmjE
         6lbyTqj40fHi5qUJXzpd0+6D0CI3gsKCGe5hG2L8A9ePdao0ZQnuQkl5RhAw1IO2HWTd
         cjog==
X-Forwarded-Encrypted: i=1; AJvYcCVBQYmPBoQQ9S1wiC0d7l9U8TpQ89fW8CESsZEuxujCivzN5dBFxebIE7BqWqpO0wfEvXl2Tba8Fd3Okjo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqHCZ9Dhm91Hz7KmhLXC3N29qDT27LCo0IzGpNrbS9wgg0OThh
	7G0SHOkaMGhHyhzDdggWX5s07tYJ1QGM6AcJ1yFpOvfFU5M0zAhQm23migOiQgAM9yz0Nr3IlAf
	mskiFSNgQTUl3X0QZNWZpyMxyHCm7eJMvXrvQ6SwAFBtYDjTOgji0IAG/xmqSdQAfOZg=
X-Gm-Gg: ASbGnctOj+P+ZfhQBbfMiYKYqOaeYtMATCFbqU60hB33c5idWodgTMssAdDHu717/bf
	imh/yaDkxc4f/lWlWaoNiNbL40HGcS0/3NfdGEyymA2fnsUmeRjiVdakmP5fEkcKvDhLzvreG1w
	RuZooEtmYgzqUiCu4UEoVoge3BDlLZTP7aUIWGV0tLEUWGymxSUJFvWqWwvqtu7ZRTq4lNCOCjS
	zQnm/2vzGUEKpEKDS0VmcCe11Y/cLN6BeZFk2rLCy+CT9835wTSHQqFGsgRIeYuxwutRXtDU1Zi
	g3TV0kqe1PY1pADdoayTmoUDZg9OelGkCw==
X-Received: by 2002:a17:902:ce87:b0:235:7c6:ebbf with SMTP id d9443c01a7336-23ac46342d3mr183275275ad.35.1751228177202;
        Sun, 29 Jun 2025 13:16:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtZqvQxwClmeSyChDksjaanlaNbbsqfLSli1B/K5dWQvgddHns82/yR5/PricjffDUOwiSEw==
X-Received: by 2002:a17:902:ce87:b0:235:7c6:ebbf with SMTP id d9443c01a7336-23ac46342d3mr183274885ad.35.1751228176702;
        Sun, 29 Jun 2025 13:16:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf26sm64300085ad.107.2025.06.29.13.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:16 -0700 (PDT)
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
Subject: [PATCH v9 09/42] drm/msm: Collapse vma close and delete
Date: Sun, 29 Jun 2025 13:12:52 -0700
Message-ID: <20250629201530.25775-10-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: 7vWQNB7LtOM9v2M8Oi9tvW1fwHr8TVR6
X-Proofpoint-ORIG-GUID: 7vWQNB7LtOM9v2M8Oi9tvW1fwHr8TVR6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX1CbaQNuAqLcV
 fDXgQtA3hr85gyBY6f4C9V8jsjnvr/a0Odi2DqhPSQtoQk4gTg1N3uYd2XtDfqbUc1msMTG7sBn
 uSaAQ1lmVxMG432wim+Ei4o3NW0QgvfUAHJ1kt0mD1bmbE7bgeipSTS3Sgzbtmr15L6n+yjfjYE
 0DnZcM4FGFRYW6mAn1mtlQth7BNjZglRgzj+092EjJrZSQRWSCZOlTLaSsra7zCVus+15m+Tyzf
 f2YsENGDrB6JEdaDwLsmckFyK5NGDTxv4phOQlL6/Cmtj7+nNmJNjsPQVMR7lKsaAFDJTBf+OIq
 XfafMRz8EgFveud5WEizOvMJpDsK+kBPV1qmQw22TSMprGVzsdXa8sgEDvUb51z4wP4uXLF8vUe
 2mZv9lBMurLbB4g1wTKrgIuUDgxJXmTB8p9re4wPxx0GlJYj0/KoAbZor73ulN14CIgv/9bl
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=68619f12 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=RIvuzEnNBJp2qadMtJ0A:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

This fits better drm_gpuvm/drm_gpuva.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 16 +++-------------
 drivers/gpu/drm/msm/msm_gem_vma.c |  2 ++
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9fa830209b1e..7b0430628834 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -349,15 +349,6 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 	return NULL;
 }
 
-static void del_vma(struct msm_gem_vma *vma)
-{
-	if (!vma)
-		return;
-
-	list_del(&vma->list);
-	kfree(vma);
-}
-
 /*
  * If close is true, this also closes the VMA (releasing the allocated
  * iova range) in addition to removing the iommu mapping.  In the eviction
@@ -368,11 +359,11 @@ static void
 put_iova_spaces(struct drm_gem_object *obj, bool close)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
+	struct msm_gem_vma *vma, *tmp;
 
 	msm_gem_assert_locked(obj);
 
-	list_for_each_entry(vma, &msm_obj->vmas, list) {
+	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
 		if (vma->vm) {
 			msm_gem_vma_purge(vma);
 			if (close)
@@ -391,7 +382,7 @@ put_iova_vmas(struct drm_gem_object *obj)
 	msm_gem_assert_locked(obj);
 
 	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		del_vma(vma);
+		msm_gem_vma_close(vma);
 	}
 }
 
@@ -556,7 +547,6 @@ static int clear_iova(struct drm_gem_object *obj,
 
 	msm_gem_vma_purge(vma);
 	msm_gem_vma_close(vma);
-	del_vma(vma);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 6d18364f321c..ca29e81d79d2 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -102,8 +102,10 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	spin_unlock(&vm->lock);
 
 	vma->iova = 0;
+	list_del(&vma->list);
 
 	msm_gem_vm_put(vm);
+	kfree(vma);
 }
 
 /* Create a new vma and allocate an iova for it */
-- 
2.50.0

