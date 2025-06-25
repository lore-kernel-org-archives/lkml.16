Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B25D2DFA51
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877931; cv=none; b=lE+9OSUIytcxuDFzRxsDiMWS9lC26coZoqpqNjt6QpQZJ+d9CdeOlMoJC2ScFNcSYQacCFOQ8tljHU0xC/edF3OLfUqkpaEjauW28yzQ2b6Kr3Uq3mqvYhT9s5+dLrkqxDqrjx1d/+7nmhddYwEVlS+P68gEX2gOoiAS7Ob9x80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877931; c=relaxed/simple;
	bh=2jcccFJXFCYh6q0iCZXWcRWf5w1lUItpk77t2RSn1c0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m3oQ83Qsp+LAQqzXZBcMiOoJVJcPQseLgTgZT8iUKRC/qYuhKL8sHT8s0trT8OfTM36xgdBuYdmBGD423He/9sB6vCrop4I0aq9rfUkNaajwdRIBTK3WjL/eWUHVXf3pnAuIw4E9MBZQl9dtDsjHdYZRzNNOBM40KDBlkMK6ntc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQ2KRNFV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQ2KRNFV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAxe09000866
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BEMRIRtPgB7
	xj7eLCSE0ieGk3YZPnc78Gz5XX/Mz3mY=; b=HQ2KRNFVzgHdRLB15LaR2n7rCIq
	DnEXyjQAhx7gJdmYIYh2GKjQ72x1vtNs1ah96RWUMn+XgPLDT16NMrBy88B8Dz19
	ScTYonCVUsUfs82L6rHD7zNJTcVlICjfAeaN+pcXrDvVvzQux9XOHol9Vvaw/JSX
	VJYvdAhlwBtE3oHVYb1GffkqyDr817jEyY92gnPcQaGcEV7E1kVvh+pwxCWxeFWp
	wXQIiPl3tmipsXWYY+kLceU9u64Edc9V5Lwwxdch5BlJqfQ72s6MRGBqTnna8T7q
	JZzhttO741kiNWreYCw+WKokD24+5RumYjxNM4/QLsFbdzmv63xfkro361w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmtk0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235e1d70d67so1930045ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877927; x=1751482727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEMRIRtPgB7xj7eLCSE0ieGk3YZPnc78Gz5XX/Mz3mY=;
        b=QO8RZY1d0Pm1pudAg7k6veVqM+Xqa6lztx3pvHRklh6x8bkDfFfvjXy2qRCbJ03A3K
         G3cxmkKjKx5LuObRpTW8gXyM7fAjCbrnCgFx9y7mRXt3eR+XuuTinntzDkC9B72OfaNQ
         4kz1C3iV/70DvXMHHa3QXUHbMFD6KFvug4Z4xXZaO+z/Ht3r9nmndbVUd9FnFzIZnF1P
         A8GM/2bcGWwQNShsQo+OTUwk7UcIIoZvRhww6/Ya/ogUr7hF9LjqKuKvsQ2lebWs/bdQ
         EfyTAYdMnskJ6+sezpf1UvjLg25G7o0Z90GemUTVVBm8saf/ibkSlJHYxuayDAizLfRJ
         93sg==
X-Forwarded-Encrypted: i=1; AJvYcCUiWGCRxAITbII/m6Ggh4T3pa9mzKz5VscBTFRQKShwCw/Y8ts9v8W/weAnGJ+nRVYV84HSHdZbYQirr2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWH3944b/ruEWbGpuWRFM+D267z7je8sl6e4ZVHT3wkPA2caDf
	cZQYqTA4fntCpBryxWgzBJ/mLVVUvuqwBEQxQRmaDl169IQm4Ixc7jHv+GQzX42AAphfnvqVDkB
	drxCXgW0PgRfHreIKnxt2jEIVn2HV9cpFEywoM5NyorUpNQ1V9Z9pwItKtQuKlsE3jGvYpL/w71
	U=
X-Gm-Gg: ASbGncsMa9bF82rPjtCsilZX8i28pWDfYNEBpJtpgx91ff8ln31KjdpWO4h6wsfRHtN
	Ug16Jy7R8A86EFzUBA9ZC8RzXrUgYKwOEuCUWVHBApc0Df59Y0kM302xZ7gvLTrRepF/hJwLb93
	q3gLpYMsUWDue7yNbniwd5UxQ0Eupz8PXv2+6dazPpqOuI+t80aLIUqqrvhOhVn56+ve9xk8Bln
	DHlJIvwDW7vio2qQzoAtb/evXqifm/56eskqeay1W2Jb4d5UT91P7POaVO6jHYg3hE40ELgGeEB
	qdLOtYxoCbeEZ8eZ9UMpcTe7j9aL0PJF
X-Received: by 2002:a17:903:228a:b0:235:f70:fd44 with SMTP id d9443c01a7336-23823fe14f8mr72556785ad.21.1750877927353;
        Wed, 25 Jun 2025 11:58:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFuXPf9rljBk9fO9uMHuDT5eLJ/AwD6fL7woWfRkVupOMVq+NgBkPNYRPET7WG+oVc3xFc5Q==
X-Received: by 2002:a17:903:228a:b0:235:f70:fd44 with SMTP id d9443c01a7336-23823fe14f8mr72556455ad.21.1750877926896;
        Wed, 25 Jun 2025 11:58:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d868f878sm144060625ad.184.2025.06.25.11.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:46 -0700 (PDT)
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
Subject: [PATCH v7 16/42] drm/msm: Split out helper to get iommu prot flags
Date: Wed, 25 Jun 2025 11:47:09 -0700
Message-ID: <20250625184918.124608-17-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: hmWZdtmQacPt_MYYOnnMEp--nwG54W-m
X-Proofpoint-ORIG-GUID: hmWZdtmQacPt_MYYOnnMEp--nwG54W-m
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685c46e8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXxEkqy6LkCOEr
 lUkB74xLMbAi4d+tuG38brHWra+I3XrGOuciXhvzllctipdOPhbyJsHyHG18VIUcUdMdfVomdfk
 c83rdgNa3kNyuaFCfprQuIfm95SvhBND3rrJP8/e3R/eJPfOSwLx//ZWsamb/tOh+jgV9nnIm0C
 /1yo3PPaGmAU8SD6Sx2/Dm+XIkRdDFuLvTRu9F6eUcpqXHTAGHiXn904/F7iwIoldZyHAaJQYkT
 IYay2samF0DzrPooiCXvdhRZxyisz6S4n2+ENOoKoF9JWCAxvuTA4aguUU5WU1cTkMbcyCE9NVe
 JCWucu7Forhn3HTNyAlay9YbV3bPqzOwPTME4AWtuwjvJvmeIg5ijeQkTM9zh8tbhH14KfGCaaU
 5E+yEz992mjovefFtsgZmH9VQbs/KQd+lLDUI/CAPSyiu/hMbf8GFF1eIqoj6Ju27g8jR1cJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

We'll re-use this in the vm_bind path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 12 ++++++++++--
 drivers/gpu/drm/msm/msm_gem.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 87949d0e87bf..09c40a7e04ac 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -466,10 +466,9 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	return vma;
 }
 
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+int msm_gem_prot(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = IOMMU_READ;
 
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
@@ -485,6 +484,15 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	else if (prot == 2)
 		prot |= IOMMU_USE_LLC_NWA;
 
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
index 557b6804181f..278ec34c31fc 100644
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
2.49.0

