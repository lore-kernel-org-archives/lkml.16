Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EAC2F273D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877943; cv=none; b=P0/fNOk2LeB/8oNgvW/SSBXV86+DueIOLzieHGqJjB+9VVp2b8KOSrasCuCbfOx32Boq2e9amEhtzIJ7JbF+twOKrZBOgHe12Z1VJx/5y4mBD97L8Vwo0wyXkSgNpqtSQQl324l/p+kaOb1vXQNepQ2VKlbC+/wRqAtC6rpdjE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877943; c=relaxed/simple;
	bh=4K+ThbkPsMfskaKnhREr4LpxGki6i+xf+4qaxzdTSv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aFnIDDzHN7S10CsbzrWtqo4MuoO7xY8FrWSQ8G0RDGxiBu2nVwMX0pcQyXru/sUtl108lBxQoLNGKBLQzD4Uh1NPE8S9msnjHwxhJtLhJ7BSa8EIavGmKEFcfHoJ4GGUOp6B4V+dsoxe39CBXyXdznInD7VGFeilMnshk3uNZSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y5Xb9PZA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y5Xb9PZA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCaWUc014580
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NGLp+jqx0Ko
	YMf7JXKfzU6SErPKJ/xFeT0XGQHG0jTw=; b=Y5Xb9PZA5V9SfHTSNZrW2S229Ep
	tf/237o+5A7MKzfVbAdzgxyVjbOHkY1SgpLzhUoHQ9SDemhASlhCZWJ45CX8MtXJ
	qxqF2J0nNrZFlQYFYXVelNk7T4IwmIF1k0RexZk/viAIU4Fsc/Rg48UHw7Ark/AO
	oNywZl1jaIXwov679cvJWjQnJ2WhOD6SvrEYl13wbj+e49gMxSfLU6HS3T7xBx9b
	z23pPwTxjylsKz0DqezgrusMW9OlI0TzHz6LTUowPhNoQbWjI8LQhauB9pNBd/N1
	LRPc+PBaHJByLxz2bvfWRHLl8sdC6EhR/mCTbtvmo1zAY0lyh4JxriZZDiw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5t1qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748d96b974cso173368b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877940; x=1751482740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGLp+jqx0KoYMf7JXKfzU6SErPKJ/xFeT0XGQHG0jTw=;
        b=JB6M+PIsxl+LQCF7l7T2RYQ77eu+EJFoycEGDY1dm7pB8VK9253YBIxHPEze9zq2kk
         go3KRXiJmpHoXC9IQx8coP9q9qqLHNZnOIJU5qZMY+b+JExmwDy6LkEahnB8VAvE8X8+
         Utk9dP2VdqPmGxjgJ8n2mZGrTUazzq5bbaidA++A3A41QZmRMCvbNCfet1n6ePrMzNxL
         x0tdJxigZIBmdeILwPEOe0aH8jwpeijKbYa4xOoQr7ToDb42kr1vnIjtVR2WRd+YAraU
         /SvMbXo6LXPOnmqKhEed5pcu6C40QboQFo3Ln0PWk0JAVaGMqajdRcsKD+w5hFqh0JyW
         5kpg==
X-Forwarded-Encrypted: i=1; AJvYcCWiSBG7K1192tN0I+c4bwVeNbn7XyjH7OHcSyShCLcZxXjOKp6zsEJJhHr7gLUP/Xs8FA9ntQxkOZ1DXIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3kTNNLPwxIpVW2hmp/PP8WoR7TIhOOYFW2BC4yJZz/s9hxBQm
	Zi4ubPpfvoi/anEVhtQtcJiWQDmZVIITknd1iQ/sk1vigqaDmMzjb5gYYLLlDtzC8L0Ry7livV7
	z8bUvjf6HM7xy74TdRM9qrc+avYMg27BNa7itIz0V+ZEfyoShvk663kBBiH29VAvPFq0=
X-Gm-Gg: ASbGncswdtWa+pNm778/HuaBB2g83AS1uaf2bEQPg4rqVmsilu1qRnWiGg6wOHCoYKJ
	9irOSfOXLldUmS4jLscuZiQV14dGNUXKVBAHl6/Gg69Cfo9QDDax1Z8lC7I540II620uvA4dLtJ
	HeQiEO9W4ArFcIZeeSCMd7bq3SYUOoGzY05dK9bL3nfmx3g/Jc8h1zvyrbYbGYZAH0FjAKV8L96
	k7g3LFiG1nKUI0dcdurzmXc1HndmQzsEBN88MGmFU76Kxm+Nv7XXKu37y6NSI2BvA+9pa7G/qLo
	nSSoUVRalFp93MXKnK7BwFVwaa0HdYEH
X-Received: by 2002:a05:6a21:99a4:b0:21f:becf:5f4d with SMTP id adf61e73a8af0-2208c5b6de0mr1386083637.20.1750877940369;
        Wed, 25 Jun 2025 11:59:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGjs/J0QvS0VnPAD9ghs0ZXCa9bknqb6IuT0ol4Vr7UUmIFGa/LYVfwR/mtK9s9csP9ptJgQ==
X-Received: by 2002:a05:6a21:99a4:b0:21f:becf:5f4d with SMTP id adf61e73a8af0-2208c5b6de0mr1386057637.20.1750877939992;
        Wed, 25 Jun 2025 11:58:59 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f118ea18sm13411229a12.2.2025.06.25.11.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:59 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 25/42] drm/msm: Crashdump prep for sparse mappings
Date: Wed, 25 Jun 2025 11:47:18 -0700
Message-ID: <20250625184918.124608-26-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: XRCN72V4Vqu1bJZVtFp-yvytoejziCRq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXxpqSS84YHZcx
 x2sDAGpqOzB2cjtd4Xe8/5dsW+lB7grwIYiP3qGzwl3PiW6cZElHsLQBLNEXHXrzkShjJ3Lt2al
 qBtwFnIi37Tbyk07Zqfj1e5Qa7fZNI2ZuHjwRUZGXzeXY0Qgd+AibU++cM0cX98vUgZ79SqH1+l
 5NcvrmzdtHNqskBiu0VPu7l6Mfvl4UWhQ55hOzSE19qjZCEx3N1DLVuHyMVFweOPvdvTD65LOb2
 jvANQ6WuPFuXJKBtlzOVI3GUEHI8+dSkr30aFTS3EtD3IS8zlgaBDPZBWFl/1i0uUyavYj+9iSV
 ZaFuYxDA+9jHdwPV1rZFBgaSegya4MJfM2HBkjF2dXa3gXgQ+OvO8ZyBvSwP0FLIaZd6xdOma+Q
 flVQNYlK4vRP1WAD5/E4P3o7kRRuEqWHBdODT/LHsLj29H2Vb1aBOZi0FltdBlv2BWXhftAh
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685c46f5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=bYXzjpskvHxJzFY9Y_MA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: XRCN72V4Vqu1bJZVtFp-yvytoejziCRq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=932 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

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

