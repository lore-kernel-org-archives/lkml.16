Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398332F2721
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877945; cv=none; b=DEGVRQR+ttgITlpQhqvEhrPaZrpZ221GoMMQJKtGFZMbCzHLg/+wm0+MixaxOLOISNVgZeFPmJhZ+nFjeIHIE0iof2czJSrV4B65wpIa+pheZyjzFTJhmoFviinYxM+6INBgC/FUYB4LyD9Odq7g4ZwgKMMyePY0FH2PmO9x80c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877945; c=relaxed/simple;
	bh=jAFX8qN/ZOAZrSo0QLmGzc4udiuEqBJZUE1qEmE5rxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PsFTY3Vmji9J0W+xy+a3OaHxmVsIv0JzlzWqUsoYlenbWAYNo/6R6FEw2bJG7ff6GVqEWS/SdrtdbWoipko0h1XI0dbMJ/GE+QT8JY/58dP4t2eDJqt7NiRBgh9py9+ndsJIqjfOt6fuCU/88w5Ok4RMUV7Q/M3MUAEG7kF52CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1I0mv/m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1I0mv/m"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDKS4T022985
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QOMNbElsFZP
	lX1Zq+j4xLdTNJSwjVmJdOq5xQhhnr9E=; b=N1I0mv/mQZH9Ks7Xc+fzl1wwXv9
	OSzf5PDmPgVa5lhXD1CrTcDbi1mb2IqBpsVHKeKLEPZEJW2Gp3K23zjWh9HeJD7w
	d1hpTdKpjSssePA6CZoXIj5OK+LtD8hp1WMpQ4JNO4aWeON1D4Kf5FjBJktuZhhn
	fJ2VVerzw+VTMZtk37xxvyKVInipKcUzw3Y2yj7/c1VQ6Kcc2GK5n2wytLTCsVb4
	9/NX2X9br0q2+y7Wz6K6WV2/pA2GXeJoKH1Q0hF8uM5Fpja3R04Ktp2w7YdpmmoS
	pCkd0pNsDDRd41wFJ0U5S/PRPLqGK/3GF/vdmkLqHnASPcXO7Uhe4qn1Uiw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bggy22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74913a4f606so207647b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877942; x=1751482742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOMNbElsFZPlX1Zq+j4xLdTNJSwjVmJdOq5xQhhnr9E=;
        b=AuaaNFkvVuph/++lcuimafXjUPAufShk0sVdqy19ZR8rkyXDBJE28q4r1Xo5pbwzUw
         J3IWyFMHOh1gmseJVCP/Vd90L1R1NBSfSRGcVvEMEaHEUjc5/TLFWm77tMaOf5Wm59gd
         oJuYGupsI0ljQC3OFb5M4WBJNTT+1+gTjac8+QakxQqlU8TP1HYt3s6CKRKlb5f59RdF
         Z60GBj1xCXWqHfXZg8Y7Rqfx5BJRUXhXZUR0TaQ4yleFwCf/lwQV3LVq8FtC00cwT+EY
         hj6J+P7oP7N+2/u5p1/O6ehOHaVH4aucC8PeO3aBf+OBCvdF/l+hOXy+gshAhcb3fswj
         ZdyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIc9OOnWdeLBQbP2oRtnrq8wj5F6etja2EjdKRU8V3WWQ4eEqtywSjuqGahb4wPK2vTORR08NfoTJF0oM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVEJjCRkb4UwS+6YJ+VE9UA7GcpaW6MpEI4sT3BzPCW1C8fm5/
	Ls4mNIJ/WubiDJdlIhlvfNeaeqhFrgmz2X/64kwCY3wL5B583cAIfRfBSr1CzzCCOV+CP2AjKkw
	x5ToJWr1BBuMVszAOBMfw6pJASQTSlEtG+hP8Bf+CPdkROPAkcp9Qevm2UMcq6xwVvJ4eAjOaLe
	o=
X-Gm-Gg: ASbGncsiuWRj3rAWxLIgXeocf8iwe5Yp8TsU6umAKakjByp2OEzXt8OmCRRfVn6ONdu
	8ivzE4abf1wW2wgidPa0WHWbU1dce1Gc660HdQwL6bJXv0HG+K6bmAz00V2FRnbwooYXB6bsYNG
	b3LrU0mm8Lke0FmDkgKIf++d8d5PPSTRg1u4QnvfVcbHHmR4K9Fr4cjpVBWbH168ZizFmLaj/kh
	sZx0vS6Eoxyih/06UrC16BKIe4MwbKnD6UbsLLidhwjQMMoWmta/XlnRsiXEuN/S7qeoQiDveH6
	h4jJ3lKLZdj8w9p1vU1hWXenSW0prM3Z
X-Received: by 2002:a05:6a00:1a91:b0:749:472:d3a7 with SMTP id d2e1a72fcca58-74ad45bcfa8mr6497892b3a.18.1750877941679;
        Wed, 25 Jun 2025 11:59:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNIpJthfggdVhg6h4YytmxITyHayu+CLw/csQVSnZlQgLg/GHx0v96sgTadkVnx72wDQ0ltQ==
X-Received: by 2002:a05:6a00:1a91:b0:749:472:d3a7 with SMTP id d2e1a72fcca58-74ad45bcfa8mr6497858b3a.18.1750877941248;
        Wed, 25 Jun 2025 11:59:01 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8854943sm5355763b3a.138.2025.06.25.11.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:00 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 26/42] drm/msm: rd dumping prep for sparse mappings
Date: Wed, 25 Jun 2025 11:47:19 -0700
Message-ID: <20250625184918.124608-27-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: nc2NqlQRhd_tvM69KXM3Rm6n4yjeCm2u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXxDNBlOdOWGCf
 i5cQps7DmKLkfJBuRAxMmiKZ9HqyVPcaz8jkB+ZW71hM5j0SbKaCZIs3haRT8vJkWS8mripjmaf
 zI1k/FZZgVQu63qxpKY67BFP08E1UV2DkXOPJjqinS80kdXKzEmHZmKtuNr6ABh9ZEHLeMglshw
 p6OuognQhMSBV3NBWOEzs6JizIE5ksnkVrEteZiz4lyFkRebN8NzmHbYF85OpRCsr9RD0SJi1ZB
 OQ6qMQ6jcnAdEWcu9BDZ4zQFqjuOqc+5CwGHdLJc1iD/M9zeKWSsvkMarZZCw9NF3gvhottdQvX
 UsJizYJ3wm2ghlhUIdF26EfAAY4GJtCKI9NT4+iIWJOSOZ6y+IVrvIwupOiUsMGh2jnll7lpWV9
 Am/74ZBoQJw1qmYSZ3wt5YNmMx2UNgpKsw9M48cv15acjXT0FmRljFT16gIyOz6yeVRhZ71E
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685c46f7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=uvlqqL4q8Y98p8K7alsA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: nc2NqlQRhd_tvM69KXM3Rm6n4yjeCm2u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

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

