Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09EC286417
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148388; cv=none; b=GWuRLCVppSduptsqLnScgw011cmQgUPCkgCQN2vykDHzu6Z+d1ieufae1qaVjk6aGUj4fEqCB0vgwaYk+v1e/0Ed1zAP/D9i3gv+XC13MsJ/WdeXbUk5/X1ggUbJFUQpSEyr9EpcriZSzc+Mq9+HoPHx6ldhWyRyEOdrzy44B4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148388; c=relaxed/simple;
	bh=qCbhnRnuW+mHLXXemWgEWHentAADrrysxUd/juV5+7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nu/HzCA/iVVVHKBtZEIhLebDGwwfNcPf/qRv4ZDVTJWZHLvIJmDHtwiLGOVD2OsB2QMgLHWMY+69XTJ5+F0iaWlg5xEsAGdaIPDGJyvQGnHALTdZjjduvJ1KucQsHCBSVUTNpyqnI4ujZWd9w40/YthaBvNaombLk371cW+jOUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsuQiSsJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsuQiSsJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555IC9RE007519
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zZ0/1Hg9ehG
	RWkpUmL2vj2q1yR8YxmohRbA6KHUWPBw=; b=fsuQiSsJj30cmtJOeqGzFAOFOOi
	Mo9g9UZe8WJq1PPD7eQVIt8R5IZUIh67C1TGbNLloUQIsOTxpMNAv67WMWJTDFNT
	B6tRE2tNQKmSJCfsGadiw3A24jpEeY51zWCBGKhANib6A8v8Rp4B2b27lLQcOnzF
	HZuQSbSmzu71tfRzKSMeGj5AKOr5W+oPGWhEa7ojUooMJfCn0rEoElpo99QzmmN3
	ekLfyOl7t2TgoE4isly4ZCs+sPVXtv8YXJHk6PiSOJgv7TwS2usKykUNPE1vGuQz
	N2ka+cPVXlqAWV/5xR+xBOUo65tCfP5hyeAlYlda0jF1PwHM7/UCm2UEYXQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t29q9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:33:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234f1acc707so11271745ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148384; x=1749753184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZ0/1Hg9ehGRWkpUmL2vj2q1yR8YxmohRbA6KHUWPBw=;
        b=DPcppbXJDvK/DyOcCepmEZ5YqHkcV3dI1nho/2h3gY9pF1uMej8erXOOgUlxccnuUn
         o9EDiA/HH9bSQG/19op+Rp2YdkHSi6kuyNJEM3qQQ9Gs8kkQwrgpbyy7r2/Rx9cXECBO
         LsWufy5m2UgbgcxGXnNGeKtyrqmuXCBKNUfH+eeAYqofqQQe+/qVFEhvXMx2T30HtJyE
         HSVcDIcPu2Z4J7WaKk0s5iltlb7ZnnmV792MQ+eT7B3Z6/ve3o/Nmq+wppr8/WpvftzN
         p0S3+juVOC5cpt/lQwwhN1CrM2P9E6kbA99nXcxGlmabbA/gF4IFb9Ib1xJDvul5ryQr
         SZpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/lGGH/FI91U9HmiivYRH+NwpHL1pgJoMUN+ZS/eWxAF0uD9buLl5ZlOoeJnFPWH5wd9jn9esDxY65/fc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcoZXm3lwz+00EKugLv8lsM0z3c+hpLQ9eouUDAI4AUL/W8BjD
	525Wtau4VZuGc62NoHs8dZaL5mbXqMXyjZwAMqrsUrseqlMtCPo/YA0XzfEHz5tnBrJWMtRStZO
	FXAyozRAoch8Wp88yMjR3tSHomynJzsH1CqEJ2vt+QbfIWf7zKBHowlWQU9miXJapljc=
X-Gm-Gg: ASbGncvF8Yhz/VmpKDsUFfa31A7etk5kKMwbdDMwVe0L1b4lm+IcJSO+W66PHEfjJtU
	vpIM0hK3T2d3BQjXMhgg76CcI9zYHJWfbhAd6+lkjxD4HQs/31khdnhSME4CiPolVlL1u2R8y1F
	T5c2ujHIrqm4Gcz33iSniixgHhAYB8cg5grtGq6cLDYem5vFHgOfU/voqF2q9f0Z/U4j27D6VrD
	B9OBUIcrqILe1nTJdJpYu23Z2lOzWVqAm0L8lxWQ8IoSEF3jqS01DCkvTCSGzodUhNx2NJkIEMt
	bBfrqe52jL4aEx0LEgp2NQ==
X-Received: by 2002:a17:902:ea04:b0:22e:4d50:4f58 with SMTP id d9443c01a7336-23601d19e7emr5804995ad.31.1749148384401;
        Thu, 05 Jun 2025 11:33:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE26cHcfxJduxTai3lL8l1HHuGp3dVml0D45JxZwDr8TR1f4qPISu/CmoAgjVwvP7kZpTw7SQ==
X-Received: by 2002:a17:902:ea04:b0:22e:4d50:4f58 with SMTP id d9443c01a7336-23601d19e7emr5804655ad.31.1749148384001;
        Thu, 05 Jun 2025 11:33:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf471asm122647135ad.164.2025.06.05.11.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:03 -0700 (PDT)
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
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 26/40] drm/msm: rd dumping support for sparse
Date: Thu,  5 Jun 2025 11:29:11 -0700
Message-ID: <20250605183111.163594-27-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=6841e2e1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Oi01P0gpvwaEutKy2E0A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NCBTYWx0ZWRfX97mdv8c2719j
 ohSw1jiNDv+/jYByoHqxin660jNz4zzdZ5iv5mMg3tWr0bqEg/tA9bKfcyOK8e1ECDP7iYegYE2
 bN4NMxkwOHkS8MUpBT88NIQayBrnCs3IZdQOwzTRFeuWwBKPLnSqL420i6u7gvWiR3UI3BS3wbq
 IzQVTKetTpj5fRyPkGEUPQtC80PN/akkEgeoQZL/1VjWwtzIsRGfYPfRHD0oPebfw5DkRXC+5Cu
 UPZ1MXYVrs1Q/slC4WD53GZS5PzWTby+KlJHtnpRea/rDa3oQrsI1BW6vPGJE20QVP/E34NzfTD
 G2ENbLs8xT0majjvXQcwtfJ7gKSd6ndcuXLusT7uEFtoOZnBA4W7mE0L2zQehDp7Ve10k/3ylzu
 VjQRInVXkww5Rd8s4dukx7+M6zkNEBmw8U9jDjBpL8gkUDjMCavMBiWtZ9uZFF5D9uHWDg6N
X-Proofpoint-GUID: d5Opck4iAcCcvS9Gr4OZilKwRfq9WcQg
X-Proofpoint-ORIG-GUID: d5Opck4iAcCcvS9Gr4OZilKwRfq9WcQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050164

From: Rob Clark <robdclark@chromium.org>

As with devcoredump, we need to iterate the VMAs to figure out what to
dump.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_rd.c | 48 +++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index edbcb93410a9..54493a94dcb7 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -372,25 +372,43 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = submit->bos[i].obj;
-		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		struct drm_gpuva *vma;
 
-		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
-	}
+		drm_gpuvm_resv_assert_held(submit->vm);
 
-	for (i = 0; i < submit->nr_cmds; i++) {
-		uint32_t szd  = submit->cmd[i].size; /* in dwords */
-		int idx = submit->cmd[i].idx;
-		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
+		drm_gpuvm_for_each_va (vma, submit->vm) {
+			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
+
+			/* Skip MAP_NULL/PRR VMAs: */
+			if (!vma->gem.obj)
+				continue;
+
+			snapshot_buf(rd, vma->gem.obj, vma->va.addr, dump,
+				     vma->gem.offset, vma->va.range);
+		}
+
+	} else {
+		for (i = 0; i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+		}
+
+		for (i = 0; i < submit->nr_cmds; i++) {
+			uint32_t szd  = submit->cmd[i].size; /* in dwords */
+			int idx = submit->cmd[i].idx;
+			bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
-		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!dump) {
-			struct drm_gem_object *obj = submit->bos[idx].obj;
-			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+			/* snapshot cmdstream bo's (if we haven't already): */
+			if (!dump) {
+				struct drm_gem_object *obj = submit->bos[idx].obj;
+				size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
 
-			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
-				     offset, szd * 4);
+				snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+					offset, szd * 4);
+			}
 		}
 	}
 
-- 
2.49.0

