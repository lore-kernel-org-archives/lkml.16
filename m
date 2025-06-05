Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0063289E23
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148438; cv=none; b=V1n3s5r2ZwB8ZIYvPdlsJ24/VLJvIaNMRzoQbwaHwkFC/Gw31gf5NO9ZKaSLNmDUxEeqk+LbzZUF8DhYF6S+uyemf8Nc+bDu7Ct+4ojodk2uKxiqQJkITr0T5HYnMfFrR83i4p17lzOA36I6F5K64jx9BZw06jL3Mbls72tL3+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148438; c=relaxed/simple;
	bh=szvV6IrMopmr+OBL9gQagLLcUjdP+1eIVq6kpBn3t2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uy/uC0JjYX2YHGphy8uUXuui5dMRk6odVR89crgoBQQNX/6BwjiUKzM+eeTA+9rTOnfWlAGhj7R4hEn9EjjGQW524J/uHJRKap0NIN2molDP89u7Dd7wProBuih828Ta+epCnP36uorpWan0ATHUm2rRoL8WTnsO10MSzy0rZOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LhVw0kSf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhVw0kSf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555AGvbp023897
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E0CQf8ECEko
	EZPuzosk2AQuQ/2hYymsahlQVM4KlO5E=; b=LhVw0kSfCagt1hE3EbqQFhcSwTz
	jNIZhPETxbdWpiKNWh6SlWzzz8pI2sQz1VU63FbymNH1wz6vxjP1dwplO0yJROus
	y8EVElidhgJ0V9BMT5abry+KJwCJ4ngUa2xfOUn/EYiEJ45U0tCXivKmC9GT0gzq
	rWnTgT4ANyrHfr8X7aPcZhSc10Lek6wcad3/S2kSDCaWYUmtX9wYwfOnZZpUexEf
	qXy/w/xsVRRcyRuyHw8Aq60gJve0uaHzmlIja7UJFPdzEkOE+tpuBLyYtBm6CifT
	8AnkqBdcBuP3OlmoOhHvGkhk+71q7Cvvq7yMI3xC0WhD3JxgpQTuvj3c0JA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn04kkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:33:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311b6d25163so1280002a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148400; x=1749753200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0CQf8ECEkoEZPuzosk2AQuQ/2hYymsahlQVM4KlO5E=;
        b=ledjZ8c0M4zAesFVpVexVzHCmjE65QYR+15IMVQ4VJGb0tJr3jklg8TY45GIAa1F1h
         VVTjnype3gIeHwg7o8ms4er/XlHDcDesZKZalN7fDi9imvzqk4FCjjkgHdpqqjiLSlo2
         9lJaxykpx8fekyIy8PuF69W/uQBOrXOt2Oc9zFTm+eEK5jy52m8t/C0250nfMW9kqkzc
         oSARR7OT5xPodjvVTVwRoPq25knjNBwwqoe0+Qtqq2zrO2DPol/xN9xm/vaXRLbyc1bb
         f3uGU8I37xytarT+YGLwvAndgJQXqaYlD5i6etqgcdADJAEf/KxrLU+xqcXiGBDmli1s
         K4LQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7bOxYuY01XdsNudNGqTYZvhLRUoqvspM8suMDy/Hv5NAZ3gccqr5PvX6+mSXnAu+mpwDfrcTSpxMokAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Fd85nNBFdK1wk3fgfAtsaDoRG/bnBOKiC3IVk4O25az8gCau
	OQZBO9hAkxDhJ9Cyv/jMPkN8L0/7Twy7VqUo3dARQCoVjoqzzDORKGaPo9CKsKPg6VR6XdYx9d1
	VfjdXs1TmDnnP6TltXz4UuleNQCMpw/n389lsDMlnJ2T5J0clHS0DwCAPzcKmVSjaWQg=
X-Gm-Gg: ASbGncvx5o7H3kjlGW89/Wy+iYQ2f7GFjE9Gp235Jc4lFjcZ+38nzhiTYG5y9n/+6gT
	aF4uND8k19416ksqvxF5O08k9e/tYe3tEoO67YVCcvSxArUjNCPjOOm2rz4O37Z+VSbF/1aPS8A
	frlAQlV0wXWQDyv+ThcYkaANVXIuXf6lljSvlt+1zViFYcLQXd6So+cHFjBGT/Oi423u88E+4Uv
	u8nT6S1bNE0RznHr+AD5SnBLInI/gUPFCQqsAy9yRTcfmWZIiKpbwKKPorHeVV4pdUO4c4Q8Ku/
	9vzh5LcsmhfUgwfAkt1h+5QKzOSEENyS
X-Received: by 2002:a17:90b:4e86:b0:311:b0ec:135f with SMTP id 98e67ed59e1d1-3134706f8efmr1045853a91.30.1749148399693;
        Thu, 05 Jun 2025 11:33:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtRHbayHnOG/QPhFRjld2rJq5hRHHtm7rPI8PxA2Bd1CySo0EJuFhDV1n0cRcHKai1dDS1Qw==
X-Received: by 2002:a17:90b:4e86:b0:311:b0ec:135f with SMTP id 98e67ed59e1d1-3134706f8efmr1045803a91.30.1749148399107;
        Thu, 05 Jun 2025 11:33:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fc373esm61635a91.32.2025.06.05.11.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:18 -0700 (PDT)
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
Subject: [PATCH v6 36/40] drm/msm: Add mmu prealloc tracepoint
Date: Thu,  5 Jun 2025 11:29:21 -0700
Message-ID: <20250605183111.163594-37-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: CbAGRrJPsNoi6BNI5rhN6NU4CAWJv9pp
X-Proofpoint-GUID: CbAGRrJPsNoi6BNI5rhN6NU4CAWJv9pp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NiBTYWx0ZWRfX6Vzz6hoChnZa
 MpWUx6ePa2o7e4OWNooOMJbWHRtppFEjgx35Y4/xkfOnILYS5XMgRYDAILeFA2BykEbo3rm7/w9
 wEz8mphSAUQbezasDyPqP3xCK4hHXVIKAkpsc5rZvbwAsxi4mlFMOkCN66tYqwbpFJAlgp5D/VF
 5JFu9eanYY2kyqYEq5tsknaGB9cgHDfr+V9U64SYZL4I50MDRkwKYopftuOj+r3LnN5J40z546R
 dstO55cfYvdaFMXpIz0Au1lGE7EsO0e0rWqqzJ5zJKJYb2xeOhQNYg26O7Fibn3fGy25OQF3TEa
 L85cL4RpkpoM06h3pGBMPKimSHs8f3IeenlchNe4GcgurH5wlDrT2Wy1PaY8K05SNWvhzCH80Q+
 G68wFWHy9HkYqJMBeNYkxFL/M5+lhw/2nddoIJF0GX8et1ieFB59ft+1NshnC4ENtQ5cDMXH
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=6841e312 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=W9C9WuCMp67TlgULjysA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050166

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

