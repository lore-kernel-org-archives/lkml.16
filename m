Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D800024728C
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228204; cv=none; b=MoKyHzDkRu8VVidTf3o1VrTL8ECxaHST7pIZybkP2FdGQo2tuh14BjwK/Z3gOCEgt1kifLu6hKvJTdW7MdUke818Ux80IKYVdWPhXVAC5sMx8e3VbyWGQxFe5p9MWo21P9Zzvqq8zP5JYEKtvNi4O0OGIj9l00W8QDHdJf7T5RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228204; c=relaxed/simple;
	bh=8ynhkJOScfi9ikAGiRHB32lhFvswULa1Hiuup/gNOrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ks9ZBKIFkZuDtqvWyoGvubNXIIM51jc370wSZUTv0hLlBT60ZVjd33x5Q5vaDbqtUxyGoiFHGEQ/4tLJwMDQECZQSVT6Zr6Q+yXwLfz4fz2xkkCSzhOfcTFRW+BgcGR6noGd9HCCqZTnNxs+pwScFbzRUcudPXTC4x+vW0bJhwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7ALFKfM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7ALFKfM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TANmZ5030508
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F07tE0vJpnj
	OaneIx6xxhc1GKaxYebaabLke4Ul+Piw=; b=Q7ALFKfMm4jtxOyMHeY5EvUsq9l
	61NeJT5RolmYbyHuoiatb8eVQF2oSjXO4pFTJAJuyb4/9Oa8Xy26VyJMLyqOc0wc
	NoeaixiziPKm/tDFHfcGmG0Dl3lgsi+yTz49pgmSpKB3nSRWCDgSBJNLlbcBtjbt
	qGDsnIvnooFT2Dvh2GlBUjCepQE1jD//ALAcLEmnYZHkfOP75uioT9764trMl5Tx
	34cevQHLeC/j6WGXQrWAwVPmMa5IQNUfXYIqPlKkOcLh3fe6Quc0Bm7nqjPGv5yw
	3P06RIHL1OSeZTTTLE/hpHkLdAlw3TtaU22dTkb3IZRXNQHkvB3hMgo5zxg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2uyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:16:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b34abbcdcf3so2707494a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 13:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228200; x=1751833000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F07tE0vJpnjOaneIx6xxhc1GKaxYebaabLke4Ul+Piw=;
        b=a4ZJI6+zdnj3SqydBgUD5LABjuB7XLgzHjvIn2DcGfEMaMR1E6nY2aP98eJy8fbV/3
         FKBVxOJG73LDZ607z09dSUV14h9XuYzvAjKEZ1L/eoiI6ZN+//dlDaoN36Q3WNvguNq2
         nJctkNm6oM7PbprwCeDDNMoclnIUYOeBiBD1AY7c04c8hKYsJZVBKJ13qj39ZaZjaqWM
         OREWhwX36oytvgwNbuqM1B60I17P+gI6pUw8fHQMymRiBybLY3xn0bIkG70iYbT8FP89
         TvJ2znifC2xrvygVgxaDwE2Oh4qQ4FHY6AfrCubJkoL1G9pngpgHZdrgEueiXGMaY2Te
         zuZg==
X-Forwarded-Encrypted: i=1; AJvYcCWLMCWboAejI8PGQSIrI3ipZQ9qaEtmtYcZBS+h51mxMJKphVCWIvwaZe+9PvSumgMAmFieKCRUFaRmhJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ6THQ5eDoN+guaBAfoo7kqnbnnPfKXx7pP2CseXOPIBIbZwy9
	GzJ6Ym4j6t0aIiOLhRs+eie24TC28ftopmSRXDWfX9dENb+f7BYE0BoAD10Os489BRrkeYziu/X
	9WIbjXyL6Z3NmddudG7bTl0TpRqHsudzpRRNwZD8DuakL0jH4ccy40Pwgs/cruSOFf+s=
X-Gm-Gg: ASbGncu8CPnGYrne9MERVm11ococyOeu9D4NvqrzfjZKsbgpywgWPP0fTzU03hmPWYJ
	jPaBcAmHvvzmvTMzBbzvOX06a9XBvEzYb/n6Nz8uoH/wCJIjAcQqQmPewEvYaELzywq8YiLl1Dj
	9t/YsM6D0QJDqPPp+PeM3tMX93H3Dm3p+okr4KnKkMYzS5HTnFqvl/tpzdFnZZ0RQE6pHvWc6K4
	WWXHBdSc4c13tmnfjiF0ZZTY3XyD6tU+31Ormi7l1a3CtxQFfCbz6A4Bh+Mi3s7exThEA+dsRx8
	9NrrQTnLUf7nXzilP+eCEY1O7WHOo6PibQ==
X-Received: by 2002:a05:6a21:329c:b0:220:7994:1df1 with SMTP id adf61e73a8af0-220a16e46d5mr18754435637.31.1751228200540;
        Sun, 29 Jun 2025 13:16:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEELqQu+0TYmCQ+TNpM1MfGezE3TlblWt0dkgODaaYVhQOuwJeIcM6JHGprl9661zvuA9IyEQ==
X-Received: by 2002:a05:6a21:329c:b0:220:7994:1df1 with SMTP id adf61e73a8af0-220a16e46d5mr18754407637.31.1751228200109;
        Sun, 29 Jun 2025 13:16:40 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e300d808sm6372068a12.14.2025.06.29.13.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:39 -0700 (PDT)
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
Subject: [PATCH v9 16/42] drm/msm: Split out helper to get iommu prot flags
Date: Sun, 29 Jun 2025 13:12:59 -0700
Message-ID: <20250629201530.25775-17-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: gw0vn-GsLOt7Sn1TBP3rVNuWNZ0lWJXb
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=68619f29 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8Ft5guHMEotweHOT_P0A:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: gw0vn-GsLOt7Sn1TBP3rVNuWNZ0lWJXb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXyRf7jMO+N4uh
 n3w9r1i/KcvbRW4pogTUGPX8VG46HxoyBFBp7H1r7gV7Ovzp4myDucV1uyz5USx1x0ZRUameRom
 +9lYCYh+ZiM1Z+1H54SAiEyNViA/f3NTCsszumjfaUH0trjxbm2/p5+6dWcIXjp7CnzizeZGAm7
 0PoNCqQomLOPF8TDSLWEsUFh/uPICLS1Uq4cUM1+c3T7jtn8wYCOdxB25m5Rv3pmUaANiqqNB3j
 2sIZQhdN3ejUz6xlvilYhcpClEF7sfCJjROGZRpOFAnpQoO1x7rqN2NTUG42oEoUk7/FA9aIack
 wlov/k9DzGpLZhDQPia6wkWkfeg9kcR9Pq1FQUXXQWx5bybOz7YTTSDErUD6vDzfyr3v7r8plsu
 CSnwCa2edcCwLt8IbMeKQTGiKT99gD+y+gmoC8b2qggsp7jsBKYlXxkUPEUYWKRTknFmZY/u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

We'll re-use this in the vm_bind path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 12 ++++++++++--
 drivers/gpu/drm/msm/msm_gem.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 763bafcff4cc..20d5e4b4d057 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -462,10 +462,9 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	return vma;
 }
 
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+int msm_gem_prot(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = IOMMU_READ;
 
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
@@ -477,6 +476,15 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	if (msm_obj->flags & MSM_BO_CACHED_COHERENT)
 		prot |= IOMMU_CACHE;
 
+	return prot;
+}
+
+int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	struct page **pages;
+	int prot = msm_gem_prot(obj);
+
 	msm_gem_assert_locked(obj);
 
 	pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 892e4132fa72..a18872ab1393 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -158,6 +158,7 @@ struct msm_gem_object {
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
+int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
 void msm_gem_unpin_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_active(struct drm_gem_object *obj);
-- 
2.50.0

