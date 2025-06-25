Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3012FCFEC
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877969; cv=none; b=ld/0ogOM8tmMrsyG1/f90IEQSb71fzTG+EBD2jjIijtwDDuwpq8HGEo6hR1BNaKWGI67g5kanayWdDcivGc+qEij1PjX4KurVpoZT02fodtPahJESahKsIRDgV4dS7TbKPID/4ojRk5JOyY6QY2rmc2rEteCKKT+N+ct/LqFLKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877969; c=relaxed/simple;
	bh=FgISdIgca1xXqXP2FH+qblBtIUVIylfyUHamP1YgR0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1akHGF3Jlx/uMrSp2p56D60Y+qDvoUNrMmbgD5Mjmu0ySSbtSY330lBjlOQZcVNpSDfQDG6cF/50Q09QCdeJFsEze5VpwJl2QxC60krFKRQhCpEM3BXa49KtpAVX33trx+n6SDTCE3nTTvko/E78KCpMsK6TJvQDhHofogbECk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0kPB7le; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0kPB7le"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDBIIr015686
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xpH5LnDLqPp
	lqQDe5uMXBSo64o86rKmUu4KIOqTfDTg=; b=E0kPB7ler9H1XBVaItMKmLw/Uiw
	GZPTqVMbhrNYg5mBLE8RcJs1k2duI4GjZrT0T9UxFKB2MkOYVtMXH+UTWjyHuhbK
	eS+60esDczZG8Luu8n1apcCt72moc80lqTvhoQHVxTB2S8t3j7aJX/DkE6y3t94U
	ypIok3jQYHQwZ62nYPKvIe7nNFxbJdwA3eVFNii40nAL4W0me/3JSYPuWRNTQKkv
	pCnXgXEHiwsvc0jwYv7af39KnbAqllxu5WvsuYDJfvz/jvanN/6P40Sg1u0L7xfK
	LHQqK7Ur5sBADG5nflWzM97/OFdyCY8ywTXMhrYhfaHlTgho5kTvM7/m8qQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq15d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23632fd6248so1464515ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877965; x=1751482765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpH5LnDLqPplqQDe5uMXBSo64o86rKmUu4KIOqTfDTg=;
        b=lWhRqJiHrRuBA4z55RqQethnB8+n299wwgAcbLzzN1BnyoCvSVeGVq6ySCxXOAMtU+
         Ava1WY6r5MgXWe28DjHo6ZcGvY5ji0q9+1Gyf2Ph57hkNfH8mZ/muvG9t4mgl7pozzZw
         QP63AdUS2M58rij0AHLjjY1RPUCzOgWX28GAtqer0gjZaZYYzviI9NmG/22pGMqQCERH
         2F6tsXfwUe24a3B8aa6TY3ZJsznW/r3ugU2d14JVCa1fjQiMrRWpLGgnZwnfAE76txTF
         ZGCqCjxDZFWH+kCY+yZWsmBoepTYZxty5PbwEMO39FT+Zrwzp5KqRDI75OFhjZg4ICNJ
         z6cw==
X-Forwarded-Encrypted: i=1; AJvYcCU2Ins3zg8SmT7dpuawfTIpa16LFUSE8gtwiVyXCJgzW1hBzlRow4gIZmSG6824foUKi4xW2MlSjYleKQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaENBM7vqohYhc4JhhMSEmY6DRgl+9OQiGF0tNm79iWcMrqWIg
	ub75sBcilY7z8JWP3NOSaNR6O8/no0f5ksOipeLqUgIq8kk3ZKdaDS4H1zf71YdhfqBBDPb87b9
	TXwXT+ZyO8n3wFcCG0u3q3l5K2jBsG8bSF9xe5EysXTLwLQv/r2CWB97g6TD/InYCr9I=
X-Gm-Gg: ASbGnctClIfZLxfi/zvkGhW58Pss3ib0yrq6AgBuDCNxNiTY8rcyKf8wD8BzwXqraUp
	Qa/o78FuVVP1Xxvdt9W9E3L307Cl+3OdfTf4ym5aoc0SvThW98QP6XnC7X1npDa1LAiikESXMSo
	cf+BAVaKlNkpxygqdf8Vg9gLPtsN8Q35Y3ZI8IXATXGHsRkOraemxj7m9yTSOmN1B+o+ORitSLl
	Frl+nNM0VqUJarb4sVmVosVUKfPx6NVlM+5WdKVaAT1uPqwdxSur5p/9lrWK0PYiuXcW9ow495l
	Gmb5kZtDAWpXKGU/Y3qa4IncaMUnYah1
X-Received: by 2002:a17:902:e88a:b0:236:9726:7261 with SMTP id d9443c01a7336-2382404d970mr68388515ad.39.1750877965192;
        Wed, 25 Jun 2025 11:59:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtVUuEZYb41RLKeTVjavf65tKB8NX8TxZxdhFwSQPFNvRi5z1jUVtVE9kmMQW87zfFtvY+yg==
X-Received: by 2002:a17:902:e88a:b0:236:9726:7261 with SMTP id d9443c01a7336-2382404d970mr68388205ad.39.1750877964797;
        Wed, 25 Jun 2025 11:59:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8680b07sm143765655ad.182.2025.06.25.11.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:24 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 42/42] drm/msm: Add VM_BIND throttling
Date: Wed, 25 Jun 2025 11:47:35 -0700
Message-ID: <20250625184918.124608-43-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685c470e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=9ew1I-5mWBoiHqGEK3IA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXwlRt+cLkolwO
 4jZaEEalNBs2/esH4eZTLSbWWsT91P0s+e1Q3t492Eu8opN01Loqf/q8JrJytJKRDImxuleX15J
 gUTAhJM/FgfRx3lzJHDIgnkCwR0NPClTg0e7qLXnLqHTHVcAV9ThuLCtkrsizcWIMiFCgpl8n2g
 /qF6u7jjpPEy3DMIfhYqg2oSMGlMjvlnGKJFLEmWyfR1GghBzhvGxrONESKO391sGLpRAFJoeOH
 6DeNLUahpyZ8/pKv2AQEXMOA3Dx4WO6uHE5HdUIwhnyfHtsr938gIM1eqZwQZ38TiQFK/WhrA87
 QCx8otdwasBHJcY6Xl0OFQVpm9yvElrVJdWNJUGRTPxDKJa99/XqsOIEwYjtZ/5q/wQZdM9EOaC
 RYcOZpmYee67jRnenRWOfQFn7a34SEHI6mdJgnOndSlcr6UbPAOCWxzqnc8O+KDfv7EqgNMu
X-Proofpoint-ORIG-GUID: ywil34Xs6TSoLLjvgwsSGtdVEkDIKlQZ
X-Proofpoint-GUID: ywil34Xs6TSoLLjvgwsSGtdVEkDIKlQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

A large number of (unsorted or separate) small (<2MB) mappings can cause
a lot of, probably unnecessary, prealloc pages.  Ie. a single 4k page
size mapping will pre-allocate 3 pages (for levels 2-4) for the
pagetable.  Which can chew up a large amount of unneeded memory.  So add
a mechanism to put an upper bound on the # of pre-alloc pages.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
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
index 31b83e9e3673..5508885d865f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -555,6 +555,8 @@ static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
  *             seqno, protected by submitqueue lock
  * @idr_lock:  for serializing access to fence_idr
  * @lock:      submitqueue lock for serializing submits on a queue
+ * @in_flight_prealloc: for VM_BIND queue, # of preallocated pgtable pages for
+ *             queued VM_BIND jobs
  * @ref:       reference count
  * @entity:    the submit job-queue
  */
@@ -569,6 +571,7 @@ struct msm_gpu_submitqueue {
 	struct idr fence_idr;
 	struct spinlock idr_lock;
 	struct mutex lock;
+	atomic_t in_flight_prealloc;
 	struct kref ref;
 	struct drm_sched_entity *entity;
 
-- 
2.49.0

