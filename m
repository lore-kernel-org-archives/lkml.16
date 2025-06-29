Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29AB2550D3
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206106; cv=none; b=azGSV7JlQkgTKmzo9pnAqmECUCeEnBLQBNnrzYY6JB1rUHCVoQkpVZVUzmtQK4qeMmvfkCq33jjIRZ6I1YfhDIVmjMasOnBiPGJMZW9MUmQLeKXUj8RhIJ4OBenjMKCNmfeVBEMZYHF57+o8Yiq+hhWeKtd09tfl32zD5yNEae4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206106; c=relaxed/simple;
	bh=nBjrw9veY0ZydTKNOJ2rJlgvZJil97gvgE9S6DJKImU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DUgPG5iAJFExcufzctj28annsvP10G7e3z6Y8vnUz7X0kagRZl4W3J4ZNxDllu7VpZkSS4ZmvLQVW2/cY+GFTeeIXow4EGOBV/Ly3C/OQIjfWPb2rl6h/f28G2gxlwm9ftA0rCF180WOXABhR06zJG10f210ucjNrkcZs5dGvVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ah42uKy6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ah42uKy6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDjOul024708
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B7t3J9Gz7Wr
	bwv2GHFeD9oavvwiDOSYnGrAA3GiBoCM=; b=Ah42uKy6WruGMZPvQ/PiGa29l6g
	YYtcA8xtYb9JeXCglgN6Aw9O1jiWeyCHQny5UJM2GznwXRbUKltl7VrQ6fRPrx30
	t4ZDQLAqBN26JP1p+HTTpRIVEyXxiMDOqvXIyrC44iBz8GYH7vOJW8+IQJkC5aGE
	yTmoT/Tbr8N2q8tmRwTDbPqaEqmPMh4GIYr4YHaks1eU0rX6MSuWSDdSaZK1A2SO
	J/tBY9TlipbFZvNgls7ycn+EjfMVkKL91XSL5KqU/kPcqd/l4ZDsgqjWsBjUXXx0
	sFTGAXLaDpdy0k04Hgj8jkM1VKg/eAf9DYF40/Vp/W4RRCVB1vjuSY3/zrg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2862-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748e1e474f8so2470708b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206101; x=1751810901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7t3J9Gz7Wrbwv2GHFeD9oavvwiDOSYnGrAA3GiBoCM=;
        b=tdpoTvohz8fmiK7maSeM2a4H2GTjUltwWzihzEV+ySwmdo7lPi1eEOHXf9M5kSuSiy
         EafXyRtfDVv9r1fv4YZY3ynEQEgZizJ9dJBfZcZSkAWml/MWKxVJ3Qo3ZHOAITZGjNiV
         REDVk0lBvE9/tH2NTTFzuATySFuHaDP7JeP7roZnmnzIpentmLvXrUAUlpbU2LYqyBQ1
         l0/dJSAHZX22m4b+PyuBrsQfYy/3HXXrPabyJs03wZStfYKelYlC/w52K0Itm+cypbgf
         hrJgOOIuTwENWP5/UF2WPcRx1ya4065yhZMBjISJ6xf3nje3+tOchnRyBMxFtvFgLJk3
         f2Og==
X-Forwarded-Encrypted: i=1; AJvYcCVjmgFQ9WQvUadR4f/HC59kjQEJXAgXWAHXatJy1YaAKukbikYsMa2EsqwdF0uQR2kCe+z3fboxwG5a7LA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQu45c56LVERWvdyXUafS00USL9Eywn+BgK0t2Sg0GMulu9Uxj
	PZtymkPJvPiL4iCL/rS2CoBAXWGa6SuhwH2PvOGg3BDOj66hbZgdBx7LPY5awjZ2A8T7xeSuhwD
	Mjj5Ov7rTjmdoNfLauwklK7geixShbhRwkaR9ukDXg3ldZam0nwj/beo/TYmsyWaTt3o=
X-Gm-Gg: ASbGncsg8mHR1RAEHz1RV41MnDJ/xM2yMUo+52h3zeig8xsVMJxyr0T5sc+QhA7H1fl
	N9Ar3UxaPxfLY52ZS6SJkyJrb02E4q0tkVZjno4UP9m1hH5AT448jJP8NdPopc/h1xsDzXznqr3
	Ans6Q9aMNvXXqWSpAm0dpNJPrQrL+U0XaWl7SQ4BGPMvYRKyehWoW9afESnzE3cUqxbNOalpje6
	rcw289763/LmbyB0qtDFGKpBGBYVQz4KjTpDSbqBc96xhW0t6g7FDyHiFUvkQWIETSg0+MRN7xF
	IGuhVgFzSeNH30t3MXfb5vUhVl2Zn3K7
X-Received: by 2002:a05:6a00:1914:b0:748:ef3d:3247 with SMTP id d2e1a72fcca58-74af7046bd3mr14810396b3a.20.1751206101462;
        Sun, 29 Jun 2025 07:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeFPIiwhi3m4DwFAWJK1g1uk8hI6kROjrLRrGCACj+Y91U6WovNlDgcMK9sTU7GMpxFYpzZg==
X-Received: by 2002:a05:6a00:1914:b0:748:ef3d:3247 with SMTP id d2e1a72fcca58-74af7046bd3mr14810360b3a.20.1751206101057;
        Sun, 29 Jun 2025 07:08:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56cffd8sm7213107b3a.137.2025.06.29.07.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:08:20 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 42/42] drm/msm: Add VM_BIND throttling
Date: Sun, 29 Jun 2025 07:03:45 -0700
Message-ID: <20250629140537.30850-43-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=686148d6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=9ew1I-5mWBoiHqGEK3IA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: USpFeFTv0xzD9YFKnUsuR8bpj7fxo31x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX5jb5R42beX3L
 M32DsvhMx0+A2KFb+bfYPYkTC4xzytC0tic1HOwK9k87DaUqjRRBtPKgpWrz/5UJTElIDsuRwPS
 rtDaS69yeaNWcD2HCZggm42O746mWMP+6us0oDkhs8GVEh2DfPQy9tFBjJ6p0IAlPIb5GU1dZ1t
 hBQYML3hW0yfmLyImX/FRZ5BYDPZM8ul4KmLFpgtSiAYg289JYuvHqaXJx4NXx/QcarwcUwIZlX
 AuK/zGY3DMChVdPPLirDcgD7ku9i6KFo+nZlDWcTQXJIgZNACk/i9uSjmGZy9KRwMGNTgIOeEcb
 vkDwqKJe2BL+WZ5yZCTudV83e3j1nwvG3bBJF06PSEu3pwc5zWm6DQ4ql1F+TN+lhxRMbDrAisU
 2GAPE3EZJkDFTDD1OQ2L1YIxHADiXbofNdECgWfud0sjE2BW/4tgVfW2cicL1MoexSkq10L4
X-Proofpoint-GUID: USpFeFTv0xzD9YFKnUsuR8bpj7fxo31x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119

A large number of (unsorted or separate) small (<2MB) mappings can cause
a lot of, probably unnecessary, prealloc pages.  Ie. a single 4k page
size mapping will pre-allocate 3 pages (for levels 2-4) for the
pagetable.  Which can chew up a large amount of unneeded memory.  So add
a mechanism to put an upper bound on the # of pre-alloc pages.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 23 +++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.h     |  3 +++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 907ebf5073e6..bb3a6e8320c9 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -705,6 +705,8 @@ msm_vma_job_free(struct drm_sched_job *_job)
 
 	mmu->funcs->prealloc_cleanup(mmu, &job->prealloc);
 
+	atomic_sub(job->prealloc.count, &job->queue->in_flight_prealloc);
+
 	drm_sched_job_cleanup(_job);
 
 	job_foreach_bo (obj, job)
@@ -1089,10 +1091,11 @@ ops_are_same_pte(struct msm_vm_bind_op *first, struct msm_vm_bind_op *next)
  * them as a single mapping.  Otherwise the prealloc_count() will not realize
  * they can share pagetable pages and vastly overcount.
  */
-static void
+static int
 vm_bind_prealloc_count(struct msm_vm_bind_job *job)
 {
 	struct msm_vm_bind_op *first = NULL, *last = NULL;
+	int ret;
 
 	for (int i = 0; i < job->nr_ops; i++) {
 		struct msm_vm_bind_op *op = &job->ops[i];
@@ -1121,6 +1124,20 @@ vm_bind_prealloc_count(struct msm_vm_bind_job *job)
 
 	/* Flush the remaining range: */
 	prealloc_count(job, first, last);
+
+	/*
+	 * Now that we know the needed amount to pre-alloc, throttle on pending
+	 * VM_BIND jobs if we already have too much pre-alloc memory in flight
+	 */
+	ret = wait_event_interruptible(
+			to_msm_vm(job->vm)->sched.job_scheduled,
+			atomic_read(&job->queue->in_flight_prealloc) <= 1024);
+	if (ret)
+		return ret;
+
+	atomic_add(job->prealloc.count, &job->queue->in_flight_prealloc);
+
+	return 0;
 }
 
 /*
@@ -1411,7 +1428,9 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	if (ret)
 		goto out_unlock;
 
-	vm_bind_prealloc_count(job);
+	ret = vm_bind_prealloc_count(job);
+	if (ret)
+		goto out_unlock;
 
 	struct drm_exec exec;
 	unsigned flags = DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT;
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index b2a96544f92a..8bb8bd080cb0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -549,6 +549,8 @@ static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
  *             seqno, protected by submitqueue lock
  * @idr_lock:  for serializing access to fence_idr
  * @lock:      submitqueue lock for serializing submits on a queue
+ * @in_flight_prealloc: for VM_BIND queue, # of preallocated pgtable pages for
+ *             queued VM_BIND jobs
  * @ref:       reference count
  * @entity:    the submit job-queue
  */
@@ -563,6 +565,7 @@ struct msm_gpu_submitqueue {
 	struct idr fence_idr;
 	struct spinlock idr_lock;
 	struct mutex lock;
+	atomic_t in_flight_prealloc;
 	struct kref ref;
 	struct drm_sched_entity *entity;
 
-- 
2.50.0

