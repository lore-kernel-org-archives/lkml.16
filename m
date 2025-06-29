Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3CD24889F
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206100; cv=none; b=UOYgtyeQTreI5Bl07A6kMW5NDz6DpSOPSBwSLwF+JhD80NLF2PlGvihU6pzHp1I1DsGLg7agVNXci9vg6MC3TyYDTFjcJpGun0NfiC3WfQWYxIPAYpg1H+elq7pArAMeUTUCZ/xXHd/9BxdKcw0tEvZNnO83lE435AsbXwtgHSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206100; c=relaxed/simple;
	bh=DBDmWCiCFVgbl4WtBxHdzqbNhlAEm9jFk7Gr/5+tOIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K9N5PKNIiwz5J0uaD+TbIm80X9nDy6ESlIm+3XEHrnSiHz4MBbHaiIlX3QfPu22eFmGrDeaCF2W/RPlS5Vk1wX2jBjnWRaHk6R7auWk5kfO/y2nJGPMazmaiGOfphYm/m89zb74aGMZ6JCmgwroYiPSdE9gpoQ1v3gFybn97JCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QtR1bxDX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QtR1bxDX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDRDp9007373
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5mY0F5PMmU9
	vrS33+13h25TEJD4UxWJEsq72XU3xSVs=; b=QtR1bxDXoq1dpVHguN0qwtmvC4Y
	0xC18TAnzct4aipM6HUb94TLMrrCAKsP60bZJFPIsgOe2s0DgsONMSWzseKdGXgn
	twCKv1gfnAGO3FObyCtuEdEhGDD+ulXJn+iMNSaCZW1QNygoMfx5w6yaj5gBNIQp
	LkBJDFS5H1Hac4sYN2Bt2aEpUrQVKMH5LQYw/mqxQ85l7wj6hDTZKAwJhsz9u46I
	pG/Vx2U6r4U3p9LSsIZXgKYHsXkItu72ynwuONtWSrmBnp0HkBjY7cVa4VzWpGPS
	MPOvBWqwCa6qvpJoyf6fdYRRFR+Pz2Z96JIenGdByZyT4PCqjrsFILRe9Cg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801t7tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:08:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b115fb801bcso4428665a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206096; x=1751810896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mY0F5PMmU9vrS33+13h25TEJD4UxWJEsq72XU3xSVs=;
        b=GPC+zf3p3H3w9I+IA0n1limJSp02oNDrCrRk8GnHGWnb+qtHNjOhWGaKx3cV7XJ+8Q
         +Rh8GxByqRBrRM+qs7sF/BcG0QDaDIZt2/pCpMqWWGvVLz+IMX1/HYE19e1b3/b2mU+0
         zsSvpUN1s8fOZzLFpMw5mtfJxSlcnnSGsQxX2Jil36AVRxpyvCnF95KJ70vP8A3PEX58
         WwOV79dZCFaoS12Xm4xBqdh3BxqOXuoc8sCwB4t8IAPsKTPYhHQrXeZ9Yp6lj+CBbFoQ
         HE70LV9vxtOxWYM0GDVKGYY4MQy0YtakHxgcRpKec3kuiGCg3nYnxvAyqq74hopIleca
         YJFA==
X-Forwarded-Encrypted: i=1; AJvYcCX6ZhU8+Uby7PleMvLo6Te0PB6P4AD0Qe21Qj7DNMWjS1Yn6+rAFJjPqj2bhm5ttJRzQXspYoWw+RmH8g4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW2OldFdACSqlP/y3o2eTX4TvCxi7qx+zi0wMuYY4VkHgN9l7z
	kN32ykwk/qISoXgLgAoA9no38RMQvjaXn+xi/DCTaepVVyMda+ZKkYyk9fBryR8tEiYr5bV18dC
	VYtbQHG9hGtIuQQs+lbJcnOo2FIg6oDdhhUvSEvNiQzoq8oKmXtSQp73wjO4e+Q9x/GM=
X-Gm-Gg: ASbGnct/UBNI+Pj8HP/be6xtE/e7DOal1wwpEPhKCuyYMeQTU54lmV1vNwJJsbKZrnn
	L/qBfh0Dbm3fqgVmy2eQ7lErQUW00NhV5ApsTz+2nG70+7DGKS3nYgTeF+0nBYQDDro6gqZKHqN
	oCIMePGmZW2AaYoz6qJLlYfoa8p6codN7XJum2bmDvg0JH8B7mET8A21ol+/mgxRYntGdLNVcC+
	RHFk9T9w9L5f0xHkc9wkPOXuZq7GCloVXkQ3nkuRpHyNA9ug5Jjg6KinMb3JO31h6FSny3doK1T
	s2Pbiec+vVfw5kYh5ZXifJgdwsocZvKo
X-Received: by 2002:a05:6a21:6b0f:b0:21f:5361:d7f7 with SMTP id adf61e73a8af0-220a18343cdmr17849620637.31.1751206096055;
        Sun, 29 Jun 2025 07:08:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfYDkWzgCDdpgGyHKdq4vr6VIPmal4jKOqqpi3gamCdrIPmrcPzY2NWoSmG5zIgIYn9cnZRA==
X-Received: by 2002:a05:6a21:6b0f:b0:21f:5361:d7f7 with SMTP id adf61e73a8af0-220a18343cdmr17849557637.31.1751206095533;
        Sun, 29 Jun 2025 07:08:15 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541c369sm6676309b3a.42.2025.06.29.07.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:08:15 -0700 (PDT)
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
Subject: [PATCH v8 38/42] drm/msm: Add mmu prealloc tracepoint
Date: Sun, 29 Jun 2025 07:03:41 -0700
Message-ID: <20250629140537.30850-39-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: 6laXiOz-rLU_9izz9Cq8S1KE93q_yyfh
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=686148d1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=W9C9WuCMp67TlgULjysA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 6laXiOz-rLU_9izz9Cq8S1KE93q_yyfh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfXzUkeiNBLZlYL
 bTz9hN0RQk/7IoLkbEEzmY2CQlkSVxDG0RyOkD0G78QN1l4USXFboUxXCmtvdjJbriCV5tgKyJ6
 X76Z2O+eSwTOo0U2SqNdCUnNJeqICp/6xcghIZmn5wCNZAMf6XeDBh590y3OeUn0kCh+y/cmpU9
 7kjFPgvLtO3rb1WqQjYIsQSP5n+EmMS4CvC59nHhOuPpkypyQDRRJ5nW03NI8JVv8iwly15Upyx
 NDMn0nRB+QoIc0wPJZBYUuK5+4Dr/iRzmST0BDXtGh1T4KMRIx37t9o8kYn7niOUl16PKxav6Th
 OOAJGI8PgEtwLUBUetQzwZ0LU+c2c9AFyFh6QfX2YSxWHL9hQ63mjMVv2ANdiE/S8IfplNbQ/QK
 nRO+y97LUlp16+0vi9YwGfZJTA1Vl181H+inpy5LQZrc3EQGRUIfy5hrLLCPW/1zk0ZkMUXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119

From: Rob Clark <robdclark@chromium.org>

So we can monitor how many pages are getting preallocated vs how many
get used.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu_trace.h | 14 ++++++++++++++
 drivers/gpu/drm/msm/msm_iommu.c     |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index 7f863282db0d..781bbe5540bd 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -205,6 +205,20 @@ TRACE_EVENT(msm_gpu_preemption_irq,
 		TP_printk("preempted to %u", __entry->ring_id)
 );
 
+TRACE_EVENT(msm_mmu_prealloc_cleanup,
+		TP_PROTO(u32 count, u32 remaining),
+		TP_ARGS(count, remaining),
+		TP_STRUCT__entry(
+			__field(u32, count)
+			__field(u32, remaining)
+			),
+		TP_fast_assign(
+			__entry->count = count;
+			__entry->remaining = remaining;
+			),
+		TP_printk("count=%u, remaining=%u", __entry->count, __entry->remaining)
+);
+
 #endif
 
 #undef TRACE_INCLUDE_PATH
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 887c9023f8a2..55c29f49b788 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -8,6 +8,7 @@
 #include <linux/io-pgtable.h>
 #include <linux/kmemleak.h>
 #include "msm_drv.h"
+#include "msm_gpu_trace.h"
 #include "msm_mmu.h"
 
 struct msm_iommu {
@@ -346,6 +347,9 @@ msm_iommu_pagetable_prealloc_cleanup(struct msm_mmu *mmu, struct msm_mmu_preallo
 	struct kmem_cache *pt_cache = get_pt_cache(mmu);
 	uint32_t remaining_pt_count = p->count - p->ptr;
 
+	if (p->count > 0)
+		trace_msm_mmu_prealloc_cleanup(p->count, remaining_pt_count);
+
 	kmem_cache_free_bulk(pt_cache, remaining_pt_count, &p->pages[p->ptr]);
 	kvfree(p->pages);
 }
-- 
2.50.0

