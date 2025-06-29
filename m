Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8881623F40F
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228158; cv=none; b=eY7JUgsZ+ew2Y9z2vlxqFqBGXHTSvEATDc6Cq7VjiauCMqgdrjFSjpj6oO+2iQFF+XdNCpoEmlT4JU4wWV4aoGJIpRQvOexbi/x1lyQRWAdeZbl+f9kUdBB/8F+M/55/cQlTL1SmtgHxlXSsiK29YbW3xmmEWo+WcMttc5xs5cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228158; c=relaxed/simple;
	bh=IKliov0J2pa5trVjg7A0Pz5LzH/hN/LQHJAojZPCWiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKWt5hKJaeUa8DsYhI8XrPYfTUYlDSc9oPCQw7Hf3y//JmlOceJjJSRS12MShrPeSkJadI2LqiBdVtrdIRok+3desNU1PsOcV9xpYlOVDffXu6OKMAIrAFin6KUfj6X5FoN6myCXy+To7g4MixMmXspnfA6rPX/mXbhAsqQha3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7N3heOc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7N3heOc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFgfre028908
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Eq5kxLTTzjq
	j4KYoKYMeeMDOnDpMwOj1SboVzjrNiGw=; b=E7N3heOcx/wkizhHj/1SljOU1k1
	ZwEoyYKAwIV25v7ul4WeTbDK7Uz8du6VG7PEDFesXihyu5H1DFCPjpJMHW553nZf
	h5tf6u6wdMD9oIC4+P0BijzKS3o59vqc6pcZhIcdIvrpLctByQ7nhgifAX5vr/UQ
	OhNDYL02ZqJ415UASVkiEZh4ioUJl6oOTqPwFyW0G0yf7XRmTpGwuVACSkXy0Nwc
	etZoKq8Xufvh3tHS+WKLTycFtdnfXexcAwsMrJSW7+sLu72Fw95dDV988tIaftTX
	Z2irKmDx5PX3Zw0bDb6LUYfHRCNEboeOIyYTssYDc/We7NRMpbE1K8M9rbA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvjpmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:15:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235e1d70d67so8207185ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228155; x=1751832955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eq5kxLTTzjqj4KYoKYMeeMDOnDpMwOj1SboVzjrNiGw=;
        b=LRa3xHIVCnP8SJXIAAZ4ZKk2V4utX6guqIl8602U0oQHH+Wy2zmcCEMMhi8JDKDqQw
         QJQN5Z8Rf3sBtOGDSwSZdL861AUuVDwCJeU4BZT65bJ1ZaTihpU+FSiUawjNAJXADw0A
         m3x5bMUQ1Rv13Vw15PTZbvDL9cVbOYSA++g1s6R06O4bqBNOMtdQpO95bSB6flmrvfpw
         wbqivS48R22HQBumMKzEXGIi3rv91iDyOL0LZb7zIWgC8i8TaxZvxPEqyJITIjmicHcx
         nE2i4DRqHisbg5rZl9eoDhCUgyNDW/ubvqenO1QZEnehlNI87ysWf1uGX8WmrMt0vg2d
         KO5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWProWpAwBy+9OSqe3Zeq7Qb0ilJevFPxGEhfFV9iuZP+LEQflIpb7HGmQfm8TO+pMP0qhXGhSm121EAag=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuTOynPMIWa7gCbLWzxN0P0ldgs8EXJJhSuHS3iqbo6jmvifeh
	WqrOjsBYl3HRvO+E1oRFYsPRli9gj5xFOhE7L0+j6mJhUpuIZ6yu/uyAzzbJctRr1uvIhEPdb72
	rTnbv32kDTrWkxbLtrKeRVWO9HCxHmE/FhF//w9SnKM2WGskqJ+E8c7PJaFNz0UdDpBw=
X-Gm-Gg: ASbGncsjczQsX2Behme8mO7NQ4qy6YGxwK22zs9WqzFGthhWN3fApbtdXeEsbkBoVRW
	LPYNRdxksZWwePs0p7Mbb/KbNi/Xvz5FJfn9VdRZTZ03kZpIktOoubtHPMYkLRiNpXFjNkr96KZ
	ikKAPKaPT0mzOg8MmNuPmKcfA1NkYAsIzHf9blcTTiAGH6v9AZxtpVAmylDg2knFU7HdYMbI2xn
	RX01GpOlwz14Y/7Z6IVK2lvOkR2onOJuVdqWz9vApFsKCOV+xx3zBSlaQMwtyKpDCylaC/Pkn+m
	JfLXBUF95GYZZX72N3easzENXfKS5DxYLw==
X-Received: by 2002:a17:902:e881:b0:235:f143:9b07 with SMTP id d9443c01a7336-23ac3dec40amr193803035ad.5.1751228154660;
        Sun, 29 Jun 2025 13:15:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7YzmMzYaVmo4a1PENReEL/5V/swGt42s5m7GGennouRebdx4cHCuSsKP1wUZ1/kFFwcF0lQ==
X-Received: by 2002:a17:902:e881:b0:235:f143:9b07 with SMTP id d9443c01a7336-23ac3dec40amr193802645ad.5.1751228154205;
        Sun, 29 Jun 2025 13:15:54 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f2569sm66066195ad.64.2025.06.29.13.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:15:53 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 05/42] drm/msm: Improve msm_context comments
Date: Sun, 29 Jun 2025 13:12:48 -0700
Message-ID: <20250629201530.25775-6-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: Vlq-OLXUnkurABOGLexHZ7iP7o5eSUyX
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68619efb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=WI1w4SIrP7wptn5q9fwA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Vlq-OLXUnkurABOGLexHZ7iP7o5eSUyX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX4CwEZsQiZ4Gw
 yWCMDGv94g7FMgGQr2y+XkoNe6qficY2b47wpd4DtWpXndzL4XAZdkWXgwY54Yd3BNwLU/dIh8/
 R0PwL3ekZvAl8ZO25ufU+490RsPYUHXzb/91KVIcWYqtrRUn4Jhxf4IK0Z1E13sSQCSx3sJbgzn
 cRUbumuI1b1y1Azrny4AwEobtH1G4H9HlAW22ztUwbyJAwlUKDw8glvktktAmDJNy7j3bEURi7h
 kcwWeaane7AEf6XHGM9B42qCQpO8spld7hmH08fo30fRgaLJf2oRoYCjnU/y3aoBkc4tO0j0JWk
 VJk8qc2at/121akEXRcYTnslb4ulC1mvyksq5IEftuJ3MYJNoNRFhKqKRP06iSABXUFhC7xy0kh
 lCavhUa3qzkh0hTSw28XfrxNtKE35pXVEcRhT7CS8XdVac3OmsxxgYCRrxgUXRKE/mdn1Dnt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

Just some tidying up.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.h | 44 +++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 937b7cdddadd..d30a1eedfda6 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -342,25 +342,39 @@ struct msm_gpu_perfcntr {
 
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
@@ -378,21 +392,21 @@ struct msm_context {
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
@@ -400,7 +414,7 @@ struct msm_context {
 	uint64_t elapsed_ns;
 
 	/**
-	 * cycles:
+	 * @cycles:
 	 *
 	 * The total (cumulative) GPU cycles elapsed attributed to this
 	 * context.
@@ -408,7 +422,7 @@ struct msm_context {
 	uint64_t cycles;
 
 	/**
-	 * entities:
+	 * @entities:
 	 *
 	 * Table of per-priority-level sched entities used by submitqueues
 	 * associated with this &drm_file.  Because some userspace apps
@@ -421,7 +435,7 @@ struct msm_context {
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
 
 	/**
-	 * ctx_mem:
+	 * @ctx_mem:
 	 *
 	 * Total amount of memory of GEM buffers with handles attached for
 	 * this context.
-- 
2.50.0

