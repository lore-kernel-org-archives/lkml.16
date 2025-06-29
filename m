Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED6F23D2AF
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206083; cv=none; b=EU5VJK2vG+SJIplz9elLLWgi/8kvsKUAFMw52NMOw40jJrPQhMZU6LPotvvdJfUOqwApqLx3pdyaOBSyn59N+PPJX2daxWaDLXbWPI1YHsZ+QIUULcTyc86sIwp25KXIpIDKJ4WzOuicGjpyGB0gedOC0COn3B6AA7+sybUe4AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206083; c=relaxed/simple;
	bh=r1zmu/qH1gARr8JF3JlMKkzrZ4FQv9/Rjdy5KUlvpfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RbVjgn1HLvsQqnk3vX8ruTGPjlG+sjY2dnm/plbQpeJJSgOy5Yijj33lzFme4a7ys1qN4yhGRrHuA6Vlt0qg/rG2GdIt50tJguTfqoqzNl39TNbl+pKa0naMuHO9BfZQMXnLUDNWR15OPOV6K1zTqLDiEtOJyI+4WvR/YQl246M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AlXxyggX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlXxyggX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T80UdN018915
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=POLN6v5Lpeq
	4YKP9lCUNA2S7d/qpjdY9Nd2TrkcfwLQ=; b=AlXxyggXs76xsX25YWGkU6K2syu
	PdMb0WExu5Uw7MAZYV54/ahuEvU22JTOSuWDXJyLK9V0XlthXx8UnoSW8dmc29p5
	G6tJItREbn523lPzu8Kf5HQgkxgWvPwtkutRm2gromlX0vXpj/9Q5yARTzqihu3A
	ZdGeqhkDfFndE0v+zavpU+VqZ1MQ3Z9/FqQHcdvrzKfhmYDhDXX8y6GG+1X5ffkl
	N4z3b6nbd/PHAx+U4UNAoGgw3qChs0f+AZypaSgI1d1V73DNKnyks2/sf3gMtx/u
	PKaFq4ppxXA09hGHoRLA+0gFGAA66ZQ1rO0a8e1ZKrLPC6Ny6WXVL96GvXw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9a5yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235e1d66fa6so33004935ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206079; x=1751810879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POLN6v5Lpeq4YKP9lCUNA2S7d/qpjdY9Nd2TrkcfwLQ=;
        b=G++kFkBDoMeqr07jzlps3bymR00enpKTquc+qdNOnlEtmhSJZafVWi/xfiyt5qZE0u
         Nb7be3+PYv6XahwNoSsE+o6GVmAe/fKdQ3TIRGnCxU090kqzUivLueukNh0qSLf7hpvD
         w0TaY0UeLcBTmZ4nvYiPtUeXwr4e6PnbnerDbyrsLAEdphQb6xelDvantiX+EEJpu2wC
         xlF/Ori5YN5ntXO8xsncNSEJwRlxzR57zjkEpDlo7s/jzwLgrz0dCol4L8O0CdK+aBLw
         nKETPvaWdz/0U62iiQ0q+/WkzlBbpdcxXFiYzOivOjFnPPtphXkq5xz2aJ3UTiww3k9k
         a8xA==
X-Forwarded-Encrypted: i=1; AJvYcCVqli1nc0dHQyicGogUJoqZWEfHRYi3HyYEwFxEuf0wNKbGke9QcywltRsYuSkX2z2zi9cLgYDx9koF0tE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyArQStPqv7UFujwi9XlqZUg+PHEcg67F4xpfvsW6PdRdVYlRKv
	QOMvyQQKWWPIqw9PWY36j6eFSvHj79hPlaxAkA70AzJT3ay6XSLYRfrLHBb8zuFpIHoD+BKQhT+
	Zww8T8dfeszZwqwrlLCBiW2Gau+GdAYFOoh1c+oAP2KeMtv29yk2dXQ5r+9+C03tL/ug=
X-Gm-Gg: ASbGncvwP8FPd+ShIUt3P+sg/sP4mkjtWiUEyt75cXGffCWeEGxR7NK4f48T+IRVzVE
	RBjwyLmn8tttGhETodKZlFpYYn8IjMHpy1jgVGGdx3fTsNmAWr/MOkXHGTP1gT6BaqfrU8PS63t
	f7a8RWQyEbJfkJk2w0zWmNXD8JdehFGc6sOZEZbPZLIzbfNOPOydOi6FMm/ZxdJ0vM14fTa8/Y6
	Qv0aL0vmB8nIV2nvCRZGsCn5EWxF/GjFW9JdOtes+k70jqJ9FkRtxXM5pnUr/LaUC7ZaY1LcKag
	DXzHnyXpKYaY/L6D0LfSsfQjERtvj63i
X-Received: by 2002:a17:902:dacc:b0:236:15b7:62e4 with SMTP id d9443c01a7336-23ac4608402mr153208645ad.38.1751206078785;
        Sun, 29 Jun 2025 07:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPNU82btQj8+J4hl9ShbsqcvJusHMltr9q+oeq9oKFgZGq/rOI6AAZr3mn9fhniRP+FGNn6A==
X-Received: by 2002:a17:902:dacc:b0:236:15b7:62e4 with SMTP id d9443c01a7336-23ac4608402mr153208245ad.38.1751206078346;
        Sun, 29 Jun 2025 07:07:58 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e21c8sm62124325ad.36.2025.06.29.07.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:57 -0700 (PDT)
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
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 26/42] drm/msm: rd dumping prep for sparse mappings
Date: Sun, 29 Jun 2025 07:03:29 -0700
Message-ID: <20250629140537.30850-27-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=686148c0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=uvlqqL4q8Y98p8K7alsA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: cXOO7DFxn2JHsfNhpcjIX76YWCoaL7Pk
X-Proofpoint-GUID: cXOO7DFxn2JHsfNhpcjIX76YWCoaL7Pk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOCBTYWx0ZWRfX4qkRcVd18Bc7
 F911ZhPgJsxh9iG+igo7d7br/4ePGqGxCkUsnSTM99boxivG/Hl7C7V3dTW4xbwxpvNMPuyyRRS
 8ZxTNO1OtTnwnwUlnMLWnrxxUDdmymRDMW0mo/SyilnxJLDif+1XCR8y27w5GwNitw2f/v3k5MZ
 Jd8lCRRLjRS61lBZwZ0Pq4/Z55YowY7EQwohrFavH2maOauBiYL55zDAz/yaqIYNaHOcXjiTxA7
 oJJ9aQmZeT+oiRdTtFRsxIC4XvUv3htKjp1TO2Gp5TcPmkai5r/0An1ITXTTPTZ45+P9p+tARGT
 5BDszC+TdOSfBZSpzVPdmGwG1seRhQcpC8pk6US574S6BxVQoSFBNTF+gcPZZN6M+E7kyPmL6tK
 LUobj8Hqv1naeJ0ajlO2qhadp16S0YvFVSXS/9VTx8rhLabhIenp6cg/sqs3qe5K3yuBtJCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290118

From: Rob Clark <robdclark@chromium.org>

Similar to the previous commit, add support for dumping partial
mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.h | 10 ---------
 drivers/gpu/drm/msm/msm_rd.c  | 38 ++++++++++++++++-------------------
 2 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index f2631a8c62b9..3a5f81437b5d 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -403,14 +403,4 @@ static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
 
 void msm_submit_retire(struct msm_gem_submit *submit);
 
-/* helper to determine of a buffer in submit should be dumped, used for both
- * devcoredump and debugfs cmdstream dumping:
- */
-static inline bool
-should_dump(struct msm_gem_submit *submit, int idx)
-{
-	extern bool rd_full;
-	return rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
-}
-
 #endif /* __MSM_GEM_H__ */
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 39138e190cb9..edbcb93410a9 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -308,21 +308,11 @@ void msm_rd_debugfs_cleanup(struct msm_drm_private *priv)
 	priv->hangrd = NULL;
 }
 
-static void snapshot_buf(struct msm_rd_state *rd,
-		struct msm_gem_submit *submit, int idx,
-		uint64_t iova, uint32_t size, bool full)
+static void snapshot_buf(struct msm_rd_state *rd, struct drm_gem_object *obj,
+			 uint64_t iova, bool full, size_t offset, size_t size)
 {
-	struct drm_gem_object *obj = submit->bos[idx].obj;
-	unsigned offset = 0;
 	const char *buf;
 
-	if (iova) {
-		offset = iova - submit->bos[idx].iova;
-	} else {
-		iova = submit->bos[idx].iova;
-		size = obj->size;
-	}
-
 	/*
 	 * Always write the GPUADDR header so can get a complete list of all the
 	 * buffers in the cmd
@@ -333,10 +323,6 @@ static void snapshot_buf(struct msm_rd_state *rd,
 	if (!full)
 		return;
 
-	/* But only dump the contents of buffers marked READ */
-	if (!(submit->bos[idx].flags & MSM_SUBMIT_BO_READ))
-		return;
-
 	buf = msm_gem_get_vaddr_active(obj);
 	if (IS_ERR(buf))
 		return;
@@ -352,6 +338,7 @@ static void snapshot_buf(struct msm_rd_state *rd,
 void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 		const char *fmt, ...)
 {
+	extern bool rd_full;
 	struct task_struct *task;
 	char msg[256];
 	int i, n;
@@ -385,16 +372,25 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++)
-		snapshot_buf(rd, submit, i, 0, 0, should_dump(submit, i));
+	for (i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = submit->bos[i].obj;
+		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+	}
 
 	for (i = 0; i < submit->nr_cmds; i++) {
 		uint32_t szd  = submit->cmd[i].size; /* in dwords */
+		int idx = submit->cmd[i].idx;
+		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
 		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!should_dump(submit, i)) {
-			snapshot_buf(rd, submit, submit->cmd[i].idx,
-					submit->cmd[i].iova, szd * 4, true);
+		if (!dump) {
+			struct drm_gem_object *obj = submit->bos[idx].obj;
+			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+
+			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+				     offset, szd * 4);
 		}
 	}
 
-- 
2.50.0

