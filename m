Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DA4283C90
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148386; cv=none; b=khZGFYupTh3uybtKZwbr/x/zN0GuTUQxfi2s0yNuCIW0Kk2R/AA3ayF0wbJLQ1WMW9TRU4JXrHZnCeC75U6HM8Wf4Bp9sdRAkGX0jd7jmUl1a68NJPWXkkb1lzEKJ/wSxviJJOItIqSLmssKCG5c+PIfhFRoHFrys8STH+uJz2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148386; c=relaxed/simple;
	bh=jAFX8qN/ZOAZrSo0QLmGzc4udiuEqBJZUE1qEmE5rxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxvu6BZKvI5/nVKFhI82nzgt6ZZlBM8cofATWnkWjqmJ7RwH5Y0tR9pF3X+h8TJPSxOufBCORCxOmI+hVSTtNuH9PmwWleovCjxLzjdMGP0dHtWU2+RhL9QNSTOLY7Ns5759vZfHB+tMUTM870WwiBqpUqD1HGIK7xQhw45oBZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DK/cxvkV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DK/cxvkV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5558hv8F007388
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QOMNbElsFZP
	lX1Zq+j4xLdTNJSwjVmJdOq5xQhhnr9E=; b=DK/cxvkVFPdbTRAAbXd5RjsD9Vx
	8v1j9sP812BsQNvgU4jcIshXINVo/is6E1Q+5+Uqpto1FHGgun3r2hPC0abkzMPu
	Osk6yDURYZ5mTV+38Kmcl9F5Pi1fO0Q9kRXvc2agJHyuYPwfaLlxeZ/p+lm0WmwK
	ZvKcyjfIVdxJ9WocnbCXSaVcRSpfzpdbTgVe5Poe7Q5sganhvLnzeo0KM3cZi73K
	i5c6+q4Zc2efEY5f2O1sGk3yy3JG3pjcXjI6HXWIhDYp1V2PSBBWKt/n0MKEERIu
	qhgxUWrEvm9LgVVSiIMor/6qQn+7FbShaNc6Q6ZGSqz2iXM+oIudO7WK6wA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t29px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:33:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-73c09e99069so1446715b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148382; x=1749753182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOMNbElsFZPlX1Zq+j4xLdTNJSwjVmJdOq5xQhhnr9E=;
        b=sHbh3RfRgkNbQ7nSjLkYgw4XjDO4i+bHeRBaNEdV4Xiqb09OMe0xJHxkYchduVZYJT
         ep0eWGc7SgXEwXPrtYRIk16xM/ifC+Z0d2B4BGEfJ/ZICPrV3JK0W3Fzzp2ZTKz9SBC+
         PMEEolMuHQc/ODXTmUt0wIMkeCK8D73OhQ5dFqPxNKkWRMKo9I8psJkEiVMe/N/eso4I
         nV/RMIz8giGoAO7bzMR1F0bISOvidXCNCFalNRfsENj528viOVxGKg/2iZzCib1KRWIy
         DofPIzz4DvGndtqXKkaYpnrETAyxzHgGsWHxqmfanlzYALslJGd8FszD5DNAfhj1WRgn
         9AlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6O0uq4II4H8yfHwGeFcVjkdIOjy7D02UdAryXRQih0O7e631j6nt9OOqQwUzP9pgULewF+nPLZHBX2wA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5MkjGemTaqK9iPhFQfbdPSXNq/mTi0k1LUAVI20Z5q/POuDst
	XeqCDIaXWixgUV/hfqQy6Yq/HwILvyyjIsg3T5VKUCgTF1DZu2EDL00MUdJCRgiXI9S2LEVNomB
	il8EyeAEOvsNgfDvemAN1qtTtiRT53L+odrMtgVtLXHAddbE7Dp0/BGeYO83b60Qs6Uk=
X-Gm-Gg: ASbGncu9IFihDNkmpBQ48A6QkNttGHPNMlvOCxVcbKRSKVGx3ne+ojVjD3xr0gMNzWj
	6HBVyHRDkQVj8kXg6eiHq5yFbxwKKz7CGz5TQCcAnrGw4i6rTdz+lboqFWBNuYemTj775Ycym1d
	wTD7oUMEmkDj3Mzk64tJeHgsiJsJQc9jsN2S+lIh1q+zRL1KKY4h0ZgRiFJ8ZGIImPbrvRYBP7E
	Gyy7bzpoIsPHJ0zg3Ru2iyImQ6q/xGQqf0ISIkVWLte23+QsCbW+rwgHeq1HURjnZVDzooEePpU
	EomCTKVV4aWEiC/l91/LyA==
X-Received: by 2002:a05:6a00:9292:b0:747:af1c:6c12 with SMTP id d2e1a72fcca58-74827e7b12cmr913712b3a.9.1749148382117;
        Thu, 05 Jun 2025 11:33:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDrhL3Dn+k59t+JotHvK+0jIuQye7jcSS/bDJ3Rw3Z0zwKOzep8XVvL5+334VNT3dzfxxg1A==
X-Received: by 2002:a05:6a00:9292:b0:747:af1c:6c12 with SMTP id d2e1a72fcca58-74827e7b12cmr913677b3a.9.1749148381745;
        Thu, 05 Jun 2025 11:33:01 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe96799sm13679698b3a.15.2025.06.05.11.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:01 -0700 (PDT)
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
Subject: [PATCH v6 24/40] drm/msm: rd dumping prep for sparse mappings
Date: Thu,  5 Jun 2025 11:29:09 -0700
Message-ID: <20250605183111.163594-25-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=6841e2df cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=uvlqqL4q8Y98p8K7alsA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NCBTYWx0ZWRfXydYdu0Q26Nv9
 DPaP3To21oF70DBPEr9/KfYw074wiU6uT8VobbXXjsZgAb0E/DVTYTtgZ0sK5els55H04qJiczV
 3n4FUjdc1zr4HiyR+9GbByZJWC/wl5BUyTYtvVeBVgkEbSMU8UX0gvrKr+YSGUZ3wvjVrv7+xqY
 IiMH8RG/Xr4b+Q3ZNxE3KvJGRm/1F1AC9yeyo03f6nNP1UXGF2YiG1fHlmrMXPg2VOSmmVC9dnD
 J8jXg8w6fxOnjiIpNuCQ28vhcRnVzmHTXmThHX2lL3qSI94jnp2qTulCq7Tc7XtYgH1D/rGdEsd
 ltbWv6EqHalWiA1zum+nUX1XDJjRPrYOZefcJPI5CBB8ZmMnnHvSz6t/WJNFJ2CO35lCWky/1Sy
 HEjacfOtQ8eZDyJV8qQ21hFA5A1mqTKxmCy0zbgsbxWu9BjNt08CS3tqsBpMR5WSBrL2C7Hz
X-Proofpoint-GUID: 8tExzQzV8FoA_L_nvwcZb_XKQSG9Nv5i
X-Proofpoint-ORIG-GUID: 8tExzQzV8FoA_L_nvwcZb_XKQSG9Nv5i
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

Similar to the previous commit, add support for dumping partial
mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.h | 10 ---------
 drivers/gpu/drm/msm/msm_rd.c  | 38 ++++++++++++++++-------------------
 2 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 5e8c419ed834..b44a4f7313c9 100644
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
2.49.0

