Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B71B2E9EC0
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877921; cv=none; b=Ns74pLjHNkEGVJu9pPyEI0di7VbYEkq0QGmwyVEY5WEL37NjTIcR1IJo60g3yoWlTyDXts8na1dzVDi2HdUefAu8H44c0V3zbIvnycepHpUbQOESEHQt03AeWFKLhOZ4yDi5MHJbtua0M11hciPOcq8e++yP/dWD2Oe2hNXisz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877921; c=relaxed/simple;
	bh=CbdUzDS0r5evR14HE2y2m9T+o2DmOJlOXmMaAhyMoOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RoPLDZyVukOOUIWm+ktuGI2nhwCfMAFIM/cJGKlwOsM6Fe2vbGwU+QBWwnFH5IMjExFmKu+iq7BbKdxsXE/G5CFHlGNRr3DLfs6FmNGX+L60qTP2XntYp1ML5oYIwQdPEUGhsx2ca1Wanh1+ALQcq2IwTTVR5J2OvIgQs5lZv80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YxcAs3V3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxcAs3V3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBtgLK026798
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vb+Q3ccg7Qa
	sQsi7gj8/5KoBXUBkdYd/cEtWLqH67ms=; b=YxcAs3V37MUahOJdP9dLUX55cMg
	cqYGsTQjIXFnqtQlXpSrZ6ie0xBmdMx775N8mW4MSO/1RYljObLQ7j4eZ5S3tthJ
	AXfbezOb3OhLaPNzAFbWXlsnL1EV7l96LmfxJnSGyeRHmr3W2Vyuo3OTFPGfC3A3
	KDpMfS9zJhlAxVg5lPvJfLRua0GxYpoeoeZa2dkI+nF6pYs5N7Q2+Oha3qJ3gSDO
	LGVA5u4VfvWxwCpmJwiCcYRDFasUxbRc/p7bv08Sv73+PTHT0N+dynyhLVbgCV7w
	ofNYL1Pf5Ezxc/b+oZWgbdVV4tNi8fn0+4CxsQ7mIqYiGdBnKn+G/7GuyEQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqqdeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:58:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74890390d17so167613b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877917; x=1751482717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vb+Q3ccg7QasQsi7gj8/5KoBXUBkdYd/cEtWLqH67ms=;
        b=QGDhu60l+i3lTyo+K2lauHzsGnyaBmSj4EPEc9WR4ugxDYpMY7Lcod05t07d8m+L8z
         L4U6oru7VhIr09RAJ2IpW2k4A7OC+j5EbPaXNiSxELxeBGo9t0SkUv6bH2mpLQTfaEXF
         51gZdL+syIZ9IXw0D0SQgdK6KISusnx9bfGb7Hcg7PZJsS8dHsBedWNDb4Q1/+NmqezA
         7fL17NYMMDtOJ43pCxqJUrXFrn/FNMyYB9nsNTIShAeTsi9OJ52AIv+WF/+/hD9Ctx6l
         pnFQKB89rynj6jRQY1RiAm4MpLaVWsmzCr2Fqo8z9/+qPZzkChF0nKz3JaFhJRnLppJ8
         BCVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE3eyG45FBWGKFWbr+wQZEDlpRdtiuPToMwMBM4aXEvUMhGBB/G1i8DUSA3COJcLmuLsqyqBffkv9eI2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaLnW8jEW6t2vABEDCo2noAEPGL2GStqIlsMFoJPbv0nHlqKcB
	M0ZIp+GQkdclXtyKWJNvHwh2gCL71I1oNPVJ5dMDw1N6mhGtIjUwDpyK5W/aZiO2wwG1NPAE4W3
	BssFpI7Xr1ZU1yhjiOo/n3Yl5usDQJdodwIwbO0y0RJkCieZSKLPyN/ObM6VNr1pxakw=
X-Gm-Gg: ASbGncsJGmfKCqPFb1vIPZymUOVDJavyf7VGn6FV6vOiKSJtMTZlaDaW4EMURZTUGa6
	12VQ4MHywvmQGtA79Dhfhiltyq8ssZrFOAJrJfvLQzlpthCAKPoxshrhw1NIg4TZmU099qsJ5Lv
	uwKqhgfuzABSpafYz7+yPqClV9gEI8yqMdAewi5xdDNu5Lm7vR8JhY1Yjn0QS8/UsaPyz5Alcsc
	lsqyZevJO4UeAL0EAlvxOluZzvWKMvVzBxE2C1FiwRFlZEN57GsFVzXorn7nEt79clqg7dW8RAe
	k+g/gQxU7PpJLGHirXlyXls1Z/3DRhBg
X-Received: by 2002:a05:6a00:2da4:b0:748:fb2c:6b95 with SMTP id d2e1a72fcca58-74ad4599964mr6768249b3a.18.1750877916851;
        Wed, 25 Jun 2025 11:58:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2R3fCh2w1CdRYNs6SzElJV5q80FOXlY69V8dHuPmzMI0PHAMaTPozp1q9qVR8kIBjZ/CByg==
X-Received: by 2002:a05:6a00:2da4:b0:748:fb2c:6b95 with SMTP id d2e1a72fcca58-74ad4599964mr6768216b3a.18.1750877916423;
        Wed, 25 Jun 2025 11:58:36 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f11ac8eesm13442633a12.34.2025.06.25.11.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:36 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 12/42] drm/msm: Refcount framebuffer pins
Date: Wed, 25 Jun 2025 11:47:05 -0700
Message-ID: <20250625184918.124608-13-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: PDtUR-ZS8njiAFT0mUONbI3fXLFSEJ2X
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685c46de cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=MhmIxDhvR8qEtQvFyXAA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: PDtUR-ZS8njiAFT0mUONbI3fXLFSEJ2X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX0+QtGF5FnQZj
 4qNyG/u7qP2Zwz3YSP/tCYa/vspevb+GMF2gaohNQqm48bygtKXx7uCs77Psg+YDkHegAkeBUnE
 eq6HkUHJN7S09BLLvlK03AIVSlzza5HHFDNPc4U0uKR+2DIrEoQYCUCBFxo+VcnVxt2n107XN8e
 9E0AXPXVFwbTaF5+F1c9z42n1vCvJbz4Me5ee3UryGQhYEOF/V02Gn0ohK58Fqb6vJ8IZrOF4Fp
 6U+LT4FlIqKC3QK8Cxr1e6K0ZA8ir7psYSL7jXdLcIX+vI/00nfPrpvIV+SY2lx8XQbc3qF4Mft
 YLL2RcEt+fW7p2YSBMDEWZDfZ7RRfwHKS5VRjgnB7v23CTbqeHdDrSugz1seGZVEiMA/PpM2vod
 p/UPkavYEt2s8U5L71fND+tGRe21z2NSfyU8J1CgKhRtMCKFGJ4KU/DaLtwOSSb+RQzZXdTr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

We were already keeping a refcount of # of prepares (pins), to clear the
iova array.  Use that to avoid unpinning the iova until the last cleanup
(unpin).  This way, when msm_gem_unpin_iova() actually tears down the
mapping, we won't have problems if the fb is being scanned out on
another display (for example).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
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
2.49.0

