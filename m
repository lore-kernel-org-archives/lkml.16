Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77DC25EFBC
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228228; cv=none; b=g2F4BGRAWvSxqGcXfA//U2cqY7/kh2AyOpsCjoPBuiHE15P2Z77HJL2ewcns221ZcvfztTRI8GiPusm8NTKA20uSNg8EF2nxAKOPfB/5Bv/D2kajbHW1uPAcqk/QNQ2OrgcX9VtyNCUp+VgiebLuNuw1llqXvzwPpcnNCwMXXsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228228; c=relaxed/simple;
	bh=Ci4tiURPEN3fgQgUAfKfwBL/Zz+rrpzlouAnx0HAJyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t77jBvtZZ+gWg8fz0wolmtHJIdFolnrH63+PoZxwIafg8hL0vQyaMQ3cOjkO/0Q+4+1YCt+wrYv1JQBThfhtEkjNBDV1chsUUfCgVSA6dRUyjDbarGhuC2yc9vmBYLK0xJXrm9GPaeWT9eWUz91eRcsUS7x+I/MfZpUNuLrmu7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C205ImoM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C205ImoM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFgfs2028908
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+3e0ksDzZ42
	mLlKJB4uSylL2Fh/ag708LB47aoZZ0mw=; b=C205ImoMUA3PXX4VdMPfQpZQcpx
	4l/8ebb50L2HtCB2w7fMbd2JYEy6zU+YJwsD0NZm09WUDWWtzqE4BgZ1g84AEBPN
	FvP7Kl7avWNryi3+zsT0mYgQ+HibZOLRF6+EJzkGz3vUP//UyypJ0z/tiFLFqgUf
	/Tfbp4Ky0vXiqoH96aRmlkXjvWsaDfzMrXm3j32Sj9eMEUYNVITa0ybX6DWBsuW2
	VbPa9PjBosu3RvaCfW5FRlu11745OHM6HrGxv78SVQqf+QMPj6tdxxrMgTiMIn4C
	8zvS9kBF6ABT/BOY5ZAd7gyzKh/G/9zNA1DjOXAoVR0D/XlUvrlA9V9UM1w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvjptb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7425efba1a3so4189129b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228225; x=1751833025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3e0ksDzZ42mLlKJB4uSylL2Fh/ag708LB47aoZZ0mw=;
        b=GigLncdh0TBPW7Oe5mQ/1HnTYzRAgdzo07NPIhy4KaR1Mhi45E3ONatzuLyYdccH3V
         VS9wNBRuO/+XTaPMj14VU7DXXiL007Ll6KIp9nTUhNcpU0qMfmGbdQWDsV17/RwbxRFy
         axafwxs/eTYNmxzL960XZvxYpr9uvTtKG2jbtFUpbFHprCAcJ99I3uGYvWs64M0t+Rry
         engMdI4yHMnixe0IOsoyht8PSxSTz7jdzhvgqL+M9BaC/PzdOXCPuq7fXhaHHroqcKpv
         9kfLTgTIXfH3SktWk31YOb3aEqU9YJEe5N4ir7zNm1nh9F4n9AscZJYteNtZJmGjdd09
         eWew==
X-Forwarded-Encrypted: i=1; AJvYcCXTnPC0RhLppiwkUOSX5/zqhlNWyxACmXMyC23nl8QM5LRn+e2uumaHQG7wzK++jvQJl13DkWmRbZiQ4Pk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnHQVVcz32lO63BS+U23xnD6baW4S+onP2eyMH0rl1iHQn08ES
	4qCnFtSyx/qNSh6x4SH2JZzn/9MFEZxx9BJs1Ykdso00IgPkPOIiOMud2EXqlGkdwqmvjhaMNGe
	dKgFwzf6F6xT6NKPeFcITy5RgRXUO2enlj11rtVQwzDlvwWwzN62V5u2ViGN9T4EvZBk=
X-Gm-Gg: ASbGnctZRT46dEdPlsB9rKR3Z9VOP90vVN7/ILwb+n+ROCnQ1cVFLah9WRZk+VPTiJR
	IZinyVWEZTnRtYJeqK3Bt9M5XSyZpptNDEAWweS1bXsVyqnv4u87xYpuATC1N9unJ3VMOXEbCgS
	eQ0AkthH4KW8T31O2EWPoAEQiOu4kdgb7mYIMt54zXYQRsJKdeO6GQvoE+w0xmhWoVRY32WaAC8
	JyEZ8cFZBIjknWaODEx6j+JFA1Axxdl4TBTTA5Cu4jpCrONAyiBdijDYjfqi5OiFXM0x48YQb9T
	1iql+5q7ZRmGqwd45KIderYuorP0biMyQQ==
X-Received: by 2002:a05:6a00:b52:b0:748:6a12:1b47 with SMTP id d2e1a72fcca58-74af7aef473mr15223425b3a.10.1751228224827;
        Sun, 29 Jun 2025 13:17:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0f42J78b5kxB0hNvjroBKsRXjXeZuWzvQV4YS47hMUJFad/41z/IabO6ypJ/hY16UGYkV3Q==
X-Received: by 2002:a05:6a00:b52:b0:748:6a12:1b47 with SMTP id d2e1a72fcca58-74af7aef473mr15223388b3a.10.1751228224324;
        Sun, 29 Jun 2025 13:17:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56cb98asm7266082b3a.126.2025.06.29.13.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:17:03 -0700 (PDT)
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
Subject: [PATCH v9 32/42] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Sun, 29 Jun 2025 13:13:15 -0700
Message-ID: <20250629201530.25775-33-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: jMSZj3n7cqckQitMZ22cSjjABEkfSfbd
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68619f41 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MLfKQGWeMraaM-6YArcA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: jMSZj3n7cqckQitMZ22cSjjABEkfSfbd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX+8Skrab+Huun
 blUyZdIvx+701KPYW71Qp+FpegFYfsIW0AqUthFSE3geT5+dpWIRHZ7dIagH4yIrsyM7ZogyW9Z
 Mnabfd4siP0/o/TudjbfgwXMvzfE0A/lCe6OnSmxvobEBX2xKQycTsJWe1PSNCBtflcSbOIgQhp
 R64NjalBwxB1nDjl8jUzrkBUl4SXxGYVf3w+9tj18GeF9CK5nmqodgHkgdmfSR6zBXFjPtXTNc4
 Nw+cCyGGqr6APYuiju7X2NasyvXk7Vy7kxB5ArPqj5+fqgI4KgA7L6Rj9NY39+sQDdL3OCtiIgv
 sWRbb4YUC+HnFkDesVKSlz+FqRXbPfM2iOzg1Fk6vUNNDIgQjzIsgIZ8rv/kAirKdqQ/tdHQVhP
 0VbAk1LI8vRKtpEmXejlWZggJbqu2L/ksumUvE25mS7jkq3oM77PhHu1+8IBBVqWAH9lRh/n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=981 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

With user managed VMs and multiple queues, it is in theory possible to
trigger map/unmap errors.  These will (in a later patch) mark the VM as
unusable.  But we want to tell the io-pgtable helpers not to spam the
log.  In addition, in the unmap path, we don't want to bail early from
the unmap, to ensure we don't leave some dangling pages mapped.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c       | 23 ++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_mmu.h         |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 62b5f294a2aa..5e115abe7692 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2280,7 +2280,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu);
+	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu, kernel_managed);
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index a0c74ecdb11b..bd67431cb25f 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -94,15 +94,24 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 {
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
 	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	int ret = 0;
 
 	while (size) {
-		size_t unmapped, pgsize, count;
+		size_t pgsize, count;
+		ssize_t unmapped;
 
 		pgsize = calc_pgsize(pagetable, iova, iova, size, &count);
 
 		unmapped = ops->unmap_pages(ops, iova, pgsize, count, NULL);
-		if (!unmapped)
-			break;
+		if (unmapped <= 0) {
+			ret = -EINVAL;
+			/*
+			 * Continue attempting to unamp the remained of the
+			 * range, so we don't end up with some dangling
+			 * mapped pages
+			 */
+			unmapped = PAGE_SIZE;
+		}
 
 		iova += unmapped;
 		size -= unmapped;
@@ -110,7 +119,7 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 
 	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
 
-	return (size == 0) ? 0 : -EINVAL;
+	return ret;
 }
 
 static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
@@ -324,7 +333,7 @@ static const struct iommu_flush_ops tlb_ops = {
 static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg);
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
 	struct msm_iommu *iommu = to_msm_iommu(parent);
@@ -358,6 +367,10 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	ttbr0_cfg.quirks &= ~IO_PGTABLE_QUIRK_ARM_TTBR1;
 	ttbr0_cfg.tlb = &tlb_ops;
 
+	if (!kernel_managed) {
+		ttbr0_cfg.quirks |= IO_PGTABLE_QUIRK_NO_WARN;
+	}
+
 	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
 		&ttbr0_cfg, pagetable);
 
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 9d61999f4d42..04dce0faaa3a 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -51,7 +51,7 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 	mmu->handler = handler;
 }
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed);
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 			       int *asid);
-- 
2.50.0

