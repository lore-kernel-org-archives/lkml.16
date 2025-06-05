Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426D127E7C0
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148354; cv=none; b=Y8sp2Q4ypzah+Wjt4I3HNW2A6AVp6hSojYuOlonw/asPNU+8th8XOt0zv5knb0EdkhyMssuyge/bFjZUgJoPwIUWdwiX061R7gFULee0FKFxFzNw7oFAlfiVIXwdPi1dE6Y0juJDiugY0QZq3ScdCEyfTs7Fjb13XOQ1/576Nik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148354; c=relaxed/simple;
	bh=Xoz678jgKXUU5eflKb2/hYyyho0cK1Uk/BBv29BM5m0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kl/TkuNFd0LHzM469+IXIpyBkiCQjoc/7SQ09IQsV4b3gra7ko9ibrC4zG/Mo6n1eCsWddBdKclAdxKCcZSrNMq2MYPpqPrND9rqd8bCc5uNJJyYNtOgLj6ccNnArRhgOHZy/JA55IwnHcEPyRdhQDrTVVdTdK0NmjPFT0JuxDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAU+I33u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAU+I33u"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555Hsu1o013521
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pRucYDqGv/m
	aZtfEL5JUnKr0yOuvQGJ3l3EY7Z9RO/I=; b=RAU+I33usmA4f5r8pB/+83MjQkd
	nKgsaG2tXLsDYbppqPQXrhFQ9cEOS3ywU/JfEcPn+zjix7z2kjfQelMFU2j74uQs
	WEA/QJWQLT8jZHTTf3FivbTD81qu0lJCsAxVd0myzt53FUz2AGloc6iT/38hTF5b
	zqGtx//1a3B1gKH6HLqgqGVQBancscjVIpqlRmFjuch/EFy0CJ3QZ7AeILzljkv2
	tPjht7o4fWU/Mx5i8oRTR+WHjRUqfQ7ywMMaNclDNB93Q4lXNA6Ji99IQEHSYSI7
	IHXDSCx38TBNVsdCHjhUzCoQ+dGwAewCnnwFGaUZ6ruPo93RoRS3lrqmExQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nt9s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:32:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235dd77d11fso12141235ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148349; x=1749753149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRucYDqGv/maZtfEL5JUnKr0yOuvQGJ3l3EY7Z9RO/I=;
        b=efiDgiQG1WBJp6GDkH1cmDxmLhkx03xlLYCIviIgUFBBOfjkFZpym9+2ear36yg+V5
         3dT2mrfpg+409h2eAuCeDeH3lS3rkg8MboUtF4xRU0UAvdSEV5sX0bd3nPq9EwFpyODl
         Va8MfRXLEZWGUUxGFTJCIpEYmjvNV38cckhREPxcG+3WwvXqjSb81CbpaB5iUzA7tNy9
         gzVUMcL5M9QznC4idzT4vcYsapCaWYhdTC8OrnuPmrnkcX54PQ2IFhRhvWyP+SGnknSa
         t4HGGULaJvMNwBAEL27q4ITj7lgpjW6pwVM4PE8dJ/tGt6e3b8YmRS8cGOSxQabcYytP
         9yMg==
X-Forwarded-Encrypted: i=1; AJvYcCWwV5gHa+qjo0t44V/d/JvPj58JEMmCEfu11UpgXeAIX2ymzSrqNO3dHqblpUO2HGFdHPwir5LIUdx4qyw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4dKQwKnTVcObuWxXiTfWZB0qky+0TM8lfoVhFo2GFlQsIW0sB
	nwnQhBdZsW+3vC0KXNKzoqOjsr7M4k+LcZMn7TF+B5FYBWTlNmQZ/+lWUob93zZM3p3JSD2mqrR
	oWBwxZNmPvqNmHcuXWEM0GZ/PoA9HG5GnhyEbizrledcBmN/97dwc5a6IWVcR8nWRzIQ=
X-Gm-Gg: ASbGncsUvcYPMhvIK3xSOjlfe18oOVl5aX/oxZbvcZLgOs6v1S7dZ4Ewa5jnYhci0ja
	2sBXi3V6lkJDUS8Ga2aQK9/PTV3coVgDaOrFYqpjUvQSTcuA/UH4XrlWHdx9tRliftnm62Dm3l1
	DcDWO9JCH+DewqQmFEiSSJKdzb0SMsLGCXqzfOZPMYGYxbZdNqm1s3LfDgcT/vw9t9MQ+cTHxDr
	/9PSjbAWVmWcmLlIDTBmmdmgE7UjIdNxiZx1c32k7LpA1aavWesYDQKxhHkgUs09RjsEEHU12Z+
	KijWteJfTfl8OkGTECOTadBfhY55ILLs
X-Received: by 2002:a17:902:f70c:b0:234:9fed:ccb2 with SMTP id d9443c01a7336-23601d22bcfmr6076375ad.29.1749148349355;
        Thu, 05 Jun 2025 11:32:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZPYl3bi4wrAR9P4qs263RGT6xV2qooQoNsSl5TQxnW+d38CFd1PSGOkF9JdpsRdaUXFkAvA==
X-Received: by 2002:a17:902:f70c:b0:234:9fed:ccb2 with SMTP id d9443c01a7336-23601d22bcfmr6075895ad.29.1749148348947;
        Thu, 05 Jun 2025 11:32:28 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf47c0sm122361975ad.175.2025.06.05.11.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:28 -0700 (PDT)
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
Subject: [PATCH v6 07/40] drm/msm: Collapse vma close and delete
Date: Thu,  5 Jun 2025 11:28:52 -0700
Message-ID: <20250605183111.163594-8-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: IY7fxk_QdcHR_g3LzF-XQP16bjKf-cuA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX1BfyoNCY8u3e
 KmLShb/Eb8Ef8FKeYS89Z/+e1l1pb1oq5RUKr/rMhJ/6Iu8ot04NLMpjS+jFmHNee1Yzkm7VEsN
 vrjIij3UbfceGJ7ETnzz8HVPQ0B7E6q576Ll6wScJpWULpZtEe5uT5Q16JVX4OXSeFprYDzndx2
 QCxT6psPe7kOIx57e5FZUvrrPECQkFA0xqQdO4S+H8zcs1yGQLoaY6CRw5PviRx3B3ZO1itEYz8
 1X/813xo0koJJEsENbRP3Yv0RM4sbweFzxkasoqCPJH+g/6XzshgWNaoPfkQKBIN2OhLjJcqqMb
 z3plmxT9hHZDKjcsZl2jJNor25OTvaKIiBYDSPdqN3ibrL3PwYSTVIN420QD6cdLYSJU4tPTKT4
 5MOjowwuOlAWsepvTdn0T0C8feS05an/wSGUB9enTk4YqV/3YJyS8wEo8SsAU4gQSC0nHHVG
X-Proofpoint-ORIG-GUID: IY7fxk_QdcHR_g3LzF-XQP16bjKf-cuA
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=6841e2be cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=RIvuzEnNBJp2qadMtJ0A:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

This fits better drm_gpuvm/drm_gpuva.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 16 +++-------------
 drivers/gpu/drm/msm/msm_gem_vma.c |  2 ++
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 29247911f048..4c10eca404e0 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -353,15 +353,6 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 	return NULL;
 }
 
-static void del_vma(struct msm_gem_vma *vma)
-{
-	if (!vma)
-		return;
-
-	list_del(&vma->list);
-	kfree(vma);
-}
-
 /*
  * If close is true, this also closes the VMA (releasing the allocated
  * iova range) in addition to removing the iommu mapping.  In the eviction
@@ -372,11 +363,11 @@ static void
 put_iova_spaces(struct drm_gem_object *obj, bool close)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
+	struct msm_gem_vma *vma, *tmp;
 
 	msm_gem_assert_locked(obj);
 
-	list_for_each_entry(vma, &msm_obj->vmas, list) {
+	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
 		if (vma->vm) {
 			msm_gem_vma_purge(vma);
 			if (close)
@@ -395,7 +386,7 @@ put_iova_vmas(struct drm_gem_object *obj)
 	msm_gem_assert_locked(obj);
 
 	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		del_vma(vma);
+		msm_gem_vma_close(vma);
 	}
 }
 
@@ -564,7 +555,6 @@ static int clear_iova(struct drm_gem_object *obj,
 
 	msm_gem_vma_purge(vma);
 	msm_gem_vma_close(vma);
-	del_vma(vma);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 6d18364f321c..ca29e81d79d2 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -102,8 +102,10 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	spin_unlock(&vm->lock);
 
 	vma->iova = 0;
+	list_del(&vma->list);
 
 	msm_gem_vm_put(vm);
+	kfree(vma);
 }
 
 /* Create a new vma and allocate an iova for it */
-- 
2.49.0

