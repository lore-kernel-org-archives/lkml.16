Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AEE226556
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206056; cv=none; b=BXcZZeACHB1iTMRAG9Tyte4XRK6DgaIqtLppc779HPs6tReISTNK5ryVIT7Ud5VkBAYiobZq50km4/RDF3oFu7LemSwQOa/G01HXJNXGsJ0O8gvLteqRPvro/tq28abUVWYOT/UuhUE2Wvkwe0mFyUSwQ058UgumBJh9cWW+WO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206056; c=relaxed/simple;
	bh=LF3WmOXEduF0Yox49Tqnc+p3MIWedMqeUKG9yrG7bm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=id7npSiF4jBMBHcMEQNaLw5p9INucvS9AVes00BuXyRfcddOBX2BjgXAy8cq+Rpd9P1pL5AxgnHr71xoUKsg7EuftmW18BfZPveQmCwQKcQG2UoOZu/hWgKIOHQbuX2J1R6tY+fH1iOS7ISXYIG5LkSB5vUDb5y1jVvbVD9mHxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJLTgvGv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJLTgvGv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TBfOX2026498
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gBDfAmEkonF
	ZxrTQANE1o507a0jHlpQ+o9S1Q9lveGU=; b=EJLTgvGv7cM4pboAKIJUs/p0bC4
	u2ueRvFtICLimKNsS1h/VIeJUofb1d6od40yXmuGaEkw9HhzltPfGUbz6+qrncCv
	MiszvmyK/rZ5XIGyEU0XXxqNRXbUvyd+s9SjSV8MC7QQUipnzfLrBHm0rNZ6tfOO
	xT5z9oH2sFLbvpauyBPLWnvOSigzOT9YwA385m1jRebwmExy7S0NT/giJ0ZdF5JE
	DWctCccqYpzUNB2LK5fXsClVcbFNzuWlSiKqEQDqSpINBxTDB1k5pkFR4UiFytIL
	PXP9rCvvabH8QKuyaqoyei5woBqhITCbonti3xvNHvbJF2fny29dW2RwqvQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9jpt4gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:07:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2fdba7f818so1868584a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206054; x=1751810854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBDfAmEkonFZxrTQANE1o507a0jHlpQ+o9S1Q9lveGU=;
        b=ujW0+6KxCdINiQrMqNTrSkBnwu+EVlXWxkqJen0gNJdFMkWs3CceSr7ZyuX5PbdCqC
         Oq48jiarH1kjVsdkiVNut0jUveEU4TTCPFhO7/9sqZ6Ig6EElsSW/QrsyFno1anFfQJu
         JCPBFnYaFBf9YpRurB7zBK4moZfv1WPcqDVFkvf0xr8uhjdXqWLI5XU98NEcQSN6fSgE
         MOhjcTa7mxWw3VSTf685GVgCQIyMOYdETFlO1hM9KLn2ZSrprrp39E8oyYaWhiBUXhmu
         fR3q8pySY8Wcuajw/ms5W527k9EbqdAZIK+T+qIUssYbRVXAIIFV1FxA4oQ1uAakUyO1
         OpfA==
X-Forwarded-Encrypted: i=1; AJvYcCWhOMjWxWTaP0OxZjJY0Grwwl/iLvrNQ7WNzo2d44Wmee6ct4P3nucMJRB7Klpfxb4AmQCDxCB6q4w63uI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkKPMwh9wT7sLCxdWXagisMLOnzYqMDoDdHCvwgnuzUyOUjzEz
	z4o7yIIvXsN0uKLWmxGStpCd+nKq0/VQ6pMp772+RBrgjeC/wELO6zz39ppXYg12PUfsYHtuLal
	XlNkxIaB6o3o75tUkJSDFTSqfR6IrAUWu5tReATKJ9Tj2G8ncAVQTyWlNqLpISknUqCY=
X-Gm-Gg: ASbGnctZLw7pHtB0OBj0VgpNk4kT9+LekOx2cBz0AWqqJWtIdGSkIOVoB6uXBhLN9Q1
	+qjYCMZtEeUYLZXKpAJbuYhiFSNuI+XgsVDsAgALD6asoU3SVX/tDuL5jLj7B/QmTVizNMaCBBy
	QFuRAjcoA6S/NEaoHEKpGvkeiL8dBjqtd9wOwOuCjCw0ft3+06sqLRqrWdPTncVRz7NUEXtt+3x
	reZ78CdOBPmVIXHz1vV6gozrZiJxUWVvh7iPvPU+PPYMbCv6JRdV6AblomgprOMkPOr6ckkp9Mx
	8QzIhYy/onL72v2R3I7XfXmuIJjWIhzs
X-Received: by 2002:a05:6a20:a11c:b0:218:59b:b2f4 with SMTP id adf61e73a8af0-220a17f7369mr13582071637.42.1751206053804;
        Sun, 29 Jun 2025 07:07:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHU+uDb51M4Be0+7RJfEMhzdKWdXH2VX5GhX5PZfc1zJAcJo7bdy/zfcmW3N5NdF26UuMWOGw==
X-Received: by 2002:a05:6a20:a11c:b0:218:59b:b2f4 with SMTP id adf61e73a8af0-220a17f7369mr13582043637.42.1751206053451;
        Sun, 29 Jun 2025 07:07:33 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af54098b9sm6581953b3a.33.2025.06.29.07.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:33 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 12/42] drm/msm: Refcount framebuffer pins
Date: Sun, 29 Jun 2025 07:03:15 -0700
Message-ID: <20250629140537.30850-13-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX9SW1c6iPET5w
 e+NWFNtIH9sX7OTtZDT/3L0pGMrehp3vLaaFkdT41tnvQ9SUMiXwp0EEPjHWK1CbJoOCwXvQzog
 Eodjc+kMngobjDAoLJV5Ac4SMkxnIu1fSWRBEPFVKUtBV8OmoNHPCpa8FA+T/GxPkkQfTIDSW3H
 BJIf11mCZ00jAgUTg5D3F4t1SmOjPX7v7VzV360+nA+Y+matEr8p5kI7dhne7ZbUqarzZmH5xDH
 2BWevHsPpOKfawkdavGBtYxk2KoTjvYBgUZ0NxS255aFTlpnlMHxgTQD0h4toqGfYs6bwe2EAFA
 fPtosEenGyBqHtwW44wDnQa3pkS+mlmmOvPoeverawgWkexSM+xEXFvN4cMu0zER93OCWLFXS5m
 7bZjiVIQJkOy9j/uTrYropTUwVFJr+5JFn9HOSUmdw/oeYGNaNfHpAuh9lCjj8DF8ing2C5I
X-Proofpoint-ORIG-GUID: 8y904g9WnJ_3yb8_mij30HjP-FxWJqIk
X-Authority-Analysis: v=2.4 cv=Tq7mhCXh c=1 sm=1 tr=0 ts=686148a6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MhmIxDhvR8qEtQvFyXAA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 8y904g9WnJ_3yb8_mij30HjP-FxWJqIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119

We were already keeping a refcount of # of prepares (pins), to clear the
iova array.  Use that to avoid unpinning the iova until the last cleanup
(unpin).  This way, when msm_gem_unpin_iova() actually tears down the
mapping, we won't have problems if the fb is being scanned out on
another display (for example).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 8a3b88130f4d..3b17d83f6673 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -85,7 +85,8 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	if (needs_dirtyfb)
 		refcount_inc(&msm_fb->dirtyfb);
 
-	atomic_inc(&msm_fb->prepare_count);
+	if (atomic_inc_return(&msm_fb->prepare_count) > 1)
+		return 0;
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
@@ -108,11 +109,13 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
 
+	if (atomic_dec_return(&msm_fb->prepare_count))
+		return;
+
+	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+
 	for (i = 0; i < n; i++)
 		msm_gem_unpin_iova(fb->obj[i], vm);
-
-	if (!atomic_dec_return(&msm_fb->prepare_count))
-		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
-- 
2.50.0

