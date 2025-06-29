Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DBD229B23
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206091; cv=none; b=n6wXSHjSZkw493W+7rucVM80SrCqX3DrdysJOTIZec2XttHVA9DbNBKKMBu3MhVw1nWEpvL0ZQoXhGaVXR8kkSiLbiBPBFLXtNDX0sdYtd4syg+sSXifyoWcsdPFvPyI6vH6Cug+hde+Vvmw4lUXw3XM3JSGMaT9f+vD3Qhx97o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206091; c=relaxed/simple;
	bh=Ci4tiURPEN3fgQgUAfKfwBL/Zz+rrpzlouAnx0HAJyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPTNP24g/prJ9EUXG0iVTWXD7wzI4YQm9lndJI1ThyEwaVo2VWLYvwjzHaBossh6hey2ugXnwiU59B6smG4YZ4sUvHtWQwd8aXJ3XMK/jodZB9zKtISbtLIO/niC70MnlNau1w0hbNHBKzrp3sD+rFI53fAe0hvJsjh2gZtOqfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZSmCBvG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZSmCBvG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDM1fV015173
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+3e0ksDzZ42
	mLlKJB4uSylL2Fh/ag708LB47aoZZ0mw=; b=VZSmCBvGgZjdmydzwZ5DBStUTGQ
	UV9Wqke/L28Nva2w5HQeQ3RLj3WtxSH4mPGU6WroNOAwfG1uLj55alMN/mx4iMXm
	qvFYN3RLYlRlCfYnGVxxWXrd9fGaBDkp7v7Kh1Xyd9PlSN5RAOdM3iU1dgHCD0X+
	Pnk6U09kU0/VB8JRQe/Qq/dQzBBOLTzipDnqWv1jTD0Cn4wExz7pe+R8To0OI9xr
	QMOw51Uw38FgQOHZa4i5qICMDKEdiKn+uDSImuwBabTtDDG9y4R9EVAd0j/d0Oa9
	mS5xLpkclwaY0KidVBIhUAd08jjCo6kueta+FSzce9iPHLitVfP5tXdON3A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2854-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b321087b1cdso2072453a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206088; x=1751810888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3e0ksDzZ42mLlKJB4uSylL2Fh/ag708LB47aoZZ0mw=;
        b=ZHRJVRkyKV5fs5R3r40Z2yfBdJy/TOCTxOncDds1YYrm5SCrWvVtOfmau26jLfLTF5
         cr9GuTMo7jsmc7DDOV0Zz/0xFMo4m6gkwa/jC7Dn3ndoKv1ExvJIYD2b7pexoQT7C8a3
         oZYw33A2ZplzbvVLvmML0puq9i1pYp5eWOO1798xjT51Oeb+b//CE/ZsUB5iga72pGOQ
         msSJN2cDjJM1H32y/WiYzpgCt2RzUJPgSRK06vIlfuaXmN3kmc8OF2eryo3GqERM+dcz
         pHluTCWIolio+lLeV7seTsku7u+74HSpS2Zquv3mf+M1l3hkw5mr+bZtNR0CMvPQ1jpg
         FdhA==
X-Forwarded-Encrypted: i=1; AJvYcCU03aA4S16uPEuXqrS/Taw8s8YgLMKx0VoUa3BRHa1i2hqYuqD0DFyFbEJcDJgXhoXg1icAGv3Np3c8FEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBEixP+nnYhnh/RGG1fiCJ9XEkbJPRHKNGV/1a4miq3HvtcT03
	qSpqcu0JU+2gzvaTMVDR1ybIembnF5G215a4s7BlDA/p96QEWeiDdYtS3qe9qD/reP7QcnkDZTo
	QkVOV3FE7rECeAQLjQl9YPY7cCxKatYs8s95aYKKUbOyrWcSzUwK/C+Qf6QgnwgHUr9o=
X-Gm-Gg: ASbGncvdQFcIeVK/q6gJIacIESZD4psyG9QYpZfdgo3rVonY7h9FFuL6xOGOVHrbJ3l
	XZ77jCLHjMGTka5h9XQCTVOX064yf/qxnBa8pXzSP8Fh3ZmpGMo9iybomJRLI8i2WNQieiM0P0G
	Gav0q1i1OXexX3I1beY98wLaM4DqDBiY8UZkwDFkHW8iy4Mk998W82RtOOyRTiaK5FRicCHAnsL
	Fl13fRMbDMJ8JAdeoZtUjI/u2zaAg7gqkoyMStAAxf0Z8oypoDcpfYALT7I1OpKrCyf021VEJFW
	dMHNrpQdQeUrTpjGhkcPNWV1XX2MJsji
X-Received: by 2002:a17:90b:4a8e:b0:311:e5b2:356b with SMTP id 98e67ed59e1d1-318c8eed32amr14074249a91.11.1751206087602;
        Sun, 29 Jun 2025 07:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYkvmCpaWJmCDoX/uhVGt0Pk6ICFtUgsS6BHNOC2nwdb/Xmkyt9dsqSqbLYw4AbYMUQq+a2w==
X-Received: by 2002:a17:90b:4a8e:b0:311:e5b2:356b with SMTP id 98e67ed59e1d1-318c8eed32amr14074204a91.11.1751206087057;
        Sun, 29 Jun 2025 07:08:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bc7dsm59102335ad.114.2025.06.29.07.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:08:06 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v8 32/42] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Sun, 29 Jun 2025 07:03:35 -0700
Message-ID: <20250629140537.30850-33-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=686148c8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MLfKQGWeMraaM-6YArcA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Aevpeugd0LROh2KcPwEhoEoeXooqldC8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX2mkWYeQDt/Gr
 PjcdkGaCNifyPKldSmtCHsQG6l5ZJ49DO0w5/JWADwY2JqAJyvdX+C+rurCwMLx68iJ40oApBkR
 WNpDOxwRGzlXhYC9oQQoUmfQ7e596TeI7sWEtvaMEd0kIV7b/z0fy3Tm1oAo73BjuJetHG8fPAP
 6nWPJiNr0Qkq6a8DkIpGrV4X7Tf2Fkj5OodDa6OrBDcOHHQF0VDr+fQrbtuj4UzGZeUZS0MKXT5
 1R23xYDxiRAUVre0/agTgdNu6bMrMG1+1olvZ1HoFlRqxnuCLkh06IIrE0N0WaI816vm+dDPdi1
 R0QYH6mPRO1MYQW4mgSfp31DPy5StvvhtamVv+eZRr+U7+xkOkKR/5oaMB4ZsQqS0zaPg42DB1L
 GHbmSA5ro00zFc5Z8yQvOTZq6BnfbOCRFoGRnro6qqjKJHeKU7oSObdvcvG4beXedWejAiAm
X-Proofpoint-GUID: Aevpeugd0LROh2KcPwEhoEoeXooqldC8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=981
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119

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

