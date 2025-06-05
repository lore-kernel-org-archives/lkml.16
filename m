Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5524280336
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148376; cv=none; b=HNTA3AfuN7AtEKUdeW39tIpP1YyI1K3EW7XK/cj1j5zfwvBK/NyO642TFw36IZ9OVGBzl9JPO33S2OZqL2cfwQIDXzP/LmCPQl72Mz80XFGtpx3TBeDcDyTswkH+ncPXPSjBNG+BRgSLMmWsjOu7/yRCE6O6BH5WvyZ1QC7KbFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148376; c=relaxed/simple;
	bh=QW16C4VF1d8e7Sjyfc+eli2odXO+RUUedY3b/XyYGGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ns+9Y6AwS7ge5AwTADq1zDrsKMm2iaJE+A5gIgCH6cEMC8XM2Et27/T9Vl/EV9jpW3M279KsegUWBG5AU8aQruWOxv4C9SWgOqz2PNXWaj/fBJXw8pJjeqBT8uA7syqEEDX8FaUqJ1/yYByyuSsqgwuOYRBHAzkTR6/J+hfugnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jiM/bpZ7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jiM/bpZ7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HHDSs023754
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 18:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZmGKliz2HfS
	kLFaMboPGj46o2FCBYdJ6NdGmIRY3dt8=; b=jiM/bpZ7zNpc+vJjH40exJvMVGF
	sZ8pOG32e1uWNY98RpOn2vTEfPgg2z8nRX/v6Hr+jtG7ULbmtdlrrB9JftRTwf9K
	ozMd5b3w3V6jH0IjilHt8mRfgnarcyjCxQKHYf6pVqotbvjYLNkUKnkFa4Z2v/o6
	p4+JqDHJhtEr6mzhhmxuA0YOFELOqo0XX3FBGbjBQZ8wIglcAl551aLY5lPAf8rp
	Ww297rmTeMr85hLtEENlbsY1Q62Gfyf6LtIhIvYj1JBwNMrbJyQvRl2+PJDu2Nlh
	MoVNMRI1663AVLQzl2BDICWj2hdq3QWfjgoxWWsxG7UT704SnPYQ/I1v2IQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8s2c5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 18:32:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b270145b864so823228a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148373; x=1749753173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmGKliz2HfSkLFaMboPGj46o2FCBYdJ6NdGmIRY3dt8=;
        b=NOCv06/yraCWIml5Hk+MQb5phpwChwwpIwbYp/ChdPDuC68vcsgAv6+Lr9tr4Lmokh
         YYHUsbr9yO7wbF76G/Q2HodMO3uuD7ATgJhGEpUNQVw7yVOAdmUUcsk8dvUEFco3iR4V
         cQqMK6yxbQbQImaYhC/k7Y4lZks/MqxKJmEvxuqGJfzYYYZOCo8TKPM7b9Ye0+NUH1DH
         bf4QH340jj6fPTY6RjdZVDwQ+qgvKljCQhCdm4p9xZDovxh9PqtW6+ac5SnqEBVtUyQd
         qs3Cj5EjZwXwQseqlXWwul9cJz6LyOCP0jSynEhGuE3hEB8mXqeDJNfYG2Y2e9etLBjV
         VRPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQFgLp4+9NxG3PqXFBuXhxlB4HKOoU6FxsWmQRfS5j/iJyvpH7Hsig4KGo5ea1wBAB5Tn/zGbPhL1u8As=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygxad1uWojMXrxNH5TMj+I+oiBBEeBiSVWRpQCQ7XexQFn7iPg
	Qr88xVvr373modaouHJiPDOz9XKcG+7Ul68XHBpfLMTic+b9sH5o5pblxp0K74UiNdNuF9AEsf7
	gcfZITVZkA2PgptaGrT9woFDuFfyF3Dw0TTSlvzxRWQJ+wocnAPC0HjLHPpQn042UY0g=
X-Gm-Gg: ASbGncuGa2uX29HxvOgN32AIcIMft4QVCq9yb3TCw/xNx/7DSpu3Ehs5CjBREKBBZPZ
	QilDqyVx/3Zos7QJyrgv9PUQg78NCl0JzOCS5R9VsVVxLUIpN6QqbfFgrZu4oekpBLd9BrKQ+i5
	2HEFJde35+nOpHFMS4AxXSPM9w2iK3rTlU22O46b704mbyWg/wKVlZvVv6YOBni5v+Bccolkd2S
	+zf3gMNe2MauxVwhfRu2jktEOL4EB2tMfLNxAyRlXqP3Ku+aHdxmShTcGd1Aej2s6iy2I3d1YdE
	cYVApy/EMlyVnbhXbUkUNw==
X-Received: by 2002:a17:90b:554d:b0:311:c5d9:2c79 with SMTP id 98e67ed59e1d1-31346c50561mr888512a91.21.1749148372988;
        Thu, 05 Jun 2025 11:32:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyetsmd5uwbFaFtMcmZkbXRpee07zjRboGQZE4XMHIFA39QakUNWJDzUUaxfsPJ5Rk9vOEJw==
X-Received: by 2002:a17:90b:554d:b0:311:c5d9:2c79 with SMTP id 98e67ed59e1d1-31346c50561mr888471a91.21.1749148372577;
        Thu, 05 Jun 2025 11:32:52 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fc5460sm61213a91.23.2025.06.05.11.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:52 -0700 (PDT)
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
Subject: [PATCH v6 17/40] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Thu,  5 Jun 2025 11:29:02 -0700
Message-ID: <20250605183111.163594-18-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: EZxqerxrTZH-4gOgC7jmZYnUHUK4Dfus
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfXxWmADXtrjv+s
 rqr+yiA2dW0kGXKJ9howznBWpShNbV7yDH43CqWnGr7t/9IKREgPBA9iybYhqRbWSAgCgwS5GWA
 IeW5LfpDUyY3XNn1dGWdC9cT2ipWQ2o6wBZzpQhL8G6OheEtQFGid9sOJd12Lx3LzgLZr7JJhM5
 WM89NxPf8+QjijGvEXJm6N5zVpCBfB3NrxJAS/YbZqTxH1vlueG2bEvWS/9RMutGrw6X8/ZgbWP
 Kfzwil7Th9/2wOW+eqFsVEfYlroreY4j8iq0Lr796Mau0VSgKF72j/unkk1UrbOg/Y8x9KOZnc8
 s8/Szi7klgMKjGAFBeuEHm72IYiCmvItr/AN3OtNbHNr83a5F4SQgkvELjPz/sJFzOpbyYe4IRJ
 HnvthEph41KlZEBgcmgdokkMi5MGFclxB0MIl3VC1si5N7id0v1jJM7YmPx1L0sR6krrGcTU
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=6841e2d5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=jqtXezU9Yb2X64KsF0MA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: EZxqerxrTZH-4gOgC7jmZYnUHUK4Dfus
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165

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

