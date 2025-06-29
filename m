Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DE925A645
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228219; cv=none; b=S0X3hSSip74WPny18HDjAgNdPNgLq5rcqph+W6/2/7TbqcdDEyp4Hv7FCEwel0g6QHUJpwk2q4t3C6IobebEpC+TDyA8TPowS7+KNW8Byyz7knILw5oc7+eaUlXteldEfziV1N5kZNkF+GJi0zazrCYrno9c+xZotiuFpxIY9cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228219; c=relaxed/simple;
	bh=r1zmu/qH1gARr8JF3JlMKkzrZ4FQv9/Rjdy5KUlvpfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CI2s5Fc0cF3Qjk8aGMZVlxbVNYfQNn97lot1RtBMmx3WBIaAR6bJACJPOP+OpBCsOVc+otBkxAGUvgRR4MkKiedpiA2Lp6tTWa0msspcFx6Msmko1YR6OsvpH2Qo0R3wOx7bPzYFDZPlN/8DmO+R6OkWWtDrcXknkJ2PK+sMNtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXakVDdU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXakVDdU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T4hSdU031630
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=POLN6v5Lpeq
	4YKP9lCUNA2S7d/qpjdY9Nd2TrkcfwLQ=; b=jXakVDdUTAXAmDbl8kMVcFG7Poy
	NYeUqU4wYtJYTznqIKlLMdkB64iRMu4VxGlEf7rUxr6V4aj+EYwBcXxScLXkN6E+
	I17FoWrVG36f3ft2xOxNoPEAjMBXmiAgkiLPyDdPKJoabrfhrPjuHs221FxmkK00
	BFAUYDkiYV0/LwyzilPfBq1FwSAIGfWz/P/7RhHz0wLC2tGT1lgh5EvudVXMnX+2
	hPAKJ6sRQbLVDztGxyC9ibOo7aq3SHFXMImizRKHK7Zj388KHIyqoOrtN5PkhhFQ
	UCGdhhGMrAYEszD5UH6Dbq5b8B0/soxZczk9roq+doV6UvaNyxg3Al/YcMQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9tpkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7492e654cdeso1490912b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228215; x=1751833015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POLN6v5Lpeq4YKP9lCUNA2S7d/qpjdY9Nd2TrkcfwLQ=;
        b=Z54k08ZOuxIi450UqjTe2WMKgbjaWD34hw/EypZsA/tS9IENRR/jZqUr26uTD0s0nL
         3enAzsqDM5FuJATmxH9//KAcd7FDd1t/lOhCmZZ1jFIdBMoccN3Uo1YklICrqG+VcLWC
         vgSSigtLHex3e30JQrhJ5MRAqDxllCe1Hv2ozYKwY2DQi50Q84yh13f49Lb0+mFrvOPL
         yUjQqNO4sCjbSy7O0mVcSqD/s894krZDqFg8tOhQygir5CnN27F/JxwRrTtawmBnOJdw
         KNQSjrvGp4G+jWWWZ7d9mJ4tSVUyRq40v61py9eBAVnOkyIeOX5+blvLNnHBMF4VOCm8
         wk6g==
X-Forwarded-Encrypted: i=1; AJvYcCUI3ZbDdHAkQnw/RDXI59kE9X65Etmugc+eFxbuHt1HD0NZ80YMK9rN/rB6xJDknVteCt2w1KAQwqpb/U4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7PT6977B6GPJpSnUmqcqZLCWT81r+9HIxXosZVUr1JsjAbP2C
	ybxBdcxJXr/1S0bqpn3V8VX3+Y+FH8AoPR0i9n0DOkc9wkF51/tcUypJU4DlBvoUdTz7dMt3ch3
	N4upR7yVbpdb6LjYh0MgFiuftWLbQ9gfQPdEvs79hjlmQ0zgaIUpcuz4TcUutdMFyj2A=
X-Gm-Gg: ASbGncsAIgqNlEKiuUxRKWSL8KFSllecdk/RR4YB3HdYMLV2Cz+ta2zYU2SBXIoKWqC
	0hKDsG5HBAkEwdLXU6tNUKw1P+aiCqIypwjB4DJpzoNrrSV2iIH2ieBXz4TVG0fxaoUO2M+m39v
	cvIrSVDCS4ulhEOWZK244KX6SMRntHTi9Xb6qqsOZetzi+sS2iM9h4g+q3TSLjPy65FRoxJZpjz
	kvd6dZcFCAUCpsNu0KPTgmhGGq9BcwLBenp6zSTDhVuM7j2EG9h9DR69YVuWWUj8VYasgR86nbe
	n66Dl6EYKGJ670+CNFwgZpf+mgMEv70YiQ==
X-Received: by 2002:a05:6a21:2d4c:b0:220:5c12:efa3 with SMTP id adf61e73a8af0-220a17fa94fmr14766046637.38.1751228215059;
        Sun, 29 Jun 2025 13:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHLdPOpOfhHnUXca9fxgn7Is+j9F3do3zCU7Zho79ZKpG8mV5KD0ItKS+VliQr14UVvffFHA==
X-Received: by 2002:a05:6a21:2d4c:b0:220:5c12:efa3 with SMTP id adf61e73a8af0-220a17fa94fmr14766020637.38.1751228214658;
        Sun, 29 Jun 2025 13:16:54 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af54099casm6902136b3a.3.2025.06.29.13.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:54 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 26/42] drm/msm: rd dumping prep for sparse mappings
Date: Sun, 29 Jun 2025 13:13:09 -0700
Message-ID: <20250629201530.25775-27-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfX2u9wW6P1PFMa
 hoya1pJNtL2B5pqkblrG6pYTFSsl1oicZpzJS94Re4xP41sLdMunC1WlDxYm9fuGh7tldEqztT6
 44r9eDJpE2Cdai+xlcR9oUXM0TzDSvXEpYczRX+qfLDt3KJtMBtunpNSnnXrvU4LZsCfgg6IWdj
 WrHMkwzqRXEAeFZU7ZRqoRr6Ay/7IYFjetNMpHM9oIF9F2Y6DutFLFdXkRAc9Z+7KgSXBgdMnRT
 5eNs93v1k0iq0UGWyPn6VElQJEbWpy/cWj0SeONy+4Rkkl5N3oUDQ9tlpnzWNq8Pszeq0/OglAc
 TKEEYJo4C2pK6Y+zGdnVWYaB1ILYVFItsagLei5UkC4yMge+gddUcIRMfeZnPrerwpm9xyvX7l9
 tWiWn8aaQmgFiXzesq8ZJEiCSuV5cRj007wIlysUrNmdVDpoY6ODOwkeMfkiU92WCZaFR3er
X-Proofpoint-GUID: 2EO7IBgfoMS8I_8Ov2Ps_TJddxLw6KrK
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=68619f38 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=uvlqqL4q8Y98p8K7alsA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 2EO7IBgfoMS8I_8Ov2Ps_TJddxLw6KrK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290171

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

