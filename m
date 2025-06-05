Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB8D27BF95
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148336; cv=none; b=LjxVa6sl9Hz3MYulY1BSHrh7pkOApU8AVqb7Cz19FMYWRs/62gCtAjaYon4VsCw05Jxg8aZDuy4l8fwKMZNqGp8ilFKaEYEG7Zk+ckiRNMQxpdSZECYtVcCwBow5BISdbLluWpqE51HWtEKSEp1uAyGvGFUhm3QRu7LQM9NVnpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148336; c=relaxed/simple;
	bh=8yxrJuQkxzYQChDV1AsntwCFAr6kU9KajLDojsgN7uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNMGIyuZJEsTKNbBSPYLpUufhpDWvaBH88JfyPENLF0CrfISXHAj0hCyRKD/XbKfyJCUTosnG8IFyqJOcIOqoVbZQ/lnXM245sw63D6DljtvAv7asdcN0k14HROsY+mJERaHUMRaw2R5ZyFcMSoWSu2oYXcTP1DnIZBrkIwG2IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0iRk1uN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0iRk1uN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5559bggo015518
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iz489B2Vnt2
	sUZBEqce/LAoH7pGwFDnWfRoUqmkB+Q8=; b=F0iRk1uNT/wx0mzuCe7xK/aMnDy
	vhMRE7SuFAmZZQuUWa802yiJynMvI6vtkWKAefljtPIeMsJpEYEp6wUNCFhICZ36
	SYxZBJoBcQc9UoMlmDi/hOs3Rx66DBHahSAfucZso9Cu5MMr8/FImGGwwtZO0+gy
	0pjWyjr+ZqDsEPwtQOeT8aoEGluB82SJIseTJ2pxfKKve4eXCCwe64iSPfUexcX3
	gGsBjg+AOxJr4SZ2YYlBKpVrQxBBPxr9yPvYdcIKcKwFgasIiAqzDqjDFs1bct4R
	h68mp/8X1E//Yg4oh02W72BYXK/6/8emxlWAU+z5QH3VsRfWwyH3EcywW6w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be8616a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:32:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311a6b43ed7so1207470a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148332; x=1749753132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iz489B2Vnt2sUZBEqce/LAoH7pGwFDnWfRoUqmkB+Q8=;
        b=Itjs94Ovza2VtjS0uzwlM1sfsU9iFRROC2cEuJuES9oawWPD8LGFXSKQmspEHFSQHI
         cZbfXyPdI+Sj7z7JVr4a0BShUcSsI9kFk8OOS9XaETHlloIhndsAHExyGAamw7IuWwQZ
         x6/ChDcr86Q6s/Gco07MdTTwJ8ZGgniewXYVueneEPgxJ9pxbewywHP0WW3DCuRli5ZM
         qya1FMGR4ef8E9wDizsgO1jrPwpEzKRVmvrXN9ckqpL1gFhmaYQo44ptM6r3gcoiQtYT
         7zcx8L3rcuXtcL6NysECTJ1IeJYe/KqVAEut0LniW0n1eTtFm7mzsGf087IUFQ9dBq8+
         uv5A==
X-Forwarded-Encrypted: i=1; AJvYcCU63dxukfX2n7nZOfCxB5PpEKn9Uw7limutJmmDyLdMgt9AZz2GNzqT+fagwYGCz418ziuWEnTboLrHPGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZboU4DWMOMeekbL7HZs1e8J13Vj8nZ8tGwAfINcx4vVOnNjgL
	a9frJxy+sT9HTS3tkSilRpzJS3pL9EYIKVxCHDYQD2QusTGwluGZx0hxz0JhESu+12MZgcN+6YV
	IuZZQ2t8rDTTKJ8QiBROG4QLqRrrgQHB8eTX0SWL0lSG3mBFlGDlHefBH5BcWi7LbcEU=
X-Gm-Gg: ASbGnctSvz5OfCVF/gUvTBQ4FnTFLHWrKFx8C8uaM9R7aJztUMGsFKnp4atvR7pV1ND
	Zv3LdtJzCec1KBDWWQqhAbRIEQ48b/UQetEP5NAS4XECTtNzVCrRyvKJbBRu+0fxj+u6w+QHZCG
	ED1E5q6dh4n9zZpuN/tJGKbSHV2VjgS6d89h8DRBwNrGGoT5E8qoPKT3j3r/0VoWZBkidGVa7jr
	YTSOjxuRFXUhcRzbXqw8LnqPdK5BQ6vlBP1rlr9cufN0WEeiS5NS9gwcGHTqehId3iwpRzGspC6
	lP0E6lSEe7odqepddzIkzA==
X-Received: by 2002:a17:90b:4b46:b0:312:b4a:6342 with SMTP id 98e67ed59e1d1-3134788faefmr998041a91.33.1749148332201;
        Thu, 05 Jun 2025 11:32:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiKBDew32EdipW62Q0cflXApQbfZYLbCKMDJJCflNU0zpokfB0+AAOj2B64JXMPgxhpvo9fg==
X-Received: by 2002:a17:90b:4b46:b0:312:b4a:6342 with SMTP id 98e67ed59e1d1-3134788faefmr997991a91.33.1749148331774;
        Thu, 05 Jun 2025 11:32:11 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132ad9a4aasm1558718a91.1.2025.06.05.11.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:11 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 03/40] drm/msm: Improve msm_context comments
Date: Thu,  5 Jun 2025 11:28:48 -0700
Message-ID: <20250605183111.163594-4-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=6841e2ad cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=t0yPb2BRG13ODCZxGvcA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: GOgOskKEXzyEC1L6Dd-S9EVipaD-WRA3
X-Proofpoint-ORIG-GUID: GOgOskKEXzyEC1L6Dd-S9EVipaD-WRA3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX+xrvVIGavAEp
 ya4+AEVlwp576OzpeRVh+xqpOB+XQxL47OtrYNsih0ORGoKLT4aJfPt/CmgZaRwpq9T3OU+FKn7
 q7UT4uObGiFPtCLozPABIw6fjQq/kTUwLuCn1/D4tb2c8W/aJfgwNmDNU01xOZ5h+KC3IVc7lDs
 Wz8skK4Ynbz6Xdadt7rfefz/ROu7Un9qQC3UXNqS0DLalIn3u1BFRdqybdr8W48zA3DI0gwe28j
 hFYiq9WSOuqXQeqfcnz/6AX0g7ch1l4vtlftJSz55nXCzsxpzwF8sT5XXK9SJErpEIgz/EzyxTr
 Tahpt4AITD7zfQygbYoJEYZdILErGfzATKpwQ7P6suy86zNg3JdX4wqJ4CRwxLAPqhUUq+XntFc
 iplpeH2lpMJoqIzj4B9NO4BBxjnro/iyt66M6LO0LHbKh5PFgalDvTaXO0ecuc40k8qtNLYc
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

Just some tidying up.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h | 44 +++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 957d6fb3469d..c699ce0c557b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -348,25 +348,39 @@ struct msm_gpu_perfcntr {
 
 /**
  * struct msm_context - per-drm_file context
- *
- * @queuelock:    synchronizes access to submitqueues list
- * @submitqueues: list of &msm_gpu_submitqueue created by userspace
- * @queueid:      counter incremented each time a submitqueue is created,
- *                used to assign &msm_gpu_submitqueue.id
- * @aspace:       the per-process GPU address-space
- * @ref:          reference count
- * @seqno:        unique per process seqno
  */
 struct msm_context {
+	/** @queuelock: synchronizes access to submitqueues list */
 	rwlock_t queuelock;
+
+	/** @submitqueues: list of &msm_gpu_submitqueue created by userspace */
 	struct list_head submitqueues;
+
+	/**
+	 * @queueid:
+	 *
+	 * Counter incremented each time a submitqueue is created, used to
+	 * assign &msm_gpu_submitqueue.id
+	 */
 	int queueid;
+
+	/** @aspace: the per-process GPU address-space */
 	struct msm_gem_address_space *aspace;
+
+	/** @kref: the reference count */
 	struct kref ref;
+
+	/**
+	 * @seqno:
+	 *
+	 * A unique per-process sequence number.  Used to detect context
+	 * switches, without relying on keeping a, potentially dangling,
+	 * pointer to the previous context.
+	 */
 	int seqno;
 
 	/**
-	 * sysprof:
+	 * @sysprof:
 	 *
 	 * The value of MSM_PARAM_SYSPROF set by userspace.  This is
 	 * intended to be used by system profiling tools like Mesa's
@@ -384,21 +398,21 @@ struct msm_context {
 	int sysprof;
 
 	/**
-	 * comm: Overridden task comm, see MSM_PARAM_COMM
+	 * @comm: Overridden task comm, see MSM_PARAM_COMM
 	 *
 	 * Accessed under msm_gpu::lock
 	 */
 	char *comm;
 
 	/**
-	 * cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
+	 * @cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
 	 *
 	 * Accessed under msm_gpu::lock
 	 */
 	char *cmdline;
 
 	/**
-	 * elapsed:
+	 * @elapsed:
 	 *
 	 * The total (cumulative) elapsed time GPU was busy with rendering
 	 * from this context in ns.
@@ -406,7 +420,7 @@ struct msm_context {
 	uint64_t elapsed_ns;
 
 	/**
-	 * cycles:
+	 * @cycles:
 	 *
 	 * The total (cumulative) GPU cycles elapsed attributed to this
 	 * context.
@@ -414,7 +428,7 @@ struct msm_context {
 	uint64_t cycles;
 
 	/**
-	 * entities:
+	 * @entities:
 	 *
 	 * Table of per-priority-level sched entities used by submitqueues
 	 * associated with this &drm_file.  Because some userspace apps
@@ -427,7 +441,7 @@ struct msm_context {
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
 
 	/**
-	 * ctx_mem:
+	 * @ctx_mem:
 	 *
 	 * Total amount of memory of GEM buffers with handles attached for
 	 * this context.
-- 
2.49.0

