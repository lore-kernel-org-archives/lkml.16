Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F98D238159
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206072; cv=none; b=g7GxUSjS2MidT0ZY5Wd1TrTrKltBLfC7IlLOnS5p6Z51HAYHpBTGXlZfh7jfT60ifpu37Uau1dp0ZB33ttjJhvV2T1eWlGHLXbB6R4r1rEIhPtXtHUwUCw7JYK/u59ABqueDv3EBa1vh8d3kKMxrOfKzqgSJ0cC7Iz89Ic1mCGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206072; c=relaxed/simple;
	bh=ESQLfaCKTG4R0R91DqiQm8NfAu6rY6ldXlZSVumZFv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rehrqWGVz4Yrw2S+3I/OTwfwSC7/Uu1bPbFaGwVJdIKMBmoBpqRkzBccb0C80Yp4AXZZgrm0nbX1ybfAZMlIp/fboSMGeLkDWL4/qACeLxebKyMo3HPC9nV51+fp1lAgX0OopdkEf5rYvb4dPI5SKFoEniKkvEp5n9N13QPw2XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJcrPvyl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJcrPvyl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T6gZ3X005200
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Aea4FNs+8GG
	CBuby38XbOoX3esCsoQzCfRoTW94GwEs=; b=jJcrPvyl7D1DSgJKQPuG2ZaNEJq
	TmxzF5N9gnvIjsoh4qX8XjmqJreN6TPHLp3w4XVWyIzdfC2siG4gibqJaH13qU09
	2uBU8gzgtrGERKfPnFx6Bcg4YyYX7Zk9LchhAfe1O2t+w/HmVy8D6GH+FinaHmqs
	+mOgTgj+jwa9m8u3lO8aeIbwVtXdP78OqLtfTQi9IaKHUk3gk9E0umTRvpD5WjS+
	Hs2exDFHz3iF9jGIJAPoApKed8WuCFF7dmw7xmBPbQ2VhN3gTv8qKKSDk7RCBO4a
	HBzPFEu/Sxn3X9lIoSrRVmYI+zO9Gxr9XWSMvgTJd+tzGuchbhJlsYFG+GQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8m627db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b31e1ef8890so912788a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206069; x=1751810869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aea4FNs+8GGCBuby38XbOoX3esCsoQzCfRoTW94GwEs=;
        b=dkLELWG43iuwjTSXXGI0Z/ZjQU4gOjKO53IkLSXCmSfa/wcuyRKYIEOdT11veAtRyW
         TdaGjrrScZ0dOD5PV5lkMSTM4EyMts79rH6F69aQqxRZshba7DDf9yYpif6mZQPbvfCn
         paopAShsKYjc/6vOHnTg/Kd2DuCf/eBD3uCuhQ0AlydyjRBXLoW2EE0KSdT6agqaU/SD
         UjoVnxDdY7VC5vEbL1c3xpqu4IHepdGla1yVj+K9/EPHbNvP8JYLl5IIIhLlv9YsYaC5
         6e+aa5G/w4gJ2tZ4EdWt/Vcysi4C2D6+TATE2RMMLRw85clF83dRUBn4thOUZ5m5acuH
         TOsA==
X-Forwarded-Encrypted: i=1; AJvYcCWjx6KSdgp03RlkRlrJL1K/L6jIHEjifDmZKAhVtdcx0hw3ioAn8dB8BwLMIjZ8KRoxhcEfIi7nd1CULbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEgFDvjb+X/atkkYyKytV/D4rgC2aoA9CyKuemLL2wn9oXRnYE
	6nSyhpshBN5YAg+YT/+Ltj0g27jVlJK+Ls+XsOiC60QkjdHuCq/UyJwdVJpQrlvapHzjdvBgOd+
	pFjHbFOZ9+MiTqhB3ORVb6Ee1xn5YpLqrETXon3ghThqAcAKxEqyih1FS5boVvh3+RUo=
X-Gm-Gg: ASbGncvv2c9pHO98656IT08kiqRkkdgAYE1efVpBQecH1ouPRDZsh3+eyhoFJAIvuUO
	4435GucMXsF1Gjoe2yvVrn9mz3wLymKBzdjWNveOXqJYhQgzGkb0PWcHUnHSpSy3vWjszI0Srpj
	s5z11qLQ9P8LWLVysfV4HTEfHtno6OWoayl81SDy5K+tafIFTxAgzpW0FOap5zkNjtEfwK8vtTi
	PLVIWLpWdbprvQyy4IRWYjVv/baCW/sAXHf38Ye4u1X4V8wCTCK77aCjZr6+GzDb34kQDl/rYYh
	IBXl9Wx5WEWsConHiRXpZJt4IyP4F3Pl
X-Received: by 2002:a05:6a20:7d8b:b0:218:17c4:248c with SMTP id adf61e73a8af0-220a1696400mr15129154637.22.1751206069235;
        Sun, 29 Jun 2025 07:07:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4h3RVVYdGoqKUxRhDHt+2Zko+cPdjWJ8H6//OEKtNu88w3yP8af8LGtq0ohnKwkPkhBc2gA==
X-Received: by 2002:a05:6a20:7d8b:b0:218:17c4:248c with SMTP id adf61e73a8af0-220a1696400mr15129113637.22.1751206068805;
        Sun, 29 Jun 2025 07:07:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541ca0asm6760251b3a.57.2025.06.29.07.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:48 -0700 (PDT)
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
Subject: [PATCH v8 19/42] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Sun, 29 Jun 2025 07:03:22 -0700
Message-ID: <20250629140537.30850-20-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX2lb5hMKMKFj7
 8IWc3Z6gzSfirbuF4+edmuyGIJBLo+D7bpWqQ2YnNAWDpROu7tyxCJVE/q70fiVvVPrsJF8NUy5
 f1B8hG8+odmGgk+a7AlcuTQv8tLgl4XM4M3lDwoJAeGrpnxqyOM9+6rQfpLM35mDjrBeZDrJu57
 VjYV1Q2c/WI/KOXbPYlPllU/Vujy+7c2zUz64ZqwLChWx5z3B5nzE73DxVZ/lt2BgMkTB5dv9os
 nwIrhezR8UdSV91flky6LYZSuR8S8hIpPW6gWfjx6+Na+rQiEINM3EIAxZegjqT5RWlPkY7k8J2
 gMt/ZiOYuAJ2KOhErLBPWcsNN2PD8GAMy/YfnrbnVWONgxEoM2XPL/LNruWIezotWenzbDxsykN
 oBCMRLx8xCJLG1+JGDx4+EPqZ4iYk2LzhmI1OXYYL42lIKyAZ/DM1kAgLXTPxciOBNA0YB0c
X-Authority-Analysis: v=2.4 cv=Fq0F/3rq c=1 sm=1 tr=0 ts=686148b6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=jqtXezU9Yb2X64KsF0MA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: DrTTp48VK0YHvnClC7bu0cATW3T-9ACB
X-Proofpoint-ORIG-GUID: DrTTp48VK0YHvnClC7bu0cATW3T-9ACB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119

From: Rob Clark <robdclark@chromium.org>

This is a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 6 +++---
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5c71a4be0dfa..186d160b74de 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -57,7 +57,7 @@ static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
 			if (vma->vm != vm)
 				continue;
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			msm_gem_vma_close(vma);
 			break;
 		}
@@ -433,7 +433,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -607,7 +607,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_purge(vma);
+	msm_gem_vma_unmap(vma);
 	msm_gem_vma_close(vma);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 0e7b17b2093b..b5bf21f62f9d 100644
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
2.50.0

