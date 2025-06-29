Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1815263F47
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228237; cv=none; b=cDCzZ5bj0t5OqhkMKzzLFp5TYAKVWKAyUQnTN6+m9VDNlMaIPVp0UlI78yLYMCoa7QtkVf/YTvTK03xFyPSaiET3CekC1him+tcoeAw1uoxjLb4Ph4E2JCGfU1UuT2ys0aFBEcLNhAejR2fIM7qVEdgKitbPw2es6TkCSxtjAHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228237; c=relaxed/simple;
	bh=DBDmWCiCFVgbl4WtBxHdzqbNhlAEm9jFk7Gr/5+tOIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VdQ4IRtmcGcBk17qtZDtsysnK46aj/L41BnkRPqxyNEP/tYMrAa1KQbe7kIXxA+GJ8zLiH65OesIS/D695A2DlkFeuRuzAwbOyB3suZtSVhYNl2FCSG9WZr2Hn6752qb0TKnsH+xVmysoUvt+scVJ6AsWz1/dPZr8DFfkJGRY9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+fjg4A0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+fjg4A0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TBqiXn031184
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5mY0F5PMmU9
	vrS33+13h25TEJD4UxWJEsq72XU3xSVs=; b=P+fjg4A0RZe6REe3XrkoPcZmiE2
	OcTh9tv7DwGlIzx2RC8LdNJZNsqxuuMYRM+aL0FhYrNgxk6qJBt/FnSKIyqXQ+Bd
	WV1953yLX6NW39Ns9BklbuvSRNchtfwp9ndDR45xf1IVhb6hfyPgDDjjRgSSwxff
	1lU3Bn8F3aWOCRU+Ve7zQLtqyPJXXna72nx3aAVxiTqKD/KV92YrDibrcnLH6NiY
	DPBD2HMtL2BQi80rxpJYqotdJiaW+hmH7akgXgEflBwdjvTcbNyDY2/YjycPnmXY
	DvAcrfH947y2/u0VG1YZc7lqDtRxjKObMAPWDo/Pxe7dcArHpzlXJYMAwzw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8m62mdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748e1e474f8so2701091b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228234; x=1751833034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mY0F5PMmU9vrS33+13h25TEJD4UxWJEsq72XU3xSVs=;
        b=IAYl4UOdqT5DB/vMOp4gA+Hm7cR0fGSIF66aO2m/Weo7ZXI7zZpu1UpULAf/yqHv4G
         DPsdLtGd2gitCmTfgW+jaxqkLNVfaPZrFke9IGjXArORoGS0n/yCYfgpqmieswXd1IrW
         tjicLRTseazsb4NIzePB0V4eiqVsx6qwFQfg9IysY9runnSaTJuhNOLV1HwNsZfAg3ld
         QH6Ho8ZT0ApWKPgVjcwuf8Y+jjqGghFomKHnjyqaDIFLE3Z2fdUCYBsISuF1QDn0kLk2
         flVbHrKcRmDSisLXbu9/gmyyY8uvb9k9qEwYQIF8kWTEKs5XHMlKaLISb//JCenxGnLi
         4WQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOuHxE8sUfZYMeQmwvTMInjOssIHimJEAeiTuIZchEjoYruNrurTwhjHqHQGAxLM8hlTcaRZBuE4MQhng=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsXTUJ3UiAot74o7KOfqAUhADe4u7e+DBjAIozxI5r1wBiXHBr
	ngGkofgFtdZy+BmCg2LL4ATvQT2b5T7xmgPzhpKkCwwqxh3KYSrubCWT5fWduMZAfJ9qCeQx2A3
	RZgBed0BE1Pjt7HRU5/zo5Jbb1mt76TaCHEUQdtp8n1f+MMqQ/dBQxP3R1u4VGjJ3HNc=
X-Gm-Gg: ASbGncsE1IR4JlYOqYEOte9f+UkStc1BRtGtspYHuR4EKIYavhKhwFfWF8FTOyxJrq7
	8SM9n2AGVb/V7nJEwhrk75gIlQfm7QYksIhE2fCRMJfFd6Rz45NJgKXeJkZhfMhjgjtw5epY0nO
	zl5HJva/eI3agAPILnISmw+WZK+iy7OjV601r6s6alkhqZ+1fUIczrVAo6/lEX0zm3Rmw599qr6
	CCSQtR35+Z2OaQN+nMq20p/Vj83RBYRyNBULDPfoUI3T9vkcbn+r4kWn1u3H13dXxsZ7sWyiJAs
	tzoeSzmTJBUzcXJG1wUmukkEUxdH6SgPrw==
X-Received: by 2002:a05:6a00:3cd5:b0:74a:f611:484 with SMTP id d2e1a72fcca58-74af70a825cmr16437204b3a.24.1751228233861;
        Sun, 29 Jun 2025 13:17:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOpY4JD8XXzpeyT/cFkQnTv9hNBJBrOs2mriXfKg05KpBh8dREEFouJKKLOYU1fqTJGyyiJw==
X-Received: by 2002:a05:6a00:3cd5:b0:74a:f611:484 with SMTP id d2e1a72fcca58-74af70a825cmr16437173b3a.24.1751228233466;
        Sun, 29 Jun 2025 13:17:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57efae1sm7273234b3a.163.2025.06.29.13.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:17:13 -0700 (PDT)
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
Subject: [PATCH v9 38/42] drm/msm: Add mmu prealloc tracepoint
Date: Sun, 29 Jun 2025 13:13:21 -0700
Message-ID: <20250629201530.25775-39-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX+MKiBEM1xnkk
 l9n4+PSC9A6paiiTDFokL2X5v+YsMdfPkcq/l1/6ONdjRIKSD7Skp2DifK7V20X3QgNvuLF7Slq
 5Ow5dH9tRUTLcIognRRd8m6YY01vZQdF5A/QJ5rCFVZKx8C4rd12OihBOPCBM0C881H4z2MphT/
 GK+juUtP49PPuayRlZ1G6jesyx12+lwzvM5weTXF0aSoDlK+2/drCPfK/haCRjOwwEdPJJj2g9Y
 TNbe8C8NGPnRtfShP0jRjsC2xbe3tnFfNNLZH+Wi9BQw6x5iTV7COeQbVu+N7c1/E1+QdlcZSp9
 hfh8GGuz0yIRKGzcG16y463xhFb29p46bDnMnA/Rd1aJCtmAhrvHnr9Pt/GABkKWD24JKQocu3C
 apwiJuohqS7lbUMi+/FCd24/UM2zuk72VByOMsMmR9vuehso0iqAAM01Ix9rX74loxnxoykJ
X-Authority-Analysis: v=2.4 cv=Fq0F/3rq c=1 sm=1 tr=0 ts=68619f4a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=W9C9WuCMp67TlgULjysA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 3EB2U0wAKOOZVJLyYTyWEFPyfmwm4-uM
X-Proofpoint-ORIG-GUID: 3EB2U0wAKOOZVJLyYTyWEFPyfmwm4-uM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172

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

