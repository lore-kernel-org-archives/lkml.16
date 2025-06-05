Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFBB27C167
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148373; cv=none; b=iHkbSFybmQokjaAawV1cJ8Q/lbo1RDvrPE3o+wDjEylf+PaFR/BIgh2PYWocqR7p1l0VIsd4F/NcfRuFXZYX6SwfnwsLzkjt29zsZqdWTVBCOuD0MaQZBSJkD4C8CRCzW19ieX7pUoac43QU3wBjcIVshCmvjmJCULME7dycF+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148373; c=relaxed/simple;
	bh=2jcccFJXFCYh6q0iCZXWcRWf5w1lUItpk77t2RSn1c0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oq+T+MqpfCyjhJfzS6eI2ov7qQSLGWUsSrHrSQNDQ/oMqB9k9c0KhM1ExVL/NsrVpS9tIl3RKCCLGzHT30EmoWkFTdUL0ynQjPy77QEv2Pjt23zjPVahENtuwGFyqqYKu2DySOovnCa+H+Ibqn/rGqcDzz0p4vld4W8BzS6OPyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oLDwzUCy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oLDwzUCy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5559qreV023348
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BEMRIRtPgB7
	xj7eLCSE0ieGk3YZPnc78Gz5XX/Mz3mY=; b=oLDwzUCyVCYeLYOHG2XBA209dTT
	ReThbQhzhxZSY4hH7BkyN+uKBchW68D7jC2DHKFOGc9VT+CWaWW6x2XIMHHPM1sj
	C3PgRM44WTpZoRW/bWD/+AyyiofyH+Cf2A7FE7pvAkynok4XyfWUdXr0QswTRCBb
	1xW01ojnVMoCvmzEOJsq2tuMFCCsssT09JwbgQ4/I1AjvrSbYf62U8wpJrGhlj53
	m9Qjb3aniJJsciAM02OlBWI9MxF1uMXlGtFlzGKJoIt54YIYoxoYAh70LhS6DyjO
	UiR3jDbHmkbc92Q9vx5ks2zFoobl9kKLjh3f5Rrdwnw9mwXATV/LLTf/QAQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn04kb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:32:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234906c5e29so14797935ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148369; x=1749753169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEMRIRtPgB7xj7eLCSE0ieGk3YZPnc78Gz5XX/Mz3mY=;
        b=nehJi/nRTfD11pSfhDd91xVXD6cOkKk7H1o0tji4M3XrD3OP7r3gh0z+Qi3UoZs/Sr
         VByAb2cj5OyXuNRnW2VKJQb6ZnX7Z0LV00N7BpLNqkodaoDQA1Tln+eKKkYk/p6YwrYD
         4OPfvLGOGrpgK3BPGWd4jlpa56Ale2lzfV3XyJqqvTfj3mggvImWZ2MMmIcBdH3RKgfk
         Zo0PPh4sjT9gXhKUQAhu64reb3vF8H9tuOOMPBTX8qqM3bIyhhkkThFJlVKXn+CeRkpy
         6k3aomT5QUI02VIlfpjb27HcnKDSZrXtAfPwBHS9bYxIgytIyRqoAhBXVHXv1gwbZ6/v
         a6OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVuT2R6b6Ho9a1GStsiTsKleqziwdsErb2bfyyEYwX7JTzJnjuzCmdod/rmiQsk6APJjgkyZfDslePwkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEXAfYeqJ9N5EAMiIRl1+ue503+2NX2Dq0Ja1tIzmtykpvpwkk
	qmh9ws8ZYC74rRipxsZk/3g7q94t/40aNF2wqM0Z5hw9Z8I2cTX5wIYrs26VWkVtjjNHvh0eMlz
	hW90odJTAi6uI3pgi/5GcNDYh+daj7JyON/HG1hc5VexqfUz/l9DWJamyMpQNJH3mMxQ=
X-Gm-Gg: ASbGnctrgo7+XREPc8j2NB4rJhh3lPkAtkJ099aolTOEnIyAe6ILmqkicuXP0hKu/6/
	Ni+HNAqeHJ1X7NGxM36V9vRyJAQHwMWirIaakt17JwWQ2+yJnfE3aLABCCP9DRx3/K3deB+R0Yw
	b7qhQ2KRiKgEcBj88C3+ptZup/eNycorhudpc7rmU7nCJArWy6y7VGhzs3RxmlxOK/DzpeogODi
	NevHchBnkfM5noQFNO4GG8mPqM+jy/ppaujUL9+Xw8qiJI91FH+gr4U+favHGCY2PIp6RcY14L+
	x4ooAEmPB6b7HrP85HKkmw==
X-Received: by 2002:a17:903:2392:b0:235:1ae7:a99c with SMTP id d9443c01a7336-23601d712a6mr6064945ad.32.1749148369018;
        Thu, 05 Jun 2025 11:32:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYILqDVPmHZvxHv/qNui1W3IQVf5p494cYJFRBE2nev6jIvXhPxt31NUKQzkFHvGjIuiZeCw==
X-Received: by 2002:a17:903:2392:b0:235:1ae7:a99c with SMTP id d9443c01a7336-23601d712a6mr6064655ad.32.1749148368674;
        Thu, 05 Jun 2025 11:32:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d21802sm122518805ad.215.2025.06.05.11.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:48 -0700 (PDT)
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
Subject: [PATCH v6 14/40] drm/msm: Split out helper to get iommu prot flags
Date: Thu,  5 Jun 2025 11:28:59 -0700
Message-ID: <20250605183111.163594-15-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: xOQGEXA6-snJynzFc-Sn3QRbKJPj8b8u
X-Proofpoint-GUID: xOQGEXA6-snJynzFc-Sn3QRbKJPj8b8u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX6PruP0SW+75C
 eWcbkhu6QF/LDFCmYxQqbCnyHNOqnaLQ3KFi0QZbQWB+ciarGei8TC7vuubefzO6pgmtM42GJfM
 ACk5sANuthIubHznOnQp+EqdnCFZYHGqxRL8KsLu+GhjtOFysfTM/yMaVy4426MYnbJ97a5JSe7
 DO4KM5ZVBYbathKLxZoW9gUQA0r85h0w4rJoWCxGjH90PlwGpStBrhcHZfbeEDmbS3MBpxIA0eQ
 WhuRbIncMNkIQ8Xnlc7oQ/Fds2TfSoimALLCPonDjikwmICw6jOMHpyAaGcbYA69+0nnEvDYW1J
 DKrbMWSN5PyR2qDKlfPE13mfABZeUZHP1e1z5C+CanC0Cr6wOku3szOwN/pV/Kyx9bo7eZEyduS
 OmxNLo4Zx6tr9JkgqQGAh6Icu+aHZ4lhqFEL4wN0fxYD4ma4UWQ/CnlADooLjOTa6oM5LXW7
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=6841e2d2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165

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

