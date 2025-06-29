Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63822405E1
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206085; cv=none; b=RRCDH8biNbGeG6Iu//sapjqjxVtI2V16qsDhocHa3C2ts9f/XR6hNMbUIaJblzvllxMMNlWEjTpr0Slbcx5BMyXVw966ukhDxKAPYD1Sjt83HJ6Jyjevu4XY+TKn8NKX3J57Bx/lmVwpZFeOQSIz10Dc5A7NLVTPWqJh+pNzVjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206085; c=relaxed/simple;
	bh=oSLD17tD3i/SIJGyBuomwvpM409qt9O5IQtczoH19mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dzb1AJGAxt3gHHfcXSwgENbBTA5DRrkoCDdFObSPY98oko+9uADDhG8Hqy8eWrE8Eigo/Gqzhzkyuyr0QQnZXCDj6fPyqDmg2Nx9npxUQcVT2hXEGEcTdZgN6S+EBLcfvpeqMSGYtOVuTMbWaWSGbpob5ROPhhCkWHU99jDsMYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+ygvKBn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+ygvKBn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAEgiD011214
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GiAM1wF2+vU
	wkpCq/AxW+9TLh9YmmG5Rgyh/h2VPEqQ=; b=Z+ygvKBni9pEGYCiM9rf0Iu/F7C
	zRLq730rCjKrBWdpuwX27f6nyqZdi3lT7Jq7LK1I2pia9HYJqFYwB/hm9SKdKo0S
	AwC2wEiIUrnaWEqw22IAIJZY5I4eoLHWhkhN7fof12jicGGKcLNBzr7h4T3+ym72
	1RVxlpE+Ozyn/4sOU6J45MGsUtockHqzazJMEPTC6vqyEtYIwZqJCiFg+I8QGbb0
	KSap0cruUndl6TnXrRX38wibe/qP3r9aWoObkNVYxHdq6QQSiKiOzFOFowGQcIK0
	c4dzxkmRrZp5t0FK47c9K9rxoExEkggy84pXyNf+ZpOevRson4X6hxweAWg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm284h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74ad608d60aso1108082b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206081; x=1751810881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiAM1wF2+vUwkpCq/AxW+9TLh9YmmG5Rgyh/h2VPEqQ=;
        b=V1vKM0qstICmFw4CvJEPTvntwIZ9iYZ5X+D79IiI85juXZZWnB81QM0ZQKYhUOsmQr
         zu8+7eLPfdtenGb5LMUnGYY/Riktu18Qxux8gAKH6xsH2yeq8QsfQnoEoNHgpYaYMnAT
         uTpTKuluvUbwMs0UVCSytp5WV5bzUNY+iO1GYeCgZWCpa+kz+65jNjzRMgWi71KB791g
         t4tw6iMa4TzFeNzWjji1wzjccknJ2b+C2GqcVlnAi+Rqzc9wfIjNNrDi1BhCcA1J/h3j
         4WS4IjB3D9ZxNZ5/fIato4TNHxFwnS0792OEsJGdC3eBQed+z3OPNcEGV8nToZjFGT9D
         F20Q==
X-Forwarded-Encrypted: i=1; AJvYcCXL7TKZ9uTv5xPv6q9k7JR499thDYXH7K4K05kz++oCUXVztW0UqQWkNXooLBhXO/zN0odgaMxTB6vYckk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWB3TubRqQR02pEljkCZxMyoHxjhVPUW6fk6mz8K/37Kzmt/Lo
	Pp8T/5L2F1ld4H6tIn8qbdp/UhxQn1YswRBwsy6e7RTsQjTR6ao4d0B3rdJ6RQ+IPt1JENxdl9j
	/OedZPE5zziaXG8/ejXtOn3PhQKGWlcMyUnFSbv48Z+Y0MpCRdDC+clv5F3Q0565CNXM=
X-Gm-Gg: ASbGncu54pEHIt5qKm4NB/BvDO+AjwHm87hPrgYAcdiKu/vLLp1j2jSKacDRr+6BoAE
	JXDjnjF4F9c0kXg2+fFIYI/MplN1MXruei5wpq0kayFOQm65VJ7YxHmrSd3mganx/F2RMZg03Ba
	3j5A0JZLzpECzYpPIMWzbI/pD9qfh5IR4bnpsbK+75h3l9+koePAUG2jpW41YCxTS+q4Cbcp89e
	+mIo2261yNIBKefDykwUQPXWTgkE//BktrFAWK3f95hKsBATOIZ8G7a2N1r7S31QT/OC/D7ZNi0
	MSKQKRfK/VNacnngCxnbFKZ/LQ0GcP2R
X-Received: by 2002:a05:6a00:4b0c:b0:742:8d52:62f1 with SMTP id d2e1a72fcca58-74af6e61b06mr15386839b3a.8.1751206081305;
        Sun, 29 Jun 2025 07:08:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmEjFT9YhO9qCARxAsGvGVKPjEex9KKnkOxbT8IIcaWHUwA/BA945pWU2NB5DkhvJU1gw/lA==
X-Received: by 2002:a05:6a00:4b0c:b0:742:8d52:62f1 with SMTP id d2e1a72fcca58-74af6e61b06mr15386802b3a.8.1751206080907;
        Sun, 29 Jun 2025 07:08:00 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af557591asm6977022b3a.99.2025.06.29.07.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:08:00 -0700 (PDT)
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
Subject: [PATCH v8 28/42] drm/msm: rd dumping support for sparse
Date: Sun, 29 Jun 2025 07:03:31 -0700
Message-ID: <20250629140537.30850-29-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=686148c2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Oi01P0gpvwaEutKy2E0A:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: GbnziACWV3xfqVhRkgSVtRUmZLY2_HQX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX+Uya0fEM9xLK
 eAHyF7dQcoV9QFK/pQhwXwSiAdd4udSDq9Xk777z7IW3MkdOR8py5yDm+kL1e42Tqa5xfsNexun
 qZq3rMI1E2Idwn0B+B9HJLCoB7v/blhC9FTJCyLLpM1M+Ki07+EgC4pdYMW7uKgoPCNlP/L/UTU
 lKBfXYjyPXE+E5sBM/OKhrFepfZJUf835hYUmxdW4IBB8Z1QdVTl6VqWLLd4WxSrrvNYGLtR6cB
 +UPZABzuj/3grHY0MDy+8wOtROl7u02aGVSDtMDNGNwMvKk3Cvl07ttyDp3rNuCOhG+xdYC5aFm
 54vB51EgMBvteLKNRvnbFdsA3ADaNac+gjNIKhXxH01RXnS75ES7ylLVsfuieGpfjDbENueO8aQ
 Ui8Z2wKGkESdiF0D1AkmRQc9Mh8SyQLrQKHZIwCBya3zZMiN83oTJtrcABxmqBYUISDG4t9W
X-Proofpoint-GUID: GbnziACWV3xfqVhRkgSVtRUmZLY2_HQX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119

From: Rob Clark <robdclark@chromium.org>

As with devcoredump, we need to iterate the VMAs to figure out what to
dump.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
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
2.50.0

