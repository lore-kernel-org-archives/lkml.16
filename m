Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A81238D5A
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206074; cv=none; b=YYkQ6vVawCKSVBzqATA4sTS+FO2qSZNc/5++phn7fzrbhUavXJF3oGxaL98mt+/9j7TLumJMzBFMiM53NWfeDq70oJPM8JyScYlk+xRw1V/l4/aAZ1wQ6OxOx26bpkxqA38j8D1cEKwR6rirmkbsSpHALiMrPfRNJQTSbTQKNcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206074; c=relaxed/simple;
	bh=hFu0EsxKzuSQGzzTTvNrSL2I+uVbcASFTMQYh05jHrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IPbVN+P2g6dc3EILEdSn+Og66v53zhWcXNe5g1x94RwugPFaR1j01YYFEs5yjBK33G96j7MxWbS+8cfRABeW3OLTleLd1at31iHJQmL3E2vWqF5RVa3stdvainqkJkKOXEX1lFKt4KHz5q4fS78Zf7c9G4OUqpNHqyFgCQLMhJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G7p2+MR1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G7p2+MR1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAh20W010025
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hadax31kM4+
	sOKW6+ZA9wpUzRSoBTDuckmpOBYZlztw=; b=G7p2+MR1tEeDzDKPrPTuONNUP9L
	zniDCHXGtc1yGhFtQi6/f+A0mjHa9KRGDipcgix2StQjXvu2K3jqfBPfWwDGLZMa
	k63IE5FIeaa1VYDLcl1OizbMArLJtKEyg88mCWHCp6h001QoUV6lYQ+wUWfsEqC/
	6xkSxNkonSlxF9JR2i3gQdC5AlP89yk016J0Clz1t9faeU7tgKOi4k1fOhiORnpi
	RInMtwKlW75mt9jtpn8mSOcWKqILYUDhFKxKDnuE04+miR8PiqomEF2z/4+nlq1d
	cGTTLKndwWk9yxIsWnb7ymZDJiv5SFRFlhsUJ+K9OlZVEdMkQBJSSmaFfhw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801t7rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23536f7c2d7so19745125ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206070; x=1751810870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hadax31kM4+sOKW6+ZA9wpUzRSoBTDuckmpOBYZlztw=;
        b=ZZD3nJqcPjWYAbYwVSMv0JHMg65LbqFRA/dBec4HP2ROpweKbwwoHxm2QBGloScQQt
         5BdXF8oQSkrqXZeMhqVDxpKmFUEdfRoFEUNQzx4vGfJd0mzoWrAae2B27Vc8RwxQM3fe
         ZF0j8rOeJSFsYATLoj/ZyFsLu29w1smNFgJzda5/nVeWQZRMQLnjL2p3T69aWnkv0mit
         SRnfxGtF9UXnHEzCbYC4mEF315IzFl8sRtYsmIpLtDMAUGTDcQ514FyEajdFPlyfjTz6
         ZWDO3iDycB+oqEMzc8eGlA0Gq4TyW7/svJr9AvaDqN+j68Cii8a+QQKeUgRlYi+hZJaR
         kGOA==
X-Forwarded-Encrypted: i=1; AJvYcCUsAEH+ChU/HhqfDId7z0lX6Ap+t9V/OTJyuGuX47Q8ob0FfcqgQkhjnpx1ucyj91GVjjWZIK2AIBoP1bk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrRXTNs52Kp0XdOE7YjjranU9Y9hfDIolb1fg2dRrbOpbQmMQ3
	OJktEsPKPixeTxaLqZQBErHcJqYj99rtVmJomXAl6kSZ0JIZPW7PA07VYDot403ab9ZlKhPf20K
	Sg1WvJZyAgluyqB3si6z9wbUS6PEi3A3mr4SFg1x0KC2OlockzO4783pcjL/0EEzdeFk=
X-Gm-Gg: ASbGncvBSNUZlwY1vIs00xrs8ZsYv6SWtT6ey9X6fABJxc0WeUOyEtaY9KAMO7q+FTV
	jke577slA1mzOeaCEuubKngeHPMxkMJzl7Kbi8P4bUXBKoOpmUFe4ox8rsOyG8VQkpVs0FvSOHI
	oZKGF0DXDuH7JgDT0KLMKEtsOlu1Hmwac3ktzV3NZ2CMSV89Ayrz3wIkFpMncpDEfsw+LtHbvZN
	N01vIVvw6PKFt64bnaZJqB/W1XbX961ZfbJLgJzOgLqCxdDtEzK2eJOlKQjoryz2kqOnxb9tZkr
	6Ojziy2ZPAk7lT/7W16Nv/b5A02mVYDz
X-Received: by 2002:a17:903:2449:b0:234:ba75:836 with SMTP id d9443c01a7336-23ac3bffd8bmr147181755ad.7.1751206070489;
        Sun, 29 Jun 2025 07:07:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhgyBQ8WKKcLovdC2oavEyunsP/RHNeiUVkDACGNy5ppa5wMTeH1fWoAqZmD8XHl5viNYZ3A==
X-Received: by 2002:a17:903:2449:b0:234:ba75:836 with SMTP id d9443c01a7336-23ac3bffd8bmr147181445ad.7.1751206070100;
        Sun, 29 Jun 2025 07:07:50 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39baf5sm61278095ad.123.2025.06.29.07.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:49 -0700 (PDT)
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
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 20/42] drm/msm: Drop queued submits on lastclose()
Date: Sun, 29 Jun 2025 07:03:23 -0700
Message-ID: <20250629140537.30850-21-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: NJqkbnGh-bT9tx96XdS2j5ecVNTZTh13
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=686148b7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Vc5hAS3c26tUa1HFGawA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: NJqkbnGh-bT9tx96XdS2j5ecVNTZTh13
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfXxrNcz3K9Rq5g
 XYf0GqnwenrgOHvzRcr8mKC6WBsm2AauEQ+GUShBQO3bboUm3mbbKtPRaTg+mrq1gb2yVN8k8JC
 9mQ8dvvSdSmFvaiYLho4eWng+vrpZWD3MGCZnZv8a2hlvNIVD6O6FmNH5WpVXf+keGI+5u7lpch
 KrX2kGxLw6baXMiNrxhUf6/YQIYATH+htEvfA+kOJRiyXDG/3PAdhct1POrcKEylZ75nSTuCWk/
 gXSbe68blneMFNT7mW69KScgEbCqSYecwoDRN89RmgCNRRcn67aAbYCaZjJA9V2HplNx94QhFIK
 m8EU5P3/B2U8yHerTwRO6thdIIrgqq6pTzIu5Kib0hFV1WDedagAqh8gLxYLwz2S3mSg4+Wp8+p
 zHvi0hxg26JCQieBlpWkmvzlQYfayU5o5QMlEVZxm6UT20Ot7ZpRszTzhxUZ8XJJWhfMccYw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119

From: Rob Clark <robdclark@chromium.org>

If we haven't written the submit into the ringbuffer yet, then drop it.
The submit still retires through the normal path, to preserve fence
signalling order, but we can skip the IB's to userspace cmdstream.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c        | 1 +
 drivers/gpu/drm/msm/msm_gpu.h        | 8 ++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 488fdf02aee9..c4b0a38276fa 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -254,6 +254,7 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 
 static void context_close(struct msm_context *ctx)
 {
+	ctx->closed = true;
 	msm_submitqueue_close(ctx);
 	msm_context_put(ctx);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 231577656fae..a35e1c7bbcdd 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -356,6 +356,14 @@ struct msm_context {
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
index 552b8da9e5f7..b2f612e5dc79 100644
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
2.50.0

