Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42BF27CCEB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148394; cv=none; b=Y5zx9ip0DP+ALw1Ta5j905yFLWaoi8N2k+4lkPVOIcd5tFBlctgfsOEdJpDJac/Ep4bSCxqr9elayiPmhb3SeVENY/33CqQNdORfkSHivOt6XhbR0FwLm0rjIUDxvj5RDmgzZ6hF0MShgGmN95YzJaMpRPpKC0uI3o3UKcgJlLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148394; c=relaxed/simple;
	bh=miM77xEXTrB6mt10AQICgq6MDZD3BX5ufhFU8RcosDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TAnYav+POki7jY5CPxgRwNNfzUDimV7eua/kEd2uYdm033xKwpi0BKFxna1i/3BhGG4vxC+89LudZYl+NO60pjVfN3koERDO1wz5AE6PjMBxo6SvGtSlD+im8inOrqBEi5bdy3uCbOXmvlxzJ3UhZPcBZY1zqXPQrNvdHOJ3FpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClyghPom; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClyghPom"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555DktrA027446
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DtgSsqvS9NG
	lueSPRpKpNF02UHsYVqSrf4yaa+KHu3E=; b=ClyghPomOFoMdTdJzGxve7TKXHN
	3OQUYa+lC3FIecHp1y+SfCYVCczz7kP0u2EisRTkMBKeg/Fhh10uMMHFbVjIzh1Q
	Edh0I7kadwComP87m3bhTriUzqyr83vu1PIFmN60gfewQ94d9+4anjazQQ7A2IOF
	oeBEThjo659CyseoxQMEROIrKvsLB7NGcpLlaUxf2DYnP9WyPRCFFWAdJZloxcYm
	1E46HAjYohF0bgJpxj6/A3tvT75v4bGsfa1mTssWN0Ce62ZZbvRMYPBw5vNUL5i6
	eakOoYJaiuu1rBi3jjf01tXi8Ry8cELlkRZC9TsZvD2HYOU/bssjqYHLNew==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t29r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:33:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234a102faa3so8610405ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148391; x=1749753191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtgSsqvS9NGlueSPRpKpNF02UHsYVqSrf4yaa+KHu3E=;
        b=ByR/a8KLIEsRJPeFtnKJCrysVy6G1zmp/9ETSbosH/BZWKDserpqDaDnfFnMD8CCwf
         iT4WbKQgsFxXrryHg8/ZKquPQCv8vfuhbm3mtdQ7y2EPAGXyms1/9MTc7tmHaiYPFSqI
         4AUkfUJ+UlwxQBj5hwAMWiyCcLku+w1kIYbCipZhXZWlf44LVJ3UMFZFKKI8o7pg5YlF
         Sx1BFtrUPUKBI5ZxhxRE1g9Mf+A3PqWxRNKiZ17EXgWyyhJjTDPRVPY2QppUEJOa2v57
         ZsL/1JfjmFeaYfosw/RjR2MkxvhCiXj70dali1fmYI06Kj5rz838S1RJRceMTG7BeCFJ
         N3xg==
X-Forwarded-Encrypted: i=1; AJvYcCVrY9AnCt8OOI9PKZERd1QoxmlGHyy39X3URcxpKucR0hsvOyLVyFMXEGdrafNLhq6AyFULzgMymcwIUTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTQyQ5znytNJaVqw1AIJ+TQ8OszTuH3mXqDfQdKNPba/Tosd1N
	KN0frUEnNp6zD/MwUAcbhLqobREMrp44N8AlVpbt7VcaGLyf/CIvfU7RX5Ezo6WD7ZTM8m5RTp3
	WIVDVmI0wt3FsN3LeZ4EPM6kyTuBpV9+yUnlhEeYpPtqrjDiCt3xtcAqFVaLUeib5tAw=
X-Gm-Gg: ASbGncs9YZu5rD5pxaS5Bhy1tAJRpIRS+HZmeeRb2h5TCXNDPP7kKy5gqL4VOIXHfp/
	8Z+UHK1AQUK2Nu3aymmehLHgsUxbOnj/WWgJw1z50SwUM70l4kKem+JaznoQveW2fbhJuelevAy
	/5VatroBAcTcfkfw8hFRoyOzHV/+HA/xV3tT/kWTHjfUbTIC9dUOThei4nayx0BVN57tYqJUPa/
	nzE7YJTx227WE0ab3bXLwdbxhGq/IpsD8v78aMKyPn4JNgDtc9m4YzEYhJgbe8h+x9j7Qp/Wktn
	ZVZsNBrPGdnCez/dN3RiUg==
X-Received: by 2002:a17:902:ecd0:b0:234:d7c5:a0ea with SMTP id d9443c01a7336-23601e76032mr5573215ad.24.1749148390881;
        Thu, 05 Jun 2025 11:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOxX7OAxfRTU4dE4awOTuujPdjFcN3dyi4/iEto+JK4TWIehfBEilrFztqx0wPx+KLj25mqA==
X-Received: by 2002:a17:902:ecd0:b0:234:d7c5:a0ea with SMTP id d9443c01a7336-23601e76032mr5572585ad.24.1749148390362;
        Thu, 05 Jun 2025 11:33:10 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd3407sm122902075ad.141.2025.06.05.11.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:09 -0700 (PDT)
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
Subject: [PATCH v6 30/40] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Thu,  5 Jun 2025 11:29:15 -0700
Message-ID: <20250605183111.163594-31-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=6841e2e7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=MLfKQGWeMraaM-6YArcA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NCBTYWx0ZWRfX/8kH9c/k5+jQ
 AzmXHW4jBIzXAaUk4Stpe9OAp4Oqts7vbJcMYsXj42KL2QFKJeEVQdVzewCnLE437/JDUYPArNJ
 L9HucMFVlEJLhr97WsF1gBWm78fJBsVFtkeO7C3CtmyI7yVnJpljkxSdS8Tvq/canNgtydIjR13
 7BWK+psPOEtk8cTopwaS4D6HLkBez2zXZdcUZgQ8kSlgMdbYqjHEUgkv0cLP1SWa2iZ/uRJqgiw
 rFfMAIgktSkRuUcuzIQx9NdPY4Gcb+aQv0wjMHSpiMGoIJSB/OVVVxa6eVw1e5kgGNI083/zzAB
 ynVTUfWm1ZEHIinPCFyZPVsRIiM+E3oICV/uZIH058unn3/TocbySctluEthrY1bq3LXWZeADq1
 bwpiodIjjGY2nCmsWwvs8TSAHjdZJHhd2UArt3lHxacuNoyok7f8jL1CjHmp77pRUN/MiScz
X-Proofpoint-GUID: _Skhj8bEU4YP1S3zFxaDHO381cGv-zcQ
X-Proofpoint-ORIG-GUID: _Skhj8bEU4YP1S3zFxaDHO381cGv-zcQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=989 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050164

From: Rob Clark <robdclark@chromium.org>

With user managed VMs and multiple queues, it is in theory possible to
trigger map/unmap errors.  These will (in a later patch) mark the VM as
unusable.  But we want to tell the io-pgtable helpers not to spam the
log.  In addition, in the unmap path, we don't want to bail early from
the unmap, to ensure we don't leave some dangling pages mapped.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c       | 23 ++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_mmu.h         |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f0e37733c65d..83fba02ca1df 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2267,7 +2267,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu);
+	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu, kernel_managed);
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 756bd55ee94f..1c068592f9e9 100644
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
index c874852b7331..c70c71fb1a4a 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -52,7 +52,7 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 	mmu->handler = handler;
 }
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed);
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 			       int *asid);
-- 
2.49.0

