Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DEF248F65
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228208; cv=none; b=h7v3cJ0Ja/yFj8QU0xcBWbl2tV8bgyqecUCiVyzbUD9PKSbxNg/p6gIt3F3v376y+l535hVfZJj5rtQhXhUN3UCsXefqG2PXIre7POpmu5/d0mZIaCC4OtK8H2kMW3IT5xNvVEABfaODXLx8NwkLmjH56z98iScJg4ZksbvqgLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228208; c=relaxed/simple;
	bh=ESQLfaCKTG4R0R91DqiQm8NfAu6rY6ldXlZSVumZFv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DdWmcUjz0GQ19nTybw4IbmhfhcHoEeNV+33KGxAO78MqEDCyP3TUAZDGwvoymSnUMt0GejPn/Q/AZbu0IqSmK2z1ZAuonDlECHNzbwjP/jbWbJLq9nfGtsHbtQwmRE9JAkP1tkWa35lfcG/Vz80d232qnAjkL1KOgadPdNi3diU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfFz9SbT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfFz9SbT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDjTZY014995
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Aea4FNs+8GG
	CBuby38XbOoX3esCsoQzCfRoTW94GwEs=; b=JfFz9SbT1oIaF0VZxe17kxpx1zQ
	y42O5dIOd7+otgw4y2tjiZa0ga+TJDQE578F1Lj/wr0MERp9ePDYYLEy5JP1MzTn
	jnu+KO38ASHn+07D+1JLTOifyxgSwAwc53gbSLc+Ga47lve5WwLrHJxqSOGQ8Ome
	nA8OrHRYanXlgpUKyj9IGU2JoC0BXzo9D15hDjIeTqmomR12ORLoAUyfD2mCBsrb
	xb8Qk03W8a6XfhCqZL9EcP6rmUiv4YLSEv9whb8KViPBsvgfmrNBxOxkubP4BgS6
	uTLTigHSMhzWrDZT76x0dK1K87z3zQDfsDNz8D96yaYm/OpLexdfwa+GZZw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvjpr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23494a515e3so27567015ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228205; x=1751833005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aea4FNs+8GGCBuby38XbOoX3esCsoQzCfRoTW94GwEs=;
        b=XVPHzy5vd5qhYtfFDbLz0ZZUzY2Qo7Vrj1EUVtRVlJEni+UiwgQcOhRiPIaOyuzzQ1
         tqo7pTpMfYA+qfZKMzZl4KxiGjCny21rdjpaDMo99WdaU7XS89TnSt355SZW+Ht8Easf
         Gx2MFJmVWfo9MI/PZiCLRACyDktFrMq+I4GIzaKMKbZygsG72+uDi4axqa49JOPJBp0v
         uB55ugWQ2EMUXOPMz7wxfPuJcG945kqab8beLGUgES1kPdvxcy4CcJW4SwTfhQTDpE/3
         wHtImMVmIGP/G/HEAKLh0aDdZsBDaF3OVOvRD8Y6OUe94wch5x10wGCiMKOWtO6DvYtN
         mLvw==
X-Forwarded-Encrypted: i=1; AJvYcCWeyLDdFhj7MVaNlJmlTPh+69SdJkr1EuXkinW301sV3NjhbPQYXF7NYJzO8bmKgDlZ94965jH25CZabOE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzls1K5qzNXVMh4aw/vx24qLcwAe3U55uv6YxQH+i5tRrX8AG6v
	MVW3QmCz0OV3xYNHlAtHFuDf4Q8x9am2acGtHMESn0R/4Cykwq3RbH0vL3hHNFZh8pR5bADQRBm
	+0+S8XM+KtYxQVrTGKv8H0WjCZcpkXH2XsJk/3jBlIuXc5Vg/lc34DzmaAkqZzp7a3tM=
X-Gm-Gg: ASbGncu/oXXpSBMJ065rbfpUogQ7cFpml+uOknmgPr/2xCBylRkKE0dgzgHtAdaWP9p
	YW+D3l/5VXhuazrHtYK4mvQDzQuZkiRBWsMfDbEdXLxd6ReM/CKRW74cGjBWoYMuERTFv1E5yJE
	qahLcw6eO5rLLI8U+X5DSyCFC+6aCOYxeJULmyQndEcuqIGGPhgljamYgV4jzoDTOqtT2lwE9hs
	Pqsjjs9xwVSr52MxOj1uB370cpaeJry97o/cb8us3u0bIfZkObKg1AUllGFLez2Nz8UDZKiiKzl
	X53T3/WL3+L7sm6/8i1qIvlldTi24f1dtw==
X-Received: by 2002:a17:902:fc8d:b0:223:4537:65b1 with SMTP id d9443c01a7336-23ac460838amr190149725ad.36.1751228204909;
        Sun, 29 Jun 2025 13:16:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHi+FCZAiieRq2GK0HZyXrffH2uO26d9xwGr6VDhBhxu0D5CBsaqa1z27xVMPNiaaB4jVB9mw==
X-Received: by 2002:a17:902:fc8d:b0:223:4537:65b1 with SMTP id d9443c01a7336-23ac460838amr190149445ad.36.1751228204550;
        Sun, 29 Jun 2025 13:16:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b0052sm64461035ad.158.2025.06.29.13.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:44 -0700 (PDT)
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
Subject: [PATCH v9 19/42] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Sun, 29 Jun 2025 13:13:02 -0700
Message-ID: <20250629201530.25775-20-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: PTAYTAJQedEQz9TQFI9lBChzVIGO5pWh
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68619f2d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=jqtXezU9Yb2X64KsF0MA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: PTAYTAJQedEQz9TQFI9lBChzVIGO5pWh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXzFhI6jn1Ah7F
 hiIDGObRZHMLztz7a+0sh3ZUHOPtzapb2LuUqVj2k+SUjQFXyuLVGqRS4HrEcTTI2lggVS+1mQ2
 NA52kATKOMlXRSrI/QTf3ItWwol2Bvj9SaCEoib87GX6y+zuZ1W2UgFbdd7SvIJhJPW9KnG2fMU
 HwpW/VuEjSehBtNtJj6mDXTo/uL4sa8904QmUrky3LHd81PsCQ0tEjrLmgvDUmpIHvy6aQEkYUt
 vq4PJYKRKNE7t4qfC+sbRJTUT1z8EuJEn5ymickM9o3/X0gCbZqixLFx7MUT6XmKRC/WRHQloja
 eoaayxt+p62W2rATVB9nJ+eBEC0ZGw2PsfLAbOGF1IP3Q6XPPBuuE6wwfy4A4c5OkuQ0LAHpZCY
 O0Dhq14XfHNGdHvNVmeGskQ9616n+HzE10+iekUiRHeJog/vmbb7CeTI7mFCpAJbT2CaWasA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

This is a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 6 +++---
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5c71a4be0dfa..186d160b74de 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -57,7 +57,7 @@ static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
 			if (vma->vm != vm)
 				continue;
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			msm_gem_vma_close(vma);
 			break;
 		}
@@ -433,7 +433,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -607,7 +607,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_purge(vma);
+	msm_gem_vma_unmap(vma);
 	msm_gem_vma_close(vma);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 0e7b17b2093b..b5bf21f62f9d 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -111,7 +111,7 @@ struct msm_gem_vma {
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end);
-void msm_gem_vma_purge(struct drm_gpuva *vma);
+void msm_gem_vma_unmap(struct drm_gpuva *vma);
 int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index ef0efd87e4a6..e16a8cafd8be 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -21,7 +21,7 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 }
 
 /* Actually unmap memory for the vma */
-void msm_gem_vma_purge(struct drm_gpuva *vma)
+void msm_gem_vma_unmap(struct drm_gpuva *vma)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
-- 
2.50.0

