Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EE5244699
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206094; cv=none; b=FFyFa/WWpVBR8krNEVl84QGtszutcNa593x4mYXfJXNI92Zm5t+nrb25z8jZdFL+Xq6GO66FEySw3HeutaMYb9llmxE/I1LPuHhUYpRwsZ9lQMNKw2oSzOvtT5aX3PH3B+KgxSQm7FkqMA8tNrD2QPS4SO5VkxDblbHnCVuGjgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206094; c=relaxed/simple;
	bh=MPo1IkqWJ2Qo6U6FxPeDsi41WXUD+qgCx9wi/nJZ6nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6i5oszGrJPQnrZppsKDdYKg1bWOyn0+122uvbhZmet8KMBBwrQkXkY8D5o5A6KNLDt92Yxt31MP6z25Z604+XBWvxO0WAlXKtKYT6h6CcxzSt6wYlODYhUwnxmTh1FITjuzEHXs4w80AqwKMCiu2jFBf6YjmjBIw6Io2xvFc/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGaXb+qk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGaXb+qk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T4smQD005857
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A54UdMciCNB
	ls2/cngumRMQ7rIW/ZCmN2ztDtF1NIpw=; b=aGaXb+qkNkHnKCMQbHKywKgHKpR
	BL2wXJ3XgRy9grgSj28Hcaii/GvaLwx1rkb7D25TLzS4Kkbd+NWfXNZ8JmqRmTln
	1MNpAqz9rSWsx+DZwMyjtiugpHICVfVDqAnJHbDw5hVEBRIGuuvYev6R5tjN0Fsx
	SJgauruyd6TvQyv7o1E449TL5Brm8keuQj1CnFAb3b4+yGAec2CJ95auxetRV5e3
	RgY2fmH1m4SgpCpTRkdBGnqsevJ1MjbzGI2Lh+KS4VLJjmUkApCBp/EcXCMTbExF
	1T0Lzb4SNzSGxw1/9t6qsUQtHlPpL1is+Na/THTPn4TCBFGoiXZgPDLA/og==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2eyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74ae13e99d6so3168208b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206090; x=1751810890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A54UdMciCNBls2/cngumRMQ7rIW/ZCmN2ztDtF1NIpw=;
        b=bs33QHYGCGO+9ckdab5jlv5KgIYrzksM9bdQ8s2G7bOdNF9BnfdY+g5ABtS9nWVRje
         E8tgBFex+UOKg5FsU8UzEfnNlxEaWm5aFUucAeFSVhcoCii+aqPjkNCNIdRnaN1eKhrQ
         NCzZUKBiZ9SU1mxhZiri/9TE2L61HoQyejnqJchgG2hnYSLwu61sYeVCYmfHEQX149lt
         sNi/zZ/rI+45q/kDGMSwwWSzlRoK5Si58Oy8YNYGZGS2ybmFSxalPjQnItaElVo4K8q5
         gYLQGwYyvWv0XNJm+QPDiHdEyRBqjPrf11udi7XmVIL4t93Ew3+t3Ns5CmAd9viKcr0K
         KMbA==
X-Forwarded-Encrypted: i=1; AJvYcCWRbyGH9TMpWCiid+4LuZ6C5KD9TWzf3G12oWPCP/oTCszyD6YDYCAvD0kuz+ddFT9XlhVkT0/uhLOUB3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNHkzSL1o74LH3c0d4/atOx00WH56GcD9pJmQUOi8zvLvBlst9
	YjyXJcTSawgBXzRmDO+oVzURcWSHyRuqhnj5gxiR3dRSBv1ora13X0mWPuts9Ez5cLz47d5lJ/I
	rDYGjlPffRWcmEOyk9JEsQ4UwHSSOoHzPwxxFtsYIGKIxMO1FO9FSXTlXVEg/lmigdAc=
X-Gm-Gg: ASbGncs5sLvt5of34tyI10tY9dqacAdK3EVl6to6/N+xdLMpMR+lSsLcSthcoZORj+y
	saA/UqjVRB+BlxOQ7HvfuJ9Ky91DaeMrAXaieNac89oDavGmHVPJK0kFOHlfWxRukzpVo0nfTyE
	sEzCKe3YYqhyk/YJwlZa0+dKWIF9VHQXpXoWzlPO9a/5D+dEH7SZVq0BMH7Jq/mrcwV+9LrZpsJ
	5APfwKH4YfXQ/Pf7a130fHMCfNuHHaA0xsULRZAuC3S6+Vj6T8obBjxfKMiXccNC6Lup5wnpMgR
	iY4nZrTlq1G2SzjxDS6mLii9kwtCPawi
X-Received: by 2002:a05:6a20:2453:b0:21f:53e4:1919 with SMTP id adf61e73a8af0-220a0893979mr18746136637.3.1751206090151;
        Sun, 29 Jun 2025 07:08:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8rwemeeKoXa3dY68CP5crYj0elFksFOZ4WGRjdgo7BPXpcPNprB8m352xNp9ATYbOhE0nUw==
X-Received: by 2002:a05:6a20:2453:b0:21f:53e4:1919 with SMTP id adf61e73a8af0-220a0893979mr18746079637.3.1751206089570;
        Sun, 29 Jun 2025 07:08:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af557b3adsm6718564b3a.106.2025.06.29.07.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:08:09 -0700 (PDT)
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
Subject: [PATCH v8 34/42] drm/msm: Split out map/unmap ops
Date: Sun, 29 Jun 2025 07:03:37 -0700
Message-ID: <20250629140537.30850-35-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: q8Gx0wTQSuWvqYIdLIt5iYBt0G-nB8Qu
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=686148cb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=xxbd-mT8tQbqgF3hF1cA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: q8Gx0wTQSuWvqYIdLIt5iYBt0G-nB8Qu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfXwBZsd+D/93Vn
 BkPIFkocq9TR1aY+f5rQ7zfWp6OVK1iPPO4GXAgN0WUU+LTmgm7st+CoSE0xrI9kfG00lifKQXJ
 mHawNdYaf2AeELdJQ+ckelyX7+5skw+/etksgNWvB1wMVT4APqbDvNtMApsDsB1NNYgqezACL+G
 FOwdSimKQxFmdJAe/dpR1q9V3lIt/PmUjpgf8D9wdBrrJ+G6xd8eItRSpl3BfuNIxEXlZe+MLL3
 tLYdwO/Az0QdLMWMmERFAbREJ6ZQhCuWPi5bzKkGq+QEpax4Vw/zzKrVr+bllp0N6C/KrwzZk9P
 5tdlQVjMpIJeb/+iRVgxmltQJGzuAEI/jSt8G06ht/IOvWT/6NqrW/mvhT4JN25E6oTTt++hzkK
 h1oV96pIKviVQfLhL4b9KPRURY2jX7JyrseNsLK9qtCVTG6IAcRylJfDJ6OyeWtUyjVq7Yhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119

From: Rob Clark <robdclark@chromium.org>

With async VM_BIND, the actual pgtable updates are deferred.
Synchronously, a list of map/unmap ops will be generated, but the
actual pgtable changes are deferred.  To support that, split out
op handlers and change the existing non-VM_BIND paths to use them.

Note in particular, the vma itself may already be destroyed/freed
by the time an UNMAP op runs (or even a MAP op if there is a later
queued UNMAP).  For this reason, the op handlers cannot reference
the vma pointer.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 63 +++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index cf37abb98235..76b79c122182 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -8,6 +8,34 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
+#define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, ##__VA_ARGS__)
+
+/**
+ * struct msm_vm_map_op - create new pgtable mapping
+ */
+struct msm_vm_map_op {
+	/** @iova: start address for mapping */
+	uint64_t iova;
+	/** @range: size of the region to map */
+	uint64_t range;
+	/** @offset: offset into @sgt to map */
+	uint64_t offset;
+	/** @sgt: pages to map, or NULL for a PRR mapping */
+	struct sg_table *sgt;
+	/** @prot: the mapping protection flags */
+	int prot;
+};
+
+/**
+ * struct msm_vm_unmap_op - unmap a range of pages from pgtable
+ */
+struct msm_vm_unmap_op {
+	/** @iova: start address for unmap */
+	uint64_t iova;
+	/** @range: size of region to unmap */
+	uint64_t range;
+};
+
 static void
 msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 {
@@ -21,18 +49,36 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 	kfree(vm);
 }
 
+static void
+vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
+}
+
+static int
+vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	return vm->mmu->funcs->map(vm->mmu, op->iova, op->sgt, op->offset,
+				   op->range, op->prot);
+}
+
 /* Actually unmap memory for the vma */
 void msm_gem_vma_unmap(struct drm_gpuva *vma)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
-	unsigned size = vma->va.range;
 
 	/* Don't do anything if the memory isn't mapped */
 	if (!msm_vma->mapped)
 		return;
 
-	vm->mmu->funcs->unmap(vm->mmu, vma->va.addr, size);
+	vm_unmap_op(to_msm_vm(vma->vm), &(struct msm_vm_unmap_op){
+		.iova = vma->va.addr,
+		.range = vma->va.range,
+	});
 
 	msm_vma->mapped = false;
 }
@@ -42,7 +88,6 @@ int
 msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	int ret;
 
 	if (GEM_WARN_ON(!vma->va.addr))
@@ -62,9 +107,13 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt,
-				  vma->gem.offset, vma->va.range,
-				  prot);
+	ret = vm_map_op(to_msm_vm(vma->vm), &(struct msm_vm_map_op){
+		.iova = vma->va.addr,
+		.range = vma->va.range,
+		.offset = vma->gem.offset,
+		.sgt = sgt,
+		.prot = prot,
+	});
 	if (ret) {
 		msm_vma->mapped = false;
 	}
-- 
2.50.0

