Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E59225414
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206047; cv=none; b=CMiCQks3bo5XkwyxMTMznGgAO71dRGnjFh96yFRcTdFgniG15tFKd0b1+lecuSXMOoHltDeOoH9OFfObAB1aQjp1zeF5wkiziv5l5+7BmMvfV5/DXEAC14lYCBFYjklANESrukorKW4pYyQvIMpewhxPAjW+/eB5FHb4I4SSWGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206047; c=relaxed/simple;
	bh=au593a8+7mGZ4QlvT4X7cpF6yg7CCF/F42yjIFbyfCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcVQfUfY8IWuIAuE7jTwDAQ68ZaldJgiPLL6bR9rE0uHLZ9IYhXIfjVyl+DAhgrQZOLETkO8wNUBLhkO9vlunduGBJfGzljIBPMFKCgGG+1mHO4U2bqRSXJgoGGF2NSnjOthM+7uE1gMbyWSCWxq9LFVLHx5+sr+x2cCfNT2J7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOZOc4dD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOZOc4dD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAVm8F030350
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eRArZHg5kja
	6OQg/YP1uRgtCqLo62Lhjfwd+5rkVLKM=; b=MOZOc4dDi1ck9L+QRSsR4vZJwBN
	66eV4YkdpLb9pYkCICHe++0gI4JQ3qi17ivoNbzlGqQmEq0KZtVhP/qPSAI230+N
	g7I9mBAWanm13+hoPbJcgMEQ/7YbZQNoTbQ8OXftnNproAOLI2vBTNGhX0tEpAWm
	WWdQ7ojNKt7IqYLGfxZdoalrUMTNEkKUH/ysVIOI6zA4LO5zvimkfl0smBD2vfhR
	cNWasV/YbqBqdohcaeJZNvsitE7Z11iw+kG/JqR2DCy1fRM8bSsgXVFZK/+TvpDG
	b231lke2FfeELS6npd506UWJFulJ004DvoG4D6bSLL5fFD+89CcJ8y71RaA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95ht65p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:25 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748e4637739so2577202b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206044; x=1751810844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRArZHg5kja6OQg/YP1uRgtCqLo62Lhjfwd+5rkVLKM=;
        b=Wdtw+hDYBWJ5uXs8vfji8YbngAoyJcyInOOszSIgsT0YCzHgxlCqcSHRuAhlEG7krX
         HWA5WKTaRS08b6LJwrS2osaCBU+0QOXY4j3pFT89lDRugRi4+oTkMFav+DXKQ2EVTRJg
         QUqlt5+TRRjRD3gK6nBAqTq2EwdH7ARxUJ2pvKYxLnufAO+RzPRv1BAgQnuIEg0CNziE
         AZp5/U15jc57Cx5uxjDQFIHCK3xb8KLnljRoeZsHbqR3boOy5HsdrQ0Yais/mYgQ1h7E
         Ik4MUY/wIA1P5iIL9QIxTGw84WOqhwhQl9n+yyjbtMsK5hVpwSCx7oWh8E9B+/ZLjh7y
         OjRA==
X-Forwarded-Encrypted: i=1; AJvYcCV9YzABfLDweXqekyGWInrDSCr8SJFyafWmk1w7DMmJCFqLWqVRPRZwR2cY9iBLTJ2qdQXG0fJMxRGN0mE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1tj+/bFCK2g9/gRAxRTPp3KPGBFDFMlWsyPrMO5Au/3jmr2p9
	1dEnyrTvDNluPO3hErcSOBaoktzR/UiqpH+CFPQB9d8KoUL2Xc82wOZlfBhVOP0haFpMtyzFOlQ
	WKlulZ8TJ0TXc7n7Lm3E5n8Jmb+27d7KcIQgrAwGnipjw2gMMVMRW5WdoGZGxfHIDEmQ=
X-Gm-Gg: ASbGncsC4q6t6tYtVwzh1v61P9DNXM2hfMV7xDh6n4lNLS+NzTbk/FVcDJLwiKK8ffq
	1jjY7BHVMkINAd9hasFfYADZHEdLXGssTz3wLMJnsN0m+AcsOfAu0ZILiUTf/BAIUpkgSO19Rb0
	mAxmM1aBciUlootxst0j46VLasWMCeUtVywJVl1a4Bc/IBgCh+BAaecEH+HMPbAJ3x7fHceVTpY
	xaTl0T93118thEIhx0tWrDm/OFIwFswciEVXDxK2bXeBtmPgESsRHEn58x2cN34rgEJSHgRmktv
	12H4QdQLY/9hkY8wQ62E4ATJ/MLSvspI
X-Received: by 2002:a05:6a00:8c8a:b0:742:aed4:3e1 with SMTP id d2e1a72fcca58-74ae3e79e9emr15110878b3a.2.1751206044392;
        Sun, 29 Jun 2025 07:07:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzFoHhs30uufRxyXEDa8GNhAGcI0a2y/Q4jf783ZXcR3TPwpNn70ssWWhJXCFQV5WbzR2gNQ==
X-Received: by 2002:a05:6a00:8c8a:b0:742:aed4:3e1 with SMTP id d2e1a72fcca58-74ae3e79e9emr15110847b3a.2.1751206043958;
        Sun, 29 Jun 2025 07:07:23 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541bb6csm6705036b3a.41.2025.06.29.07.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:23 -0700 (PDT)
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
Subject: [PATCH v8 09/42] drm/msm: Collapse vma close and delete
Date: Sun, 29 Jun 2025 07:03:12 -0700
Message-ID: <20250629140537.30850-10-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfXyZr44jPMIRI2
 uBdSadm0yrOl5UbM7ElMAkkqG2K6GEWfnGUYHhf+tOgPZMH0PUJzOiMUhd9pubX0MEIs1DM47Kf
 1QAJKRYzv8p4UTCW2NFMJGgv8F7IMd8RaM3J/5hwnWEg7ayGXyU1vs1SkMw/gBNWPH3adEKQHkl
 aHd6X64hV4zTDZMAaDqOp0WHscfINKyri2I81lnNE0Xxa38QNRDmbH0QiD2cpPcXUZYlwcK3lNx
 4IEX9Tj2PBkEE7QnnNhdICD7KURt8Yw8P84MPMmKEbKFr4gV8vWKSPsb4GcEBijmPasm3SnH/Tz
 v1GIWJkCxMSNsx8iiT91nQiHiwV7YT6QHgbvdztqdM2I2pa3xFf1MJt6GgLW1/iL9J6/H0Gjpkn
 UY9PnUBoaz2ymo2DYeyMc2uXaCi/3ilNRtx/IADIHqv5p3egs2LfiJwwvz1H12F/DOqTMVZj
X-Proofpoint-ORIG-GUID: d4GsLexDt5gL3J_16uoRNC6diixU9bQL
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=6861489d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=RIvuzEnNBJp2qadMtJ0A:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: d4GsLexDt5gL3J_16uoRNC6diixU9bQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119

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

