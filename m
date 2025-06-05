Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19CA27FD71
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148376; cv=none; b=TK6SSbqPw3NH2ecd2YOEnHlMZkYoCFMFCn9/PWFJX/qwO/wC0K2ifUL7DnA48+BGHscxNxgKHjnggN1nutgdsVcK3Z0P6t87Nnib/sk0Zj8hB+pdRYfNGkl5EbOLUSS9Vl93ZQsZp9nECViH/Gq8ZLxIvC7LJnSIzh1gEsHB81Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148376; c=relaxed/simple;
	bh=1DeDF0ar0bWjHYOdiDm1icJLnBGNeW7jU5ESThe4AlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AcH8KKw+Z2uptuYaiferWkQgkLAhUPGaWWppYIEpTnuI3Nkgv89gWowQGJVxk3ZLkPPuUqYja1R1stFvU+2ODWFOUPJVqW/DvM5yySsMRxUxURlWg7aJw3XlP5A+gpg4J9vqcXlpUjGkjmzhweKegh75ViPGHJOjHsWH+NFHtfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXfPX0d6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXfPX0d6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5559kgBa014378
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3u7saZqSf9v
	I7fV2Qhb933URL/6xLtZCDgVKJFmz8jc=; b=fXfPX0d6PaVGIBJgExovILPPK6D
	4Z3RwxgfsjKXQxaNjqbCUG7u2YaYqS7eBEK0DZT7vlZ7BAtBFov6m4zWNkp98Cyy
	iVCic8TFb6pc+wPgE5EJa6KWQaqxm6N2SGe/xbZSKb0P7OFJWw0emJJCBoiGKqhg
	3FNhH979z7fcSO2ciTpLTEljwwm70wa6Es3TNLyunn9OoYZj1iucP6KGtst2PbpX
	hQA+/L85wUnlfG/cMu0tdpyHz6NG3YAujuXVn73DiAfxdNX+7xF3x/B79055yf3a
	GAnkwYn2AGtj5anXDvi8ghLavu4RXIwP5PhkSGjWzkN2UOnthztJH7jkgMQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be8619a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:32:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311d067b3faso2252981a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148372; x=1749753172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3u7saZqSf9vI7fV2Qhb933URL/6xLtZCDgVKJFmz8jc=;
        b=D6hc7epJroLqIfc3GEi2/cfcOgTO17QDBdb/Oc3/sdDA1PKsuUfUjXiXINb2sQcifL
         BmvqI4i/nK7LAcFIk4gTpU/cIDDKXY8diZ+sgM2171+NqxVPHNwm/yAfC3cXd3i/MUbc
         JtLFqUfSN8isPuc9EozOnkqV3y5PxvV5xtdph0juWKvZ6ZBjeqWZVtxUo9vYGxvyvOzI
         Qpls/0pH/WaI9CvlxLX7VOKNwUaZLRHSoebUzjKEXiJrLTMBfALK1AZrWEdyHHJE2E2h
         2OHISDH7mONNxipC7xT3s0T4DDX53QOcFPhSTl1RGjW69rtyRgkD74il8qRRGYdzyaP5
         y8ng==
X-Forwarded-Encrypted: i=1; AJvYcCXbtoEPS5/kTeKWJa2ggIO49OffLH2hlAMapnROzkpP72yWxOCF6wEpEzDKD5fyg2I7JC0ah/p8CfU7J6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlYGWMWpd8BDpb73BAVcg3vKbQikfxpoJAmXsqZStsUaTLagNx
	4+/DLak0mBZWbZMHgeh4tre3nPzySJONjrawnLN3lJIwgFeRbEcFnTpoclTvCFS5aW96GLstunj
	Rd67fvrRukiJpdJg+zZbzzYJakLbQje+IiR8SYLBUahNoRI60cG5Q7h/jwWuFXvmB6rrwbycZdP
	o=
X-Gm-Gg: ASbGncs3mGROnQeTN49xAOo2gDl5zU//vh46J7XLFFzTAHFjqK8gEFC/+Uu44fp41Lw
	5WKq+DlpxONs8iNW2EQl9uUtEAJbMFZ/XQtErUygelw0EicHCZJ5oeZerbDWIRfv3Sgb87Vj1Z8
	HndXCIxmwNCKKPl/ACqAFza+X7wsl2qi4j5Hpwemxx8ZN6bbPDNaEpI23fGmJnNJ13fk7FhtCG/
	LZsbPcguLVfXJrPc5okOi2LD42PLhVBRip9CjTGj9PKDOvwZd8zIgLZQeCmFalpK7z86FI6LqrH
	yyck5zy5mm1BwZummkwOKQ==
X-Received: by 2002:a17:90b:4e83:b0:312:f54e:ba28 with SMTP id 98e67ed59e1d1-31347057c9amr1124725a91.24.1749148371737;
        Thu, 05 Jun 2025 11:32:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf8XXJ8Mf/VVr/G14I6Dua2+GHn6PtLKJaQTP4schM9Oyz0kgDx0QvXZTk1AeUyR9rUESodA==
X-Received: by 2002:a17:90b:4e83:b0:312:f54e:ba28 with SMTP id 98e67ed59e1d1-31347057c9amr1124675a91.24.1749148371293;
        Thu, 05 Jun 2025 11:32:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fe0048sm59361a91.42.2025.06.05.11.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:50 -0700 (PDT)
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
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 16/40] drm/msm: Add PRR support
Date: Thu,  5 Jun 2025 11:29:01 -0700
Message-ID: <20250605183111.163594-17-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=6841e2d4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=m2jltaIWnU9X2HFGTMUA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: qgnNLHaGjlhvjcXBR5Cx5GjU7RroLKwi
X-Proofpoint-ORIG-GUID: qgnNLHaGjlhvjcXBR5Cx5GjU7RroLKwi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX0QkNFxxkbcFD
 gQwd4wFwqWK6l91sLVDUwsqHtHhbYQshwxtaNhbMLMTIEN3HsUouFrC2zGs0T0pjBjIvNJFpIDp
 Epj+dkzFr9+2+L2Kh0lhvGJXleC84K7fBVeOimFNj+upmCw9eeKPKmvd36M3GU3z6X++lEAJBw6
 ybhbvDt6YT+RrN9SQZLzB5IdKKlXAVL2brSs3g8Yploj1PszBiPSjjUC5aFtubT1CMMdJjDVafG
 SZH6puj1XPnmBDr6O+zFA+0Ju09pf4C10jKvmd9YEJ6bIQ9mvKz5NSLxMcRUjRgEIwSKAATRIAI
 WOlZO3gsYwYNMt0xA9Vc8Efgp4Z/pHs17bduSD20oHeZqxL341svWgZXCSm0w2uogKvO/vdZkjg
 /Ngl3tvWkgJQ7NYauXZQtothaTvVpqsP7kU1qLz42QlScyMVBFg7IvpP5lA/Szwg6mFwcy4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165

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

