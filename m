Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F522FC003
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877963; cv=none; b=OI0RiZEEMNuJIP8P2jh2Bo/70jMaOtJkA3raGYSviEI1I8+VIywuWXKadc/NXQV//R/UOb6Bw/b0qWVb8G9GfkPFUFaZudaeA0KeY7tm5kLtc3sGa/V6ILCMxr0LfkWOsaONNh74cXkVkCIopz6p/rVTbikczeQK0NgG3wS6MII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877963; c=relaxed/simple;
	bh=szvV6IrMopmr+OBL9gQagLLcUjdP+1eIVq6kpBn3t2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RCwoO/SzeMG2nk2sZL/4UbLT2IkMps2ZH/0CnC81cwjir2sB9EmsMwsbTKbUotLXgr6sjY93S3f0glvB1J2is/vh6p57wPy6EojiIa8FeA95jHqslYh3rv28exTu/bBxWXIz9XiX5RUVTXaHhshm4p8sscjFJoL+zISldzMBtF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9T/rjxq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9T/rjxq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCu4jN015282
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E0CQf8ECEko
	EZPuzosk2AQuQ/2hYymsahlQVM4KlO5E=; b=P9T/rjxqUMR6cavrz/lgkUrhCUz
	DN/OtrtklgG5Gq0r+xNFu9IswxkwPWlCs91mPtSma44UBle2uz99UVmUUpSHe12V
	flHGUKwYppSBSdFnKRLuH0YZ9R7mhVDenTwCFWevlMs2/Vsr85weCyBJ4pgY1gEw
	T2McfsXeoFvGmOOA+joewFvy1Ugm2tM1nX5H0AE+ISfC2W4gYygccRv/Syxs2RAF
	nO7K9S8zCqDNcuPQWz2T/O/sChmouMuihU9wL2jnpAqgCZav3GYovZB6JK7Dq0ZW
	NKsp+It9Hr/Wi4AhhdX6q+OAGLk9B4I0DqCbXdRDLdK7ILkAVihylboiLWg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5t1rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:59:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b31f112c90aso143262a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877960; x=1751482760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0CQf8ECEkoEZPuzosk2AQuQ/2hYymsahlQVM4KlO5E=;
        b=cbnEdxOKIGs9m3Sgny4f6jYiLEw+qXGOsCmPAR7mKxxE5rizKpcJA5bUGS0E2m2kCA
         2u6UH5IV1DULX6VuW8a/ZarSyv2vQzfUICg82BClAyObyBglOrJGXgJy3UJRqzrazJVH
         QBl0b3uoMSQkjkqfpq5q99I55JrUCcndaGlxZ3APcwSHAosFXQhYR2uEVqewOI+RJAuD
         gzdowlJ9fFr3fT2iyFBV1DWlrm/kqhQW46c0V3HKqgOXHyt5Xmqx3EKHeE2FiAxId5in
         7+9yKkVRf+T09sFO97rPc65oH2fIT+sPht5/0Ye/kqCU+ycpi0mNFRj6KfzREeCM2zoI
         VSeg==
X-Forwarded-Encrypted: i=1; AJvYcCWUz2DFjGHppAOSvyw1UJAXAWhxfal12uFQkgigJlIdGor9VJoDyz6mIbX8OAbag7QOs0x5ZbJLFxUtoU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrizChnrj2gppv3M2Gl2uEAseWFSHeXZAnm6gfcsgsndCIqcAK
	Cg3OIJ3Z4ZWhL47PPEbzMJ0NC1bSGXcn4u5/ddE67Xv2L4OHEM6nt0S+l2khKTIeh7XmOolTH1x
	/4jpL7T4CB1u8UDpQ3pjgrCGTEhzzPvbO/EsGJHhDO4O34u67B2meL6Pr3n28T2XsgoQ=
X-Gm-Gg: ASbGncvUQXwVZDlczTcmrsVe+qPhkzq/QBejNSxFRlfYWOv3u5agSyJvPJqrIIuxBnL
	KPjr4OwM32vNZt/O+Axen6PqhiIVhVxqgneoPwxM1E+I1mRz4XTmMuUAL1ARsqddo42ZWDJGBdB
	KGi/mYAvlvrlHo7V5H+BIbQDrKgvhpwluRTLA0yU5ImQ/ncRj42IS8aiMPl8v9o0WRizA8ZoWyx
	GzkwKR05yj57JDoE7IZNcIUnY5pPUIu8SGrZcqcQp0us3QC4LzhkeIZOSNP9EUTzUzNaZeNgmGI
	N0PT9EJYJLamazhnaqa9xp8zGP7Kx736
X-Received: by 2002:a05:6a21:790:b0:1f3:31fe:c1da with SMTP id adf61e73a8af0-2208d116316mr884049637.11.1750877959814;
        Wed, 25 Jun 2025 11:59:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmJ+IhD7XkltkNbiUYif6D9uQ/Gi11DQoaOwAXBuNqubE9zV+mGLMYWUUTXdmancoD07qNUA==
X-Received: by 2002:a05:6a21:790:b0:1f3:31fe:c1da with SMTP id adf61e73a8af0-2208d116316mr884031637.11.1750877959453;
        Wed, 25 Jun 2025 11:59:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f126a7bbsm13319342a12.69.2025.06.25.11.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:19 -0700 (PDT)
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
Subject: [PATCH v7 38/42] drm/msm: Add mmu prealloc tracepoint
Date: Wed, 25 Jun 2025 11:47:31 -0700
Message-ID: <20250625184918.124608-39-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: vCKtF2WpwOa00aXQjXW1btWt_n7SVEip
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX6U97TqJ3mz4Q
 BVN2F4hqgnH5i/nL6fNse9fJhPejJi/9CJvumKw5v+ye6+G60V/8KeWBV8C56LS/+ooQDtAuyXf
 CB2JaxcqgfOs8mINh7hZqdb/2dlEnjbBDbvX5BkaBlRBRhIsk3mH5J4CJvhHZz69284lwpW0xBp
 wi2HN2CXzXsKOum1t+To8mobIHqWdv8jHAwErkhC4q6kKWbBT9yUaW2QEt9jzJr86TZNsSHeMW7
 U8jZ7bEOQg+8vkmqUTgZ6JHc6VlLvi/lhQ5Nrz+EeCjnatmvMgUknWYLprRyY/LKmLaBzFZR0qJ
 X0HnSTalraPsOeAp5Q3OeXiyTROFX9QecW7mDyN0aybBwAnFLwcv2TxbWgCOLxXo5Em/h/oCvlH
 kYECUnLCcKmtkRbzIFFZ3/GpPcP6oI0rbn1fx5ldf9/RmKiBSXMfYEusJdbxDiL5QznzgbCX
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685c4708 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=W9C9WuCMp67TlgULjysA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: vCKtF2WpwOa00aXQjXW1btWt_n7SVEip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

So we can monitor how many pages are getting preallocated vs how many
get used.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
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
index bfee3e0dcb23..09fd99ac06f6 100644
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
2.49.0

