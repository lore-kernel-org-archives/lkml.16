Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE40F22540A
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206047; cv=none; b=K3J/Ncsvus1WbcT4/KDA4VXvTAEvNfe3dSvzH9zhmpgd0j7+2RQRqgpj92ejGrv+YxR5RLZdPfW6B4zzN+6tnNfw1zq5Jj6vVUMgmM/f7b5Ipq9OUyOOUswmASotla68ZEj1btf3abzNyPUfQXEvBdvnyyLiTh4SwGdKabamjGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206047; c=relaxed/simple;
	bh=Gm6UhJ7UKI9DiYCOXoBXcpqw8slOxn54iQtmUjp8vaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PEzAmux62fwduwNozT4K9FzJ/Xlim9/rAMqpEOowee2wAbB/JOYnL6WqzuAbFywgu7nQc18K4WCqVAE0z0hf3C08oOViAkbZBl+YLflIesHENaL2HcILPhMZ2sDmNtBZHz3GiXMLEwdH4B+p7NDOY47eDKV58t9H/dp6MPG6ZPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYJ5D3su; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYJ5D3su"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDTgi7007811
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sVxQxqcInWG
	kGdZkfQeRJ3wtUjNtIfv/ihKTiUvsmA8=; b=IYJ5D3suc16HbIFda1q/42LjJ9/
	nRxIYwMK489S0+PWp2k66r1P7SCrITojE6k4gPRhDmHLr7IzTrtPI6TxbtIPaRpa
	eO5iH6jwNuhSgIHNChOOcpRIhOlHlKwP+mAuwycPfyHNQM1AaeJNAA/cv5xNyNYQ
	YV/LioaElYtpIy31HOp6WYumtRapq4GfMMW5bWa0h22J5iVN6iJD47zL+82Wflpm
	McgsH+tkuwbXS8F3kR/Iim+NnNEfirg74F+XjekluNGuiDCMv2Pw0zNlFAVKSK4Q
	cfmkhkczRIHIxbodyXiZBDVeKzOVMw13BcbHFae8awk9ZYZj6OWIlrwNTnQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8m627bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23536f7c2d7so19740045ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206043; x=1751810843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVxQxqcInWGkGdZkfQeRJ3wtUjNtIfv/ihKTiUvsmA8=;
        b=RKyKGRe04UBTHDfLmcLuJSgPjAxqxraqlCHnPbWcH9YAqlxPjHlT0vLI9Ix7Po4Itd
         AU/ZmhbwdIo/f5sLRCG8snJql3NFrnuLExgpAJngbc78PZyrhmECJ0q7AUCq8+7sy/38
         7ocwJ8zBY5TMgjDImENz1RrEFEppxubF0ltzwvdSXJImtq3ZEY/jqIXKzGt5hPrr1I1M
         XUtYDDfu0QfydBgvKIj8vCBn62ypkzJS9eq+W1ihxVDk9s+4D3ebzQDBEJ63HnFnkh2f
         4YNz7smmrB6rfrZ4DTb1G7QOEhK7ggyGTuntAp1MMEKd48u1leXTp29jwM80mXT2Jw1V
         X98A==
X-Forwarded-Encrypted: i=1; AJvYcCVYYaux/60PC7lCl1eSRDArsR2x/YF7CFrsQL74rlmXcMa/Vonu6iajAg26lRZosWUr7U4xeAD30fIwBAg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0kZt6fZsuWQ+UvPChLaelRcFhQisPTx0v8ndscRoVDIZ4QEwE
	lNGQHG2/TmewupndLEyGCa2S7McosNqFDGXWKPKO/7xFZGNzir9SaVbLqHVGoLLyw5044CS96uH
	ctpv9q0SNbccyDklYh7fsJXBk+adQ0T7VKxDbsNuNjLAOP1PROwb0QehRxVu61K+6qHs=
X-Gm-Gg: ASbGnctcNkL5uxDYS5zqMG3KAjZQjDkaWMZhx48asoYCSb6qcVgo+A9VxT6HKFEgwiK
	SenlLq9ChxAu62O5o40XQkkxq0Spdnzun9NuRjI4cf2MZjIg57GWj41O1IZIy7QcJTBYb5WSkIi
	MDu1NBCFnn9TsCrOBLu4nWA3o8YvOWvujTZFkpvGKMjbc+cpEX+DGhA+XsEPYcUfgSsOJBobH13
	LtNu9R0TH9uHccrJEeUDyAUh/eExEAyZYe227cjEQYetk7m3gX5ZwU8JneH3c5GOUbFOQzAHwRL
	jvCzPmxCdD3/aGkSqtuT7QtBfrAWn7X1
X-Received: by 2002:a17:902:ec89:b0:234:be9b:539a with SMTP id d9443c01a7336-23ac4669445mr164026105ad.40.1751206043218;
        Sun, 29 Jun 2025 07:07:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjlNaS4GuuR0AQMQjI+3+VSvt4lcAZtZqKTQqSco/bWPE6Q8TkSQrt0HwBQMPhpYXjAE5Ueg==
X-Received: by 2002:a17:902:ec89:b0:234:be9b:539a with SMTP id d9443c01a7336-23ac4669445mr164025665ad.40.1751206042803;
        Sun, 29 Jun 2025 07:07:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315edcfd75dsm3079464a91.1.2025.06.29.07.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:22 -0700 (PDT)
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
Subject: [PATCH v8 08/42] drm/msm: Collapse vma allocation and initialization
Date: Sun, 29 Jun 2025 07:03:11 -0700
Message-ID: <20250629140537.30850-9-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfXzPW9/dYR54lu
 zHNZx8X4wlLtWtnbJQSDJmJEElscUIYwSIiflVbF5SasNrXtjLsgI7bbzw4NbEEIKZn4ABy5rLZ
 6a2qDrw59LVd1JvKJiKRgzB/x+vxOr4r6+gGgoG6AmSMnpWCUp2e6ZTmt8iNCwPxlcTRDGO6h6v
 N//MHD8lF+p1as/McqY+KM6yWwB3o479G7lFfCv762btL9gHc/KvA/I+5OjJCVpXsPIMXgnr0KX
 0UeSglxAkgC2tnSnaJsmQRFxhYmMbl8VjHgidor15MOXxHIjRQ+xXO9gGmgLDjVsKJzW/osUpRW
 iIGl05Tvi4Y/+bHnryCNR74QmjYjIP2LJuro12DBxgQ9wcKpvlCHbw1oY1JJSG1u5UBmSu1h9h5
 /TuRsqRZM1zmC5y2Q+g/Jo4BWeFtchfIn7vRLKrzW03w/tvX8f8BKzlh8f4y3zFa1RFT20mk
X-Authority-Analysis: v=2.4 cv=Fq0F/3rq c=1 sm=1 tr=0 ts=6861489c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=amM6-9Z1s-9IjK5NNPIA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: qYQREj9cEcBqa8n9zU7Ig534bRpOizEH
X-Proofpoint-ORIG-GUID: qYQREj9cEcBqa8n9zU7Ig534bRpOizEH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119

From: Rob Clark <robdclark@chromium.org>

Now that we've dropped vram carveout support, we can collapse vma
allocation and initialization.  This better matches how things work
with drm_gpuvm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 30 +++-----------------------
 drivers/gpu/drm/msm/msm_gem.h     |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c | 36 +++++++++++++------------------
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b83790cc08df..9fa830209b1e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -333,23 +333,6 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
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
@@ -416,6 +399,7 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
@@ -423,18 +407,10 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
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
index e47e187ecd00..cf1e86252219 100644
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
2.50.0

