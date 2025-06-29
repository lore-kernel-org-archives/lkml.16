Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC6525CC69
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228223; cv=none; b=E+h6MvcK9fehqCZwojktTthP9W1krbe3OlVwNIo8JTCgJu1Ks8at+U4V9q46hZSXGaU3xNfp2UzV/HxRuPBQZI9GV5i3wrRNVHiV3AoVyg9E/RFIb+TZ61Ugpqv0ogT+zdr1JjJ+lEgPxFTneGSDBlKOQfrZiGOPCtGUROajovU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228223; c=relaxed/simple;
	bh=oSLD17tD3i/SIJGyBuomwvpM409qt9O5IQtczoH19mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V2CZwold32bJbTQ7+FUIKi/X0dEXwZJ7N24w8TDD5kGqHThdHrdKpmQNEE+PItSd7NDo96MxI+0J5RN2FyVAp20Xlkq45kTWInK7OIfES6mCg29TnnwLREWVOdqQyr/e/2FLULThnF65RV0jyYijBBJwTGXZlWzx1Uzr8jTL01I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDnx0LU4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDnx0LU4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDTXHR018757
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GiAM1wF2+vU
	wkpCq/AxW+9TLh9YmmG5Rgyh/h2VPEqQ=; b=fDnx0LU4V7NKf/OHFe3W029fWfR
	KMLSNdTZblHmLjLR4dw5jo8GT82U7nL331ZLB4da2Ebv10vQNaHHN7wZYlOuN8ZA
	AbFWH6WOffGfZEmZF9Z6umoVB38M2p+bvwxkZjlRfEtUafuRHAkoMrD7ZqVMFqxw
	C/wj1zYnnTqFzIOV13KLVfR8lPZcoyixUOICiTP9IO+PHn7PHMw0j9f9Y411uV69
	LPatx/1jiGL1ixD9ax+1Kdq96MaiCpufalbmnhKIHKoUzcNVs7nCgmR9sa5BiLpx
	03EXbT0njybEpmzmMwpMb+Ljh0cdiabMHwcOrRVWZyc+L8vBhEg1JIn33xw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95htk77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-313d6d671ffso3183576a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228218; x=1751833018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiAM1wF2+vUwkpCq/AxW+9TLh9YmmG5Rgyh/h2VPEqQ=;
        b=i7X+pJ8CIWTFF/dGFpxXQmNrfSSCYzjlTPo+SptJjfH6BlCod3/ogGfrmoqCDiQ+Ot
         CCXUiSvRuuWL7XvgAL4D9hz8bSKAnS/DJDP1R3CdvWiH/T7pXA+eMH3+gahU9e13l1yK
         a36Cz9Q3YirpGxchFHaRXVmxPt+Lq6zrmEnfDcWD/GxUP52a8qoYc5DkYle0EzfSX8nn
         smmdngUpvmTJdhtso0ZG+jmfa3NFGp/oYefJnMrlkQAM3V0bb4LwildYRv4H89iyKjdF
         x/x0irlzQr4AWtVzPhuFkWBhwKINQMTupkV/FwFtQIPUSZUPU17Y9QPPxZg7Lhhcz5gI
         feQg==
X-Forwarded-Encrypted: i=1; AJvYcCWcoAtkk8/deBqinflmGWYCLxDwXOwp+oY/2hL52z96MIeB7JXYryQHwe9wFF/U38SicmV96YQVeAPey5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI+OuPzo1U6+iEKopO/DvyG+UkrMdfc0O6v9NsGEowlUBEScWC
	5WJIRkd6SpyS9fnrsQHxWiGTOmpQuoJQdTPw7L8HQEZ6imriuO8k88pnsWZOpywTy6/K0+tfNmm
	okpu5w8UmFDFsvZHPAR+AHv1cG1FT2mdtZlHEXWjiSjXQxvq6tVB4vKtxrluCbDlh0OM=
X-Gm-Gg: ASbGncvHG+ja4dZ6ABJo/RP3ksFWvAjRiJ3ooI5RcSTp1KH5pmywaeimfuUAGZGBZtB
	kwpb/1VuOt3l2e8ac6WRM/ejkmvRhzXfe1kehDHk/XtKU5+DVDEX9mJqVaRkdnK/QZKlmSb1msm
	2Lf3PFzL1RzFq11OxKTZTKTCZ+K8SDtzdBp56qIbgkNFDeNmbZE/c8VfLLekUgVE06SizDQO6ND
	o8yJ5pl54e7qbpvtmoJqVst8Q97bL2vSridHJp1OPAhCSB3Okc/DOkkgPwAQoIIubLkRzGmJbOB
	WXJ90BtxO0C/SII4uTvRdQfSkzSjrQXNnA==
X-Received: by 2002:a17:90b:47:b0:312:e76f:5213 with SMTP id 98e67ed59e1d1-318c9256c7emr14508881a91.28.1751228217634;
        Sun, 29 Jun 2025 13:16:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp24Z6Ubl0Mg+UKuim2CPGQfJhFY6T/tHTvs17eA1pXtmVUu5AgaaxuE8ttGSFY1Jqy5xm5A==
X-Received: by 2002:a17:90b:47:b0:312:e76f:5213 with SMTP id 98e67ed59e1d1-318c9256c7emr14508860a91.28.1751228217278;
        Sun, 29 Jun 2025 13:16:57 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5382f02sm11646942a91.1.2025.06.29.13.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:56 -0700 (PDT)
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
Subject: [PATCH v9 28/42] drm/msm: rd dumping support for sparse
Date: Sun, 29 Jun 2025 13:13:11 -0700
Message-ID: <20250629201530.25775-29-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfX7mb2XkvwkR99
 1CGwl5+PepOWNkD3gbz0lfOpzEfKqQPDSeiLeX48iZW8SICm90d5VUxLuH7pCNP2ceB+tozqvZX
 ejDBB3PdKeMonH6PiaJw1Z0JQG/zA+wmhEw2fgDeO4Z6wzBWOgDImkPQk1dVpOAdnsttfKGhKHC
 +O8Jx0exbg95F0eOwPGcdg9EAF0kI+QaySen007A2aPqqvR8gw7Vk4KC9MO/6r5I5dZuhPxMCRE
 F1G9JtMSAjbirwJNIqN23rMyH6nU4fREewUKHxVdiyVL+kp4325EYudzV3GzvZX4RNlHKSjaD0M
 j9WkN+gmJZ95MY2sx2lrtubDNPghvKKIbYae55OPGb8zbEmj4AHrqd1EpaGgQ00efvVeQt/2Ul0
 sbD3sVgA/Hc+OOMhHgvi0heL/EbwHqZgD6FCdwDXGx0nFHYf0xv5BUaOAsTMtzqSwGTLQL4c
X-Proofpoint-ORIG-GUID: ZdUpgq45x-o1DSbPun1_sO1UiYfBVIet
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=68619f3a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Oi01P0gpvwaEutKy2E0A:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ZdUpgq45x-o1DSbPun1_sO1UiYfBVIet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290171

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

