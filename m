Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17036284669
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148385; cv=none; b=p8x0zLRCv0xs+sqhwCs+/6OhqzZ2OsydSvfHRVK1yMHVval49mgVMtby6I/DEBb2eJH1aNxSxoJ2HLNqoJWj6rgZ+yTDArE7yJrp7AgbOkLEqhDWWYVAaYMujggmSY5daAk4l9WjoQx8SJIikex4gQS7KVOzpfow4wSJB5AnyRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148385; c=relaxed/simple;
	bh=4K+ThbkPsMfskaKnhREr4LpxGki6i+xf+4qaxzdTSv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSsPMdj2AOvCCvUViER+A/s1T9cdVSGO7KtLt73U9yhN4FBKCyq1qkS5+VtoOwHSuEySlCV051rbzvROTxu/aK0aigMP9eGvPvI3fKWeV/taBk725wErPsm6Hl3pvCG9PUYHpb0p26M4kE6PCK10ru+zi1A/y+03qEQsM9+SwnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I//7Etx8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I//7Etx8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555Hsu1u013521
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NGLp+jqx0Ko
	YMf7JXKfzU6SErPKJ/xFeT0XGQHG0jTw=; b=I//7Etx8zRlLq5SrZlnM73W8V/v
	U8OLIX275hpszornK8w1yHVIvocN0tdWCenQbTLRT95l9NmSPzCdGgARNj9MRfrb
	BW1uUOt+Euot9uIF+mmf4zMzwClJxAlaJPxzSayS0lzJRW94+IkuYpFXehXQdgSX
	eEjLgOPyFA/xcdf4OZlXM+UXOyCRIXtPAThqLvPpmyBLMZCvl58haGxoueYusmvD
	LzBOe0nq4JTVuGpBBAf62wPlbCNqMZsS3RYWp66zgyvC1SJntiN5ZNlSZmGwO8hu
	ByMaMiZqZkngHstNtKp+hjpHY9xRmk2OAxlka7kEtfXNd0hNXEuRIaEfxsQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nt9uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:33:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235f77f86f6so6209005ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148381; x=1749753181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGLp+jqx0KoYMf7JXKfzU6SErPKJ/xFeT0XGQHG0jTw=;
        b=dTVMNdT2uRwOTPmq2E/0J4ASH3NSSmy1uOljLQHG27+MujYL6bjPCVFFe9lA3R/ZJ8
         l0Sur7yzrWSOO311CKSSIlGmdPdjrFoXBYa8t/MYzMllY1676vmP44clrnlsDHl0o+gg
         f0w6tHxwb0sxBHfkWkXjQA9kxLIeht3yYy2OaW4ZDcV8ztOHyLCsGdzMAGsBb6leBPF4
         wcdNLVeimqB4Ioas2FY+Y2aZ3mIq2WHc1uZt9OgJPrG2ePV6QBEnYxm/xvobHzFQJTwp
         4l6SqaqeveY3BfYFdkTuNfLf5GeifDKuRDm4Riv8gtLM0Hb08TAAy8HKljKKWWxicn01
         dcvg==
X-Forwarded-Encrypted: i=1; AJvYcCUqIJ7leQJAW6/1ymcNtHP4Au20v+Oew5wABm/85WfmzcM6x9WxTNHIvP2Z6Ii4ry4GQoV+3LO+RS+HFmg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXSp48GPjH7495YBTnsBpuxDl3KqUP3yxv/pAl1vffAN4z8Bg9
	WykQU5za5pG+96pvWTd9J2r271B/FMyOaJ+eqjGIhHKKfgwd8124p8wQ3TTvFVHmlVBib3a7Og0
	4/NnA9ig6wdxrH2CxiwR9xqr6I/vjgcvJQaiCfmjWiTf76msZJqmdA48vutCHEnucNI8=
X-Gm-Gg: ASbGncviOiOKpTxwtFyf8H3rkRSoAFT3DukbWdosJoNNRikMJnQFWemmAW8aeKzH6/p
	uU/VPkYYbTgq0z3yr+Q75rWTVQdZ3aOMx2v4FDMzkoB6Zz+ifgxzuxIxivRAlf9oQFMvUXioPvq
	e6Cr6HhuaChtwgigFbm/J8E4hIsTsXqMGwxsH5GrkFeMsMW7V4jkia3OznxbRNYZgczUMCtSZ6d
	7eFPWpescdM8I5a44mTG3/m3rSCg+IN0zRMLje/dehk6H8vGkv65Vuu8VjFdmd99pDzkhBKEuHR
	c6PlmEe5L57QQn10oiKeiA==
X-Received: by 2002:a17:902:ec92:b0:235:f298:cbb3 with SMTP id d9443c01a7336-23601d05c8bmr4749835ad.18.1749148380928;
        Thu, 05 Jun 2025 11:33:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpPmwrnH8+LJaSqhhgdYBbgE1xYsGuSFpMvCfWrk4O73LnRkaIOhIZ9zOZwzNOMM2oXB4iOg==
X-Received: by 2002:a17:902:ec92:b0:235:f298:cbb3 with SMTP id d9443c01a7336-23601d05c8bmr4749565ad.18.1749148380530;
        Thu, 05 Jun 2025 11:33:00 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349f453e4sm68227a91.28.2025.06.05.11.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:00 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 23/40] drm/msm: Crashdump prep for sparse mappings
Date: Thu,  5 Jun 2025 11:29:08 -0700
Message-ID: <20250605183111.163594-24-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: 8szU53fMEeXFtqtmuyJqn__rbQ3abjVq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX7ah4yTceXpip
 tEST0KNPk7jRysKhxkot1giRZK79wahAqBnpBp/uBG+JLUAjAWUZTyIiUPlXmsOmdqN/FsA0RP2
 XID5UbDzVSfuKVFq6Byn5D2niUsiewDp2SWdeeVFUfLmWlYxYS/D3PjGVi1joPJ7B9FnBQpZe2Q
 yygObL7ZLqiACHjl9NugQmDaLNWW+flHbUXNEmfWohmpJ/sdEf0hNl1n4+s1WSoSsVOuD+SC/dB
 +qzh9dYSlCbfgwjSs9KRB+JsXP7oxhiTCy51BwG+r5txRLdhYZXO3nR8K0B9PwZVEDqfpUF5x/8
 EelGfFITRZKw2gsUgfxI+ItA1+cmBpDVUOZjy2+xwI3xlk8PB2hZAWN8L4By5IBElfNV6ObSUDF
 rmF6hgNrIb/ymT8IMQsPtm0yWTnsFi0Kd1NLkEdOG5MBTrnNpCmHHTdO4MRm7ZXIyjWvy/IR
X-Proofpoint-ORIG-GUID: 8szU53fMEeXFtqtmuyJqn__rbQ3abjVq
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=6841e2de cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=bYXzjpskvHxJzFY9Y_MA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=933 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

In this case, userspace could request dumping partial GEM obj mappings.
Also drop use of should_dump() helper, which really only makes sense in
the old submit->bos[] table world.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 6503ce655b10..2eaca2a22de9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -219,13 +219,14 @@ static void msm_gpu_devcoredump_free(void *data)
 }
 
 static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
-		struct drm_gem_object *obj, u64 iova, bool full)
+				      struct drm_gem_object *obj, u64 iova,
+				      bool full, size_t offset, size_t size)
 {
 	struct msm_gpu_state_bo *state_bo = &state->bos[state->nr_bos];
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	/* Don't record write only objects */
-	state_bo->size = obj->size;
+	state_bo->size = size;
 	state_bo->flags = msm_obj->flags;
 	state_bo->iova = iova;
 
@@ -236,7 +237,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 	if (full) {
 		void *ptr;
 
-		state_bo->data = kvmalloc(obj->size, GFP_KERNEL);
+		state_bo->data = kvmalloc(size, GFP_KERNEL);
 		if (!state_bo->data)
 			goto out;
 
@@ -249,7 +250,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 			goto out;
 		}
 
-		memcpy(state_bo->data, ptr, obj->size);
+		memcpy(state_bo->data, ptr + offset, size);
 		msm_gem_put_vaddr(obj);
 	}
 out:
@@ -279,6 +280,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	state->fault_info = gpu->fault_info;
 
 	if (submit) {
+		extern bool rd_full;
 		int i;
 
 		if (state->fault_info.ttbr0) {
@@ -294,9 +296,10 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
 		for (i = 0; state->bos && i < submit->nr_bos; i++) {
-			msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
-						  submit->bos[i].iova,
-						  should_dump(submit, i));
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
+						  dump, 0, obj->size);
 		}
 	}
 
-- 
2.49.0

