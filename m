Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AAF280CCE
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148377; cv=none; b=jL0p/3iMp14DQzRdjr+TuoFMBlHzSn2+2m1v6ICP3CS3NsgWxwJLrCFY24jq91YvYPsNSdykSs0RwUZSUKTbFZXvnGgsP8z7ZHiTeVcnWKBY3h42ncgsta46FCLGe3kpxluw5It8ywoUZY7Riqg02GsBtUC5QLOep9tFcZaS+EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148377; c=relaxed/simple;
	bh=asg0ofK7A9j8GXUsqP3RShrmeE25j2whkBS5nOJbEJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EIPO66QfF/Kogf10b3j3seIyVOjpTdPm7JIO8eqYbWWtwG2Dp9MlXkixXq9nB6A6wUbV9jzZ1derb/IEqcdeZDOjkXthLjCYmgrjiCFzW2a0yPUnTu32ZJOuOtBJR5XwWI4iPnuVPDzvTlBWUwrAKz+dou7itbwrAkjrXEOTArw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nCgqBwvc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nCgqBwvc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HV3rU006413
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ffdUUPweRzg
	vpO3v9DoMvCSyNHDyemApNNm03T9kbrM=; b=nCgqBwvcddObPEvajmL7730nKjU
	/vphKVp4/wfzO9IZG+mUCSlP7tSU3GaTGt2ZMXBkf7xHGVtxhVEtF/0DmdxQIz57
	XY35OBMcI5sEtRteJjWr5EYXSSJGDNe6bexcOa1MpqCEaQrVMFpBjmAdaJvHSBnn
	6xseS24P4kwMN42wZACQ9HZS+39/zL7cFBtbpTOJgjnhzWDw6VHhAEdtb30p4JV7
	o1yVwyuLt08w6dLObLF00I0yThX/jaQQqt+/FQ6zQ8trW3cQE+fwFyhBQw89b57x
	iMbDEOEk4jzepqsG4HjCxcEYraW6BdMpUU5rQYkb6/CVQMRuO6sN+ZMnuuw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t2abr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:32:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-231e059b34dso11371535ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148374; x=1749753174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffdUUPweRzgvpO3v9DoMvCSyNHDyemApNNm03T9kbrM=;
        b=jPWCm7JD9bUdvTdBlVHuwr4yTTJE4K46wTe7y8c3pU914LFwWccwC84enZfZC4DWCn
         Wd+xqJOxjgfS5mIUOfWH4ZRvM58LKwJaZDEXpanglIqkc5Dg7bEq315bMRU6gu6dO3ZL
         M6WFb98SVArXR+4laK+GQRZmK9LZcqw8bZB+CxYxx2SOgkfhXnX5PH+CJH7OPmAC2j+4
         ED9y45516fT6wjmeB1hcMZDpIZhtnw8bAPM4UvjJZQEFtRGvf9KUyEICssUtjWtdHrAa
         U7xBaud9j4l5xjkSpdbkE0VXIeRHk9nW27oNDYyif3exBYvggcb2P+5/NbR8avgSAgdi
         jxCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT7yYgqs2EeGDM1SqaTeQxHOCmoG8P2ywhGWJK7nP8JCrh2YAE3dyj86pXgTJB7Wvs6J1sX0vbfthSPQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe7E1Yd5JPz5Sc6oSMW87Ncx00OV0xJVojBIE6L/iuvTVOiOVc
	ZT8EzflSkhjqGTixrOEKsVXnRoWuWCDZ6Pu4QxSNk0GYuxl6/D8wHtmDCidCrDLa4J/AjMF7uk7
	hkGRjW9ro1qAJEBGU8avuoGktIAkHfmDhqfw2UsRCh16JjyHXo6NtRl4VEtX2+G5hBMw=
X-Gm-Gg: ASbGncsKv9tHTcYhhtmEcb6/FGQfKFu0ujhpuvGSd4rxYMZuRSR86yKZNtQJKfoMb4S
	o3KCgVavi8yt7asLXbsYy0t3QPJBV0oK+41FnUP/KA/36AAQTj40Fg4nVR2TnEVNfNQ9Jl0eRjZ
	97Qlqp5NBud4da4Xjg6nIaTQ/H0UAyePFSaanbMULuHk79GS9BIMGL9aTHAyu0qhqwPx+RPriKF
	KqIH/lAy5JFe2PS3cTo0olLl0YVDe1ROHKKKCWR7sKwk/nK6XDnU42Sg8JLgql3Uu6boN1fycKF
	TLjfZjVxAOLDgjU4tVRnUw==
X-Received: by 2002:a17:903:8c6:b0:235:f55d:99cd with SMTP id d9443c01a7336-23601d04741mr5714545ad.9.1749148374199;
        Thu, 05 Jun 2025 11:32:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5kPTJZ9p7ITwX2L2PkFEST+pWrFDoURTl9jpp7xvKlXfywvcT8Oeg8Fe8Ntp7oh74HigMLA==
X-Received: by 2002:a17:903:8c6:b0:235:f55d:99cd with SMTP id d9443c01a7336-23601d04741mr5714185ad.9.1749148373797;
        Thu, 05 Jun 2025 11:32:53 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd75f7sm122855085ad.111.2025.06.05.11.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:53 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 18/40] drm/msm: Drop queued submits on lastclose()
Date: Thu,  5 Jun 2025 11:29:03 -0700
Message-ID: <20250605183111.163594-19-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: WItd1sNfNMwuZZ12GceTt5khDAyuGqgn
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6841e2d7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Vc5hAS3c26tUa1HFGawA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: WItd1sNfNMwuZZ12GceTt5khDAyuGqgn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX0uG+UY/ibF8l
 dRP3yQ9cPIjaNoJWkrxjNHW4BvanaJh5VG3ET3NKS2/Sm8DsGRZg/H7S4Zk9Z/LMwiOUfeTxXVy
 o3wsfoQ0ZFZ1okmlj9RFciA59BKKF5mmNfHhsrg2VNb6FRj5TgrSzOwykuuHb/zRsb1ZjSkCC2J
 /gBpb+aAXXEbN0sX7KRN+FgJ0Hk7AJDz70gYKSDTsC9bkSmGz/U0hA3wXsFMSz8jlCsUm7czLO5
 EkPxfn65h6Hks/Hvh8icg5ysmR0mkbmO3wiE2bpKee28YCVdln6X9r7saPMlN6OkQR9JGkf8Pf6
 AzBnLDukSITc0YFnu+SQa6E7ulXOH11rzgPvEIZPM7hbF4surQf5biJVmNE+lUJP4fLeOkosI6Q
 6uzR34MVXIRyxfjc7rATCYL7mIizSDQNvfdlOoPPndY0hzG3yYLXqEtcfSHMErCiPl24qc0R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

If we haven't written the submit into the ringbuffer yet, then drop it.
The submit still retires through the normal path, to preserve fence
signalling order, but we can skip the IB's to userspace cmdstream.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c        | 1 +
 drivers/gpu/drm/msm/msm_gpu.h        | 8 ++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 6ef29bc48bb0..5909720be48d 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -250,6 +250,7 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 
 static void context_close(struct msm_context *ctx)
 {
+	ctx->closed = true;
 	msm_submitqueue_close(ctx);
 	msm_context_put(ctx);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d8425e6d7f5a..bfaec80e5f2d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -362,6 +362,14 @@ struct msm_context {
 	 */
 	int queueid;
 
+	/**
+	 * @closed: The device file associated with this context has been closed.
+	 *
+	 * Once the device is closed, any submits that have not been written
+	 * to the ring buffer are no-op'd.
+	 */
+	bool closed;
+
 	/** @vm: the per-process GPU address-space */
 	struct drm_gpuvm *vm;
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index bbf8503f6bb5..b8bcd5d9690d 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -17,6 +17,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	struct msm_fence_context *fctx = submit->ring->fctx;
 	struct msm_gpu *gpu = submit->gpu;
 	struct msm_drm_private *priv = gpu->dev->dev_private;
+	unsigned nr_cmds = submit->nr_cmds;
 	int i;
 
 	msm_fence_init(submit->hw_fence, fctx);
@@ -36,8 +37,13 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	/* TODO move submit path over to using a per-ring lock.. */
 	mutex_lock(&gpu->lock);
 
+	if (submit->queue->ctx->closed)
+		submit->nr_cmds = 0;
+
 	msm_gpu_submit(gpu, submit);
 
+	submit->nr_cmds = nr_cmds;
+
 	mutex_unlock(&gpu->lock);
 
 	return dma_fence_get(submit->hw_fence);
-- 
2.49.0

