Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C085F28A1FA
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148445; cv=none; b=ot2i5rEBU4e599Sr0NLHV4KWQ60589XPa+MeUf4WD/6rG0IYVcuvhyblO40Hdr9HGBW8oPG+rv/Y53Ma9OniauLdYrbHRdAWJnlyfNYBN1RYl/IksPvM+SueyPDJYvPCEu98UkhhzSKyddMcRoswlmVL99YhejQefYkvIqEtDnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148445; c=relaxed/simple;
	bh=EplCkbkulILusxv/wohoVfpD+NhRaGSSQ6P4eW0lfgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N4tlF8mhIHy32zcdygVPPYwxoe14z7JgsIQ70tSU1l4qCXHptegj1WJLAf1Mw51WLzsiNqo5NPM3nIa8TkU8mCimsHAUDihUsdbJeaKK8rvggZkc98h1gzlQswHPUWiiyS5lPGuX1QPKrv2kPifn+Fr4XdZstSyftBUnKU5/zxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qt+kGGO5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qt+kGGO5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5559q6Do004169
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aq5Mlb2wvM6
	cddTJVtPFg+Q8+IGCZmAcY73uOcj02Js=; b=Qt+kGGO5q7zuA0bUvX990t53AK2
	aorO+Z98d+v2HySgmc1Jfv4IpuLsqOC2N5HGaIV8myIW+CyAo8cuSyiuCcmlNod3
	BynZ9OJJ6UtF+LnCg1MEyCPjAt3YIQa8LBnGz78er7c4lHi2eL7LEERSaPJCzSgf
	LWJmsihV6AN/SJrIG4pCQu0v57sUXC2Q5xg4+GUx6OUCnFzZX7kdiLKpu7tjwfh1
	JjnqaYGk/OVU6Cz9wEdhTPwEhtgYrME8sOxA0GHmqSfP4ezA+TG6uwmENHbcNvFk
	LxyNgqJ3PzQMzNOQojJwa3mURpQmYl+A7Iqtm1N8PoTuK4qVzKPLiigyYiA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn04km4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:33:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234a102faa3so8612105ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148405; x=1749753205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aq5Mlb2wvM6cddTJVtPFg+Q8+IGCZmAcY73uOcj02Js=;
        b=KzmwGG//nX7GVlQAVrlTa1lFvRrmYoBIiDiSA6lt4My3JhUJ3NnjktpHNAEDujY4nA
         dwT2OMjTuZ/y/x3bnZPgTCg5rpDrnRtjnm+IIDPKlmXc/WejPuiU1OM1yafg+VgxPtaQ
         ztzuNsZDIQkaYPU2AsVqIxxKyDEstzYPlrEIKwW+eOt0PKw0q2+45DDiEmcoJ3F3w8xn
         vBoKSqNWS82/6JW1thK8L6q6SsPUN1kwJwdYCw3tKiYjJ5UCa6BtTfGWgEM00KYIuv6w
         lLHr61hi00p39De8d63qqh66Jphh9AtPIlmBQXV/wEJzDH8ktU3k1HkGKgLDWWmTzzz7
         kmZA==
X-Forwarded-Encrypted: i=1; AJvYcCVdONcAUgLqoi15suSjdizqXvla26myI91JNp7FgCrVEI5Vva7pyP67Z9urXO488mqZHa+epeP2uLGW174=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTCWlQbsOuKGfC9WwU82U/aMDYz1c9fgK4xWlNNWnA2DjvGyUZ
	vj00PmYXnMHHT4kPACHjtPb41NoQ1GFOVYe8V2OOI7K3p7+RNjH+ej6rxEQ/CL94EDvwMERnHVB
	YlBIdproksPsKt/fwB4Sfpz2QZvvX+4fHSd9p4Gjc0jPedErUNQ2WPPDeQSbfRjeQSFc=
X-Gm-Gg: ASbGncuZuWbywzR3QTLVPlgGYVMGJkd7wUU1PUeqb1MPmQfsjvNunjwFYC6Bv5buet8
	DRAVQaOG/K8QuCQsr2ZlNvjZ+EJDwg1GPorFo9hMijqE30DJzVVapUkpm6Vyn7DdtxDXKTY4d85
	jqwaqaP7NpZcTH69m2sIbxQnNfSC4RxqcDJSd5ybGEWisv9rkLpFAz5M0Bx+qE7SlpEk+LAjqvk
	NCmqihLNf3Vbt7Jwl0rrLtwCbW+Afd98DoLs9Qd9dqYJH1TYFQOIFVKc0ufF+yviuQe4J1tGOiC
	JCw8KU7F8zLFN8bl/tutuw==
X-Received: by 2002:a17:902:ea11:b0:234:f19a:eead with SMTP id d9443c01a7336-23601ed546dmr4753965ad.43.1749148404754;
        Thu, 05 Jun 2025 11:33:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv4pHc4fnYu4s1RXNlIzNDDJsXYuIILJZfiVF+w0RPFujOSg/3fi9tGM3rphg+6/s7TBErbQ==
X-Received: by 2002:a17:902:ea11:b0:234:f19a:eead with SMTP id d9443c01a7336-23601ed546dmr4753535ad.43.1749148404374;
        Thu, 05 Jun 2025 11:33:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf47c0sm122369965ad.175.2025.06.05.11.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:23 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 40/40] drm/msm: Add VM_BIND throttling
Date: Thu,  5 Jun 2025 11:29:25 -0700
Message-ID: <20250605183111.163594-41-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: yVmfsjcqx-AQ0QiJqqjfRMYyWdOgLWeO
X-Proofpoint-GUID: yVmfsjcqx-AQ0QiJqqjfRMYyWdOgLWeO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NiBTYWx0ZWRfXweoo13+gCMls
 dB8jusk50bdvKhwpWRt8zW59IlL+8DgBpFq3zy5mX8jnjUsBrIZ+SN7AhXq5zsO4DtOTURT4YtJ
 Lyr7bLJPyTDbarG2xNW4mOizkWU0he6j2QrGfZkQMfpl2DHHt4Z57uPrkOAquNiv5mu6DFZIhN3
 MzrV0zibLv3/FUyJV/KtvytDotIn33XgwKUEnuQTHR/EJgl0ijSU5o7Rm9gdVD+qrOUBsIGWRRt
 E3cZ947OZ4rimFDNGAOWhxzzEF724PisnnBHghkF35/LD0WTq509FzYBSN2dfP9NupIxz6sDKQM
 kUZZSnWEWNKpx6Z7YoeWw6vC8+RLObgIhpDywdCE0JfD38M0waLCgmIO+iyU2XdscmQRcdYkDEi
 S9tf+7KMcpaYHNYx5+xRj5BLuULuWqh0SArMppgwXbxpQVdTDD9HvLZZIZNtQvO9zcs10vAl
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=6841e316 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=x_1jt8ETcTvhpFk4nSoA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050166

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
index b6de87e5c3f7..83f6f95b4865 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -705,6 +705,8 @@ msm_vma_job_free(struct drm_sched_job *_job)
 
 	mmu->funcs->prealloc_cleanup(mmu, &job->prealloc);
 
+	atomic_sub(job->prealloc.count, &job->queue->in_flight_prealloc);
+
 	drm_sched_job_cleanup(_job);
 
 	job_foreach_bo (obj, job)
@@ -1087,10 +1089,11 @@ ops_are_same_pte(struct msm_vm_bind_op *first, struct msm_vm_bind_op *next)
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
@@ -1119,6 +1122,20 @@ vm_bind_prealloc_count(struct msm_vm_bind_job *job)
 
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
@@ -1389,7 +1406,9 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
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

