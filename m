Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8232E11B4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877894; cv=none; b=InbfR02ctST7Gyrm2Vjt/HfioWrPwIlKGqq3WxJJJcKPL/8ntrOHbfBI8sxCKk7dHzNeQXkheAfwso3xrS8HJ7Z9Lg7ZDg13tdaGqK/vcuhDG2b5M6LiCC6uA7dYWsTp15M/Nq0fIQiGtlo2ZZOqaHwX7hSCOj6yh4vT5bnPxl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877894; c=relaxed/simple;
	bh=8yxrJuQkxzYQChDV1AsntwCFAr6kU9KajLDojsgN7uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AKBCBR3xWupTCad+SywC8YdE558x3ovSzngrDpr0iQUp30J9m/W1eszuqyrGpjk2QoDS1L8wIRxWx48PjLo2y01ekwsFK7za1GtnVk84Xph14137F5GqaxPs+unrDnb90pEAKDEGbDjstbn2ltdChPfy7iLNLS9tB1F5qxRO1UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C0eXiFIo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0eXiFIo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDKS4K022985
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iz489B2Vnt2
	sUZBEqce/LAoH7pGwFDnWfRoUqmkB+Q8=; b=C0eXiFIoHrho4Cfeajp5hMIWveM
	i56buHxm6tliHu720mJsTe0PQhcF7wxbusDXvjaYI6DvvFDSUdvtMkpi1odH0t0P
	3ejFlwHdcPJRwtNOJoPUJHz66jwrCpM1ppSudM4uPn6gLVV3LwmCMIuewz6blYlu
	BDbR9bVm4iL+JZ1mrv4DjjmmVVJf90ntEZ4Xvq+dSsdPfvTkoUP5D7lNTsT3Wd8r
	PZE0dqrmEJWd4arNv8UAC0zCk1pqco/ySqaNjlkqIPs6KMRtqqMvZutHlXTwVt1W
	8JWcOFya2ch7nFeuv2vX/MsajM6agYOYyKCES+Xf6GuhVB+JcwiisuAfkTQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bggxxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2356ce55d33so2838205ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877890; x=1751482690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iz489B2Vnt2sUZBEqce/LAoH7pGwFDnWfRoUqmkB+Q8=;
        b=jhkjwtojBJkJaUDcr18LU+rcaPOBHPeF1G0NkxynGa6Ya0PbaCYuvtCn0YfQZHY/rk
         jJvIftf9q4hebppBoMvR4Aap10x/zMokWs7TIgZ97+ppkAAwFOIaeWp6wP5jDlum3MRs
         bxFPvx0IimOIAzXxRj36EAk09C9G35Ikfpvthx86++d7gbUQxsShQJZAELLcgEESs1Qm
         JiS/VUIluz6sAVRpYQO06Xb+DX6Qvj8ScZ6FlML4nq9xaMHCbJbAXRwH/v3nmiLQUJ1u
         Mbztss5VdX6J+KMXoRL685BAN6P8PIv0skTMgUyxe9KhQy1rHi4PoBdfKIf54iGGpuZG
         hHtw==
X-Forwarded-Encrypted: i=1; AJvYcCXAl7VjtCdzId48Uu5BNd1qWKieAPO4AafK+MqEfehucqnr5SMs9xookKP1uCtlYxUfc0t3sKwHD5g9r6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzznhZRoOeInd97QwKj4YOaGIe8vgMKcb2NAJEuirDusV0uz0vr
	vH6bQpXJoc3Vc3tyL8WWUFEifxMZxU9JWRQNoYYNwa8kIfO+vHCxdPN32b9pA81LqhQ66/ykkWh
	Iy9HhTgXepwBnGT7YAzxO0aFQKqkw2xwaD0KlPaAkyB+O94j0AI1UOjVmG7URw7dDrIk=
X-Gm-Gg: ASbGncsFP/l9shhcw77SuuaogOyRDcOJvT9jigOgplLT6IYVWQvQAV36E00/5+E6sLC
	5wOF7lV3Bp+l1fh2GaHhPpha4zurHRD5TvUrtrkqdTBfJzZXi3AER9RWE6vThDYhnhg7RsyU+xl
	0bvh7qmcpPVOn9s3h71xpJvWWBps/0xQUTm2DYBVbZJrcCHXvxQYXO5xF+qJVFXz2Ricy6cjXva
	+5pG+yEmMQV1TFf+pE2eQU9PNEtllbQsXHPDfFjkBt43VnpPampMRlUhsc7g2bGNFZkmWsuD158
	DrGxAXZHMxVx1W0ShMPxAGicIC76EtRl
X-Received: by 2002:a17:902:d501:b0:234:e3b7:5ce0 with SMTP id d9443c01a7336-2382407a220mr64201475ad.47.1750877890605;
        Wed, 25 Jun 2025 11:58:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGELzNE88dk/4uZ9frRWF/+bGLdgcTXmuMfsYcOrT4v6Lw6umM/ReeIdKxbfbzYz91MBR74A==
X-Received: by 2002:a17:902:d501:b0:234:e3b7:5ce0 with SMTP id d9443c01a7336-2382407a220mr64201115ad.47.1750877890193;
        Wed, 25 Jun 2025 11:58:10 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237f7579cddsm81828815ad.202.2025.06.25.11.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:09 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
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
Subject: [PATCH v7 05/42] drm/msm: Improve msm_context comments
Date: Wed, 25 Jun 2025 11:46:58 -0700
Message-ID: <20250625184918.124608-6-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ZaPacTZySOrhrxJzdpbcuwxwU1UEyDl2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX8h6chlV/vCZ1
 u6QW71swk198SjsJdlv/WB3p7L0QlvmVX2PnX6Xql5EP1MXJ+v1ImkuSUatfeWy/ncKATekU1cz
 36oW48a9hkwkEb5/n+byyp9go3vQcTsl7WzEMZWOgTKxcg2sVGdlHJKIVwNMjvOJhsXn35jd9j3
 eqE5auQ5euMdr2xVdTs5vV38oxlEz1dIcfCX/pK73nTePq3Ca0zvQ6twb7Q6MXx19nTEhFJldBa
 OoxlA0I7ouaDQxTepwPKSXFdysn3rikbcxVDjdTdd12KAgSKHi2FgigR0RRAJwLzxnb09kDGtfK
 gIyaBxM7WAzPHVkDttcqPMmDV3lJjo8rmAvx1HjPqv7/f33NQShvPmaksOSfeJU7bg2Hqul8UEP
 VDZK0IN44x7u1TQ0+ypmQbV+i20C0zdjOGQJY5rtYPQFpzaJ/psq8X1rd5CKM/xXbU24tPwM
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685c46c3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=t0yPb2BRG13ODCZxGvcA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ZaPacTZySOrhrxJzdpbcuwxwU1UEyDl2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

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

