Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97CC23AB87
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206081; cv=none; b=lSuYLasxEC7M9b/HLLQgI4doA+5DHQctzSjPpNKEtRh5c6L+T9Pl1/v8mzpqzQTx0GkM3XKABfh4MQfOAPLv+RP/jOdJVUfeeY7qOixhiRz7R4I0rnGMHp43q+LVbWxRsYCVSBJGIlZFkGtyf++sPkb00oKduqshMjzRdWKiBI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206081; c=relaxed/simple;
	bh=e1ndf2hUIh/MotZmx2Og/v+YPEYB0tTP1wLOvcibMkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WIPyMQxKXpK7qUwD+vWXQ9SaqO6LJY37dTbsVB1XLXsWi6vyDT8UHbp9jr1/i7z6Sm3wJ5+gDZq1J7L8bTNEnlWGxtAnC8hc3NxmAnmQBrU+nfDaVu9UAiFsSvwbG4DrK/AOaNGS/1wFW0oTvS0aOhmV2vjnMPKIwW9olZ1eUvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AvrQEOSb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvrQEOSb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T5I8iu012920
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MXd06Saq6/9
	4jOhWiMbD0wlZ29ngCx2vyB54A9DMyFk=; b=AvrQEOSbhfdN0xqwsF85EH/HC7k
	xLezfbooaKotPeSRtMFPQsn9IMe+mzcDe9yto3tMVk5+QHx7J7+w9ddq+n1JOege
	Rnzd5V+LUM2ZyzveJ6zDgWQKrwe01uTn7E/iN9zIVrRekDcOHMUR8MegjeBz7Eu8
	XLUzfN3qehP6pAi952Ef5rSqmjpa6UnNPPHjmkzHAP1tGJUWiqDy7KP+LW8WpvGP
	4abIDFyWCv8oUoCbE6Cj5ul+Af5BQ7yp1FFXljWtQ45H4yzYpZvMQHI92dpudn+D
	xPDQ/SMcPHweHw4+ocJTKdZdrYYKz69Ji6j9+eYtJOv0IQHPsE5JudZhYSg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2exu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748b4d5c045so1106139b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206077; x=1751810877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXd06Saq6/94jOhWiMbD0wlZ29ngCx2vyB54A9DMyFk=;
        b=mPbHcQLAlQn41HPFZHAV56SjkLSJUyKVMqGTv4ipDG03oVZZwhQx/mVwuvixmjXMCi
         rjG1scjruBdFIDjk1Tbp+fH8tUbfTfrbwK54jeXS5f02TZ1ikz10zXhtcliFxokq+SIL
         1/aZtyR2UL0BaptEk+K2BC8qnlxMPWYFB0TJ5gX2rfiyf8jKEs5DMFvTV0uVZcK0fdgn
         pKvImFtehRCymbZR0QGByKu3ojy1Dnazj5NbOWloQT50eg72VXJw5DYUxooYvRAjJiM2
         4+24OGoGIowoUkYw94NNz2fRe2L03LqiswAthEtGArPPi9eVfWHVee+G9iLoP63jDhqp
         KEuA==
X-Forwarded-Encrypted: i=1; AJvYcCV3o5vEs+kZE09BB6/WY6UNqH++N24y8yKLRhQ4QWKXzlQkrnChxB/ir9HgL3s3Y1v3BjRLu6dNQtBaZAA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtt6h3PcifZTPirS2Ngxh58eL+Qx/IAbs76y6iW01aFzFpv/xI
	ldWoF990dYMO5efG7ap8g0+a/ARqBzGbJyIyAMrwqv7JAAd+UJCrj56hZmuzmmFCYmacIk0dd6V
	d8jaahGou7uZXR54BgJBF+xAueJ5xGClSkSGaXn3bN7sNUChZLUJz8huF6IAUMQKbzzk=
X-Gm-Gg: ASbGnctqUgfrBjBgQjmmDPw7CS2J4YMLLsQwbnK8ZqbDjnwpSfgzm5Hf7XqOd3ecmb3
	3aLHfH+j/pPIDNqR+U0Kio4yLPYAONZNeVFLu1gUhOv1RVcBdi04RbG2w+jzspI0QXSkYFlTtEA
	SeNCQu30q9z9Zu9Vp7eGhdaqPAxaGyhQYeJzvBLMQwGx73Fp4KFvUSlAz9JQoWU9YoZhGRyTpjU
	Z0lxVSEUI/Y7q77t8Ufl+OoPGmdI0hKzhc8sxlg69CJIdmFsQNE/whrOSEl7gKy9bWqXbUHGFwB
	0l9HuU5Pi03CVb/dysKpd+4jxNngFN81
X-Received: by 2002:a05:6a21:6d87:b0:21d:fd1:9be with SMTP id adf61e73a8af0-220a12d79demr15914443637.12.1751206077504;
        Sun, 29 Jun 2025 07:07:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtgMbaSrKXdEfb5QEosJVAua6RMUWIaHI/JgTIvRcRP5uUb9uPs6eSyW6TYvQFd3rcAy5Dqg==
X-Received: by 2002:a05:6a21:6d87:b0:21d:fd1:9be with SMTP id adf61e73a8af0-220a12d79demr15914401637.12.1751206077089;
        Sun, 29 Jun 2025 07:07:57 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31da944sm5864319a12.60.2025.06.29.07.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:56 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 25/42] drm/msm: Crashdump prep for sparse mappings
Date: Sun, 29 Jun 2025 07:03:28 -0700
Message-ID: <20250629140537.30850-26-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: qrh0JS7lwF23aVoVTJ16cOpy4riS5YXt
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=686148be cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=bYXzjpskvHxJzFY9Y_MA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: qrh0JS7lwF23aVoVTJ16cOpy4riS5YXt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX44WgiJoaQqDA
 VT98IJYg00k59kfUGOnYX0cD+/KkIJbjapvZlpozLVBCDIjG1mrvN2KOPFWxYYMymUuyW67tJLo
 0Po1snksV4dZUS3mkSMc1pxgJDyQ9AVAhe4GVBD5G+fY/DNhCo2wd+yNyjgfkRG16wsI5wHtw2K
 scVOvwORK8Out6sOppivW52+Z7F7bRMJ8llDrCfS9dBdikbUcbl0vEL+/YAwQBxg5qeEA/tRfYd
 m3ZK9SzvRPbQdiJEWpH+zqw7RA/LGfeIoSYeTspjkMIERwa2wPIcwHiVQzAdl2V/Ctcp5N9VBDy
 gKUzCqVBBm1xGlz9ulSnxJHTGctlw+54P6faaZCvI8/3XnMnwoenWUOU97eiuUAO6iEOHy4an5q
 yIANZkfTkzTVkmNIonRY1FxwcX/syXDu90yk2xJkeQnXYHHlJNTliOaHWw8fjuwNFuqchF3g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=933 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119

From: Rob Clark <robdclark@chromium.org>

In this case, userspace could request dumping partial GEM obj mappings.
Also drop use of should_dump() helper, which really only makes sense in
the old submit->bos[] table world.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0846f6c5169f..0a9d5ecbef7b 100644
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
@@ -281,6 +282,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		state->fault_info = *fault_info;
 
 	if (submit) {
+		extern bool rd_full;
 		int i;
 
 		if (state->fault_info.ttbr0) {
@@ -296,9 +298,10 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
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
2.50.0

