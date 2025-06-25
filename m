Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2162ED85B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877934; cv=none; b=SAiB8F3gUxTPt5NyCydaZuIJPBT/T/Hp/GnVvDhaAkjwGT/RRw8G4aPIq42IuRraNZd9f1nxuLiMhIiyt/S9CywdAmaUi8e4D8DMGKFqOyrM2A36PaW/Iwsy+fGFomfHodujbZwQxkDfTPGj6iDFcq1scC7V/WFUGiFxMO7q4jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877934; c=relaxed/simple;
	bh=1DeDF0ar0bWjHYOdiDm1icJLnBGNeW7jU5ESThe4AlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sWY2JFNfatNh2x+4Qff0K9guB6d9yAPnVx8EfUvs2O7p8gXLV5TkZ5sDs5oR2jGGeVG2hT2MDOdgVW6ROUHwDFNooEk/5cz0ueG+MJHFB0Ma3q/oyc7wKJVGQL1HoI3WCxxlAThc7AC8XxQAUAYEjYcYeCMDZ13m6CqCMP053dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSND3PA1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSND3PA1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PIf0Oa031883
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3u7saZqSf9v
	I7fV2Qhb933URL/6xLtZCDgVKJFmz8jc=; b=hSND3PA1MWB8KK7yxEeVOXw6Vax
	8yFAQJwhT8Ey5lfeV75HT2BnWSVZ8fOo31cQu76cCGsqo9GrkhxWaJSu/PMp1T/E
	SwiU1JqQvlxyrp9xpqsuo5YRKsE3QKdnhtZ3dbriTwjsPxK5/CCUsqfUYLO3iHdY
	2e2Y4IEpKZPt34C4vuZWBMDz+4rqqsRm7LoLiS+VDrf49h88eDB2rwacSt9zxkdg
	wxhLL3UgZJFt8q5HvZ6LfaztH5A24ra73z+rPL1Lt7sLmHz4bEDTu/RSEryeAfN8
	MOgj9wCdIQUBRHYLBttgW/B4yC9CNDlT5cnivmpS3v9cVTYPSIPhCzfBIJw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b40s2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23494a515e3so1395095ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877930; x=1751482730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3u7saZqSf9vI7fV2Qhb933URL/6xLtZCDgVKJFmz8jc=;
        b=eIDVfRbiMo/ZQjkvZO9tR3WrM49xcXBGT6XJTgPwKfXBCyAuZFwrnT8yqJnYj4dxDj
         FLuOFfgFByM6q69M+KvGRZRNS2JVhcCno7HaQUS4l6thM3+yKraCiz3Ip/pC1fZU+beF
         7UXapeillZe/W/eCaZHORyrBCEy93gLEaDSQVUKZJcOEO2PMbyngtubfDt83I1u7fwMC
         J24fwYyyZQfMFK7yJwMtln27go/UFT4tsrJ345Ee8E1XtbGTuFMefbA6IXEhuSWl3sxr
         SDRq+cAGYfZMR+NN6NcSLvf4qsZxYgi3BnTd2XamIolJqAFcTmkoRJ+XXlB1FIqXL0l5
         TNPA==
X-Forwarded-Encrypted: i=1; AJvYcCWTT6dASznL0YA8lfAAKEzLcJHHfndURHEAzA8HZHhASLIamqpBsJQHk0Se4GcJPqFIZ265l5yU9exUs9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcvfJXHi+3hRcOu6D8vLAnYUHJSaXNrwS6KwgXOlnm/lwUtsBl
	RzFJ+ZPBE8nDwE7x1nmgfu+yUBRS+q+kEgjYVzCB5harlO+QrnVI+A9ieKbm2lvaSZOSlxQERxI
	o+rmD853PxcEqGQeJ5fRsB6xICPab4IvfyPztUD8KgF6xvBXhFNmRkVWcXln+9n3SyVU=
X-Gm-Gg: ASbGncsg/mG+wA6WLI5VIqI+uUPlOTm+ZyxzrRdMrw6eTPVvYgaQUr5cxBitzZbBEKK
	A7ZAEO66zmOdgBJAFSBCrCBm5R2+B7/NM0MmOdB53UeeGOEYKyiUuKVTyW4tI5fsXdGXruvtfBc
	uNOUnfyWgDjyxLNqIGqCn87Ne2Z7TaWwbTHDmi9K7fZQ+dBM9Cms+YXgvI+SFk2Zn4lBgisHgSx
	9+fLf+VOBUtqbHAl7TkXC1K+t2lOGQnrA21PLzT+yRf7E2lCxJ13O0WUA1J9RYEnUXby2ssToOc
	3h//8FRpVmpAo2sUHs5uhSTM6DtuEBKh
X-Received: by 2002:a17:903:41c1:b0:233:d1e6:4d12 with SMTP id d9443c01a7336-238c8720354mr9760155ad.13.1750877930263;
        Wed, 25 Jun 2025 11:58:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8kz0ofYLy2QZ4Xfb5MD01YYNXHJp5HPzUqB6F1lr7GMPXi2DikFC/+7Q83W53JHLLXjlYkg==
X-Received: by 2002:a17:903:41c1:b0:233:d1e6:4d12 with SMTP id d9443c01a7336-238c8720354mr9759805ad.13.1750877929826;
        Wed, 25 Jun 2025 11:58:49 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393440sm143372875ad.35.2025.06.25.11.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:49 -0700 (PDT)
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
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 18/42] drm/msm: Add PRR support
Date: Wed, 25 Jun 2025 11:47:11 -0700
Message-ID: <20250625184918.124608-19-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX8O2VB109r4PJ
 L6SVRA+YguIPlOWEXS6rsEDvbhKwyjtMCdlWSay3ZF5k45QniFQLPGTzYag7UCYBYDCt3P4pMW/
 TyPtPsbxFpv/0mNEVH81tlDu1r+avMLg2ayGbjUYsJHfk1Vn3xtRS4Hdm4lCAJ14a8o8R2/vlD3
 4/5iPPUoUAGrBq0PLOhb+4t8ngc4sIAVH8YZ2kGJcSWGWuZpn0HtoRcJ5GrNx62POTMPmc8Z/tG
 cIOuABmq+IxVMBif3QWpglRKApMVf+89+rxpYn3ZJ9Dn6oKO/dqEQFHktQgTQBM2qwUiNlnyAjj
 t/lMhJ2AdLYR9D3dPnLuKAQwr+IuYU5Xlw3faqbIDbzNDxy7o6pyxvAko+aJna61h5GX+v+1N3D
 uTrX1Xa4tKJvmzvZ6JhZbeIFirPG7saXULYGIrlietkQnXQp9Z/5RBfTEX4GUc8ha0kdi/wK
X-Proofpoint-ORIG-GUID: eYAafoOe5GpmJE41GfIOp1_b4REjMMlI
X-Proofpoint-GUID: eYAafoOe5GpmJE41GfIOp1_b4REjMMlI
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685c46eb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=m2jltaIWnU9X2HFGTMUA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

Add PRR (Partial Resident Region) is a bypass address which make GPU
writes go to /dev/null and reads return zero.  This is used to implement
vulkan sparse residency.

To support PRR/NULL mappings, we allocate a page to reserve a physical
address which we know will not be used as part of a GEM object, and
configure the SMMU to use this address for PRR/NULL mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++
 drivers/gpu/drm/msm/msm_iommu.c         | 62 ++++++++++++++++++++++++-
 include/uapi/drm/msm_drm.h              |  2 +
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f6624a246694..e24f627daf37 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -361,6 +361,13 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	return 0;
 }
 
+static bool
+adreno_smmu_has_prr(struct msm_gpu *gpu)
+{
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(&gpu->pdev->dev);
+	return adreno_smmu && adreno_smmu->set_prr_addr;
+}
+
 int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len)
 {
@@ -444,6 +451,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 	case MSM_PARAM_UCHE_TRAP_BASE:
 		*value = adreno_gpu->uche_trap_base;
 		return 0;
+	case MSM_PARAM_HAS_PRR:
+		*value = adreno_smmu_has_prr(gpu);
+		return 0;
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 2fd48e66bc98..756bd55ee94f 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -13,6 +13,7 @@ struct msm_iommu {
 	struct msm_mmu base;
 	struct iommu_domain *domain;
 	atomic_t pagetables;
+	struct page *prr_page;
 };
 
 #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
@@ -112,6 +113,36 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 	return (size == 0) ? 0 : -EINVAL;
 }
 
+static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	struct msm_iommu *iommu = to_msm_iommu(pagetable->parent);
+	phys_addr_t phys = page_to_phys(iommu->prr_page);
+	u64 addr = iova;
+
+	while (len) {
+		size_t mapped = 0;
+		size_t size = PAGE_SIZE;
+		int ret;
+
+		ret = ops->map_pages(ops, addr, phys, size, 1, prot, GFP_KERNEL, &mapped);
+
+		/* map_pages could fail after mapping some of the pages,
+		 * so update the counters before error handling.
+		 */
+		addr += mapped;
+		len  -= mapped;
+
+		if (ret) {
+			msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 				   struct sg_table *sgt, size_t off, size_t len,
 				   int prot)
@@ -122,6 +153,9 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 	u64 addr = iova;
 	unsigned int i;
 
+	if (!sgt)
+		return msm_iommu_pagetable_map_prr(mmu, iova, len, prot);
+
 	for_each_sgtable_sg(sgt, sg, i) {
 		size_t size = sg->length;
 		phys_addr_t phys = sg_phys(sg);
@@ -177,9 +211,16 @@ static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
 	 * If this is the last attached pagetable for the parent,
 	 * disable TTBR0 in the arm-smmu driver
 	 */
-	if (atomic_dec_return(&iommu->pagetables) == 0)
+	if (atomic_dec_return(&iommu->pagetables) == 0) {
 		adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, NULL);
 
+		if (adreno_smmu->set_prr_bit) {
+			adreno_smmu->set_prr_bit(adreno_smmu->cookie, false);
+			__free_page(iommu->prr_page);
+			iommu->prr_page = NULL;
+		}
+	}
+
 	free_io_pgtable_ops(pagetable->pgtbl_ops);
 	kfree(pagetable);
 }
@@ -336,6 +377,25 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 			kfree(pagetable);
 			return ERR_PTR(ret);
 		}
+
+		BUG_ON(iommu->prr_page);
+		if (adreno_smmu->set_prr_bit) {
+			/*
+			 * We need a zero'd page for two reasons:
+			 *
+			 * 1) Reserve a known physical address to use when
+			 *    mapping NULL / sparsely resident regions
+			 * 2) Read back zero
+			 *
+			 * It appears the hw drops writes to the PRR region
+			 * on the floor, but reads actually return whatever
+			 * is in the PRR page.
+			 */
+			iommu->prr_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+			adreno_smmu->set_prr_addr(adreno_smmu->cookie,
+						  page_to_phys(iommu->prr_page));
+			adreno_smmu->set_prr_bit(adreno_smmu->cookie, true);
+		}
 	}
 
 	/* Needed later for TLB flush */
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 2342cb90857e..5bc5e4526ccf 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -91,6 +91,8 @@ struct drm_msm_timespec {
 #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
 #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
 #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
+/* PRR (Partially Resident Region) is required for sparse residency: */
+#define MSM_PARAM_HAS_PRR    0x15  /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.49.0

