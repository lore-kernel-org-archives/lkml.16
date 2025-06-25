Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7D42EF288
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877935; cv=none; b=HssL4YyHkpbnbru2atdPtX+FxZXelDCqqScgKyxyd/hpfhlnTJ2RnCEGxxZaGp0nF+vy6SeKQen2Kn/slEYC01/NQpQ6bihe+0fcfFHWP1q2Cd3eSgCAdvXG0OgNX0skSxleBEjG8svz95imGpFnaoE9FnnrV6gA5MvhNr2mbd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877935; c=relaxed/simple;
	bh=QW16C4VF1d8e7Sjyfc+eli2odXO+RUUedY3b/XyYGGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dimvmhG2W5eqQ1c0IdM9rIVBzKr+BDMnU9l/f3PG3OXJ1W1uRVbqF3IHq+am5KhShIg6mNwZwwkVX08YehygkgpHT9Uhfv20D6mMhXcIIqdatExObMyqM1DxPCwWesK9Bzxl9h1VeGXsjp3iC0wtbDW6G/cwcYpP6jWdu1mqOPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YE+joRQV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YE+joRQV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PD5OTQ014954
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZmGKliz2HfS
	kLFaMboPGj46o2FCBYdJ6NdGmIRY3dt8=; b=YE+joRQVeW83E173DEBd8DlfS6Q
	1GD/RlzoDgt9mkUKHzTtPhxxyyvWzbs0oRDmViGR3z86K8X6EbQdJVmvoMjS9LGH
	aCoGwGs4f7CoFbPCW8RKFxu0nImD+Acz1RB/QNxPSxhncmr+OH+n6tEm3Zf4RAM5
	107j05enx5cdOVRgumfK2cBxdTRVHF0WCnetEb0iBpys4sb4tPk063w2MOJRe5iS
	q3z3qbp3CUixevCYAQLdD73syXENgaIPdIrmX9ejOgWsMuMySJhm3otxc+CKtitr
	/Y4dhCGCp/6SA7JDF6HWb+Ju9gEAOe4c4bZOZOzV9h8m4VnbMe0QAUQILMQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq15ae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2358de17665so1743385ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877932; x=1751482732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmGKliz2HfSkLFaMboPGj46o2FCBYdJ6NdGmIRY3dt8=;
        b=BWgW8GUN+gqoqWFS2Q8+EXnWhoDvyGi0lqu1GqJqe1NwBTI7SNFk8y7F6VH2i44lUy
         foMvx/rC57CLLcYvO1kU7lHiifOsqqIpNUhj1PaOtcBZtfkk9WqK3L5gfkp+DnlDqrzH
         GBD5hyVrznCJLdbZPO+h2Cl+43m6c0RZ2vaTjROT72MpEDGt6WtmjG1P8tZxFAXFNr4c
         cEE6r3fxBuo/+eps8/aGc+OFAKdpXLkA2OOEtiufyr3QXkHaqZ5mAETO8S324UcgE9fa
         zZWGIMSfrlmrMO5SGLw196w2qS8dqnHQUbEzOFU4V/SZHykJeVmdM/IbbHVxoeSDVfAF
         QZfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcGlnn+NfqHLc9QgEC4tdUHYz0q7ZipuJhdn0BB9a8ZIlN2yFqK6ud6ai+nIgatnjvgHWCvptE8+icjt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyafLPUDi41So48tqjxJpHYUb5tkn+76ckIWzls+RapF/fP9D5b
	RSzCrqYJSAz1ifyMKkXdNn4UPELE3gZMFdK7En3tNCDUw2t+RDI0cg1HWwc7WzI83QQFipVsX1A
	rf9+biJB+v28QIJrxDk4HTu4pMIKQsf/8m+Piv8RZvBhCRFiLFGTziRmp9kMcjpSfvKw=
X-Gm-Gg: ASbGncsk/LnmiDiaU7aoW1itnA7+fd8AhBZK24h7g9oJiCzFgJuVpmtJAqv+dfUjbVI
	7gKkG79Ck8SdeOSKVPCjqb0LsuLQEnY49Sd9xmCElAU70zYapKBQwomqhbCBInajRflZ7jY4KGe
	2za5gt2tvJqx5rwJcDjm7uZG0Xgp6XBDk6IUzxGXR7uPC9dAmQZGgBUbpqroVbHYawjY1nxauwF
	pd4gyqpUssBWp4p7Y0FraIpHu4UDBQDGEiCIilsbmRfT5jYw7srpsVn2dkJaKUUwpob+lfUPrvw
	XQwJ1aIQSQJG1wQPJ7mTko6Y0E7WcROK
X-Received: by 2002:a17:902:db0a:b0:234:b41e:37a4 with SMTP id d9443c01a7336-23823f95145mr55316215ad.6.1750877931641;
        Wed, 25 Jun 2025 11:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd+biFg7tZ2NwXXiWCrI5tlm21WBzd0htJGfF806nU5iy7FUrbp/Yw9gOaS7aR3Qp5foqhCw==
X-Received: by 2002:a17:902:db0a:b0:234:b41e:37a4 with SMTP id d9443c01a7336-23823f95145mr55316015ad.6.1750877931211;
        Wed, 25 Jun 2025 11:58:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d867f8d0sm143513745ad.175.2025.06.25.11.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:50 -0700 (PDT)
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
Subject: [PATCH v7 19/42] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Wed, 25 Jun 2025 11:47:12 -0700
Message-ID: <20250625184918.124608-20-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685c46ec cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=jqtXezU9Yb2X64KsF0MA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXzWVXY8/T8Jy9
 s7DwLn43rGIZrDMgXWSVOL++WRQEUyLFombB6Jhs1VdBNdhX87/h0jzPK48k4gwNvWRg3k3M7oe
 Szy7zWchKQPGk2E2N788ri4jl5Dr3G0oiItz36T3gZnN2W4oSMQiJxcb5kuGrNaShlm4aBbYHQ1
 3LbI2092dVFy0btGKAGtbO2nBY5jOtBs9vHZDaLTOK3vZbIooIMwWPu3YQLrTzI7+8msngo3+vX
 hBOFcL+Juoq7JW0dXjD9dRay2ezKlCSFO/r65MVfwvP494PMSErXSI5nHSD4bCcDAj2/cIEaSQC
 Ekp1d2ygNk0l3cGTMV4AWUxXa/52Vdg3xwPhs0QL09pLK2VXCjBW3gv84pFVX5VfEj7xYDrpLZH
 0q0GNiybd1rHUV1jMv7oA9Tq73Oqi40j3vz/kjbHh4zSeWgMXhJ9CXrsw09STDIaXvWe0513
X-Proofpoint-ORIG-GUID: jetktUqSFyyTrzx_YVzuxjSNRhSeudMn
X-Proofpoint-GUID: jetktUqSFyyTrzx_YVzuxjSNRhSeudMn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

This is a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 6 +++---
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 194a15802a5f..89fead77c0d8 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -61,7 +61,7 @@ static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
 			if (vma->vm != vm)
 				continue;
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			msm_gem_vma_close(vma);
 			break;
 		}
@@ -437,7 +437,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -615,7 +615,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_purge(vma);
+	msm_gem_vma_unmap(vma);
 	msm_gem_vma_close(vma);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 2dd9a7f585f4..ec1a7a837e52 100644
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
2.49.0

