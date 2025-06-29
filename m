Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C86E248F7D
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228208; cv=none; b=YRJZF4e3jrrGx1EhPhIZnr2U1OGPgfeGcV59ygLpcbFEHTHU32OyRAIyZSEUzHDss50XzXqj1sGK5qXxWvIUZf0OEQamoMufgqodVWvok5SosRN5jlXV09qy+R8lduFQAvvvD9bA0GLgmDHK3ZEy9hWfmA8wWvYT0wsa4Y8esWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228208; c=relaxed/simple;
	bh=N5h9QxX939KWcmj2LnrrApRV3L5jzVSUkXnQ9YEPILQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T+zk652xxgKdyHmTjvaFnQslEgxK3IyU5N9dcrtS07u8kO5Odpr7SgUodk7Bhc3Duktwu2j183UKQKh7EcR5ng1I/Z3QGvYaarVWEOxYLTfozZcyYz1vLnqUgFalamo8ZGrXnjE/y4SbkQ8tKiCtwuFC1NZpMrg5hqOgsUloZ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glr7MuR0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glr7MuR0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJoPBE020133
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JinTH7RBpIn
	edICQ29N4Lhfv00Y7qC0FBgXZnvj/oGw=; b=glr7MuR0iDjTP1Qad76TT0dZOhC
	Oz0QaszL/ho6mDpnn1Lz03vcRW4JieI2oqBHEEBDdvowscqQZB1pdc+AA0ZsCJuQ
	gSEElOXooyIsLx0LKOvjpyIr2uY2yYESKIz9PfVKkAniJOVgBl3lpVqV1A8OJZ8m
	7MP2RLIwdpLcz7W3OEWLdFS41tq/o6kyTiuHb0uEwaouMJKrfgXKJCn1RDYvptyh
	boXe3Dmp6grslAEtXfbL7Q/F+4+ok2P0YMh/VnGts40ghNX6yZUfaeeEMd8wTavh
	uRuxza1YPfOQIeNxe6cX7yXxqWdkD3fZH+f5AGgTcfLQaF+BiwaUnRwofjQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2mt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748efefedb5so4786690b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228204; x=1751833004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JinTH7RBpInedICQ29N4Lhfv00Y7qC0FBgXZnvj/oGw=;
        b=JkwNT+SNYzjtOSKBhQz1XAnQS0Ffv4qdNtvxJ+L8KI/jK1wJ1tjGoCaAxyIA+DRJ7l
         0kCJbnL3y3EDUM5cvspB+U0WOcY8+JDy3Q0DyXlkDrkUGrWUEVQ1SBDtntnwnNg4iAmc
         WxXbIG5a2svqB0PIXYHDGTo1nzNABmEoUNVUM7y1hlEQXzDWnA2UDSdeKxsBrmn4zb2W
         +7BrB8SjTxvwyHBaKoFxG9ozNVK4nF+J6ixJxNCyKO6l+ENUAhHKQ8MEBfooULQPyWxf
         +6bfmMOm0n+i3Qa2I1YDbhbpefbC/Ltx/Vx7bKAkqL+BSOnQrHMI5d+SEQVr1chDDOMo
         BXOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYz/dPUzvnPfnCzdwBnrh76BEPG7oxxYnVrO0NSBQx7YyISBHjdPVuqtneNP4KXPj+aU+JCXNaOJkLH7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YziyPELnBiD1fFxRkcUAE82SfmyeGeiS5w9X/jD9xSfLyj4OnGJ
	QZImdzKVxizAehXueQ5sCHxMZtYDfxrD/m5LzuzYgueJ+qP5jBmyn+3+RsVLR4UEVVR91JlovJx
	IMN2yt9JptYy6FmyayARnGJLysdjUy6fK2tmFkUVoqMRZiHpWZfc+B6a0XFguDNXuFlw=
X-Gm-Gg: ASbGnct82BFlmLHKfVLIhmpLuHFbE4ihn8Z39PNxP037e3O5ErOuGpZF6dkek+2nGMd
	YsqMSJZeyp7ZObQtBa8r2x7qEzhfv6VlPQmSQQGH1CXbt+Ncz8Uc0CivSiad+d1YvH3CwwHJFo5
	zhBQrBfoaYI6oSuJL+vmtQwyyBNQJv8mv4xXOWI+/BH5lwe6Z5dXso2NrMZOW9oGzgQtWXBalRf
	Q6bjaqXfYlcimnS6DYLPxUeoMx7+YIKA8jZGIFU+JsKy17DfaeqLvVLmOXFP1fyi5y0sq/jGVCc
	NFRlSMmm75vYrRyUsxzHjla1HDv2PVdVqg==
X-Received: by 2002:a05:6a00:4b11:b0:749:93d:b098 with SMTP id d2e1a72fcca58-74af6fd7312mr13757422b3a.22.1751228203651;
        Sun, 29 Jun 2025 13:16:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk7ORGHzSfU2DSxnHutHKKkh9bC7DWJEiEZd1kyNe53DB3/eUhy7wAbVuq/qFosk61gf5b5g==
X-Received: by 2002:a05:6a00:4b11:b0:749:93d:b098 with SMTP id d2e1a72fcca58-74af6fd7312mr13757395b3a.22.1751228203166;
        Sun, 29 Jun 2025 13:16:43 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541bd1fsm6998630b3a.47.2025.06.29.13.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:42 -0700 (PDT)
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
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 18/42] drm/msm: Add PRR support
Date: Sun, 29 Jun 2025 13:13:01 -0700
Message-ID: <20250629201530.25775-19-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68619f2d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=m2jltaIWnU9X2HFGTMUA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: zIxB2YB2E2D0T5NzvfEf7_1c4dbmhOUX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXwbkWpK2P9Gnf
 jrmRJflvAOO7FET1qNoRsCTggvjIBEdm9VPNpg2l+n+n9z8lm4FSKqAujBJAHiHVPfrEEXp/N2X
 WuUwU+dXWfeVpRSVye6ywzWGIrRUoB9ZIETuxy/MWMAqDnWWYdwNoPLgdGTv6IDuRPZ2jJXHz4Y
 LJs9eB7/KKN5e8rvxoK4JxzTqbbS78ki/lyLJAzBDbl+Ab3mhyJhKt+nN+PnSXzrL1J7Y41R14c
 HYV1SffMpD74cXE0pysuQWN0ebnh2zeQI5Ke6gKff2b2HPWTb3adnH3OBU1FS5cRdO4n7TNvZUd
 cIG0ullGUln3es1HJSvjXCw4nhNm0iuZRWI3qXuJTsJzjapMbcl64pvEBWZGAwWaLm0Hn29vHlK
 ymmpFRzq0gcCJPuTEDFWNfLv8dG8c3u2RWjJWSeU5tE1LHSCqFvKPJpV6OQsyBmZ5OeX7wes
X-Proofpoint-GUID: zIxB2YB2E2D0T5NzvfEf7_1c4dbmhOUX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

Add PRR (Partial Resident Region) is a bypass address which make GPU
writes go to /dev/null and reads return zero.  This is used to implement
vulkan sparse residency.

To support PRR/NULL mappings, we allocate a page to reserve a physical
address which we know will not be used as part of a GEM object, and
configure the SMMU to use this address for PRR/NULL mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++
 drivers/gpu/drm/msm/msm_iommu.c         | 62 ++++++++++++++++++++++++-
 include/uapi/drm/msm_drm.h              |  2 +
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 676fc078d545..12bf39c0516c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -357,6 +357,13 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
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
@@ -440,6 +447,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
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
index 3c2eb59bfd49..a0c74ecdb11b 100644
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
2.50.0

