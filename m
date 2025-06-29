Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23F2254867
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228217; cv=none; b=qBFKfmQvlwoiiekCVfbTrkmp2B1tTBxDvFMD9zLpBlZjVDMjqtdiwicGKUv96smmiTzV+bltDm1pFqzNm8X0cfzD1pNybp5bWKNAh0hX0oi5QBziRxVi9zPlQSaf7b3j2gax1jvd4ql06oFvPcOHz/KmTsmHOCM2r/d6NdVTCCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228217; c=relaxed/simple;
	bh=e1ndf2hUIh/MotZmx2Og/v+YPEYB0tTP1wLOvcibMkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QQGokJgkfeEIIeLrJticJHhu4U2eQurG/ptDMz5tFgPuFF0Y1AxggAhiDM4L7SBD1xqgvGAhjgJl+Q6MUXV4sVPSyhOTT6DkH9DYPde5J7+AgwvkmVJCHlGWdf5mxQq4BMwafPKKZSJVofnVKFrsH5kd01kXozZMLGNFTOrZHrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hw21Q6K5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hw21Q6K5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TGTmrU007996
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MXd06Saq6/9
	4jOhWiMbD0wlZ29ngCx2vyB54A9DMyFk=; b=Hw21Q6K5584PMaleLKBvAEKOLvU
	PfMLIfQ/q7iD1wwv4xmqE1S3x0eYxUfgPQHPImWOKTjCbZhqjiDSylHDkI09/tlx
	nocgV8FTfzHc2dnoFkYEvYDctSSkpOo5aP5Azuvi1RQ9tQfR68HgytdjsikfdV1c
	a34/esORWPg7VcPojv1lrrvHNT2+KakhF5qjVia2g02VETxa0kG8SGRUp57ybkcs
	qxTKlcfaX2egg+db7DpV4vedX+bWUb6xOeQzqbtEmgzDZXkKsE2a4AXPTY01z2XS
	jiwGaR1R/nxItrLY7ly3C4qTsdZE0OXqRYAa3Airpff5cie99c92A+7DoZg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9ajyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748764d84feso2796767b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228214; x=1751833014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXd06Saq6/94jOhWiMbD0wlZ29ngCx2vyB54A9DMyFk=;
        b=jNkJTXL9nW26x04zHcPQBgOALRn+S7qNgVnqZr+9D1v2qzq3EQM+3+CjC3zmSSOea0
         ull++zLho6DrmgQbnqaexDcUrPe5UJAFCRSFCj87AR9j/HrsdnI1sOjKzwGn/sbh3qxQ
         mP5DA3GOMc8P400o0andsn/aUr+NvIuRJ5zTh2XmAGIY9yMISnPCF3f35a3kcrt1MwTo
         ZOOC2gy4WqknJohJCSb1OYzBMU0e6NuS1qED1kFhSrUfg44RALHQbxWiq0/5QJYC88Mj
         oWpZvC08BoOvvEbkkuN0/CmcUp+WWUNdxThRyv2HDpJd9bNp5HqMY4/vcbKapsPTEOke
         +Jjg==
X-Forwarded-Encrypted: i=1; AJvYcCW8LEGnI3I15ITZwS45RdvywKJIfYVIF6tmPqJzB9Gdeg1HLwT2wAV3gkPXldho1mKo650jgGQhNGQr3Lg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD3kxz2vnIeoecz0dahaa28n8LSy3Vmxi+IV4x3OPupl6vqCKT
	h3KszbvpryS6R7+Rm4sVi+KxvQU7OGlm2TwvZLVaTzF6tOHlNAwBOYmHOropnWpEhvGXUTeLFk2
	2vz7EdWIuHdlTiTeWs3Q26wF3eYbb09d9f0ADyxK9edRsqYvALsbkNGiam6NPxS3ZfbU=
X-Gm-Gg: ASbGncueIzsj8pD53jQYXxBG69TphDqoo8gGYPoyU8NYZy8Q6Mhdqu2zw1EwagB+n68
	ZVR4Inanajy7Xn8PEknvYELQ+5ArEjqjqR7RWNomzTjOrsFpDDmcuy2I66J2KKCAANvIc+kG3xK
	/xmshXg80bmyrwaVOdZJK9YkwScflTZh2YToSbkNvpHx9xRHr+lqpFcBn0PO67+FwICEX/LKMDA
	1U0AXfvm3uXW8hKXj7t8ESuwdVShB+NOoRw/IALmdKB4LdXyz1nKfkdZRGQTAiKJ2HLkv7xzvYI
	t54GtY1jvu6oY9WdO3ca+QF8ZpgzWBnT/g==
X-Received: by 2002:a05:6a00:130a:b0:742:da7c:3f30 with SMTP id d2e1a72fcca58-74af6f4cf7cmr15911472b3a.19.1751228213695;
        Sun, 29 Jun 2025 13:16:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwS0jhkR8kO4XI31Ia1S/bTnmlQi728sKrSzukVGa/mmnt9dqDSkWMQ2dsZWOWEB2qBV+YJQ==
X-Received: by 2002:a05:6a00:130a:b0:742:da7c:3f30 with SMTP id d2e1a72fcca58-74af6f4cf7cmr15911449b3a.19.1751228213309;
        Sun, 29 Jun 2025 13:16:53 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5579d37sm6914468b3a.81.2025.06.29.13.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:52 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 25/42] drm/msm: Crashdump prep for sparse mappings
Date: Sun, 29 Jun 2025 13:13:08 -0700
Message-ID: <20250629201530.25775-26-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68619f36 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=bYXzjpskvHxJzFY9Y_MA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 86iXqRFnDzBX8cAXto3b0FTBcp48a9gF
X-Proofpoint-GUID: 86iXqRFnDzBX8cAXto3b0FTBcp48a9gF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX6nHq/Wi9BmxL
 XeDdatm3kLnCq3ryhi9Im3rVA4A9DoFMksIgF09jb/8J4WIUgXHlFR7mgSi6fhH2wCgOXbrJE1z
 g7rNzlpub38qb9dUwBNr/Eq056qySOfC2gIEPD2CnU//jwqiYy0SL3IdV1guRrkMnMEcDAopgKm
 75myEEL5ao9ZB0bY6S7zx2dglrGv85uP4fFc/bEEsl9bveIckul9PV+JZ/xFp+XyeK9jLM9mKIh
 8tifH6eorCLZinhFki8tJiai4F4ZbqAmAa6Bzy3IcOMuIBEh21xFtHB4oMqGaHqJ7I3kMNVykWg
 hU6CaOnyipC1XXnbgBlAJ5sR560jnM8ApoZLWy7Uzkzyn05miVJWrf4k+XZC350Lw3rxEyPbO8p
 NXDKtu1DwgenyN7HvPh/+ogjKOZydksCP3v9UmZdGVSqzFnPAlKEKsEuzW85Udd3HVrfFDlg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=933
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172

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

